Return-Path: <linux-arm-msm+bounces-98238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHaBDKqMuWnkJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:17:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCF72AF427
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2409332C6CCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329B93F7AB6;
	Tue, 17 Mar 2026 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjWs19l/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oya8rF8M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E403F7A80
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767317; cv=none; b=RxbjjRdVUAQwUj43VYCmKtWs3Ju9/IPLFTf6AG6HetEWpJyI6fl3aMmmeriI3tbFwdfXoReQkxroMH5t5Qrxl5RlrgZi5AWV/vZuAuqICZImg7750jC9MZZmvGwcnPbOujJFDKj3Oc29qHK5vAkf4cgDfllBu/CawuxxHMv/Flo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767317; c=relaxed/simple;
	bh=eNUPHACdGvd5iZVpi/2IdeMGbrdFYD389Fy9diCrOeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Odsn0URlsnWbc8pvLaiMkEdOob19L79rn94xA0uREacKOqm/4V8Lkr89hhiouSqRMap8o7MaY47I4Ikqe+T0pdC31jNwNTs14Ims6+2yqKZjDJDm5YnJm4W1/4cJ9Ap9qkrwfrNCLmwUO+oPZAjKVkS5RjKiOsRe9iHD39khcgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjWs19l/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oya8rF8M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HG9uk82006473
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQUYPq3PZR5/JyJtJ7GKTj5OPFi9JWPmB+7kOkJngY0=; b=HjWs19l/HjKULMQJ
	QszFj+0VagIITKflTIuhu9N0p+ZzFqt56DydiBvSx+bvPeESpyVmZF9aqtnmqoTr
	jQ7oOIb8Vb7g8M7nOV65EhAM8DCwp1w+T6DWyYLJJHhPRL+559Uzjvres0zZDnOA
	RYW4gSU7pqnciF49m5GPaxIeun9YEn1v9tcToJ2mFSN5x6SdYfNqL68YTBkojoXP
	DjlbfBI3Q8ASSiBcaSOnqD8FAMzcBhYCXYULt3NpIXre7cdhV28WR3WpfQl5eVPJ
	aVMF8EDTjWlXGSaKP+3Tu3P68n3sF4LKurbjHVy5j1pxKOGsO3Mnfg5ZLMPnA2a1
	hs2y4g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya83r7dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:08:34 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94e9d49f7c7so66303029241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773767314; x=1774372114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQUYPq3PZR5/JyJtJ7GKTj5OPFi9JWPmB+7kOkJngY0=;
        b=Oya8rF8MN9j2Tgy2fHp1RYAR6qvX7ywiHg2TMlXGmBVp0F60bgc2POoAGYWAPMtDmm
         m7lNNAs1xdFmUqjLrckJtqNg2v1ErVdF24i8dRC17wIPyfll4x0TYY3v8V0yFKR76xfR
         +lEJULgmUxp8qEznqzIChdv1i+sLWQ++PQENQ89W0CWSeyNmFJ2tfMRbJ7HvH0mG1aJS
         mM4ZY2D/AKrfyuwcVzrjqgugFGBaY2S7MONBZW1RuihMxd7p9UKaPakUfAs7x7jRN84T
         dUNPog4hZ+mGEFAV5WRuGxHba2WQrAHeYN+70743rxCWwuOleq3qM1Jpqrf5MpGeT82X
         vT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767314; x=1774372114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EQUYPq3PZR5/JyJtJ7GKTj5OPFi9JWPmB+7kOkJngY0=;
        b=eMVD9gKrmlEL/GkcJPWz4rCIUFBy4fXcFyB5MqE62+q1yw/fYA/oYxNa21rmJJeCf9
         YbkL6mja7AL2a6neHGtdI4EpSx7Azp5toSjf+l/d2niEflHuGasarOFGoSVf6Cx3Xbxw
         sgfn1+vpv6oALrZUt/mvcQSa5RIDhgg/aqcd0fnUP3XhxFHDqY9jY0aKtAcRAIwXPfp0
         9Og4A71Dx4pBaa3eXlidFpkhbzN9X/NjZVcv79wadH6TOBPRub4MuZQtD7kuRCqfHSyp
         Rie7PF3evtAJ7hw0DFplgLmODIFQM40MxcaLjOtViCwF4Ju7ELPrdtgH/4NBS5lGs/BJ
         Qrng==
