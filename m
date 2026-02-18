Return-Path: <linux-arm-msm+bounces-93300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDb9I6rxlWlTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:06:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F054C158148
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17E19304653D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 17:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD0122D4DC;
	Wed, 18 Feb 2026 17:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6+WEKnk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2cUkaW5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAD63451B5
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434367; cv=none; b=O5tR2DIUP5vjTdUEq9GE9r3WL0ekxYVzndWEL6nz8m9vsuQlp+ZcTDA7Ntf+JWhZV7ht9KIwWn+GxJTxjSusYiJiClO1m0Xe1wA2rIMgdEDBjvQ9b3n+a5fFDZCVeRDQENVeFmQ8vS++XX+sCH7wR5buIkiFBMQr0JmWk8SM47s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434367; c=relaxed/simple;
	bh=lkHood7d6BjFAbHpw0GJreP2gx9XJjrOFr7BLxLJ8cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AIDQnXRjJa7eEjY0kRK+ldJNE0x9+Fyp/MWdrge3KbsEfUslyKmEN4VqDOhymA59n/XoO+Cpgf32vkLr2mHOXnGgJ9dElaKloclubyqOoCZnTd6UMQYDQVyEmCOshOcoq9qa2/Awf91xwZcHCvp6dAozSEAuDCmj0XFM6WIqNDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6+WEKnk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2cUkaW5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IAILBx420036
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xu4o+5ZxmioK/xoEVEe5OXKNbyH2ZgXepB5/NJ5yYn0=; b=Q6+WEKnkDFnwxf+d
	uvksiy8Ns6fIWnL6nQQt1f5zsK8aXtYg5qD5yQMUmKqUBQ8p1JPEVpVLLvVVU3ZS
	XoCt/CeRD1URwV3CtLI0F3J5hjzmjslxDhbkgALZpyqZJalfxB37bWCCNWRPLeGf
	HinVWhKuZICFtUR4Lma4572kgbIFltuc/MR8yK4AUYFESqQpmYCstQ/pJ+CtNXY6
	FgAhZwDeQAxPGAefd1f1LX0BPgk594UWW1EkSrkzQgmIhCeHFIHIk2NjJvveMrpb
	dA5puD+4uFaLC4c59VkvsUZAyd9Ks/Rv2wx0tcGUbrIMO/qZqzk8Lyc+O4PC8WPI
	VO4hiQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd0k5jqmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:06:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3d11b913so8440285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771434363; x=1772039163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xu4o+5ZxmioK/xoEVEe5OXKNbyH2ZgXepB5/NJ5yYn0=;
        b=W2cUkaW57i5xO68qcoDkUtX05QwMNC8KWgNidRaV6rnm9K2N3V+vweWq3kgSPUPx8A
         d/nCmkfKLooIXISvgFoX962hxa864KEgu+G8eNvmnZQlr54m9oOTq02OYX/ntNg0532o
         qJkbCL8aGHYdj6dRTDUsJD+zVadPFEPF7HyEUB0I1yusrXgN5ZAUfH+GYX5PdVjK0gLo
         PlD5XQ/9HJ50SZrsyOkMVfFIXQhsfqumMwWNzuG4WhH2G//eBpAXhC9XY68Gulsw6eKJ
         twLCGLVYj+JT3/IlwAlWOU1abnttcPju9YvbZjN+pJfXd/dxfJPVoFUNwWF9/AvxWYou
         LNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771434363; x=1772039163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xu4o+5ZxmioK/xoEVEe5OXKNbyH2ZgXepB5/NJ5yYn0=;
        b=mNzAEROvZqyo0O+zj7kYbx0j8HnmL7CVxYopBSrG1U3fBqrbldu+tvCjWtk/BgkQIS
         LWi2Cu+L+6+RFL6ETWTTKXeDaQ5wdP1L76CJPSl0xY5O76nx4rs+uxb82jk0gMOUydjP
         3KQVkL+NIXnPwWkLSqEm89fWJ1qAiuUFPDEcaStCB8bFN0rJCEsdR/cD+qPzI4+dmawV
         kp2ZoK/fKP1I9wY8yjUV1Gy9k5CvxYXTTVZ07WeqkibhxPAkdpEyUpETqaj2ORXC1E/d
         HqihvcRXMk93QBGJbGsh1majtW2KIOJGCeoUulFMsuzONnM+015A0D905cYDh+41X6Ne
         SPog==
X-Gm-Message-State: AOJu0YyaA/gdVrjTZSbnAGNxJpKwGrpPV3psrvsGd3thWjzQEuvtL5OA
	vxciGTQoZwtG5BDnPj2AkgFzBRYHPggmqpp/J+DEx7lPn2lb0A32W7iFHpMupMN4nRyOvof+FV5
	62Q3qY2W1hNzIW79QULdWFdb3nsvjiL2ST2qTFRpCWKqAPjFoTYZvTkYdJ6/EgXSPOe2J
X-Gm-Gg: AZuq6aJBVi17BSHFGb+QevPguU+vGUDryCA7+ESKJtb6uCKFEq8HsqN1V+AGGCt93Ej
	uibBco/S/rjQpgww4ddH8X6ThJOTHATx95jsyD4sGmVgHoeM56GrC5Wh4Hq6aGVHt4RwSNMbJwq
	vZwldEMXXEKwA+MgitnEdBLbkYi2qsfx7wMta86ZrsIcimdq7it4MX+Va2KmcrYC1kWYBjUrkkj
	mrAZQOOHVFIS1UpT9tibIajT08M1mBOnuqCWn2W+PE+l7dTPq6QQg7bHHF0OFIh7avd0zOG1JDc
	VWoB7NRCdLxRqK8SdFQnrJJOoUlW5DkFyN+RAxn+PD6YhATjj9m1YAZqRDJGw7SsCteyN69qaX4
	bR7F7I7XLwvTTebgryzjkYrrZ5AEi85fDb60MDZYD27UPLg==
