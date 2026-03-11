Return-Path: <linux-arm-msm+bounces-96787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP2BDuqysGkHmQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:10:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CB4259826
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B2E5308ADC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 00:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC29A27442;
	Wed, 11 Mar 2026 00:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKyfhdaH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMjPOHpH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBA61391
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 00:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773187815; cv=none; b=qRaPR+RWohPOgW861wBipLmd0wfhDk5Ci/QU/FAM1kBaGuNwPxS+RoxzpGQSnbChPQK6d/tH9uEoFMgQNQJeeOfsSd3CxcGVieSobkv6fJOPwAQh9gJN7NmZL8jLwRinfx2IIUYhpcrUZL0fdUNeUKci84RgKS3+Tp6+4kpdgfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773187815; c=relaxed/simple;
	bh=EvX5v465GnIMYALqC6MsZaAWBg+U6I4jD2QHThoS4r4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lS2wkHXydaA0tp7ueDogGM7LXnAxsosaLzGLogifnTrrWgYSenmLGtdosFTTDn5DEXtpdW/3cJQ9Zxm5op10FcsV351e3npEzkb3zI7WPDLj7hYzp+7RBPWEYmaS4qFBTgOc/yWUt6DrDiMq259/HfCQsmSG4Njo2OGStuc0AwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKyfhdaH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMjPOHpH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIuWWT3417078
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 00:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QQwR6NRb0KUHDm9xkJblhh
	3/27LpDSPzKH6SjqLzUp0=; b=BKyfhdaHLEUu8N1q6IkYg8qGt9lgGYtrJzu7p2
	TvL2bl85Y44DtqMeZ+lAlpnwsw6eOWx4n6wcbeKBYz8ePiR8D6PqgguyeOcePBjG
	Vrx5TIG5fyZcK9+jvt93EQ0/1kK9mjpCvJslTK0FQ6ykUUxmRFJoKTemAwx4zmjr
	GxZxPEyXgrjdrQ3Zkcftkpg4X7hGIx55eUvWPaz2mkkpodGPqwecCV6N2qe9TTS1
	vAhVA4at3Jjbbp28cPyGfUq5+Egr/VnSkd+BOuSX+lKDK5o/17nDoxm4j6TlG045
	iIwzvpCVb8NVzCNWq5d8PvG4fM0qJuqFwklbihBtYE0O/IGQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2apfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 00:10:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd77e5e187so2077899185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 17:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773187812; x=1773792612; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QQwR6NRb0KUHDm9xkJblhh3/27LpDSPzKH6SjqLzUp0=;
        b=OMjPOHpHNEFvBWJd8atmE58/s0MI6qaXVHXpfmXivCKXcVy0TqzmwOBwNUHAeJQFa0
         h6WIEmnV6BPzii7Zopi/NyBLpQ3L4uZzGO7k7hzMZ+SxON3UldtRniYFUgBncUFBua4b
         oF5vHYx67nM7GojVfLyMRYlQdadUEzWBQgwk8IqeJm4enpcrFqS5ZhJqSNnW9zsUM87T
         23gYDm7SEeWBWQv7JBAe5rOGD9QSuzQpWqCpsNB0QwBLsBGWSJJPFYCHxxkJ4fkNCX8O
         /hDIoMoV97RljMO2D3j7LghBO9Efmdhpem+i/VOQi00w+Ln61JQ1LijivH0ozafgKhSm
         UDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773187812; x=1773792612;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQwR6NRb0KUHDm9xkJblhh3/27LpDSPzKH6SjqLzUp0=;
        b=Jb9jj/1967lP7+FDYar/ohinvvweW73TPONCEABmBAFdmV7E5YW38cNf53ZTcjHPue
         fr/QvPOD7QaprN7JR1G3sMFOYBbMaUJjStK5mCm6qQU5fbvEsjMxd8AKB3OQYe2FKby/
         7E7nqd5Vv6L4+VJwvU173gnbr1XuIyOQqA5t1WKrZYTzh9OE4wszFIABg1aMAdptkHMG
         GQPE5OMA/Ui8AGlX8g/73gOqYeyqZ5v7EQTrhfNnRsvUoW+YBqvM4nswSwfj128TO/Kv
         GtZkah9bws8wina1K412pi/CyYqms03V7GksPXYW3N/y9iyR9cN+2Tmj98BSh/VA33m2
         kjXg==
