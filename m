Return-Path: <linux-arm-msm+bounces-99143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFmTMKIFwWlUPgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:19:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD412EEE11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DE393014A08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3778386548;
	Mon, 23 Mar 2026 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMU0dnsw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCvlVxQR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5826238645A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257530; cv=none; b=tATwgIZ+pm/Gj5pRGNPZyBgpr28fU/qQfkUhDZwOpFeuITMbB/41OmOAqsfeIiK9Nch96nl8DX+JQ0ZvbNFQPsYI5S+Zunt0ffqWPpWmDa0pSqAa9kPQhrnmK/NpsmymIAu4Hu9KqiYxBZOmurGkfooU5Rz6bZU3nXehgzNkwOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257530; c=relaxed/simple;
	bh=Zc7nt/v6+4Q7rzRTQIetV9Sk5jCVdJFZJuVL1p8pYhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OINU/K6A+exRaqLAo0BLZN/8kyffCBZYWSehlY2i9tnlcAWbqQMJMnVFVy3US/fB/6EL5i9OJVzxuB3dfDq1TObFlIBVXHfZjmZF+f7s2pjc9kU2xt6XFH1yRBmgHhqsd+U93i+ypZWTSIzAgolT/3ztGpNL9hTjRuD35h2HRgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMU0dnsw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCvlVxQR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7BVip1229777
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3wUQtjDfxAgI9iPYpnIrhTEYGD2QmgwM9MarVNUOQ8Q=; b=VMU0dnswjZspbU7G
	/N4n/8wEWPRLXnehHZj/Gb2UwtWyXVZUbEk40MJlVFFGQRUNUc90vRx2+jKoRCWX
	U2QrnSvq5QTHMFqH/nhB2/gi5tW5mVK5SyC/5Heu9Y1tGNg8ASvZtl5wWgK1cHqi
	TaCFH3chltEO53gALyiFKCgFpSNIk1GsqN66xQ0xvlE2ya8CLda+iL+zIl6a5Lyp
	Ip5JSLT6+nla/Z4kn0UkRtmYvGeCWcRRagpIDQdwXqmjhMF5OYavpC2h1Q0JQ1Do
	rdawgG7M0uJo1V4TC+VRxJbqPtcS76Hm/bj+BcgzLpymkpf8IogNH7o3RKsi8tOm
	unnxcw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghcj3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c44bf176so3309335a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257528; x=1774862328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wUQtjDfxAgI9iPYpnIrhTEYGD2QmgwM9MarVNUOQ8Q=;
        b=bCvlVxQRZfSgH0Fd64Jk0PEDqTile4T7ORvbBwijTvlIDiN/Nf+xQ4GuxJTHLyUIo2
         ALVYISc1DScsmmBedPx/sLEyOWUtutt5663Yc/kuLVFLA8AOeYWzmeqUzc2vGz7Hmfcx
         JNzohNpEiF4Cu7gn7EA170QKUNt3qMPmJ71S5X5a8Uh/GtBrqNQUawXkHdCeirKSaL1Z
         pgXcl+VJ0mJZfmqbo5K+MXXo83pdNViks9cxndWyPavXvXU8VLOoxi41NSPWSvkcyvUT
         K6hNhb4BL+jueeR7JyzrFB3a6Z9SMTKnNWgF1SA4Vob1xGtiC9mDN32tr5ND+JhcOP9v
         h3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257528; x=1774862328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3wUQtjDfxAgI9iPYpnIrhTEYGD2QmgwM9MarVNUOQ8Q=;
        b=SE5B/j4qpie7loj8+b6vXfDxaCwgEUk+j1QdZSR+sY5jwa7rkeVhRtzLmuaVhM/MhR
         fp+2EIpWd6QneCM+wqO4xmvIKBa31eNQKoo+lmv78xOJpriU0lv3CMrPfwU9M7m6lngy
         EgZ5WsQA5BdsFimPVoD8xQBdrJtLDLjjY9vM6ZfR6mOiv/qoalAiFhjriZ2VvcP9j9Xr
         HZC4hdsfsut9Z4/RyT6GtZQHoQXpaA17IFV2OQ6z08F5sgr4ZtcYrHC1XVPNWysk6jWb
         y8Xu6y895Ur/62FMgaa0/2eLUO4xxvNgZmsCsDsjogEGzozy04MCd+zANA4u484UnEok
         JOaA==
