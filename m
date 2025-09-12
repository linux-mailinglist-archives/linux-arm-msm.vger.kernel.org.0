Return-Path: <linux-arm-msm+bounces-73247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAD2B54571
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27B6C1C867B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A4B26F2B2;
	Fri, 12 Sep 2025 08:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwGaiLgk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79624221FA8
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665954; cv=none; b=DQ+G1KUq+8q/e5zMltPDaMWYY47Qf+lDV9aPEWKRiiVY8WFdGQwR9GHi5+/DnOR+O+OOT4XIgHfAwU8I6xX+Pe2lpAdt0qZIsOEc5lvkcv8ZN/9f1PhkFzVNERHp/fKHvfSobofuUKQyYFqrfRS4yS5yTOAPliO0wvqnSqTBvw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665954; c=relaxed/simple;
	bh=BWh7wHrK8yZtB0eeU6Iysd3kLhRZzpxdN6HZoeCFTmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VXuiH4bYAIyxE6Hz3CmLog/Csg+2HVqmNEkiHunFWZGfuxWoa1HiPVsQfprnrGDDkLKUl/TPJwcwkoXEUZVBTntAv01cy4lW1Jxjn6qdVOgHjqFAPeV5EYYjYgqmaqs6H7M5+el7Pale/tgyJcWPpb2yN74DIYZCv9oZCDaxs10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwGaiLgk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C70cHk005464
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x+G4Fopcs9BfzCpIG/+vVPae3N/6PqxOMft
	1V4SqZbo=; b=hwGaiLgkPHUx3Pho3y5EX2l96qa8rjA1SAsZ1kqNeJR1G5Ql6lT
	48qq2IgL5Rev6N3gtI/mTz6ZFM2CFU07KCqwxiUWRijfIeSYhD602uAytFnwq7+6
	1MZTNX855NDoMROZ/E0+Qgmtfo9jXuTAD+lxXlb0OTiy95zGiI0+3zWHmDCKTBqD
	kmf/Y+B9/fKt+bFvUHee2RNoDnAIcMitG23Ehet37yrVQZt3e+MCFEy5CZZYo6Dn
	u/ZJ2t6DrHVV8ODPr+GvmItfNbPpZgA33z9RyaqGu+CeTLlHDlt5qwSQxdqGzoxQ
	E9Rxp0OY3fvElI4Cf7Ip2rGk3cjYEf+srHw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2ewgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b49666c8b8so36178961cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665950; x=1758270750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+G4Fopcs9BfzCpIG/+vVPae3N/6PqxOMft1V4SqZbo=;
        b=nQbg68HRjj5KdP+opOx6PsxPLGav6n/Mo72WdFkTGOXMuNJmXhXxBATA8b3AJHbVhj
         PuscNVIU8nbhF0M52XN6guo1KgFK4l8aWLiPFBVKh+ML2kt680tT3ZecWzlVOMIFzIyU
         wN5kZPMTqnury08TRkBGxTklwyuofSbXiZ/DKA8ajucRpA6kOKEo3/+0a4DMg7h6M/2X
         eTjsJAvWfsTreGJMlB4ledTxA9QwYngythg/IbVt/Ojgh1bVo6FOhPtKfDVlG/duSmd/
         DK9B0FplC06zgmjIV8gW/dhCKYsouR5L5m9rJ2MGUoUyaA7roiGeAbWlMsTbo+1UzK8+
         zmTA==
X-Forwarded-Encrypted: i=1; AJvYcCXiCxlfu+B84ZrRBvHhKJ3X30k5D2LsoNtyD0yZUzpP/xjBF2ptmhyA8XX8tJqI09ysMfeDlxE17705fQvF@vger.kernel.org
X-Gm-Message-State: AOJu0YzBpRnOdAbslLFpwlItu/Koq/9ArXMQZpm0NHKikvQNpgn/svvz
	lBKVlfeX6/O1AuLOLqG5iT3Neb0lvhAIriOuCV5q4PJD7MCZQMRr6IeAZc62iHmME4gZvSV5znA
	buR5o70DFDEXgRtVwMoQfZUG0J4TrVNi/FXIf3rvXFVZYCpYlejoBLEsdQLpgrOefntH6
