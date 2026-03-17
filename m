Return-Path: <linux-arm-msm+bounces-98120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMg5L2QguWkrrwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:35:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 071F62A6E5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3483F309F6B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D2E38D6B0;
	Tue, 17 Mar 2026 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U63Og3Gl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EjQDyWQl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A4839FCA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739336; cv=none; b=rKKdOpv/EubjHs2Br8RGc1PjC76cLtYmSwCL4y1WqvZplYXA2Q7ZBICJFAN/M6UzHnfwDGbrmJ25PD/XshtKR8/F6+Szj7xpGuHWpdKAiFuq6D4z/mJSsYGMC3COl7gJxK8UpMFsfZ6ZjSquCz2jcwC9s8KEhwxNkHJdRpc0ITM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739336; c=relaxed/simple;
	bh=zUfKGirFr7TG0U6cUb0RW8kjlwT7PUFFAQGpnGGIbZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ec0FiR2K3ZADhbkq0BFOAaj2x43hPGvsk34xpdMu7WNrvmpeAi34oYjYcbnTWZdw6suEsKN7hRxRt40LLPPJghXu7EPUrqnOrlSWas+crP8q5JDErCmBLelUhvhfalM4s8XxKzeM8/hjUgS5oUnzJkwkofvnzYcefnYFMffoWD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U63Og3Gl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EjQDyWQl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7P6u92375146
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6lBKgDxYlBHzWej2pbhNBWHqhnNs9qiOdlqR4udlsM=; b=U63Og3Gl0khFP3dr
	/U6PVywHZet3B4xhgI1Ao1G3qDME3QfMlO2d2CwukPR/CP1AOh2ySdNT0DObpBpp
	FG1C0w8QBFGRX56Nc3yY6+yt+nDJu0b4Mo5LFj7RCVvF0x03IDsbHgz1jhsPr7f5
	t0kAGMxsppGUQmfKDc7lGkVGIg9KbLtS3sga0Hw2DVSvsi8DACMzDFvs2p4v5HaD
	sT2CVaxn/D/cdkoEvsAdOOO3dre3WZPIoS4S6HHuEH/jeoUMoB+cKofILnG5ly1T
	JuSvkI5WNa8XRGx+DT/Da6rr31DjEebdnqSurvLuC923TVw6ZCYkwP7mQbZPfMlK
	CzT+ug==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkby3jj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35a032cdd78so26785481a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773739334; x=1774344134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6lBKgDxYlBHzWej2pbhNBWHqhnNs9qiOdlqR4udlsM=;
        b=EjQDyWQl7ISxME+dS46slOhY3McPNNXx9Azd7N2ZsxSk4c/+jVOX/CmCuI7vpiwxKU
         2pHyz2kCEbIRMQU9EjdYGkt7jM78TZDO3rkxDSLDJEPfwlS5kk/PTk+aiwfpfUS/bgxY
         HLNV/fo5jnlPmCXsJgPxImpntWpmwNCrtuuAOsO4FJcyWfDpJPw/8vtsI8eTdbfpAfKT
         uxQVP58uamCcXi6UW76lIKj5lbTx7mLOKaonvKYbJqDAcDelyj3ivqhfaokJjzRuU/el
         dyOI+gKyXFd1bXYChPKBNL0U8d/tWPAWHVWV/ahCmHZPcUVrHmQMIfZ7DuQ0nhscd6Ip
         m4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739334; x=1774344134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/6lBKgDxYlBHzWej2pbhNBWHqhnNs9qiOdlqR4udlsM=;
        b=J+6GWYG+4GqRekHU07VJ29D1c9yDA3jZa1E/YEswgrK9VTioHHZ4GlS6UCs7lN9H0x
         wQQ2WqAkizUuqisXWxyDgXc2KRgcECyqyIn4Set1UA2yaCOlaEyr0VaBYRvJmBeh6ytH
         2raDs6HH+hfKi9vnUtHZWmJOZM2V5NGIT52koAzlQF3dgzM65N/ZBurct2b/mlZmj/Gn
         0ySKd0R9mgKa1sRJRxk24C+sqh8LmEgIDHapcJiEV1JPiaRI/JNOP5LDOQAXiG097SMD
         Dzh9oFbPC9oCG/vj1er2sHjhGoMJB3C7afGhIvieHqC159NrszbtJrQpw7tF39NXGoSc
         gIXA==
