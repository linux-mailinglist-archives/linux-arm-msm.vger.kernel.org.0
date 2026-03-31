Return-Path: <linux-arm-msm+bounces-101068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHGqICTUy2mILwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:03:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2307836A9C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18931303394B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 14:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD483FA5D8;
	Tue, 31 Mar 2026 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrPbTj3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGr4Op52"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9833F6610
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965786; cv=none; b=etsoMLXsmlB/URzMxLaXyLWzJ65rq51IaoGxX20FTE8RLwuHE/J6b25+vsMq0Yol+YDZrlLMo4nT47FvN082EaswCRgFi5Vu8ZyuwfvxHMlTwj7D0w8fhz0cjIfDMmwPWBzn0A/eOjHP1NnBqr0eht21/gvtU3RnaoeqYVxo2mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965786; c=relaxed/simple;
	bh=fdkzbqqWSqAqRWw7zg2qcBzkgVtLUE144t0b3+wpNxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=epb51gSTAgIDAl6P5AHq3t6LSSBzXx0baELGbYuABJeeC/3I2mMHLqB3hvsdk1+L285jDv2TQ3aKfYzzBB9Z1Vm01gG2e+9vTGCMoz/dl64dQPvzGwruThXN23gbYC0F7YJyqfc1wI5AQYEXyzd8T36ZB71AzCbhDtlALJh0yM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrPbTj3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGr4Op52; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VCvdH41306449
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/EPQc5af+39QtFkyXAVfTMa4eGUdvB3ATryq/oyXf2c=; b=XrPbTj3ZCmOFmoCZ
	NKvPhqZ4LHy2ck8qOF/JFf4I6nzw63VPYiF8+d3cy9Iglgw+uccLebNr3zjDGCCh
	gHA/0P3AnTPnE21WE817j6Q3lqYSFijW+n8DpioKQyCfimxoBPvO31l57hJBxUsc
	bZRNKey5aEBg4r1bUc8NMC/BmLmfhQhJdjPBtWBZ7ouYG8+gJiOsin0tHocRZOEU
	k3ytO5+B6PKopQgszbZwbIGIo1v+pjDemBZtJ7igjQkDTfXR+cp+gpQN6PaMPM5V
	0nFy2HnxXAwtPNYa6XTsPFVg+jw06KbH5f4aBZb6a0wSdmCrKXPVsnH8rEjTtGOP
	GVemhw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ8d2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:03:03 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-953b15c76fdso776264241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965782; x=1775570582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EPQc5af+39QtFkyXAVfTMa4eGUdvB3ATryq/oyXf2c=;
        b=kGr4Op52wCsxfexn2bhjUmVrmPdR51hKZHm7JN2Bbc/MvlrpUN1f3YtG0GQPlHznfk
         TgNewNwsDLXC+peluLGXw4KQRM7y7CyZ6eYSsuMYkBMnpztUV+n3b5DjSXB+tXTgoKwg
         QQVLq1QrNvhMfOM3kndrenCzvJioG+0Wj7zVCdRfjo0HSbYn8K0FcBtNwoWLggJvwqbX
         0D6Pa4yESCqpvB0bZK69Dac1seh372jqfnToBN8zStJBhDt8g+WguRJSvRh5YeuT2A8+
         hmH1E0U1F8H55P7qvGV90zedcJq6Grwpp8lTE3KAmZ6J6HHdv+QhhanqTi3Id7yUqNl6
         ojfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965782; x=1775570582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/EPQc5af+39QtFkyXAVfTMa4eGUdvB3ATryq/oyXf2c=;
        b=hqQYLTgxdTmyvpUXXaxs3pydyrVFtqpScZVp+PeSWABIm8qv+ki1oxiP/BzwdKCWq4
         nvzbvy7idHE6YQBEFE5BCz262xPc265OV9JmUFI5k8CmKry8MXZx7QQ071cuy6pA8qRH
         soVr/aodn8YoFX6sy48FLS56ja4sa3pHL6Fgj/Dn9cCODNI3GSgoqrsQbXmGMitFgV5w
         hlsPZ1uZdd/+k2s07BFMPv94YbevhJzddnRqSLQg6fv2CSnRSPJscM7+/N5ds6F+STkF
         LgGBkJs1ji/9+9tm89Ls3hKR8I+jpnwEqJAam7MzzqdOmoNuRItGtf5Bfo5t/MxSDjQ8
         Uc4w==
X-Gm-Message-State: AOJu0YxUb0RyH7gEFfniPtCIBREY9JD11VKUE7ySb7z7NJUkFsn06Ah+
	I0fBimcshJ/mqL8MVTdWZhxkQcFL1OaVNtqDPRzDIXlh81JM+EdaHW1PNNkD54DxOFuU+J27SXJ
	uvpqnS/sDUZYy5hFctTTjcLEKh06flFGJmlJqwQSiLJZk2YekuAXOPgWVoJpNIaNppaG/
X-Gm-Gg: ATEYQzzo2Xt0diavrIJZwVskvv6cmHDhLH+kb+9a5ZMRlpfGCufItz8meDqeOHQuSmE
	g9FKiAXECikETNTmDcWHMlqk40d+8QKBZspven9KQl63DuM/6yOamPZJsvSlYvO9WzRZZggH6ja
	qmyTMJN7JnVbWNPMqjOuCby4jz02pYH3uN1B2+ZR09Y7Bvl0rHdilnFgXUD7J3tSD4LiVxDhlHq
	V+/LFp/COtF1A14Xzfxla4f+0e7Km5VF/ydvkTbt0PZnsssl6yJF8wHbw9HhXbsQcGWW7fUSHSc
	ZPPyGconmxZkk+m/TWqHtLKmgUZTc2dr6sU8NjnXaPuDI8dYk0d3EukzSCa5A9MP4n3o+vEkoki
	OObj57uZqUepzLoCYH5RVsmDP3FfwEMDp88llDOAQi9J9
