Return-Path: <linux-arm-msm+bounces-64727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CE4B033CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 02:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88BA51893E14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 00:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C75F19047F;
	Mon, 14 Jul 2025 00:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOO7aGet"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23251662E7
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 00:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752454223; cv=none; b=h8Wu82rrrcDWhexnaZoX1PCO2vHKG08OE+P9Hc44/JxZaqSvwC1M2OBFa3PGhTstZXsgHyqA60UVYUAcj4gMxuruj6gI/NRWo07Wzj5OI1hVKjH7KqngoqwHNKMN7uVNeo/1UpM6zoXJaP/5x0knjFTfP0kG+2/fT2CngNOgvMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752454223; c=relaxed/simple;
	bh=6ti6WK3uD8rSgx1+MJL0OTBiXFAh+a7/YuzQpoRdCak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGH5qwPc6k7l9e0mIh0o4U+EE52j8g/Rc4ZAx7eAEsbdKDrwaPMp5DeP+hdLlzG3ZfUd47SgJw1H2A64cTRNl7DlNW4mkd3qVqLBGI1cEthzPbJIrVY2BKqxi1e+TinwyRf8xvHg6Kp6+gZx/gPNeno6pA0rg2ufeXlYnH2clWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOO7aGet; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DN3ZJV003940
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 00:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRajMmtFgaOC/UV0OjMPo2r2V0kfVealm1KPcyRc9Q0=; b=kOO7aGetcaOOn6EB
	Dd7pX87VNVIXtpo/51n/LvG/uFmmmpkLbdVj7S/Y9a9ZhTOK4ld2Bjnjrzl6IUzq
	GmCpxnf/jviR9foVmIJj2CtNvPOOiyv5I36XiuGm5UuuwNghtWV/3KXpP+2bL4I8
	9nMzl2y+YLlDGgywqnKV+fkahjtIaZFOEt5tE8KTNMXuR35hlsBSYQ5t/yo04DrM
	IO7f6N8xUHnQZwZNzJ0ENlYTVkvLYObRtZuZ81+ifVBVv8G145g05Sy6wgiMBU2A
	5KkPqJx7znQLXJUtYZkC+7yKhEB8Nve9jrd704GrpVTfECzhUI1WfjdrDR8ucZpj
	o0+8qQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufuejvxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 00:50:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3642ab4429so2927173a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 17:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752454220; x=1753059020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRajMmtFgaOC/UV0OjMPo2r2V0kfVealm1KPcyRc9Q0=;
        b=DJ7Sn/JXLwgAptm/wsMn66K6wMZvnsxC2/zSsmOyf5toh7jY8znJdA9TYdFybIN/jZ
         wG7JMt/epwDdoCNqoIKRhMoKC2/gTDSSqcPmG2yKM2SYXHnbkr1dDl3XeyWN19a/FCVK
         FxjRAgBQEyd4L2T0zzjmu+h59php20WMmf1kfjahxRBzDXM6jScxB/+eZO5GI4kBRDvF
         iODXEa1fkV8OyMlTnSrCmIWzY2HymxDK+WEOBMFdk7G7i94lL3W6t8WMS0M3xqaN6Z/W
         IGWUSg9PQjfEBs8DLehM4iNoqDE6JCqTSuc8YktM/3pwOP9T01ezd9aJ1VqOpd7Mna4M
         /TTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwYI0IHQbRu4UxETsP8EZJpSKcOwan7GEuU56Sg/OyBY3Mq70YAAT2/A+L+CsRU32MMOGbyV9iWjwbaq7p@vger.kernel.org
X-Gm-Message-State: AOJu0YxHW84t84c7oq0i/dZUTKAf5GRf9fqG6eRhVAUwr66kBmtPAMAZ
	MkMAnzp54lrRjVvFjOyhddmVrV0k06MBA0ArZxvJVdwL5CVw3v+lRZVsg3BuSbUoGSzjUN5OcrY
	NREvRKkRDiL+31rtkYNr1SMZDsSwUXFqbAZINZNlJP2ha0n1eQGGB/Hs429hStVCHfJk=
X-Gm-Gg: ASbGncvLF4mkwgYPa3e2KEywFojjQA8l5u6SRVEC9w9/Cxn444FE4DkX8O7OXfWJill
	infLpO781i6ZLrOPF5yFeyqpu6XU3GZOs4p2nImpurDXjzzjkPffxA6FJhGJRv0sN8i5Ihjj6LI
	uzn2zAQM1tXRmtSJcZhE8AYf/13Jh9ajhEPO0fmSlMo/p0ypDUupXLhFfL6jm1RdmyhNdIRQ/Wj
	IwrbZYSL3xLpl56zXeR82CfWzASBe0HoV8c5UQHsqBv26E7hRlfS10y1MIwDwDJ4IecmAwM98iR
	bKd75qfmuolxuHO1dtEbu2m5MStDmLc5RelavdSxk94l3eM6YVsb3Tun49mXv6AHq0HYh9kAM+6
	Em4e+cBIp2OEU6SWFEb+xCS8=
X-Received: by 2002:a17:902:ecc5:b0:229:1619:ab58 with SMTP id d9443c01a7336-23dee0d9ac3mr181151905ad.43.1752454219746;
        Sun, 13 Jul 2025 17:50:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/mJiuun06sM2rMzoQb2znJePjSbapMiG5DW5Qq5P5rJEhFEAxnwJjdWQYDnBpyFcOi0O4OQ==
X-Received: by 2002:a17:902:ecc5:b0:229:1619:ab58 with SMTP id d9443c01a7336-23dee0d9ac3mr181151455ad.43.1752454219307;
        Sun, 13 Jul 2025 17:50:19 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:50:18 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 17:49:13 -0700
Subject: [PATCH v6 01/12] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-1-697fb7d41c36@oss.qualcomm.com>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: OSZVy0tr5PAm3txGtLkGfqWeVDOZM2r6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfXxP6Z1CrcELGs
 wvKqr8oF+gIZLY/WehEPAQbWArKzJW7BEZtU01PnNl8sLy+KJJHz83YZXQIZNB+e09gROJnj1Hz
 uxA37mE4XW8owaj/ENhy9SsGOvXAD6m9+NiGHHiGu2WEk3PM4UZiQ3DJxBtKT12OlEfrVZlCWm0
 lcqRmRoYs5mQ3F67tdtkWMLT7fmkLSnO5+xA8lUqVM/S/hIcJMqFFO2TKGWsTReV5sZ+0dGKt3j
 RSJZy36P4Q90MP/Ayd4lBn0gTUg4htYRPHgPeMxzxraYeLY0DKv1pDNXLnoreCb/EVJuy1TAJzZ
 CNO5dJM2PSOZ3iQCM1ZEBOnTZ9t/jrLT9xI4Jsed2N7dITwi5Qg7Aw1w01mWL2Fu/o/8eh84gwh
 6C/AO64EpI6wc/p+UH3lQEUNAYwZxpr9AFsClJ6GMySdFOmwIv6Zo3PT/QHciSt9ajdoXKxh
X-Proofpoint-GUID: OSZVy0tr5PAm3txGtLkGfqWeVDOZM2r6
X-Authority-Analysis: v=2.4 cv=TL9FS0la c=1 sm=1 tr=0 ts=6874544c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140002

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index acc7998758ad..133447f25065 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -889,7 +889,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1


