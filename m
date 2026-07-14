Return-Path: <linux-arm-msm+bounces-119027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7+LELfMqVmpE0gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:26:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E84B754837
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:26:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Zh7VEcEB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G3JzpZQO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119027-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119027-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DAC33076EDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D247B44683C;
	Tue, 14 Jul 2026 12:24:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153E64483B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:24:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031874; cv=none; b=JxIuD/myd1MZoQW575KKF8LQitKLnu6mZ4GwFKPk/goyaFt/C13t5ikoXahPwMQYlBW0BIKUCkbQTvCtV6x+moTtueBnSqPyWpjk9diPQ3XWScPHaEFJCGy0voffaCYhiND7Km3v+UaqXtn2yTtvcG5BwdUUKYcuAzUTqI2l2tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031874; c=relaxed/simple;
	bh=ZbiVgqOd+DXPuFr0s+95PYrcUflUxC8oG5+m+0ZXq+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mzCDEpm3jqrZ2jm/8+JizLV86wvTOMacTYPOn8LG+/CqJv5yZRclWYYVlixt/LgP7Lb9uTiYYXmCSCu+uYkk2mUZKaBkDG2oV7ONuOt4PpqAikaMYgK8fhe+j7K9hG3fYLOAHbcB1CkYAgbiZH92CAx3j2OOe747KbRvvu1EY7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zh7VEcEB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3JzpZQO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBOHFp448654
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGmk2hafvMdg6kZlcldV7qKAMoaRXeHUEARPg/Zzywo=; b=Zh7VEcEB9kSelHN/
	KO1y1Mxe2GP+Bt5p/our5HjiHVGccZaOqNc/jEXY3sxZE8cPFeY1hJY1pEX6xT1P
	ZfGW85g7wyjSp03lqG4zaypX751QiWaLsk8ACp/QcZSLvjrjK1lWrQexng+5WM8S
	gloJQ9qxo3nz9kAGKFgBj7ktW/PU4G6cSh6ovUwuwdqVc1FXc+3SbNjwMwtqNDdk
	UCFe6hN3JvqmeMIC5sGfzcpEf4Ha34CvJLrmpSemRKJhhEAIlN2yqB5ybVQOOVrV
	Lb/Gq75z6H+C4pGXaH2y/Jr2n4VlsjtQNner41Z35I7jN+dEIGwIq5WiEU4IwPyE
	nMlnfA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jup48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:24:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf321d786so11184601cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784031855; x=1784636655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGmk2hafvMdg6kZlcldV7qKAMoaRXeHUEARPg/Zzywo=;
        b=G3JzpZQOFf9annwldWxOkrR/WMYKes94fjBa4+hElQAkFi9pKK4DIE5jGBnKqCzQOG
         bM/wPNhq5J7/yjmsUmSBZSoZWpQM3GeWgwpHod1dS0ec7VZn8vCEHBtTyBZz2tphIoRU
         Jb7YFZPMYgpWPEgFo4sWZH3U0U47AZE/I7Jm/xKeBWoQWFTxRVqEKmD7qBYxeZQOLBJW
         FEska732qYcCufC/d9kUQ+Hg12teD4/XgZVZ/JE894RkowHKFOIfOhwlwhR57KmFwDnK
         uXhXtpsXhK47+vzBnv4V1sCgeETmDAA/oELnn9HdaNG7IlPyLhaMQzPnijfQcSdyb7ek
         m/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031855; x=1784636655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGmk2hafvMdg6kZlcldV7qKAMoaRXeHUEARPg/Zzywo=;
        b=lrkgCp9mbpEzTFTuagG4z0tC3eHuqoplaZMmong83/BqukrfaQXyFCyUUYfgo0/5tZ
         +SdQsj0n2EwjYk3vJyJwiG/SW2sheEcPncjkSUjso7yJk6kIl0CpyTDZdn/HOZCZemoF
         /LqJwf8GGQ28MFW8wdzb5c7bst682oriTaWLuk0S87P/MsD9ElGMeQ1xAy2RdUOfvQT8
         hlTOvkCMATmyX6Y/qiAlnHuO2WmuCg4pY4gAnGJjLaZ7wC9qXg8+KwMiQLgQenB0nR3X
         6uLX8+lAPtpUq0shGATXu/EMayIEFbTsHTPIFBH61hxjY3PaiN/zt/FAMmvWHOpn7gvX
         Bk/w==
