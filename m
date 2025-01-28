Return-Path: <linux-arm-msm+bounces-46336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD52A205A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 09:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AF6718861AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 08:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1B619309C;
	Tue, 28 Jan 2025 08:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1g/3MVN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1EB8462
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738051711; cv=none; b=TbwvwDuWRgJg8q7PPU70Em+045pFo7L8pQR47mTfsb+jAMEFzqgjXxAD2IDtsinGvst8j9UE7lcLAa2W3sM33JDvTNsFfaYfWNl2pHD6y+WtKZ4cXG4OG+80D0dqzHttDlQ9a3BXiPntYB6sdk5YAP6sS7cFTYax1jHjAHJxjBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738051711; c=relaxed/simple;
	bh=oyYr/r5Iz3u1twcpRKCYKbUiCxUwOeH1gGu/wCqwVLA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FlZiqJNm/iTwZ+3UN0/ubHgcETZnUcYrNda9xkg1OE2H6fZZcTYns/dJ23ui3G53TOEmCuNm88LO9HocI7nktH6dFwNsfFCucZd3/rQsRtIrrMcV0ZTrSRk/0aIJNZReDHrbWpMhdDctDi9GCjbZDGZO+TeS6/hqlMubsooThIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1g/3MVN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S0Djrn011333
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 08:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Yn1RennaGlUUNemJz+KdIJd/GrlS9jGL8Wb
	wndIr1JQ=; b=f1g/3MVNzyI1oaAwAnMSqzYa4LBBMFnGyZspCD1e/cfH6O9XN8U
	6aDBXgbYRuo4yiOq2VtyHOszHV3FozTsKwH3dUHfZAU+KPb5FX9jFY5ngqKa/8eE
	6wR4mj7Zr5mh5eGZZG+zfdnm1GPBKfGSYJpArGggIvGXsK+xYKnGdZmFypjuJZp5
	bOEgFvm3joWGhAcRU+wnO73t6kA6bVEwtWcxICiaGuZNsjupWR0qtJ+XtZqCKUvm
	ReONxAkudFC5PK3uAN8Agnqh7ZIbo0SQl23X0TstXg4xAbEUd0gMT12fvJ1u+W7X
	VlDCmOD+NELVk3Sz5Ynn8+VnJUSlw87QXUQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44emgtrrkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 08:08:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2166e907b5eso97591035ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 00:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738051708; x=1738656508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yn1RennaGlUUNemJz+KdIJd/GrlS9jGL8WbwndIr1JQ=;
        b=XKOKXdf2Erq43MNcJv/fwTuHlgpwIoQtcpAOgzIsfBGfMHRgUpK1M3OonY1Ntdpj2N
         ZOTekbYSWCNh113PXk69mF7JERstAUmCjN8BUuDzDELGRYhH9pH9rGfUm2XrA/HYeawc
         9EUMFk2ojsVJO30UD8DBnHodKNt2UP2V6q8WXRjeLNZSdES1zfVBXa0lcu6EuH7mgiGj
         tDUpRIRnMMY9wwtdq3ASBJwJKhsImrj9nj5r5N65CuUo4s6y7XEqEFr/fNnajZStCgE0
         t+bWPwxZeKT3truWp3oUYI9UnfodiVnvf1kyhNsBTw/hAaaY0H0rjcAaVDDdYD6RamTW
         qnmQ==
X-Gm-Message-State: AOJu0Yxu846BpbAvJ1xliwjNUY04LpLftg1X43dj944PxqlKNBwtM8cP
	elEFMC4c2NZiDJ5gd60LsZmf7pzU7q68vJ4yOMUCiexgh0RuNMaWgpjOhhVFZskZzgaISrwm5ia
	Vt/jhSoKThneqg2rEk0M6hVsL+9/yX8GBbgr1BpSsgGa7K8qJZcFP8FQERfuAcrsL
