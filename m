Return-Path: <linux-arm-msm+bounces-75510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 567DFBA983C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 16:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3CCC16595E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 14:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25973064A3;
	Mon, 29 Sep 2025 14:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoZku9W1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D682FB080
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759155436; cv=none; b=KS+tCg6QCgdjg2cOJO/ittjiRIh0jO3Q1d7j2TRa4gA+XDJbOgabMQisxIIqfHOMvGmzhvqZSQiJtLz+g8s2Acmv6v+cV7ID64omlDQ3twyxQqKPrbZGJrykGAda948+fony1fWtGozdf2OXHWf0tIuh0/i74H2Tf+cMgKu0h4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759155436; c=relaxed/simple;
	bh=wuz6WpMR2FmYpCZb3KByeL9QSwX48+1y8xgDD41qeCw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CyLfA91OIU5InH6liFdvE78orFEWdxK8INc2KvPOsz5nMIbkF4Fx2xmLbCnEzsdUzPaAP6I3xSJO0/XA5nW8/XCYCpqpSRmHRnuFkKdzwDau9NJi7kduJkc7FamVJg+N0b6XkzmFYPkJeebv//X1gRGlJ2xBCNl7Ik2RcnfKHBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoZku9W1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TAUWo5010542
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 14:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uSpw/jCs9xhUh5GAV+l3XS
	y8IK/VN6IuG8B8IRTx+ro=; b=MoZku9W1c+YWsHwOU08oVAt4Cd06WH5uxYJDdf
	2XT/+b1/eSBt0HnfLVtLg1NE9NaBii1LvOgPgXBPtKD6V5GCVHdmotS/blSNdisW
	fZVQVlrvu7d2FR09UgIZpkSqLEeDRB7GYJHjGl2K99PHq5EbHXLUO6KR1OhWlU86
	wtehvLeP5BWYm/SpnU7x3O6cT3ct8F0KEoF0udfhO07ZKyJTdfZadxo45r7eGPbQ
	PiC5sMoKh4Hql4iEp/TPDErwwkEyNbJhGvhUSaMU8MVYtKJnsPKCUDoCJwAi5U9o
	h4r4kRYO3sZMSB0YUMOUDjkvjBBfxDf6ArR9WZdZKn5Th9ew==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851df80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 14:17:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-781253de15aso4981161b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 07:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759155433; x=1759760233;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSpw/jCs9xhUh5GAV+l3XSy8IK/VN6IuG8B8IRTx+ro=;
        b=UPwFFazs8MS2YpL1YPQuRYVHgt3y0qPV7IzmtG+dynLLUjpJi5OnBeYaPg8WlOZ9D7
         7rJUqpYb9RLqrNvdF1LTUbsm6ffvyTgvFIkscJC/NLadFAA9ihqkFQZRvtXgm4+jkHUg
         MfWbXx8nE7FQNM9hUv6K6A0jmCK/+rlpT7oX/SF8vFmp5G3zmnFrp/RdWASEhNdGAxA/
         JG4O8jLJPevGjr1+fP1H1G2ETuniLOY43+JfzuiUjFHZshlXjHnKOOzok2S3NhOaRkxR
         L9p3ly7RHJ3wojt1RgJLF+EXCilwkaQtkt/MVL+e8vEBRHP9qnnxPJ/5is9hN4xo0iof
         3g4g==
X-Gm-Message-State: AOJu0YxG37nVjrffGZvDxlUBb6SQ2Au0UHh4AOGufk2UwclPsdmKlk84
	oamuEum8ymx84jQdbsSwzWGBr4hj3IYa4RidiyVKYlixWipboVksv282Qm5OmiGdvFkwItUaqpD
	aUhbEjkg1ZoXB99Hz9ktxsA6y3a230OXUA4fJaLWTJL4z7krogJ+BCFMhW2ybYuXIG3dlIzTv4P
	Nd
X-Gm-Gg: ASbGncud9Sa0Gl3YBA9Z+fhcEggCYEU1YXq7zfQbOpCEuib23FV0wsAnopEgGSQyFt+
	LliPOrLrIriSKBdnYhcpV9DqFjbErckK6J9oct+r0phigD0oMX6BLXUmdy5G1esGoh8/Sumc8/H
	GGD6/e6mBvEdU2TPh0eCXLj5VhrJ+RbzPP6rtsgWaWQ02aF1Ox/a4Wr0OvsFazEU2+BbHyyMA1+
	2Q7iKypTkYEfsE46UR2djgXH7OrM9u7vR7XZPo5wRQGuCupFwaguZN+SNZX3ElV3Pde7B0ZJhAX
	mmN7NbZaYHs5bFyhNNWZ08CTJ+6H7RDqyB94W+klMFmT7YiulQNhzlUJnYwbVQ24xfmXmL8xzwZ
	GMjLtBF57bfJCr3uSfwsMgdhtJdO5Yim9IbRCf6oTZL3mCgVPVmvjS1hiyPLpia3q2EIRmW9Pto
	s=
