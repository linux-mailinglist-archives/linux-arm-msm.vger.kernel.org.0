Return-Path: <linux-arm-msm+bounces-77372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29880BDE175
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64B411927BF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FD231CA61;
	Wed, 15 Oct 2025 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5yF6ROD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3744A31CA6B
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760525581; cv=none; b=n4hHIu2FWnkj9x45O37kwPv4lEtFi9mwkN6B6MKY125OAaGmQ2DhIvhRc5L2LR3hS7Dc8KWjSTqgMPJfe1U5aaZQsWVTD+ghQ1pHqN/2YHYo9BaE0AUCqnxr4jVzLWqPN60+gQLNvHTHJTPEhnxgnY1Ab7al6Fh6emf0IYNZSnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760525581; c=relaxed/simple;
	bh=sTi0mjMgcJhdedOXtNzqmiW6VLMIuc4TNTSQ/qMYOn4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OjbwwmBlvME34OOIYiUm/2Piuso8Fwl25vud27XC0+0Wy5H8OMp+q1srhuSzBrHtiFm2D573cdDlaNPcwv8Mks9kuIEHQ3v4/i15cXtnQ6oDQAtIzKExYRZvs4W67Bxomi90NE9+7RJV534L2yQvr7DSYYFgZnJRjWdO8WVpnLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5yF6ROD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sDqK009231
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/401FWP9t5m
	7Jf+b/B3IO0Kir0IpsFHNMXaHyzjAR3o=; b=W5yF6ROD2JUbxgY1TbgnljK5qq1
	8ovQ196ISG9kLZLI03Ic/DsnjKQ5OODhw8ii6JMeWasT5HowxG4kJ8VI2HJCJ0AS
	Nh/kGCKWwW8r+1ab5T5HPV4KzaRndfDEcD74Vq79B8jTqDNjhBWmZ5gqF/+oWV55
	uWwVoo77VlvSCloUwywzils+RA9Ti3p+uQS+scGyT1xwCAG4DlFyTRF7lqpCjazt
	WHoMk2x+EJsEIN0HL94c7bak+xvrH/bY12HCJEEzoQklwsw/5yvfhc8titAF1bl0
	GTIfnq8lpcF2xL+Y6kdnXMicwT5sdhDpP/LznfEnFscjsqfQsvCcnGxh+Ow==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c424k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:52:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5533921eb2so8025178a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760525578; x=1761130378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/401FWP9t5m7Jf+b/B3IO0Kir0IpsFHNMXaHyzjAR3o=;
        b=s9JYOmlsbf4WUijyI+3aOWFlsz5JNJeA7efkxS7gIPucM1/B6mTEfmLMq01dom3K7H
         LCot5UWvaHgU6SXoqiExmZLmcV139BybCaSLmjL38D0BfN8rEYpU1i7VR+itxEjZHdz4
         n1+kWgZ3OLaS5YOFkybFcEiejahguBfL9mVI1s7BBWhcSOji/jeuHmcI5Ki5sKy3fxn/
         CKyLpMZHECLfTco4ixE6f0RyCZEPMXkr7Ti48JNS+ImJkxhIXZnm7dG/cuNgSb5pw/ud
         J6XDdtdIgiQOjY7xyRogM3T+LXiInomBoAr28RREXx5NQra/5OlC07iOi2q2689xzRSR
         W3aw==
X-Gm-Message-State: AOJu0YyGzVbCI1BUg43zwQmAqDVCQpgvqr6ZDFhhsGsWYp5XHkdq1vFU
	lldL9JgfDgG9d2IdkXFsFriXtbV5fkiGLccxX8kWU9wxlfvPuy2obyEZ5oUmroefYKScQGvNQdR
	PEzQeZltOZD+/VbZlc+4CF1HTgP3bc8JW/B3O46KIvwKPYwv66a8DoOpfhGY+iw85m9cw
X-Gm-Gg: ASbGncuR0uQYp3ghi4GMZU4BuLz7b06l6Rbaz6rsUqkuHXr0eMsaKhtrWpW39IhhteB
	nLk09CvKgKHUpL/n1888tM3UsFuRDY5uIQ4f38xEuL5EUKYcDpTCR40wTkWqzUqJdyYeGVhTMdc
	drOGtQzfj0FvoU/yFCMGVShSWVUURcapbWUZKoqbIMB3oPbbV+NEzsOBoRHYpfbZeAVMgM4QN1O
	x66D5zbQ6UQHkMPDhq1qbzYE4SGaHoxaCSx9rhdZWBjDMb4G9fP7Lb93hicx1XoeMLgazM0+acb
	JOoh//IY8DfdiwuJi8QKNs/uiZeu/2J7xApNI8SPAr4JplTXHOXDrNlKS2rFq0xyEF0Hgqx3/SN
	iaQ==
X-Received: by 2002:a17:903:1b0d:b0:27e:ee83:fc80 with SMTP id d9443c01a7336-2902741f56fmr318581045ad.57.1760525578287;
        Wed, 15 Oct 2025 03:52:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoemfCYSTXrYgT0AV+vF05ax/7/vMsr12lKaTHQmgsRF6rfncvPZRSkFSThvhgQ2qzIDrfYg==
X-Received: by 2002:a17:903:1b0d:b0:27e:ee83:fc80 with SMTP id d9443c01a7336-2902741f56fmr318580595ad.57.1760525577755;
        Wed, 15 Oct 2025 03:52:57 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20f8csm193698385ad.49.2025.10.15.03.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 03:52:57 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>,
        Eric Biggers <ebiggers@kernel.org>, nfraprado@collabora.com,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v7 2/4] arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
Date: Wed, 15 Oct 2025 16:22:29 +0530
Message-Id: <20251015105231.2819727-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015105231.2819727-1-krishna.kurapati@oss.qualcomm.com>
References: <20251015105231.2819727-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Nmj_S2oMxWRMVi3SsL6NOvghhaFwrxCq
X-Proofpoint-ORIG-GUID: Nmj_S2oMxWRMVi3SsL6NOvghhaFwrxCq
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ef7d0b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Tsvuh88POXG944tnl6EA:9 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX8Wc+Aa94E8Ty
 EDtaOMftOIMwDIS6HMgiGXg02R9JWPbKIslkcoA1a/qeveyL63lNvhN5UMJRam6UUKo6V2mzApu
 eQGVdQYD3zEK2zydTyfziWvB7itTy84SRJtRzJcOa4J6uAxiZopdAuvl8vrbrWjE8lvDKNerciO
 Nbsr0QCGovjpFbLbzMeh0lU0Du+9978Qxh6pST1Mc1gLUYoCFwp+I+DQh/pMcrDC+RWsCk82e60
 MRE7h/wD9CRr1y/rDF9kxEBVN4/+cJ0JkxPNruILjIHhdW8mNkLXT0CGR0FIhN9sifNT7umJQ0x
 wJzokS1Xy6TGJ1zAFuVtPIZS9K+eKlanng1WndKouet0tStjj7xEuagQE/L48HejymUv+D1Mfza
 gAzke76ckUejOIlYeYtuy+Z9pB8e6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 MTP variants.  The current definition will
start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3bbb53b7c71f..815651f65214 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1121,6 +1121,30 @@ &uart7 {
 	status = "okay";
 };
 
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l2d_0p88>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p88>;
+
+	status = "okay";
+};
+
 /* Pinctrl */
 &lpass_tlmm {
 	spkr_0_sd_n_active: spkr-0-sd-n-active-state {
-- 
2.34.1


