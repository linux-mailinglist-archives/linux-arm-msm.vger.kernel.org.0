Return-Path: <linux-arm-msm+bounces-86562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25088CDC0F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C23E2307B213
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311BE31B825;
	Wed, 24 Dec 2025 10:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XdwDREM+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ozsxytqc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5082531B10F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766573636; cv=none; b=Mo3nfnqycem1r3EJ4jTsoRZZAw2G8APj/bklJPgqYFs5GZ36/gFUYlH8aywn7crqAr3LEGB52jsprRpfcRlUMv+7b8uEcDli/GfCuBJCb3WRYRgIw3EKVUpZwZksxlCpU+ornTjWiGdldC2Jp10osAlr6eI2RbdDUyWMcSbf+5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766573636; c=relaxed/simple;
	bh=cPDoEfxg759WqZGAjy7ePjMCwqTiwM28X7LtdMqCAP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UpMIBAS4ZcUGIOdvkuJ9Z2Bxm0hijP4JTpjQobA48P+ld5t+/ooOtGhzsU0VUzMDrWqH9UXhtMxBcmT9Tw7tg97Axr2P3Komgt9I9Y5yFqaVMNFptG6fmNwIYTNGERNPuqOVBp+50flsxf/+LJ6U9FMKJGPo9xInpowkAx7IH3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XdwDREM+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ozsxytqc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9punB561263
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nWatTeODsCj9eCOPh6s/ONx5sdA0VSf8P0xfOcNmuC8=; b=XdwDREM+2/o3Gg8k
	tTVMFQsmDRiKhkn6SKQUHPmxHw+ZpQoZrLFzilhKiHcIMbOQA938/kH4o4HHf3rq
	RyT03iQlxDOvXRJBvP9jg+Lj5zcdEwqGOAxMUuol4my4h00PitymU+5aPRWeZwCJ
	xvYCBI0WIJzx8tYiMQNi1h6TyP8d6PkrdkRo9cW8Z2tKI+w+zGvqM5b6bP+ooDvK
	Qm/nnOF/yQe/4qV8aSvhnQT72vduYDi7LMVyucV9EBZe6bakSjZCOOEEjyZF9BuD
	PPB+nAEN+oXvCCeQ+TzUwKA3OUbuIJdEddnOGXSp02ALCeCgWKTV8duiePfQrUP3
	4p4Wwg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cuak2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:53:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1dea13d34so132324381cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766573632; x=1767178432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWatTeODsCj9eCOPh6s/ONx5sdA0VSf8P0xfOcNmuC8=;
        b=OzsxytqcydpYC/vEiiT6DZc5U3Fs4HMtsL6jBnoLjmjkohGNEgMxbJvacpHC+00s2l
         4fDsybqQzl45dt/eK/3efOCqxKREtHsBR+fZkAY8zS75bjlV4QrEk9tTUgPHgH8E5rnf
         bEH+a2jw31FWmzHpZybU47U6YguWn6rIcEi+0y1vBP+cjZBnP9frNvv83XH6WHNvRN5H
         UZiOfvPei//B/E9DMVLqsPw4gJwpB8yNJdeEg2ZhaKsvv80qBYS8pSguR75QIVbyG8EJ
         agACtlriZstBXwiDEzX2bafsa5fl45LkKC9JHHormjDTgRcIUPS1NzEut2Nm2eWEFGAh
         UmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766573632; x=1767178432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nWatTeODsCj9eCOPh6s/ONx5sdA0VSf8P0xfOcNmuC8=;
        b=tGFn08RfA7PmmaPQ15rM5srLSEoe9tLVvEh70q+VEOrkysdOaPZwTgp/47vJs3sCBQ
         gbMbNhLxej37EpYQpdRGSGdfDnUg+Smpd8QxlK8e9M8KVQMQuPKGAV4CXDt+pNWGk2WS
         MTaMK6gQ39vQrap4Yw6WieUhxegtFAgT9d5vdaWlVDEafx6q0dckv8YYS/JFCmxO9xca
         C9w5zg4QvaWOeidLDirbl7c+R2DQwumpMlAHKGYHILwqIJJhDCk7fo9Gdl6sDhq/gE5+
         xMQ0jw8+26uSusOAxMU2GUAG64VjRsB3FOmd7BjJmN1IpHgyJIwOVNLu0Eb+55nz8cK8
         Pijw==
