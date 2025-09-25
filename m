Return-Path: <linux-arm-msm+bounces-74834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDADB9CE5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B33C2E75AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F321F645;
	Thu, 25 Sep 2025 00:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrD18VF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFD0287269
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758760356; cv=none; b=QJaI/yd1V5uGaf2OLKzzGNp2J7ZrGJGkGe0ODNjBT/YDzQhPUEfLERGnJQn8TUIpNOgdLiT9JOhqba67efkVflr6aWYPTR0j1wjo63u/osBZdrQ7FP8Io3HZdUgIi/Hi1kXmgkCP++sVYFd4k38OM0gMqJ90l2VNS7y9oHW3V7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758760356; c=relaxed/simple;
	bh=tquxESu/nRjr22uamAIgymAqRedGWmQ4uJ4GXogXU1M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ex2TAQpgMDDeok9D6ZvtevfZmGczrIoXW0x9Z8mKw7ZgM/Lb4VUivdhk1fq71ZlildpBYtt4oa0nvrHdBbK0pQ/ri5wgI346kr4OdYKCJxpTl5ASWOmMirnBzpyUwx2THxrAT3uxTJW8KyuZk+3lCvnbIAGOYwLXGfIN8wQFqhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrD18VF3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD8HBP019945
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m3yth0Er6BxjFFQbzZX4hu
	kLa5fd1ASG8+CklnfwgYM=; b=PrD18VF36TYdBNkFOOnrPbvo/WwjRgrD6MrYbR
	eUl8uSMnJsxQV14pZ8cwcf8qLYzZyvTnoHkdvEPRDWePJi5yh5WNmxRCscjuERkZ
	OFlNBJ+eHdP0R8fBOvTQ7ccPU1sF7nteAXNcQTAJxWR72gZA6zfbPQosGG68e7n8
	+wYCJzYPIYhilh3cmW0WkOWadowZ6puLNpyekTOU50Js0/O3r9rMory253yMX0e8
	wU2EMdDpSWw51Kz4c4XAS2D9QNjSVGIbY6rnPEH+eFXnIHsRjCB8F9OFU70mCb8g
	BdImhK2JFz4zu4bAe7VJvN3WD5CO1mcfrb9Hv7uEwIb6qCXg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdyd2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:32:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f6eeb20eso14076761cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758760352; x=1759365152;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3yth0Er6BxjFFQbzZX4hukLa5fd1ASG8+CklnfwgYM=;
        b=uEYxidtHAX4vZHiqExtOVMX9onFdokfqUqh4p2dA9Mf0+XmisazVeorcsgXJ98Ijh0
         L7wnN/cab/y5vxShDAUmbJAYbzl4hJUEv/0FqhoDEAlfXeGFQwdghBTVHKhK7pwG1GVp
         c01Au1/+yoKdamzAVwwKDiRJWrQVXtrrvMypFrHxr8A/fZO3rJxDWYoLCORK+b9Wj8CV
         Ctna2/TviGrKcKtnFLOMyWA6a2Fz4926auN2j9v262cUKIPD9+FjNE17kCNZl3tLc5BK
         XbAN6z9pFNsrdP/BlXY5UeNdS1RxkJt+0j/JycozGF5IWN6y1UmQrqesDWvMzfRJekRn
         Wp0w==
X-Forwarded-Encrypted: i=1; AJvYcCWS/f2lhs1kyvzK3Fga0myx+gaw4ghMrLHiALE/CsPctMc54l8b1Ka+ZDXQZUVEaDjM3iEAQ2NyKzLRVAjb@vger.kernel.org
X-Gm-Message-State: AOJu0YzpWl6QHC1+c9OR3SIDLJgG++fhtm+eoHIrQzTWUMrxL0q8i4C6
	GXDuBfoTwV71ekTfzXRnmK4fil8nVWHcO2dMW8Ecx/aY1u1ps4znXYyfHHSSMDrz2sLm6P5s9rA
	KBIssR65BKDr3oO2YSzdgOZ63+REPrt9NKCjRSl792SoyT/cdQ1T8jcv+srEZrnB/dWgJ
X-Gm-Gg: ASbGncuYlDmyM8HQnRrJjAIzIJcRgUsFl4ItN9fACBIB4Gp0kgMEXevD92jzP4vV7rc
	ZBrn4MI6yysmoaS7zQUIjRmEhl3mlGE8oNUp8it892/I4CUhQUOlKACGsJb6utmu14IULEhvYxy
	0H3dIzqo/T6d0A/XbwcY/062H8RoYcG5KFLhMlDBEVZ4a5RSVrW1sXBc4yQXmHx39CtlO3gOuGX
	AZgs0hJ8MhzHHvlYf3qpUaYC611JtBjPa1G7gtgrPHO65SWUIlk9T7PuO+Cp98tkWaTWv9Js8IW
	NZCy4NsDGJajfE8eRp62fqoM5xL8M79Enw6Uk/rsqQHpne+UUJEPxCKW7OlqWS3iTG15drzjN3x
	7376W4Tn6kk3qhtrvhiqRSa1fkjvJqFE=
