Return-Path: <linux-arm-msm+bounces-85440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 503F4CC64B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 07:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B09C30221A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 06:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED68432D0E7;
	Wed, 17 Dec 2025 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5g/UOyj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwiB7uWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD22932D0CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954293; cv=none; b=kJDVhuiwMGDC7qR/Pq+xJdXKbHodeCQtWKrbDzUo8GojtW6rpfLdfm4iglXmcXeISPJFuC34cuuvAW9tpV5EcaHhiWGiVMsIQQPFvEiwKQ8S1mweP5WavmYmkAfJhBdJFItdsdEY6r+ZxR27xOaf3GcHgAVKCxt/fEAxS6/3czw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954293; c=relaxed/simple;
	bh=n5Sih3s6jryc4fF2MY9dv+Gd+rAfVNaFbJvhtbsBlRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=piz3FaAjSuAdiDYyfai4yX5jYQREWJVp3g9vKybkzJmk9sTXfDO7lju1ZlwJUWpFRQrgTr9FVN3oD1e+53jPExIRI0HcRlDyPsAw63AgXr3VKDwy2AsVnPUEDPMlFAJJtVoCkYzchNkztk62oVmHRqL2AcN3Nx/2yvnrVQ3pa68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5g/UOyj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwiB7uWE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FKxt1215351
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4iEXzkIhLRU
	2sQ9AE5qIvZK9w6C3kkeCAzjrneXwTAA=; b=W5g/UOyjFYjrrGewB/wQNKJfm9m
	PLgYFYKYftWriqqVUNEAUQ65OrqjDKBlR/nuUFx2mk+v13DmzLWAOi4MIjLMLngl
	R1SmDSriarL4xw2FGc2qFxDjzraM2JUDs7yqndpNav8t09cKF49cDmI48ny/RUeM
	YpB3SKjqbt+jb0eWgtRQ1bMFynkjHLDnetWZJeKA7xjwz9WUJwn12joSJu+/eIkf
	YdKmSed/6fhjgbX1qK84xYa0PTPc8/czUF2ZeJGAk1pWA8s001Q93U57BPWTObWc
	RJFkO2fguilcj517dVEUGVV/qGf1O1xr80VE2aeMwYY6e/1ex+5xaEySC6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g266w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29da1ea0b97so140073585ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 22:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765954280; x=1766559080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iEXzkIhLRU2sQ9AE5qIvZK9w6C3kkeCAzjrneXwTAA=;
        b=UwiB7uWEe+H7C7NUL0+08TCprWb4pAyR9sbXykmPG1Y0jMlN+hQniQ6jzcs9t/2JRw
         1coqnSLUsRK/+tjubqjpeGIxUw/vs0ipQzZCkIt+cXBNHxn6QyJDnbN2c7sA3Hetarqy
         eEdLNX4zRev/KyEPbDXjZ0ZNcSF7GKjMl8zEGBWlbYB1gCaz70WvvCUC20kPpcKHS5sq
         +pXE5uuFJ2c6JYIEdzUKasKtk7yvqpE9M6W3hnsDsuIIGTkuwcgxhZm3ObhfpE6BfBl8
         wXtnIX7Elm9rL66UPeMikxa1muWkjxlz691Lk/z8znEy0qi+mDYGsz0mLvd9eBbfKEZF
         Pmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954280; x=1766559080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4iEXzkIhLRU2sQ9AE5qIvZK9w6C3kkeCAzjrneXwTAA=;
        b=tSkOE447bHqKqrX1LCkOhafbN4S5Z2OJSrXXwUuX6Te86CiLekwnhdhfDvzJJar4pS
         oGeUwHekYrhcGsWVlXVxWkx9Xsq0uk45N0YAECs9c4X0EfgFxgfbU76TxHEIgKx4zf9x
         SnpCoTiAef1Pr4UDCe0hgcaH1WN73SQc+ma0zfnScdqWs2H+y1hjA3+iWYk4YPVK9uJT
         76UU3ZNX+JQa/GXeBmgf0frcob/NzkDwyzHvvRm7bVRS4/hgS+NBi2P4SAl+iIFgYV3M
         NmnrVtVOhBRqy3Zx4J/+6Cik7BZeax5NACC/QYPkQHaqa6/OesAyDC1WicQXNm9Woqvl
         +r1A==
X-Forwarded-Encrypted: i=1; AJvYcCXQUr6hw06/a0RUQ6uPhWo6ObMQ+mwAPgGg4/vwqyGFlGY0d4XjonUdnH01d9vn0Hwz2DFhg+MfavmgTuM6@vger.kernel.org
X-Gm-Message-State: AOJu0YzcJz35uTkeDtpDQs4Ncc/JV+RUa716gGuIoQ+7VRcAkPbSsf5u
	kVpg0aq+BzOb6zByatOzwPoXIy67EEgAcGKA6aBkiVBr6oCKVvqHMGm1ec36d+UiHsQwo4X26uC
	vAe8L11BF9T5aD6VBnbUFfZUVusX+q4xhCBhRNhEXgiqdJa4odJbzT/GJLhg+VZqa5fbn