X-Received: by 2002:a05:620a:4802:b0:8ca:4444:26e8 with SMTP id af79cd13be357-8cb740dd2a7mr286914285a.63.1771434363406;
        Wed, 18 Feb 2026 09:06:03 -0800 (PST)
X-Received: by 2002:a05:620a:4802:b0:8ca:4444:26e8 with SMTP id af79cd13be357-8cb740dd2a7mr286905085a.63.1771434362641;
        Wed, 18 Feb 2026 09:06:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d994670sm482188845e9.4.2026.02.18.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:06:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 18:05:43 +0100
Subject: [PATCH v4 2/4] arm64: dts: qcom: sm8750-mtp: Enable display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-sm8750-display-dts-v4-2-1743e9848864@oss.qualcomm.com>
References: <20260218-sm8750-display-dts-v4-0-1743e9848864@oss.qualcomm.com>
In-Reply-To: <20260218-sm8750-display-dts-v4-0-1743e9848864@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2149;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lkHood7d6BjFAbHpw0GJreP2gx9XJjrOFr7BLxLJ8cs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplfFxNNR8wv8AfSuMU67yDP+q8ppsazzRkeXwv
 98oIFn7UaSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZXxcQAKCRDBN2bmhouD
 1+HrD/sFjRvJJiBBf5m+PCtOj1BkM1+jins40devJywKZrzuNbGHGfHo5VkVnkPSqqdN1wDDvVM
 FgX9Gizhx1rq1Ilue2ePvU1S6UQ9suGCT8VKfDjDiV0on/S3fsdh02somfLa9T0bx7Fxto3yl3q
 Gjz9IuNfBZJwB1lJ6vDin7M7FgAQpfhOaZLdWfKqlg60I3LznAHjlhvA3/sK7lbdSLc9ph1yeJM
 6Pk9YjM/EtIX9rRMO5RtwRBE/DtbIN0orkddF/l8trSacPPkLunSYbQSOqZRIPtseHwpIZaiwaq
 wKLcEu6LthM6tcyYBnDCcl/vN7OJdoGinY4TNLNW3Ga+cFhpQDI6xmACbS95xMsd5JfZV9RItmL
 fiAv2mVVbNG24x4q6XZrO42zXGkIx7tT7Ba4XYoBVfvpHJJ6niyq2beHO3bmjSl6BAv9KHI7gH7
 eH5s22angXq8+MXM6UrHODWAuqppDaXKdzHSy5uvsVXsvuPCEfNZQN3YlfkXrDL9l93vkm77Jz4
 uu3irYDNHyCfyOTu0nr7/05IDvZqlriPTt0Y/LqN9+xfkR1mWUu0aDbBOBvLCVCN2GNMeAjYuj9
 bwyL2G2tPA1vqFbweqWlO1VDBNHJ3W/z/th1v2Z44KLXCV0iZNj6+qnx4ZNyFmuWCRw6dlrws9k
 6An3R+Ly8gSwJeg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=JqX8bc4C c=1 sm=1 tr=0 ts=6995f17c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=2EIfaDKYVuuEVWmasugA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: OSo8rC54qvUgZy-EppFKO6NZ4kitKqrl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0NiBTYWx0ZWRfX+FaBqAk+Sqvq
 xtai6hhSE5yZGnwVQ3AvJtT6Km4d5y0q2aJe2gGefXmmY9msNCzl1L3mKUyDjkEH+iNFn6Tnlfh
 LXOvjhH6rLjszUuRXZ30+/Dp95EBqHMS0zthUAZ4x096OniXDQpE7OPKOxoGZhh808UicAYW6Kb
 h1LzrFNeENg7zdJ29Noainv2Y2uhWpPtHZ/BgCfs0Y1eNtAmu7vfnyfBnVcGmsJS+BslLQurhfu
 XEglD9wIGq+zIO8ls8AN07EYemsHuY46HearAPZsxwnnhgm++wfBnOW6DdGEQDPOa5uLtMy7QOx
 mddZVzqsyf5M6zBATRs8Bx2dHyUgJflwi6P5hemclo2XKQgqTIIqbtkOXoIMHZ/nq6RT9cAcVDP
 TcNvhw4wzTuzaVGBJRLGowDzvKIDnN2xp1DUyLTW7a42uAFNRn3WhZsBqG7doYYwHkTXm0aFDwg
 uE8jUDBlRZRtfZJgPJg==
X-Proofpoint-ORIG-GUID: OSo8rC54qvUgZy-EppFKO6NZ4kitKqrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180146
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93300-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F054C158148
X-Rspamd-Action: no action

Enable display on MTP8750 board with Novatek NT37801 panel.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 63 +++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index cb718331496e..050a85df7358 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -937,6 +937,48 @@ &lpass_vamacro {
 	qcom,dmic-sample-rate = <4800000>;
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "novatek,nt37801";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&vreg_l11b_1p0>;
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
+	vdds-supply = <&vreg_l3i_0p88>;
+
+	status = "okay";
+};
+
 &pm8550_flash {
 	status = "okay";
 
@@ -1225,6 +1267,27 @@ sdc2_card_det_n: sd-card-det-n-state {
 		bias-pull-up;
 	};
 
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio101";
 		function = "gpio";

-- 
2.51.0


