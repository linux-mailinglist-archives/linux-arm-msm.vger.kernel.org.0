Return-Path: <linux-arm-msm+bounces-99147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PmaLH0GwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:23:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D76D72EEF8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC1C3302147D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F057386C27;
	Mon, 23 Mar 2026 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eBGH+7Dh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnCWwb/j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FE8386C2D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257567; cv=none; b=fusgqFYk1yD+repoDJoVC801+27N4wf31uRf+qVm+UOuD2cC+LsGHUnDid9TDZSu5yzeCq2ur3ZIT1iLgkxYwOQ69E/ufhF+w7pjAJ1DEOKObtFpJcJH+Xz6FgD0yTaxwH7R5Lscu6ks5AbmC+5d41cUbMW65nwXacU1SxiHq/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257567; c=relaxed/simple;
	bh=wxVSM1cYZTl6y1L3GXr9bkltA1OdyoyjM33HQ9eQ0kI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYEG5bswSqjHMetaB6RppQ5Y2MmWTii8Q5cjjUOb2w6h2NbiFowT5SWLd1sb1d+iobtHxT7YuGkHtr8jK/YZ1KuTMc3Z5JegbZzaHS3JBHlCfZXnjCUZYf067ftYZ4pxIWMdC4TGBz5blkLlHLVRWkAL5eHc4u+bpW6n05jcR54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eBGH+7Dh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnCWwb/j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tU6T1627050
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exWlhEApYdywyNwd+GmQdD59+nL1iNRjBE2wEh2mEWk=; b=eBGH+7DhjUs8YHvm
	f57uM/Yp79YWNj1knWOWUkqnSysJs80rAZZF6QSxRBtMSOotTUzExE48LfnR9VTu
	e6ABvcvBL4OjWTL9Y6slP+Qy54MxeRSBz/JI9KOoaRonbGMI74cDPOo/vfVpcG6D
	b7zYRWZsVSnNhMofPeAop2ll662LBCoeY+ElUY4pgaQjUFmFmQi7WrfYsyA9/Vnp
	TpeMS7VxPzieIqvFz/kbe6BWnArI8MRIqBV8WNuYQaO4iX4N8QL2K4sMr3nyAPSh
	0lcWheAiJAhxUGY9xuX2QgSCepTnGldsv/o9encg1RdPLGv/z+UTcDfGLF7BuNIX
	9357KA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc09dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358f058973fso5740490a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257564; x=1774862364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exWlhEApYdywyNwd+GmQdD59+nL1iNRjBE2wEh2mEWk=;
        b=MnCWwb/jQdevjK7GuDd9F/yMybhi0LvSF9fx0sOJqmkm89DNrrWMKJaGcjKwFd1A6A
         PYxps9ELBPnLS8uNDpz9KQ30G0kBCnpk83agOoOnm0jDxH7+55C1GwZ/S/V3pBfNSeM/
         jbcIw3zYDOVhZpejmVJUz94kjiUG6+/kj42ADP5OrjXbJbedg2PyfuPhwEszjfo2tNBI
         +gK3NdbsP8h2LqHg4bHmif6d/gFvDdW8bTDUBQxkRC5B/jgKLwB0pdwcfA7yyyf7eWl9
         rZthJlNk4ukAhzycYyVgmYnpUybLWLyvsGgJM7EUqi21EZRs9UtUXPXJ7JZNnNNwVrub
         KY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257564; x=1774862364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=exWlhEApYdywyNwd+GmQdD59+nL1iNRjBE2wEh2mEWk=;
        b=qfug6LFshoSBV+AGgLJxF6195+1N3rp+HhPqlB4YWhYFj6g95vGQTKKjXdgPqTXO3s
         gJ8kFzewVPWDvLH4Z+AtM8YJMoKc4E5bvibzq8+dK7wtbVHLJSAe2+JfTdwUjj3S3ITk
         EapJcZQfdFmYg633fCSJuM3zGOkIOf9YkSDDvT/rRCiQswOSGu36BWMzmfetwZu1MamH
         KYLQ2fRkJnFE2ynuy++P1d5KUnqkFiWRssKslY9EJHDR+GbZZ8ZcpZbuL2rA6s9mBF7t
         wwt/+habflyvHQfquHp+6cLldCdTanY82UdYhm40lUYs0XK1pRgmzTc+5QIFBnw0NhgP
         e4TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuCAvi2AAxrC/4auEAXifUlLjrbPVLfKoHl2JieaZX8eOi3+dDHNFA+JzggHMGPdRwevih8/skMxwl6Qpc@vger.kernel.org
