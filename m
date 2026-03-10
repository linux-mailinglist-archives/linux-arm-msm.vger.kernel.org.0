Return-Path: <linux-arm-msm+bounces-96480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIXCKXiZr2lbawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:09:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8903245275
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 97CC9301C6BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B893CA4B3;
	Tue, 10 Mar 2026 04:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLyz1roU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icjx2A2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC163AA1B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115723; cv=none; b=QxfR2clSWYzrNzMrgMh+bB2EZRLKVs6nypyJz9Y91nz4f+rP6oRlqYQif1BAl2ol0XgKPeSqyh9B74uuhmaWsaZZZMQ2erI4HS3VMovmzf6k/Br6i2/Ig2TRf3lQXymGwVMz3pQ6Q63LDmyHoP10Vbkw6vfZFqZSDhQkm65flQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115723; c=relaxed/simple;
	bh=05/ih02aQdZwwoiULvDR8rNHCC4tH+xiDZquh3M79mo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CvDUWuoSGwGqa2bBlAyd7KsKfESKzDYcPzJeo98tBrVAAfqiVBTcU/TDdg0kpTvLYX1lnPUsTEDRddrgA7QQHd676j0SK9bHfDOPhMsTjELyh5eJCYz7lv5jlZSYV0TFgtrUFG3l09j4LFi0aEoPOuCGwd4ql8GKT+0UMKRmp5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLyz1roU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icjx2A2y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EZKD1900137
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oT4GLUukv7F
	xUmJWkX5ZBHKue1HOeG3dJ9jEmJUu8Sc=; b=HLyz1roUu+rx0qhdL4kmUz3uc6D
	4juopW9fkpzynGgLe3smcBHqHanrGQvVk6KVbmo6RHyFITVQphmE2rbcfO928MvQ
	QQ/e5SuRUIs0Rv4m6phapXaOwOW9m4EAFZY1GM3qwHBCj2P0HaZtio6babNjbIvr
	4QK3Xo428HfiibvAcY4IVFX7eAxEXvJVa3gajSfpLkFTO7usz5LP7nxJ4zMcXXRE
	oRBuCEqR5ccW0LzvBAUbuLszP4OXjpbzaJ6kgA0cKQh+UFhhH0M20GWlmXh0dOdc
	5mqmlRO0ehK7jLQucfS2mhU0UPBKQOvL4d7M6ZPDCmWP+CdIDwJJBk5I+fA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsabk40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:08:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae6961bff0so345801575ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773115720; x=1773720520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oT4GLUukv7FxUmJWkX5ZBHKue1HOeG3dJ9jEmJUu8Sc=;
        b=icjx2A2y8V8zDCUwSbArGDEZHd+HiniindMvqSV/cMKJ5K+897kl6NUAoCxwqZILyS
         9/cniEw8F6uCo3SdICMoqpdZtyNijMFG33q1ON0wSjaix7zqmEk6vxJs0CSB6axgdIf3
         RKJZv0U/HudCwR9BG/5RD0orJ8CFW/3LJyx0T5Kz3V6X2VzOzhKIsKoxue2qOZSJi7uN
         CKMWxShUFhXcju45nXy24XZVLCyYnCcbDZTpENZDIYYdvmceGtuWFgM13Zw5K6BD8LT3
         2Ux4GA2+C5aUf5HT4Ozc93F8vORF1VZN5F+qp1gDyCU/eCUS9pUOxvhPpbUy+cztgQnt
         aKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115720; x=1773720520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oT4GLUukv7FxUmJWkX5ZBHKue1HOeG3dJ9jEmJUu8Sc=;
        b=QZMxCtjrO2ycGTIf0h52M+O/ZFiGbQBNYnOIQt/2m3BO625r9W1umpI0w4q3zLhmXL
         IJvDhzb7PnfsfNA6C/Je68Uea0h5hzD+zrH6Sfk9NzTHkP16r05GuJCh+H4KqyNDIZyR
         EYiHoSJyKtwbieOEQXvoh1vpcrI+Ikh1Ia8Q5Xw8bzPX6S9fYBSCEoAuJr9NLDrsvbf/
         vp7uYxdm2dBFob8hA+v5La2w1R8ZhreR/0HgBlqcSUsTdKhBI9NJcpjgglii8EgsO0uU
         49HhT3y1eQ7IpRF07xbAXogd5HCO6MXuiri3ZFlHALi2vjobYljvAsnnI5y3kGVZB/1b
         LwTg==
X-Forwarded-Encrypted: i=1; AJvYcCXEtwybnIY+unPGjRv7TGFGBwMcoublBBVCT/ypixR1v5p9g8aCxSQNYOPUX1mCl4SPrAVNqHgRUS0YcLXt@vger.kernel.org
X-Gm-Message-State: AOJu0YxnUJff8rZlbTkEHPgH3qR0fujCSvbMoDs65FePuN5kLsksXgCn
	vghZFdecKoEgUyg84VZLn0HI92/N6d2bxkXdsX6rfg3C/steRwVw5Xp2Zzs9Cjfc0fxchmqSM5i
	J6YeDkXKEtFUpOgoT4vPe29Z6r3crdi0tkspt5CNG9nAJhOoLNWtB5olsev5qdsWPhjT3
