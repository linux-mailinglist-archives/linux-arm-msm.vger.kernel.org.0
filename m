Return-Path: <linux-arm-msm+bounces-107648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG3AMxjfBWr4cwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:41:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B6C543516
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A03330F5B0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926783F7ABD;
	Thu, 14 May 2026 14:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvQ/AATV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyIAiZm/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801023E5A3E
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768822; cv=none; b=qXeneuavkRwnpEsPkcQ4lmkHP11j+/i8pzrur1/MeVBv1wX/gbQFF5AkmgPjhAsM6mtQnhn2XM4gbzd8YSauRh7Mg12i6MksvWjSmTzd1Kn6TWELO/J9HrLk1GFzkw+KfSDo3vvvbOh4+q51CN0KJOLus9OiUcE1xlwbKmgHGTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768822; c=relaxed/simple;
	bh=hesBBado92OZioZZhwpfQukl/7HmVcpPYrSDg8JC/7A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V0kkvGh6oSuok0xUM0Ja5SbylSuqsOMYEp54ThtETE9KI9O42Fn46FMHWZzNZ85DuhoAaLGN4imx7nL8HjZwHzScqF6A2Imxn+pZ4vU51F75Ch2Cgc1SERvs+w8H3wohwP+CeBG4tLawx/dOxeabLNuG81aLZwak9f1RJV2NAGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvQ/AATV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fyIAiZm/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeg0x3062163
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6c3WSZN61PAxk7+9D5Q56E
	gMY3YSpfnEqufH8t3i62U=; b=HvQ/AATVSwjK/MAxH9SvjQQycDnEcuUMNkQ2vR
	46Yp6RC3FRjM3otHJ7tgyU4wzKQWJtSWh38/449kCcrGfE20vFKnHLIybqKXMeKl
	e00cEjdA9xEkwQ4+HoK4MKGwrha2jkI3/T3dFK/mjxFCg/kMJDXzf+oSHOu0ds+c
	47dZZ6VyOEsq0/kSpBzQQUci0F9qzuLAqW8jqeT1S8H23kV+HDHEYy6SqdRGte0p
	elkFwvLtaz8sYGUcSNPXDzV0n0BSwGPtYWJ/8YX1F/wVcRtjLxMsiSTkMPm+JCCR
	LuRG7oHoerP29yEQkLPauCkboMqI+h3AlbHqTMAwdrKgkCxg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e554aacuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:26:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2babc42244aso148737785ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768819; x=1779373619; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6c3WSZN61PAxk7+9D5Q56EgMY3YSpfnEqufH8t3i62U=;
        b=fyIAiZm/pCkltvlkHb250sBU4F7yphS7FjJFCNDVoz9jzILkE3X4/fokAbEO7NfTPJ
         WlZ0iht9zHoylJTrD+Oy+yvMn4w5u7UQnW83+j8adEWYLk+bDaluXC0Jszs5Zf0Sv3o/
         afILn7GbZ0liLApWArTt4TSK7icC3Znpflw8jCri4FroK3mWzXInqksimlb8SJBO2vxg
         RCEaSplb2Ccva8zEn4V0Y4htgPVHPjdXivoUENjZsNuuN7X191erysSGT9FwIZsGHCwH
         ERCK1A0qw+S2MaxgMIiTEqSTBJffxf8rSWThNxcqKoe91h/189l8/dCzbE1972MjA6vG
         eJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768819; x=1779373619;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6c3WSZN61PAxk7+9D5Q56EgMY3YSpfnEqufH8t3i62U=;
        b=Dzu/UyzGzA+aSz3wWuupveYELTpKjwqdoZwB+mNC6AvutK7zbOmjx6Gi/pMyqwgCTL
         KcbVPFw2kgz055t7WwIFv3wT+Xo4vrAB27VVRhVWLGMUE7CJqmdc4nCcnA8a026dS9Sk
         JXvHC1DgOh5RwhZuk9VDQlM4IHYLttMWSK11srqtxbnoZDoyM5/kC6Tgq3tvkQYvxK+A
         ohPG3TTQCENheIorcIZaausGKxJ5hBa33GT7Zic2lzRIjjpFGaReAVUwC1wz+3ZAEA6h
         exxXhvlcCtBCBpPIeFy1EbxIqoXQwThg84l51RmyBChdCqHs63cL5Jk5+reycn0Q1WjL
         Jlmg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ag//9HX7hcz0gHNNbgTL/WLhmHsC/KsE9PGPWzUW95ZyLA67P79FXvoS4TaPMf3c03UopI8Iq/cDXJz1Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzEPqt4S19p/w1bKsHQuIIQ9xbxh+QCN4iagXnZbvzZxKDCodMP
	Bafldm51h6zo89gE0UVn2dH7IWGlhYayoNSxAR5KBisXRU3Cz5zlPyr6hX/pCGZWI588yV0QFf+
	cxP9hkeZNg76f6zkyf0LBfYBLs8BHNO54wl0rU+yleQdBhIds0UlxtONZ0UEP7oFaCsvR
