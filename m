Return-Path: <linux-arm-msm+bounces-92304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ICTNBngiWnGCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:24:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FC510FA16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00C073028C15
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 13:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DD737882B;
	Mon,  9 Feb 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9LJCamS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2dZvrwJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5225D378D65
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770643440; cv=none; b=ga/07D2qXDf0XME5KUvRmW80xy8vbLHaLHVSS14z/122Jnao0hx4QTrVFOOVtwcIzJWVF8/+GWrznvJUfVhIPpwNDvU59+LnIxVuAuedrfy6myDICsICIJOg42QQbfAfZ1mt/SWF5skuuqW4Z3ELBGnicSv5ymAzdu7INkr9uEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770643440; c=relaxed/simple;
	bh=UiU+149jnrVM1SWUnO6BecZTr+G9PKFBnhbQil6C7dU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IRIfrQ73+9OlmCsMNJpWU4y2BYpyaaTOo8FwtH99G1oTCiCAsOZbS8JZxfHGpYMjDSRHNBml+uNRJKUk6nEgDMS83jfLblecO09dd4h2HgIk8fhkJr+DyDJ1qrt4xHblgFnFbwcK5CJu0x3K/wTB5LUbsCN4qYsMnqe2nXjmeFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9LJCamS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2dZvrwJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619CHASU3437085
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 13:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4HKCdAZuuGxNAXDtN64uIxZbwDy+4WF8n1CgeQagiJA=; b=j9LJCamS2nPoB/b3
	w9ofSOa/FHjj/uhSY5FS6gHTbYRzjmRpvtKUaMCG6NxAFVryi2dzTUb7S+FDFg5z
	vTi5+YFkk/LJXMm0fCyRP9nhZDt1waVNOtdr1BpVnqO3hsysatagM8d69VcrqZWs
	gSXwU2cGjS0VlWrbCNDarJog/deIqLSt/lN5XbBqHfXwNoNkXrLAR2bsGtu2meBT
	rLPyVOY3Q5yokm0/L6EkebVzakKPWsF4qvUPEEElYmdPLQIoHmd2QICZu6ep3Nvn
	rk1aRDK13dTqHcD2VCueabivCOmPh6J85L3YDpZRnfJHrjrFSUKJkqVzT3qAkbaz
	BTSHhg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7fev865g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 13:23:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7b7f04a11so134698845ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770643439; x=1771248239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HKCdAZuuGxNAXDtN64uIxZbwDy+4WF8n1CgeQagiJA=;
        b=Q2dZvrwJdFS5t0Y8YorGhIAr4cspRavf8UZNhhQS9QOEhdDrxx/QYZuhVUNab81pjX
         ZbPoWB6JE6JtteiqOKNhoEYRsNSW6gglvsAS51XSe1Mlmk5Q/wfe0RTHw+JWi9+PM4ug
         9YTz+NihzosdoUeKpvlqmSv/GDhpyw2Gr/PtfmcSzTCeZBylGpzqr2rehpwR1sksX/uo
         gd8UtLY9LlRJfxuV8FtcgO3cIwYHgcHzQL+bEZprgbNqjXPwzXoVyO6UK5K0HAVLf9ee
         hZyLFzQONSAHYS5fCHfDs7G0HdvN97GlYezHgsXhAvkCHbFyfpi2iEldIlgIhboL/Kak
         8BYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770643439; x=1771248239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4HKCdAZuuGxNAXDtN64uIxZbwDy+4WF8n1CgeQagiJA=;
        b=wriw+GGGXLZ53pbUx7hgllhVXxsjvkoWQVHP8V3AbAHsIXwEagk42vr0K5uS3Vu4Ev
         Dl9wHOm41W+zomDFb5FVzyuetw5WKRdtIFXd2rIlp4awrCIAyPJuglqOljdQcS1qCwbC
         8Nt6fH2Reh41lXLcsibKwPFw2nYlGWBMKzUC68DgHwpXJE96VAPmuxCQn/LnXTIGWOUG
         qUqySB+y2uJ3GP/tRbqA5hzK3EZ+rvxvC+j/xl7xv1k6ntndBKml3D+f5nZ1bxTcww2L
         9KhUlvpWL07rOnEl1HCsSmwGXGF+e8PjvfJXdE+Uhc5idLYzOy+YKAcPmhqTfgbWN0A9
         mZRA==
X-Forwarded-Encrypted: i=1; AJvYcCU0p457L8DDtJyEVUNZdtB3EKa6fGWGbF+mjYdufpIoq3bnwIAiy9BwTqWX3jqQWwxs53GBb1cBARW8UidR@vger.kernel.org
X-Gm-Message-State: AOJu0YwcaQqqbnmYVDEvPWeR/BrdGKiaCdcF/ZuMkZ7MdEMfwc32CB2T
	DnWoVLff27aJnL7h3TUkoRM6Vgv1g4uaXStGQc0+mbhIZMBP1Rbv5FtYwbgX42DCGK9uVWYsmmS
	jG8PkWPb5SvTih8/1MZc0JyAEvpvi0EMG1lNrs3FJTYX33gr6I8F3O7KT1009eDhNLog=
