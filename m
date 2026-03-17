Return-Path: <linux-arm-msm+bounces-98124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHUPBFcguWkrrwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:35:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8594D2A6E46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C015330B85AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1806D3A2558;
	Tue, 17 Mar 2026 09:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CeOee/sG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6L+jZO9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6BD36C9C0
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739370; cv=none; b=DyMCPFRH2Mwd+Q+gSiDAplthSqe4s+B3P/AX8uJ7BZ4kRblT+HN7a2tOM0r5rQTY24qMCCenPOOPJGRk9CNSiBlWiT3iA/5hTKwxuvuOHtlQGzIW41TtLoAWPEwt07E2E4kWwgHkDkYvZzIwCGwzrrz06dPM8x7pEMuGc2UWhvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739370; c=relaxed/simple;
	bh=pGdwSBuA+w0A/TFeoG9/2wpNf6UWc6RSkzFexzGtbzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JiGGhLMSGWkYJfsOfKfNB7XFFNtCCty7ZdAuyS3mwM7fWSYQaPDexDx1asXPXBht7Gm6iyvmpAW7etKbpVKd4q4kOn0kZXw+rdutGGmzmgS38MKLK8rnlKeI1PHNkga/IqAcexziAimAQp4dxr/kv3fLeEYib+zzT3ZwebKlw6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CeOee/sG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6L+jZO9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7RIdA2906068
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vSM2tzOh8gKHXyh3ES9OOyv9+idtbwW9v6rQcAEw4FA=; b=CeOee/sGVDSskamv
	AqYEv676TnDTUxiASINvrlbaVyAE496ir4jHqqtaAAvun4leKlKV6UHyclGipxCm
	3+OsQjnz07PtEyd0hinyJTYRuvhpW3pnb10bojy4eGJ+H2/5Gs+Ow58asy1rRclq
	8M5j3z/Wq1m7UjqTLM1Ui+Np3HvXQR+Z1vlwFVBxmEhA0IyuwCwEvmrx5Ep13U00
	iaAhmofep3O5V/FDP9Uw+Alzzdiqy7tFOmyCH/RrsshmIsRZYVt5aM0fcX6lTcZH
	IXzeiBqWESZcf2qYBk2FgsQZt87dVLUSiYot+hseCZW6NMy39EL6ql7bnte1uFWB
	A2uIEQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxgeds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35641c14663so6387902a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773739367; x=1774344167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSM2tzOh8gKHXyh3ES9OOyv9+idtbwW9v6rQcAEw4FA=;
        b=J6L+jZO9fbiUPwRHyiXLtmutJ5jSLmgGvBlKJFtWq2GlELL9vvrmnJmPV475QpBj+v
         XHyV589z8/u2Q6Mic8MjdVrwg8RMK5PN1Yktst7Qkd2hWkEHPEh6ZVlqhyLQk4KbRvxC
         W9gkn38tdfoL6BgBkfnTMkOZOQ7JFJuBUWOrgBrxrWZrWjjVTnh3NvplXv7yKJ3soK+Q
         /M7T1vksZpPLCXaCd55cwo8Et7dkzoCxMKCHd7Q8+lIEirPIfHoK/cBroZXV4fWJchNT
         joq6aCD609mYImxhUPxXH2NILn0YSs//1rAmoICCb1/rAkSYiUZkyLICgpDsMnJ9C4lU
         5y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739367; x=1774344167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vSM2tzOh8gKHXyh3ES9OOyv9+idtbwW9v6rQcAEw4FA=;
        b=JF8xnlHOKG+CZ/HdfR6a4GT1FJAkRNAk8vTPO+yV6OSWMtW61J5niXqPjZsFBTbXVO
         hvOewODGORcQ1pbcoY3X/L9UKe9FX1wtv+3JWvgh54XcKktYV4EBDr6S6BJTYuM/ZYdU
         LDtfYI75X6L3yNbykSWcW40182jg8jMeniajdlbZrhijNctnq3xh+o8vRuxhI3IeQpiX
         i6C/ePaCKmry0xTe62LQ2zOC0xLgauiFdGNttahqxyFd6Y/lNOtB0607KG7X9Ah1LmRW
         lV9Qy/VRUuwRyDk+9WrEADhk5mtnqHVlRRS7D2lRJ7a9z9y6eGEUhLEXTL+xuOBWklQA
         LOKw==