X-Gm-Message-State: AOJu0YwPMaQU9wHOtr1wM75oyLqXK3vf/IN1bN3B6b69VFWySPHgo552
	vVZlGw+oL4uBBiqQoCC4oIO5vfQqpCm7j3zK4DvDuXpZmGh8sOWxd/rtRTSX1YDvY5oYG1ZapuT
	/oBM1yY+7+j7A7ab9znKMeVjhU2roX2DXBcXokAt9jiCe0TZBcbZGa1eBGoYolqkqo3pX
X-Gm-Gg: ATEYQzx8blVnCkItUsciUChM4AFOEzPUehhvCZHSWzLmJwj7xlcNGsLrFthF3ylYA8k
	aoUS1Cbg8CovaLoZftL86bVyVSFPt5hsSs5vQKQisYBNr/GvruY1xc9e3ct8K5G5XUcubyCHAZ2
	AWGe56xbcH2WkcT0/rDofCi6x5oPQYSU9pWYCKb6H9d4c27MFmznrTyPFRBrMl1U7lKf2RAaViJ
	SKUYWPUP/N7zG2FLquQ3GQks3gL8UyUJn2+cN5EVRMH+1Ki4J0cTPnGIhz+Gt886W4G8YKVRe88
	p6Zo0qcqX0NATf2KI+N7zyCG9fOF6+mHijnE6vR+0u+2m+JKdogtKnd9+YzSRAxpBlk0wr/9VaD
	ODxE3bOg2i3zSCMErjtoEMUeJTxUXu0v3PfzVvr5KAZYlsZE=
X-Received: by 2002:a17:90b:2885:b0:359:8abc:b348 with SMTP id 98e67ed59e1d1-35bd2cb2af7mr9861357a91.18.1774257564506;
        Mon, 23 Mar 2026 02:19:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2885:b0:359:8abc:b348 with SMTP id 98e67ed59e1d1-35bd2cb2af7mr9861319a91.18.1774257564026;
        Mon, 23 Mar 2026 02:19:24 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:19:23 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:48:01 +0530
Subject: [PATCH v4 08/11] arm64: dts: qcom: sm8450: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-8-e36044bbdfe9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=1507;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=wxVSM1cYZTl6y1L3GXr9bkltA1OdyoyjM33HQ9eQ0kI=;
 b=pUdOurWSPgpn1ni1io1/UnjF0vJ6gZka1Qw0Rmj42Wy2OqGRU01i9289L1PtNwdkUZDvqQEzm
 dTS+THhcD1SCjaGhNMrWXhI8cl6ELNkDJDNtmRwH8rdED+KFm28jL/O
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c1059d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 8BN_BA4FVe-MHdjoaqLCjejRFtrDmGh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfXx8y8p/Ad+KPc
 jSeITfMSwpkRzqIgGiMiwBeRJO7lnpqx9388Qkb//rKJgEbIeh82RBDSvauoHEgT0IJMm5EZorb
 oymFmQdzdGx2osyDa8hIdy6WeRQ+tkoHLBcMdC9o+gykb7tl6ffQKvgPqUYWYT3qMpkfYFEp/w3
 kF+TeGUYfQPgB2a6ADUQCsJG6YvNYMFkPjjnlYsdkU5DKBu5NJpgS9GjewkKlylZFcESNs7MwJx
 LqjF2h4H4eN2FgEsJzg2MQ92TGHVt/2ftqlZv/GInn5wd9dRAQqGSW0W+F6P5rLMAKHJkyf+PEI
 7h7Sz05HSElhunfd0eI0SToRd0dAtOlIsnoXsMnhjneEL6g7mTOR4KXVznR2ggV8PPFgbqcY86N
 vatW9QJ7sdpHMhzkkOybxGwfCqjYoeZ/NO9e0D1cdblmaFYCXq3f05npeh/MEMCM9iIqopW1yvV
 HAH60/hab1Jc6GL1OpQ==
X-Proofpoint-ORIG-GUID: 8BN_BA4FVe-MHdjoaqLCjejRFtrDmGh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99147-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,1d88000:email,1dc4000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: D76D72EEF8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8450.

Fixes: 86b0aef435851 ("arm64: dts: qcom: sm8450: Use standalone ICE node for UFS")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index fd2d5648b92a..0dba282d644d 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5374,7 +5374,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,sm8450-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x8000>;
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


