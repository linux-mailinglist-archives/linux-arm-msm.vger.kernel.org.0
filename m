Return-Path: <linux-arm-msm+bounces-107090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKRzMNkdA2oW0wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:32:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9425202FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50B2B309BD91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 12:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930614C8FF5;
	Tue, 12 May 2026 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNk2qYIC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsY7W/tp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82A0388878
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588835; cv=none; b=P/lm/DgGKmBwLJKsUW+IZuGovIZ9PY3fklq4pi8aFq745s4iVlqmSZd8GLiYsunCc0rDidBSRNzYh8mjZ5aT1VjoBn+9odT2Zok6krK3GmucAHeIFxlybe/IIek+JxutPjygqF8xPqWvVw8t0+C22H4e4pmgZzo1rrGWzD7uzkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588835; c=relaxed/simple;
	bh=ClceAYiJ8whQgLN7bPe85GMULVLaGBTfiMaFdDN9qOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q9wzalRTYZ6fqXOqo4QWGqrpakiYpwSQgW6gtrusl/bni7qTGM589IJOYN5hWHJkd9Cw7PbTzL0KjJLy5PhiGwygAMgP5fcQyphQnBKRtEwnM97mDpJGEQFU0G7miJxQLmeDoY+8fL6YrS4jVCkaIW9s4W3gFMnzaUiA9AYRxqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNk2qYIC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsY7W/tp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CC4SkL3320970
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoxhWK6IHb1qi1sBgTOzXLNliyxQUEnjKfKgGROIUJ4=; b=mNk2qYIC3QK5vwls
	0CBJ4Wko46o01EP0uDzirG5ivct5/P63neyv1Qs61+ZQXbppJ9QvutMs/Yax3Vdz
	KSSfW84NCrGVnEQ+ZPry8Z596hQlBO60r+bpjDrEMfC4SbbYCzV1a8AkB20nx7EL
	pRMxFD/i8pHaSzH11/DHv5FPDU09z3xs+Aj2G8EXCB3AhIn7HyO9yW9CdrDTJzg7
	WH8B6vrnoP8U6U/8D6VWuZhDlwU3Q77T+ydC4uJ86qTtrEZMRhyc+OpKMovdb6Pm
	8O6RgfvV6Kj84NNYv0IEQPM+NI2BmQEolQw0Lo6hQo/i2KzgOEhVTditVaZcFjCj
	/PjMGg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43w1r26m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:27:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50edf0245b0so103178111cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 05:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588823; x=1779193623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoxhWK6IHb1qi1sBgTOzXLNliyxQUEnjKfKgGROIUJ4=;
        b=WsY7W/tpT2HP8kr3S7IU/3sq+F3Eljvz44SdG9jvaQYP1+CX6njv71Kutfk5UbZs8V
         RQ34QmAbhwjJNlAzyuIkXoiCnWqENIDlCFxCzHpFQoILrgeZMKbMMkljrhZKI3uIweMy
         CPSdHX/dgcxy2VSPKjsuDs0wePV7O4LpHZT6xcO6camzaJpm8TNZnVoYkhgQri3zOc6p
         o7r/vmF+NYBmM9Bvak/NmZDs5JtZrz+FGWArrRedxFc0meAWaAdAiAml+FIZ8lxMj1ed
         u3J5GgpHxyGfO9fcxdkNEto4ybL2ruGC6euS9OfW2Dz2VzjIGGdvbiqb8ooLUWLJWlyN
         PWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588823; x=1779193623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qoxhWK6IHb1qi1sBgTOzXLNliyxQUEnjKfKgGROIUJ4=;
        b=q9URfrWHWgy5qroXlRTxXFpeKSRNItWUS7z0DIm7xU7iLkEQTCfOy66MD9PCB63pF5
         OfFGnz3pWciOf4mLThlKgTf8Z72ZI+jlA5koj+4SGaOuqyK9hPTYxR1JptX6vH1c0PN0
         zrLtVM7u/Ckpc/CYhTkRdt+lbFoRBVvyFdGHpHIXE8EWW2pgrj28xAWSJO6XM7VmkZBT
         aucW6c8wCvOZiGjKl9B4+5uLGn3RELiAgmG4raMUpblsgKlT5nVRpYtbXqc+CNM76n13
         +p0ZVDRi9yKTqsGpt9f8mRuQKod56f/NV+JWkwhndXwSFNWy7rbrYRgRY/E48iffYMO7
         7jWg==
X-Gm-Message-State: AOJu0YxQCTI/ybYMfdRkcHJahzdVnExXnM0mjB4g2XqWAB2N6YM+lfM0
	EOk351f5ZBbKx3jzgkGBRDCAh3N2yfeuIcEJnZaUr1qnH6GiFSaZ53fJNOU0ux2X9EwZUQZcprC
	wxTFL9d6vNN3RfFlLmw5nak3fH0IUPOWhAaiWcof3rsMakHw58ODI3SZLgJWNjiqTdGYcdDmjJd
	NV
X-Gm-Gg: Acq92OFxO0R885WQCHPr17iGl/9RkLVc5I515OwqJrE7NiEezimvhKXDL6MSokvwzHq
	BL211pziyIitZX9M7Pzr0/xVO16+BBzI9xa0OaynMEGdHiYukaFaQcPIcZ+4BwWUTJ4q7TMwTdI
	sOXZCoSvaJLPozBQt9CeJQwQ+AS8JYevyTbULlkMUcOit4hjZy0+63oi0OC5fcPJZMwJIAR43xw
	UeS1iCOXdYuCv1H+sACZyerPoDI0zLbiOmoRMJj1CC2R6dOpHIwXE6t1PsX3pG/E5jm7hHYCBrB
	c/1qyt/c6A4FRTQq6NnqUitFj/t+4p4Euu1Jn+lYV2Lk5OTd4s0APFN2E4+V1yo7fVaiC05tRdw
	p5kCXITDzOLZSVmbVxqISEy3JC+3UUw==
