Return-Path: <linux-arm-msm+bounces-96547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDnGOF3Sr2kfcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:12:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B772470E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACA7A30484EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD2D2F84F;
	Tue, 10 Mar 2026 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RfK9CWCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+cxD4nn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC7333F363
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130067; cv=none; b=DIgK4g3uFNecy+a3FY53b244kx4iQBHoFYgeQaE4C/g5mb+pG5Eyy5JTM/yG1pkrB58MG93Pz0HoVhbz65fDw+HUtaHP+h9uzoilOd8/oOFSwTHjyHvcsDfEhC94cV+p+lz8usENz2dwcXY6wvZiJ6XaBhsxmhHh4dO5XkSPSMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130067; c=relaxed/simple;
	bh=niYQmVRxD31LW0CEVaaeCQmeMe417PyBECP1mGWfg5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V2N1NmQuQSm3O74GMSDgCqPXRB8Q3MvNM/iIlzSOiP3GCWGEJ81e+uimnureQxpHBX8NbXImQKt6zMa8VHMUKfNgcpI4iC8nY4u5birhtBwsU/4uA2bOs3qfBFH7NNvhoPhn21do1YgRnb+j+OdAQEqCv/NibEwpOLv5SUAVOtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RfK9CWCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+cxD4nn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EHc2246880
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgHEgMJmGM3qOy994TlAjnMH+RNsJUgib0uSTkzmnyU=; b=RfK9CWCLQd00uMza
	GH2BLnhfJVCHFJQvPvlXKsRRIfG+pIi7sKJZCx8xz9hN3mzIhl0f7c6J/deHrQyR
	wmm4E20qINMsLNhLmQI40qgLkYAID0NbONDTSLFBpqI+xFNwaDN1lO6ZCSTriO/m
	TvF6qxgtn+MNuY9lsnylOrPcuC4Einz3dOHwOnThsaO29V/V2eRt8QZSp1xiAraR
	vxr1uV8vyqMpsgJolaRiw7cbEEw2ENbC0SMJ0R+oqn9wDPJNB4dK1hCITeiU2D+K
	92+OhkYDwp836nHjPHbEUDAgTQT2uxDgvgYeiLk8OjJgT25Gv1qeubzej0C8x1bZ
	bk2g/A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8801ev3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70dd30025fso47407183a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773130065; x=1773734865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgHEgMJmGM3qOy994TlAjnMH+RNsJUgib0uSTkzmnyU=;
        b=Q+cxD4nnZQN9ikAW0gebwbo/ZafV0Zu4Lty2jQA7ANId5KkiqkgmY9OqULtOTbhGe8
         8K8NkAAn1CzL8R9FuKFFH2iINewHfRrqV4ou5Mv/RRxJs18iH2ff2zdsyw5z5uT3RICU
         VSYmb8E1UJpU6IAG2SeDwpDfC+EMZZbFYzBq98FsO5zHI/evveKu03vNn5X0DeS4b9LJ
         yq+7knBADw/o1wi+XqjGL+8E42Tht69yNTZY2sU/dDZcmpD6NHT4Esj5Rjk1Dw4QN4LO
         DWPNd/frkX23YQINEy9Ep/UPtqASjHoXiWiV+OwNWFAjbUnnzUfyncwpkmvPEdTAKXRJ
         Hepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130065; x=1773734865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qgHEgMJmGM3qOy994TlAjnMH+RNsJUgib0uSTkzmnyU=;
        b=vf+kvY4LNAK2iyj/oPkMUqKQWuol+d9taMvcyU22sfXtSEfHdeYk1zUR+u/6X1XEA3
         9jbmkA01t7x8lSweSTQC2Gu/nrjBVW5v9RnGMa+N6N58MR7E3q1PPEFj9lq7zSzN4Tme
         m9qf/Tq2dvCdPlvyEfhWznd740xKtpDgIGEy/vyiaNzGUgWRuq7FPBF8peNSx8li9ZSI
         /lBngw3aCvCof7xEqoXu5xyjfNaY6yVslwrQ/eOSvA5/ipFwqv0SFwNRq2A6mA0vP1XN
         kTjp3jSVcq4BVzD7sXbuIwuYLy8kWc332e2EdgsNpI8RE8B+w6tZMphz3Yxq5w0np2cG
         B5yg==