X-Gm-Gg: ASbGncv9pX9VJvi0pi413O8dc/vQT8BDSpUqMYbp098CfSB4rugANxEbBkeeUDNpoE8
	pKfi7PVu2rxu6Aiz/nmdzjj7vU4KtY79k8StptrV5T6MJaO7ea/HwYOVUBr+AezKF+hMig9KUiw
	oASfwh/LagTcKA1ZY8MD2x/Sp8CQQLW1Wpzi3Tr+3UguH8Ie6hAsHxIlJk3nRonLGxga6y8wOie
	gS/jB72QoFlua+pc4ZOWeNWr7vYu2+ak9nyy/WAL7qhHKdPVCAvmNB+dO5UTPSc12EimejEi/iY
	sa3ENX0Ti0HG9EXormAv+IcB8xJwx68z3K38xsSSOMOBKMOluIPoQw==
X-Received: by 2002:a05:622a:60c:b0:4b5:db9f:9904 with SMTP id d75a77b69052e-4b77d096969mr25292121cf.22.1757665950464;
        Fri, 12 Sep 2025 01:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmfYwelW8JgprI2UZVxfQqLOHW7kQBbcL91njBTANWpPA6QoJQBKRe6HjQSbxJkGd5DAR5RA==
X-Received: by 2002:a05:622a:60c:b0:4b5:db9f:9904 with SMTP id d75a77b69052e-4b77d096969mr25291771cf.22.1757665949914;
        Fri, 12 Sep 2025 01:32:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1dd3sm31247265e9.2.2025.09.12.01.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:32:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 0/7] soundwire: qcom: add support for v3.1.0
Date: Fri, 12 Sep 2025 09:32:18 +0100
Message-ID: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c3da9f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=plMaQY1jPcDNhxvH7e0A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: N44WKC1rmTby28EFs6368euykuyTjRG_
X-Proofpoint-GUID: N44WKC1rmTby28EFs6368euykuyTjRG_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX8vi9bZyIQJgj
 /lfCBPemWaTffPRgfRzK+B4vCvR5e47a8GqO57gWAD8XscKv98GU8Ng5txV1tXw4ba+TfkSz3fS
 Rp5nE1vVvPpD4UH3PRBAr40g9J8vAPaEw9i0eqs5aiXji9HbK6xpMNCJ7HCNHR+IOVuxFddhutr
 1C7mjARjwVb0F6GOEJ5YYdu9VqBjriUg+HHm9ozJEq1pi43m0S7VxLp189S1igcJizxhOIXVQmk
 O0TeV71/BFYawhKAn1WkuJ+cnsJBs6EwqTGJqF7ERNwoLWoqusRafc4KBR6/xeKSi7ruJXdHwTa
 tZk/4IEk2AZRwSaWPqwSuLN4lBSzCe7+x/AxqqzD10/J8WeqoKcEDzoXIcnKyF+evgUft3vdaUj
 zj4qIzAw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

This patch series adds support for Qualcomm Soundwire Controller
version v3.1.0.
As part for adding this support, a new macro of_property_read_u8_index()
is added so that we can remove the qcom,din-ports and qcom,dout-ports.
As v3.1.0 supports more than 17 soundwire ports. Also due to change in
the register offsets, new entries are added to the variant data.

Tested this patchset on T14s and Glymur reference platform.
Alexey also tested this on SM8550

Merge strategy:

I think the patches can go via soundwire tree given that Rob has
provided Reviewed-by on the of_property patch.
Vinod are you okay with this?

Changes since v3:
	- added bit more flexiblity to driver with a missmatch message
	to address incorrectly specified dt-entires.

Thanks,
Srini

Srinivas Kandagatla (7):
  of: base: Add of_property_read_u8_index
  soundwire: qcom: remove unused rd_fifo_depth
  dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
  soundwire: qcom: deprecate qcom,din/out-ports
  soundwire: qcom: prepare for v3.x
  dt-bindings: soundwire: qcom: Document v3.1.0 version of IP block
  soundwire: qcom: adding support for v3.1.0

 .../bindings/soundwire/qcom,soundwire.yaml    |   8 +-
 drivers/of/property.c                         |  33 +++
 drivers/soundwire/qcom.c                      | 257 +++++++++++-------
 include/linux/of.h                            |   9 +
 4 files changed, 199 insertions(+), 108 deletions(-)

-- 
2.50.0


