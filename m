Return-Path: <linux-arm-msm+bounces-69695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CAAB2BD4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 985F37BC0B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E7531A050;
	Tue, 19 Aug 2025 09:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g80EQsmB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62BB26F2AE
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755595619; cv=none; b=E2daecUc99bdF0JJwW8GsW44w3qXgxdM+UR1xDToA+DhVX552Np93SPHzOwRGAjfaml6S7VxDDQTymI4Rgs5LyfHTcJd4yF60v9G3tfCa9Z6ohMWDqVUorWUXfUkle1p/uQzi/Y/CGhrX+clSEy15XRKYgo0rlzc2wYmzwAAecc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755595619; c=relaxed/simple;
	bh=6GscCOCmisZTiVBfFfxxVc0dHspdhAW8+DH/P55nLlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PBlRddoYM1Tm7QYZcalqQTHviAH6LCvqRrXLTz6U0OjKmu3idN/wZ5addQrt4JSx4tXzQqcp7Ivr5E0mGK6d+21YvlYtWyr2JBbEws7zuqoYUX/lTa4C0+OZ31bkgef0xHWGEw9ptyeJvQTkuCPZAKDMiKdYDK0Q3D127C+yoVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g80EQsmB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90XW7021752
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+YPBn86OFJA4z22/KeAbz4i2F1zro6Zj3rE
	nwMnF2qM=; b=g80EQsmB2URX2cRDs04qdDDphpiAhDj4V+eQLJWvJyGP8NO/T16
	aPSaymDcAvJF/2RjcYu6hCkH5FZ43L3yJAUGUMsB6tkOGOrqOvHpFvBzQ+gC7pGR
	9fe7hj4aB4yZ+LW82WGFB1snxw6NsiNgqJw1mAVIaxwv1xGijjHv+Xh0zpzcl69R
	U7boAIhmIfNy4ETFQ1v0PV6cXCmSIg8QNEY1fVZoWV70IBcPzIbcYFFrFWsX4ZAK
	pv5MqiQRwBUWoVz8MB9mFz8az1ZaQfEFQ9FDgz/qzF4fGTR+CXDF5pahqgZuGgFW
	jAOTTbWy33kjZ7HGQPs3wilIQvihKOh1E4g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cjq12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:26:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a927f4090so116857336d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755595616; x=1756200416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YPBn86OFJA4z22/KeAbz4i2F1zro6Zj3rEnwMnF2qM=;
        b=fqn47b5Jl1hdPKRu9ymOWE310Dl02+P4835PfgjL4Lgl8NTqux5pZCNXVsV7LF8eUT
         rvW3D8wEviB+z/Ml57383i2rRAFo1Nf9/o6VkdbWCv2wuS+MjldDRYWuOW+KiX1t2Scp
         atVwELUvQMOsuhtbX60tEOMJzwepkWj1HXeLB21vu0U4+w2kOX0YvF5P//vsaXj4bXpm
         WxPJDe03bBWRFAG3DOtOZeMFerDkEqXKqAwsoNZVCBDxV5xhTyYWWBKfgQ8lCsm2dzAJ
         r9JGmBsS/kiJXEmY98Ys6RNo5gJtGJEsY9uZz1hsTcEcU4Kn7qcR4QupenrkP1Ara1dD
         JhKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVue3poxts/6H3fWrb8kbt2ducqPxV2FaM5dPuZtGJc3h/jXDtPcMABZSTxUoEFgvFl2f6KRHFPSKaXAe31@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5eyMzhEUqF6gunwhNM7mQKjgKZSwaGf/nL3+Shi0+7LehTQEm
	Y0i0jZ6qix72ZVznhC+CSkzPqoq9ZP7IHicWvV7/UTIFHEOa5DdReCl+KBGRwAbE2sfk+cLfBQ4
	U53mzDC/DZtsm+oyOagsMGHZKYHUI54p1QRUa1IgCVtIp6gnYLbvkguOXPt1qqNEJJJCMD45N/l
	3U
