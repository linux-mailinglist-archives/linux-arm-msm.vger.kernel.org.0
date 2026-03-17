Return-Path: <linux-arm-msm+bounces-98117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h9u0M+0fuWkrrwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:33:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 652C32A6D90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 438F830970EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0681DF742;
	Tue, 17 Mar 2026 09:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TwuGoUqG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lc1tyqWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1A9356A12
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739319; cv=none; b=TpsQuew4qwg8HQT4UdX6dPLNAr4UD4mkN6BUEWwV33B4wg2/8WdDejVWHC6LaWN29I6yABvkWPVdfIlmbNJgspqVYWLEunZKcCYcMXZVnfV3ceojtJ+vv+HpjcNbw9UBFcBeeO+eCF0HQ+y43YaY5jRIatr62uldEvyGQZxmgwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739319; c=relaxed/simple;
	bh=8uK0totW+fO1QJ0dJXJXu3+dAqyfgP6uqq9AtSWKjgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p3sZze35Ey3I0HpOGaSNncoSbBiU/Img1wGhhML0GptzRrDrsTppDYfqzj+Aljg6aLaFHhURb6k3fB0URxm6g6iNcuBS/9c68RakoU8peXUMvRblkPuZZlDX4ELwelmdxrEF38lYUAKolM63Fr0hKdS6+Vo8LvSbq8xf9FwJDj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TwuGoUqG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lc1tyqWt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H6tW7b1639313
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HKkeB02/3Y+p8cra5GYHxicECKL4T4itHN6GbMdtRQ4=; b=TwuGoUqGQjR0qjhw
	FJ1CcFKaLKP2rAoe5JYhwdvs6xFT5LYKcBzx+fslhxkTn0Il4cOF6z4ToBiQiC6U
	2MeScNE+t7Z+7K2MTmwQdZhkKlhUCgwd8qGjHvWLy9+ss5Pe2IeCdIjwvp749h88
	xIdY4eg7MXNaaT7TGVFvFQt9p0FVeBv9n56sa95Qvr7RmLhUXFnUKKQifFBpkq4q
	YeKcTHN12d56l/zbZR+6UBV8X4c26H5xHV+YJoBj3WlQRAmGFou0MlCouIfs8DkI
	fAlkQ+cxUZvlFR3WSbE7aF/eRUrMuGofEoE+2tM235oTS9lSPb/12qZzpH9wi2Qu
	Wx6ZaA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0bjxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358f058973fso7171450a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773739317; x=1774344117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKkeB02/3Y+p8cra5GYHxicECKL4T4itHN6GbMdtRQ4=;
        b=Lc1tyqWt91QIbAOlS79TtXEHtsgHMhlT/Af1SOROIV9r1ehn1Pom+Rzi+4ls9okBk6
         e34+TNZpB2bWVAXKsml2w5U3ptZs3i7y2EJgJjiBKQxlA5PvLdNZeDMQR5ZeX9uT6InK
         h0WpMYgrI1ClNVPfd+sOEgEdQfozRBYfIPFMWZGVlKeq0YAWneocIPXbnz+pJYWQSUhK
         ovXV5X0IgpihAVIxsVubJptJ17PNTHTNzCkKTXKWdQEyr250ZwVOp7+t8rPEOpOV2Ekf
         dmXdFms0YDjDmLQb4XKwjHMYI27jczH6VsJ16n5CORDHHxqZLZdZDEL1ekFUO0ifJ1P3
         KoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739317; x=1774344117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HKkeB02/3Y+p8cra5GYHxicECKL4T4itHN6GbMdtRQ4=;
        b=FiZoVEC01stsv1LLheg9q93SGQfHVAU/tM2DyPX8w5xmGZSa9Re0zFWkO6e/JShgPE
         33KwHCUCXhVfNqWYOhLjjwuo73Cu5v0KULE0VBNQw8Eb/pFfye1RMUWvjnWyO6RWz/Nr
         CedehlWU2setXksryUjLpyLHhscz+IWNED4ydojGA/YHjbF7EPNi3XpVpqIJotXb7fAV
         Tv3MNE9MxLNWcE+lQkxs29RGcp7sUZwgZ6p9woAXlTKsPkJOVA31YeyYkNnlBPJ55OZg
         e1Evihxlyy4cRl86ITxD7JltsCYplb4bE1wJAv2q77mN79aTCDEq83kRu8tnSxMeX5Jd
         bW8A==