X-Gm-Gg: ASbGncuVCDLG+AKxOid5PUJiZiW6Owu4mKmAkvexX5pjMS1pV8pbYc4D+jE6puoRb9H
	X0DTSLc6nBqrNr8rrV/1+mSCc4ebxBgbOTbDKWi8flu8OJ1B87jrnW3/PnoZRUtEoxeNO8Dqqzm
	wyPe4f9W/VYeBiuD0avm0AGjB6wAjTml4eqyLhCxmuH4R2hPnymF7NJNSfTLKyG+PbQuRK1Qtq3
	Mt6TJiHxiJR67GagrLKleAyAeh2y7oiHv+VhBszvEhXLt5SrCLJ0CJuGEymCaIJuY4CYo3+KrM6
	YTM8ziQxqbT3Y8FLHHO9toxwCV6w7Tk/
X-Received: by 2002:a17:902:ef11:b0:216:3dc5:1240 with SMTP id d9443c01a7336-21c355ef44bmr624403655ad.45.1738051707571;
        Tue, 28 Jan 2025 00:08:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyGeFOf4y8BPgx322uk5QFvTB3SjMpOGerrgNEbt5g4vtt6s34i+SJ1xJmAXg1IZ8ZruW/ig==
X-Received: by 2002:a17:902:ef11:b0:216:3dc5:1240 with SMTP id d9443c01a7336-21c355ef44bmr624403395ad.45.1738051707162;
        Tue, 28 Jan 2025 00:08:27 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414edbesm75871155ad.201.2025.01.28.00.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 00:08:26 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Saranya R <quic_sarar@quicinc.com>
Subject: [PATCH] soc: qcom: pdr: Fix the potential deadlock
Date: Tue, 28 Jan 2025 13:37:51 +0530
Message-Id: <20250128080751.3718762-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zRyhkgJwFyjADx2r0BqYigPUrRNYN9Zt
X-Proofpoint-GUID: zRyhkgJwFyjADx2r0BqYigPUrRNYN9Zt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_02,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280061

When some client process A call pdr_add_lookup() to add the look up for
the service and does schedule locator work, later a process B got a new
server packet indicating locator is up and call pdr_locator_new_server()
which eventually sets pdr->locator_init_complete to true which process A
sees and takes list lock and queries domain list but it will timeout due
to deadlock as the response will queued to the same qmi->wq and it is
ordered workqueue and process B is not able to complete new server
request work due to deadlock on list lock.

       Process A                        Process B

                                     process_scheduled_works()
pdr_add_lookup()                      qmi_data_ready_work()
 process_scheduled_works()             pdr_locator_new_server()
                                         pdr->locator_init_complete=true;
   pdr_locator_work()
    mutex_lock(&pdr->list_lock);

     pdr_locate_service()                  mutex_lock(&pdr->list_lock);

      pdr_get_domain_list()
       pr_err("PDR: %s get domain list
               txn wait failed: %d\n",
               req->service_name,
               ret);

Fix it by removing the unnecessary list iteration as the list iteration
is already being done inside locator work, so avoid it here and just
call schedule_work() here.

Signed-off-by: Saranya R <quic_sarar@quicinc.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/pdr_interface.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 328b6153b2be..71be378d2e43 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -75,7 +75,6 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
 {
 	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
 					      locator_hdl);
-	struct pdr_service *pds;
 
 	mutex_lock(&pdr->lock);
 	/* Create a local client port for QMI communication */
@@ -87,12 +86,7 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
 	mutex_unlock(&pdr->lock);
 
 	/* Service pending lookup requests */
-	mutex_lock(&pdr->list_lock);
-	list_for_each_entry(pds, &pdr->lookups, node) {
-		if (pds->need_locator_lookup)
-			schedule_work(&pdr->locator_work);
-	}
-	mutex_unlock(&pdr->list_lock);
+	schedule_work(&pdr->locator_work);
 
 	return 0;
 }
-- 
2.34.1


