Return-Path: <linux-arm-msm+bounces-62250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4605AE7297
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 00:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4853116DAED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 22:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E804125D559;
	Tue, 24 Jun 2025 22:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgTEzcUQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604BE25D213
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805618; cv=none; b=o8Z+l1PwcMub4peVWguzuDHBGQjfXnifGdhq5Yuxv8zDfvNmNwi0S58QJH8ntNuQNqOWgKO7/Eebdj/bLD35wE2yEmRzXYG2NLnjYXIaLe9Z5GMYPgc7h5mLaO5mQIcjcaOoqv4v4vkNm6QUd64Sq3wwbJbzMVyd3HzOWcJy8is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805618; c=relaxed/simple;
	bh=W0YLJNz5/2SAiapxbVHEzsfqeAiPqnoxKuIVDr0TVNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kIFseV0rDbCBHOVMhORfCN5EfIxPvRkiVFyU6fJzAXVcN/zbHYUFhpRKmqzUmBc9aqXfJyIlbkMwrLzUzlm2L7gwrl6oCbidRRU/fzAuQ6vKYGD3iTfZzu74dz9JNoy+Bi1k8ovsQmzsQv5ugGYaQjbgTOgD6qA0xU6mL0VI7dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgTEzcUQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OJJ9f8030162
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3PYGYwAigTe4Xg8FBE8LvVKj2tXUXuFCqznUuXtFksk=; b=jgTEzcUQJEULxLqC
	XiSOzdXI0rEcSbcfgr0UxPef2I6p2NEV0dA49pvPKa+GHnfoKPiO20rjwmGGx+0B
	EIcAzPOFOwhqWG7OQSpig5Fg3NP5wzHIIVL8m9tHge2IBm2O35XN+q6N7eo0WB30
	gwtZPyEIJNX4PUpcuVdslWnYQ17WjP+Y2AgMpsYNhpSCZlom1s7rYeDTIptBEGWC
	Y8I5MGHFGfA6xtLwTZn6xjwErx0a6oL1uIDQSkS7x/MsW6jC04r9XlB5GScX+mcY
	rNB6T/h40ya7HpKijr70bxU/6ucoOLL4DTVPsnB154xLKnybLFZUQnas+Zfp3NdV
	PyiV7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g22q8dvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:53:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a58cd9b142so16497461cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 15:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805615; x=1751410415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PYGYwAigTe4Xg8FBE8LvVKj2tXUXuFCqznUuXtFksk=;
        b=M/TudOnIhJ/FGjuuDsYd+mgsExTYwP/KFCBW7BFPgk2cgsT89gh7/ZB8z0HxvaD2tr
         k8H6Mtcx1RE79abbHoT+fU49B98Dxf/iVdvirZ+qATBjZSACKNjXZaJGS/+AplZ5CkWA
         fQQkJDmaeZ4bDoEjouDsYS3H+cnxE+IpS8D422hxoRUv031SwAj6TH7+L45fF4BW7i+L
         rPmViPZl3dO9b8tR6aCgMcAjouaJFCN65IMp0q5nKXuI7IcpUPDgZTX0/Q1ZQcz3P79K
         1kOG2sCdxVTHUBTVxcgVFXZ3uqR9PAnArEmeySR0l5gR5oqc8Gf8Kfg9Is1fzedSk01P
         0YWw==
X-Forwarded-Encrypted: i=1; AJvYcCUPDwmq8VekRIrUTeWCMHqRhbvQmOzpE4TSfkMWzltR+v32cgt1CfvshEZfu0aPkcYH+yKgsFUVRwslCJ98@vger.kernel.org
X-Gm-Message-State: AOJu0YwQUQKpBWatOmt4XfmR1YgteYJr6TvRwsTnk0O2Bguigt5XFMPM
	ksA+k3MjLq27JV5T/GUy8lPXqvTpno6+3iwmOhEMoMRnEbK6a4JQ+fvVxT7YqWV5F19ZoAp4kPI
	8tYqmCQpasfAAXuHQ27ZuMlueexpXmCeKRG7W87BNxcDHVrR1a7ESBqreMsXxmUqm0yeG
X-Gm-Gg: ASbGncv4lfoaxqWLCty65rJeg3PjBWQk9qI9Hso1qiCxpqXRyyjUuCAB/PDEoPoQlBW
	iV6uYwVcipbxJbRvdhNC4h64RaSHuBqcgfWdbKhXlDfcvK9p1qQhnwb9fcEBUQT2U31xJFBuIwm
	VD9Iny4MEMEfD6xzy90kSrjxkOIvvh47r/BvPWEY2KoJraufzwHbDxnXVOFSn76czm8s8M3Ptu6
	PrGY2PFWwq8NduvgE9XhxKZjKMnnIulavrCaiHlWAu90gxMNIbYr6sscKzyvQC9PmugtnqRn7aN
	xV+vbPpQMTJiBwbkarblkz0RPpON8T3gctL8NtuA+OHaq5qtFcx2fPCLsnb2rfiL1aiVorBYsBV
	CqNs4XUjb90Caq8mXBOsJpi7aSnRsARTiUZQ=
