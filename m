Return-Path: <linux-arm-msm+bounces-107619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKSpAkvVBWrxbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:59:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 775AE542AE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72DF930A41E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C88406278;
	Thu, 14 May 2026 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqYMVTRc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoNafo12"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD97F3FFAB5
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766877; cv=none; b=n8Sea06SyQgcZ+RcXzGRu7X/6kbGoi6TChXxho6KNGxuhjMAiVyHXZIsI5zA3Y7QbcnsL3by81U6db4ai9RcgHG2Y81LAMvfG9NigHXjlVH0TBMwaAj8aT/2FPs1U89s8CRSsyoHSwPfvnNXioVhJQ98CdGs8DcKB+CrHXPGxSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766877; c=relaxed/simple;
	bh=/Cbd6i4gasN+N/5gnUli1oHBdHG5gwmEwE/0Faw7QbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ryDLLDas93+QKWoCKkNw62asHWGib4/Uh0ajor9oChrtkC2avlrLrCh3t9IS12/uX9Q/GDPnLtstMydzvFPD3TXt6RMq5lUTUg+icdJtFL/srMZcVlqpz3qq0Bakac8tc8fLCG+AtI2nXDO95+ClQfTF+1Rj3YerNRe1t8IPQWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqYMVTRc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoNafo12; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeSOf2713203
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/pzlABKFdr73PPMVjc4IvAtCAl5Fviyz8sYXuRQw90=; b=eqYMVTRcZKatjpMg
	0aZp5LxnPuuQ9jRMtdMhDlKN1YtBu9mMpyXFXJYImTQ61pijwRcaOzemtjWEv1y8
	T+JDC7RKQLPlVR+pcOU0Qqg7qNGARpmw5QrTrBjEEwgu7FUmQJKPbi6NVkyjB0xy
	nGZ/ewe+kuRjdfav6eOiRMxdD4+62mUWDQwTAZsxDrxfWKmo6oL6CtHqI4Mw4Ac8
	yX5cgEHZRjt1d8ehT2IQ8K+XCAMj3pyyaHRqp6MRrKyt130abkBrGmYBgUBs54xS
	GbvMd3+UlGUlVKzXtN3/5Vlcn4DcKOhvBfeoLjJlX8OL+r8CJPlehIKuTas5RhyJ
	4QKWZg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v89h9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:32 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-948b41f95deso11589993241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766872; x=1779371672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/pzlABKFdr73PPMVjc4IvAtCAl5Fviyz8sYXuRQw90=;
        b=hoNafo12i8OvsOYcaOasJFHJZw/vDoJ59eP3ZlFF/YTzi9OsiDh3JPfffVCzH3vN0K
         U/AVNHFOXLJs4yCHv1n07zrRygEMGfsE1JU4vU3/3fSGu+5+6vDGDAHCxNWC3Qlctlvb
         sTeNk85UA/RDUaJfnqnFLZiRDobc8klSuk5cYI6/9vGYfVg3Tyyl8YtuqufEeLZYbBq6
         kQYEg6kbwuxjL6t0lBBED8Sw2PhYGtJFe7SicawsrQIiVcYL+MCF3GIT7OyzC2cRdH0t
         Lvta4wRvmqo2mnMPCvyuF0+rmTEwTiMKqIhytqwfAOXVaBLsEKU2Acf+G248TTw7ahlm
         i6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766872; x=1779371672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s/pzlABKFdr73PPMVjc4IvAtCAl5Fviyz8sYXuRQw90=;
        b=HnIUD5vaIviEjx3M8G8Fr9/WvabRUc6UFNMrdS0P857nsG7eikcVW3y6yfGyqwGBn3
         rTlQBG02HVOqWa2VCxsuWRBy8ydOWP4PI6GtdbF3IwnIZznno7NMaoKLwrzmw0slAA9n
         uKKOQurD8wPUB1XyIeOjEXobcBmwufBqgNz9nLniYNG9WFaGvBTs+bLel2Vggg4EMI6/
         ls7fjAlbDSv9LA1BCkHDBuWz4KqKvRTy/Jg2QG33A54PN0Xd07xWowHn3RUqQrMeJ8US
         r+iS5FWc+MwDGPcguhe1qEJixzbQSGmdivmOxm3x//Ly/pKkyTkW1a717fngPWZzhBcm
         ezIA==
X-Gm-Message-State: AOJu0YzSy8RNWy2so8zanXpenz8QJ0/8loSkh/8siaL8/9CQs+4gesRD
	UQ6oPDUI2S2Gbi2VKRnjdiyPOLInYpMynagoO7F4LNTgSDcWvlWI1iuztiity0wBHwhjU2aqHRd
	nspyHu8MjXSu7jF03fckeK9F5JkhA+L4R6rAl+4se7cz77giQKaSsXSLeCyaMAeOdBsMA
X-Gm-Gg: Acq92OGa5WOYDtIKGRbAWbKvSsVUp0NrsgdnmU0tgyn3EOMaAsJSyRb9b1YLVwyPEh4
	NDN/UrMx2a1gpezeBrfCXMFmoL/NpEzNCZVbfYG798+lZmgnWANgPGiF4O1f10PN082TLwfB1pK
	Pr++Ef6RPLsEtzvYCt+VOQmJKco83xYOmvm/hUKf34kriz52zqlJMoNYhi7mUYJTcp62m+S+yhk
	9/0usUoERdxI/mmBS2E+hH6V5leuv7cPBZJuXZ++lpTXWOY5DkKe6ITdC+1GSuannee0A3yKWLg
	+MCEuQHDxX8mNzRBxgW1As/RL6PrYKO6tKa5ndRYupVhnDbO+GSXrErKURcMQOn0kVKy5y4pMh/
	uubgvR0buzJ9W5Q27RmdCJHnBRgCJkNSzyhkr85gT
