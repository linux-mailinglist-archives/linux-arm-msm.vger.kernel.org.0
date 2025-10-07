Return-Path: <linux-arm-msm+bounces-76202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB485BC15C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 14:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BDE9E4E2A7E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 12:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA1B195FE8;
	Tue,  7 Oct 2025 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSVzVfNP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5DC244685
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759839810; cv=none; b=LXFV+sfmZbTv3yKohT+2gn2cPqaxin/8leumXCnU0gH24m9+xPoMYIf+M/JvQ5Q2sXGnG02FLYhM5zt0aU25LGkBmBxfKQZphEEMuRfFIO+wV2+2dEfs+WTQpUgez+UAuLwEIwk+Zs9Q+hIRIdraeOX4E7OoC7R1z6G9TOHi58Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759839810; c=relaxed/simple;
	bh=RoA6wV4IccBjBdj61mBy0jHLKo2fSlrRR0RH8ndCFFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QR1Ub4VqCHao7PBFvR78bpn9iwupniUuq4Pif/LMYDjbSv9bAsuAb2xcqJGK6cypLlo5QCzNGW9l6BlrQJjqoUdg0wZMOFXnWseI9kXwW6DuOnvr/9rSuu6PlbCdtPdYTgNm0uOAzxIrx2HaoGL7U6mcAnflo9EkKnql4k+QNso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSVzVfNP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973h0cR023921
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 12:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aiUajtN5GWzNUWiw1YQ9LlfrYjjIOfa9LPl
	jq0wLUa4=; b=FSVzVfNPyDtjh3kpjTi2oudwPh+omZKoIF7D4eGi1iq5LNDC2jV
	pOVuNkCWTkNEoGyidm9VxWVBvAe/lIupEplIf02onITDHuED1YNPwg27shpdQICe
	OlSND058hr+mdxXyJM0zji7zfUhZw/ddMb3N/LxXqEpRjYtJYBwgSUzF/wUlSCe8
	lMWus+jWg2hqKmuOX5VAxPMN4hOWQIW5Dc+5R5tfCeb8gu3IlnBl5RsZhPJzXJSK
	5CvuoKXx6F2/2LBZ5E1e18bo4+SNtpIOabvVEeO/WVL4073bwqgSerFLeALow9Yh
	7+xJFNs3JY+5c/j60Nstb8crwrYTkf+beaA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mg6aaven-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 12:23:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d6a82099cfso160854631cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 05:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759839802; x=1760444602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aiUajtN5GWzNUWiw1YQ9LlfrYjjIOfa9LPljq0wLUa4=;
        b=BTsNQaKriyIfAIqbhh9fdk6PVPRjSwipkTawjCYUbYjqWIgEcBvxl1TbV2ZwjOn6mr
         pYHCCnU3wkJ/OV+wp46i2+kyyJ0Ka9fzn3pRr+yuSfrudSAFzOpoQp6/l04y+npb4OM5
         0dzc9PdjYQwmUnoL5gqZwOOcLXhvifqEsNaurm4tb9R5F30xbuX4HH7UK9cUTkY7aJ73
         DDmK5HSk5U9FoupL3hlQGs3pHnYoKRwIbuqovhcJ2JmlpkxAWPcrNhAmgWFNA1dwCq5e
         GzvJh79r9A5kT3owM/rP2J4I0n8Mk7NsQtx6e8scKUSp0Yg1txUQDlwcQ+eJ+DRpai/X
         PlUw==
X-Forwarded-Encrypted: i=1; AJvYcCUIRmFs5sv5p5mrvem1f/SZTROdCXEaNMnOeuv8PvRAWspSexpPmtGkoZWOOAKLduz7GQ5d0n6hU3/cGcr5@vger.kernel.org
X-Gm-Message-State: AOJu0YwMDOBAqwL17yINnpyEZ8iFz8DqNSO5PkHD4HwddJ21z+SYaOQD
	+Lalfrx88xqjfPeheabTVDB//T5k9o4fjPzb30MwJg0IfqcXYWv+NEWLKId794ACr8oWJJEnezc
	WXMYZwaRKU1HsHplO6qMeuIiTnGyMi9+92ymg2Nhob17VQXxFBvi8F22NHERQXhrequWg
