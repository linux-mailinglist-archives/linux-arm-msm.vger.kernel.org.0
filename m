Return-Path: <linux-arm-msm+bounces-76236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B74BC20C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D0A03B87FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7BB2D8DD6;
	Tue,  7 Oct 2025 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCf3OOsa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96451FDE09
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759853514; cv=none; b=ozYG7k46oBnB6cr94O72tmMOIhuRe2szcedhSMXsxoLcjRwkG8NWq2STolK6eoSDljXMUj+S2gZvZ4U+Q/FLBMauNSfgsU980yo1yHTk1RXXveV0bjIvWCRVrBlNcyjNf3+CH+KW7WWUUMuIuIVN22ZDCq9jANiqT7i4QxZqAVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759853514; c=relaxed/simple;
	bh=J86rN365NFIRxBBA2xT3/NyqTVgS5ULhuMt8Kaz2AJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z7L41QfWMXn/0H0UeAl1lqlAdJw0/crprZcYpEVrZLVq9I4ieE2tOfq6iNJibGfvh8/kdWCr1YXcNmqknYUHXkFMNduyIbdkzEDGpnX5Hy8b8h5tPzN9D0yl8a3CU7gMV+DBFvhlpJO97FiHpTvH8psM1Rpne8X2OthkUZD09iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCf3OOsa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETCsj006810
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D+Ak4gwFqAVs77B8frtei1K3dA7jAuRqHZi
	zyd63ZVE=; b=lCf3OOsaE2Y2HIgebXZ1kyX0VFqvAziM4CxVbAA9dX4Cgb9R3b9
	wJOtGrQj9GGJiWYEhsbDehpMxXsxUq+0PZFgRd86tsWE/F7tFgwMC3EaPh87iYms
	WljItPflwG1/Qq8T8S5Jb4OCPpThP5n7GGgYicdWEfpxUzJUKmw6BJdesXY/fWOl
	NsTABBB2LRLMmcOBGAbxAAxRtNDGXfutq6sKWou7fSDDHmJlfm3fJ3XkpuDxRlA3
	HJaJuFxW1hQA76bHIeFZsmHXnEWAZgXQ235Eo+eaHONcHRm6KBtjU3cEeDIGYOyc
	mrLcQGLQLy/AJ6HPBfFW8xK5HJeYPEB/gsw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1qshp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:11:51 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-89d8d4f918bso1784295241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759853510; x=1760458310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+Ak4gwFqAVs77B8frtei1K3dA7jAuRqHZizyd63ZVE=;
        b=mlYjhEOho7SPmZL4JYbQoAgApgizX71w9OZb+V5QJt10urxKz0bzoyb4IcHCBTI5fa
         R0eOJxwD9JAmMfAYdVQmjSPYKc7w2cD2HHJ6ITeKBweJ7RL61c7GpqPHompg1gWoA5Kt
         mwgu5FE8GdSoPTqX4AY1HM8u7zhWZBB9Zk+jTByOIrC5FM6P2Uolne+RtSeApH2Mqmiy
         FZ80C2ymNItocR9lM8BPKfvnPDItsJ2xhoojOjZyC4L79F+hD3q2TPUBRWkosaStBJCX
         PuhxqDtWiiEJrWCbRnowRs6k+OT1HAGOvRCQTCA9Bjfl5IJ1E6Lghf5n2IU2ciRDCXfA
         oV9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0tmn/DNQUjx7oSCsQ3UbN44suK8Lb3yVa9x7KIRcKX/3wOUESkIgOot94eeRtNX8vluEzHjRYpz22lkiz@vger.kernel.org
X-Gm-Message-State: AOJu0YyGhCtwMzVYKxNaEOm4SogY7RqWYzemA/I/dkhbJRwGM0exLDnI
	baSQT9gpcYA/eS1vN7l2rQZhElYNii7WUdO5HxrtrhnyreBH97adsIZvDzJ+dE4mklI9tBl3rAg
	My/IdV8HXin9krLD77pEdBBKnLmeeIrQfmeyjaAgIwMdvRv2vxWc+6V8WAe5JQ4T8KKmw
