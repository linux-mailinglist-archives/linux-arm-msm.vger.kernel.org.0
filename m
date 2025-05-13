Return-Path: <linux-arm-msm+bounces-57657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9C5AB4A86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 06:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B1C93ACA6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 04:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE771E491B;
	Tue, 13 May 2025 04:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fyERwcWy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B170F1E32D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 04:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747110517; cv=none; b=Ro5r07sWbajDRP/Q2k3wA9zU+YohAvgn/YGGhBady+4STL0T7hCq8SyVohRweXGJN/3nCmRKFv71gMt4lkdo+bJJwschZaB93U40O1oDK2BG8Psk/VHAMSuLWD4xGvaOddzSDcR6eQqIIu4fY1jDEBlbRqTTndALg1VNkQCMBJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747110517; c=relaxed/simple;
	bh=lVZ470qAXY14EXPU6lTKjuSsb5rLHlyTi7oAECx0L/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ahbcvFyIOfLM5AhxvZ/le8mhP7fRYb+AMwmpsMI8n2ObaI761tU58+ILxAHrzYllQDeLAbrDEkxDdmYUxjDsSnIqZ6wBvCrOy84XkBkg266NmFsvcd3fsXifNJp83ft47ppSllGul239FG94zKpOWO3BTpZTqIMUPeHQcijCar0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fyERwcWy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CIW1N3007509
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 04:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0Wt0GbBUNwU
	U3CBX0BKb99qSKLR+tWyMkIzj1AQsy0Q=; b=fyERwcWyxHKMuCu8oqpW3wonN4B
	9+mQ1tI14fOldzaUEmrqzTsn2qabSdnVCBtrNDL39guRPjh1A4ITtTgUgAL+ABwP
	PgqyOhaIFsUqtGfXYti67R7U2TE6vQBxD6sG7Yio7cia/sdM1OeHggJUflYeTSWx
	1h137inJP4oTVAolZ/yI29NrKreEXO5iXeQ4r+KIbPnDrzdhwGCh4u1SS6M/u+Cs
	q1GGJxfILQMmWFjzcKDmU3GQvEEQH7SkP6JCAvJg2xzJPA0HiuhgVdzB1pcTdnmV
	yWXZPup/XU5iMQWnqocsOQiDBVF0HuW7qF9GQODGv3JK65sIjllO8OuefNQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hv5qeprf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 04:28:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2085f3bf5cso3043166a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 21:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747110513; x=1747715313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Wt0GbBUNwUU3CBX0BKb99qSKLR+tWyMkIzj1AQsy0Q=;
        b=Py9SzlZTkbHP5s9cz+zmwJobPP+/gjOVMY5VzlGMqhPCe7O+JPLovTcfa5SPrAXh3S
         B4jtNiJ+V6pUlYKG6K8gtXCqE9KM//ZzNUw3S942X8FBE+M0tchfxv7NAiC52yX8cnsb
         BCDq447MEOTFv0tO3+vj/NAk8M/GvwN9aiTcBLg4zxq7FtIjTIW5TwEmka2Exjc0JcWw
         GWygng7eVsGNlJYJYzW+WUsQHMoGBeCkJiK8P8M7lwC65TP+P/a/mcnKL02Nwi6oi8Z9
         Y28jrg4qbpkzO4VygCMVQXS+YBl6k1Kn2cfxIdD576VlvrJ7Ql/tMQVMOq1HtAhHqK0n
         mGFw==
X-Forwarded-Encrypted: i=1; AJvYcCVw9APPE6/WUd0Up8c4Pzie5ZwS2YrRyzd1DQyl0EsrVwtzZAxkrPSlv/c87ZaNTB54TKiYSSm8WipGq4gL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6LG1H9ckwCN0uG2nXjDbfDNU7ur26/arJB49SzP4nInGBNqel
	+Y7M45GedzJV55adT1hjHwKivRMdKtU6T1MepKuo69H4yOdnmuVVeA9DMPFYJUniDkO96zshYz2
	wn4VgSl1qKKjY8YGQ2NEb7waWqx5uEmRtkDZmYvcMlodtJCny6p6lew37+mkPRZ4m