X-Gm-Gg: Acq92OHYi7elJKJ/4fckZE/e6HyfMmXPLxUDKpR/jteEA6a5wT3Hk2NsJhCscqqPyo8
	5s3cO82ITjSOc5H4gijiBOyr+CCXJSfgtHYO01sg47Uiu43hDlwGPBjHmCW9sVIC4lzYuuKEKCE
	TxsTwLzlhHT9tmujJo/84zYUrc/lspSF61cz4IqZy2JpD1exqlLoxRxDccn03JSv72Is7vdZ0Ry
	/7ZC9TDiP7w2oT1HWlB/u/poRjXVmGsSZyIqeoqqwXUd695DLKZ3/p3/aOwM4vC9mC045+hsf6n
	zJZqajPVKDzbnFzoERmCTAohrS2ni7WNI58BtrXl9XHQP1sIJroTDFTTw3X89dy5S/pXgwNgC7+
	jxtcMeTtNQIELDpRPjbZu9D1GdycKV67ONNd5GmqN7LrROzXip6BbXS7oq2mX8M7HsjMt
X-Received: by 2002:a17:902:d4cd:b0:2b2:4f43:b48c with SMTP id d9443c01a7336-2bd27184b27mr92047365ad.14.1778768818677;
        Thu, 14 May 2026 07:26:58 -0700 (PDT)
X-Received: by 2002:a17:902:d4cd:b0:2b2:4f43:b48c with SMTP id d9443c01a7336-2bd27184b27mr92046565ad.14.1778768817993;
        Thu, 14 May 2026 07:26:57 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:26:56 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v22 00/13] Implement PSCI reboot mode driver for PSCI
 resets
Date: Thu, 14 May 2026 19:55:41 +0530
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGbbBWoC/53U3UosMQwA4FeRubbSJu009cr3OBykP6kOuDs63
 bMckX13O4s4C1qo3hRa6Jc0JH0bCi8Tl+H26m1Y+DiVad7XDcD11RAf/f6BxZTqwQASjLTSCb/
 sxHOJkyiv5cC7+4ULH0AceZ/mRSwc5vlQhB4jSam1zzEP1XpeOE//z4H+/K37x6kc5uX1HPeo5
 Hr8EULJzhD1mpCCrdVoCTHpeDeXcvPyzz/Febe7qcsa+VdqgISBCAKT+aquDzgqdZm07eZV5VN
 GhgCKMGKLhwseVDcPlScbfESOGoBbPF7y/dlj5cdACRCVIUctXm88KdPN68qjTeCycT463+LNx
 juAbt5U3kZGL4ksZdXix09eyR9kP66d48hz8h6Qm7W3G6+6J6peq7weWZIJ0esYWzxtPAB287T
 WHrJ3bEfO7cZ0lzx1824d1hCcGaVB2ewc+PwLRolS9/KwTm3MNqGu7YkWWrzaeN3f93Ce2pgdW
 msN2++Kczqd3gEnuQTFTwUAAA==
X-Change-ID: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=14566;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=hesBBado92OZioZZhwpfQukl/7HmVcpPYrSDg8JC/7A=;
 b=D9oKhErMXz9fEVtNTbu3vUE7Vdsqub7+a6CEnk7ubOdS+iYuh9tnv4Y2gmxaTAtYuRMjT3vZQ
 9NIz0UjtDUMD09zz1haYWq7c4+C/Iy7N5ppKA2PHiI9+We+Q/ZSxRGG
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: M0clyYMKtxtuISkIFP1mvSyY4et7NnvJ
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a05dbb3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=7CQSdrXTAAAA:8 a=s8YR1HE3AAAA:8 a=pGLkceISAAAA:8 a=etiEgX_XAAAA:8
 a=Q-fNiiVtAAAA:8 a=ag1SF4gXAAAA:8 a=JfrnYn6hAAAA:8 a=tFQcDjwZHl5BevwCR6QA:9
 a=h5OQhcXpjBQC-am-:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=jGH_LyMDp9YhSvY-UuyI:22 a=MLbIUA-Bjd6y1alW9qBG:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: M0clyYMKtxtuISkIFP1mvSyY4et7NnvJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX42OJOQewBr6W
 qhgKBJzKPx2FG60tQ/N+X4AazdfBe/rn6D9oUMfz4H2+tmvOBwTi1IkNpynlQhSg9ScHTygUPl9
 IRLoVRyE5S8/heYsGSiR0HXI3UYTyey28gY827JHj0M8TJblV7JUs03z/KZWNlZaLkOfxdjHaxB
 XC5lcTvsZK3W/KFSXRJgXMLjaCOCRIR+MXoMZRVN1A4Udmw/Rxt3Czz9rQ+mcGUwEPmY5ey30r2
 ExcY/o+3shtWWKOZlBE0lP6M8V7251CIP8AYmOF+/6E5YQUUfeOAAnDtzR4TME0uRT2RW703ZpE
 HEjjpk3GKjzsqTfY9TxC1D47vwx5GadNl19zdSQP8mvVJU3RBR3U5J3Ee2cGO3aAseEJIE+qNKf
 uFkF/7KU9mRjxtYtdHgAhHZbtqvPm7R5VBQI7OoxuRqHXT16S6n4EW3GInpI8vAjm1LjAwZ5BHG
 OywEWaSbDQkREgiFVdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140146
