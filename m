Return-Path: <linux-arm-msm+bounces-94369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOPmI1AXoWk0qQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:02:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0767B1B2764
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59B08308871D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2C13370F7;
	Fri, 27 Feb 2026 04:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gKuM4nI1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DO8tA6xk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD05340274
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772164939; cv=none; b=Gjjhnb01Cz//N4CbDgmtphXnredpBBUY9Xd9Z7VJJpp4yN56O/AexoeFvkx9tqXJevU7LirzPc2gVC5BZcwP4i/P7AUHev+srsZjL79j6WZ0YpZ1iWWNzEIVh9CEnE7lzOtrzvJq/AjUIJF6E1yG25fP/16JHdIuF6XUAMh4AXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772164939; c=relaxed/simple;
	bh=q3o2BJzqzs0/ahB44SoiYg9kTUXohZo8iM/MD7ixmx4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TRVqNQLEwoLJn6WqwJH2hkld/T7LPOfMk05UiqJIetaooIeUih2SK26ZYEf5Wy2cmZQ2T6Ol9pJtn3iWoyNrH1rxFM3OT2l0eR+MOx7cCjX3XeQKRXOx2gfkM7z4DzmJnFlsLXsIQpN6IXQy50uA4aNuSPrFAjnRZyi5UQnft8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gKuM4nI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DO8tA6xk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2JxM72353259
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=723Z8bnd8+6yPMWWqAQMSPdPbcjG1N6LvwE
	95AOgiuA=; b=gKuM4nI1f3LLKjicGgoKRJeuHvqojtrVEEfc84YUf3NtEwODTNB
	bRVi3St/tgc3Ll6VHlgh3cEAsleRJlSfQlUMvZLhN5wfoz7kaRb/J2ZCyFvctKoW
	Cl4aNUiRP42t4XVSpNnZH/ISH1X3uqDzT6nMWQwnWan/K8o8pstDFzr2QwSeHTFD
	R5QsYvDDZLeiHj0WNjk2wwJj+sIAiIbQUFUCuyo0kNNVFv+ZMPaFBxuLbSjD4YtR
	/DMVgHH7dyCcbc74z3A4oZz1Xjo7EsZxZBaXaJ9/BMRDxJaHxSBhCBunPf4r/aXh
	4oqYCKK66SPraavSU6GFkWnQ0EIgExtVEIw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u35sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:02:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad1f85d08so7725915ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 20:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772164935; x=1772769735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=723Z8bnd8+6yPMWWqAQMSPdPbcjG1N6LvwE95AOgiuA=;
        b=DO8tA6xkM+8MNOr5ujNS/HK0xQJOQ0LvLyfXDDYhRTz0+ktiCmCJwnZ5YIMzCWjg1f
         89/ks0rYxwsL5vTxv62kUYMhVc1c6/zr+yQW2+I4nrsMSEMnfuyKarko23u3fRQH8wcM
         wxyQvmfL8J0lcd+YBFN9PeF4iWCB+6UjlH8EZS6TFt6lZvCoD3/BklCdd+XS15RbuzBF
         aT3DUyMohnR0XubB3ds7N8vO7un4Al7ZjU4hsOfPv0KpGbpibZietkXWMw253zNuU+eh
         a0/oFsTkITglys68nGejW5R/xPJG2wc6f3br49h8656+AXzWGUO24hwMf17YylQ95H1B
         jVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772164935; x=1772769735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=723Z8bnd8+6yPMWWqAQMSPdPbcjG1N6LvwE95AOgiuA=;
        b=Rb7Bul+di/VUgL8vkhAD4rWPzTPGqmvRL827euCsZEQPrPHlVhvaXK4lXZbE2RPjrl
         4Yb2ih2aKWSKwBqLkBB57tNJnAKt3WkKMffjOWBiY0gtXtWbauim4qpf6kNeOCUoy1mp
         oEutQJ2mlhE2MkljZvvp7tjItD5ah72jlk6/2wsEXo+U2PgfwPCFWDj0cIrvpnyBiZEj
         Ed1yVVmoS19dfG7M4ntqB+6J66lTgV3m+/iqdBzy25r3Z90PNWakwX6ZnNCE6uV94pmT
         dei+eAicz/uKiLIEkqj3Em1Ux14hozkdpULd3BakwSy3Fcm9QLPrDuvKQ4k/X6nDYpHM
         Dd3w==