X-Forwarded-Encrypted: i=1; AJvYcCWmgwu0s9HKi8Tf+MNOrRzd4hDK/ywP1wa90XNoU1hopDreCHcFFaQYN+2GN2y0RVFDDf2iMw6wGUPCzauj@vger.kernel.org
X-Gm-Message-State: AOJu0YzHRyicls99CS+f+6M0ZK1RMygxeW/wk1FcYTsDGOF+V+9dN7WP
	Hvl8+Qc46n5BC3lQiesQCE8iLm5w+pSAMBSlkwgLQIES90+Wj8HI3tK57hiRjwRuU1un5aNjqqd
	yeOphO23PNIE1vZa+LoogftVJ4If7mB0NFfEqGy4M8WDJEXFiTVh0C75Xv7F1x9yYuYPQ
X-Gm-Gg: ATEYQzzGpdNDHCh9/X/Iu1/1B9Nxm4kVOr9y3WNxUgHGax/nDBHMRktKZmBCtGqR4PT
	lBhygNJp8nGVkoXx6GTKC3NjhZz3uBTp1DrvVEzOZ4NhzuBOfkJkP8hsg3aCCGbH7IInHPNPkxY
	Pz+DLNzSQ5ECjvHeLzAMF5v6EimQRrld71btcEq9LC2hitMI1Trt3mXAUcRrsRdVe3Lvdo3vhKN
	Cqj13lnwPodNc7ifUHNY8ZfHJOwxs26vPQN3I5F2HE4D5r6KMC9SUjeTkPG8oQyGKmprbOuEiTc
	Z0Dd+VRPCfjcps4MKAla+k4kS0HLZBg6dsl1vQGjq5G0EqSnzp5RFyPKI3OC3quxiksniFQ6bOW
	i/p8d9OZwqGyTtjEWA8RisyUPexC6iaOqUdFPED2kFUloOZc=
X-Received: by 2002:a17:90b:4b82:b0:353:356c:6821 with SMTP id 98e67ed59e1d1-35a21e460f4mr14293831a91.8.1773739367465;
        Tue, 17 Mar 2026 02:22:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4b82:b0:353:356c:6821 with SMTP id 98e67ed59e1d1-35a21e460f4mr14293788a91.8.1773739366935;
        Tue, 17 Mar 2026 02:22:46 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcdaa6sm2331968a91.15.2026.03.17.02.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:22:46 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:50:50 +0530
Subject: [PATCH v3 11/12] arm64: dts: qcom: sm8750: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom_ice_power_and_clk_vote-v3-11-53371dbabd6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739265; l=1395;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=pGdwSBuA+w0A/TFeoG9/2wpNf6UWc6RSkzFexzGtbzo=;
 b=RED4vcGcO2pv+Q9c7AL54C0M577HAoEvyt9ZJFBJIYiKCKuqER5RXRwC5ZtpRqMgJfJz+g/mS
 jvn8c1ytF9iCxgTMgIWlnI7f9Rhw+0wbJowJnF/B71b0LCny6F16rPF
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: rmW_2Rq_TLRf60l406teJtNMCEkF6_65
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MiBTYWx0ZWRfX+NNGZEQr8yAN
 UbVVeLHWFeK8jo80nHqPdYmbbnLn0BSBpneARONJmB9oUFLPtoMPT6Brxkyb451jvqHLTrpyeN1
 +GELECu3PWjiICGmU1wLl0E2zqwYvpU6NT/PDWtCDM9daWKs7qRSCAZvca0C4nYJHNwFhDajUih
 H2f1FNzinov1lNxrNkNqtAvaim1QBp6EeF48qLgihFUpoejxSjY57pELujzOoMyluLhO6tR6Lr/
 ER/c3NYRR+di++7HFEWOZNtbWbdn7Zlsbu1nI/a8Kl0q51HshiDwDZPeu7G4tUwnFldZUQn9HT+
 tSIx5yB0Ddl3A/SI5QT9G0538Tg0zk65chiumruBBPhhIKpPNSymcqI1qMnJqBKUiOh82YKFbIQ
 oWjrL8ofh+nbJHVOaKKkaFUhFja14BI26K4bZVQC+KwHLTmDdJ7MMenCcIrOsGYY0N/QvW41Lim
 j8zL0D/4cI9bDTnQE8A==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b91d68 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: rmW_2Rq_TLRf60l406teJtNMCEkF6_65
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
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
	TAGGED_FROM(0.00)[bounces-98124-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1dc4000:email,1d88000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 8594D2A6E46
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