X-Rspamd-Queue-Id: 78B6C543516
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107648-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Userspace should be able to initiate device reboots using the various
PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
patch series introduces psci-reboot-mode driver that will induce
command-based resets to psci driver for executing the device reset.

The PSCI system reset calls takes two arguments: reset_type and cookie.
It defines predefined reset types, such as warm and cold reset, and
vendor-specific reset types which are SoC vendor specific. To support
these requirements, the reboot-mode framework is enhanced in two key
ways:
1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
arguments (reset_type and cookie) by encoding them into a single 64-bit
magic value.
2. Predefined modes: Add support for predefined reboot modes in the
framework.

With these enhancements, the patch series enables:
 - Arch Warm reset and system reset cold as predefined reboot modes.
 - Vendor-specific resets, configurable via the SoC-specific device tree.

Together, these changes allow userspace to trigger all above PSCI resets
from userspace.

Note on introducing PSCI-MFD:
In v19/20, psci-reboot-mode was implemented as a faux-device. Review
discussion suggested this may not be the best model for firmware-backed
consumers, and that representing PSCI users as regular platform devices
would be better. One suggestion was to add a PSCI-MFD driver, allowing
multiple consumers tied to a single PSCI node "arm,psci-1.0" be probed
as MFD cells.

Following this, the series adds a PSCI-MFD driver and introduces
cpuidle-psci-domain and psci-reboot-mode as child cells. To meet the
psci-reboot-mode requirement, the MFD core is extended to support
fwnode.
Reference discussions on this:
https://lore.kernel.org/all/20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com/

---
The patch is tested on rb3Gen2, lemans-ride, lemans-evk, monaco-ride,
qcs615-ride.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Changes in v22:
By Bart:
  power: reset: reboot-mode: Add support for predefined reboot modes
  - Add reboot-mode helper to add predefined modes.
  - Add centralized init for reboot-mode.
  - Dropping Reviewed-by from Bartosz as changes may need a review.
  power: reset: Add psci-reboot-mode driver
  - Use reboot-mode helpers to initialize reboot-mode driver and add
    predefined modes.
  mfd: core: Add firmware-node support to MFD cells
  - Use callback function to get fwnode from a MFD child cell.
  mfd: psci-mfd: Add psci-reboot-mode child cell
  - Use callback function to return fwnode for reboot-mode.
By Pankaj:
  mfd: psci-mfd: Add PSCI MFD driver for cpuidle-psci-domain cell
  - Make MFD_PSCI defaults to y as ARM_PSCI_CPUIDLE_DOMAIN defaults to
    y and depends on it.
- Link to v21: https://lore.kernel.org/r/20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com

Changes in v21:
By Krzysztof
 power: reset: reboot-mode: Remove devres based allocations
  - remove fixes tag.
By Lorenzo
  firmware: psci: Introduce command-based resets
  - psci_set_reset_cmd() only takes reset_type/cookie as input params.
    - updated this as a encoded u64 reset_command - from Pavan Kondeti.
  - Update commit text for reason for explicit panic_handling.
  - Clean split of reset flow in psci_sys_reset via handle_reboot_mode and handle_cmd_reset.
  - Add psci_has_system_reset2_support() helper and PSCI reset-type defines.
