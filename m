Return-Path: <linux-arm-msm+bounces-113770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fBA+Nu7oM2pwIAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:47:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 512666A027A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:47:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jDSqr3E+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IIW8Ru43;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113770-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113770-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B54A7302FA1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1713F4130;
	Thu, 18 Jun 2026 12:47:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD2C3C7E0E
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:47:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781786857; cv=none; b=T1oSaTtx/T0NKFMypFfNgVX84UaVHb6qxZJEFWf2fM0XGg6XS8rhDc/W4+t+ITniEx3FUSjKJ1/mJ5TZtiPM3TD9+ylZW4JAIK/6DZGP30GIFcQJGIqT6luNNcIWWt67B7LUpBKgVKmHqvOqu8MERsHvktkYAnv2qTZTdcylLMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781786857; c=relaxed/simple;
	bh=b8BaxAO/BUV+MYPhPmLa+NYAxok9/Rf/iAlalnCfvDg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qVJSJAngmEqDpmdUm6j4jb+iMZ59GNFu3/jlwAkmZUncmuiq1JVetddE717v9bSLAiXAb6TFV4bsTY75hYraDN6u1FjpIxH/CfhJWOuLugt1Mk7WmFHQLpyw2j6KqP3FcamScPOrOnyNZet+7veCnOrs5Nd+610CmMb87kZbKFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jDSqr3E+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIW8Ru43; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAtU4O1516066
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VzhJ06xNdpJfk0LLhzvuSVzJs/BlrKuZqQw
	/T+aTMgQ=; b=jDSqr3E+4tvrvryA5MulJenchZk9l9V4rPofJ7utqe/R8cEpQd1
	UJGQ8Swtk1vbBRjG9aIA187AMUJ7zOVD1hqPmBhRmFKIisaSXU4HxUXw5hBj9vj7
	jECywCey19v3hJ807Za7jQhVhOwlAQuwGsEp3aZyANFGSj4GMDcFnwBppVmRKx31
	b/N+11EDnsLtITGRM8dmS8aQajdNR/oqYG9XOPeyYNZRwsZPXQEE6vg/ZkM2TAD6
	CmlRFgcazrHEKnofxAH9PFAV22/VGztm7wexUeLPhZlcllpIAr+CydfqY+IfJE2o
	FbOtAPdio93NJZoBBw1lOiqBfS2GfSW7niA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a3c65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:47:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so1387351a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 05:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781786854; x=1782391654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VzhJ06xNdpJfk0LLhzvuSVzJs/BlrKuZqQw/T+aTMgQ=;
        b=IIW8Ru43qyvkJ27nBDDNuxq06+PKR2gic/RKrU01uHB1xmBbkk2QsPJVDnBRwLVaxV
         ZF3CRiP1ZmB2GYzugqTqxYDgFbRryI+15xfkUy1c/HQaNIZl/hnpnou3lY3HoJkI7e0/
         gH9lOeCwcNlvWwCW/vlcWSKgQmsDjqFIabmsVPkB9u1SXzICG5DXfK9ND44rBPzmx1zH
         rNO3ale0owNYSwOOg8pUwSlec+HhlGZV/Sv8GGF4B7/8RK7YJ6M+JEr4CgpotRyjsqwS
         laq+rLGy+d3UxAOZApDHlUeG9A4OVFcaB9hA5C2C/HpO261eKGrzSDEJ/8HYr77OCBrz
         7yKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781786854; x=1782391654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzhJ06xNdpJfk0LLhzvuSVzJs/BlrKuZqQw/T+aTMgQ=;
        b=oqsCVxjqsKiFWDgRrrJlZWDRAOORq2AnrHP+iFbG2H2iWJE2pPJexDF7QYFa6QACUH
         WZLh31hyvZ+hFYj8VhQGAoz0887K1gBE2+oCxr9bnkts6K7METtdA1hpZewmo/TJxcC3
         FQZvsWMK9osOGIfYHwU4ai2pwGSw9zNnkA0gTEPaCZ/W8oCEVtw3O7n/ywndHeylb4M6
         qJJBGhwZkpki01KeBkQ9u2A8x/ZgcDJqiKb08oNTtGzu8MeFG/ZB3+GLmcEqxSQY5+kU
         wT+epAkeCDhrOaoLuYlj3MqfhGW2d+hAkdNn24ThwSO1rkLHZ3wndKEI5mPvzYWqPYWq
         M28Q==