X-Forwarded-Encrypted: i=1; AJvYcCWaB6uRKkG9YBG6B9H0exBzfpE3Kbu13A4fb2GpPDMwL1A10I17dXqp77TswRX5b1lEw7Hdjqou/p4l3SHB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7eKN7qFNZz8gY452XDPrq6QSHUZwgy8OIljU+hY7NvC3+6ixp
	h4XhZyS4ElsvA5mdf6E3ZuARiOgIWi1F2dAsgQJdzzhaNSP2St8ECBaBsHLzhn7Xs/4z/Nc55TQ
	gwls2EtpP4S3XMp3bq4P428U4K0/wVILQh356QtrGq5K4xwxJAlOJYgYbCp92yiOszCvc
X-Gm-Gg: AY/fxX6f+AxCctlV1r//A+Z+Az6LUhxfFJqSZr/MNvjK/xBey8OJf0lnzOP+IpIgfHY
	eNqaht+Xtd4+GdqBSQza3RmSJPgH9jrcRS6uF8z4U/kVByuROUZFZKsNunaKiKLjF/oR0KeeKv2
	CQUBmmTODH87r4kCumcjrUZchRYOwkYdY0Fx3radQxdoK4zj9oawmMP3IZWjwC8FW1rJ1rcr/Qc
	tHoyWr8MJv+nWPukxzvxAw54AUdA5KGgZEKKqQLR4k3UeZVKyUy0owu2h9cTddh91PScTsmQMEn
	joCpy5tQF+CF5fCw26ity99u63tjyHQ4lZGcnG+MBZEsIzoTCxPC7gow+rn/dN5JTsfnc53kT8U
	27ngndFg4+Usr+jc=
X-Received: by 2002:a05:622a:5912:b0:4f1:c6b9:b1ec with SMTP id d75a77b69052e-4f4abcf4bc6mr238685191cf.28.1766573632439;
        Wed, 24 Dec 2025 02:53:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeAVgBMuu8KrPTONUD5DkcqKJ9tIQm6gGeqTc0K514xaUnwQGYKjP7mhCnGalBfQmljdi2Nw==
X-Received: by 2002:a05:622a:5912:b0:4f1:c6b9:b1ec with SMTP id d75a77b69052e-4f4abcf4bc6mr238684801cf.28.1766573631897;
        Wed, 24 Dec 2025 02:53:51 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab86cesm1737562566b.19.2025.12.24.02.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:53:51 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:53:29 +0200
Subject: [PATCH RESEND v5 3/3] arm64: dts: qcom: x1e80100: Add missing TCSR
 ref clock to the DP PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-phy-qcom-edp-add-missing-refclk-v5-3-3f45d349b5ac@oss.qualcomm.com>