X-Received: by 2002:a05:6102:3f03:b0:604:d2c4:98e5 with SMTP id ada2fe7eead31-604f927d729mr5475012137.21.1774965782006;
        Tue, 31 Mar 2026 07:03:02 -0700 (PDT)
X-Received: by 2002:a05:6102:3f03:b0:604:d2c4:98e5 with SMTP id ada2fe7eead31-604f927d729mr5474956137.21.1774965781494;
        Tue, 31 Mar 2026 07:03:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e9630ddsm36610895e9.13.2026.03.31.07.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:03:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 16:02:50 +0200
Subject: [PATCH RFC 2/2] arm64: dts: qcom: eliza-mtp: Enable DSI display
 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-dts-qcom-eliza-display-v1-2-856f0b66b282@oss.qualcomm.com>
References: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
In-Reply-To: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fdkzbqqWSqAqRWw7zg2qcBzkgVtLUE144t0b3+wpNxQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpy9QOQlKgtHkQDP+Lv6P1H5as78dgMfFl6DVUi
 tLTeI7JmeyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacvUDgAKCRDBN2bmhouD
 1+PjEACBlyEQwvNmUCOtTqZZwkps131Yi7PmSy/4XvwRYvLbezSNdnAftovvcsgvo6fks1/NRuR
 BDKOumGDYWxLs8h4Bt9DQlHs48LamLQBpnENi3jarDBy/UIfDay/fBk4BwO78n2B6G2gmn+OZ9b
 00JabOFCHF/mn7/GARqcqBqd08r/wYaat7e3Y5tyQnFVB2UqItYnaM0htzUMofEdzaUcZRVQ+mF
 yoYONYynPImHXaf5j5nMnaPaxKgccLHP40/8n+8evRZpW4uzB6z6is0EkOdpX2aDgaCRHeqjo58
 ecby7Ln7ehgdlxZc45+WZMnbVzojAAAP/5OaYz3ndGNKWa4NdGu3KY2k65IUlcRu+xX9BOZJ6Pf
 nMHom/64w8Xr68ZxhNdH65J9uC6jGNKYuJZo6I/pbGeYL5OXCOPltFgy6FIq5q/ze9dbbB4U9ll
 7czrx8NS/DLKqEEcVVPlWn6lqWFwZi+se6uGCM3xIaEKAcSpk2/POdVUp6fgW+vf76vK+HHr+Aw
 q6Ypmh4GZoXpJxAXOAYkFBGWNVIhir1cj2W08EGFPWnVQqeda00pOSgVUfgqYVm8njTALCxX7tX
 TIipyydVP/CZ1QQzMhLb0I4irIlSANiuXioztZw1U5Om2shIGg1XrjF9Dtumc7ULbzVbB45Eazq
 XvwrSGXLYzb3XEA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNiBTYWx0ZWRfXxowbqdCG+Uyg
 uJCavHgSv10fvYBa91+o8VhIstF+W6Yn95deVKuoYZeze6uDuNoRQ6cgPUBNVXerobD/X2chzqk
 9sLS+3IW+zJO7fqEv+dP5Lf+gDP99KLgJ3MaJeVNMPSjz7aFj6jHWzzT1iSy1iKRJUHEbzx7qZe
 t7B4VwvizWVpnPB6ccPsH407hSemGEm9uGzEidN0C9y8bzw7y61RQOgkFPFHZTT8BvgLDV3QELP
 PCRZppQ5b1Zy29D8AvG+a9HaBtFnGmWtMYF4i2SmMSx/SKIAWw0lOaUyS+yWRIA7YhnibzrcB5X
 5ck+fC1AcD9SQIfjSF0PfiZCXpEIdooqi7xiUaVJ5tWZdbYYXpQ3RQnVbJs+DiXWYH1sDyjJgpa
 QUqVVQkotvP+9b0Es0jUWXrxlU0hEi1aTLf15o4edU1i2zWznhbq5DW7an2vtggFoGCgGRo8j/P
 4WGEsQwLOjmAkWOoOsQ==
X-Proofpoint-GUID: UuK6kiuCg5-D5t5kTBYz5TfuVAt8466C
X-Proofpoint-ORIG-GUID: UuK6kiuCg5-D5t5kTBYz5TfuVAt8466C
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cbd417 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WClv4a58_bZJ7CJg0cMA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310136
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101068-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2307836A9C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable display on Eliza MTP board with Visionox VTDR6130 panel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index c31f00e36eee..df0cfffcef61 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -417,6 +417,48 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "visionox,vtdr6130";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vci-supply = <&vreg_l19b>;
+		vdd-supply = <&vreg_l1g>;
+		vddio-supply = <&vreg_l8b>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};
+
 &pm7550ba_eusb2_repeater {
 	vdd18-supply = <&vreg_l7b>;
 	vdd3-supply = <&vreg_l17b>;
@@ -433,6 +475,27 @@ &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */
 			       <118 1>;  /* NFC Secure I/O */
+
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio17";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart14 {

-- 
2.51.0


