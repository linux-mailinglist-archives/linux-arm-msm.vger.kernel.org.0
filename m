Return-Path: <linux-arm-msm+bounces-105107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKl9HyOI8WnNhgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:25:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B4E48F2BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDC9E306FDBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 04:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407D138C410;
	Wed, 29 Apr 2026 04:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mG9ZZBc8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZdn5RKc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9028B38E13F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436599; cv=none; b=Vd2449Y4b7FclQSMFf6ywpjJp2KourGqaPZNCAwBThwKlMVNW8kAe7O0CTQ3f0jvtx161PcZL2nnl/7ix9hQZv2Qs8dcIhBd2Y54J6wgDpxN3JiclmvSluouaaBjqzeVwM2P7O54WLDoqnjY+zAnUHv147V9FL/HZu3a547UqtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436599; c=relaxed/simple;
	bh=nX6Y82zzESPqhrrlbQlA1NTD5phO4pdq0SzAisS/ebs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dHytZ37c1KVJtdmWZW2Q3tTSVp5spqr2vQjQD2t3/qSp+4cGSTPG2jvn7NHClwbSwBOh2s+LxvvTokqaufWouvTvyCjmp793GM6YvuURHrAYNB+iBRMesyM9umyxWfWd1YPo6gxNPpdPAZMavwzKDGMIwp8qG4lBfnQMXgheT+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mG9ZZBc8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZdn5RKc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T2LAIJ2984940
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CecqJt+jxHeudMX3AkxTxuPao/HPi6jAXtF14dccZk=; b=mG9ZZBc8xaFTSHs7
	uawGVVKVALJm6deWKW8asQULguFmOXa8eaBqy5bR8jifRu3O+beedz7Rn2I1XGn/
	xprUWOj79TEE1RbJpGQgklPmNCuSCh0AkRuLpOGoaMaK7bavZp9WlPef+k9FR4tX
	CBMBHk+7HmfM+NDyAa3sZJKUCakmnCdGu6nck1/0ZmvJyUFSaRRIkE9m44M0AUrb
	Haq1i2DWQIJwrMZPTgZKDlnL7sS2Xm48QrUPC/8uUVF/zzOBCWu81eVa4M8xEsuU
	ioQhiw6Z70+zBew0ghEwMWFTIjNbzTL36zXthN5WtTwO+TYBa4Ok+xdl+ZA8HI/W
	BBMrSQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1t1dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f07078eaaso9245839b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777436596; x=1778041396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CecqJt+jxHeudMX3AkxTxuPao/HPi6jAXtF14dccZk=;
        b=ZZdn5RKciV/MBmFsGaM5O1OhRAiIthe8U9vETa2bkyyP1usaeJjhjAnOWB71YPm4t6
         IIQwJVe9diBNyfyaGOfBLJTn/aSXcr8J+Ea8bjAAg06VyyJuP7g+z/gLG4V4c9OGK7+2
         Y71VRweq0uwGLPHMlNf9zzoGUYV1i8dJdjxzEp8MXwNYA2RL6FpnbWTh05rWaHtXcFG9
         1NTHZy2BlGAOqsNEw+xCTftz6BdE2mGtm9CYpY0YrnMVDrxjCDIS3CEIFNYawcSWjKY0
         CXGNZM2o5FxZUxK6QCHFBG4VI0lcXuE/NQnyD419PUzdJZSw/z68FbYpAzF3hgNkJOCG
         DpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436596; x=1778041396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1CecqJt+jxHeudMX3AkxTxuPao/HPi6jAXtF14dccZk=;
        b=iPFeZxjiUGwQMuNpiaZNnfU0sSp2QC/3HsjqTGzRlxuhJaZrC1e9BkT4mGmjQdUrJR
         1xsQZC3SLWg1JmDBsgcxNQpwQHGtrx5QIVMJ01sEgPZVQhqa7+Jo2/L8xUCBb61+tYNE
         uT3YFk8xrEgbJWtRoi9RDp+UwtbrqFMmbFU0IxJKwz7xzeCYwCr6qiTUV89xsDIv8NcW
         WBZ/sslldGWjhUFFIXaL7TaVNgJMUe9ZENxg0OVUEj72HZAoRoEJwXso1DLNFYZyaoxP
         IjaLF79D2a46D4H61nPd8XXvQegXIE4VZB3592zjEe8hz13QFQIHrpMy/Kostm8w3tsJ
         tRAQ==
