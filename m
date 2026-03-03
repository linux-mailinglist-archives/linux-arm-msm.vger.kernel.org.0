Return-Path: <linux-arm-msm+bounces-95183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKx5M3wgp2mYeQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 18:55:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2670D1F4D53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 18:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FEF93021732
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 17:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7C031A053;
	Tue,  3 Mar 2026 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n+yMv+sF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuPAJPlC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CFB36C0CD
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772560390; cv=none; b=cWojyFGLnLX6HqQgMnCxWV3/vkd9k6/wtZCq045JkZ+yf0SvYIAe8+TVrkypUAYHuVjITk/b5Lrd5HWjCkPb/WbUmJ87Pf09pp8kdu8ie5eol5JtURInMGy+KgKTotv9FRsltChOGaRE6jIORWOyt8PuRPwOMDK9i9owrWOvYKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772560390; c=relaxed/simple;
	bh=LcUdXorSQKOum8mcyS6fwQVfo2TzKtkC++TqXWhZVOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qBZWEFiAII8VvdkOk1/LnBfC81QAPO8dHBLY53G1gwkKfJzCmRgWazXpP/r9KVHW6B1DzLaf1wiR1+kn/8g8o4w8SWfLfxhh6C4UBZydc1y6V6K7QUZqA1SUMCBrbfQUxXZM+kG6glaMJbIHkIuXYum/YDuRnhtZU0qIqZ/GWmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n+yMv+sF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuPAJPlC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0fYo4030570
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 17:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDsbUq3AvZUR5IbcXutLN/Lla0f+TKTp7W+QunhC2GY=; b=n+yMv+sFDZu7Clrk
	K0EYGR8zgVSEB6QSdUTTN9ApRpvj2jOz4PrnmlxBOz0ljskZ7mBeph/MtwUA6jNU
	OGp5wJOOUvUBlBHkwke0PnWk2IphUl4UkOAMemH7Alk7FULF97qGjbfRbOWkQYOf
	PUugBnKqTHuQOnk52Zu0Q+CYvxV77OT4zs5H+KOyArrzT3pprpg9uhAPrr0f7YER
	BvxwJeDlfZEVNVg1HDhV8Qsq4Y9bqGR/Od8NPcWk6JPrRhkFgzeN26bU/5wU/qiV
	q6Prcyatux9MwX78JT5i8VrQq7ubDLlvxQ1T879Ps/rddGLCca2eddAdSjSjtWgT
	UYMfCA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu1xa1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 17:53:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4cdfc468so25899935ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 09:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772560387; x=1773165187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDsbUq3AvZUR5IbcXutLN/Lla0f+TKTp7W+QunhC2GY=;
        b=JuPAJPlCpkJfoM+rpUaVH5j7QcGMAJwSE0AuRWcVcNLYYjp6i2rJQbJR0CuN9mSfMf
         rFef0AnzcvTix9Quo84Glw7mBiDf1MHBB5ACAI+oX5Uhm4Va6tjXgWHy6Zyks8hDT1/b
         F0FcQ0Twyc2Him7BCEx8E7ef7zjq2MAxh57xseD/ILVa7GxYkrspgZWi6dQZh+P33Tph
         HdKMKbb4wNnBM7dyv/PIuEb0L5j0cLkRhULX9ayCZcEPsFxypJz5VuYcSSMHz4diBgXW
         cQAXagxolcxaoaoeVHLGPryAoDEBsZ7Vg/9Y4IRV0bAswuJev9qDiu+L2Jc75LIfh+Qi
         uFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772560387; x=1773165187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FDsbUq3AvZUR5IbcXutLN/Lla0f+TKTp7W+QunhC2GY=;
        b=kxUU4NdSk6aYl49VjrLvaKCt4WIkfJncM5fwInvc+D4JN34t56xgTRJSSOyQG7dlB6
         sKAOVrgs12r6Ci9DmKnhhsFdkNIF6Bieg8afBw77cuPTBrx+/aMYWTXWfeu+3XfgIhSN
         yAmpvjVw0hqZ6UZptFxzEFXO1VUIxoIVLaSEbedzy8OtXpgqQ6GvnbFbQKLYGJRqUPm8
         2pUkko9l1v3tts0V/xkULT171OW1EYmENtzV9XOBMbL1aP/H3i8aiMwNv3wuHtAWPYWf
         Rtv4n/5tH58YU8MJH3KJB2+Rtk5kT5n/bPBNQ2Yoff0EhpymFKE2oGHiKv840jw7FHwM
         +KMg==
X-Forwarded-Encrypted: i=1; AJvYcCXV7wd5pwir1X4ZnTtOSfZ6jLwdgpLPEmDbtEljlOp1yFp9ZqNvsT0xblSL8cKj4RrqpO1er0Pdb3qPH5WF@vger.kernel.org
X-Gm-Message-State: AOJu0YyiqnYNQXgEamH0t/FFGLGXuJU/JcWpM/GZnjBz58Oat3PS6Umu
	ek82l2AujYlFZ3d91rnQL08DYQ9L9ZyeV8QRmmXk0wjN7B8of7uJCHPiMLtxNPl6pv9NMCxuLvP
	BysLZc4AEO44imF4rs1cijF4h5TQbybETKPumns2tUSTCztTM+f/0TIpAnXcX45IO1psZ