X-Gm-Message-State: AOJu0Yy0hCgkZGpoDcgtCPduS6F5Y4BWWltzurHnQSSYyx3l7up319OM
	cumMYG4R7eANL15Ljbe6Itj0EJW+TPyMVCYKsuTcF8OZY2B7QPRIt8czUZgD7yH/iobR4tNlkhO
	kWQWl8D90/bf/rtivoIeKENQGUU18GSN26whhwGd8K5vN9E2E8MmSlzp6vmp06aysUYA=
X-Gm-Gg: ATEYQzxP9+dK4abQ4PpvoMZKLST5/gsacTfw42dsicAgK2wsIn4m0+JizUuLQDcIJ05
	IQK0PcgRSvMAoIy4WBPA4kYmzCtp8PT8413evjyfUdCxpbWb4WM41kOSPMTqr8Tuj6vpXXVJbkw
	MUmFi6QEcOFmEeV8qcvMGYx/KpB2JzUSB61OSLCs02yRqbCowTkcQwytMIcc4AyVhhbQOfk7Q+K
	rmHmaCP46z91EWIiU5LEx61ZeDNB5D/E6jdBkyeugnyluRE75WOo4IgMLNm0Ki+YYlC2Brgc9ZS
	yZOtH5JACXrHDNHvkBoWF8GKBU39ZfwHoxtPx3SbyhSfF0XJyzA6b1Rsa9hBPe6lKpa3GWClfN1
	zlxfUjXOCO0QURYpF8o2il8IUrmhWq9nEKgEOjm9ocEcALvT/5sx9
X-Received: by 2002:a17:902:d488:b0:2aa:fb6b:f985 with SMTP id d9443c01a7336-2ae2e4e849fmr10006645ad.8.1772164934780;
        Thu, 26 Feb 2026 20:02:14 -0800 (PST)
X-Received: by 2002:a17:902:d488:b0:2aa:fb6b:f985 with SMTP id d9443c01a7336-2ae2e4e849fmr10006435ad.8.1772164934325;
        Thu, 26 Feb 2026 20:02:14 -0800 (PST)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a0409sm59843775ad.44.2026.02.26.20.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 20:02:13 -0800 (PST)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Add SDC2 node for hamoa iot evk board
Date: Fri, 27 Feb 2026 09:32:01 +0530
Message-Id: <20260227040201.3700324-1-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyNyBTYWx0ZWRfX6BbGFrEgq8rr
 znJmHXfZ7FtibPJP2DT5MduzJp7CWWXhNS3RSmytQ0zGVmhLYNn4d9/GZXV0SkiiT9zVLm6u+ac
 dCPJxIMhjuG1tFxROhZgmmHUlS0liES1/4BkAxtpt75BbqjLKviut9R2WpInbs7K8y0T82+9+Nz
 Nwon8GCXaoHATqo7Zxzz8L0tH8ey5C3QdEUDf7MWXRM6Kj/NwW8tF7CWtiH7WAGzS8krI8/c7/F
 AuAq09vJp+fW2OOGZRbdhZECWmVgnj1fK8LzDJj2eQRsuKZsga4e7LyT2Caz/1V105mFCUjFUde
 HkgprOZxHdmFrLjGLsSvxq1NkC+SLyNos0j9s5MlGWaRBjZmWoikcfjNJXlltNaVc7sOEJv75mH
 iVtLoGHmlT77XNhfiThXMMmApVF2tZ4PrPmCDjqxX9kdu529u2y5WLwVwdgjHRuD15r5iLXZ4l4
 ktYIV3ZpPM7QtEjNM5w==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a11747 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=zd1v0PDNnpibcOQwGqsA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: f9ezdL7H2lw9ZzJsQezTTXLj960EV0g3
X-Proofpoint-GUID: f9ezdL7H2lw9ZzJsQezTTXLj960EV0g3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270027
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94369-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sarthak.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0767B1B2764
X-Rspamd-Action: no action

Enable SD Card host controller for hamoa iot evk board.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 2390648a248f..56171e832e8e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1144,6 +1144,22 @@ &pmk8550_pwm {
 	status = "okay";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l6b_1p8>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &smb2360_0 {
 	status = "okay";
 };
@@ -1326,6 +1342,13 @@ rtmr2_default: rtmr2-reset-n-active-state {
 		bias-disable;
 	};
 
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
 		pins = "gpio188";
 		function = "gpio";
-- 
2.34.1