X-Gm-Message-State: AOJu0Yz/+e01RMmZGsmxxLxO10vEm0j8Z67PIsHj8wnAlfVVA3BGduxS
	i9zDK212oH6nrP9+VGach3z74KhnL/CSr6i1+mDnuduQmlAwcMcSbF0cGp9vF4VlbLB7mr2BTJX
	4bdIZy14dkbWIv7ovcoTHNWZrY2LskNxWVTMFQa+40eB0XwCe4BAatxU4ZIaFaXxvMrVc
X-Gm-Gg: ATEYQzyeC98TYPYuwcT8/sHXf3bhJYHAoXR6j/V3lcwGCXs/bo2GCoIYIol5pzEVm6J
	6p97kaNSXyFgXEbqVICy7nVlKZbsR2johTL4dfh87fy0Ie/vt142Xw85u+84eDMmZhk1LwHDC6/
	ZrEQH/CyujPbxHn5c0cuOC90FlE2psHw9G/gbVkNYY7tSIpcE9FUNvvC2xpDXlJcZwd3yTf4Z7P
	nXXvB4qR1JBKTquM7Bm23Aq3+fiX7dKX78F7sxkoa4fP0Zi4N/ozTpDnTWtUUbMizvisXCxwgIt
	9f98kET6W8RVDMXVVmtla9DcWFJIgvZeAVed+P426DX13mX+tkEF4Qd9kVHChtSCp2Gpo2XGMDA
	ixdEITnIOgHPl5hfMA8qYpSUR6GHc3x5y+U0qxlr7s4D5
X-Received: by 2002:a05:6102:c54:b0:5ff:f4ae:a17c with SMTP id ada2fe7eead31-6027d09a2f5mr338720137.3.1773767313987;
        Tue, 17 Mar 2026 10:08:33 -0700 (PDT)
X-Received: by 2002:a05:6102:c54:b0:5ff:f4ae:a17c with SMTP id ada2fe7eead31-6027d09a2f5mr338697137.3.1773767313529;
        Tue, 17 Mar 2026 10:08:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm877072f8f.21.2026.03.17.10.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:08:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 18:08:21 +0100
Subject: [PATCH v5 3/4] arm64: dts: qcom: sm8750-mtp: Enable USB headset
 and Type-C accessory mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-sm8750-display-dts-v5-3-fb53371e251c@oss.qualcomm.com>
References: <20260317-sm8750-display-dts-v5-0-fb53371e251c@oss.qualcomm.com>
In-Reply-To: <20260317-sm8750-display-dts-v5-0-fb53371e251c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eNUPHACdGvd5iZVpi/2IdeMGbrdFYD389Fy9diCrOeI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuYqHcndo6jMhtitV5Zzu0vOTjmjo/SJ28CS71
 5g1rKzPIH2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabmKhwAKCRDBN2bmhouD
 1ySBD/kBdToEy8WqXgNXLlA4SxSkSPEk0QEOybyXeJm8TcdQU4M1AdPBtVD6YWTKTy7NB03+rRq
 PBQ6xK6S1iAuNt3mUVMQIVbH0XTHveAbfapBVY14a7AFes894dXxtQwvwOxlRO5rd5H+G3injju
 zXi1U7irAZPVMXZL0jjs/Wyyz7g2jfwa9xGHrgjD0OiApV9kYCplcWIx6JzaFt7jdKDjwlXLvy1
 dCeAY7hw7XQ19e7IbnXgd/C9axhr+Dg6tA2PeYoHg1PwmGXxnZ4JMZjw9TVWacOLohTIR7AmBGP
 m4qVuxBlZgVrheZ0yRMFEgbxoa/F9m8H5LAXWM4vLPVrRB6xjkbTu4e3WPMdYeArCTnQxJ6a/p/
 9I0QmNY/RPLgVggkgXj/hqt0Cf58OpT/z95DzlOD+CbRGMROr7dv0i9BF9/wnnxMJs6jXfedKhO
 jcap/wbvqVWIXIDpkEf7EXNuIIleo7zD2akLHbYfq1cN1sWs92g0XjcfS/q0+vgbVoAxNz/JXPX
 xGYFF5LsMxtGE/pqqKkPs2Zx2m8205ycTlwqXCtxa0qvh8BESGXs0/Ma5lkFR7YQmrS/lhbaEPe
 W05KIz+gJRRNj9I0gC+dWmLwPLSun21dBNpM9THIIkr39d5+26+zCk23BnGa4bouOmjwT9DC0e3
 2YI/YRssGOjWWBw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: F9WXtnqz0PVSD4aCMqyYhKYNmkvEqUJ9