X-Gm-Gg: ATEYQzz2Z96kGfrL/i2lhe0ILHBfB7WqShGtSGHr1DLdCfsd/6/iOWC5eGYGBa9HSqg
	G1khe3kzXFhl92UgGs2X9n41ulMxCNA90Lj1jD4y7nkZb55iUlZPQP6XNo2mgXBJNsVlNKTwuYE
	tkuYTS15fsve7/e5d+2jRJGAqxEqyWfTLhrIAkQxNtY9g2USOWAr2Lh1MI49WnglNfgdvNg4tM0
	7hBxFgIKyNNNPewWR7Yq/2rXzg85BVKVeAfXtgGWL1QMoaR0bhEp06sO2rRFuA8yhSaiZJ7XW4n
	zb3fLT1exH/IOUb0bZiH9ChlBHPcwKPWy5uLAaxMikK8VJLKGJyKqCL1i0ya1Y60GLKLBl/kHXC
	r6IBwVk8Y7YJ/2C8I4eGKdj83BoWmIPWji5h/oTFilx+EjBUEAOOQnz6PS5Dye3LKadc8qOuF2M
	WwtWw94DmBZsLbtDQ6jtvXtHDzjQui+JHeFoD7
X-Received: by 2002:a17:902:cec2:b0:2ae:a5fc:6 with SMTP id d9443c01a7336-2aea5fc02b8mr6301365ad.26.1773115720454;
        Mon, 09 Mar 2026 21:08:40 -0700 (PDT)
X-Received: by 2002:a17:902:cec2:b0:2ae:a5fc:6 with SMTP id d9443c01a7336-2aea5fc02b8mr6300975ad.26.1773115719965;
        Mon, 09 Mar 2026 21:08:39 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aea4eed00fsm9797975ad.80.2026.03.09.21.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:08:39 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: sudeep.holla@kernel.org, angelogioacchino.delregno@collabora.com,
        viresh.kumar@linaro.org, neil.armstrong@linaro.org, festevam@gmail.com,
        Frank.Li@nxp.com, danila@jiaxyga.com, lpieralisi@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, tengfei.fan@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: kaanapali: Fix deprecated cpu compatibles
Date: Tue, 10 Mar 2026 09:37:51 +0530
Message-Id: <20260310040751.3132523-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310040751.3132523-1-sibi.sankar@oss.qualcomm.com>
References: <20260310040751.3132523-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q2b9CeLlebnkR8I4hyQo35GJg4LsdJRt
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af9949 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=GQnCsLCnUx_kYXgjSdsA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzMSBTYWx0ZWRfX3a1SHTPgcYDk
 cGKIzmceItPhMmCzRwDBiZKgDD8+4RsV1eYYbWonWsg7xQ8MenfwPSOEjbU+BxnY1cbkve3uXzK
 K/Q7tk4GHJ4xgTKPfhK8Vkb6szfTYUw4Se8fSYxt2xriR12xp/u/qQudh4PjbN4rXmbf7tZE435
 gixZ6MvSvZjuApUsczPcZ8yVNTXAxJKuu0RVNuOGx948O+cmskcz04ZDNpzdJDByVhT/QLOhn+E
 j6jorxBxStjwXlafraeyr54BFwfp8Ba/gnrkh/gpPajVTxq7YOessFX+dhvQjN2U+/m+BrCjy2r
 3o3+FEjptmCPICp/D6JL33EVCJDu4nBsQdUUy5fvfYAo5qy2KuENkyvnpxjZ6QQ54V2ntIfIX2U
 vyE/ghL0bJ4qgpc3iAPSdgUo37b364jdwH3SYCoWa2tfhv/m8dbCftqyqvK6NemVwpPFdxE9EZr
 yccF15QL2rp0ZtNzMbQ==
X-Proofpoint-ORIG-GUID: Q2b9CeLlebnkR8I4hyQo35GJg4LsdJRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100031
X-Rspamd-Queue-Id: A8903245275
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,linaro.org,gmail.com,nxp.com,jiaxyga.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96480-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The generic Qualcomm Oryon CPU compatible used by the Kaanapali
SoC is deprecated and incorrect since it uses a single compatible
to describe two different core variants. It is now replaced with
two different core-specific compatibles based on MIDR part and
variant number.

CPUS 0-5:
MIDR_EL1[PART_NUM] - 0x2
MIDR_EL1[VARIANT] - 0x2

CPUS 6-7:
MIDR_EL1[PART_NUM] - 0x2
MIDR_EL1[VARIANT] - 0x3

Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9ef57ad0ca71..40b9a5953d39 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -31,7 +31,7 @@ cpus {
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
@@ -48,7 +48,7 @@ l2_0: l2-cache {
 
 		cpu1: cpu@100 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
@@ -59,7 +59,7 @@ cpu1: cpu@100 {
 
 		cpu2: cpu@200 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
@@ -70,7 +70,7 @@ cpu2: cpu@200 {
 
 		cpu3: cpu@300 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
@@ -81,7 +81,7 @@ cpu3: cpu@300 {
 
 		cpu4: cpu@400 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
@@ -92,7 +92,7 @@ cpu4: cpu@400 {
 
 		cpu5: cpu@500 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
@@ -103,7 +103,7 @@ cpu5: cpu@500 {
 
 		cpu6: cpu@10000 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-3";
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
 			next-level-cache = <&l2_1>;
@@ -120,7 +120,7 @@ l2_1: l2-cache {
 
 		cpu7: cpu@10100 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-3";
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
 			next-level-cache = <&l2_1>;
-- 
2.34.1


