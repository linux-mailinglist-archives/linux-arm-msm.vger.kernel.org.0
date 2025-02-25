Return-Path: <linux-arm-msm+bounces-49369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C715A44B35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 20:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EC7E3AFE68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FCD1D63C6;
	Tue, 25 Feb 2025 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5mHQbY+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D5619ADA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 19:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740511476; cv=none; b=HTK2DIPDODqNXf574lDUdtg5xVo0FYFmTaJds+CTcGl88y8VeIQd5lUtSdL1Q85clKbMFzP79kVRsEbqsnExhGRrVC2xhR/zjSc1a4/OEMJtIg4TqTYhPHnSXFSYXGZI6jyYD6RDlnFMr2mhgcLHmqX0e9byvLEZbYVE3kMbK6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740511476; c=relaxed/simple;
	bh=6OgzkiWBMP/7RrxzCGyTQ49Zen1dwXVUytChFQLaUxU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NLMYwPzuPy4g62+j3n3WM++1gpBUfgq0f6orEDYPDgrETQkfVkZ4wqaHeSUAIAzjdT+k1DcE+etqxpsLjnnDzGlqSCMTLl2Uy5V9WbpXvf+mTTTOr92s+UWegzGW/pDq+SsMaSDfYkH4y0XE/cMlL3W5AvdcFwrjPP7IdMdQzzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5mHQbY+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PIeTvD013431
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 19:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TsrQvuOeoQBZ/rKsZq7MLKcDFYqh1zrSm9L
	OgeM5M04=; b=D5mHQbY+wpnQe8qqXmKHApcbPpeqUU/vohykitgk7sAuIwKK+ry
	WbqdiGGol+HDmxv06hBCAONBAONX+TpPTAHCduQH6qnmImIoTDZKfD638iKPYWFr
	X2AGV+Gx4uq5iBVPyzVqGufPZPLVJ1kzHAjRHytEGCBLG6KmmDEG17HiKdXLefBk
	1X1MqIrQJ8EdNhnh6/ccCQObtBCaZtybfYurqKed8HGT7xRYv9QTj1gNIFFYwhMj
	jbfoeKxrbW/kw8kJocx8bfsqEKpPnClwrRhsYAg1gCab7YZnkcR5asW+xNMpfbAC
	ZfDMc7bOgfCTk00IRi3yiaum6ifohDw+Jwg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5wgt28j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 19:24:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-220ff7d7b67so116800995ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 11:24:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740511471; x=1741116271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsrQvuOeoQBZ/rKsZq7MLKcDFYqh1zrSm9LOgeM5M04=;
        b=YMJWXf2lE8TQ4rzJ1f12ESMM4C/Cxn9+wR3iCOjIwY6FE1etbFpipCMnJEgZ4DRZ2H
         MJANcBjQgX0+ZzMpQ2Xw81QuwnSvlw8cR9ujOfJkPh2ItQXlhgzindDpQtDoYFjVvCUy
         ni6Cz8ByrE1KBbXTUKNXWt2DnuY04arQBoFvVEKhy6QcfYKQfapYmU17F8sQ/gZiTAUl
         KRnIVE6mInM4ts+4eu30Uud93Azt/owTbUtEaxbl4ByJEs9sDMvXJCM1fYLYvRXMIyD+
         OCQv8MQ9jqaXXAMd4i4foLQDi05TLzEgqvxWayGh/NrdWBPsncRmttWwHARJaEKGUchJ
         Q+sw==
X-Forwarded-Encrypted: i=1; AJvYcCXjJUHh1t/fLEuN8q8wogTsRnLtraY6kPdeZnsSlRXS9EkF8+0exGgUKUka2KSv3fc2fs9cyUoJb5jiljBb@vger.kernel.org
X-Gm-Message-State: AOJu0YwbDIb4kdYxVJAzBiBmXg42Q9Ar0YCoYiVz2pZO5Mo9rw/yfEZc
	ofXJY07AOb2hjlGYFt1Qjcw1LcvHSCgIdyCVXbTVRpdJk4TD7uhjQgzJupQ1QMlfse8sIV63BQ6
	7+3+2M5/MwZgKiKFbAOVQrDTMj/5d2iT0XjR6zggsjeBQNZFiSlUqk7vPeX1e5Chl