X-Received: by 2002:a05:620a:4050:b0:7c7:b4aa:85bc with SMTP id af79cd13be357-7d429660e04mr113562185a.17.1750805615320;
        Tue, 24 Jun 2025 15:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG41nDKvy8NSvFSuE+GkqRN5rEbL009m+aNzEf5Aeh6gwiaJ1JjFjqhlwEUZpFQ41nVpXLjzw==
X-Received: by 2002:a05:620a:4050:b0:7c7:b4aa:85bc with SMTP id af79cd13be357-7d429660e04mr113559785a.17.1750805614907;
        Tue, 24 Jun 2025 15:53:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f5980bsm17843851fa.7.2025.06.24.15.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:53:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 01:53:24 +0300
Subject: [PATCH v4 5/8] firmware; qcom: scm: enable QSEECOM on SC8280XP CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-more-qseecom-v4-5-aacca9306cee@oss.qualcomm.com>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
In-Reply-To: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W0YLJNz5/2SAiapxbVHEzsfqeAiPqnoxKuIVDr0TVNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoWyxj0Fb4cA5VMjgnwN72vznUyGiXQ/4qhUCvh
 dIttwizDleJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFssYwAKCRCLPIo+Aiko
 1Rm9B/9T0FUesziKizU38v76pcYTiA6w4sBqSbxkzsktq0nA2q0sSBVPUtwLWt/yJTIVokgN04M
 MFcYDkc/AS1ImaYPtlBWux5XC4SJCh5Nvbclq5BxJDQ22fkijV0vrgTxkfYyn4V1FuzupIeWoQw
 Bx2Bzktqtj5ShsO6vI99DSh0LYEp9cDpfWoQoNbfVvQnwKvRKKaoSzqe5u5sJ3O47RY2qiOQOlj
 cRIPTCdVRn/bREB+itNQJVAkcUc7TqVPcxixkQYqtMS7Th7Bdk0bxLnR8ru6bEsFnVz5bXKEmaI
 ynV0525X9ouUotWTbiY7J8Vn41M2wQYrYfMAUj6zMaXXHDub
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=cuqbk04i c=1 sm=1 tr=0 ts=685b2c70 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=GpPnMnrImHjYsJApwW0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: TZc_Da1HidHauC6lbkzsY8N4cnejhhYx
X-Proofpoint-ORIG-GUID: TZc_Da1HidHauC6lbkzsY8N4cnejhhYx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MiBTYWx0ZWRfX/MF3QytkeS/s
 jEv7Wvir1bgXeeLnDiUZ2bhLs2riizT357SFMCynZh3gSSCCAXs6Uc8Ck+vNSTWkFNuvyWdOIsx
 ayA5BgAZT09xP5NLqeHtGhC45Ct5C8Eyz1YN6G9jxn87HYJ4tw2BMCTbb2SHkCQWljbdE5BfOLW
 eH0GGrl8Om5WvhjmEtv0otRW5BkTgJzMAPzUJxL2uxlmvHt0GKHBd/5AimIiVjfu4jSbuF+ZZee
 RDuYgayj1sfztzDCqr/G2RPyw4rj8RX3rHY6ZvhpJCTun+Lbt8ShHIgZ0tSCmXBsjsrx+hQqKjT
 STslOmkxjLHZeoMdVxHXCKYnyQJr+N1IJl/0TORWHXQ17m8ojjd4oPFy9hDJuZg/Hls+hUz9hGF
 9NqxTYBz9ZByBYNYKZrO/y4q/lmu2X4VLudqwQZNtboU8+QJqrKfxVYFmB0WiJj2zfSRQvTb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240182

As reported by Johan, this platform also doesn't currently support
updating of the UEFI variables. In preparation to reworking match list
for QSEECOM mark this platform as supporting QSEECOM with R/O UEFI
variables.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index dbb77c3f69ddaa931e7faa73911207a83634bda1..27ef2497089e11b5a902d949de2e16b7443a2ca4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2005,6 +2005,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,sc8180x-primus" },
+	{ .compatible = "qcom,sc8280xp-crd", .data = &qcom_qseecom_ro_uefi, },
 	{ .compatible = "qcom,x1e001de-devkit" },
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },

-- 
2.39.5