X-Gm-Gg: AY/fxX6SUBGxsPBrSZbt79p+VuVS+87RZ5Qr+hksyS+CbBr81n/EOUvusid6JV2ECw/
	dcvcUsz2zQbCN8oxpzOvNApvmgSvdLxT/OA8vjkdl/FoA2Zb+sEoI1WO5KVwNtnWanJnkVY8pVk
	C781BPwL5Qpya/P2KbXfSnV4LWqCbKQkYhYJanlYTuwfavVm59hjLhb3oq5Pqm9OsdiPQzeuleU
	DaxrnKiLLgnpbfznsK78EtIk8MoaUsz+j4ph3Q4kwpR4RYiaRXzazpgnAoyL4ryHfEy0Aweiu2c
	dLL+dc2jNDMyeUyHHiIyYdq4opQJ1D4OoWUTEbQX6nswCjzbj/JA1JIo9bUD7v51QUQccb3cvqZ
	KEBPvrvKWCQif/C1BV/MUqNPef/rJFNE8w4nFd5NCwyhlQw8c/4Q46Nw+hw1K7dXYVr8cwbhCxo
	JG
X-Received: by 2002:a17:903:1986:b0:29d:7a96:7ba1 with SMTP id d9443c01a7336-29f2436da68mr156682905ad.46.1765954280362;
        Tue, 16 Dec 2025 22:51:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIbB9Knwe9bfEuTzW2OVz/ykkHTd22n1PPWbVEsjNZs6oAXaLe1AKuG0gZ8WAQKZuVACtHPg==
X-Received: by 2002:a17:903:1986:b0:29d:7a96:7ba1 with SMTP id d9443c01a7336-29f2436da68mr156682715ad.46.1765954279899;
        Tue, 16 Dec 2025 22:51:19 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm118846515ad.46.2025.12.16.22.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:51:19 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 1/5] rpmsg: Replace sprintf() with sysfs_emit() in sysfs show
Date: Wed, 17 Dec 2025 14:51:08 +0800
Message-ID: <20251217065112.18392-2-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 26cKKzybfXR5ZkVRtDszgpHZyAwel0Rh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MyBTYWx0ZWRfX2pX0ADfPkrjl
 HiSc3yWNaFLKLu+ob8lPVjdN2/FisZWcZkHWjy7+AgCnKFx1N1AOe6JxXvhUov1dzaeX5ATaYOH
 8LWDOrmXvFe0AArib+MpJk77Z66iG1+NQ174cGF0lvdvijITLgLwXlB7vhofYSc2ytW+1+bSPlz
 E1boX58b5vqiLZisowqnOX8qr80UUIQJQ4UisU/GY+sWlghTmE76Z1GK4qmZkSN/APXxRwJg84Z
 YqQ3Lj0mx4asP/QevzcqcqgJRT5SN1ZGmXPWB42bg5Fa7gIMBbWrgftcZNzraV90C/edrgOrR5T
 KxNrzUx4y3z1h73vU9gfAdvvz8yv2IJhq6g5G9NxFXMI4D9l+U8Iq0VVOwarMhWBgiFr3EzHG/Z
 f5Hujpyf3KGnTNgPrginmMu9Ol5eIA==
X-Proofpoint-GUID: 26cKKzybfXR5ZkVRtDszgpHZyAwel0Rh
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=694252e9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zeoL4EY6mI-QDyTLeegA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170053

Use sysfs_emit() instead of sprintf() in sysfs attribute show functions.
sysfs_emit() is the recommended API for sysfs output as it provides buffer
overflow protection and proper formatting.

No functional changes.

Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_smd.c   | 2 +-
 drivers/rpmsg/rpmsg_char.c | 6 +++---
 drivers/rpmsg/rpmsg_core.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 42594f5ee438..2793096aba45 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1458,7 +1458,7 @@ static ssize_t rpmsg_name_show(struct device *dev,
 {
 	struct qcom_smd_edge *edge = to_smd_edge(dev);
 
-	return sprintf(buf, "%s\n", edge->name);
+	return sysfs_emit(buf, "%s\n", edge->name);
 }
 static DEVICE_ATTR_RO(rpmsg_name);
 
diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 96fcdd2d7093..3287e7941c8c 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -365,7 +365,7 @@ static ssize_t name_show(struct device *dev, struct device_attribute *attr,
 {
 	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%s\n", eptdev->chinfo.name);
+	return sysfs_emit(buf, "%s\n", eptdev->chinfo.name);
 }
 static DEVICE_ATTR_RO(name);
 
@@ -374,7 +374,7 @@ static ssize_t src_show(struct device *dev, struct device_attribute *attr,
 {
 	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%d\n", eptdev->chinfo.src);
+	return sysfs_emit(buf, "%d\n", eptdev->chinfo.src);
 }
 static DEVICE_ATTR_RO(src);
 
@@ -383,7 +383,7 @@ static ssize_t dst_show(struct device *dev, struct device_attribute *attr,
 {
 	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%d\n", eptdev->chinfo.dst);
+	return sysfs_emit(buf, "%d\n", eptdev->chinfo.dst);
 }
 static DEVICE_ATTR_RO(dst);
 
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 96964745065b..bcfd17e5309e 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -348,7 +348,7 @@ field##_show(struct device *dev,					\
 {									\
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);		\
 									\
-	return sprintf(buf, format_string, rpdev->path);		\
+	return sysfs_emit(buf, format_string, rpdev->path);		\
 }									\
 static DEVICE_ATTR_RO(field);
 
@@ -395,7 +395,7 @@ static ssize_t modalias_show(struct device *dev,
 	if (len != -ENODEV)
 		return len;
 
-	return sprintf(buf, RPMSG_DEVICE_MODALIAS_FMT "\n", rpdev->id.name);
+	return sysfs_emit(buf, RPMSG_DEVICE_MODALIAS_FMT "\n", rpdev->id.name);
 }
 static DEVICE_ATTR_RO(modalias);
 
-- 
2.43.0


