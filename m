Return-Path: <linux-arm-msm+bounces-71459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 302B8B3EEEC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10F1D7A2501
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83BA26D4EF;
	Mon,  1 Sep 2025 19:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imyTR3qp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D6A1AF0BB
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 19:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756252; cv=none; b=dDTUbiF++K4ZkGCu/DdQx5R6sBqL0Xjkm+HhCacp+HkS0U5Z8uzaLk+XBuKLaRnPFnT0V0y/ZIxIrKT6Q725qqHoEGum4P5Xr0pLXmmR43UyUMRA+XyUGvTGSVtZ3ZaDx9sJP5r21zZLLYVu3oDeMXXhPdJQOZZljKdh9+bq8oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756252; c=relaxed/simple;
	bh=AHDigbA4loghQH50YBF+v6gAajTjrpbOVptFQwr8VLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSlqXMwp61dmfEVQ+48HwE4dH/lU+kiWRfs2cGm4GlCyPsN3savN29ETJK7R2TUErb+9E1Qhoa+ofrHnkyOwx9rQnOyDWisMkPEsGEOBhAHVOUkT1/bZ7yytf+5gbc0ig4dap7dNaA0zGntJcow3HiMki3iRdxC7LYUjEKGSY4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imyTR3qp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B4KTe011783
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 19:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KP9gxy/yT7A
	kFjO18af3WMChPo0w9IcOx7eEoNmhqBs=; b=imyTR3qpJ/C5LAr8nmjal70PFbV
	AfryiOjG0FwpPcJTjYS82crnhrZjBauAOsF24kmQDDQDEMkpAl7gHPDQlemwslIT
	mUy964iP+WGjOZUj0MAY/ZpNPyddn/rxzz/11demA5d1iCW+OP2NXFgpK5JxSxIM
	/pYXYkLDefz6zQSt709zhXMRgF8MsL/FYPNnHZiki+27rCX5BNNzRqEN0hxymVf8
	JoUbPqgPJMgDZ/smXQlHZDi5lLSK7ePF4Tzo4gBRNLjCOIk4Wyj84zh+CgT5UOHy
	6TtLGPZdUX//gkus3z4SCunkE0AFsKaZdtw7GO98Qy0AUGaHoQwAV2GoNYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy1fv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 19:50:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b340f94860so7735991cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 12:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756756243; x=1757361043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KP9gxy/yT7AkFjO18af3WMChPo0w9IcOx7eEoNmhqBs=;
        b=jD/LvsRXpTLr+eiIycmR1U02X+EzqVgD7w3viUqB5UoUyGvT2GQub1n4PHF33sJ8fx
         yYdmFm8vzsMAzSz4P4E7O7uvi6u7sw0yuUjkUBHIJyGMEmHjiDr7gLBwOcMcKgS7Bm/W
         tZfdrt1UngZhpsQj+A4uZmoPoBcjE+1Qlp65O5nGNTylEAlhVfxt0YJP8ivTmVi790+H
         3h2YXpx6h4efhXN5Y7B6AlpyNdFKBmME7SLBUR3CbroyfdU371S8ZZYiNJpN/BtEYiwY
         zFVKtzUpUTn8aFG6LYqOkaiMpkgeuWp7xd1QNiPlQix8+tScSy6Cxgxv28mx7xUe0uKC
         xQAw==
X-Forwarded-Encrypted: i=1; AJvYcCX7/b7tjqe3TK9+HZH4q5dOCdXzknQMtopfIjP7aUJ9P3BohKkuB/+lB5SxH7gNjEznqYIk5j2g3F88Fo4p@vger.kernel.org
X-Gm-Message-State: AOJu0YyJzAZ2BJ+31gBAJ+A30F6P1txZ3fehSgxxrBImJyA+IXKNiTgl
	fkKFxKGccXhSUkdAzX3xnR2H9/g7QBaAkGVeK77zhZOCk4hBo2bkARAFLAvvOtC2OB5UY516/iq
	S9X3WW0OAOa5f24XSwtaGZ9ZTiw75Cq1ThYtk2vR1zt85JSVgGni+csbb0vH5J2ymupebR7ELde
	Tc
