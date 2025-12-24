Return-Path: <linux-arm-msm+bounces-86561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F00ECDC0D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B825430127D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BB531AA89;
	Wed, 24 Dec 2025 10:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFoXftVK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUgj3ByB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989DA31AF2C
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766573634; cv=none; b=gc0Mz0/TIIm4cXWC/5FAooGlo+nyY9BOjppobIjZE+mS8DeArKN8Ng+LstSyWTFUS59TJv3HFQ1GlroVmHyFXczl0XB0DDoBQDeUGej9Cj/3+R/s9jeLphlLRn2ACqQb3UjXsk+J+o8V/HJw4tJ55/N+P+xA5bEo/8RbgVoPJcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766573634; c=relaxed/simple;
	bh=bxYoB26qnmj1wJa8A52BhszHwAFpiIelHBfq+pQWPJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uUm0g8OPbzqReUKBxa90hVYTGQxGOa7NBUuknVxnIi2qLZV4Vwb9C950So5VinoukzwVdh9YMCI8GoebyrflxkJ4JXwLmejR3CHB0p8L/XPk8LF5kXXChfhYr7vZPkbpnUNczUlpS7brH4+sSsmoBgGPYGj8qr9jo0iGsK5Thmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFoXftVK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUgj3ByB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO5Y28F1018267
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hr/7NsS1XQJHFC/38XgEfnNBmTNHIdsl1ejxyMyLWLE=; b=aFoXftVK8dqnB25s
	n3209ZWtG9xELZkESnJOgLQWwA4g9f6cbfQrD3tnQY5sYTKgl2yytQT2bd7YBVXP
	D3uh/jgu+Kq1hIwjvi4/QEH7dD7VR5F4tcO+KfXU8eNlwOnd9Mu1KJbXUXH7K6yr
	Jxae1zU9QIcPrgV2ajp1ODwvnChl29dhA2fnAkLBISUlQgM6dL3yK/pOZD5D+12o
	gfeV7qZDJrvFxHI2oWUP5kjiIjC1rCM9xA9podiRY5ySWPa0TJsaHQlpPpmE3pE9
	VZhxY4VPqm7WwofuF2GElOkDU2MKjB36caUOYOznCsxh4+07y41Ajx2sg60mXbKN
	2PdGag==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsan5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:53:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed782d4c7dso100963941cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766573631; x=1767178431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hr/7NsS1XQJHFC/38XgEfnNBmTNHIdsl1ejxyMyLWLE=;
        b=dUgj3ByBTUAI6SE7DLFNLTpyrGvZ0z/yaZNpu0tMdPUzhOi98abso9Rg8X9Gsk5VsM
         J+ahkM2q7SVO24kMcWcvUZwuoQhoRzaxa/bX86Q9EXzX1aFReG7bSGll/TY71TGHIX+W
         ALizbIU6Ei01lhryTOdm90YIRpm6qr4Bd310P7+0JVMcYMucdGjlHs6Qldvn2vyFXi3+
         QnN4yLW5kGj0V/VHedtuKlVcRVb8Lj+tOiW+Ax5Xzp/3Gh4654xt7CKUpsoiFleU0SOg
         L/Ojc6thX4damytVsjDYLWHHad01TyrGLgxY/TWfjMSbN4iL4btLObhem4l6HKrtQ0Il
         tSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766573631; x=1767178431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hr/7NsS1XQJHFC/38XgEfnNBmTNHIdsl1ejxyMyLWLE=;
        b=OYY7wOccTh1/k/cRrSqNQiUGocNPPNknGNr2Vgx3lU8gWA5H2FquByxRIfGXmML2ql
         ZlPgX6n8IBwFs0Db3YyAGK9aY2vfQCamk8MFGn4SmryIoRdrn5ZY9RH/SbkLBIw7ivWO
         IvktsmBM4CrbEkmTutAnMXQPXA0PCFeOIPDM/uvy/lOIfpNsyPww18kxjELqM3hKPrgb
         lxlH+23d/hUMv0egm0Sx43/R46E23aLsxVcbWefyCRvp+PqC/u2+LWjwxH5Xmcl1AHPG
         z5brNIssgtVeiC699e14Rz6pRZYHboTS6D61Mfah6tpnXn1CPTi4HHRMI75d8ZPe7N48
         ewAQ==
