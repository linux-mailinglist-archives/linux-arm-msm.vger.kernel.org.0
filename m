Return-Path: <linux-arm-msm+bounces-90294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mF9JGdQgc2ngsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:18:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0269719A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:18:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3CF33024A7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C606635EDAD;
	Fri, 23 Jan 2026 07:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PV3KlfBF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DN90Mnzn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09C8367F42
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152413; cv=none; b=akvCxPSyokXA9tixHdQlsynJNUYX+OO1izjkkK+0DcssC5gKkG99B6BoUHDkU+8bSXLq92XhVXREwRwQTW8GYGAfEOb8fN6HHtLoY+t8Tdm4q/7oIBzSluXb+2l56iVSi2LikNcr6vCBykzMOcMbhFDx4sMeWcsBT52QHqGdKYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152413; c=relaxed/simple;
	bh=cNHo3PNjBHDjmsqWjGvKhkma+ZdF+SH0+vV+SWieu2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ACebbSKOc3Iws5f3+kGfLbdF6pTlDM+ajSHRH2sW8YmH3lSJlQkgwlGhhDu6Y0DaY7BxlOqPqPA7Q2MPHUoDTYm5PFNT5E63dgns0+/7H7QfICyL1VzZU5NJVkN5ZcF7FI+JaAT+iYx0hc0ObJXWtbp2KA69zkjD2AfzAb9sokQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PV3KlfBF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DN90Mnzn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N2OnB4722364
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x8J2N21wYRAOO5jWgvxO0OS/Ym6sx8s5Xttm19MqtkM=; b=PV3KlfBFXa5Q9qNM
	cSibrQ8ejnJGCkkvec9LmwATvhrENauD2mosJkzRKNk54StDIBmDHPuiZ2X+wT1O
	Y29GmH/KHieLiE1/MPdSezq9tE6thLEl4KsPLUDcfbqJQ6oYYN+KAEgSO/J3P01D
	b7qdtOGWHD7lXQVP07EXVnFvj9Ksw92d3IqMLUT2l2lDf3dFTbVhTBryDDUgy2N5
	mJvbpSSH0rYPvceddF8RVkoks1YbmnMd08WPlXQTgaoEa7DwBr90ZomjKdpL/li1
	5jAqgWi6JVOa9Eq5TDezFinEHFCA9/SuaWIjJqUjEq16NUHOffDjzgf4HUWq6+aG
	By8a9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv069gxuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0bae9acd4so13138295ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152394; x=1769757194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8J2N21wYRAOO5jWgvxO0OS/Ym6sx8s5Xttm19MqtkM=;
        b=DN90MnzntmdjA/K1sSLYv8QcRUrisXAkQOjcZ/7kJZP2UGCygjFcl/wFG7KM/6BDzK
         /8TT6LpKZLPPjjIQScm6Q/RIThdcYjjEmzMrW+stxo59DmOBv3UARI9vbwP/eJWRgL82
         mhq/ncHXBvTAvjS6CJLsqj7SFc3SmJZhMM0WbqlugqcB7IsIyH3BsmOgprqetGgiPOVc
         /Meda+Sn6nARl/UxStUjDOYoJVRtDLcGDyOzwxDJ19gNk53ix/6b3swQVTJT7zpgS50w
         F8S/hQay0ikaKWBjnFsSYUg1RTyfM4UiuGDNly26tWn3PI3hfGpmaYgZ3OHLhAfj9HEG
         xg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152394; x=1769757194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x8J2N21wYRAOO5jWgvxO0OS/Ym6sx8s5Xttm19MqtkM=;
        b=GC60NyOOek70O5Gq/z4CBF+V2QPPjljHvWM1llZNNuCfqNDxqTPIGY74CgWKKGcG4G
         KTbcSq6JSoK2F6zqTsgTGg+vZeWBVSnxQGLORvmpdJ8DI7t6S0BxXCZBuyYlnIm+ZBDs
         Y8yu6VsnYIKMmIjjPqSGhGdL1dP/IRP3cu/NFM8oB3GXni9/6nZJNxLOpnQFMJVfUgyq
         sVb4BKUoZgbAYfC3ebwO1ECag5+HMN0/v6sZvp+cCvpE3qdvBGl20qUGDgHLFUVAhk/7
         pC0mViBPT2guYsxGGGasoIzzccrLW0IgR6RoF8xHDBVkFX5qkkIu7cV6L4y4H4IKC/yT
         XgEg==
X-Forwarded-Encrypted: i=1; AJvYcCXeBih6pUvvxeVxs+3sjtGYDNBhFcqPwjKetSCPyvvkobTKebUxyhgbNEax5tD5q7jAZUI462qGd6gNnnmm@vger.kernel.org
X-Gm-Message-State: AOJu0YzenLwNANoMUDdOBoKuX1q0qmQpd+2+4JkpltVzVM8gEwIZKC09
	++3DIOTAhmXi3Z1tA2Ap8C0z+ZDW1Y57jr+DkbtutJB+AFZegY7ik+T7+8gx6ikwqRjIekXKFRY
	OZfVZaQTKz5SKhTlhvedhRPo3u3hQL0zoKm24092i84H9eh7aJQrx/eZVpYUjry4OW8OY
