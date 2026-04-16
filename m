Return-Path: <linux-arm-msm+bounces-103400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJcLMIHQ4GkkmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:05:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 751BA40DCF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2092307464E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEBE3B38A3;
	Thu, 16 Apr 2026 12:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JlDcGTf2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fr5fYrVz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5255F28CF4A
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340881; cv=none; b=j916knOzUehNb2RcZwtoSVrqcS6g2El1gROTobqExUQMI92Bnvr+I9arojmFgJxZG+o3CYOkq69cjdQoEAgmugbooyx6fOIhqRYgBfV8gZngZB1WjfJUAvCuEpxsmspBQh8+lENUVDfgdiXrCD0zUbFClZmyuMMSW6B0Zo13m04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340881; c=relaxed/simple;
	bh=3P0k4RjA6CyjjnHR/MCVhLicQAWATF/QQmixOrepKjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NQBY+otjc22NuobAx9NOC9/44FpC+cmCi+hpfWf2QT/OojH37+OQEmfR7Y7KUUxMBOGRqB3V6bXxAo8KLE8HB6pOjsL6By0QjfcvRjJoLA+MrPt/w9Be4ywazuOCh6S6iEK+30b4ryiosjpHT8Ae6XpZZVYuru+DoPmy5SzQNnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JlDcGTf2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fr5fYrVz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G90YFq2979251
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EybqkRSmlEJflSP37PUiHtMv/rrppQ6/7WrpcwwSTDw=; b=JlDcGTf2fE5O51JD
	qxBtg8HVrvyozYJJg665xKyxft5ZEeSw6mqnagqObWp207f6VXn+cRPCtAJUYWwP
	uCkk79qKe79qo+PWFUg6C6tId2Ujr7fJ4hnlf8dgLL6/uyncpxcX7VzYnRm5Hj+f
	6F4xF2mw01tFeQK0PatOW1x0X9dXWa7AEtrKj2Q4x/LpjS5le4cN71o4FEANl81Z
	Pm3lyWU1EGOn8p8TgJlpaToX5hOlrkc+M4dtbtDyVRnzQdxGI2tvj5RtoJfq0Eo0
	vWEoYFwT4DvV55pbZpfs3bcdAoqqC54BK4XRNuG/3dtMYmeCg1fy7N4bIs08M6m5
	lv24pA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvru8knp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so2386032b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340878; x=1776945678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EybqkRSmlEJflSP37PUiHtMv/rrppQ6/7WrpcwwSTDw=;
        b=fr5fYrVz3/QQRfoyeJ/5VVhqxgR7gPlnITGfqRbuH9g3C43UlFxyY9PnZiE7lfQqTT
         xp1fZJksbmlduXEnLCa6I7Upun/YOoD0Dq8QRxFct42rDhiYDt7W+wnvwFF+qfsP+zQP
         M09UncUpCPVs6mTZYQ5qBvinQ/fpAu8RzhbP2gd8lW+M9/eZrXNmpOO6Ss/thrQEDN7c
         Hsr2fT7RVzyNIhpSTbXZj8ZEexo+ijdMi7Jvl4l8ca0gquMfSgHkYsqxK2xB6Awx5+wM
         Y++fIly5uA25Yah1Qbt3vLR+sEdTulVtwkO+T3yEu98Hk6fKQc6oI3eAhYqbzmOg+8/8
         WVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340878; x=1776945678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EybqkRSmlEJflSP37PUiHtMv/rrppQ6/7WrpcwwSTDw=;
        b=ANY8NIN5wOINkwbjPJG6m/ZkJLJLnUKM4dJjDQOAw72+r/OAVzU7KOJUuV4M7mGIxb
         1JkvIHrFqtIOVLs88B4kL2FQeCAaHNQfASvga5ravScvabUUJTkSIPXG1Vzw63rRGmJf
         ezOxjpFnxaVZ7HHuVvPhmIr7bkY2I83NjJgKE9qsMmJgSS0PEtBiuMM+VsW4ia+H3K0f
         Q9XlM3CzBfpZsfrjlpAWmm1shsIor775fOW1LyaNmnWaw07YvJkrxt3G6gfoypLPn5sE
         QfYHpGtkxBAa9XPoValA270qX2ra25zL2cMZ1WXRLOvaDpGiflavfN3kBqch4aoE5SP5
         eA4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8T2fEPdNBrqSmhSRx3GpinI0+srHEalTq+HupRyM5OJcuV7JiFA3+uBWwKmx5FyzQDvO0Uoovx+PMJaAQB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi0u8lV1g6GZ77j51hMNrbKCCM7Abd1z2nM2s3XINt/ukYS4dr
	WebtrP6jRAl/x4ut6t/zFjWTXcI3qtIOdFKudBkcHeeWDVVJn/l8Ti7VLKY/yfnmBD308IpWTzz
	rM9NCL7WL63+B5X0zmDjaPR3CI6KtUyrvverFNFHekpuvEZ0N4kJSqSjnD5jIe1tuLr/g