X-Gm-Gg: ASbGnctNQvju2bgJ6Lqwe6cbpfbCcBVvkgeLyz4wTji81BUqS6W3qd5elufS99ZB+ff
	ChI91tAYZEe1UqbVHx2umcPaQdVfIYpkCl4F8oJ2Zcvu2uWB6hO89i3BddDDkFu30ZRq7iSPPHX
	DW0HzhIyQxkdYNjq+/5UpatKhE/igu7/j5i+Uc3lQ/XS/RGTP/0pYMBYXmaQcwPWjTOAOSRwLLn
	3deuKJ4ytHELCxY/nau/7E8oasyr0uARRjd4Cg1cQUFfqX4peD8p3t7VuKF/BjX6e29NGjeTgHC
	dbpXK7QaZPDFczeyqZ7srQ5Sfc5/iILo8AOJpQ42EW6u/EPbJJETxw==
X-Received: by 2002:a05:6214:cc5:b0:709:22e8:af63 with SMTP id 6a1803df08f44-70c35d3b192mr16724936d6.43.1755595615739;
        Tue, 19 Aug 2025 02:26:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0MfiMsbVwzC+4oeXG9E0aKt6J0XkgKUpLg/D1cp1Zaqk5taa60r7RFcbnnFW1iR4JFSX58g==
X-Received: by 2002:a05:6214:cc5:b0:709:22e8:af63 with SMTP id 6a1803df08f44-70c35d3b192mr16724756d6.43.1755595615291;
        Tue, 19 Aug 2025 02:26:55 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm2942284f8f.48.2025.08.19.02.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:26:54 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 0/6] ASoC: qcom: audioreach: cleanup and calibration
Date: Tue, 19 Aug 2025 10:26:46 +0100
Message-ID: <20250819092652.1291164-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VMRFeEB72S_P67yNz5WPOcp69lbriYgL
X-Proofpoint-GUID: VMRFeEB72S_P67yNz5WPOcp69lbriYgL
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a44361 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NU7b6h4jXCN-HWJItUMA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX5BNWKk0O9tUl
 v0rDpBN8QwymPyO2msrUDlROOtUi+g0nC2xWjhYnreQoi4Tv2Gec+u1gojykxMPSuPyOrHq+j7J
 /KFkdVDFBBJ5xCBetiWoz4m2C5ejlIftRBWk1T3YshBPi4hcXSnflZrr022ooj53Hsoh4VFQ+dJ
 SSjIy9HX0e53AU3Rvi20Dcv7oP1qIHGw3bUNOLXHS3FMCsPHY2YT1+C7J1WRGC8xQ0sITdwdN9e
 bncHj86KhMPNYzNxeKcbMIv0M9AwhFBWIQitNBnuq5j4d47EjMD+ZLAt9LmbBc7cT5F7d8XS9WM
 mxeUF54iwkLZH0+Uzio7E8cSCMuhjR64VxsFvIZlVNIKTGKMnQiU6y3/zFwgr4kjsAJ+OC4vbIU
 4IJhClnB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This patchset:
 - cleans up some of the audioreach tokens which are unused
 - adds missing documentation 
 - add support for static calibration support which is required for ECNS
   an speaker protection support.

Tested this with Single Mic ECNS on SM8450 platform.

thanks,
Srini

Changes since v3:
	- added missing linux/types.h in uapi header

Changes since v2:
	- fixed some fixup rebase mess.

Changes since v1:
	- fixed typos in I2S_INTF_TYPE
	- sorted module defines based on ids.

Srinivas Kandagatla (6):
  ASoC: qcom: audioreach: deprecate AR_TKN_U32_MODULE_[IN/OUT]_PORTS
  ASoC: qcom: audioreach: add documentation for i2s interface type
  ASoC: qcom: audioreach: add support for static calibration
  ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
  ASoC: qcom: audioreach: sort modules based on hex ids
  ASoC: qcom: audioreach: add support for SMECNS module

 include/uapi/sound/snd_ar_tokens.h | 20 +++++++++++++--
 sound/soc/qcom/qdsp6/audioreach.c  | 27 ++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h  | 18 ++++++-------
 sound/soc/qcom/qdsp6/topology.c    | 41 +++++++++++++++++++++++-------
 4 files changed, 86 insertions(+), 20 deletions(-)

-- 
2.50.0