X-Forwarded-Encrypted: i=1; AJvYcCXNkhJq1LWem/3Psr57gW3oBAAxICPaq88yAkRfJ/ezw1auhT8+DHSuxXtiBXRWszJpIX7Sttm6HwMEdPaW@vger.kernel.org
X-Gm-Message-State: AOJu0YyyS/y5Um/NAbfkVv+k7bPu2+SowNBjNi9nPoqIJL24H/RfqWJt
	23UmuHeWjIvudrUoYmGyokBthb5ZVJGtcSnNKkYyTeNmHEZ7m9eQdOd5/NohW9GG4PANkybeVNS
	JbBMUyYAwq8y/t3FXqXAL1i73e1TfPmI8ftIoo1lTNazFQNBIqpw31/UrZThnYBbUKDbh
X-Gm-Gg: ATEYQzwXlcbvra85e40SkcfT1StQtvnVBDwdkQi4wKLI42gCNYGZ/wKOgsOLEKcvD3W
	YdPqUeZnhYcpv2kcYsKjnlEGbOT3/G3TEaTzYIhUtPw5fVzVp0//wtBpyKOhcdOrFs8IPSjIaL+
	n3VmvR+8Cljwl333ZTW70Kf7slIOeasn/MntfUbFeRwokDaAt4KdsT/M4Q52wEzxH99jPeP6XpL
	1tXXaz+5WDbvE5BclV304WeYZzO2kEzlUMJgcy+tXxeOYXiazGeJFwOULwlN33d376VPYziAqOz
	/4hcj5SrFk/ac2CLO9XMKFm+YDPzd1j94AEpQV0dBisuDh00gvQ335JGnDklvkbOs9HcV6dqQlD
	wHoTXR5rRBrh0QI0PQK2QNXegK3cNthtMpkB+waZ1riyHHi4=
X-Received: by 2002:a17:90b:35c3:b0:35b:9c97:3d18 with SMTP id 98e67ed59e1d1-35bd2be82e6mr9113856a91.12.1774257528065;
        Mon, 23 Mar 2026 02:18:48 -0700 (PDT)
X-Received: by 2002:a17:90b:35c3:b0:35b:9c97:3d18 with SMTP id 98e67ed59e1d1-35bd2be82e6mr9113810a91.12.1774257527549;
        Mon, 23 Mar 2026 02:18:47 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:18:47 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:47:57 +0530
Subject: [PATCH v4 04/11] arm64: dts: qcom: lemans: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-4-e36044bbdfe9@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
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
        Alexander Koskovich <akoskovich@pm.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=1514;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=Zc7nt/v6+4Q7rzRTQIetV9Sk5jCVdJFZJuVL1p8pYhc=;
 b=5hNvbZtfnL7IY/SldlqnstGyVUDFeLL5lhoy3GKb5l/0fva5UllvYuBDBtmI9nUtOTPRNsOwm
 eGzu2cehjSpB50a8Y0VWiojkQl4MKmwojr5gWF46wGvi0lVKZMlCMzx
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c10578 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: YczkRW0XNnS2XNY4OEVblw5UcBe-zgKa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX1Ax7Jv9JkNJL
 IRyLg+nK4ZMuA9YwJcl/tkij25mF/pFmuIoelCW+v27NNZCQZ3tB2wGPmaLi3t5Kpji92TxJ8Iy
 2I/6QvPoGJ/QGOqE+fMR50a9jeRtUbUTSs5KJDzC1Cwr1nFQf5BSTEJEa56+xna4Qzc2vVMa1S+
 CdRlOSf4WNJPrhCf9BXnV/X5LVEn0BRjWQzGvMvzbNuiLOM2By5UTGYJPwWxXlTocNI5MKHErlm
 kXx/ymik6+/CMgNEgfhHDDgXhsUySRgMA7OOZ2K9K61wslaFYaPZ4TXcR4qooK1dRwzxw9ajaEa
 8MQSp/y7Yr7M55PdXFNf4ugASf05NoaJ8BBjURIpb+BRRTP8alcTbTOvRJ2ludPBLugBN3epgWd
 ebJdc9ur7PnzdrhRmK6bqGwo79/EuYJv6scxYZd0PSHpIRb4wamHINmD0ZpQSnxVzd5PkNoSAlK
 v0laGIoZhNG4r+Nk84Q==
X-Proofpoint-GUID: YczkRW0XNnS2XNY4OEVblw5UcBe-zgKa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99143-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,1d88000:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 6DD412EEE11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for lemans.

Fixes: 96272ba7103d4 ("arm64: dts: qcom: sa8775p: enable the inline crypto engine")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 67b2c7e819ad..cdfa42293022 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2758,7 +2758,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,sa8775p-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
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