X-Forwarded-Encrypted: i=1; AJvYcCVw/mt/RDPf/tpD5cFgkQDdYzKu9uLPEBGaGlLFbY0o/FwjomouiH0hJZ6e2HoDfWAKgyIVOnWngcDuD3nV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs4+6ZoO5qMZ3bXWT6UhaEKzBCJ84metbkHuAN/RW0+Eei/n9w
	/k/Jvm4hFsAFNRUIvbFFZGUnAd6X8Dk+g+wbUQ4nBayG6a/fQcxXMon7Hxsd/3BHMeotixB1lra
	XYCock1PHc/rG7eJiYZxAkbMfI5yH1X6cpENgYVAjKoIwyeF/Kl12gobYsguF3K3xQ16B
X-Gm-Gg: ATEYQzw3W1qlhaWEEBugPWlYCXvL3JCf5uyVDYUUPfnY0Tq1/eKX0/Evbu7QZj4TnMi
	ZV5fQntOetKtN6/ZWEF6ZieUYS3JilOOl78MICYNOyF13NKUP4KZA0f73pmkrNnL6LvYpHquvjI
	N+l6gz+imb7oGc+rUb6Wv9Dhl4vpXOpHecCHrDqX4MZZCZjGH5qmwGkDUU23nZ7BYf3iHszexnh
	EcrKLJK3uRL9+Zq1Jm4OVqvZMFULsYqbw4HbqTYk3pCmtsLGApvo8lhZ7TUg0w5MVmrYRZPxShQ
	D1y+EZCdpfD+PbDLj+8hg7iuPCkxM1Kw0FYpQGWnlvkoRWPxMDk0gkf9SfyXl4lKBy3HuPFs4Yc
	0uV2V4ljW834SLRDTUfCZ6qJj/Zg7jnAqKL4yZ0JkUCEomAo=
X-Received: by 2002:a17:90b:3fcb:b0:35b:982a:28d9 with SMTP id 98e67ed59e1d1-35b982a2addmr7808767a91.4.1773739316902;
        Tue, 17 Mar 2026 02:21:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcb:b0:35b:982a:28d9 with SMTP id 98e67ed59e1d1-35b982a2addmr7808720a91.4.1773739316397;
        Tue, 17 Mar 2026 02:21:56 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcdaa6sm2331968a91.15.2026.03.17.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:21:55 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:50:44 +0530
Subject: [PATCH v3 05/12] arm64: dts: qcom: monaco: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom_ice_power_and_clk_vote-v3-5-53371dbabd6a@oss.qualcomm.com>
References: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
In-Reply-To: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
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
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739265; l=1455;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=8uK0totW+fO1QJ0dJXJXu3+dAqyfgP6uqq9AtSWKjgs=;
 b=ZaRitGJW72HEgnAkut96vqOlwGqBggoYgPpFP6b9sVn60d+sYtiUj5qMS6kNCdSVyFO4WNn5A
 dFs5Fk4bpbSAE0+mM46TLdTK0YP+QwAbz2oIhXPLgJnnpnxXZbKS7H2
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: Jsn2TVRrryNFenLfZgl7eFR6924l4Lj-
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b91d35 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MiBTYWx0ZWRfXy01DcFCENiWw
 r1hT+Cp7ZrjPc28XFgyvBOMt56jBSb2ya5ngO2nrk1yx33fnj9eEk+u0T4ttGk/PNCFC2gAeSol
 kQcXM76HdI5j5utwaDnx9qDmOFDA67nMNZGjwF5UVcULDEgBPgOQM29RhxBqDNWE15lk+d9tjtm
 GHqPw+jJoQUurR/flrFgphCPQMJzcofOEhaO1ujHwnZSqI9K0e/yJY+dGKcRLAtf41RoescrpZ7
 azjdX2z1acwIjWnM+YBx5NdI4nz3clD1+RQSM3UD08bvBGQ1u41ZK6HNua92AotrXNJ42VM/uSs
 CM4oeABAlZxT+8B2nWza9lkYV3v4QfQC7DHJUViV45GI5amSOZBaj5pBHdLpc2CvnjhWa5xdNXu
 YWvnDhGJyjubHDX85VnJOozD6fEnjjTCWPTiIjKGiHu/W4C8xXZrvVXoxABX6lVPMmIUg/ZVxTj
 VPZ+KWVFYpxAarIh1tg==
X-Proofpoint-GUID: Jsn2TVRrryNFenLfZgl7eFR6924l4Lj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98117-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d88000:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 652C32A6D90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
monaco.

Fixes: cc9d29aad876d ("arm64: dts: qcom: qcs8300: enable the inline crypto engine")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index f92fdb1cefa0..e408f102a8b3 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2725,7 +2725,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,qcs8300-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		crypto: crypto@1dfa000 {

-- 
2.34.1


