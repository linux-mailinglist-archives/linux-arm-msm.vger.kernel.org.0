Return-Path: <linux-arm-msm+bounces-99150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JWeLrgGwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:24:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F9D2EEFDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F0E53032F9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DBE38759C;
	Mon, 23 Mar 2026 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kddp+ydx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKXNudTU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455643876AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257595; cv=none; b=q56n2sHQIg3LhxkBw4urIgUh/xqg/MCMAR96LqC4E9vRLKrlTjK+I31X4kSsQSgdDnz+XDp4Sass5Bbo5JV7xMl8UlvjV50nQuqwwjttzfOa8bldEP++7xaDbJdj1PbqRohJEYbaN18g3lJDZDrKNuS9Wpl2MusSJGfqoYscoQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257595; c=relaxed/simple;
	bh=4gCokkHZ2GjRf5B+A9Zqx/4PsUp2LAmyJ4JNgVsWI14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CEo75jdAkj+UNTMXOg9yC6QgnRe5gxCSFaTMhYAgUR1WBkbfwpGnFossQglV3xH9mgCOThwOTvlcKA3KJwH862KatKNl7m3baobVSlOLhA/vRgqSQzyWL3V8UirjxbhK7qDBywjbqolYFVkfFkd0LCpwjAHb27pgQ2xrtyi34QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kddp+ydx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKXNudTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tkCN1627278
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zpbpg0hPnfQaJ1hYQGaQ316b4Tnqdwkw1WSwGLLXo6Y=; b=Kddp+ydx6NynhTSU
	Fnn8ufuOmm5/WZKJ69ZFHmVLX7OLuY7EZ79mFTuDVt2zs3XjC5Vm7BIDUI8hXbRC
	FUAjBi+BaFQhG5uX+rRdqWVZcG6b3GRkp9Zlge/TpszsfmMEqiW6oQpms3IyFgKh
	6fdwj04WeicsYbcskgGAaAR10m9fzW/NCiZqU/x5K8L3q8iMa6QgNQOkyV43m22F
	YEq20AKdqOpGyoosNBt/G9U8ZStB2DVMPUDcLNieIKw+iYuW2ukmhCOfE+uPGRKa
	0A23Tm5UQN2IPav7V1sUSh8h/gyyuCi5IwO5Z/junGeLez7CoK86mskz6OG/1LJQ
	m6zQVA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc09gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3595485abbbso5413657a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257592; x=1774862392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpbpg0hPnfQaJ1hYQGaQ316b4Tnqdwkw1WSwGLLXo6Y=;
        b=CKXNudTUTvvT2FPnw11mj9AQaAqnNnFkTQiAn715iVftZ/3HiXklxmZaeRJwQqm57K
         Ezhu6kgPRlX5af54eo3qlrsXnqH/taM5In3c8k7Y5RQJblbp4TBsXxkZUONwkxphsR0p
         QUHcLMOCDoKVi1XvBIALYc7+casD9WIyIENFLWxUQdBbBMGOaMR+xJEmjL5twaxlbVza
         FR1BifX8qqFd9vZ1TAxikLiRXMBjGcA4UlOKElobIWvwjrBorqmSf1Z+WT9yGP46Bo69
         gG/Th3zevvNpkVOVIIIWvIP5/YfSch2dhwCvJ6wCexj9PV7f41209HDuycx9nneu1UKE
         IUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257592; x=1774862392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zpbpg0hPnfQaJ1hYQGaQ316b4Tnqdwkw1WSwGLLXo6Y=;
        b=snt2paOPoxecrPBetUE8rphfg+sxiZsFIKwMNHM4dpwd/S0vZfiwXbq9B7neRhKZBH
         9ahQnQ9/cV/CjFLjeYKUWQfDKz7HfLiCC7zmt2vS8O2zcvhR8Vt8HafCQ+ITDkeP1Re7
         KP4XUoJa8XfN+3nkEiK2AEdWDxeq2k2vy+VV8WdSIZKAuAEvPwXpHOd8ncr1bxHWdGoZ
         sbfYEpV6QDxKjtC362NqcHSkO/PqBKuVYXqdghsEXnLSJvz4JBlRzpD1pkefj8KzzdzZ
         2mN1V7ZBlF3dw9rE5rnTt+slvyXo0cjCa2H4TJJD4UfkOW2DupmTnOdS7GDc04xP+++b
         fIaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiG9LORtX8QeghNW5CWIPs4QFRSnERxUiyPrlM0yYnEXrwaBIMj9U53x3RqQBNgudBApwF1f67srJtPaw1@vger.kernel.org
