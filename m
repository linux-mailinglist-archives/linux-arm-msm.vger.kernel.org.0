Return-Path: <linux-arm-msm+bounces-96652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDsWABgmsGnYgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:09:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F1E2516A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39786344A3DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00743B47CC;
	Tue, 10 Mar 2026 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myCLgkLt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmFGLOIB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEC03B38BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147829; cv=none; b=LzXilXLZNprYW6xfLec5Fh3NrSwQZ6vW54U0A/BJJjjWRK5QK4lXM3YpCIAtxLHEhrL2qWCZGhegF8EZjBik7oRwJLFWbgSId493xTURxhofj1z1HrFvsyw80Vvthrfja8ENv9YRv+WBI5UC3Glk4duwTblhEAE2KwxJcCnqprM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147829; c=relaxed/simple;
	bh=2T2gETQgKV1lswCYgYKY5yi3FFU0H5AjeL8cCjnIbX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlbMx/dDtmVVtQP3Pv8eBqqp1YxuCcb4MlAL64Y4jTkpzi3lL/DpnokmeNr7c4xOPYhAMI2WqH5FOMEU93XORjc/HyMa5ibITSHNidiEO9op5b7PK393y1FLfyD3XLS3QDd2inKPiBoZzHLnZLGrq0f8rzWGNlASsd0YI7GhGSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myCLgkLt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmFGLOIB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACapYH790196
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/bEZSShirNOQTesuw4xFlHLWwBUNdgMyfsEIvQ8fcpE=; b=myCLgkLt10C8MNqM
	KJ49kfg42zGiX58UWfNsypR5nZHET8TnxdSdGyM6GH9D9GRQVAu4ntR/TV5qF3ym
	nDQ8w9z5IkiruGuoYAuc1c8/cHnXVNkdml3K/wv4mgLWC5iFK5200r8Egjy7vy1J
	HqDITTU8Lb+iS9IWEt7KOrbwYyb1g93+75o5b4r/OVOEfcNiiMC8IIzwqgTYHBG6
	O0XnJ1WyF/BBNiH+kTQ7YpFmHSW350ruzT9bzLyQkU6131Mi+R6Rml8ui33Hfihn
	rNbfkjCZUUNRwQy+MYWwJrqn4QRgN2OFg86lk23et6fxT38UN4sGXMWSMCUht6nq
	AO3jow==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekuxuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:47 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94e99ef0150so3812005241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773147827; x=1773752627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bEZSShirNOQTesuw4xFlHLWwBUNdgMyfsEIvQ8fcpE=;
        b=QmFGLOIB4dA4Qf07y2ZNl3QPdztTMV+1Vfx+yYimoL2sMReMkqEX0G6T8n8AoaHKpu
         o2f9xYZuWh4gTXsD2yzc48u4asTHjVOQMwac+kMViA82to7X5njBUAx0T+ReDApQrqjD
         fdd+njbbECQIW6IKSCADc7WGaTPPD7BHGu0ZNL0AzI67wWZe2CBTDhmZ97aYwIbcs/Kz
         A9peucQAL1Z8JlTKwFtcBBwGeGMzCvSiHGBUSalSISu5dht+D8KMH3gCl1c1giYi0Zzb
         2KEngqQfoLRlQluTPgKZwFTqnV8qMiPprXXevO3PLoJHpMIb4QVb1kQ7mzy8j62394c0
         A3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147827; x=1773752627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/bEZSShirNOQTesuw4xFlHLWwBUNdgMyfsEIvQ8fcpE=;
        b=A67mj4/OdXcx2Q6bdK7O+9sVHFkNWOGPMGW5LPpfK++2Rk6R2V0t+Khk6sSh/bykem
         yo/hs/bTTI5Wvk7v/tqvUuIgHWhDPP+Dr6PD8qUXVI0TK50b5Yyr23r45FR0sDIpa3nl
         3ft9X16ImLtPrfFhBohxDyJAIaM9nHE8v5lZtm1eFeaEcyLypSZv06ezAoJefPBqgMpy
         uRCa/nxgE7GxLqJxjum+kv+b3YRL/S+XM8jHLwn4opQ4N7K+rhUney9ipJ2I18Vw3tX7
         K2JGuzpbh5WH+Kla9GZhZcoujfxpqpQW3nLdFQJYDO+7YHwpxrJQ7FEsdsJyuSyW/GRq
         ht1w==
X-Gm-Message-State: AOJu0YxRBJ3rGcecZwftUx4xsDDq1eK93U3KsgWXicK+3WYCpT1JeLYm
	dgIsFMcE7UpdJht6A8wMp5nc1L7qcvaVtz/SXt9mvby1SkaUz9LPwuevDSOVmc7oKscDeP+y+mH
	j+RvAhdm9XQS3zGvcggvGO153pY6rWKqpO5sEnLUg8wnheEGwsmsG6q/3vk9ckCQqKOsb
X-Gm-Gg: ATEYQzxTvmYHokc73h2sQOBn5XF3mQ27hmGU+kX9muU79EG499kKKPEZskDzI8SrAls
	44DcDbj30+UbYG//1g504VIFtN4fWrWqOYgA2ZDTuiugs0s+kkJZ56b+kx2Gh6itG2n0oOguGik
	0wjia9CDyDf6919KpNq/Fd4fZ4UtBJuutO80u2yPI/gK9OG5jxcWLoiChUI9jJSEfz6Hnt1ESLE
	6OZV9iilC6THxByeJoeq5/9YD4GY0T8nHZVRUAsQugr+nIHEk6pqIwfV11y8lunnnREV+I2oHgO
	5qESpj4LsZ0Mdbo6OpY0xhjse5hQ4gzBjt9is6+8/4qwB6MNkIgeJIR3FxCYPyDdkmUlYBp5D7/
	wiL/96hHc2iuIyaPTA6/w30YhYrHs31LkVb/KgEiDdp57
