Return-Path: <linux-arm-msm+bounces-118309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5r3gGon7UGoE9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 16:02:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F62473B8EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 16:02:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kBYrZ9Do;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HwbmvNyc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118309-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118309-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A172E307EC8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33ED2609FD;
	Fri, 10 Jul 2026 13:49:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F145C230264
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:49:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691397; cv=none; b=B0ay6e2mbPr0AhLhtzHEqDEGT8oPUiUWqFsI2VYB5/CGW2S7W/ZYPA8ynrkI5h+MoNxoIcSEgUKpLtwtpXdxT9GXI9gOJCK2eSwzIXdRsbld7+XDn42kWmhsM1NTveTAyWdFkL0j0j7mo1pj7OnYazTn9XuadP0teTMF3xtV5vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691397; c=relaxed/simple;
	bh=+NBAVrPIo7sHJ7MgnZXaHhnNEpFD2cpSnzyBi8ZsiQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RRYfotPLg8dA4Po2SbHusBHVYOomeoW3uKre36il4OgzhQ6P/FiFw4mWuYDC0fW/w9U6WshnJnEh+OmvJgW1RTvjbXJQMuT3q0y1yTFvYLr2rtWMXLziPAIS/Kg8tayGYpmGuJucGi48mpwk1zHO+lC5USumebcdI9CIm5NJHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBYrZ9Do; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HwbmvNyc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD7C00923615
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=; b=kBYrZ9Do3IDDr6Pl
	+j/6KaqbqWIUgiE4L77bTqgfe4l6rd0JHfP8vpKJj2rfSZ8dV2tDVKXJzm5EsLu8
	BZolFgLCBomZtvUZaysvd7mgBFWmZoMeAz31yzVX5M4Y2HcFP4/d6e3NHrz2vw/I
	B5s6TAEwKOhpFQtPGnTVnss48B2xgSQXEbQxMIn20iqha8+TBW3WF4Q4f1EQ/NTR
	fiN+WVBy+HYY02ZK+rCOKQtRzbISnDdt2MNxFQ5T6zYa32nZSs9iQnTonCIPRTAR
	QMcrYsUNVfxd1uMKZS+TMQvfluaE+VuqQx6YHg7YLInwP9nhy8CCeOairQJYJbGr
	C0w0Rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fay3e0na8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:49:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a9764f0so10227471cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691393; x=1784296193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=HwbmvNycnBRMywAqUv9rwQCGHO1FrK/WImR2rhl4Ad1MgiBmneBqYZofq03gbZtb6r
         tuoY0vKQRSGAmGMfad7DmtwvqjvT7zU7xRFEKUu5aEIg7HwWub2CqWjQmEpx+2CI8yJj
         YbqixFQgWJ3Y4AkOXPIlYnsIPhXASfc5S3NEZERRsa3/KT8szW2wA8zvPWuwf/0KQLzt
         7Ca9LZdaIJabLR9hE58csT9VwPy7ldPrqpwKr5QRydyiNLTy2KUviY4EbfLcZP5Onw1M
         8Vn3KQQ1z4zOTFjlggFZ5fzL2WUlVhx+2vUXCg1JrG/tSKsvmnT9MXJGjrh+qv1fyAdV
         WS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691393; x=1784296193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=lNSUMyy2KQJvKST0dNaZNT3MwyIvXo0eDD9U82zbfTJItXjX395dbjpfCjmNgnbIrK
         FwH8rH2GSgKGg2imZNuXbxpUDG1zaBbreO4xYBA9I9mj4PcH549RsGgXXkM7d8/+fTdj
         /z7mxIJGu6UGvoZAfu/jI1kKssj4nGtIl4KauaxaPUh8mBbk7bBOtTXEhqMBK5Q61rfI
         a43rcKpvywc/7Ay4NymOmpF8ZQs+yEtvOjsOMV2iUCMIWu3kNHmfNHha6Sd+b9xlvdyv
         wLvr1bBw6bDpr81Bdebl7EuXU18V0xwouF9wlT59CUJDN40k5CKoa3c7mQbp0DkDRE7Q
         WeIw==
X-Forwarded-Encrypted: i=1; AHgh+RonL6+pierdOsEm988X2KUDDmbXRjRWktNvOaMDjKxUSie32PPeAFohtF8dZb1uETu0W5lgoK267eBLv4uh@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ2wwQ5Ed5eKsgYUgR3950GXnZkV6384s6Ttu57tIsHyg1xD6G
	mdQImPCNYPpk8bo9QdH8VCT1PGeiE5U9DHkjlJEh8Nz7RPknNOJlKe8pHhhTesIhUxs8OO+uU4t
	zkUzy0Po/LAzxBDlpCaUb7wiHTyTqaOEjw0Ewuzue9u+19zoPoyvvb4AXn7qseJUlY5KF