X-Forwarded-Encrypted: i=1; AJvYcCVPLnZIm4pi6vlLSlNFDVWOHCOJFUSz5PCAFHJsITQ7epEDaT4IKl1mQNaGEKg8RZyUuJOn0BSfHL4AJUH/@vger.kernel.org
X-Gm-Message-State: AOJu0YytvACQ3V7eDa6x9AdNjMsRjTyA1TnqfCrGMLM++tF7Ffgj9jhr
	bgGolPcnzzQb6+MU0Roh6rtl6zu4kXmA73uOiUEWNBi2Y9UMOVw6WHkKFUWdZoXo9z27PHcpLNr
	a5mZ+bpFEcLB/K2FAn+Akh+sGWT7O1awQ+Ihb5yQwxG/PDniCLd09UED/f6plGsVO3LU7
X-Gm-Gg: ATEYQzw/wW8n6oo4TDGcKf+WE/cmsI2Y3z2hMcEh3S0BPQILuZiyxa3k8EKF/Ibz163
	uNB2ipg8oJ+RzTR1f75L3VoJ3VeLAJOb5YV+yl/Loj0ZZjblsWCfCqdWjxKd9GfZTKHmYatYySP
	3bKaCKlrfgDzX/LR7Hke+sqQ+9yYh+l9EJyCq1Q7cWELSKewnDtzYkL7A3eJuNrkNSL4kQgW/0t
	olreXkh2SXrxShOzgrK8JLyqagW+tCYmFQ2XZn/lo96CVd4CevPbugOd3HEpejRUWoA/z7WUKCt
	yGKgC9a0Brujwo2oJuMGx0glNUzWa0sk4VE846bXNt5iRhbB6NjbGeaPcpE+k2R3EwtK4xfCl3v
	i3eWkTq+J9DNndZeO+m7EnbIfqIeT1j/5oEEj1KlUuXh/Zdy6jNz6Pux5ralHHpI0SL55ujejsp
	gsjPskuWoFj/GGckwK3/+rb8kiYUEd/JhXBUE=
X-Received: by 2002:a05:620a:4153:b0:8ca:305b:748e with SMTP id af79cd13be357-8cda1a5595fmr98957985a.57.1773187811870;
        Tue, 10 Mar 2026 17:10:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:8ca:305b:748e with SMTP id af79cd13be357-8cda1a5595fmr98954485a.57.1773187811365;
        Tue, 10 Mar 2026 17:10:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e2ecsm107786e87.25.2026.03.10.17.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:10:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 02:10:04 +0200
Subject: [PATCH] media: iris: drop struct iris_fmt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-iris-remote-fmts-v1-1-de0044453b68@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANyysGkC/x3MTQ5AQAxA4atMutZkfkJwFbEYFF0w0opIxN1NL
 L/Few8oCZNCax4Qulg57RmuMDCucV8IecoGb31lg3PIwopCWzoJ5+1ULEMI1eiHuokWcnYIzXz
 /y65/3w/buTqcYgAAAA==
X-Change-ID: 20260311-iris-remote-fmts-53336c2b89a0
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15933;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EvX5v465GnIMYALqC6MsZaAWBg+U6I4jD2QHThoS4r4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsLLhjz5P1aB+8StCBOOiVXkOQtV7Vd5wFijoi
 J9PlzH/QzmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabCy4QAKCRCLPIo+Aiko
 1SuOB/9FPgB6bqv3zu29c9KaauiN7P9a0Ceeon2Bssrj/OOa5OnfmbcnxBvO3VaZ2vWqx3XN5SK
 w5abZclk9rdyOiA8NWaJdBk1ijeG1GTkymnKMnM2yFsErPp+uIlv4rJcZLuJpyeQTDO2o8+eZlS
 mBY3Xx/GxOVSz9+Z6p6Mq7ypyKwSQOqHGy9HwekycRL3xAM8pi6oVKT46+0iR0CEf+XaRU7ryGn
 7lS0sAT9/PYU0XrZrrkwcOcNz0N+eXdAKtllu4hz0q9lbziDazPVPGIcXQxo7D/eAngwGqoyP+P
 2Lf2q972f7BDTUuLdtxP/ysteAjmf9qpqfqnOe/RndA6o2Kc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b0b2e4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=P2JkpESjKQypXLoEBXAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: _nZlbasQQVcykkkcd9T_kt_EFjH0nM-l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAwMCBTYWx0ZWRfXzNgU9CFBXv1d
 fzlcmHXziWNWc0xwvbmjjBjmbZioVE066IKQnLYtRO97bbLg+NNDgH84Tzvqc5nQLk8e0VYIZe0
 Oxr6YY7bW8pyN8BAV/BAUG6yGKusql9+W1xf7TqrvDl2hsw7guCkBW+1mV71/sTsoVM7ARr58Fy
 qFVsBuFlSLP/7iX4wG105i7lHDIT2+xv2FHOCavGE7GNgXI013GfKBztrWNDJv5lCWISNsz2aSO
 D3QPA6XMAOqrfDfDXj7b8rmzkgnqKqvZ4h1CkUXGzl0mX4082IGoscMqMJUnd88JtI4AjrHW7WM
 nHfKUWPyBgS0/luPFimOl5MNODukPvRmQDhMq2xaizlaqc3aSQSIsb8m4SePRBQY8RrJ0tW91Oo
 fiJaLtRT7NbSKf80OzFvVnj89EtBTzQUAiE/adTeQPSwUj99iB6klVYwAbIel5be1WKfvnniuFU
 7z6+eccn0ILS6Ayijhg==
