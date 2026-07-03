Return-Path: <linux-arm-msm+bounces-116266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7HF2HsqLR2p0awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:15:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 62914701143
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:15:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hFT0SbzE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Wryz5Zhz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116266-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116266-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C839300F260
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773C33AE1BD;
	Fri,  3 Jul 2026 10:04:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B935378814
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:04:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073058; cv=none; b=ClONDPNranvfp0D4amj3FDPyt/ljqnrmmaMREj4vGQJnTBRGDLKJOoOisZBDsMN9GyeRddEhpaD3OeRtfJHMaLiRKaNql3FcuW3pBl78q1nOe3sKftHcuDbktwdgwoHXKIvN0gyZaESgBP5L7wCNpyd6BWgco2c+sv3m6rHGVYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073058; c=relaxed/simple;
	bh=Ge9oc4vb+i32Zwii1RdJnAu1twKM4C3P0N5lboaUfjU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OOQMIG/732768vkl2pqMEZlyYgEwgpKJ/enrPPILjgUg7q9mBO7rQvQsI4Zfq9ltMv6rdQ3uo4QA8qfqOGFzoMRu5NpTGKE4e2chotQpjp0hJ8+2FlsVsqgVIYV/3oG/U58hFzZ8MpEHZcxGZTjXqzb5+d6EiweHrReM0B2Y1x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFT0SbzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wryz5Zhz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rw523126400
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jH9XKM65dlZOUTQA8la8fi
	9KMsEB9L8o8GY8c7eRgV0=; b=hFT0SbzEv3vH0TT4wB1je6oeNEF6ncBNwNkH1s
	/s0fdXatwjyf+tX/OaARnsK/0yDeFzKsp7nFN1DS+ZJHa1PcXcCUtiaLWxuQkaSa
	TvoME2kgLiGv57N/vH4r3yiMNHX2WVCWIU8uKtMHPXWgkjqWs8wM5vu3JI75Vg2n
	wZGZCOsTTnifAgA4qPVSqW9fEyTXupDhCXG4/SgAE1HihsXpauycxtB3I4diC8H/
	fkM67tMeJ3Gio3S9qhUX1KRY2VHTLtHBUzTfRHuDFqAtgkle4ZtArjGR+TM5kS6I
	ThyaIXKdwbxqgse3nUcKr25HlO5ixYvI5oDaV2kfWA4614fg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnkvy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:04:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5939so38038485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073055; x=1783677855; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jH9XKM65dlZOUTQA8la8fi9KMsEB9L8o8GY8c7eRgV0=;
        b=Wryz5ZhzTnbsuGnOY2Wkk9wiKgDKI8HWdn65v23XtKSpuc55suuzhtEqIChetoOOdD
         Ae8fem+LO3Cmki8b0O/cf5866UuEt0NFPgjQHG4doGoq9NFEyQa3y5RMOlGJScZWZgA3
         +IlQxyf9O1NTpDYUSmtPJ7LWBL35rHSlhx2KQM13HfIWddZpYFWzjFdaavtNL7s9aHZV
         6LvntnCPGecDSvj0Mpbj6j7pmOZd6sRTOGP4StFn68BJfKL9WPvG6aOacOXGvXc3WwP+
         bFu8LA8HZ7VlSuJ05yrJVxnY8R3XRj2WXlohaJrYEMTEYatzxQI81CrZIcOKVNr0z2F1
         NBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073055; x=1783677855;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jH9XKM65dlZOUTQA8la8fi9KMsEB9L8o8GY8c7eRgV0=;
        b=R+W0hgkAmlTV2yxnO2rqlophqTKfo7pgO3bFuP8OYrvR3sac3FUlpquHdb92/ErUA1
         EMhy8SI0pbhBpvl0N4lhMAddQT6vm1kTMy+D1E3ysv4S4V3mzB9Zi9kOY1/dw6wB6gu9
         bbXy4LcVRj/W9JLJBDGvFmNZHpwx8VAT3+t5/+6Ckhz+xTWbyaH8QjcbrIWOP9stpJgz
         9eAWLApvcMSUIlIUDq1Q9AaAkhRCMdF5hsH5vDixdh8E67oK2W7LwAUmw4Q2u13H6mG8
         4q6SFsDKxwoYB8xam5zIXIXkd8N75r69EBgub3RlYoj8TZ113ArAQEoK7C0RG5/Y0l0f
         BgYg==
