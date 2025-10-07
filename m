Return-Path: <linux-arm-msm+bounces-76255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B43C0BC2357
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 19:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DDCB3BB521
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 17:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55ED720298D;
	Tue,  7 Oct 2025 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHWWecv3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22511898E9
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759856496; cv=none; b=Z4Nb8Wq7WAUb5ogEy/u16pVK6NZJwLgRY7Uff9fCkLRK72Etvy6mxYNZzGNcwPDMqplDJ+2kYzTFGe7eRhLw4H5KZkP5/6vLq+zHF4Z8pNZpe0w1mN7ZL4uc6PtPtW1Nbxl+7swKfdjF2BORcmY4YkVcxOMIRUDYNRmzWuxF7DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759856496; c=relaxed/simple;
	bh=XFA38RO+vKRdZUk93YQY4JH7CgK7fKrkHJ8uYJBvBvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b1yp6rCzmyIlSvgWR5izZY/jspdr37kpCNGZWK/55fdx87eSCGmVJT2qg2sGZUfG0wJmC1koqHHxvYYsVRFt6BRZOJnV2XmOnOPDZ1t/jhS9uTWWRpS5hEq5vqoDtDkSqW5xJ9gjmC+bqukSFZ0S0aZoB6m04+KRfSRruiaift4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QHWWecv3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET52h000445
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 17:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Cji6HN7EgrDN8yeGOTOkDfIAV0rhFg81di5
	0RD+S8AY=; b=QHWWecv3A46AtqXry6AdYHAd0ztFyiWzX+Tz8n3zIycONz7BeVK
	hlHlnnSwcVrgBwXNhgKfV2P2w2cjYLSq0V1mNoaibfzjjOc2Pze1FEA3OiuqZ87I
	EMkrmeWMT+a0LkhpfjXVnErlK2gQ/QwK5LZQy+nReHlkXQSpdISfX8vo1P28TXu0
	u8YXxeVzJE8ZlAt6fOVz4S19QByzDCU3pNj3aS6xRb7k6XdkrXgPymDkiLTMo9+A
	cp9NmwjuZqB6WXRHgFS3tEEy0HiVrP68Xl3naAzRzwBCnbMRFWv7g4VRXK5Kmkrh
	PQjec+r65GuorgTFHZGTOmjMM8qe6xUYZtw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgr1my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 17:01:33 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7bf89feb9c1so1773543a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 10:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759856493; x=1760461293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cji6HN7EgrDN8yeGOTOkDfIAV0rhFg81di50RD+S8AY=;
        b=aAbeiUwhlCTNrFoNxe7ezUMCdo+b5Xe994Hq0xmwscj0IYumWKKgYQy/Cs2YK4or6x
         FnDAwjCYNdDDsfT6u+lhyMtQ2r7tYKddCh/mcRdUoQmf/NBdd4kKHqEyMinqNGmQkQ4+
         fLjCG64FSfmzwjTI4I5QqXZzCTuG05yvtIzMF7jOYiYSokVGAIEkBapJHUkSdBiHAfTZ
         gxNEznyQBVdQpFg5+yfzy5XtK0JN9DlNRUrNWAjUTKqj1knfGgRP4u12R36fEjgOfvla
         PhomZy1LkNIFjTLlLEV0rghkIaHvtfm56S2E+3fN6/6NWYLWPV0nVw5DWoSVjztkXTXE
         q/7w==
X-Forwarded-Encrypted: i=1; AJvYcCUAGKmc+O0DyGm+WrOmeVe3SB95FtmlbgUxDXKjmg6CePVS02hAp/dtYS7bmtDrs5MQ5EPUe/EyrlcqK/YX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1BlEHDM6G0fP88bX3Aw+DZSgv4V9bXISz07vAEP+LoghYKUnO
	59CfS3AlTzKC4YNXKJprwqLqiejetghHrxaqPLmvLi/CcnoBl2xfBTzMPF6FXrgwIkUE+8f9FOA
	wVX4h4azl3+td91lQV1jJ02aRlHU4Yorp6K/hO96/LsGoj47Gko+b50NYz1vYwGWPYKgV
