Return-Path: <linux-arm-msm+bounces-68099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A49CB1E504
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3A48585B32
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DAB274676;
	Fri,  8 Aug 2025 08:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pt3yZLAr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7D527380F
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643201; cv=none; b=D3XW7UxKUBUGUi+kHBXgRXBxK7qQ8JqX35mIC6JWAjsrh/NvybVgaF0ie3URfY+SqjDdJ6cSJqJau9+qfBk0fWBakQvT6O1EUT2lPchWkn14BCYR5+5eBtGtE3/GjroYZkCfuyhwzoKQkCBwjnoSeJH41ff+PzjhIYi2jve0H/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643201; c=relaxed/simple;
	bh=dARtMRs88U+SkvksFaX/4ibKTv2r3ZxeZPWci1xWpd0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EjRXDl9tdMhnrBwrU9UwUMRZMZlGikiktAU1OHep6VVIUxBuacTmYdqVU/PqDrvozdIjPyskuN9mzQ9nIz/gldndlF5gSV3MfLfQBHTqDAfx8l8cX8/BrJ0xnA/95HKuEoik+fQgxSb8QQ0J3U0wByaqwTfb3vSpwgND7Jon4SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pt3yZLAr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787Oltm012665
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 08:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gdpKkg3HGmZ
	RyeizFHxrsWvpDDfvGRJLvLm05RIe+XY=; b=pt3yZLArRw1Rm/5ncIPIb0qsGfe
	Xl4zM5tuvTrctyIr1g6i9vhW+PTOSy0tGU7pznkOIN0XIfitjU1Shx92DDOnD0IY
	rGW0Cb5sfiOzvDmHaRk+OBS6Vja5U1J8AVIaehXgKrX94UkF3kI0koUzqB32ptTT
	30Vf1VfsXVJvPy+cKwMWGzrD3VSDcUrGjUDdKaa0Kdg1dHK32SRkVM4VgFLNdeMj
	ucNd+xeRz74vK2iexyGFhZZi1dKxS91gsy7BP47MOWXPbYnsgqAFRWn/o20y1d+x
	jbMC80p0hL7KAZHi8ftpqmngjxIyEQVpubALAqCunxagD4wxVj8dgnvVzqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybhgc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 08:53:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b081b2a94cso64785021cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 01:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643194; x=1755247994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdpKkg3HGmZRyeizFHxrsWvpDDfvGRJLvLm05RIe+XY=;
        b=MeWM4jHd9SiaxWbwiHCyRPFxKYlvvyxNkE6SaTwo6qSOhlbqLuf6A9+PJCigVXlJbx
         /EkttMN29NR6EfkrabdGC/AnNzLGbGDrLNO5BWbVf3rbxLJEqOzfPVfVc47qBHVrwuGd
         irWRlDKp8vxm+h/AaNwHWzbsFwnhEhCIw8qvb2l8eX6+aMBjPLbg5lKPlEp3y7pYDXD1
         bLF/MlsJWwDI2Ou75KudD04TOarXWYeAe3kImosEhyfTLxzB1/5CYIU0MbDSmChKvOPp
         AlVzeannBb8fVcPtPKxS9tM2awo7sd+TPKa7PnpAk63mgUkcyOfnXkoP/y8WzKast3J9
         MEZA==
X-Gm-Message-State: AOJu0YzDShZ9kl+7cTiseMXpLzBEpbbH1oaaLdLYTkkcSFTsgU5CieUJ
	qd7fuQiSHwP1rgMDVVRYdShnFSdpqD4zuEC8zOj0bCLVrpOrAAI59wW2cOAHs5nfkIzJ+OXE1Up
	Tul9fZkihHK3W8AaDCAKW6fQ5UclxKJF3Cu5Y3U6H9IbY6ubv+Qp2tF2NgQIhWMpcm1p7