References: <20251224-phy-qcom-edp-add-missing-refclk-v5-0-3f45d349b5ac@oss.qualcomm.com>
In-Reply-To: <20251224-phy-qcom-edp-add-missing-refclk-v5-0-3f45d349b5ac@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        stable@vger.kernel.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Xibk6A4j1wuysj5ojbntlDFb4byMzXKcnUoNHObZjw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8Y3/Vr6IAzv66eye1vfvavk7UaaAxU715ACh
 aUi2iBnE5yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvGNwAKCRAbX0TJAJUV
 VhfnD/48ar5bzCyWjZ1O4avupmAUt4y+SBAWSMARAYBwa/0snPNJOaRs1Jhpe7JRDUUs75YwrBZ
 a5qA4nueyUSSvkvKbrZWuDAqexs/fp13+SuXiMdvTdT+KWxq9el2tXlxm8eso35sLTmYUitMtvt
 WFaGCvpSMfY7cb5qohomBJsdkuXozZ8tH2bCmEOpazZfLZVVnhuj9fRJyXSihKI6NG28UekUy1D
 H5G0dEaJfE2JKKBvZbebvOF8wbUJBVYg8QX1udtWN7g5Xau/H2scolUMj4yV/P46uUIiFEKOoh9
 ou0gvy4Melg9qcMaKj9gLbBQNvqRMFKhiHpjO1X1y9xMvF8iYbVJFiKSzS+opX19E1ieUip7Sai
 FOyLUL6O4ba++eWEDYYhQozltPmJXynFVKXMb6EA3+KbygzLDV10JJe8IlBXuyDD4EkpZ5Z6Ltf
 B6g63aPt7WUbBstP4b/4L8WhIagfH7qjSYrswK19qDrmVZaVOpJmHGFSJT/bpNKalT/jyu0oMWt
 IIyEaHkSwm/qZVFjBgUl3BbBxpYvHa4UbRHRwSPgd0RS/k+1AJIdE1smJeFfvsyAzZZYN/b1eaw
 vqWbrbgiSXXIQTUb0bwbgh2ieL3GB1//+9LhZ+3XUhpY32NvQQ9Na7jtLSPcOgjvTPMigBbZ3RS
 4RLICiLwUSzGpng==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: _8cTAkWhiKMMVuKA24eSnEQMMuCMN7gX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5NCBTYWx0ZWRfX2K0tCm6hg7R0
 /hCF/R8Nb+Zz5iV7PGyamMG99YoPCd2YE8LT17/4b4mF6PxjlKN1yB5rgOJnfhFFd3sEXpd+1BA
 S5GmU8CXY3NLl9bWQW/ew9n6PtkYdFIPr8Iv6tKPOQtUvRTjnxARq+YMHaC1fV/E0LhRGAMHesh
 c1dHrBmDD7XK9NlsRTgq1N5rK826VEkLkcdkKyOG9JdQ4qlUt+4S4rpFBi55MWrzVp8I3Tw0+Nd
 376mtC/fXGqgvv/2GF9h+4/AWKMD6yjSw47pfMxiAawO5mjkAFyIgSHIPtsbFSTHC8ZDY1rhBcj
 IMofMcbQdkahLyqe7ILuuNJzZZhcet6PSF6Z4p3B4A9ukMg20+29fIW4nlPbDLuzqiEDPrdqb4K
 12aI6AR7rG0e9pbAG0engN3g0ylZjWAP18jGLKfDdzJnifyzsUjZapi0l949hjxqafuEFHrB2Qx
 77BmZkCY/bNQiPuEqkA==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694bc641 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=7z7RlTHwfbxsG2Z0DJwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _8cTAkWhiKMMVuKA24eSnEQMMuCMN7gX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240094

From: Abel Vesa <abel.vesa@linaro.org>

The DP PHYs on X1E80100 need the ref clock which is provided by the
TCSR CC.

The current X Elite devices supported upstream work fine without this
clock, because the boot firmware leaves this clock enabled. But we should
not rely on that. Also, even though this change breaks the ABI, it is
needed in order to make the driver disables this clock along with the
other ones, for a proper bring-down of the entire PHY.

So lets attach it to each of the DP PHYs in order to do that.

Cc: stable@vger.kernel.org # v6.9
Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index a17900eacb20..59603616a3c2 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5896,9 +5896,11 @@ mdss_dp2_phy: phy@aec2a00 {
 			      <0 0x0aec2000 0 0x1c8>;
 
 			clocks = <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
-				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&tcsr TCSR_EDP_CLKREF_EN>;
 			clock-names = "aux",
-				      "cfg_ahb";
+				      "cfg_ahb",
+				      "ref";
 
 			power-domains = <&rpmhpd RPMHPD_MX>;
 
@@ -5916,9 +5918,11 @@ mdss_dp3_phy: phy@aec5a00 {
 			      <0 0x0aec5000 0 0x1c8>;
 
 			clocks = <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
-				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&tcsr TCSR_EDP_CLKREF_EN>;
 			clock-names = "aux",
-				      "cfg_ahb";
+				      "cfg_ahb",
+				      "ref";
 
 			power-domains = <&rpmhpd RPMHPD_MX>;
 

-- 
2.48.1