X-Forwarded-Encrypted: i=1; AJvYcCURbOiFi8w5Jr3XL+69dhOCP2sLF8a4fULbDsfhM87EcvqlHGCt6V0F7JTAXYKkV4wf+gVf/EBHw5mKVhX/@vger.kernel.org
X-Gm-Message-State: AOJu0YyqHou5X3rJxIrKMmLgvceBqn30HEL6Wn3FNZIPX61pbkTMUb2k
	GGmraLoD7llZgoL3T9Vp4R7E0Aq1ETUygHdx3zSWkcd9YEZQUcRwgYyiqTEpOKxbJeB4JsF/IMh
	tcwCAI2rInycu88eJCMEyNqZBmsCmOytdUGHFFfZIGN3dzo8pQrhgfDCYi2fCDXwnameN
X-Gm-Gg: AY/fxX7rLXAzriJcv+tHE0PcSWNV71fK5XqMPnIxvNgZEAYRxHrD0FZiW1uXCO1CviU
	HNVRHksZ+IqLj2OXt7NHU3BXvpJWqSN9Vg976z42FuuM4f68S5Jk4MI43pCYQ+Hfoadyg3Gm6Q2
	giU4NlGv0bwfDHmK/f0IcR6hptKQZUx3+BZ6ETVKImWXsiGOKE2uK8L5dOKXZNchyhOsGvMWPqP
	Sbri2SG8OG2kCpJt1yRxrflIWEpnSI1mNG1o6VFjYazmaDONh68fkuHDjgaLGLfx+kdHueioOs2
	WHtd2vC4BDL/9ChbO2u8k4uztJlqLVfp54AwDiBn2n+96sMEebvRQfEIJ65y7fHobuMM/rLvbL6
	lraHuGgOs79EtNm0=
X-Received: by 2002:ac8:5dc8:0:b0:4ed:a611:2da2 with SMTP id d75a77b69052e-4f4abdbc5a8mr227117871cf.68.1766573630710;
        Wed, 24 Dec 2025 02:53:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVBYCcLZ1f6Aw7cn/TjM2tmGLFQOnwpJLvg+fIhrlxkxbQOEzTY4C+8wmsA9u5pBmR/MOFSg==
X-Received: by 2002:ac8:5dc8:0:b0:4ed:a611:2da2 with SMTP id d75a77b69052e-4f4abdbc5a8mr227117561cf.68.1766573630096;
        Wed, 24 Dec 2025 02:53:50 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab86cesm1737562566b.19.2025.12.24.02.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:53:49 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:53:28 +0200