X-Proofpoint-GUID: _nZlbasQQVcykkkcd9T_kt_EFjH0nM-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110000
X-Rspamd-Queue-Id: 88CB4259826
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96787-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The struct iris_fmt unites pixfmt with the plane type, however the type
from the struct is not actually used. Drop the struct completely and use
u32 pixfmt in all the callsites.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_instance.h   |  5 --
 .../platform/qcom/iris/iris_platform_common.h      |  2 +-
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 17 +---
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 22 ++---
 drivers/media/platform/qcom/iris/iris_vdec.c       | 78 ++++++++----------
 drivers/media/platform/qcom/iris/iris_venc.c       | 96 +++++++++-------------
 6 files changed, 80 insertions(+), 140 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..0eb256b0e82e 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -27,11 +27,6 @@ enum iris_fmt_type_cap {
 	IRIS_FMT_QC08C,
 };
 
-struct iris_fmt {
-	u32 pixfmt;
-	u32 type;
-};
-
 /**
  * struct iris_inst - holds per video instance parameters
  *
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..737ca4b1fe5c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -237,7 +237,7 @@ struct iris_platform_data {
 	u64 dma_mask;
 	const char *fwname;
 	u32 pas_id;
-	struct iris_fmt *inst_iris_fmts;
+	const u32 *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
 	const struct platform_inst_fw_cap *inst_fw_caps_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index aa71f7f53ee3..c1e91e18d07f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -20,19 +20,10 @@
 #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
 #define BITRATE_STEP		100
 
-static struct iris_fmt platform_fmts_sm8250_dec[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static u32 platform_fmts_sm8250_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
 };
 
 static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6..cd2725d3ff16 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -19,23 +19,11 @@
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
 
-static struct iris_fmt platform_fmts_sm8550_dec[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_AV1] = {
-		.pixfmt = V4L2_PIX_FMT_AV1,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static const u32 platform_fmts_sm8550_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
 };
 
 static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..2d3e2d72f221 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -67,23 +67,16 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
-static const struct iris_fmt iris_vdec_formats_cap[] = {
-	[IRIS_FMT_NV12] = {
-		.pixfmt = V4L2_PIX_FMT_NV12,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
-	[IRIS_FMT_QC08C] = {
-		.pixfmt = V4L2_PIX_FMT_QC08C,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
+static const u32 iris_vdec_formats_cap[] = {
+	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
+	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
 };
 
-static const struct iris_fmt *
-find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
+static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
-	unsigned int i;
+	unsigned int size, i;
+	const u32 *fmt;
+
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = inst->core->iris_platform_data->inst_iris_fmts;
@@ -94,25 +87,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
 		break;
 	default:
-		return NULL;
+		return false;
 	}
 
 	for (i = 0; i < size; i++) {
-		if (fmt[i].pixfmt == pixfmt)
-			break;
+		if (fmt[i] == pixfmt)
+			return true;
 	}
 
-	if (i == size || fmt[i].type != type)
-		return NULL;
-
-	return &fmt[i];
+	return false;
 }
 
-static const struct iris_fmt *
-find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
+static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
+	const u32 *fmt;
+	unsigned int size;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -124,18 +113,18 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
 		break;
 	default:
-		return NULL;
+		return 0;
 	}
 
-	if (index >= size || fmt[index].type != type)
-		return NULL;
+	if (index >= size)
+		return 0;
 
-	return &fmt[index];
+	return fmt[index];
 }
 
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 {
-	const struct iris_fmt *fmt;
+	u32 fmt;
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -143,14 +132,14 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = find_format_by_index(inst, f->index, f->type);
 		if (!fmt)
 			return -EINVAL;
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		break;
 	default:
 		return -EINVAL;
@@ -163,15 +152,15 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
-	const struct iris_fmt *fmt;
 	struct v4l2_format *f_inst;
 	struct vb2_queue *src_q;
+	bool supported;
 
 	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
-	fmt = find_format(inst, pixmp->pixelformat, f->type);
+	supported = check_format(inst, pixmp->pixelformat, f->type);
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_src;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -179,7 +168,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_dst;
 			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
@@ -228,7 +217,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+		if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 			return -EINVAL;
 
 		fmt = inst->fmt_src;
@@ -266,7 +255,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		inst->crop.height = f->fmt.pix_mp.height;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+		if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 			return -EINVAL;
 
 		fmt = inst->fmt_dst;
@@ -295,16 +284,13 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat)
 {
-	const struct iris_fmt *fmt = NULL;
+	bool supported;
 
-	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-	if (!fmt) {
-		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-		if (!fmt)
-			return -EINVAL;
-	}
+	supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (!supported)
+		supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 
-	return 0;
+	return supported ? 0 : -EINVAL;
 }
 
 int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub)
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index aa27b22704eb..0cba49df512d 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -85,34 +85,21 @@ void iris_venc_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
-static const struct iris_fmt iris_venc_formats_cap[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
+static const u32 iris_venc_formats_cap[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
 };
 
-static const struct iris_fmt iris_venc_formats_out[] = {
-	[IRIS_FMT_NV12] = {
-		.pixfmt = V4L2_PIX_FMT_NV12,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_QC08C] = {
-		.pixfmt = V4L2_PIX_FMT_QC08C,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static const u32 iris_venc_formats_out[] = {
+	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
+	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
 };
 
-static const struct iris_fmt *
-find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
+static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
-	unsigned int i;
+	unsigned int size, i;
+	const u32 *fmt;
+
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
@@ -123,25 +110,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = ARRAY_SIZE(iris_venc_formats_cap);
 		break;
 	default:
-		return NULL;
+		return false;
 	}
 
 	for (i = 0; i < size; i++) {
-		if (fmt[i].pixfmt == pixfmt)
-			break;
+		if (fmt[i] == pixfmt)
+			return true;
 	}
 
-	if (i == size || fmt[i].type != type)
-		return NULL;
-
-	return &fmt[i];
+	return false;
 }
 
-static const struct iris_fmt *
-find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
+static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
+	unsigned int size;
+	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -153,18 +136,18 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = ARRAY_SIZE(iris_venc_formats_cap);
 		break;
 	default:
-		return NULL;
+		return 0;
 	}
 
-	if (index >= size || fmt[index].type != type)
-		return NULL;
+	if (index >= size)
+		return 0;
 
-	return &fmt[index];
+	return fmt[index];
 }
 
 int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 {
-	const struct iris_fmt *fmt;
+	u32 fmt;
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -172,14 +155,14 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = find_format_by_index(inst, f->index, f->type);
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL;
 		break;
 	default:
@@ -192,14 +175,14 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
-	const struct iris_fmt *fmt;
 	struct v4l2_format *f_inst;
+	bool supported;
 
 	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
-	fmt = find_format(inst, pixmp->pixelformat, f->type);
+	supported = check_format(inst, pixmp->pixelformat, f->type);
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_src;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -207,7 +190,7 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_dst;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -228,17 +211,17 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
 {
-	const struct iris_fmt *venc_fmt;
 	struct v4l2_format *fmt;
 	u32 codec_align;
+	bool supported;
 
 	iris_venc_try_fmt(inst, f);
 
-	venc_fmt = find_format(inst, f->fmt.pix_mp.pixelformat, f->type);
-	if (!venc_fmt)
+	supported = check_format(inst, f->fmt.pix_mp.pixelformat, f->type);
+	if (!supported)
 		return -EINVAL;
 
-	codec_align = venc_fmt->pixfmt == V4L2_PIX_FMT_HEVC ? 32 : 16;
+	codec_align = (f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_HEVC) ? 32 : 16;
 
 	fmt = inst->fmt_dst;
 	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
@@ -281,7 +264,7 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 
 	iris_venc_try_fmt(inst, f);
 
-	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+	if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 		return -EINVAL;
 
 	fmt = inst->fmt_src;
@@ -350,16 +333,13 @@ int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat)
 {
-	const struct iris_fmt *fmt = NULL;
+	bool supported;
 
-	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	if (!fmt) {
-		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-		if (!fmt)
-			return -EINVAL;
-	}
+	supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (!supported)
+		supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 
-	return 0;
+	return supported ? 0 : -EINVAL;
 }
 
 int iris_venc_subscribe_event(struct iris_inst *inst,

---
base-commit: 69f994912b677367e59934a2c34f365cf42d517f
change-id: 20260311-iris-remote-fmts-53336c2b89a0

Best regards,
-- 
With best wishes
Dmitry


