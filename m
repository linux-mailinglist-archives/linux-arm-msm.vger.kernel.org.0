Return-Path: <linux-arm-msm+bounces-104686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLXHLn0172kw+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:07:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3744F470955
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49B12301727A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979C03B531A;
	Mon, 27 Apr 2026 10:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuycH58P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiOsi7hO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2986D3B4E95
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284345; cv=none; b=TdokNSOdG+PuVdz+24bNnMgqnmm2fupimE8mG3iA61r8B3I3glXt827nwpYzPkw0uX+DkU/9aI/W5Wgfnhto91ALWemHB1YCwu0cl/T/BToIzjtXYIwVgrBcAzT1FQVmWD4nxq0ON1cyV4md5VYKGT41GnadDfrk7ohR4TdFdOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284345; c=relaxed/simple;
	bh=n3Dj9ex9DeD+L+lQKKQOUzTFyrR50tsgxLyyinSeV2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H7kxhLphjV/CVPZs8q6I09Zb1LMc/S5EeQCbQ/hbgdM+I1KvxB1kc4noa3oeggUXYVB2SqV7BcPT4ZTZK6F3Q6Xnph7VEeCsqngQlitV+IHrTvWa7FCsyADFO+rWr/b2L+z5dmEnqTdIM8fxioQ98+JwNPrphIkL5KgSPZ+dc2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuycH58P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiOsi7hO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TG6r1501692
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwpSnd+xI/zib862gFlteSCwOFEFE9mObuftCHljYWg=; b=AuycH58Pn7nfM35v
	HgR9QbZ4RIZH4mTeAbsPZ3WI6dt3hML2aAfsz7Y6Q4nNXbdzYqobutZiqljTUW3y
	RixshYN8knxww5P9No4RLpq0j5OiY8cS9S7qGS1O1xlidbtT8Sz2Os9m6YJWIqKB
	QlQKLBXeU0h5N6VCDpNRWR2MZxhOl5Vb9hXNq2kcfZC3Ve+FoyxvCye3o4B5haBm
	KFGjRgJXFZYtqqF0inqMnGuPzTUyrrd0St9WeLSr5Rah0wIxV9FFZqP8BIVBdOav
	wcDNEzTJKLWZ2lkDiMR1uEYU6U0Yx8g8wFYbddqxcS2KXOpPfSeIIoAxZ2Jokr66
	zbD6Yw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrnjhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso4336275b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284342; x=1777889142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwpSnd+xI/zib862gFlteSCwOFEFE9mObuftCHljYWg=;
        b=YiOsi7hOdUvlVBPqk/6PK1JOFfKdepVVj1vAbabkL7zS7e0ZO/d/BMm24egQkxe5BO
         qmFTM3jJtf7k27tAeq7gJAMEpGmggNLIeLiL1Xt/hCsuLiJ7WHkdTrGrzRJG9KplYpmJ
         qPArt8UTUjG0Kui9aIgfBXwTPfZOUPO2fmPQHZA6vFZnmVhlmkYLLH03pRgrI53M+LTf
         2eWx4CVZiQw5jkOwMKKXSuN9eEwoeVWr+AlD+k3+hzh19/o3rmb798YA9bFUCXvj4Y4l
         y9/j59UwOcwVeElvOGLEtE8vIlaTQnUgZT/hAxVP4T+LQUBifHq69AKz5hHassjgXzdl
         JA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284342; x=1777889142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SwpSnd+xI/zib862gFlteSCwOFEFE9mObuftCHljYWg=;
        b=fuHy9drTQbKMLNJcD5wpCEi/2eYpc+T4uWiMP+l7kbrivbu6D/e+6KL084+2XsnM84
         BLj9k2SVCCReBErflYpmiw0aWyd2ulVsG0F0HzgFUDzul9DkTaXZdQvwt3heuBXDGy3j
         LbYxy3lkEICVYbxy8yTk18okPohREfK8VrZIFBF6dfphNMh65kL6zCTJAKrGIVRIj633
         Hh8DmTui3mHRZMALQgx2mn/MxO9CObRe7/drbtmN7mC7n6NFdP8ThtmAWrnlAcZJUhOf
         9dNVGL0V8PgSiSoEmJp6Hxi828AxM42u2IZmQKK/KMs3q460apqhbQMKgO4VwUhbvbOe
         tUsQ==