X-Received: by 2002:a05:6a00:3e0b:b0:772:2e09:bfcc with SMTP id d2e1a72fcca58-780fcef7c3emr15809843b3a.30.1759155433446;
        Mon, 29 Sep 2025 07:17:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1gDeS5o+KAXQUuBVzHve/ZhNQQy2xaT9LbSgMWBNNxR5PRH1SP++JRQwj0MYWsqBxi1blAg==
X-Received: by 2002:a05:6a00:3e0b:b0:772:2e09:bfcc with SMTP id d2e1a72fcca58-780fcef7c3emr15809824b3a.30.1759155432990;
        Mon, 29 Sep 2025 07:17:12 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b23a48sm11536334b3a.59.2025.09.29.07.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 07:17:12 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add the missing entries in the SMEM image table
Date: Mon, 29 Sep 2025 19:47:06 +0530
Message-Id: <20250929-image_crm-v1-0-e06530c42357@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOKU2mgC/23MQQqDMBCF4atI1o1kJgaxq96jlBLjVAONsUkbW
 sS7N7ppF24G/uHxzSxSsBTZsZhZoGSj9WMOOBTMDHrsidsuN0OBStRQcet0T1cTHMcaW2U0Ko0
 ty/sp0M2+N+t8yT3Y+PThs9EJ1u+ekoALLmXTKEmVBuhOPsby8dJ3450r82ErlvAHNFD/A5gBB
 KErAVIKI3eAZVm+JPlpweoAAAA=
X-Change-ID: 20250714-image_crm-272b5ca25a2b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759155430; l=802;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=wuz6WpMR2FmYpCZb3KByeL9QSwX48+1y8xgDD41qeCw=;
 b=Ivd5o+1MFNJUhI+xw2CZ1QgKnBFe6oOyE6kdkgHM4X2JKrzw2QVMSDUXM6YVNMGehrsLvxFSw
 /gCxTVL/YEnDBMTr/x3FnJR95XJQ8WwPN/5oM0E0QwA3dsoYZ4bYVnp
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68da94ea cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bJqOVrwxxN2ZfhMSaZAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfXwra+pKmyAhm+
 EKpH2Wkxi7KeUY71xyw70YTi7fE8embBrmUvcDuDCoQ0oQcKXh9TWwRPQm99rNHGkvQkyy/Bb+z
 gC7W4gwi5Pi6NKJ6lfQFX6v/vLWQ1VXNBXw8nAT7yHkyPZXt9nPJVLVaavKNjszTGxVQymN2cSN
 CDcCDeLC1lB82dQwhS1Xfx6RgWxDHJURKhgiB0VIP5smhXzl0s0OZtbdoUl1YG2NMXtMv+WOMFY
 9hx/972D3tn4X1OSXb6PZB5F7+uCiSqEelRhp3vxFu8yMycVGlalvobDFORusHTh1iDsZHl+UeE
 J0RiBCviyX/gDGNclhIYxu+iAFL5gPyuuO42tfUsasvIj6/wP1Lrs0FBfcVtDxgviDgkjqQXm2k
 lwoERsq060ovadybAfHUkhGBQU6X+g==
X-Proofpoint-ORIG-GUID: DZZj4SSfq44T2LBRkXZe1E417xbKXNhx
X-Proofpoint-GUID: DZZj4SSfq44T2LBRkXZe1E417xbKXNhx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_05,2025-09-29_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

Rather than adding support for one each image at a time, populate all
the image details at once for the completeness. Additionally sort the
socinfo_image_names array in alphabetical order.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      soc: qcom: socinfo: arrange the socinfo_image_names array in alphabetical order
      soc: qcom: socinfo: add the missing entries to the smem image table

 drivers/soc/qcom/socinfo.c | 46 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 6 deletions(-)
---
base-commit: 262858079afde6d367ce3db183c74d8a43a0e83f
change-id: 20250714-image_crm-272b5ca25a2b

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