X-Gm-Gg: ASbGncuILLMK+e4D8GdeLSdDEqP5ajoHLxyHJ8sQUMfchCk0kytisJSfv8bT4Isker3
	jG5F6Es49cS/hMM4t417UlZHMai/bLodDqxrmqgi49/x4bQJ4y16QHRVmDqTlyXHqkPTbPhnPLJ
	IwbD+A1x9ONTyOCv9SPSk3camQKbGhZp6jwfG4LBdNfBTsxi0XWGFjmo/uNKfbIAoJjLuf6Aq0f
	9ishY/mF+qe6VcO2KkFbHjnI/vGKG6DacwXdr7/z+9YVairLXcNYQVdgwMujJp4QXCzat3BxlXV
	aq3rVFPztG2E+22nQQiSYiJ+fdPwH/5c0yarOr1oyjNq
X-Received: by 2002:a05:6a21:648c:b0:201:8a13:f392 with SMTP id adf61e73a8af0-215abb3a036mr22831428637.20.1747110513054;
        Mon, 12 May 2025 21:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtAZDS57gaeo6+l2GKtDyxXJDhvCrMInic2QuKuXWsVSU5v5nDoqK57ZyLXWaJ0MLUYJUb+w==
X-Received: by 2002:a05:6a21:648c:b0:201:8a13:f392 with SMTP id adf61e73a8af0-215abb3a036mr22831397637.20.1747110512674;
        Mon, 12 May 2025 21:28:32 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234ad3e9f1sm5486101a12.35.2025.05.12.21.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:28:32 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: [PATCH v1 1/5] misc: fastrpc: Add NULL check to fastrpc_buf_free to prevent crash
Date: Tue, 13 May 2025 09:58:21 +0530
Message-Id: <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DqtW+H/+ c=1 sm=1 tr=0 ts=6822ca72 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y_gjuFtE12-Q3iuIhokA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: rTRT3qRSgBWrlilkDnuWN_v2TRbRA62u
X-Proofpoint-GUID: rTRT3qRSgBWrlilkDnuWN_v2TRbRA62u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzOSBTYWx0ZWRfX9fp1Awe/cba5
 m4DtQlUgGh4bg/EVi22v0TZFsd2ZOjbe8TlCnxfpylZPjbDDDVt1qygiDbQY+ExdzEUo8Y5AEwi
 oklJ5jIkqPoIa1TeVFb7vZXCpQ2/aWYUa0mf0M1BoPxapMTSN3fA5StL3MlMZzKtpKDZXvI4QvH
 UE0/hBOqawTfAOrdZk2SwGhjwZhuPiAqB9jJYOSmfPWTeYSE9xaXjRo8+yUrm+c12errkSC1MPg
 gpxhnPsHnV18u7ewPXVOPeADDSMZkWu6kzHZlJ5p2TA8+7jKyGd1uF3tgN/LCdryVITAODfhzbP
 W2iwtJlr3SZHpAZNbNfo0Jg4b7cHRsZsc8Vxr6wRQveuzP8fRSvUd32k6MY2MyYfrgzzQ7Jabnc
 0iCiZBBXu4jYTnnX8AZfkljt7Ne93+s/Vnqo5ZtDgSKsmcLYAAamEMtcqa1EYssasUJ00cU0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130039

The fastrpc_buf_free function currently does not handle the case where
the input buffer pointer (buf) is NULL. This can lead to a null pointer
dereference, causing a crash or undefined behavior when the function
attempts to access members of the buf structure. Add a NULL check to
ensure safe handling of NULL pointers and prevent potential crashes.

Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7b7a22c91fe4..ca3721365ddc 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -394,6 +394,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
+	if (!buf)
+		return;
+
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
 			  FASTRPC_PHYS(buf->phys));
 	kfree(buf);
-- 
2.34.1