X-Gm-Message-State: AOJu0Yx2yFeI47kVVNRh4Jxe/pb5YOzFf3Q1dvwQl99E6nf7GFIfNKeg
	IJNZPHgHMiBdMu78JGQ0i64fH1ja+BEekGPg1ZfG653wPQm0+JovrEqntJk+HMRJgRGUngPn/ox
	30D1pOm5v0Li7nk3Q+uZi2vCe+JpEnc5e6JDDXVquDFPNMi5++T1H0M6KjQpH3ATPD54u
X-Gm-Gg: AeBDies8UOlo9JBtELss9Z61HDdtQ/YWDm2YL7+DVKQMD5HpVRJrgwhIw1tyak/12qX
	SM9LQA+8FQpZEkKttpa6vvi7WvGD6egJf2xPr33P89s57YmhylExWyqucg5iLbPJ9J1V1YP8xkp
	hm21V3kn1beS1ZuHN2qKz54KLshZFb0WPqG73hLDZgk8+0+vmIaVg4M1kACwm3bsqytxHvujkKw
	v2/cZvTT/E8cLmPt8xoE+2p498sOBqUHrfdY+FCibmAXIyHT50mHwdWUL13BDSB9xff2jITHaO/
	eWNlhRXeDL6Yf7KkIeW0S564vbVbCBLPlzHqidGT35vhWrq2HW8d0V7kmgseTgoMnMy07A/szUo
	MQeKQbOva02HW39Dgi0r8Lax0Uv03uevLL0Am2SgdP2Oi6mZQYjuzXerk7+ivUL0MBDMP
X-Received: by 2002:aa7:9067:0:b0:834:e605:9927 with SMTP id d2e1a72fcca58-834ea6aa9admr2086421b3a.37.1777436596170;
        Tue, 28 Apr 2026 21:23:16 -0700 (PDT)
X-Received: by 2002:aa7:9067:0:b0:834:e605:9927 with SMTP id d2e1a72fcca58-834ea6aa9admr2086384b3a.37.1777436595701;
        Tue, 28 Apr 2026 21:23:15 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5a074dsm602200b3a.10.2026.04.28.21.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:23:15 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:52:44 +0530
Subject: [PATCH v4 5/7] arm64: dts: qcom: qcs615-ride: Enable QSPI and NOR
 flash
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v4-5-73fb1bab03ba@oss.qualcomm.com>
References: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777436569; l=1047;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=nX6Y82zzESPqhrrlbQlA1NTD5phO4pdq0SzAisS/ebs=;
 b=sMA7BYB4QynpISQO1sIELdtNYOj1B2oWgMiu3tyMjknXBVXDD307DrcwT1gomEYEp+v53qQ3n
 FK+Z0GLJm89CxMWZdqemUJd2ZqpmzM1doKzUTGdCqpzwRwrDTPOUg3l
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: 43iS7qSCTk2L_DVH8yqq6I4iCEja-3kK
X-Proofpoint-ORIG-GUID: 43iS7qSCTk2L_DVH8yqq6I4iCEja-3kK
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f187b4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=eijpJye3pRbVNivL--0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzOCBTYWx0ZWRfX28tfbskekuTI
 EXcThpfWtokfGG2uZCaphPFIvaUiN6xfs1btLEu0J5eYhn5RI0mPwk7oE2wxQJku+OFnA4a/HKR
 BOKfkf2JTtwfzqtrOEp5jLIyNVr3DAov8cui+WzEuaN8myV7qh8Wcgqc0JbyyKOPdVmVlv1ZL5P
 I4GEpLEROdkjNx0Aknrgpirdy1HyomymRXujq2ns+wUaiSKBcrNJsWfbFe7uNFpxguzGoDZdZU7
 GlKx6W1bP+ro7FOlWXoCByiZGk/Fu05x+MF4B+5WncfLsU5uNPSkGd88bdKLZdSWP5/JZ/72cqp
 F2Bg64NEG9oLe/0VILFpczZe2zWgKKLPmoheAixkZ2nAKsIXukF8/RW8SnVplG1zqH6Ibwwi7zs
 QwhpZA2PTfXzW1QLjY2K3RT9oZS02mzz1cTxg+G6zIo49x+6fMznDh12fpT7CLrc1miaRv9F0Yk
 BGomi1TX9fsjH7S2DKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290038
X-Rspamd-Queue-Id: E3B4E48F2BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-105107-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.905];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	RCVD_COUNT_SEVEN(0.00)[7]

The QCS615 Ride board has a SPI-NOR flash connected to the QSPI controller
on CS0. Enable the QSPI controller and add the corresponding SPI-NOR flash
node to allow the system to access it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5a24c19c415e..b096d96ab220 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -516,6 +516,18 @@ &pon_resin {
 	status = "okay";
 };
 
+&qspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <25000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