X-Gm-Gg: AZuq6aIA9ft5k2J4xjFxDei9QFNRoIPckrjtrPLDn+VR59eSxRBowf8VH0fSXHETCQu
	dwb/q60MtxmfRUBAPOMkhi10AsDPwCsTTPMj6swBcgiEGqB51X60m2QgoNnOf9Wo0M097ipqWf7
	O59agCtCZ7fksO9dCS1QSgq3zbeHCOOOB8JC5rTwI7i3L78fZo48CEoYnZPYyKpc/LR7JMxqRb7
	BA/5Adu9kkS2cKc9NZ6XqUtN+6PdLuQJQ32bdeVNgjedL0IkzCerSjykl/70Acjhsz/ypW4BOU/
	f8IyvShoqExUNHgQWZ54KDV/kUtdlbo+WZ7O8mlZ1CONyk8r+FWpHtoCj65hiB58I+RnNlRsNUu
	5Hj/aleq8Nc269nS4fGTudBsOV31raG5dkEg=
X-Received: by 2002:a17:902:e947:b0:2a1:3cd8:d2dc with SMTP id d9443c01a7336-2a7fe773b67mr18799505ad.57.1769152394137;
        Thu, 22 Jan 2026 23:13:14 -0800 (PST)
X-Received: by 2002:a17:902:e947:b0:2a1:3cd8:d2dc with SMTP id d9443c01a7336-2a7fe773b67mr18799245ad.57.1769152393657;
        Thu, 22 Jan 2026 23:13:13 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978b8sm10979795ad.46.2026.01.22.23.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:13:13 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:41:31 +0530
Subject: [PATCH 07/11] arm64: dts: qcom: sm8450: Add power-domain and iface
 clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-qcom_ice_power_and_clk_vote-v1-7-e9059776f85c@qti.qualcomm.com>
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
In-Reply-To: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769152357; l=1222;
 i=hdev@qti.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=cNHo3PNjBHDjmsqWjGvKhkma+ZdF+SH0+vV+SWieu2U=;
 b=wAul7ry9YHFFJVMN0zcJYGfHOZox77ROpIHAPCTXsxDeifvl6A7aQR/sBAWQ2AhvBKs+XEXDL
 yE2k7JmL0hACBBq6JghCGwRx2x2ILMX+CgPOIZ1FfXnqjPkCaKIONEk
X-Developer-Key: i=hdev@qti.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=eLUeTXp1 c=1 sm=1 tr=0 ts=69731f8b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=n08Rq-YSkjsL-2sbs4UA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: IaLNoM6syaT0YKAOKQ6oCtUBYG4KEytz
X-Proofpoint-ORIG-GUID: IaLNoM6syaT0YKAOKQ6oCtUBYG4KEytz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX8gbF14gjypwd
 tVAekOD7cxIxiS4ZEJ5W/a/8Rz/lYMFPvaEoC13ZahP8ZqvxwJJeJMLrWzR5WgOshUW2EJERA0w
 acoP14tBClfOnZSIf+q9hLxCZnIO11mgTtak9wgHUF5lYrJSOCk9L7qGccf9V8mtTdFq8xnQUQS
 h8hr/V4GPzctdz73kp5bLEk7mUYbi0hOlCy2mHr9GpIWBVYTG/QU1I2tKjRpaJR17NIaq1uDOW5
 sjJnbuYMIFDNghl8F7PkFz1qhrsXH64bHxBe0/qPfTcS9HaRjWlkz+1PnqwqIu8VC+YMXTmGjSR
 A/ulBwjtX0hN3q9S+qTTlP3f0214t6IqhgPRakuT0sEWOpHMjkUzdYdTnzc9C4bKmOBU0GLzYQZ
 iSy9HGbaf7ibvLc1zMC0+9KE6lgrnwzWiwRIJ5uDxabYW64qmKA3gFJD3XWofyiaa0PSiKz3T+B
 vWILXKuWu9JMVmVjDvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90294-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,qti.qualcomm.com:mid,oss.qualcomm.com:dkim,1d88000:email,1dc4000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0269719A2
X-Rspamd-Action: no action

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for it's own resources. Before accessing ICE hardware, the 'core' and
'iface' clocks must be turned on by the driver. This can only be done if
the UFS_PHY_GDSC power domain is enabled. Specify both the UFS_PHY_GDSC
power domain and 'core' and 'iface' clocks in the ICE node for sm8450.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 920a2d1c04d0..3d243e757fa1 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5374,7 +5374,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,sm8450-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x8000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "ice_core_clk",
+				      "iface_clk";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