X-Gm-Gg: ASbGncsQH0n6wiPDXP9dkKe57m+vR0L0TSzm68U1lhjFgMbhyO92UUV8nHDxfd9YwfS
	6a8arm8frWkRjWVCPmF0DhSc8OGHE1qop30EcDBhng22ZpCnu8BybAH19aFsWead3hwzR6XfNE3
	XHtm4rlUBYmUM6tawjf8YyOaMS78sqEDYig93iuljG/MGWgF4N9wIVB76QQkLHgHwhzps0J+8YS
	XdCgJZLxtXCZhG/paOPuaSElaoA5441KbRYZ06awVF2NYHYjvQarydC9Z3bsBoofD1MtFz2wZkX
	8vYGql8N923nBQgxq2kZqvSCO7rgZansLWeMdIHxI0iE/L1x+tfSfcrnMJcT1coZ4iNCrQtXlhD
	bCtiyQ/0PLg==
X-Received: by 2002:ac8:5885:0:b0:4b5:fa2e:380f with SMTP id d75a77b69052e-4e576a40192mr236425581cf.27.1759839802332;
        Tue, 07 Oct 2025 05:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp8uERkIS0UsyK3pgHpFGQoon2cJaUrFYaGhDOjwk06qRqCcd7nXprkJyekAiWSuRXYWBqZg==
X-Received: by 2002:ac8:5885:0:b0:4b5:fa2e:380f with SMTP id d75a77b69052e-4e576a40192mr236424921cf.27.1759839801648;
        Tue, 07 Oct 2025 05:23:21 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e77427sm1408179466b.36.2025.10.07.05.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 05:23:21 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Treat remaining == 0 as error in find_and_map_user_pages()
Date: Tue,  7 Oct 2025 14:23:20 +0200
Message-ID: <20251007122320.339654-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QtdTHFyd c=1 sm=1 tr=0 ts=68e5063b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YWuMGPkJ6SgHaI83TUEA:9
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: A9gqR9cpzZpGjYEIxS7S8bV9-Cb2HM6E
X-Proofpoint-GUID: A9gqR9cpzZpGjYEIxS7S8bV9-Cb2HM6E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfXwWk0bxVBf+bD
 R0XIP9UIApKp/Qk4hVbR6uIvPXu14yM/kb/5NEzTQVEj9cJEXjDjTqVi3HrEI3SKD9McmIF2+kU
 JlCfb6UJy1bU6iBE9TKjjp3Gh5H4SwLFBx98E+ixibrsdvvND8krl+p+4KmZN5inKNYWa4jpDvP
 8yvgAyLXEUbe4GJUV/0ec51rlBtrsnHB/qhRGxTL87bXFMriYk4NbJ7DlhdS3eSxzInJHrgiSzb
 jeEm9bDCDPy5Fhi94W7051RFm8j4bAbUuzFVBpO3dtj508hRl61bqUJamxHmDmRSSoQvi4uPBlu
 Em5RUFT4KJx9XxAncO/UwbVrrP9S35cTSf9ohUQgYzOSn6wgXXUvTvRFiJ5y2+MTBERi14mP2uA
 qd4lyCwdeoRwn523309p4YD9hhBXEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060121

From: Youssef Samir <quic_yabdulra@quicinc.com>

Currently, if find_and_map_user_pages() takes a DMA xfer request from the
user with a length field set to 0, or in a rare case, the host receives
QAIC_TRANS_DMA_XFER_CONT from the device where resources->xferred_dma_size
is equal to the requested transaction size, the function will return 0
before allocating an sgt or setting the fields of the dma_xfer struct.
In that case, encode_addr_size_pairs() will try to access the sgt which
will lead to a general protection fault.

Return an EINVAL in case the user provides a zero-sized ALP, or the device
requests continuation after all of the bytes have been transferred.

Fixes: 96d3c1cadedb ("accel/qaic: Clean up integer overflow checking in map_user_pages()")
Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index d8bdab69f800..b86a8e48e731 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -407,7 +407,7 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 		return -EINVAL;
 	remaining = in_trans->size - resources->xferred_dma_size;
 	if (remaining == 0)
-		return 0;
+		return -EINVAL;
 
 	if (check_add_overflow(xfer_start_addr, remaining, &end))
 		return -EINVAL;
-- 
2.43.0


