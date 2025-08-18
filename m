Return-Path: <linux-arm-msm+bounces-69528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D0EB2A063
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 13:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBE4B620A5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D06731B10C;
	Mon, 18 Aug 2025 11:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8Fx/2qR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B538931B104
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755516505; cv=none; b=Vn5cwJnqK4P2Co0/IRJ5ahwp+t8B7/ZYIF/ekShtVB6BjPZi0U2Ac3d6CQLChbuy6hDWiY4gosT+vhvAjPa27FyfE6R+Xle0Ch5WtPCfHDGbFI2+fZWqgJ5e50RQ8KhloymybFnIqEexms4WgUoSr3IkfRlMLjWOdI01RcnIzuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755516505; c=relaxed/simple;
	bh=4MkbI3+NYW9NAd/ICB7latFbcvx/s9tGCzhbUxJU/6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O0/UBpQWSrhUlmZodu3SqjQD1u5nDPumn1aeWRY7pmehexlfihCpzCQX6p6EKk1w9tmVUWyRGRZPRAk+uP8R8n6S3D8G2q8AOmBb7Cw3+RoWF4cilgSxbxQxKbFXmBIpKCK8bCwx7iMtGI86CePP1CzrrGN+Ds3579LNecjpiUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8Fx/2qR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8GXK6008400
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wPPPAuwBMBQ21V/IeDnUe25ncfknbEsC6+w
	xD1Rg/w4=; b=M8Fx/2qRblJLd0D6tYdjgF5jI+gOMhZ/8WIq6o/PCstYIAUzwkv
	ekcEUp4A9Cn0IQCXVYGlpNYSniHB4t4GWeWdVYZ/tQoAga+346wRRgdnaDMDlFD+
	Z8Ta4t5QJQehYvQx4LCbcc77gnIV9XPZFW6w+hR8wcy3CTPeEzd5BiGb4zjOFijn
	Sk6zSY3rru7vJDsMVdHaT9K62rLF0HbpAoMTY0H63d9TRgv406AtlauT3PsvUKNv
	zLu+QsviiDNS5rWhhxXe8WYdN2Bmc263U/nPRtICc5RqD3RKHOm1DLMMguq8FD6a
	XXief8ZYS7PtL66i+8DYwIHGc8XUff54+gg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtckhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e8706abd44so1152898185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755516501; x=1756121301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPPPAuwBMBQ21V/IeDnUe25ncfknbEsC6+wxD1Rg/w4=;
        b=lyg/vW0FeeeU4nf/3cM15hQFQYZFrXoO4yr1Vcd/2dXlUK7eDUpailk6Z/HUVFxH1w
         V1ThTyONEC1XXHqzhi5tlu3ISKiEdf7nkrbadKSHlTUTHzw20SnUCL5AMDcENEm4F4yP
         fBwkJ3EMUNbGixB/HthUiuJg2dFSCdcwJ3Ge5bhgTxZITf2Gn7PESvlmRwu1vmD+X/yT
         bxGRsms17uki/6lik/mP54aNlRjQzfedinSB6/kNiHN9VodUaBnKy8M8aGd5G0xYcHt9
         oPRggc7mz/Tnw0wCFXyRV8EPukvtNvSx+jiHRSTDBzPqV066luj0ikimMbq4SgPnjE/e
         PkAg==
X-Forwarded-Encrypted: i=1; AJvYcCU1rqobr1bHoFQ6jNDA0/KpiHhbcnp1z07Qz4f1NZgNq+vPeus3S6fK1zStG/0dmnKAESaGdjddP9pMzhTN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7aM5IFGpZOyM5Hr0QO5hPxlr56Vowgf2HFEyqoYUdnUvpy0F5
	KqCRDZowZL+cV/rsbkUz2nkzRf6SPDt27uXp4IH/UY/p46BIcIHJ7OOhD10XnWqwwrzIzvNQ3Ee
	PU1y5Mj6Iz1dSMG2OnTy1kjL7XMmjSTFVFqZegGqmyXNnEC43HcVhgupL0Gfhm1AU6g6x