X-Received: by 2002:a05:622a:507:b0:4b5:edd3:ddd6 with SMTP id d75a77b69052e-4da4dfa46f7mr21336781cf.82.1758760351858;
        Wed, 24 Sep 2025 17:32:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrcAkBbMUgBHYnvQL0jbnfNZVBsyYnhHLutUzQBJc2Cnxho52Aab7C2HMLQn64KEa3voKmdQ==
X-Received: by 2002:a05:622a:507:b0:4b5:edd3:ddd6 with SMTP id d75a77b69052e-4da4dfa46f7mr21336491cf.82.1758760351398;
        Wed, 24 Sep 2025 17:32:31 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10872687sm1774501cf.28.2025.09.24.17.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:32:30 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v4 0/3] media: qcom: camss: Add sa8775p/qcs8300 camss TPG
 support
Date: Thu, 25 Sep 2025 08:31:58 +0800
Message-Id: <20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH6N1GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMT3eTE3OLi+JKCdF2D5MQks+RUM2Nzo0QloPqCotS0zAqwWdGxtbU
 A9m34+FsAAAA=
X-Change-ID: 20250924-camss_tpg-0cab6ce6372a
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758760347; l=2713;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=tquxESu/nRjr22uamAIgymAqRedGWmQ4uJ4GXogXU1M=;
 b=dTJ9DHs82T6UGBGS2Y1ZkQ0opZ3yYHbIFv4Rhi0SASI4ievWKIsLOMODVz0OK1WOl+HEC6qre
 rBMLP20PdUDCiJeLrSWYOiEDjYLBJYm1/QcZ5ID7Csx++HQzRd219sV
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: YRANglW0IwfxGyhtbCjkRY0027K3liEw
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d48da2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=2kMP3QB-8nRYnlZXCZMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YRANglW0IwfxGyhtbCjkRY0027K3liEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfXwdXV2J+tYTLL
 Um6HwQDa4CJDJDMhwbmaIFekrVoCxEO354p0o7zmQZBP0dYkYHVZAZlj5ZEVa2vZ6E1lM8wyeR2
 MSVfRuS/7CCT//Shtq51vtP1UU/4fA/ft4CKU5xOtu6To1IGVBQoBA25cObwd4exW5wgRGY3uoY
 2f8xw1q3qdWPFr+JuG91gB3PRIYApb97iHjBoSi1BO5/jiHqBrS2K7AOH/8O7Qb5bvvpDmyo8oW
 G+IqCXjLKjAqQm3eV0O1/tFPYIbb/xGicrlo+cqgA/0566TwuBAx0LmVXlhOmOMAvhf6m6X975P
 yq5sc8/NBiTdP5dC6X/s9ZLdbRiK7X0X6fw8DoKtBoJX8ovjsIZAuFwFlmtf44WaNkApIwupPh4
 QKPbxj+6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

This series adds driver changes to bring up the TPG interfaces 
in SA8775P and QCS8300.

We have tested this on qcs9100-ride board and qcs8300-ride board with 
'Test Pattern Generator'. Unlike CSID TPG, this TPG can be seen as 
a combination of CSIPHY and sensor.

Tested with following commands:
- media-ctl --reset
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev4 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
  --capture=7

Changes in V4:
- Rebase changes
- Use GENMASK to define bit fields and avoid using tabs. Use FIELD_PREP and FIELD_GET uniformly to access bit fields.
- Link to V3:https://lore.kernel.org/all/20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com/

Changes in V3:
- Change the payload mode string
- Change the method for setting the TPG clock rate
- Remove the TPG IRQ
- Format correction
- Remove unused variables
- Merge functions and eliminate redundancy
- Modify the register write method
- Change TPG matching method to use grp_id
- Encapsulate magic numbers as macros
- Link to V2: https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/

Changes in V2:
- rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
- Link to V1: https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/

---
Wenmeng Liu (3):
      media: qcom: camss: Add support for TPG common
      media: qcom: camss: Add link support for TPG common
      media: qcom: camss: tpg: Add TPG support for SA8775P and QCS8300

 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  17 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  43 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 219 +++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 696 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 125 ++++
 drivers/media/platform/qcom/camss/camss.c          | 131 ++++
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 10 files changed, 1227 insertions(+), 14 deletions(-)
---
base-commit: ce7f1a983b074f6cf8609068088ca3182c569ee4
change-id: 20250924-camss_tpg-0cab6ce6372a

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