X-Gm-Gg: ASbGncvxGmtaJhR9PGRhnEY3L6/qNm9ks0rEYuuSQp//UeO9ZSbLKwPYWp2s1Y3EGWk
	m6uZG78B5Ajn721izxPp98FAMHWDC6ZCPZb+vg6YlD8DMI+ovVDsuyBEeY9cfNZMFhZbU9Ovd2z
	XGydEMHYnpQ9eFOKhFRgvkgqo4imMVnoNKEqOGaDlNbhFE+hXVmd7k0c0p/VKV6iPay6UkSpi2N
	2c7sOWhR6H8NEWYg/W1u7tUHIPx45uym1TI2jPZ52zTU0Kb2vlRboAJdZVl0RlfJWi7i3UMCo2h
	h65T/IwhtgEzzpEEkwHCKUA4sJWCix25oz4tL6AcJRcJe64vfN2w0g5Lq3R/DkRcGwT427rMWdX
	KknBfzEeT37p+
X-Received: by 2002:ac8:7d46:0:b0:4b0:8057:1de9 with SMTP id d75a77b69052e-4b0aec61344mr28874031cf.3.1754643194334;
        Fri, 08 Aug 2025 01:53:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExUlMx+GGWyeBlkXQITSAYNbhDzsTQUUeJlNFeViaKa3+u63HbQcCdHN+GInBsmqD4n9/6wA==
X-Received: by 2002:ac8:7d46:0:b0:4b0:8057:1de9 with SMTP id d75a77b69052e-4b0aec61344mr28873901cf.3.1754643193925;
        Fri, 08 Aug 2025 01:53:13 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5e99e04sm123818745e9.11.2025.08.08.01.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:53:13 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 6/8] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Fri,  8 Aug 2025 10:52:58 +0200
Message-Id: <20250808085300.1403570-7-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXzTW5wodNRMzI
 WX4yW//Ha4mb7KETj5l3hjISzbxKdsFV1fo4DedSu7cpr78JBSeSZf8caZs6eO5GpmIp/qCRw1A
 Vc/hX6+yrEWNnz9eaUQRju+EwlbD7prI8ySKVwKWx0VimZm5FxX9HCeUxxu0db9yCXnhB3omf0o
 +grIpZp2qC+itcseK+JZvINp/DMLrAzxvIQAv9yQRi9aeoQbEhsGW897SNFkKlySae8JYoGljjQ
 2MjjFQWcSNjRnrp00vsWmpehLB8ksTpId3UHO5L2ndJh4PFXXsOp5PmeCT530pQvtiUd9SCgKG9
 MFlDB7jNjphB2Op5tKmVw9rS/qVncX6KET4ojeTxpEFeWN7pD2/XGixEwglspaLi72P6cSOBZKv
 7guPWGOp
X-Proofpoint-GUID: QI0TDnrEBFc6qtY-Tr42p_91QbjP7lic
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=6895bafb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=5fA-3PHwp7xA7VOvTvgA:9 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QI0TDnrEBFc6qtY-Tr42p_91QbjP7lic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Add a qcm2290 compatible binding to the Venus core.

The maximum concurrency is video decode at 1920x1080 (FullHD) with video
encode at 1280x720 (HD).

The driver is not available to firmware versions below 6.0.55 due to an
internal requirement for secure buffers.

The bandwidth tables incorporate a conservative safety margin to ensure
stability under peak DDR and interconnect load conditions.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 9604a7eed49d..a7c960d1d818 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1070,10 +1070,60 @@ static const struct venus_resources sc7280_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct bw_tbl qcm2290_bw_table_dec[] = {
+	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
+	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
+	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
+	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
+};
+
+static const struct bw_tbl qcm2290_bw_table_enc[] = {
+	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
+	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
+	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
+	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
+};
+
+static const struct firmware_version min_fw = {
+	.major = 6, .minor = 0, .rev = 55,
+};
+
+static const struct venus_resources qcm2290_res = {
+	.bw_tbl_dec = qcm2290_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
+	.bw_tbl_enc = qcm2290_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(qcm2290_bw_table_enc),
+	.clks = { "core", "iface", "bus", "throttle" },
+	.clks_num = 4,
+	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "cx" },
+	.vcodec_num = 1,
+	.hfi_version = HFI_VERSION_4XX,
+	.vpu_version = VPU_VERSION_AR50_LITE,
+	.max_load = 352800,
+	.num_vpp_pipes = 1,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.cp_start = 0,
+	.cp_size = 0x70800000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x24800000,
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/venus-6.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+	.min_fw = &min_fw,
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
-- 
2.34.1


