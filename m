Return-Path: <linux-arm-msm+bounces-35316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA049A97AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 06:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 200681F20EC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 04:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E329884047;
	Tue, 22 Oct 2024 04:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+TMDDGc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C88770FD
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 04:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729570645; cv=none; b=H8sUql43tXbDlY9QIfSP9aG1ATHg/YhMG2IqLOlalePlvzcVRPGVoMMLbBduxER2CgPK+8U8umARht2C3QgNgYcgdDuVpruAYCKWxs5Jl9wtZ3NeV9FSjBCXoXprpG17kES3dU7ubqCS+HJ3GaiSv2yqdt/Po4XpWmGbw7RXSpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729570645; c=relaxed/simple;
	bh=00Z5Lxbcm/m+iJO4dHyDEC23/Hi7DDXB5bGDh7HbwuQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XQOzMz9iPvsVJHHtWXKOpEpQliRDuMHjzQpzMjYlgI0SERu8wFx8FgUMxyw5dtQl21D4VfjGVPBFOL9cju4F5nNLFP6SH9aMWsrbgHIkxZTBcaFZJW//vNcRG484tvBHc6JMpz1owskYbYYFoOscpB4/+gqJxxCEeLhAXwLBdms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+TMDDGc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LKBkJl022629
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 04:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JENa/fVTUGLsEnUhBnLL/w
	wsK1s3bcUNmY0EgUcedho=; b=J+TMDDGco01Kr551L1klRkx0vxTOh4f4y4Uet0
	A69rWQ8xyLyXqlHWZc12Wqesr8d20iDsxTgdOo6hyH/TyJkUNgcOumi6YckTphFb
	8XguyPuzembMXZM67MezGpUEM3jI49cjPr3gmDv15QANLDUM636pN6Lo4RJNuuH8
	UxFNDcKWMBEfFUgamxM2GZQscv1kZxHUclI+p6+qtTRWPTYkL90ydq0WzXE8qQ59
	ivCw8lmbRMXYPMMyYnXweLRCs0DB3ka14E/rBHP9kM+p6wPjuMqvrF8cP2JZeDRE
	jJUoKeKQCYTHX03Nai80AiKLE5SKZFUXIxGBGxUUt3p9etwg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vuxum2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 04:17:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-71930797560so5598084b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 21:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729570635; x=1730175435;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JENa/fVTUGLsEnUhBnLL/wwsK1s3bcUNmY0EgUcedho=;
        b=kCVfKHe6NK2V4062m76h3kT0kXLPtYhNHqcNXv3BrSTfW4IpiFkQWzFVrnx14VyCSf
         nQt97ilLpjBX+4OQlX2y5QcrcnGSF6ZqF9cvbjhpNtf9fREJ/EvLKMnb5keizrfhXwYE
         1BcHdfhcyB3+SZs9skZoxKzbqZSHF1Nbhy/awTe9Dt8aKlilNi3kxpFH7s8yQ0JFk1tg
         UEgiT3/qj+NDCrouzbuMBqvzdD9bnZPzUMDomkcMV+c/mN6YJjs6eAAlsvs5VI2/Kxy5
         sK7LYeimbPQhEIW6fovTKq5tBcBk4vhUnt5+yx8+qsywR8BERROXVOZ4oXl8wLbvCJnX
         aUng==
X-Gm-Message-State: AOJu0Yzf9iigWfjbuIzexqdmUB2ilyqnS0HLNzkLmGF6VGgol1dBQjDC
	dcsApIHNrwn8S5xcD8zhwC3+cbGUJD9dBK6xYZMyzLikWF1WKICfbV3ejdS8Pvc1/I+I79iCzP5
	N7V8Zq21InqNh0tZvi4rzErPTdkDcYxhR+Hs4D5srv28hgA0xpWJ3quBjM9TPRVK4Ejxu5WgH
X-Received: by 2002:a05:6a21:a343:b0:1d2:bc91:d49 with SMTP id adf61e73a8af0-1d92c5729b6mr19243658637.31.1729570635227;
        Mon, 21 Oct 2024 21:17:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdr/iOjyB/H8og0x06QVXBk+FITpvWisWIYZu0CpF0db8MKQfeSPkANO9MP2Rbh14qE4hUEg==
X-Received: by 2002:a05:6a21:a343:b0:1d2:bc91:d49 with SMTP id adf61e73a8af0-1d92c5729b6mr19243648637.31.1729570634955;
        Mon, 21 Oct 2024 21:17:14 -0700 (PDT)
Received: from ip-172-31-25-79.us-west-2.compute.internal (ec2-35-81-238-112.us-west-2.compute.amazonaws.com. [35.81.238.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad25cb6dsm4836169a91.1.2024.10.21.21.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 21:17:14 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/2] soc: qcom: pmic_glink: Resolve failures to bring up
 pmic_glink
Date: Tue, 22 Oct 2024 04:17:10 +0000
Message-Id: <20241022-pmic-glink-ecancelled-v1-0-9e26fc74e0a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEYnF2cC/x3MQQqAIBBA0avErBswK8iuEi1knGrILBQiCO+et
 HyL/19IHIUTjNULkW9JcoaCpq6ANhtWRnHFoJXuGqU1XocQrl7Cjkw2EHvPDt1gjDVkVdsPUNo
 r8iLP/53mnD9zaX6nZwAAAA==
X-Change-ID: 20241022-pmic-glink-ecancelled-d899a9ca0358
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729570634; l=859;
 i=bjorn.andersson@oss.qualcomm.com; s=20241022; h=from:subject:message-id;
 bh=00Z5Lxbcm/m+iJO4dHyDEC23/Hi7DDXB5bGDh7HbwuQ=;
 b=g5TzdxNblBRTxf3vPx0aFPJroyjXwvpmPMDQcMqLA33GIxZBW++Oago5OefYFarXXhzhybO+V
 5tWKu1+ixAsAahMtzgr2GNw0mD9qiw2aehdVhcoV34XpguiITOCmN8V
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=SAhIzN2NcG7kdNPq3QMED+Agjgc2IyfGAldevLwbJnU=
X-Proofpoint-ORIG-GUID: ZxscR0v541cmE9sgt2GvqN0PO6yqnShZ
X-Proofpoint-GUID: ZxscR0v541cmE9sgt2GvqN0PO6yqnShZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220026

With the transition of pd-mapper into the kernel, the timing was altered
such that on some targets the initial rpmsg_send() requests from
pmic_glink clients would be attempted before the firmware had announced
intents, and the firmware reject intent requests.

Fix this

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (2):
      rpmsg: glink: Handle rejected intent request better
      soc: qcom: pmic_glink: Handle GLINK intent allocation rejections

 drivers/rpmsg/qcom_glink_native.c | 10 +++++++---
 drivers/soc/qcom/pmic_glink.c     | 18 +++++++++++++++---
 2 files changed, 22 insertions(+), 6 deletions(-)
---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241022-pmic-glink-ecancelled-d899a9ca0358

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