X-Gm-Message-State: AOJu0YzD5jR/9HThB/0Y+VEWx89vVN6IfETck/H+Iee076Yk8gZd5bZF
	N7clmi0L2YVh9CdkMxQuLAlO1qbWmQ53v6y8Yj7Zw+l4w3ACHdjTPAs2ZtBjN0BGpdAkLPXq8Dv
	jPm7HjMLuNWzf0VaSKSK9W5R7yNuag6CLdqsBcJp51MFdMa2dXHQUXmgdHDnw/IIeCvLX
X-Gm-Gg: AfdE7clIbd5bN9s7BKrHZpjn3CUX8Isky188w4HlXhJK4s1KXruxLmLkMdGZeWEAksL
	bUxWCKZiAosXNQ2Rh19S8txbOS+fKyIJBCTaBMpGsqW0irjWh3M8Ers5+rPi2pITDaeGJ4MX9qQ
	xwbTV88owaDZHD3Iv2wGofQi6SduXfIrYcBjNhBT+tPQhiJrmhkOkNv6IMRXLydUKrXyhUENciA
	ef9E80k/oR17MZv1jJmMpQ6gZYlHK0xj95v2UTrNi9h4d0UHDq4lAhGXNQQSsPwQMvEnrMnuxWq
	FHDOT676xMUmztMSbGWPDMaVujutRc8V6hA0xSP1g2QPRozDn4Yzi0r8PyCjMxQdFYWn5sScFUB
	68LhHlG17udPVmLuQLoUg/8lmv6SMcZniJEg=
X-Received: by 2002:a05:620a:284c:b0:92a:f65e:1e95 with SMTP id af79cd13be357-92e7825b261mr1240735985a.21.1783073055073;
        Fri, 03 Jul 2026 03:04:15 -0700 (PDT)
X-Received: by 2002:a05:620a:284c:b0:92a:f65e:1e95 with SMTP id af79cd13be357-92e7825b261mr1240729285a.21.1783073054365;
        Fri, 03 Jul 2026 03:04:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/7] clk: qcom: Add sane defaults and drop defconfig
Date: Fri, 03 Jul 2026 12:03:58 +0200
Message-Id: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBAF0KuQri1pKxRw5T2MC5hOpQpUKBAN4
 e62uHBD3Ezykz/vL8ThYNCRU7SQAWfjjO18OB4iAnXZ3ZAa5TMRTEiWcEmhedAebEsV6nJqRkd
 zyFWRSl0xUMT/PQfU5rWZl+s3u6m6I4wBCo3auNEO72105qH3z585ZTTNCsxSSEBjerbOxf1UN
 r7Wxv6QMDOLHyRZsQcJDzGQGTCpoOR8B1rX9QPAQexWFAEAAA==
X-Change-ID: 20260416-clk-qcom-defaults-8c8d956fb0cd
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2164;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ge9oc4vb+i32Zwii1RdJnAu1twKM4C3P0N5lboaUfjU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kTqBNgJ81BCLmAPpIsG1hyn6Gfbn5viQE0f
 zKZZayrliKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJEwAKCRDBN2bmhouD
 15MwD/9Yj2Z1tJge6THq+IAa7UeH4D1U8Z/wDjzxdquLZk+pE173+UnEypB02kKeIfTyJStVb9E
 GllXHUxajhT5E39z3xNDID2QrH17c+J5k2loddHZzg4tnxGN8/Yjpyo5/xUuxCRWoBkP0pWz8sW
 l+djxepWEG7kR9UNgon2groHz8E1yV/k7PPdQmT+xDnGdwdrf5ZtkEqGjuYpOekEp/rXsJnG6qo
 Bwu4fft7o+up7XRHLl2TMFlF0T69UEUkksoXNOQvy50/nVA+Ink/6kuWn5LkK8HTKND3SGDJBBI
 7Ctu1o9EvbKJjmFBMosOEUJ8/ZTfzPNiTkeQziZ7vT5nuMTDQAVTQaxWWiyvt0rLT/tG1Zi4Cj/
 wwUMtdAVGoDEYBG5Yrp0JNWLNzH2UdZZ27gAAfEsw8z6aUnIccp/G/AzAdX04ZbeLatBp7m2Uh4
 4NF+TT4bgqCkwMui96zEB1G+Ig9oAShxHetbs58YeitSHm0N2CJFT5I7H0r/y4c73LZL3N0AktK
 iSIxFjO5TOOa2Ouy1Il8oA0D6/rbFwxWpNEZiPIZSyOvYkNpyhOettD67lh7oydJvpeVBbMXUtK
 nKuGqmYZa5kBKdJFVr+J5UqYpx93Nse2dPCGmd6eVDxo+jnOWKhMMLRKbUfeGP1aSh03VJn0A2G
 S0yq66gRRNJJUgQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ZbpJlkmsHklrNMzWwpaLaFdYpss6THHp