X-Forwarded-Encrypted: i=1; AFNElJ8qohKLWnAAXHuuJFZoeZcVZbvM6GL716X71KvgLWroIeFXW/eSk3TCZW2vPKVS5p1mFUgcc1mrjhRJRJSl@vger.kernel.org
X-Gm-Message-State: AOJu0YwgQKLaJPim0jBy5Gsj6C1v1H80G3TNf9q3/TqhnCZvMoOk8/Hy
	0mmK8qe472e/fIYqI7rozP2oGmrHsN1Wusj2ZL16F+oA7W2QBAMtXHer3IncnftL45JNTywl1m0
	C88H9F0kHOoHKDc7+YXn5KIptiItDMqU62JM6lZ1e7DR0FNwqmeJOLWHwCCJqR8zj0GWu
X-Gm-Gg: AfdE7cnW26piG1ISzmvckw8lukpkHSzcggRQjDr8Y/FunIxGRJT87Dtez2Bnem26uf+
	87jDI8p3js9+3l+TpJmtCIRhmV58+ZndY3hAX91JdpLhUoG1tyuInU5TAMpklI/Tkp9QwHbYGRT
	8xhdipupuUrYnDkZ7u6cZkSlMTUwj2SL4tnVDpKYPx92a77shYErE9DJVLay3k4G1318b+Snx1i
	bHU9oO23FMloXMYXB2gqbndeZ8bXY9BHX1KzZc0+kY0SBKAkm/OpED0BRhJlXEV1YNYWyqsVDXl
	OioMYviGsee5ZP0u9qyeZFUyNqm/lSET8nYMpQYx5tG8ovOGXakNCprzSfphbeyaM7BFMKZZbiY
	ZLOtP6Ft15w34FeV7+d4d6QM+7ri2ZsTUf/iTLFrW5E6+
X-Received: by 2002:a17:903:11d1:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c6bc250d2fmr88246655ad.30.1781786853855;
        Thu, 18 Jun 2026 05:47:33 -0700 (PDT)
X-Received: by 2002:a17:903:11d1:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c6bc250d2fmr88246265ad.30.1781786853256;
        Thu, 18 Jun 2026 05:47:33 -0700 (PDT)
Received: from hu-sarata-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5876sm201318115ad.8.2026.06.18.05.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:47:32 -0700 (PDT)
From: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavan.m@oss.qualcomm.com
Cc: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Date: Thu, 18 Jun 2026 18:17:00 +0530
Message-Id: <20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33e8e6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Ekxs73CR7cDBt7d9oJ8A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExOCBTYWx0ZWRfX8vtnIDpW2Smk
 5YDEHYKP8pKMlcLr85+AvarhdXOfuE7abjIPWhnWwoZK14ZglXrhb4/clojzyHkVnM/LuWUwosx
 Orp1u75Lvz1PUb+B0hHcvVlUzxC6ovg=
X-Proofpoint-GUID: 70w28MIXSb-ryG_nmtn2jp3GWmB0hakH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExOCBTYWx0ZWRfXwJH9jdcHMiI/
 j+x/bk/2MS8/u5LAsusRzwaOh6qvEUUY9wD2pdWAuW8tkp978WyjnPHGbF947CQula64DwaZS22
 w+Im2RA5SnphCx3hjNaZ+zKNjhwB2BZbm4iuY9J+GWyuIPqIH/ALYB9B6y92oHtWZ2p+5e/Indu
 0aqMHzMj1cFA8zT6xtlP+CPlBWR+uxjPwDkEOuTXIHt7Iae3xZyvIda1qSz73AeOhJJwnZ0ZvLt
 dhgT/czIQOmumzSawLc/hSxXUHE3Euwu8tzuAF9TWxnUF+iUH9HFUDrEPsqxmk04sSbreifV7Lu
 nySNxX43Gt+ILEYyomBRqPHq+G1TZ1jrtJTJjWlN5NDzbWMWnlF2XfvWCwMwu8wJHZbipE435pH
 0QpxvoB7gQv0sCsEIFFQidQswhRl4E5z+Sx6yiQalqeafPejBu82/mt55a39gCqnGxZck64zxd0
 TBr1Yb6pDyR0SKfuL4A==
X-Proofpoint-ORIG-GUID: 70w28MIXSb-ryG_nmtn2jp3GWmB0hakH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113770-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pavan.m@oss.qualcomm.com,m:sarat.addepalli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sarat.addepalli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sarat.addepalli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 512666A027A

Add IPA nodes for Qualcomm qcm6490 board.

Signed-off-by: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..fd1aa26e20f1 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -619,6 +619,13 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };
 
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
+	status = "okay";
+};
+
 &lpass_rx_macro {
 	status = "okay";
 };