X-Gm-Gg: ATEYQzyb3e264Dd0iJIGLuDWXj2HcHSMJbgvphmSUvAhK7Kazf2yl0wwCm2+g5uCyLj
	c+WmPwDU2sEb5bLzTEIQcC2+bt5GUGJVhgcb0h9HJFogEYjrtcJfJPEyxzn2OlN4rcmf/4gNpGx
	hH0MZV6P4RsNLIQ9MsAh1bWdjhExwQic0CotaGzU3NQFi7HZf8M1mScgTRoT60rzq5u+ZhTnhYj
	duBnuxvsE/ZH+rQ3I5uiXDWlL/G+aLET10YFugInFtStFdxiyKXwkg1b5peU/uLGLeofhis5CxX
	a0OOHY+vZVLl8X/VSO8ivoq48bAupicewG2oa4ylrYo7dpiA3L6TRv5Q+3IYpwCZFqft2u0wc33
	p4uOeDDe/nkmoHEl2qxjxjewonk6Z+WhgHUXj7otRI3WYVg==
X-Received: by 2002:a17:903:41cb:b0:2ad:9421:613c with SMTP id d9443c01a7336-2ae2e400d0fmr152405645ad.21.1772560386853;
        Tue, 03 Mar 2026 09:53:06 -0800 (PST)
X-Received: by 2002:a17:903:41cb:b0:2ad:9421:613c with SMTP id d9443c01a7336-2ae2e400d0fmr152405275ad.21.1772560386247;
        Tue, 03 Mar 2026 09:53:06 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3e4e34e6sm107140625ad.30.2026.03.03.09.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:53:05 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 23:22:51 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: Add support for MM clock
 controllers for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-glymur_mmcc_dt_config_v2-v2-1-da9ded08c26f@oss.qualcomm.com>
References: <20260303-glymur_mmcc_dt_config_v2-v2-0-da9ded08c26f@oss.qualcomm.com>
In-Reply-To: <20260303-glymur_mmcc_dt_config_v2-v2-0-da9ded08c26f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a72003 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-oN0OLM605FvJlsggzQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: oXYhNJ7GOlFhDIT17CN_iF33S290taqh
X-Proofpoint-ORIG-GUID: oXYhNJ7GOlFhDIT17CN_iF33S290taqh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE0MyBTYWx0ZWRfX9XTq41KAMKIm
 HEvThGRPtBhKkMJB1vdd4IWtUIr5wtfcbmQVudMzrgHWAZSZGLdDkcRA2gsUI1SgtwSqGKnGrMG
 8fm2rCJO5KW2VbLGKnYkhA2/KjxqCDgGQe2O5rf45WC55Aik3zV3vgYMjyDT+K9TY7v9GF7dWWn
 b6t6BHQVVkrp4JqNXSCvRIOCnzVu2sJ6HayACRNobqaPyCnTgzm4cDJd/YGEyg1IEonrWxowiPE
 hFu6GMEVTd+xTbseDaUCeyyeP0FPXf0NfUQaEJ/TaPB40swSlRBS72hFuriGbqotDFqyroFt06K
 ZU+2g8vmOCwovYLREiznwzLIjT68aUAo3GiwT87pQZLaWMw14DXI1pGcW2S4hgWW/oz97wlYyW2
 5BJsHca1Mb4QxO5evn171eZUC+L2fAxaLqroUazCnWZnMGLN6fbtXajvrjtYHDIlnD9294L1oN3
 OO5Mci8bVLOBAxMUhaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030143
X-Rspamd-Queue-Id: 2670D1F4D53
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-95183-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.30.132.128:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the device nodes for the multimedia clock controllers videocc, gpucc
and gxclkctl.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269cec7942c85447892c0661f83171eded94f3b..d9c37f43397f11a527279ee778769a2f09745bd5 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5,7 +5,10 @@
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
+#include <dt-bindings/clock/qcom,glymur-gpucc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
+#include <dt-bindings/clock/qcom,glymur-videocc.h>
+#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -3335,6 +3338,29 @@ hsc_noc: interconnect@2000000 {
 			#interconnect-cells = <2>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,glymur-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&rpmhpd RPMHPD_GMXC>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,glymur-gpucc";
+			reg = <0x0 0x03d90000 0x0 0x9800>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				<&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				<&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		ipcc: mailbox@3e04000 {
 			compatible = "qcom,glymur-ipcc", "qcom,ipcc";
 			reg = <0x0 0x03e04000 0x0 0x1000>;
@@ -3367,6 +3393,22 @@ lpass_ag_noc: interconnect@7e40000 {
 			#interconnect-cells = <2>;
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,glymur-videocc";
+			reg = <0x0 0x0aaf0000 0x0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,glymur-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1