X-Gm-Gg: AeBDievqdb7TQhW23A8LlQ6sjVJUd6d/sDocT/orHJBdKnqQx364I7GtrfgyOUS79Hd
	C8x/EHeFigLzPkHyMGEr/tS5RDqnperkQIxgZCV2i2/od6TTfKApQvP3/5h2ctXYzN5HxUKCR/c
	ig+jbydQwUTI0qgJpxtHg/Fr/0t47Siyivwj37mNeQjulL2C2Ll2xBL90iOVU0gxrlFVjtAsOW8
	l3kqXnvTjp07vML7KTiPEq5+cQEuoa9yHR/xd7nZYmZRb/KPJajbyAS7zSpKwSDaBci00a4Oqad
	z6cEzPX664tMMrbwRNfGHqnGT8l+pVsBYx7zTwYQlhpJZwcBoO4NseEJJDhiyqK07p63T4YNcfA
	1duxoaZVgO04Tjdly4AFOt7ozRPA1wJ3AXxlA0vwfI9GRPHXpfHTvsOlxxg==
X-Received: by 2002:a05:6a00:400b:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-82f0c2efb17mr27205194b3a.48.1776340877886;
        Thu, 16 Apr 2026 05:01:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:400b:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-82f0c2efb17mr27205097b3a.48.1776340877213;
        Thu, 16 Apr 2026 05:01:17 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.05.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:01:16 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:27 +0530
Subject: [PATCH v5 10/13] arm64: dts: qcom: sm8650: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-10-5ccf5d7e2846@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=1526;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=3P0k4RjA6CyjjnHR/MCVhLicQAWATF/QQmixOrepKjU=;
 b=uP7x1mpLofRuFo+hN3TkTZ1T46+1bNT1dk/vSUMEfHo2B/SC0FBABO6HW3F3yKHV2Rw20ekUZ
 /xJeY2mOFpeBCQfyD4JQKJcYQxwAAiRJnRRuN41pzfgqKfHBY36d+F8
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExNCBTYWx0ZWRfX5cbOHxf/RsCf
 072r5YsXvR66BHiGYH4+k20PDs5wbUL70I5XGqBKXA963S65YnGMYkow0DDzf2XWB9ZIyXQj3kz
 uLw/swQFJLOtc+5JPDBPRPo8hv1rFehv/v3ylZ3V1GlIvMrG/MjciWRCkDVRtkadCFO62hWstbk
 TgYs+uCQB+A/Go7BDFxA8dmzrMrztV0dbfWvYpPQtUW2qFCo/1KaDiiGncZKKtCOPlAo9mqO/K1
 bPmHrzBDe2xe7pkeBNhPftgrWjbD5Hr/LN5XPwEX/0RnupvFvauuVWNj1TotL5EMr5xtO/eO9n3
 P+JPubrrgteGSOK4rXOcBXQAFqjovroIQmPf8K23YKBL9cE8+iDYXJmiJo9IWvVkfWx9Do5vOIu
 x/NmIuA9+sYSUgog4ERefzC44AiWmvyOyoX1Y2fTGLnXMTKxLEKUBxDsdvQ3qsRCzHg2WvR0IU9
 cJFYLXMAfTfm+r4T/Dg==
X-Proofpoint-GUID: O4AzS63AF4DGiPQKcnVGEbjcqIRUf2XP
X-Proofpoint-ORIG-GUID: O4AzS63AF4DGiPQKcnVGEbjcqIRUf2XP
X-Authority-Analysis: v=2.4 cv=GcInWwXL c=1 sm=1 tr=0 ts=69e0cf8f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103400-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d88000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 751BA40DCF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8650.

Fixes: 10e0246712951 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..e2d98cf6adca 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4081,7 +4081,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


