Return-Path: <linux-arm-msm+bounces-74339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 737DBB8D66E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 09:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0156917FC90
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 07:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EBE2DC32A;
	Sun, 21 Sep 2025 07:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMr764gV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A462D9EDC
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758438718; cv=none; b=hoVMLIfOBHuJIndc4ca7aUoJFK1P1UhHJaaNIL8kVMhcqsRGuPsfylA3pUSX4/2rQmgt7MjESbr5jDtecFtjA8hL5hi/yN4PmiC7a8YSbA7G9F0oexcZDdGACSGJ/1hASBdP31gEu6OVVWwVSdblA+OfflyM1KfytruUb0zw/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758438718; c=relaxed/simple;
	bh=2jgJV2RYWHepLy3DtK/uy0ZGyezbtjORqEabA/kCcfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pD7sh0eqXjHjWHEbANod69Yca/JsLKSdw7lc4u3do4JhYEL9XziKN7gdUicw8lMUc58oTcDLIxktGWZRgMWCUla6kR3Ygw9kDcaAYg63fMFPTEHq5EwYuh1kvyE7h26Mw2T+HpzGapyqZo+r8i6Y3f+f4QcsKn7wgntreY+0r0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMr764gV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L6T7xU030852
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kl1cbcOE/skHIZS8l88KND6ywZ9UPyIpY8v5elhLowc=; b=BMr764gVhfbiDfkT
	pPvz8XLHO8ZQrMe7WJT4CPY0uf/uXtSw/GKwKr/KV3yCM5PDq0Li3k/ffdNBqsaL
	IzLmayUwX/oQbqrQwu5KqzIJv1Eod8hMlP5m/q2iJQdCWaTA4JdXPSGe45FLqY6l
	MVBxqr6Sqcy1B/KvzkPEa6A5H6nDBL68q5+B4ZS/6MwJOiYUWVIV1oCt5kxnkbvt
	EGwSn2q7UvoFynSZo4V8jQ5OcncRdw4qmxImkAPNcSI2Rh9nZ8NsXI7LuW9y+5CV
	bWa9Zm4JYm0sG0u9A9QaGX0fPBqp5qMvIsrMQNGGdqwFqVqm2ABHXv/xyTvfc7l/
	FZULwQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1f9qy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b7ad72bc9dso118915641cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 00:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758438715; x=1759043515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kl1cbcOE/skHIZS8l88KND6ywZ9UPyIpY8v5elhLowc=;
        b=fuzm4ygcZrwtjxpL9OQ1E9EN8VIyOnqWygJaeEfPC6cPNsVExg/7/YhVrTz+NfOlpu
         iZ6OmNomNAjDgGpx0ZXUHk0gR63dsQzaTqu32XNxncHApt8qbBVlWqO6im7X7Lof9H9Q
         W5SKROHGlBwdjLQiqLaqX5kfqGhcAun7VcUnK5obmL25UTVasOHqPi6OozYadURyzZg5
         2vB9UsTLraBr5FtDNEMOjeYqeAkH/SYnV+SAa4d0gwhSry8pRaDR+XV2RWmKVUQG4N5/
         CjwjJsxglTcjDNdGuX/FMXem5N0VkhCSJaJ9o5junZbl2AIouPfZqhJBzXNJUjv1XAlW
         BrqQ==
X-Gm-Message-State: AOJu0YxjzyCSwkKxaIcD4MV/pshjYr0JuswBbdgKx/CW7f+CrvSlqxrZ
	W8MlKjCJeHZkdqt8Y2M1NOeZm3HglmrgZl1qpGYzyR8bKhRoU4/K+g/ylEMd90u6cbaIRVkRFwk
	6Mza50qNbZY1xxp62j/gkTMYNoisdkQBKCd/KxgyIUFI/H/mdZUztHfB5cg9dwoa4/DwX
X-Gm-Gg: ASbGnctgt1ReH0rFtIvfp5tsL3CqzycDldIA3ZHnnj+AvGEVjifl7SlFEqbVutRTrLc
	UnwBO9lYJuwotnmwBZj2CC8C5T8wgeqXDZ2XZqOzR85qLnpdegL48XUrdpJ3kWwkZiHWK4M46YI
	WSkNXTIxyZw8Uommu35IUtCauMCJAJEbhmJzRQeXFRw3a202Z+yE9FsEhuPIXV6dwRrqvdrhFrk
	27sEZ/6kCGjxNQ5f9Jv6KCSk8yoUu9dYUKGYPqE2lslhcOtJyzvsqSQO3d9tCL2H2I7uoIiQGhL
	UjOrawXBd2qIsrbIe4A+tzBXagHOwEfVyFZxBQ8+sV/wEIxAHtGzOQMFuD8s32/TKNOIWP7zz9J
	PwwRwwkgcYnUxUZ9Sx0u15BWsQNrDpZguXjNT/8x7wSAg/L1ux2h8
