Return-Path: <linux-arm-msm+bounces-109077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKFNIowPD2qSEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:58:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCEF5A698C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A46EC32480A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF653DD53B;
	Thu, 21 May 2026 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnJyhQ+y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddUbYqhz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCD63F65EF
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368848; cv=none; b=FeLWs/nR4kOophhJTUkT0yDH3LmbdGnloIwLUCAGKx+qoUV8doqc+DC6x+Pkl1J/vWX55aVs2HgkxTc4SShGJrwkOkfuPhAOQoFoJwO8R0JbjyY9FMEdW1+BQZMoDCT+qwRAvkWYCTYN6yl1Q3uQiZWzY42UBdmI9ir8jGRybuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368848; c=relaxed/simple;
	bh=14xdM7lWAmj21nWNm8xGfeuJETJYM9HFjmPAp0BZ2G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/iYFAPGlwdpGJYR/AQq+Jg6OamvDxJkq4aW40ceKeYSZGxM12pHWDikwXjTXrujGMDcQF3rFQboy5mb11tJtqa3PyfEG/WxYzJCrNuehy6CyiXnyfF1NEMvCokG4jnr2F6uPkMv11P7yLPOx/i+zjIbBgfDdXmGXKAa95pU1i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnJyhQ+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddUbYqhz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LAXuIo818843
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1+140ZxDFHpXv0jaodESlk4RR58nOTRBT+vzNq9fR0=; b=bnJyhQ+yDYvqfgxT
	DpdLDdvgsT37jschvPfjyvZbuuzMre75QijVVeQaRmZqf+xr8oSUAKbCJvlcHuwp
	gJTo0QdFp4ADIHUjtUXGlPp0WfOlhGDZMxA0DneeixtoAWscfGT7+tn+vVW9LcSl
	5U3xOEvYFLFUvtC8QNc/RgLVU/auLrfQgTQu+ztR2iV47P4ZnhT/axyBbz1FVmAo
	vv9ZOFpGsA+B06QKywtT9LyBMI44ynHvgKvLwEqpX7Al3V72/imgXwakoFeRySKu
	OMhksAVZrxo1WmgDvOc7bVNTi4vz7vSU3Ay8bRvMa07AwqiGZLD/CDbfvk3g7CqG
	mCb1Jw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkghc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-366344513a3so12989565a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368845; x=1779973645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1+140ZxDFHpXv0jaodESlk4RR58nOTRBT+vzNq9fR0=;
        b=ddUbYqhzRW5+FQ1axB/I2vm8Az7Y1tSIpulehogXl9FJO9W8+Ep4M+rDl5PU3JqioC
         DPahqaoMLQfm/ca9M/jhPdBscjcFWk/bEgA7I2wG1o7bi/jGm3zjMMHg95ewnvzbN/YY
         D516hMwx2lpOrQyvnDK/n4oQFnbf9QzG9rlHWmxsylDaOtdfhjKi7Kzu7iKCERJlxwy5
         lbgfbZ4kdAjjy7KR53ixgCMUlm8G47C1LOI27K04HkCfgpScPEE3eLsc5fYU55GjMqzK
         tkT1fkUdjitEK9UWslFzdCwt8Mqpmm3h86LVr0aqAKkumh981sNfeeoivo3XHHTaFtZp
         034w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368845; x=1779973645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b1+140ZxDFHpXv0jaodESlk4RR58nOTRBT+vzNq9fR0=;
        b=rQV4tmbidllsWPTSwyc60HiixN9Rocn5Jt+tVHI+I97uT6y3cNKza75dol032egF4j
         zejXxUdpqbvzI/FZIUHRNxuRsvqWOgr/xGRKLmVBI78U6TLA3QoTvNAITKqm8FOS22ny
         s/H10mpKUz1I5yLHNrVMXNeObAO7WWkW3X/ztqwSjjpLtZ0Hsy/7M4Dhdn3DGWrWl50D
         xwUBHfBn8YOcEgcrHzEl4xM4OQicjVXTHqJ0lzlNH1tialMWq93lYuGJPnMRvXzO7LP2
         5T9RKDmouInT68aS79HZzDToSFTFK5lQEEzDenQaswMPLJewmDna0Hwqx5cuvuHpM/Zu
         a0Rg==