X-Proofpoint-GUID: F9WXtnqz0PVSD4aCMqyYhKYNmkvEqUJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1MSBTYWx0ZWRfX3FD46BeV4eAH
 fhOHSrHw54IpiL9F2QIMSg5BfEa93l5j4Ze2HTftQ4C2laNQXydadcvObbC4fVLgXRiN9pxcoYW
 NiIPB/yKvbJrkp4N9OMVMphIJjfhy++mkdVFOSj1JkX7BkI/99E/4HDti1oKDi5nNcGdg65xV4V
 DQVULztGICq8vaKo3R5O3d6dHKdrS1L5/iqxyBwsftvZ6XsdQMplauoLJIGYh9iS9alrvrOk9TQ
 aGG9u+SbXxTrR5+8Bpk4IDLqEbiw9OJdrLKDFtuRgsz+0xjcVTy2FtoXN7og5a1Q+pBhspAMx3o
 jH4P17+BUa+VJIiuklH74BmYxZq6E3wprIxlk/43a5RXFye82Vs9miwWoLHFnjBBR5AB7NW0u0i
 6Fye8yL0GE/kOQ4dc7pMG9PJvxD+w+AUQyCDsB0sJ3NWAWFpeAb2hV4IORzkxRovedYptoYJB5e
 j6vFAfIYWjggFavSRpg==
X-Authority-Analysis: v=2.4 cv=Y8n1cxeN c=1 sm=1 tr=0 ts=69b98a92 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XOJNJb2f72dwbY1LfMsA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170151
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-98238-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.2:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,e:email,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8DCF72AF427
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MTP8750 does not have audio jack connected and relies on USB mux
(WCD9395).  Add necessary nodes for proper audio headset support along
with USB Type-C accessory mode and orientation.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 51 +++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 050a85df7358..6107a4ed2c80 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -54,6 +54,15 @@ wcd939x: audio-codec {
 		vdd-px-supply = <&vreg_l2i_1p2>;
 
 		#sound-dai-cells = <1>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			wcd_codec_headset_in: endpoint {
+				remote-endpoint = <&wcd_usbss_headset_out>;
+			};
+		};
 	};
 
 	chosen {
@@ -230,6 +239,7 @@ port@2 {
 					reg = <2>;
 
 					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&wcd_usbss_sbu_mux>;
 					};
 				};
 			};
@@ -925,6 +935,42 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	wcd_usbss: typec-mux@e {
+		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
+		reg = <0xe>;
+
+		vdd-supply = <&vreg_l15b_1p8>;
+		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				wcd_usbss_sbu_mux: endpoint {
+					remote-endpoint = <&pmic_glink_sbu>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				wcd_usbss_headset_out: endpoint {
+					remote-endpoint = <&wcd_codec_headset_in>;
+				};
+			};
+		};
+	};
+};
+
 &iris {
 	status = "okay";
 };
@@ -1095,6 +1141,11 @@ &pmih0108_eusb2_repeater {
 	status = "okay";
 };
 
+&qup_i2c3_data_clk {
+	/* Use internal I2C pull-up */
+	bias-pull-up = <2200>;
+};
+
 &qupv3_1 {
 	status = "okay";
 };

-- 
2.51.0