X-Gm-Message-State: AOJu0YzI3ypqTKsKwQVw8DBekGNpvhVezE8eKp3PflJPYuvUTMLCVvgu
	/2dVxXhbEt32Of5YWvb8kkyod38MFJiIqLZNyp0dNsBoD95KP7YxjAvE9cyxuCHsmGkr6gO0Rsi
	ZL+3owrLS0+ml5RokJBH5/hkjZUM1ykZZLeofWozVRb7yQ/u5MM6rIPoJsCIdfKj20Ljj
X-Gm-Gg: AeBDietc92gnKF2MWfx5SYofumb63yBbDJQSULqkXY9ClOSskzmScEzFoRGQugUXvgj
	hg04utpGWg9dgMDMknWOJhVM1lohE/TCmWACpw2MRtXsRt7l+fHO5rHpxXG2moLIJajG2HUr6WQ
	YbAAayyzS89++X5cjIC8UcD7yunRgN+0vJ/sZAaj5USEpQh5rrm/EGbkE4uEf0LF3qJLzIuI658
	TkocQyyy/P+LjVxAzWii6FuL2FzMJyDxCSh0SmER57mdyTXaM5P1+NtENr+LGee+gnDT2qrGX2X
	dt0uLR81VoOfIj76ArE9g/2wQ6vhFdDUjQXBvVls7kDRWWa8+DDmFSYkxPPhlltYk9+95pv+lYa
	uAagduJfc/vK9nHsWS8zBCcyq1y9n6RTw59XmZGIfcFN5BOuULpH/ExGYp1CNrq9ljAeuBWXeVx
	GvTPmCnqFzxumQPromjX66WHJhR3tEs92smX8D2kOTgfw3
X-Received: by 2002:a05:6a00:3e07:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-82f8c919150mr43912414b3a.46.1777284341795;
        Mon, 27 Apr 2026 03:05:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e07:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-82f8c919150mr43912352b3a.46.1777284340843;
        Mon, 27 Apr 2026 03:05:40 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm33004008b3a.60.2026.04.27.03.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:05:40 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:34:54 +0530
Subject: [PATCH v8 3/6] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-driver-for-ec-v8-3-702f74e495f7@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777284317; l=1650;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=3BLnT5OTOT0qEyowVKSfm/R3DNxg4MouTyG+K4wg5xE=;
 b=Hlbo3xq6s5a6jr3USS+Pcqn+F0iHwlc9CIYWbC2511TyN1Y1eaq6TwYcu+raC6WosoM7rMxuU
 zYss128YWnKAfipuhrCrQmJjeOKmKfnQOH+rmrv9oeWf3jsSnIJATaN
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNSBTYWx0ZWRfX0Ik+sTCJBaZ5
 hN1TXJfue3AqDpijv9zZyy0P8dH3E5lrshJWOy55XjW1KHY5Oj5SHWWKoRajy8AvezAyVKPB8IY
 OoGvT7ScZXXffdJkgOPnjJnNe4zazL+NiLLiJ8vICPGuafU6no24fuHGY/NXWxx7OPpcap9t35X
 2v58yzCgK+NI5YGhN4+oOCGbwUjF4fATeIGphKL0Kwkj0Cj3hQ1zg/gsLmy5No5PY8sV2bUsseK
 3whuN7uuc5Ycj23C1b/24B86DDGTl2FbBNPHIVhxJfL9ud4Gcm6dGwYj5PAXTYvh8iLtP9fiMTC
 mSR3pS1+epBUZX8cnyh+VxSpirW929JA72y3h9sZmSxsL5jDKXgySn68+dsq193zdA7AU+58bsz
 ChIqgmdFJ9DyuqMnxucbWNkMXOidFrZ2HqIs6qXPSIJrDPft7XfVG0jEqQeJwJ4CBxRvmcsSPhL
 41UAbepmIchgBBc+RCg==
X-Proofpoint-ORIG-GUID: SNGlBxK85UikaLQ0-7Dk_Apdg55EaQDO
X-Proofpoint-GUID: SNGlBxK85UikaLQ0-7Dk_Apdg55EaQDO
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ef34f6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=h-fhkJo0eXD2C244oGgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270105
X-Rspamd-Queue-Id: 3744F470955
X-Rspamd-Action: no action
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104686-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.76:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Glymur CRDs which adds fan control,
temperature sensors, access to EC state changes through SCI events
and suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2852d257ac8c..8f684f3402ba 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -433,6 +433,22 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "qcom,glymur-crd-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -565,6 +581,12 @@ &tlmm {
 			       <10 2>, /* OOB UART */
 			       <44 4>; /* Security SPI (TPM) */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";

-- 
2.34.1