X-Received: by 2002:a05:622a:5808:b0:4b3:1c97:57ac with SMTP id d75a77b69052e-4c073d91e37mr123636071cf.80.1758438714890;
        Sun, 21 Sep 2025 00:11:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrh0+guwyE8jL/IWi4kG/IywmXqfU/xmvLBgcROQbUC3XQlOJ3KPX+NH+4yuPHmpMio28plA==
X-Received: by 2002:a05:622a:5808:b0:4b3:1c97:57ac with SMTP id d75a77b69052e-4c073d91e37mr123635811cf.80.1758438714368;
        Sun, 21 Sep 2025 00:11:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e06875c2csm144031e87.4.2025.09.21.00.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 00:11:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 10:09:30 +0300
Subject: [PATCH 14/14] arm64: dts: qcom: sm6375: add refgen regulator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-refgen-v1-14-9d93e64133ea@oss.qualcomm.com>
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
In-Reply-To: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=908;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2jgJV2RYWHepLy3DtK/uy0ZGyezbtjORqEabA/kCcfc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoz6UiR9V15lTZOaDx3q3vlqK4gnln6I4LTtl8J
 Og5OxuVa8WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaM+lIgAKCRCLPIo+Aiko
 1Q6yB/9Ji14SkgiAOEFMG+P0OpYmhFtZH5UOuaZsr/sC7s2/aTdu5Cn0SoU4p6HmbZDhgBgULYF
 VgcTblP3V6zuD+LRUy/whvlUJ4ya0gvhx0gYmjR4NJURXiSBFm2P+4I1+P/cUwDPbDdmvxIPe0e
 EVkCDvLsnzMGA/4rMSvfXTb9L6ZNW1TtW+fduAc7Z+D43/1VGyQoO4BxPIzpRN/R+mj7fRMKoK8
 bsXexhZawmFzcI/BgT2MwpKxbWzrl4BW9GsvLGx/Y3RJrovS10rMkLZrnTiyFZsUbXcbFP0wQi2
 /LMBMw65RepRb9y7ZatnHnEAUVOvF+44zhp++Mv7Bd3ZF8Lq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: QcNwoD_BFBX3HcWn_7pmujoY6FeXiNp-
X-Proofpoint-GUID: QcNwoD_BFBX3HcWn_7pmujoY6FeXiNp-
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68cfa53c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MXrz1qFEl-pofRjPvG8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX7KynhpqYpDng
 b+GmieHuJWOU0QCZ1Fs2e6YvOklxppgnXxHcAbCR50ksiguU/HXsWgGsjMzf09mvGPqyO97/8z/
 xDsGysVY9swXcdOFpmQesI8cnIw/g5reN09ZxPyzJsn041FW8/O2x+7jXVHjlb90f/J/0Mo97DM
 BrcOAkMVOdzAds/GuL/jT0LYseSQEYENXMNMW7iaZc5CdhDD57TQjA8p3HEp8zep/JTSz68KuP4
 FhYI3yS3UjulXn3sdSIPnIm2qgTpq47OlWIUoo+OJvVtFiduvynO6a85s/z3+HNDMk3/WfY78EX
 42dp8t71DP7dKVl6ZtxqmEIFbFz/TE+rEMrHtQgH6omvn/17FxUq8aZGnPgS6jEA8dzo2gGVOIT
 8ic6rpKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

Add the refgen regulator block. It should be used for DSI controllers
once they are added.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 0faa3a40ff824a19eb238fec8665de58a983937b..87d6600ccbd94e60309c321fb4af87b35006af58 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -971,6 +971,12 @@ usb_1_hsphy: phy@162b000 {
 			status = "disabled";
 		};
 
+		refgen: regulator@162f000 {
+			compatible = "qcom,sm6375-refgen-regulator",
+				     "qcom,sm8250-refgen-regulator";
+			reg = <0x0 0x0162f000 0x0 0x84>;
+		};
+
 		spmi_bus: spmi@1c40000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0 0x01c40000 0 0x1100>,

-- 
2.47.3