X-Gm-Gg: ASbGnctehNY58ieNPP50xmuhAPNGPaUzd6VrWqKdsQZxMKA2+SktfuI/piq1ac/FQAI
	ldU0ASO60ni6vg1aMeEbelCPf+eWMKmkujS5KQ5xTa7zpO8ktq7F7sY85teGGtTDJo+zL3OJ59G
	0BICR2MbVwRVubS8qegU37o4ExXwT9uUZYaslXY8oikOUq+oUdQWDj3y1gILEczUFLeF6VDBEar
	icQ8ufLAVh7q88wnGFrrxHVwnX9WhrRi0yafR6j2X/u2tf9s8dyu61ra2bTJ3eVvy6KBsPI9da+
	g+p/YZrRGk0F4VfxJKy7LrGwOonRQklHAmeWhp6lXwnpssQAxp+1cQ==
X-Received: by 2002:a05:622a:4c0e:b0:4b3:19b1:99d4 with SMTP id d75a77b69052e-4b31dd773bdmr129174941cf.80.1756756242752;
        Mon, 01 Sep 2025 12:50:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHan+WHaBp9LzvOWoHXnc20EoeTJqcyjwxwQPX+w8HoCdoNYZlsGeTqQbkfBLWcrpSldlgPsQ==
X-Received: by 2002:a05:622a:4c0e:b0:4b3:19b1:99d4 with SMTP id d75a77b69052e-4b31dd773bdmr129174671cf.80.1756756242367;
        Mon, 01 Sep 2025 12:50:42 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d7330e4bc9sm4653705f8f.10.2025.09.01.12.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 12:50:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/7] soundwire: qcom: remove unused rd_fifo_depth
Date: Mon,  1 Sep 2025 20:50:32 +0100
Message-ID: <20250901195037.47156-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b5f913 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gsLITZHy2-c2cRxuoYYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Z7x46IgJPtfblkmUixkcEdESb9Rwyt1O
X-Proofpoint-ORIG-GUID: Z7x46IgJPtfblkmUixkcEdESb9Rwyt1O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXxic1LpnFT+9y
 gcHSx+UMB7yx0yg96zyUZSxO2ajYKegU/z/47x0bhLKysLwb7zsWOelYbVJRDx1L7jz4l7+ffa5
 bIoQceiJkEyGQdYcMfm/sibSAJb4mfje+9z9doN7BM4xpEWvaBOnzAucUoJG5nXOE+A4/eA/qsd
 wM40Bwo6C6GlKba55+9joqS9rIbW41QBjaz5KS9BHYqk01Ahj27lLq7gAZK0JOkW2GLfTDIf2wz
 OJHKJOtAaa9UAU1Cb2lWNkIudv77PxPheiILI6/dCBdey9s/jQ16q0eoR8vql2z8/FjIlvA/dNd
 0CeWtINpjhFnFcz9ojkCzdlesQPI6X+4PQeb2VisbYrrXWwwmI2j2QCdMyIQAT5LPMPJBAmMIUA
 FHgDzOa/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

remove read fifo depth field parsing logic, as rd_fifo_depth is never
used in the driver, cleaning this up would benefit when adding new
version support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index bd2b293b44f2..7f19ebba6137 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -209,7 +209,6 @@ struct qcom_swrm_ctrl {
 	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
 	u32 slave_status;
 	u32 wr_fifo_depth;
-	u32 rd_fifo_depth;
 	bool clock_stop_not_supported;
 };
 
@@ -898,7 +897,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	swrm_wait_for_frame_gen_enabled(ctrl);
 	ctrl->slave_status = 0;
 	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
-	ctrl->rd_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_RD_FIFO_DEPTH, val);
+
 	ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
 
 	return 0;
-- 
2.50.0


