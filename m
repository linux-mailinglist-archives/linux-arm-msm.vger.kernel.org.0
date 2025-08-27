Return-Path: <linux-arm-msm+bounces-71044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4424B38AB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 22:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F4A67A8CB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 20:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB5A2F069C;
	Wed, 27 Aug 2025 20:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqQLc/Df"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3CF27E1D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 20:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756325569; cv=none; b=lRWE7nW5qL2ZE/5CRxyzWqaVuadWCTNQ5EGloBkK6/evmAkJtO45/xbqmzOUM0kk4R4Ukn3L+XoFiyKCL0HfL2shmxXzta8xex4w0pfCisjxVj/knuKU4HbQF4afOI3YkTGcWnL+n+sNTmQye+88JFp22ZaK3I44kdSEc/r8ajI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756325569; c=relaxed/simple;
	bh=6GmnI1fMybhqicxB/7VgMGg5+hQSNmBIZIYiqagcYic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lv3PaQ+C7eQcHF7SetG7y1vdNNgXQKb/eMsw7veOqXHOz57+g0i2S39E3y9t/tmdYBff+lse5J4ZhQBoN39/W7PNgCqJoJVUoBtKQB5883ZtJkxz+dxVi/GgdFgaX/jlOv4GoO7PLKcsQEiymze2Wj0Snqvk76SkscAiSBNz/pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqQLc/Df; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGpBON030476
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 20:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2W400xC5n7cfA8Y337CijqTRODH/oa50Xrk
	MZjZCGpc=; b=CqQLc/DfeYNyn8kWupGgcwzYPZHK6NYpzBv8YI8B9x0myS1vh33
	T1orqJlnrUFwGi8zKQWx5x5uykwqe4VwWeiXq/0YY3p2wV0atpjTEc4cRacV0KRm
	plPP29KPAilGmqtUmY1OkveSo3FWjp+aXFOhOzlWfDuQwgQ5z7mwrahy/XcarNC2
	Aavka3jTOIv5giMMBvzqxELiUkeH92XMZycRGjdncCDapH/rjNYGS53nP/jG5sVJ
	7gpF/Z9a9GHbtWJWb5aYuZBxshwvs/Ny6tRnrVz4uI6hWr5M9Ed0m1LJbp7kBwEy
	g9iMLMHG4lJLOEB7Bod++OHf7k9zHkpFQIA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unwp8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 20:12:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-772178f07f8so98018b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 13:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756325564; x=1756930364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2W400xC5n7cfA8Y337CijqTRODH/oa50XrkMZjZCGpc=;
        b=kViNI5k3f7tz38H+Neasbvt1+kyhjVCfKX5/YkHFo3vH3xyykUc3S39DLMpI5XQirX
         Bo/MzJqqBYTQsoRc8VeRd2pYuj+8xL7eXwk6X28WUQpIJUVMjfiTU3qjEczFkPibxROX
         H4B/slJBUrnb0uFlFtRca6XC3O5MruL8dgsq4iTX2pFNRs8s5m0zMqunCcLbg3Ko3fAi
         xxv9E9huaxn6SSxegp0zKGLmHSv0+iz0tDljeLZ9qe7w3BFdZNfhHI+BSoV5iDqnjlCz
         39bsjBBjuOUCgVRUxd0WQHrtpGmPzggau87rgzD9hI/d2zyYU58szY8T9hVPFQAp+lq9
         3b4g==
X-Forwarded-Encrypted: i=1; AJvYcCWDCT9eKM0FF3zAHvmY7Oix6YnvXWveKsvixEFTOBZnz2kB4Bu174mYnjcxsIh9jbRN/uaE9F76Odj9/XIS@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ631RUxCkLLc73b4EhGyw4MJ0uJxeqrups2xq3S8+njzG/mqr
	Uk0NMqdUdYsTX3vt/l6smHxwSafCtR7s3HDr/7HOa7JSFN82OUSP+SK1M6uTSymKIYlkpElrFy7
	B0rS3FM5DIgAFEetXHU40Z87xA8u57Drn616LtwgcnT7ntZ1A3ghSpELRBJh+tz7rWWyZ