Subject: [PATCH RESEND v5 2/3] phy: qcom: edp: Make the number of clocks
 flexible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-phy-qcom-edp-add-missing-refclk-v5-2-3f45d349b5ac@oss.qualcomm.com>
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
        stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=D+lMLFKk1nDEVMn0lCuyYl8tvMI1zx20USHxDDW0D1w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8Y2tXYcDJK+hlLQR8UhnVojF4Lx+oV75nFVM
 ggGkCenkj2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvGNgAKCRAbX0TJAJUV
 VkvUD/9vgZ5HFTV15ARXUJwDwnYBufZFHDSEdOlpvZOun72nqHtJyASuAcjDz3rRb4ffCwExYY7
 utfqH0wVImOIg3MojYcAiC16GRnMSTY20hsYKtxLmoVbbbPef68GFwK4ig+xyw8x4l4/vx2dxyy
 YE/btlFfO2nh6ZnDm2zuO+xd5MHL6vtRx/L7ivrtZGEXzeJWoApFIOAqsHG2rpxop141muB6KUq
 ELt2flyJFeIipvDJaYwhHDGfcgP46r148BGb9UvbrqQovGHPeAIkcJA1PhFgxD4jtpGXnQLrnO2
 VuYw4+g3lIcHpAA/yUZsVqHa0RDQ9sldDAp0kYr8T5LtmrI09whniNQAAlvFspDvCHdAnjgo9YT
 CvIDRYaCTh6cZz1xPMQ3A4j4obynNWZxoLCBdyBIqhv4hHeCQLhYN9rvPj8poXwudjZ47J3cZcw
 WFP+ED6HitXGRcg+7GyflPWfsPdG6hJwBEsyW7EysM05toy5tPFeXgcuOizPXU7gNgt1XtAZ1Wz
 S3F0GUzfsM4QvV4lwtNslRhga1g9pDp17X8L46oUHRgLQ8ZdysvebOjbFFNae1QIh4yUD7kDTjb
 5pPAjQrmwTI8scnutRFX35ZjdL6FHLAAwArk6yYrrcgosk8B/202ztSCkowk4a+o0GyRZbHlR7d
 lWDqS+wE0ggWOeA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5NCBTYWx0ZWRfX8JalSy6qoBvk
 Jb6QjCPFogJfJxFxZMyuORoIt+1CXLuZwMpfEP3WXrZ/hq5TeHGDzWrpUDtmgeZfmkwG7avuGz0
 JMyM81kaxCMT/So45WSA7HtJAYF+Inhwh9EZSNjuUWb4NuR1B0sBHvV64XgdFElJVEORGcplqKQ
 6rR8NtJjVVmGurVR8RbGpz7HLwnTjIO2KguVctmIIrXufbcN6u3XvTcJcaZJTppZdPZgidqbMLD
 Gah6eGU6IdDr9WFW20gbv9Gv0ne2nSqye1ic8vgb/pwU7CnwSL8eKjG02J3wjUa22MjmPYwfQxg
 XQw3NaAkj6wRxsm6By9K+hkZrzn4YO5Pjm465oC7ueWd6ti+LsJISKxpxzeVsH1Ll8BGNscnHO9
 DcGgt49d0GSPf2ty6L8pPZMDlLinipd3E7jx/vtPcdVVpEpdFSUWGdGA+Qd40w1bTJbHYxtHa0f
 pp/e1WYt3d5ZFaVuleg==
X-Proofpoint-ORIG-GUID: 7JxPUA1K8UqODA6K7j3FuvmVi3n0M9PJ
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694bc63f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=J-Zs_ZfDLmX6yROVY6YA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7JxPUA1K8UqODA6K7j3FuvmVi3n0M9PJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240094

From: Abel Vesa <abel.vesa@linaro.org>

On X Elite, the DP PHY needs another clock called ref, while all other
platforms do not.

The current X Elite devices supported upstream work fine without this
clock, because the boot firmware leaves this clock enabled. But we should
not rely on that. Also, even though this change breaks the ABI, it is
needed in order to make the driver disables this clock along with the
other ones, for a proper bring-down of the entire PHY.

So in order to handle these clocks on different platforms, make the driver
get all the clocks regardless of how many there are provided.

Cc: stable@vger.kernel.org # v6.10
Fixes: db83c107dc29 ("phy: qcom: edp: Add v6 specific ops and X1E80100 platform support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index f1b51018683d..06a08c9ea0f7 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -103,7 +103,9 @@ struct qcom_edp {
 
 	struct phy_configure_opts_dp dp_opts;
 
-	struct clk_bulk_data clks[2];
+	struct clk_bulk_data *clks;
+	int num_clks;
+
 	struct regulator_bulk_data supplies[2];
 
 	bool is_edp;
@@ -218,7 +220,7 @@ static int qcom_edp_phy_init(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
+	ret = clk_bulk_prepare_enable(edp->num_clks, edp->clks);
 	if (ret)
 		goto out_disable_supplies;
 
@@ -885,7 +887,7 @@ static int qcom_edp_phy_exit(struct phy *phy)
 {
 	struct qcom_edp *edp = phy_get_drvdata(phy);
 
-	clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
+	clk_bulk_disable_unprepare(edp->num_clks, edp->clks);
 	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
 
 	return 0;
@@ -1092,11 +1094,9 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(edp->pll))
 		return PTR_ERR(edp->pll);
 
-	edp->clks[0].id = "aux";
-	edp->clks[1].id = "cfg_ahb";
-	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(edp->clks), edp->clks);
-	if (ret)
-		return ret;
+	edp->num_clks = devm_clk_bulk_get_all(dev, &edp->clks);
+	if (edp->num_clks < 0)
+		return dev_err_probe(dev, edp->num_clks, "failed to get clocks\n");
 
 	edp->supplies[0].supply = "vdda-phy";
 	edp->supplies[1].supply = "vdda-pll";

-- 
2.48.1