X-Gm-Message-State: AOJu0Yz0CEjXb481dfOmYbUkWn3c1lCbjgtRUluMUfyjim3HIH/9DQOW
	Mw+VUZuhImMRgo32bh26vr8rDyxgy0Fo8EZKJMEH1uY9ZN2zhCaGyzKjBftS4lemOYT+KWIOn4k
	kERxRgPCgIaYk6ffsjDBNvFY3O0C9aTSRP9MGNiQXYPrgkhcu315SkRAoenWiTVE3GPL1
X-Gm-Gg: AfdE7cnEdWJze+ccvHpa3o6SiJGKEaUqAEFbGGBOpC+b9QYvFEFbshRY/OOzccwY+JW
	Dcw/UlEGUczglR2nL2OdDmrFxZ0n68qWllLQZd8GhY4WknN75NdGESXhmRN7Wrn17c5bdteCFsM
	XUsQ+KEG2GVPdGHGfgZ3g2rEj2yUtxqjZA32ze7YHNfuSwGLsWm4+R0d7aVkAMX23k59ubJchwC
	wWRyP2v34iZ1wd1HtAxpwruOffE2SWnrnu/xT2YiajVEUmjHWxN2owicXkP3me1rMBjNqTqankl
	/ydKCnpWzbzknHn4Z5k8cWcjQwPfzscMmAOSlGEMSFIo052JvzhUN0Rnk9mNdx11jnU2fDSQKa0
	fkQWB5WCj6Y+MG6c=
X-Received: by 2002:ac8:59d2:0:b0:517:146d:2db5 with SMTP id d75a77b69052e-51cbf056abcmr124478511cf.2.1784031854823;
        Tue, 14 Jul 2026 05:24:14 -0700 (PDT)