X-Received: by 2002:a05:6102:b10:b0:631:d586:893e with SMTP id ada2fe7eead31-637a7fb398bmr3915865137.5.1778766871741;
        Thu, 14 May 2026 06:54:31 -0700 (PDT)
X-Received: by 2002:a05:6102:b10:b0:631:d586:893e with SMTP id ada2fe7eead31-637a7fb398bmr3915526137.5.1778766867248;
        Thu, 14 May 2026 06:54:27 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd62dde04sm27798165e9.2.2026.05.14.06.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 14 May 2026 16:54:14 +0300
Subject: [PATCH v5 2/3] arm64: dts: qcom: Add Eliza-specific PM7550BA dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-eliza-adsp-usb-v5-2-a21056ffd892@oss.qualcomm.com>
References: <20260514-eliza-adsp-usb-v5-0-a21056ffd892@oss.qualcomm.com>
In-Reply-To: <20260514-eliza-adsp-usb-v5-0-a21056ffd892@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2436;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/Cbd6i4gasN+N/5gnUli1oHBdHG5gwmEwE/0Faw7QbE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBdQLQPbr8G2YF1DgjvIAkO8aWJgU2stB00Un+
 rs3HKwIgcmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagXUCwAKCRAbX0TJAJUV
 Vq8+D/4maRIUGv9u3HkNCbE+u2yE700pYsk6gZMyh9dFp3ehWYKAAj1uMuAFYV4UNUknF3Pwi6g
 aTfvNQk2lFdUdh/Wslbt7a0FzWioDZiCHdl7i0S4N6tgM9T7ASqkFwQOydv5sK/DBAfuTuUwgxb
 9i/8BTRjwyW+i1JurtgVJlyloJe0qvznbFWT2urcHmEP4ZAHdQ+6dJjTb2A7bJzwkR4n8NeDklR
 Wu28bWQFa+e4JQnt+fw5BJ7ZpRh9au3iynhbxpLJ01SaA73zBTPyd8fhIbLeQNWT8EpBbtGS+JO
 k99qZexsFQFjp8WWDn+XqpO1E/U5eV5rheZFexcbakD8YdDeYmALwKQ0MXc5uCcQTkzOIq7a8Ab
 X198ZNWkKbXXYuyxoMTTywU0ts+/R+lOT+k9KOCaYun7bnM3CRPehJkM/B19ICaaQ5P6kO0LV6v
 FtlD7B3PIVDIrga5rJ/T/SFD5PykOh2C71II8P3Pmg3gH80Bh9jVCQAsqrQ5lyh+2e2nBqasuKm
 KDKx0zxmCcYpPrAUjtspkLz7NMcTAKyAh1uKr0qI/HJcHU+DBtKga0uIxW1LPqn8AuFl1z3d1CX
 LYF7GmwQbwJ5PO+KUJWifr5if8Qjk0xKOQzyI5XFxW0RL6O1dy3tjTcdPtsDqCahXAVibMtI4m1
 Dgqk7PJG6N7+LIQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfXzMnX7b6aUoRB
 2UjZjDB2I8LHPQjWMPt3tFU8Mtua1vG8IvzFgsyE9UrpaZ0rsIhG3vW+OaNLVBB/BCZTTeLVQsk
 zjIrF3gXyeuyRrFuKzPPEbY57nbVNQOu5mAng8UaoQ2t2i+eJPZF+9fvg3owF6CV+04fbLZj5ob
 b6Illm95fiohVQQRoMVUGvyhp9aifegplf8huNanaHC3CUxq/3ka6BAK/TEnbFeGITY/JbZ0AMi
 U/WnfQGGRaV2VH1LXY1Wa6eB5/0SctrBb490pJObxpxqmR0cch507X+9nFpeBxG1NRxnsPhUnZt
 B0G523fpCFIncu76zfDxUSXX7QYSrygcfID7PHehbk8bI8Roc8rCrkP5aC5iFydP5RWFhUXc3Go
 kiJ/RsIpgsCug6RzKCcqkIvq+3RkuCBBTmTvdGo4aUEFqgFqOZES2ToPB1Inl/r3X+AW1JA+ye2
 4nnD2UZ/jxf72vTxQRg==
X-Proofpoint-GUID: zNObrqFQU5vYRijuruVyZpTWwp4dwjGp
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05d418 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=TDnBEMNS309wUocYtfoA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: zNObrqFQU5vYRijuruVyZpTWwp4dwjGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140140
X-Rspamd-Queue-Id: 775AE542AE3
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.34.96:email,fd00:email,0.0.0.7:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,a00:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107619-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Eliza, the SPMI arbiter supports multiple bus masters, requiring
explicit selection of the master for each PMIC.

The existing PM7550BA dtsi does not provide a way to describe this,
so introduce an Eliza-specific variant with the appropriate bus
configuration.

This duplication is required due to hardware differences in how the
SPMI bus is exposed on this platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 70 ++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
new file mode 100644
index 000000000000..18692893ca41
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -0,0 +1,70 @@
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
+			compatible = "qcom,pm7550ba-eusb2-repeater",
+				     "qcom,pm8550b-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

-- 
2.54.0