X-Gm-Gg: ASbGncsy+6KrcX471eN8cVvtcVokqn0ricZ5MaEo+yefZymri0G5okA7ItoNp+VGIO1
	e4olYrrMO/m58H7q6KnNlFcQ+c2DvNcVid09waCVJmHVMra9ukuXnHjxwZUz8I2rFAaf3pWdgSw
	LCW4th3i2aGEQgAXbdCZoC4CM04noRxFya+08EnJrIVNrCaO/rCrmnZO7RmTIl/g06psIandyMA
	wZIpwRxwKXEFPAfmk7CbdzkJBa2YwHpt1AxWvFjZD7FfuLyXpcrAPUtgSU5mUY1L5qeMIiHiWVm
	rUha3GGl2bBo2KoTQJLANZ55FnKU46RWJeKqNJs1n7l33dFPmWv3hFXfdfYT7CZQrw1Bpzfc0uU
	aTWvR9BZNnA==
X-Received: by 2002:a05:6830:6318:b0:745:bdec:cd34 with SMTP id 46e09a7af769-7c0df82412cmr293186a34.33.1759856492597;
        Tue, 07 Oct 2025 10:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGorcyX9d8wv7kD0S//E/pXvdSAztp0WOOq+WHu5UIV6PKfP77oBrcDJX4ccaojmfBZnKP1eQ==
X-Received: by 2002:a05:6830:6318:b0:745:bdec:cd34 with SMTP id 46e09a7af769-7c0df82412cmr293113a34.33.1759856491850;
        Tue, 07 Oct 2025 10:01:31 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3aa9f1sm12672017a12.8.2025.10.07.10.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 10:01:30 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Fix incorrect error return path
Date: Tue,  7 Oct 2025 19:01:30 +0200
Message-ID: <20251007170130.445878-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX1fwJyH9K20jI
 KLxqChdH+ADgmtT7P5fjvJ/yqoUAhg82WFvjw2axRJMxYXPcbDY2ZMRTqCpytJWcmxzoC9Ti5DV
 s8OdYKKHOC1HFwhhDVZ5VWhby14dhS57Ez2O/WKro0zFJvIhhQV1cmC11yMWsVuOAds1hNvTNqz
 xiOLZ6sYKg/b3bZ/NqNcKedA1HwjHVnziJCcXaSxfZ1Anri0cSPK8mFLFkj5Do5muzrkycOVK0K
 eFdkx7MxH/dStIL5zxyJwmAgGFCn8zDTd2NrNbzpdQ7kXmvPQTgrMUnoJ+DQTWatdkqy9Eq/Zgi
 Zq1pLg120uIB2huUavF03gCbyQKrG6CBorev2LdQZmyvSqv9Eg8qVRg0uUJlgyRYS7v6B6/zm5G
 ya+OdU+AuedSgr9Klo/6Ni29JrGfYg==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e5476d cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=eRD9WA4UfUJqHvbNdDoA:9
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: pDcOP3IDqCSNHkqI7Wza8aOCQAImPjHS
X-Proofpoint-ORIG-GUID: pDcOP3IDqCSNHkqI7Wza8aOCQAImPjHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>

Found via code inspection that when encode_message() fails in the middle
of processing, instead of returning the actual error code, it always
returns -EINVAL. This is because the entire message length has not been
processed, and the error code is set to -EINVAL.
Instead, take the 'out' path on failure to return the actual error code.

Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index d8bdab69f800..b71aa2894001 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -810,7 +810,7 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 		}
 
 		if (ret)
-			break;
+			goto out;
 	}
 
 	if (user_len != user_msg->len)
-- 
2.43.0