X-Gm-Message-State: AOJu0YwLO3di9QCQD6RQl6WXBMYbwaeHYUU0I4Q7HqQW1ILEbPmpWTYV
	rvUyk7HcRYIX7DkdNeNbja3xdq8m4a1W/+E8GzB8oPB1OyuCCY29Nnq8UXoGpi0s8CkW4B309cS
	TJvZAcj+wGGvS+iNvOOHErZJCtyGx2TU6WQ7duXj43wTyYbQlnzwELjtDZJ90SzPLrl9Y
X-Gm-Gg: Acq92OE45aYEF/GXlUIAhF18SUHRfwYrljxyFqpFyYXTS9nr1it27hsyML4MkqHBf3I
	4+9DGXhled6lJ9XyqnI8EDBDJ5Fa+nW1R/JX4SdEPH52iCcP+hlUPNcdObmyivZQ7BX+Gg5Pk5J
	fB2k86vWTwjlf0ov+oiKvvkSZNEHOm3w4qN9ARpuhurR+cBxv6x1jQpBQLxZ9DDMI+eRxCo0RsQ
	DWEEsi4SqXXS2kWxN+YWbbQqqTnQiUwhn4/04Vim9bCcbq5atg9ynhTLI8Uml0RdBxxptMBCjxV
	YgMIEvXgHE6HoKecj3HPst+XwBYMe23Z2D15ODi3HNkijvTHHaSE+InDsvvnOrRIKcT2fBJ/J+e
	KJ3XeLma7FE06fD07MAyNzzeiwuji5FovRhnBFxVgjWseJLu1hox3ZfEP
X-Received: by 2002:a17:90b:3c85:b0:367:c442:3f20 with SMTP id 98e67ed59e1d1-36a4562d34amr2912588a91.19.1779368845452;
        Thu, 21 May 2026 06:07:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3c85:b0:367:c442:3f20 with SMTP id 98e67ed59e1d1-36a4562d34amr2912549a91.19.1779368844978;
        Thu, 21 May 2026 06:07:24 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:24 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:40 +0530
Subject: [PATCH 07/18] arm64: dts: qcom: sm8350: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-7-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1200;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=14xdM7lWAmj21nWNm8xGfeuJETJYM9HFjmPAp0BZ2G0=;
 b=t2hdMCRWSJNRvNxjqNUg8xoML33lFe5t7/J+hEF68s24P/YqlB8ykk52DXHQHLjbkIpEh+kZK
 wv4CTazhosUBpUbyPhB6n/yqDv+rLpFyTh7ae/hKo7oYt2bLS4dx0Wi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX8xXmqwf6xdNE
 rgWn5ZGJyZhXXc+KUERH0tbpSZWwOoOqIE/iLeYyD8W1a1oBcf8gUacwYRTlXJFvCgUyy965ron
 ls9H2K+IOzpx///5WemYcw9bp2H2IynXptuySqrNJGQcJgjxVXy9AGiXJSGQ9VZ7gROEnLJwwkN
 tTJS54YqO2CSjvdXewxOVWAycWhi9haDvwNNB5de2eA0dkY7w7dTLQ/XY/kZAgLYkfYo7kmzx2u
 uw3ZN1GyfUgc2JoxUmoZ4HTxcsbRp8djOeft4qPcMp3u7F5pVgKXzDexH7fN2uGk12lgK2BzkDH
 p+MKspTNx7cKwCml2JsdWIcr3CdgnBrwLs27qvj0XMjmo7PWOx8X4CpGX/fv+PbSQ9Td7osTjZ8
 2Rwb1dI26JOcbg7Xz3weXxWmxqVeOXMIPKd2X4DG330r3jSJeEvx1R88kDqZM3DE0MauLgPQagQ
 HQ3bgdxYdDpwX9RGARw==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a0f038e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 3nH3c2dQxd7WF9QtyoIPXr-087vK2AEq
X-Proofpoint-ORIG-GUID: 3nH3c2dQxd7WF9QtyoIPXr-087vK2AEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109077-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0BCEF5A698C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..0897ed1bbc6f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -494,7 +494,7 @@ &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 	status = "okay";
 };
@@ -508,7 +508,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1