X-Gm-Gg: ASbGncvOjRfS8MdICrsh2cATjW0Q6Hz2Jz+6rEI72/6NQWaBcJpgDBKGeZzILTQ3G93
	9D3vadW9Dv6al+SYtnVsiaHzNYFpX6u65Lh0BrLvQvrJ80fdXVTIXBjSNn4nhEwo0laiNJXL50P
	nL/YrK5hGP8PAS6g+mTzV4/istI5o8qB9a8u0Q5odqQwfkvOMhBmrwBYLNEWi6eTKRTDONcmUbt
	9o93BuB/irKegfXHZbnPg3Oc/XjWRq/q6b4xD6YVctdZBLZ4ZL896RsVDwoInr7gGBP2kNCSM5B
	8wiHw8yc6a8nZ7yC2U7R4/sEqG1VNuGmFlOvgisIKVPhTPsW7hNn+BKFbZB3Binmh+1CgMDv20g
	sFxHMUIecVAWMntZUJt4sg5KpWv0=
X-Received: by 2002:a05:6a20:7f94:b0:240:cd0:b18f with SMTP id adf61e73a8af0-2438fad0df0mr9761654637.4.1756325563704;
        Wed, 27 Aug 2025 13:12:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0QEu0/kGlCWahFx7HAWckxBz/67xuMREB/xco3f0jql4OL36gLFpqeZcE5+d7YxYJzc4K7A==
X-Received: by 2002:a05:6a20:7f94:b0:240:cd0:b18f with SMTP id adf61e73a8af0-2438fad0df0mr9761614637.4.1756325563305;
        Wed, 27 Aug 2025 13:12:43 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbbbaffdsm12185234a12.51.2025.08.27.13.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 13:12:42 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/2] usb: typec: ucsi_glink: Add support UCSI v2
Date: Wed, 27 Aug 2025 13:12:39 -0700
Message-Id: <20250827201241.3111857-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2tRQLBqDKUHVWnmitL1lHs1ax6RO-3TJ
X-Proofpoint-ORIG-GUID: 2tRQLBqDKUHVWnmitL1lHs1ax6RO-3TJ
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68af66bd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AXDibm61ZLAIF834zmQA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX437VUUsp90p0
 qe2AtkvoOD2BxjKx3l4g5PWlcPUamlBTpg4F5lP+O2cKUVzk037vnHfsiMCyHyCOV39umawDphX
 FxNPYPUOdMatdZUkELm5EDrWcJSRiSf0YDW3i5qeAjuhxJERXPDzHzYDQWVkD7A6V+Bu6PUpNXV
 LUH16xi8kPm8c3OYVDY/uiwfZ6H2JqQwHwdS426JDsCWJvhuon1SGIkylW0NF/jAA9ueSvNq103
 pzL/xAiRN0V7hcGf2Y91YpmqmqVWauEVEMm03o0Ul+V7G6eZQn+898/F2sgnuAwaM9hFAcjkUui
 FLt7nbJGettSP7fAqurMsFGVlPmJQBctr/+qixUwzeCBTZPfy+zHKsKE/z5WPm1Ju9RXD27uQgk
 VJ8HSAwT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
16 bytes to 256 bytes each for the message exchange between OPM and PPM
This makes the total buffer size increase from 48 bytes to 528 bytes.
Update the buffer size to support this increase.

While at it also update the UCSI read/request buffers to be packed.

Changes since v2:
 - Added "usb: typec: ucsi_glink: Update request/response buffers
   to be packed" patch
 - Added length checks
 - Updated version checks to use UCSI_VERSION_2_0 instead of UCSI_VERSION_2_1
 - link: https://lore.kernel.org/all/20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com/
Changes since v1:
 - Defined buf size in terms of other UCSI defines
 - Removed UCSI_BUF_SIZE and used the explicit v1 or v2 buffer size macros
 - Removed Qualcomm copyright
 - link: https://lore.kernel.org/all/20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com/

Anjelique Melendez (2):
  usb: typec: ucsi_glink: Update request/response buffers to be packed
  usb: typec: ucsi_glink: Increase buffer size to support UCSI v2

 drivers/usb/typec/ucsi/ucsi_glink.c | 93 ++++++++++++++++++++++++-----
 1 file changed, 79 insertions(+), 14 deletions(-)

-- 
2.34.1