X-Gm-Gg: AfdE7ck8TqrA0mLNSZ3ToKmqRH6uPKcrxkl0HoC5tjBRi0v8meO0YfnotIkIrnRRGmL
	LzjC1XN63FT5L5QatOhBPDfn24a0Tg0TKq5JYbv2TICfbt7zEk4/4Ob+KFHHLUYLYeoaE0sjTfZ
	sqB9J3otF93DlQYLuFzb4CGi0sEHIwQVzUuj7KO1a6MbD55/C9c4UDoABz+6KfOsnKfTY8idFeP
	vj/6a00CZGGnxrnlnzM0qbvuPoe6exCYhAUpwsua+b17jrKLgAhFrfm7RzDZjVVewT/ve7kTlPv
	WPdAm0wRxKfPPwgGrma0/yaDUfyS26VnM4pwQv+2+3Cati3HV3QoxhvHERB1YKPn+1vrThNicOp
	ActfasMrEQvfCg+O6ZUiMCX95WtQxOygyQFkUoKl/OD9S6j5voAqhRlAyOV2aGXVyUn1Eo7V3MM
	bwBfD5d0a4lg36HSr+f4X4w3TZF6gX1+P81Sf1FmNhvX4/QEp7undy5a6EPMMx7JOZYXiuv/lX8
	y4o93tVyRx4RBSlwXul
X-Received: by 2002:ac8:5d05:0:b0:51a:8c9b:64a2 with SMTP id d75a77b69052e-51c8b40e741mr120111121cf.70.1783691392574;
        Fri, 10 Jul 2026 06:49:52 -0700 (PDT)
X-Received: by 2002:ac8:5d05:0:b0:51a:8c9b:64a2 with SMTP id d75a77b69052e-51c8b40e741mr120110541cf.70.1783691391753;
        Fri, 10 Jul 2026 06:49:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm538164866b.40.2026.07.10.06.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:49:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:49:44 +0200
Subject: [PATCH v5 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-leds-v5-4-a8972d28c28f@oss.qualcomm.com>
References: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
In-Reply-To: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX2ZYnMN8NZnwc
 sB9IR/Gs6mH1H8d950TSMYwPVH3nmvhnpDzhW0TzLERsK2ZXleJiOHaYPjeb9Wbaf0gYDXtOp3S
 EBAQlGVIIfcMmLt3iNLawg5MeaxmMUo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX/3cHUBiKEmcp
 AczWmFaf2b/BaFjDzbmOLMERCx07kQbZqvQYE7LE8UmUPOwCFjpkAS2gnCcV++TDdRwSE7u+zGV
 nYOLrX/pHW/gSdPcXvWtnPKteqJhikuIz5wfyALmE4o/HEq5w7ywaL4n6sMcozK1+igcKYxOfQe
 98ri65K3HR5lG9OUhstB72uKoQE7+iG9ebdqbnwMZ10QO7F1T14O9sYwzV+OunPFt8SW48Y0bqT
 6RwSfsei3bsVvlFiR331jAx5Gxe0usSxc8OmVTNxRW9dYpBInJkWOYzZ5TqEvpDO0lOAWwfaQ5H
 eM1kRaQbpKnKxLvlsrVa94Sp4afGF/o7fITTxyN60wQe9bzrzOUXe26YwwwZliTGn8SYJcN/8GO
 nCQSjvFtKvuW42ndPkM/H+qxc0mHdatbFU+XaN3CgWVjXKzpE+0EFt5ZkejSMAR+I/adP3yddwr
 Q+KQMbudvUQySdnudfg==
X-Proofpoint-GUID: c6QWEmcYslhDqbUbe4IhWE-4BOsO5W52
X-Authority-Analysis: v=2.4 cv=HqpG3UTS c=1 sm=1 tr=0 ts=6a50f881 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: c6QWEmcYslhDqbUbe4IhWE-4BOsO5W52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118309-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.5.7.0.0.1.0.0.e.5.1.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F62473B8EB

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..83ccc4eec342328c78be37d4642b772d74a8ed37 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "monaco.dtsi"
@@ -156,6 +157,115 @@ vreg_nvme: regulator-3p3-m2 {
 	};
 };
 
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	led-controller@22 {
+		compatible = "nxp,pca9635";
+		reg = <0x22>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			reg = <0>;
+			label = "stm-led-1";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@1 {
+			reg = <1>;
+			label = "stm-led-2";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@3 {
+				reg = <3>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@4 {
+				reg = <4>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@5 {
+				reg = <5>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@2 {
+			reg = <2>;
+			label = "stm-led-3";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@6 {
+				reg = <6>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@7 {
+				reg = <7>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@8 {
+				reg = <8>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@3 {
+			reg = <3>;
+			label = "stm-led-4";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@9 {
+				reg = <9>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@a {
+				reg = <10>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@b {
+				reg = <11>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+	};
+};
+
 &ethernet0 {
 	phy-mode = "2500base-x";
 	phy-handle = <&hsgmii_phy0>;

-- 
2.34.1