X-Received: by 2002:a05:622a:4246:b0:514:6667:73b8 with SMTP id d75a77b69052e-514a0b243c1mr206769381cf.37.1778588823096;
        Tue, 12 May 2026 05:27:03 -0700 (PDT)
X-Received: by 2002:a05:622a:4246:b0:514:6667:73b8 with SMTP id d75a77b69052e-514a0b243c1mr206768911cf.37.1778588822453;
        Tue, 12 May 2026 05:27:02 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e90681760sm43089135e9.12.2026.05.12.05.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:27:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 12 May 2026 15:26:48 +0300
Subject: [PATCH v3 2/3] arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-eliza-adsp-usb-v3-2-6420282841c2@oss.qualcomm.com>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
In-Reply-To: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2358;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ClceAYiJ8whQgLN7bPe85GMULVLaGBTfiMaFdDN9qOs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqAxyOT9QOjL+4Buc7hXYCls85cVYTu1bT/Vit/
 sUq586nHTKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagMcjgAKCRAbX0TJAJUV
 VnqjD/0ccTPopFmntkjZZQqDw8PmUqM9nlDWZPwfVELTO9PalOLzTlRAZwMxqnstWs9sKSaOVe5
 019P/njc5j5DZcxRj7iA+7rZyv+sJwcLdQuatNpfdJcbCJ8l0ahbSD3Ks7LneXJPaG3rAvLQx9x
 M+SLlCvkUGzOrhqYEXmhmzOhPkwf4TbPMXMKvie9orrtb0AeNog0C43B5pewyoO/lDjO3/RGrrJ
 /gUB7SNiu7+6U4UyvFidN2ffsrSB+6SOXIAeTMQiA2eRm5o1EpoIrx7u2DjoJPSo9qkrRPxjHWP
 ngWbWg2KO5F2xfTtyKYBoG0qCaKLLqm4JUMFe5QmXejmXJIddt1/rJu9N+jPFS4rhJhjmH966Zq
 kZgZqJQVhWcfkzKHhCDXmrdy6N3vagDw3v+23WNaRRbeDUiDnBbKPT2QgTXVKxPo27KG2aWmqBK
 Q4C9jTpQjXMGr7tiJbNu6wMdeaXGDbwiQJYFNa31y51zc9wE9MRAD5JOEjnaNd0lX9sakHp/yRC
 zczMiX8P7H1IEsEuSHSDKsg4QlUMeS7HwPSI0aeliKu3SqZQHnQB06r9H2KYXHbeKnJpA2kqs4Z
 022GnYuJ/d3aGOnXN2ll1c1Yud7AE/KM3KeZNF3+bzZemZRmzQ1PhnwJuzqz2/SXz3S80391zAd
 HIcQex2n/0JAC3g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: SevgM8Ynddwul_5zzoe9MjYVIsGLYVJ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyOSBTYWx0ZWRfX9LkgxacSYjGb
 1yCIruuBCAofma5eM29h3VcmIMnXPwr1VzXBaNz3bHvNWfRsUqaeykDibmyB+OycN7KfeIEE2JT
 8VbrDMaA9JsLz/B4E2KDiEQON1oUF051uOYDD/lPDDtO7xPlq1ADQFJ31vDzyM6IMO5JQOadkid
 G39cd/QUZPKlTDLHHsdf96IH1leP9TjNi47KL9lxUsep9VN/1EyFB+1hukfkyib1dmqYzRZnZ0c
 tDkdXKNsWgHTjN0uKkq0VW/hGlAC4Rna+tNuJCIbwvrrKjEFc1ojQ1loZf3DaPJ/vWazstsct96
 gX+kzZCfeAsdRuMwjfCaottfOrpUu9oqb07xmH5g8yv1h06Mn5jktf3z3KT8ESVE9wxZjlJyo01
 VEf/deuYzCxGfLXjd5ohvSB0Lp06U6enCCx7Jf71771ZSD7QsQ5OcBPV8XO4lBBumgaHzb9AIIv
 1PdfQtR3+/MSwhe3OSg==
X-Proofpoint-ORIG-GUID: SevgM8Ynddwul_5zzoe9MjYVIsGLYVJ8
X-Authority-Analysis: v=2.4 cv=BoGtB4X5 c=1 sm=1 tr=0 ts=6a031c98 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4U6AihNozsKCruDMU2kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120129
X-Rspamd-Queue-Id: 2F9425202FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[a00:email,0.0.0.7:email,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,fd00:email,0.0.34.96:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107090-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Eliza, the SPMI arbiter supports multiple bus masters, requiring
explicit selection of the master for each PMIC.

The existing PM7750BA dtsi does not provide a way to describe this,
so introduce an Eliza-specific variant with the appropriate bus
configuration.

This duplication is required due to hardware differences in how the
SPMI bus is exposed on this platform.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
new file mode 100644
index 000000000000..2c386f16eca4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm7550ba-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm7550ba_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pm7550ba: pmic@7 {
+		compatible = "qcom,pm7550ba", "qcom,spmi-pmic";
+		reg = <7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm7550ba_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm7550ba_gpios: gpio@8800 {
+			compatible = "qcom,pm7550ba-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm7550ba_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pm7550ba_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pm7550ba-eusb2-repeater", "qcom,pm8550b-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

-- 
2.54.0