X-Gm-Message-State: AOJu0YzBmN139KxsFr22CG/P8aHJTfXAg1afRpM1KvQ7Sl7mR0SeuF0v
	WMtNRJcALa2KsVm6q7VV9n13FCmUzeodcr9XbWDCrwjZizzEqWkwiXi4bSvUV59AAoMXpnfGP3n
	TjrMvO2EMgNmliPbuLpT8psmNyaG8KkHmX3kn7Yw/PXmQ0hXxSYr3IfT32tkJ/gpPz+oE
X-Gm-Gg: ATEYQzzGjJGIy8GvK0THop9122yIxr0mXrUuzbBr79BAqmwbu2H6dNQMsyHsbDsYe6v
	sjy6B7elCjg5ed5zXT4rH5eHqApiE5F4ho95nJzVxXqEgwUxsXM2++ps6ab6lQdKlzFNT+RAjMB
	ICL8DzHWKbd2dqgkADNIoazCc83skaPnZ2NANsfTE4iGQmXW3D4/+MXXgSWQ6n4Axzqny9kJ6oC
	hcKLKlseiPcji23oH8iub0DuG68dn2hPlqOxF6HQNA1/aJlHZhS8spgT10nmTAAcVfAC5/m6Jxv
	czEvm0D/gEcTyGd/o2AUrHzby2dQFuGnRrcyb+k8zkQ4IoIw/KfbPmn/5e2+ugyKjKLZMgBPery
	hrQtQg7HbLF7IHyleYNevOo5xPRwQE4O7cjsPp3kAwjV5X9A=
X-Received: by 2002:a17:90b:3d85:b0:359:1063:6aed with SMTP id 98e67ed59e1d1-35bd2cb3e52mr9251832a91.22.1774257591869;
        Mon, 23 Mar 2026 02:19:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3d85:b0:359:1063:6aed with SMTP id 98e67ed59e1d1-35bd2cb3e52mr9251785a91.22.1774257591273;
        Mon, 23 Mar 2026 02:19:51 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:19:50 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:48:04 +0530
Subject: [PATCH v4 11/11] arm64: dts: qcom: sm8750: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-11-e36044bbdfe9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=1456;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=4gCokkHZ2GjRf5B+A9Zqx/4PsUp2LAmyJ4JNgVsWI14=;
 b=RswpYVENgXtuJbX4xVStbksk7BFMx7jSFT0f1TB6KQum/olhlBcJk/LgtEnVSjBqp2WNzexDI
 j24z+9Fl6TJC6vKXj+9p1xre4eFuyfcqRcwxcl1ntu5GX3AGZpbp+7L
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c105b8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 3Knfs73MnLKydfQm4gWX9HIbVXb5HXY7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX2lzC/b7B97Ic
 RpXT76eeDH7UWhz8dM0LJrnUkXUxh6FCieZsRCNYiAB5+oFwUhSfVP/nxxhRe55nl9mZivSxFcJ
 IRh8w3pVtqmaN3Uusb0vfd1lK6LYWM/9g31rIFq7Kc2vmUydHm+UXlanDC4YgS98WfrybegTbmf
 DdBwe9Cfbw/ztWg/sLHb2cFWj2p1h3rU+y/z0SshRKhAvjCiPyacFRqU78ChFFXiDqV3RJ8rSY5
 az90ZKk7dEHJOANO6Fm6JDJrBxbHfSpMDFXTC/uITnau6CP/dkOzAm2s8e5g6XOB+H2LF6Too+M
 ugFHFQrq0dkjWgZR2g+l+GURmGsjI+JdLa7JaWs0Ppyk5pXgtQAg653tl7dcqU7JzhiuzRqeOhH
 DbvVXnltAwy9cEINNBTLxTmEeBSQyBHC2qBiroyuCvuURBlQz+jQXlmUBHgARM8oP0YdZz7NCFc
 h3ULfolb9AS7iIoh71w==
X-Proofpoint-ORIG-GUID: 3Knfs73MnLKydfQm4gWX9HIbVXb5HXY7
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99150-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,1d88000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,1dc4000:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
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
X-Rspamd-Queue-Id: 67F9D2EEFDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
sm8750.

Fixes: b1dac789c650a ("arm64: dts: qcom: sm8750: Add ICE nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f56b1f889b85..8c33bc3620ef 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2083,7 +2083,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
 
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