X-Gm-Gg: ASbGnctkSJrqLjQR51dNHssPy7ankyhZ7Sd3lhq/egjLYmHSvscnpYD7czZWXjJFUuy
	SRhkGQimBeUVpxTXPkzXPJvfcpFy9BFqTYtk4rcJBrpUGvFqjOuIJeMNGfaiYzBCUeDoHQQN9Yk
	aE6VbmcQry2KQ4yV2+fN5CoFQNZDgVoK8GmekqYuilBRH8/vHr2Zexuhqr/Z3dWHGbHJavim9EB
	fMmfuiId++/DC+haGopKS1nKCSEhbvCCFvaIJ5nTz2yUOEtJuUlrjortTnUhIW+nujO+Gg0lSo7
	G8icegJ6lWQu6OBleXko+/gUeHIEMYggx738pkLNFHur4SPLz15vCg==
X-Received: by 2002:a05:6214:21ee:b0:70b:8a30:ecad with SMTP id 6a1803df08f44-70ba7a5e744mr136126406d6.7.1755516501498;
        Mon, 18 Aug 2025 04:28:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvYCLxBLKSYU4z3YHAZlz/ozcZEOMLGps7I8qvH7pSBWRbf9LiIs35N//2eK5MQoGG4Lv6Dg==
X-Received: by 2002:a05:6214:21ee:b0:70b:8a30:ecad with SMTP id 6a1803df08f44-70ba7a5e744mr136126076d6.7.1755516500911;
        Mon, 18 Aug 2025 04:28:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22321985sm127555275e9.17.2025.08.18.04.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 04:28:20 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC: qcom: audioreach: cleanup and statiic
Date: Mon, 18 Aug 2025 12:28:06 +0100
Message-ID: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gdxg_2jLw_Oumlj_6e7M0YMU_i8VWLdM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX9utm1+3Tsm2r
 N/+/ZC7ZhYzkji0IXeU8KOih1R+6bo+574fcHrGKPcnd1AzNbvhGH914ief9ZJrNn+aOyfiYong
 l57CVd+XeXazCx6qfcghqSxwQqcFtr+u+1NFAkiJyBIhtC/7oNEZLmj+lpJ4HXIhw7hSEOc7QN7
 RgefCq23MypWhtSS6lWP98Kde6dxzrvSMMH6tZONCyxhQx1NxM5cxYXodbjnIdocHo1DKvKRXZk
 xJue+sn+Y53drWWvEm9afoBqBDcjwbtAlfRUQrR2u/bKNjiB4Fz9IvSLKzaBpTuowV7LNhCDkLm
 9Ore7T60FtWQcmA6xQD1wKoHPjanY+4VzeWWRza5xVCr5Xvt/4mwfdNrc1VQ+X9EsZ4RkDtmUhY
 FjXqPLiX
X-Proofpoint-GUID: gdxg_2jLw_Oumlj_6e7M0YMU_i8VWLdM
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a30e57 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=IKPg2kH8tdNbmVK0Zg8A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This patchset:
 - cleans up some of the audioreach tokens which are unused
 - adds missing documention 
 - add support for static calibration support which is required for ECNS
   an speaker protection support.

Tested this with Single Mic ECNS on SM8450 platform.

thanks,
Srini

Srinivas Kandagatla (4):
  ASoC: qcom: audioreach: deprecate AR_TKN_U32_MODULE_[IN/OUT]_PORTS
  ASoC: qcom: audioreach: add documentation for i2s interface type
  ASoC: qcom: audioreach: add support for static calibration
  ASoC: qcom: audioreach: add support for SMECNS module

 include/uapi/sound/snd_ar_tokens.h | 18 +++++++++++--
 sound/soc/qcom/qdsp6/audioreach.c  | 27 ++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h  |  6 ++---
 sound/soc/qcom/qdsp6/topology.c    | 41 +++++++++++++++++++++++-------
 4 files changed, 78 insertions(+), 14 deletions(-)

-- 
2.50.0