X-Gm-Gg: ASbGncucjDXeJFBK66iO9MoNEQB7o+BbBfhitVOFdMWZkuMpjyWTHtRN5nlyRqIJqQn
	ZENUPLT5qoFrZL2YJ17KwxLj7qnvEasMzCaP49sUgG3N+gRbl60TaqL3VV+YAwhsR35PLGcApSu
	7dYJqgUINYDqr0s556bGlQp4AMUehVni/DgA3EmDu0dr+jY2cpyaJt8O7r6VIS6hzj3Coy0q1jm
	5axy1/0c90EMvpegoTey6dlBxU9SWok1lJGuUosG4qiRojy3JHt1PPxvCIexqLPT4DUN7aeaElr
	ksOCbPDDgEeWUKdGsAq98NwBWoMiPnrfM1kQwPohvptcSuBbkRLz9mx1W06tHoQwYzlWtfrh88u
	yWMk=
X-Received: by 2002:a17:903:230d:b0:220:d532:834e with SMTP id d9443c01a7336-2219ff9ee9amr310444385ad.19.1740511471040;
        Tue, 25 Feb 2025 11:24:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDz/JNFm/2arbEk/SBsmKjhdJe2VRlvVj3HEycbLIoL67Uud6lEOpWzpbXBsGL78mTEoh8gA==
X-Received: by 2002:a17:903:230d:b0:220:d532:834e with SMTP id d9443c01a7336-2219ff9ee9amr310443935ad.19.1740511470637;
        Tue, 25 Feb 2025 11:24:30 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a095865sm17915365ad.145.2025.02.25.11.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 11:24:30 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] thermal: qcom-spmi-temp-alarm: Add support for new TEMP_ALARM subtypes
Date: Tue, 25 Feb 2025 11:24:24 -0800
Message-Id: <20250225192429.2328092-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bdxiNJk0At5lb7dGPmDniBUjbuFVQi8G
X-Proofpoint-ORIG-GUID: bdxiNJk0At5lb7dGPmDniBUjbuFVQi8G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_06,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250120

Add support in the qcom-spmi-temp-alarm driver for the new PMIC
TEMP_ALARM peripheral subtypes: GEN2 rev 2 and LITE. The GEN2 rev 2
subtype provides greater flexibility in temperature threshold
specification by using an independent register value to configure
each of the three thresholds. The LITE subtype utilizes a simplified
set of control registers to configure two thresholds: warning and
shutdown. While at it refactor the qcom-spmi-temp-alarm driver to limit
code reuse and if/else statements when deciphering between TEMP_ALARM 
peripheral subtypes. 

Also add support to avoid a potential issue on certain versions of
the TEMP_ALARM GEN2 subtype when automatic stage 2 partial shutdown
is disabled.

This patch series is a continuation of older series from 7/2024
(https://lore.kernel.org/all/20240729231259.2122976-1-quic_amelende@quicinc.com/)
but current series has been reworked to address the change in thermal framework to
update .set_trip_temp() callback function variables
(https://lore.kernel.org/all/8392906.T7Z3S40VBb@rjwysocki.net/)

Changes since v1:
  - Remove unnecessary moving of code
  - Added new v2 patch 3/5 add a preparation patch to v1 patch 2/5
  - Updated temp alarm data function names to be consistently named

Anjelique Melendez (4):
  thermal: qcom-spmi-temp-alarm: Add temp alarm data struct based on HW
    subtype
  thermal: qcom-spmi-temp-alarm: Prepare to support additional Temp
    Alarm subtypes
  thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 2 PMIC
    peripherals
  thermal: qcom-spmi-temp-alarm: add support for LITE PMIC peripherals

David Collins (1):
  thermal: qcom-spmi-temp-alarm: enable stage 2 shutdown when required

 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 511 ++++++++++++++++++--
 1 file changed, 462 insertions(+), 49 deletions(-)

-- 
2.34.1