X-Received: by 2002:ac8:59d2:0:b0:517:146d:2db5 with SMTP id d75a77b69052e-51cbf056abcmr124478181cf.2.1784031854211;
        Tue, 14 Jul 2026 05:24:14 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm77031845e9.14.2026.07.14.05.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:24:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:24:01 +0300
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Add Eliza
 CDSP compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-remoteproc-eliza-cdsp-v1-1-32eb7a1f2c59@oss.qualcomm.com>
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
In-Reply-To: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2386;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZbiVgqOd+DXPuFr0s+95PYrcUflUxC8oG5+m+0ZXq+c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVipmFdYPKxz1A1D4NFolDf7IZKtdP5k2OQYEV
 Z8OsiItDeeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalYqZgAKCRAbX0TJAJUV
 Vsf+D/92ynZJnUcD+pno4i0uTqx4G7QwwUJkksE8yQwXxgTik41O+Gp0PpWJDJeWD4WrPo963N9
 HvcV3uVG99u5g5hBkM2cqDH+iBR49+C5w7J8cggwN6aJTaQIbo4j6U5Bva3qvrrW/LhPg6nfz0r
 +HZiUvK8+/HQ2dUyb+fqHwVdKHMb23rqQFhZZ91a/BlrywNsAVReaBaq8AHYxFqfsgFF+eVDsZV
 /pkCUffCiWV4nAqlilaMWN18xs+3QRWPWov4Fe4kDWytTQNLEW1X38xf7jx172Y1XK475ukqbjW
 V+ihkUN+0t/XgJv4PRhS9tuipmEZYT9GTmlAB2s9UKpLDjhkbQkMj1TakuLKVCCvIL7J+cy+Cx5
 4w54xIUbRsap5fMYCNtl7BGgmSRMzwkB6Z59EiSzaPFMR0mzX6eDf0/907py84I391on9JyWaCv
 OJCNSLjM42Fnc1j6c4VN1SUyUoZzxQS/L3runTnLZeq3X01xVmGZoIirThY/+13fzvLEKSQEUwt
 QUlC5rWxTnKt45ENUxO4Fzo/ggEETAMNRlbwySdRssfFU3Yrovc9oK4SO09d9PG8jCuRcXsxFlv
 dn27dCtrVVdhnuLyQE94jW51LlhScO6cFTb2xMZADEEtjhZwS9hEOfAGhtttQXsDmJ/Dbvg+QFx
 Rwtu64OZVJI7ZMg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: jtsrn3Sg3AlpjjQOz2RUpkIY_2So9sCy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfX3v4fkwZmEQi6
 0PvTrJs7ElKt7XiRP7pdye85wA66o1RmPfCz4sxLpEdh+FX6ku7tAwEjNHjRQ1KlMz+4PIkTFC1
 VncAdTL3ruczgh9Fn5tpZxRxBkuJwrmLDtCpTiUXbv1kM1+BlILL0sdnDKV0bxlwttS5EjrjwPn
 +MA1mMeuYjO8iPRblSrcipOE6osNaNrucZ26MOOWPoF2VB2Q7rr5cLion50aosEiSGRLdAM9HjQ
 9jxBb7u4owcwKpXdqeejeoLn6JgDtnp2JCnP5PoWK+sHLo5/MOMq/UnIcB/AVae9kT+5f1PV/JW
 jP//TL1ANNBhAYWsssA9CKus7rpcTMs6g5oiK1M+FBcfybUVZK1XDrsuQ+sIl2rVcAASWIC1225
 VgFoThlz9q4ovHC0ix9wN1dYswb/ugIM2c4bIHLkOkMssdVZlgR7rWWzYNSeJVG7NnJCVUtLqf+
 UJjn4CFp0yDibImV6fw==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a562a6f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rtpznyeJ5wwxryUDUUoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: jtsrn3Sg3AlpjjQOz2RUpkIY_2So9sCy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfXyXJsbT7AmgSp
 bq8NXcPVDTvsTxgnObLn12riL6jhd7xulv1eN9kQ8nBQ4KH/1zbxznSvIFxxtUyFjq12aP5mHzX
 dClYr5vwe2pzqSGKtb1E1LTxxo6xCZ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119027-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E84B754837

Document compatible string for the CDSP Peripheral Authentication
Service on the Eliza SoC. It needs a third memory region (DSM) and
the NSP power domain. Rework the schema to accommodate these.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,milos-pas.yaml        | 41 +++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index 99d7337e58ec..3ee7be3304c6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,eliza-adsp-pas
+      - qcom,eliza-cdsp-pas
       - qcom,milos-adsp-pas
       - qcom,milos-cdsp-pas
       - qcom,milos-mpss-pas
@@ -68,6 +69,7 @@ properties:
     items:
       - description: Memory region for core Firmware authentication
       - description: Memory region for Devicetree Firmware authentication
+      - description: DSM Memory region
 
   qcom,smem-states:
     maxItems: 1
@@ -97,7 +99,26 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
-    else:
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,eliza-cdsp-pas
+    then:
+      properties:
+        memory-region:
+          minItems: 3
+        firmware-name:
+          minItems: 2
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,milos-mpss-pas
+            - qcom,milos-wpss-pas
+    then:
       properties:
         memory-region:
           maxItems: 1
@@ -122,6 +143,24 @@ allOf:
             - const: lcx
             - const: lmx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,eliza-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+            - description: NSP power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+            - const: nsp
+
   - if:
       properties:
         compatible:

-- 
2.54.0