X-Gm-Gg: AZuq6aJktbCGTVVjn+GItpN2sUlis2Js9EcSdSZFbU+LwQRKL9PLhW1Vxu3essnIyl5
	pOu/tWlS4WPmDikYhkEMFr/0FriRM3w8HmdunPfnJ7m/FHY+vfH7mHZNoAfMsqzridD4OGFYXaF
	T/bHYdQepZYs62e2w6MTdxpn6BHgwHGzJ17EPgR6cJ0imcGz2d9QgfHNeDWs7KwKui67FN9ief3
	ZHwCVQEVqj5Rgj25AcijI2v4gtCCj7GLyk2FK7nq7sfwDd0Ccv6Gc/BTc2DnUjBsvL7VjJEx1Mi
	t6EQYUaT1uTUMjBs7KFE5MRzKIeUA9A6ns4rBMbqhHePSoszeiCvBAsRQs1WwzM9STwPV/fE0Kx
	kRMMEmfRgZyVwgADxtNOK2dvpY+7Aza8tNjtHIc8=
X-Received: by 2002:a17:902:e744:b0:2a1:3cd9:a737 with SMTP id d9443c01a7336-2a95194698fmr144679055ad.36.1770643438093;
        Mon, 09 Feb 2026 05:23:58 -0800 (PST)
X-Received: by 2002:a17:902:e744:b0:2a1:3cd9:a737 with SMTP id d9443c01a7336-2a95194698fmr144678525ad.36.1770643437573;
        Mon, 09 Feb 2026 05:23:57 -0800 (PST)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521ba245sm107895765ad.47.2026.02.09.05.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:23:57 -0800 (PST)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 18:53:38 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: monaco-pmics: Add PON power key
 and reset inputs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-add_pwrkey_and_resin-v2-3-f944d87b9a93@oss.qualcomm.com>
References: <20260209-add_pwrkey_and_resin-v2-0-f944d87b9a93@oss.qualcomm.com>
In-Reply-To: <20260209-add_pwrkey_and_resin-v2-0-f944d87b9a93@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-input@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770643418; l=1461;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=UiU+149jnrVM1SWUnO6BecZTr+G9PKFBnhbQil6C7dU=;
 b=rG94SyNpfvcGbjoBjrVWjDplNxVX6azl7klWt0E/bxlDq72lOpcETrbZpYe88qy3c9m+Ivrk4
 /I4EbjXtMxEDV3NlnfEqd6AiZMFfuuBjvuDymgtoP3a47/SSj/wxjDe
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: YYLUHlY5wyd-rt3Sfi0fxE_7jFIeg3_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExMiBTYWx0ZWRfX+dw9O/LVbAtg
 8g4RrwF657Al/EXJm5otG6BEmshpiIs2YjXOGgeuiS1GvrgkL0Vf/61eYMFCxv0Jik/UIZWKigH
 MeVsTSyUOfY26htAC3gM8XfWSmen24BG7S7mpWQxnONYVBm9f3jW44hbriYu4PDDxu5E6kTiJm0
 GxbWpglfYVjF96IIRPkZesObo3wtIoC09xy1Y6IW/PSST1N3Px97CsLWsKvgWsJlDm2oyKJsMBw
 vX69wogyP2yAuAZTcVYl8w190NCwbqvrPm3KZvXfrC8T/YmzZ6iOHBCLanEgswHVkgIotCLDfXd
 EI803pLOpk0J+iccMO35xF2ov9ahltMw/HFnAFqsDM3eHt3Z2g+6Y+l0hK9UuTPX8QTkCcCxDFH
 JoAhpm2iHuzswnebHWvKhY9T1ylqqvQKAMStDogaG7d3RicvGvOk/hGqzFBu/Fqc4iNB4v7JTxj
 g7RDMXm0p5i0lT1vPkw==
X-Authority-Analysis: v=2.4 cv=F6Rat6hN c=1 sm=1 tr=0 ts=6989dfef cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=waYKtz62x7MdsOGo3IQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: YYLUHlY5wyd-rt3Sfi0fxE_7jFIeg3_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92304-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.0.23.212:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sonymobile.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.4.176:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 84FC510FA16
X-Rspamd-Action: no action

Add the Power On (PON) peripheral with power key and reset input
support for the PMM8654AU PMIC on Monaco platforms.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index e990d7367719beaa9e0cea87d9c183ae18c3ebc8..182c2339bb11af40275050a36c4688227e89497a 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -13,6 +13,26 @@ pmm8620au_0: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8654au_0_pon: pon@1200 {
+			compatible = "qcom,pmm8654au-pon", "qcom,pmk8350-pon";
+			reg = <0x1200>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pmm8654au_0_pon_pwrkey: pwrkey {
+				compatible = "qcom,pmm8654au-pwrkey", "qcom,pmk8350-pwrkey";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				debounce = <15625>;
+			};
+
+			pmm8654au_0_pon_resin: resin {
+				compatible = "qcom,pmm8654au-resin", "qcom,pmk8350-resin";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x6 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_VOLUMEDOWN>;
+				debounce = <15625>;
+			};
+		};
+
 		pmm8620au_0_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

-- 
2.34.1