X-Forwarded-Encrypted: i=1; AJvYcCWxcu1wlARsNMiZyLjm2mtefB2WFRrQqf2GFWsUCqKK41swiDmJ/gtiC35jM/HLN2RwjVCL4tr/jOFN0rZW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp7ca/YBdOygRnm/H/hOeo6iLRVpige1ZdidG6Q+zpshOV2dy0
	EbA5BYfR26dk1gQ5npXk9AbM+5P03W6wNM1MgSXLCDX6TO8rjkEybZrdjoUgt/obmZHHwsP3NV5
	1NhWxjMmSyVmsv5f9vsHTvVrJjkvzIJfnQwpdKB3FKqRz6soVheb3YoKYvDsqM+Wld9Gl
X-Gm-Gg: ATEYQzyCB7eUFG4c94Ys1ISGYQ5FCIU/YzRay0k986yEFUpVs6vGbUgq9AQNiFms7cY
	2Gk2LLSAimDn9rjnjWlhvQ/9WUYCgPxXmjmlqbdv1dW8Pe73UenWEOXjXBCTA4nqLY7aHSOGUoL
	FkNr5E4rYDc708Ifn2Y56+Je98sHzgCpleb6j+1EReMhYQPlJcZjpN5KO6YwbcdKF3bLD+eG/xy
	oZjSt5DMF6h2bGu402kauO5fsyLoBpH9Rgdv2OdioGbj3n7S8KLDoJomEYx+TX0tdbQmGopC7sE
	slkI5vk/GTaxv/TDmc/czY8VMBF3RRpHnG+mukNvzPiEpev0AHNgnWV42GVsxk/8e9ZBD144ikL
	SlgND/nVZGdMtUzo4dqaMA6rkXAbJt4KFInnWI7GCSlpxrmI=
X-Received: by 2002:a05:6a20:3d8b:b0:398:95b7:c409 with SMTP id adf61e73a8af0-39895b80d85mr6432110637.25.1773130064822;
        Tue, 10 Mar 2026 01:07:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d8b:b0:398:95b7:c409 with SMTP id adf61e73a8af0-39895b80d85mr6432061637.25.1773130064307;
        Tue, 10 Mar 2026 01:07:44 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e195c40sm11121969a12.31.2026.03.10.01.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:07:43 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:36:33 +0530
Subject: [PATCH v2 07/11] arm64: dts: qcom: sm8450: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom_ice_power_and_clk_vote-v2-7-b9c2a5471d9e@oss.qualcomm.com>
References: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
In-Reply-To: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
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
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773129997; l=1458;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=niYQmVRxD31LW0CEVaaeCQmeMe417PyBECP1mGWfg5A=;
 b=HsW15hOyG7U3r2z0bpBA9Wgpjw/nsnnipS8qpEkjX95X4JsCfBS+FE4EuL6iI6mlJ+nc4ggkD
 2PrqP41BfDGDYBmancOzP/RZoRS+/cgdJcba0aCDvUhDHPSVLx8F0jw
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2OCBTYWx0ZWRfX9/+cXNyjRv5B
 kf/Kcsh4oezbYjo1uBXsmU4tXcVdk5qphUCGeWO99oOEDyS/UB1vkAj4I/h+9EVLPXZgTvOnOty
 Ng4cHFBlFz4KKYe3aMbxm5ye1itxCcpQsPVpu/MVovcbr/l+MKZmOu5ddBHAJmRQj4B/M1aE1mE
 OAaj3Ps6rZ1+BRgwsrpT2kUW2ofuKiU+DKJnE/MP/Zi1rA/NYTVusnWXLJYTYOoh/c5BZj9jzUf
 U4FngAiiRuyb7qsKyG+MEbEOHKe84s6QjEd7twl8/KtBix1UaRTVeJCBFXKBq88o03fFUd3nRE0
 h55lEjdncJkt7x1jODDE37tVVnoA7X93iYPAQ6upjHoy18CS0/omuqKHL4WsWhKiDGgeeaNGbPq
 cmtGGjNCw47XM+p4swX6YqdKOLJs1IypZvbT9ePYnYLZeMrO1OE9975dQS0dSD+kJUtkeNudqui
 8QHCWNqLiB0mABt5hzQ==
X-Proofpoint-GUID: haIKToiBw_bCSto5b9YN8KYf7JE40c5H
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afd151 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: haIKToiBw_bCSto5b9YN8KYf7JE40c5H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100068
X-Rspamd-Queue-Id: 61B772470E0
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
	TAGGED_FROM(0.00)[bounces-96547-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d88000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,1dc4000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8450.

Fixes: 86b0aef435851 ("arm64: dts: qcom: sm8450: Use standalone ICE node for UFS")
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