X-Proofpoint-ORIG-GUID: ZbpJlkmsHklrNMzWwpaLaFdYpss6THHp
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a47891f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=TT7kfrB5TxoYu55ZGY8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfXwDba6R6p/UCO
 VTY7CEE7X2U1/Dpip3xW50SRC7BMi+F4SCeEp0bhMli3WgWqxtDmtv6ynuOhFcRSin1ksSy18BP
 KKsB4CVMJmiqrAp0JKe2rWEnZWO1bpc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX7eFC5XqLo5pI
 2CIQxsHxmgEv8/wt9t6r/fAoUfNovW+IX9LIr++nBSo0OpWANVAR6KgTjAyAtgVsyqdeuUS7uXU
 2Abonpl/0wsXUHz8HKVRoDtLFlSdhLkKtkQw5eQb7dnHf8ZZGe7cuurcUVDEll7JjMPW+SMmP0p
 XoBlBsGLCxf43qNk8gINnIeZ/WnmrOIpCLjlCfP5VBglXH9bLUJ/HiIGl9vkDFASibmR6DgvHu3
 ykGdMNxVoV8Uqmgapsn90BKqIOttjnMLjf1+LlOsvtERqw/FIjMNZ2e96RPTy4FS5yKL34n2lJG
 c3SZpj92Igdcyg2GPTwvHjm1ibpzwx9xJkbPdMoj61EGmlGDneurryhXwoFmBDy2bOXqHK0nYdo
 lHVpxrp2duRCKxkvC+FLo6XnxTcBvvd4cOzeRA80lVj5T70v4usPpyZa/Eoz0xBUX1Vg9a6WzVL
 YC8Ae8kSFGylrFSr7+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-116266-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62914701143

Merging, Bjorn:
===============
All clock changes via Qualcomm clock tree. The defconfig can wait a
cycle or could be applied via the same branch on Qualcomm tree. In case
of the latter, keep it on separate branch in case this needs to be
shared with soc@ tree.

Changes in v3:
- Add tags
- Make SDM_GCC_660 builtin
- Link to v2: https://patch.msgid.link/20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com

Changes in v2:
- Significant rework:
- Add more commits, also for arm32 drivers
- Split defconfig changes to separate commits, so clock can still go
  this cycle and defconfig later. Also, less conflicts.
- Link to v1: https://patch.msgid.link/20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com
- Dropped most review tags, due to changes.

We should not be really asking whether to enable clock controller
drivers. This is obvious choice.

And if it does not seem obvious, then consider [1].

[1] https://lore.kernel.org/all/CAHk-%3Dwhigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk%2BXDssHU0A@mail.gmail.com/

If the approach is fine, I will do similarly with inteconnect and
pinctrl (and maybe others).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574, QCM2290 and others to ARM64
      clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
      clk: qcom: Make important ARM64 drivers default
      clk: qcom: Make important ARM32 drivers default
      clk: qcom: Add defaults for desired arm64 drivers
      ARM/arm64: defconfig: Drop redundant Qualcomm clock entries
      arm64: defconfig: Switch Qualcomm SDM845, SM8150 and SM8250 drivers to modules

 arch/arm/configs/multi_v7_defconfig |   9 --
 arch/arm/configs/qcom_defconfig     |  14 ---
 arch/arm64/configs/defconfig        | 119 -----------------------
 drivers/clk/qcom/Kconfig            | 186 ++++++++++++++++++++++++++++++++++++
 4 files changed, 186 insertions(+), 142 deletions(-)
---
base-commit: efa85f42554564c3ed7e6ef611ba21025e58c28c
change-id: 20260416-clk-qcom-defaults-8c8d956fb0cd

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