By Lorenzo/Bart
 power: reset: Add psci-reboot-mode driver
  By Bart
   - Drop faux-device based probe.
   - Convert driver to platform-driver model (probed via PSCI MFD).
  By Lorenzo:
   - Use PSCI-specific predefined reset mode naming/magic.
   - Register arch-warm predefined mode only when SYSTEM_RESET2 is supported.
   - psci_reboot_mode_write to directly pass reset_type and cokie.
   - Add MAINTAINERS entry for drivers/power/reset/psci-reboot-mode.c.
By Bart
 mfd: psci-mfd: Introduce psci mfd driver for cpuidle-psci-domain cell
  - Introduce psci-mfd driver.
 mfd: Add psci-reboot-mode cell via fwnode
 - Register psci-reboot-mode from psci-mfd with reboot-mode child node
   fwnode.
 - Update reset Kconfig dependency to tie PSCI reboot-mode to MFD PSCI path.
For alignment:
 - mfd: core: Add firmware-node support to MFD cells
   - Add firmware-node support to MFD cells.
By Pavan
 power: reset: reboot-mode: Add support for predefined reboot modes
  - Move redundant logic of adding modes to list to a common function.
By Arnd
 - Remove refrences for Linux reboot-modes from code and commit text.
By Konrad
 - Updated all dt changes to add reboot-mode for supported board files.
- Link to v20: https://lore.kernel.org/r/20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com

Changes in v20:
By Bart:
 power: reset: Add psci-reboot-mode driver
 - Check for psci compatible in init arm,psci-1.0
 - Node pointer should not be assigned in device probe.
   To Align on above:
   - Remove probe call for faux device.
   - Set node using device_set_node after faux_device_create.
   - Register the reboot mode using explicit call to psci_reboot_mode_register_device.
 - Updated in-code documentation.
For Alignment to use of device_property_xx:
 power: reset: reboot-mode: Add support for 64 bit magic
  - Use device_property_count_u32 instead of device_property_read_u32.
  - Check count of properties before reading.
  - u64 magic changed to u32 magic[2].
  - nvmem-reboot rebased on recent changes.
  - Update documentation and commit text.
power: reset: reboot-mode: Remove devres based allocations
 By Dmitry/Bart:
  - pr_err to pr_debug in case of invalid reboot-mode prop.
 By Bart:
  - Use device_property_read_u32 instead of of_property_read_u32.
  - Avoid repeated code for free list. Now calling unregister from
    error path of regiister_reboot_mode.
 - Fix magic assignment.
- Link to v19: https://lore.kernel.org/r/20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com

Changes in v19:
- Add missing To/Cc entries (include devicetree list) – Thanks to
  Krzysztof for pointing this out.
- Fix compilation error in reboot-mode.c for ARCH=powerpc by explicitly
  including <linux/slab.h>.
- Link to v18: https://lore.kernel.org/r/20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com

Changes in v18:
 power: reset: reboot-mode: Remove devres based allocations
 - Update commit text for alignment. – Bart
 - Read magic before assigning kzalloc(info) in reboot_mode_register. - Mukesh
 - Update error handling path. - Mukesh
By Bjorn
 - Expose sysfs for reboot-mode bisected to different series-
   Link: https://lore.kernel.org/all/20251222-next-15nov_expose_sysfs-v21-0-244614135fd8@oss.qualcomm.com/
By Bjorn/Lorenzo/Mukesh
  power: reset: reboot-mode: Add support for 64 bit magic
  - Use FIELD_GET/FIELD_PREP for u64 magic wherever required.
  - Update commit text and add documentation for structure of 64 bit magic.
By Lorenzo
 - Remove direct reboot-mode registration by psci driver.
 - Add support for predefined reboot modes in reboot-mode framework.
 - Add psci-reboot-mode driver and implement a psci-resets to accommodate
   all psci-resets including warm, cold and customizable vendor-resets.
By Bjorn
 - Update DT patches for qcm6490, lemans, monaco and tolos.
  - Update commit text to include more details – By Bjorn
For Alignment
 - dt-bindings: arm: Document reboot mode magic
   - Update reboot mode documentation to clarify that argument1 should provide
     full value of reset_type along with the 31st bit wherever required.
 - DT patches for qcm6490, lemans, monaco and tolos.
   - Provide full value of reset_type including 31st bit.(eg:0x80000001).
- Link to v17: https://lore.kernel.org/r/20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com