X-Forwarded-Encrypted: i=1; AJvYcCXcKGCiIDdYSv5bzR0GnN5cxItY+8G62KrSz09wy7Zs+orDPdCnIUnO/+tYKR9Dci3KAvjYPfPvYZAy9WaT@vger.kernel.org
X-Gm-Message-State: AOJu0YyBL2qa2+cCyQUaphGjQk3cdWI/bIP0kl4QWAe3e82W6KAC8QBz
	F5ejbkIuEtLp8Wfg6+8/zpApeiFBgrzhzQgj4gSTBulp79wI2YHdqg8UcccUmdlpcFHK2Jrdz+I
	nQ6FC4HE/y9x5yc8pTMW5A1flTc2NeE9l9JjprB/eqPZASJUtiAKIB1M6GtFYh7rqkqVj
X-Gm-Gg: ATEYQzzkxOrTObpvl2y8zx6DP8PhxYmacwZAM3ylGrVt774N47EUbqG1KiKeNiO37D/
	7o+WwL+IQNfJ2dRBAtXfQ95YUbyuAnhbRRygFjf0t3lds1Gi7RLDSe4zBbqIXa4B7Y3EDF1FZ8i
	VgfahlPfR57EXSWMb8Zhmk+e/1yqk33PwYN+IlXFexubHkHMtT4d4jucf/dXbpAkppjVdMyYkXk
	TDYAiSrlLtkBpB53EeIdZ3wuOGPRl+Hh46Lb68sY9c9vT4AwPDgzSvq89Y/g4HRcvGo7p3HmRBC
	VBC0eQNXAm+bEWn+Fe7wEYQMBYkxerbtiaTurdmEFO3oCDCWSNyzkoPxyV9eHp+T8LFVOicfWiy
	o0lVi9pGb3c4kgiuIM3TE2vz6bYERTWYHGWYG5GJbk2cCW6U=
X-Received: by 2002:a17:90b:2885:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-35b9b771ab8mr6839256a91.14.1773739333722;
        Tue, 17 Mar 2026 02:22:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2885:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-35b9b771ab8mr6839236a91.14.1773739333291;
        Tue, 17 Mar 2026 02:22:13 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcdaa6sm2331968a91.15.2026.03.17.02.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:22:12 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:50:46 +0530
Subject: [PATCH v3 07/12] arm64: dts: qcom: kodiak: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom_ice_power_and_clk_vote-v3-7-53371dbabd6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739265; l=1452;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=zUfKGirFr7TG0U6cUb0RW8kjlwT7PUFFAQGpnGGIbZg=;
 b=a4Xrxp7svox3j68gZ8iMgDE0wafE/EN/A4Y4REKcjmI9XTvfAAYBSDZavKD5clFCNbBZR2tjF
 UC4/2a5keA6D5ArDP6r217QHRLfk3EG14Pa2bldvz30ZyTVCDpLNL1Z
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: cK3d5yJPFU3bc-IByKlgcgBvkd4-Ncnd
X-Proofpoint-ORIG-GUID: cK3d5yJPFU3bc-IByKlgcgBvkd4-Ncnd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MiBTYWx0ZWRfX7Omt0sVq7A33
 6X6qCEfsWGBcqdp+1+VfrMhzkYMiYlTRqO0+5t8fsczs0ynGZzq/ygT4dJz9y6Jb0jiZ3wgqFqb
 UWl9tKLrOBxd1Ak8HNG8BpJQHpWhVT8uRIDnCH7Ve0TkteV6+Kno4FW6d1iyIaFGVp7wlApV+uF
 j34NMpmijj4CIzQSOxG3VeLR0C0rj7GdT5NW7NJQTtwis+Ppc9aEqTRiY7+amFc3KkDeCa3gVWk
 A8rDxv1YATptBvM5pqRIoyb00sv179eg9SHUnUUTMfIO6aN59s/jBfbai+7Eu5/ZKn/lKtYmnDu
 HCbJl1kdo2ImHm8pkYoYq01x80riC7CnSY/WsUmaxv6pdAvKySoiXMP5tNUN896J90mc4AY2OHp
 8JfwZRyBit2VOWNecNaLFm1bA9v6QsVoIu8nL1132r3jm/qQq8njl/Ph3YWX1e0K9JUoh5Ue9dN
 TlJN7oPcFRxjev2+wKw==
X-Authority-Analysis: v=2.4 cv=ZpLg6t7G c=1 sm=1 tr=0 ts=69b91d46 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98120-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1dc4000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1d88000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
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
X-Rspamd-Queue-Id: 071F62A6E5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
kodiak.

Fixes: dfd5ee7b34bb7 ("arm64: dts: qcom: sc7280: Add inline crypto engine")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 149954a3eb7c..9765bf361db4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2579,7 +2579,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,sc7280-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x8000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