X-Gm-Gg: ASbGncvsa9LSQbJbu4XZo28QuenAOtOY+YXj82jnh9gdEhEsclUCXF2vP0iIyJkSyrB
	RkKL9MTlsUOTqGyGgEUU3t3GtmVuQ5BEzTP6d1a0d85Mb43trgDaHUEaVC0ObCHFv3e0lVGaBnG
	gd981c8vEl6hRcRUTRh8xakuW1NdTcNcO57dhDtckbZegqJ/SzwH1+Y8Hv7pSv9j7914rNyTgKx
	TWU4zjyHRGUuUzvvcTD3sMNKKCqJsvOawgVKbRNy8SVom59dvbYYFAN4rkJBme163O3FJB2LNw5
	4KpmbzXV69yMhUELkMLnqlJLjyUx+TQDqUXp/h3LozmBFmsgmZAnkA+bgH59eMqgNFk+R5eeB/M
	0PF5e04OxFQ==
X-Received: by 2002:a05:6122:1d11:b0:54a:8690:71a7 with SMTP id 71dfb90a1353d-554b8c5298amr19662e0c.9.1759853510417;
        Tue, 07 Oct 2025 09:11:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH758MjnEekfWoNbj5c0dYpqeOPnZYknAlmmCW5+WHLoPONkdGMestmm1pOExyAyyl+83B/5w==
X-Received: by 2002:a05:6122:1d11:b0:54a:8690:71a7 with SMTP id 71dfb90a1353d-554b8c5298amr19575e0c.9.1759853509881;
        Tue, 07 Oct 2025 09:11:49 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637881000e8sm12820638a12.32.2025.10.07.09.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:11:49 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Remove redundant retry_count = 0 statement
Date: Tue,  7 Oct 2025 18:11:48 +0200
Message-ID: <20251007161148.422744-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0c4ZtdT8l4xvDhKLn5z-vD881HgxPM8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfXytsAURoDNIK6
 fxqlxZ+hiClZTTTqqzzH8OjA6XbmYCetYbk5m1EqzS5OZKLI/nXLF1rDSyUE3e7g62KrYYofl2n
 w8cZbVt+XcoQPU52F+YfvFdcRXhbEfZISiVCcCaxSlbXMqs7H3ejrZRWKFUwB+Yge71lh0KfwAO
 oAVn5AYnCMGN1W0sT2Qk0F6sUarU5f/3r+580vAZ1hIlXafBtyiFjZrj3RBG5hHa6DLrtuPwn5o
 J1aowbl0KSn//YHV0zm5WPj3LEJ6KkcbD9tVz2VbKY6nDa0xBktmAh07f9WXZ5814PFPbuKYjTA
 0lBO4JzjOnUFkfXycBcnqngmmjlxFeUkQFrdbkwZmoYbflS16SDvroWNaB0RO1RPMYMRJ+GFJnP
 75rp9fqGnwSLQHBh/84qeZTuuPkCjA==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e53bc7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iJyH9J4HpORdeUluUeMA:9
 a=o1xkdb1NAhiiM49bd1HK:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0c4ZtdT8l4xvDhKLn5z-vD881HgxPM8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

From: Youssef Samir <quic_yabdulra@quicinc.com>

If msg_xfer() is called and the channel ring does not have enough room
to accommodate the whole message, the function sleeps and tries again.
It uses retry_count to keep track of the number of retrials done. This
variable is not used after the space check succeeds. So, remove the
retry_count = 0 statement used later in the function.

Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_control.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index d8bdab69f800..5aa49e0e1869 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -1079,7 +1079,6 @@ static void *msg_xfer(struct qaic_device *qdev, struct wrapper_list *wrappers, u
 
 	list_for_each_entry(w, &wrappers->list, list) {
 		kref_get(&w->ref_count);
-		retry_count = 0;
 		ret = mhi_queue_buf(qdev->cntl_ch, DMA_TO_DEVICE, &w->msg, w->len,
 				    list_is_last(&w->list, &wrappers->list) ? MHI_EOT : MHI_CHAIN);
 		if (ret) {
-- 
2.43.0