Previous versions:
- Link to v16: https://lore.kernel.org/r/20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com
- Link to v15: https://lore.kernel.org/r/20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com
- Link to v14: https://lore.kernel.org/r/20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com
- Link to v13: https://lore.kernel.org/r/20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com
- Link to v12: https://lore.kernel.org/r/20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com
- Link to v11: https://lore.kernel.org/r/20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com
- Link to v10: https://lore.kernel.org/all/569f154d-c714-1714-b898-83a42a38771c@oss.qualcomm.com/
- Link to v9: https://lore.kernel.org/all/20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com/
- Link to v8: https://lore.kernel.org/r/20241107-arm-psci-system_reset2-vendor-reboots-v8-0-e8715fa65cb5@quicinc.com
- Link to v7: https://lore.kernel.org/r/20241028-arm-psci-system_reset2-vendor-reboots-v7-0-a4c40b0ebc54@quicinc.com
- Link to v6: https://lore.kernel.org/r/20241018-arm-psci-system_reset2-vendor-reboots-v6-0-50cbe88b0a24@quicinc.com
- Link to v5: https://lore.kernel.org/r/20240617-arm-psci-system_reset2-vendor-reboots-v5-0-086950f650c8@quicinc.com
- Link to v4: https://lore.kernel.org/r/20240611-arm-psci-system_reset2-vendor-reboots-v4-0-98f55aa74ae8@quicinc.com
- Link to v3: https://lore.kernel.org/r/20240515-arm-psci-system_reset2-vendor-reboots-v3-0-16dd4f9c0ab4@quicinc.com
- Link to v2: https://lore.kernel.org/r/20240414-arm-psci-system_reset2-vendor-reboots-v2-0-da9a055a648f@quicinc.com
- Link to v1: https://lore.kernel.org/r/20231117-arm-psci-system_reset2-vendor-reboots-v1-0-03c4612153e2@quicinc.com
- Link to RFC: https://lore.kernel.org/r/20231030-arm-psci-system_reset2-vendor-reboots-v1-0-dcdd63352ad1@quicinc.com

To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
To: Souvik Chakravarty <Souvik.Chakravarty@arm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Andy Yan <andy.yan@rock-chips.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: John Stultz <john.stultz@linaro.org>
To: Moritz Fischer <moritz.fischer@ettus.com>
To: Rafael J. Wysocki <rafael@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Christian Loehle <christian.loehle@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
To: Lee Jones <lee@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Andre Draszik <andre.draszik@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Shivendra Pratap (13):
      power: reset: reboot-mode: Remove devres based allocations
      power: reset: reboot-mode: Add support for 64 bit magic
      power: reset: reboot-mode: Add support for predefined reboot modes
      firmware: psci: Introduce command-based resets
      mfd: psci-mfd: Add PSCI MFD driver for cpuidle-psci-domain cell
      dt-bindings: arm: Document reboot mode magic
      power: reset: Add psci-reboot-mode driver
      mfd: core: Add firmware-node support to MFD cells
      mfd: psci-mfd: Add psci-reboot-mode child cell
      arm64: dts: qcom: Add psci reboot-modes for kodiak boards
      arm64: dts: qcom: Add psci reboot-modes for lemans boards
      arm64: dts: qcom: Add psci reboot-modes for monaco boards
      arm64: dts: qcom: Add psci reboot-modes for talos boards

 Documentation/devicetree/bindings/arm/psci.yaml  |  42 +++++++
 MAINTAINERS                                      |   2 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi             |   2 +-
 arch/arm64/boot/dts/qcom/lemans-evk.dts          |   7 ++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi |   7 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi             |   2 +-
 arch/arm64/boot/dts/qcom/monaco-evk.dts          |   7 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi             |   2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts         |   7 ++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts         |   7 ++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts     |   7 ++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts        |   7 ++
 arch/arm64/boot/dts/qcom/talos.dtsi              |   2 +-
 drivers/cpuidle/Kconfig.arm                      |   1 +
 drivers/cpuidle/cpuidle-psci-domain.c            |   9 +-
 drivers/firmware/psci/psci.c                     |  75 ++++++++++-
 drivers/mfd/Kconfig                              |  12 ++
 drivers/mfd/Makefile                             |   2 +
 drivers/mfd/mfd-core.c                           |  30 +++++
 drivers/mfd/psci-mfd.c                           |  61 +++++++++
 drivers/power/reset/Kconfig                      |  10 ++
 drivers/power/reset/Makefile                     |   1 +
 drivers/power/reset/nvmem-reboot-mode.c          |  12 +-
 drivers/power/reset/psci-reboot-mode.c           |  72 +++++++++++
 drivers/power/reset/qcom-pon.c                   |  10 +-
 drivers/power/reset/reboot-mode.c                | 153 ++++++++++++++++++-----
 drivers/power/reset/syscon-reboot-mode.c         |  10 +-
 include/linux/mfd/core.h                         |  14 +++
 include/linux/psci.h                             |  19 +++
 include/linux/reboot-mode.h                      |  28 ++++-
 30 files changed, 559 insertions(+), 61 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