X-Received: by 2002:a05:6102:5086:b0:5ff:a34:6ce0 with SMTP id ada2fe7eead31-5ffe5f673ddmr4914119137.12.1773147825326;
        Tue, 10 Mar 2026 06:03:45 -0700 (PDT)
X-Received: by 2002:a05:6102:5086:b0:5ff:a34:6ce0 with SMTP id ada2fe7eead31-5ffe5f673ddmr4913920137.12.1773147823402;
        Tue, 10 Mar 2026 06:03:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485246ed174sm178732855e9.5.2026.03.10.06.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:03:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:03:21 +0100
Subject: [PATCH RESEND 3/5] arm64: dts: qcom: sdm845-axolotl: Drop
 redundant VSYNC pin state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-dts-redundant-pins-v1-3-98e2ef430717@oss.qualcomm.com>
References: <20260310-qcom-dts-redundant-pins-v1-0-98e2ef430717@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-dts-redundant-pins-v1-0-98e2ef430717@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2T2gETQgKV1lswCYgYKY5yi3FFU0H5AjeL8cCjnIbX8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsBadIDY4Hce5d5+u9tM2/0ZrOB5ef01WXxvUB
 R5zhINwvgaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabAWnQAKCRDBN2bmhouD
 1z99D/9eyNMGWhFas0R0YCigZ5oXZiCOYM1Kdx+CgNO3FIcZXIY/KUGHdvyLZlENfHBwKPabYwh
 ZGyD7wODI3M3YUbQBgRsVIJ13kN0hrurdVGVYfJV8zkVE3WOhh8akYqHWoZxbKTypwlrvcMjPhF
 9cZfRFrpzHz8uFT/RnmVx10OdNC2S8JyiY7HydiVTZe5QbM5PBqSFLNesPZdPsK67prbnO1OHB9
 GdDslY3zWJ9Gj+gX+u5H5/yB9gtt0qZ5FovdLjK+acInOJlKCMANuL3WeTTeL+Owq+pG9KBTvFE
 Js6JC+I1GU6Ktc18khBRjbA/LlNx5WJX7/1EDkFJUmT7uP2TnKpPhB/Sf5cxDFy2OHnid8aKvXY
 6xe7+YBuCYdEodMtteOcF0QwKw44fTFsJ6oBhhKeTHvqjbLs1B6FVK9J06NXz+4cWjuaLV71HST
 IJGkmYWL828iSkHz7HYrNKRIia2/OnDA512x3WuDzyP/276by2mKf5IySQfrNC0DmG7i4vpX0LL
 qJYHRH3nnSKHSJmJ1415AhdaGHeAkFhFciA46OtpZEiFInqxgV1+q8CON3PjkNLIv1L7FiQi3VB
 IyDiOVeUPGaj1eDQ18mbGnf7k1iDRJS0SZmhsDmg5W/twZgjFhZSWqQrali+LsbZZbnxuOZSIhA
 494Ux1sEvgmUM7w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Zz_0dLj_Hyw3OmHV-c-SPgmvPClFaDxc
X-Proofpoint-ORIG-GUID: Zz_0dLj_Hyw3OmHV-c-SPgmvPClFaDxc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfX8tYWWnRWzREp
 plWide142Da/VvYkjUahz4KtwLi8DX1vZ6kUCcxG1/Y6aHGZg0Q7Lxwoartk4Zt8vFB6BYDVZjx
 rFa1c7LOvRnsGEerx0CHHnyBDB48wcnnUbj0PEWVMruYHDXybwCPcWzW777KdTsKhN55w0e7YZz
 F1rdUaYm23v9baDLpFdWmzmYIiZLR24dTFqtjAprR6R3l0vs7EczVdU5wJuVE1wXzM6mSk1Oygh
 SA48pMcD981aDXXH3RzjQ/HGQCXTiSOjOQ1DpooxdJDo72uTbzI/zmHJiy4TCR2y8XFL4hgBVe4
 eMtmB5ddrRAEXpTR9bIPFARAvDKi4NIHNSU2u1slbvsIVWT4+0YluFi1IfYa1liJlBzQsbMRPTb
 8kooFqgoIRD4pbk0OIsUnObY50yvQizeD2Ki2tw+dJ+OdPZqw5+/uHwX5siao62VbwXgyy5lH5h
 Q3ILGbgwCkM7GDCiRwg==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b016b3 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kqCYd9rN2MbHXTwIacgA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114
X-Rspamd-Queue-Id: 02F1E2516A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96652-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The active and suspend pin state of VSYNC is exactly the same, so just
use one node for both states.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 51b041f91d3e..740eb2255072 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -483,8 +483,8 @@ panel@0 {
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&sde_dsi_active &sde_te_active>;
-		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend>;
+		pinctrl-0 = <&sde_dsi_active &sde_te>;
+		pinctrl-1 = <&sde_dsi_suspend &sde_te>;
 
 		port {
 			panel_in_0: endpoint {
@@ -623,14 +623,7 @@ sde_dsi_suspend: sde-dsi-suspend-state {
 		bias-pull-down;
 	};
 
-	sde_te_active: sde-te-active-state {
-		pins = "gpio10";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	sde_te_suspend: sde-te-suspend-state {
+	sde_te: sde-te-state {
 		pins = "gpio10";
 		function = "mdp_vsync";
 		drive-strength = <2>;

-- 
2.51.0


