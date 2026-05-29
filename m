Return-Path: <linux-arm-msm+bounces-110290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHDgGOqlGWptyAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:42:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7810603CB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABF9330045AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5053E1680;
	Fri, 29 May 2026 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbDGnaUk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EnXVDASU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EBD3DDDD2
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065422; cv=none; b=Vh8ZH8od+H4pBKQ2uL/JQtsXgWYs8/42cxaERbHBBTm5I3AwA7gS+UTEbR2sJM+viHH3MLTKGbaGzVzHwutnXTIgOh9oibUGvDFyy4o/p1DX9MLPqG/KA7KK2mTwlUUE+lPAhgmBasuQMwP9exz7C+XNPHuNB1rRj+36IyWKYFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065422; c=relaxed/simple;
	bh=UAxB3FbLEll7mPh4olvchmGWKKYFPfMHb+VfDd8w3QM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXgh2H3Cx7gjiZqF78FruFR0qO0JJu9PjF0etijf7CSex8ywzWiFwqRB0Z2cF7EfX25fiOPC3FLQn0aZKAGpIA4tPTlOaUyr8dbY/8tQGfo/CLfeg4zHQ/kzF8nVGMZnmf+GDtYt9LNKcY4QbgnSoZtAT45xqcw3AS8Qb2T0nV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbDGnaUk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EnXVDASU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLCCb3656506
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qVoT8vU1JD5H6cyjWhce4nmuiIGVZhevzhHyW5tT51s=; b=hbDGnaUkvebLYk7u
	v80fv4DPtJaNcIbVfMf7t4FZpjDj2jADMPADIjbH9BtvkaJ22HBdLJput1UDJhHf
	CbC9qpKzYK2ZYYTrGekg8Pd9fEWWHhKz2ykRXS72ev+DiRyVBu94OnxYSgyvivw0
	DKvBJr9tar7couOADlGxx4mnNd3Gi21ee3sSEmRvHVSLvTjgcUKkMIC44UPN/1I3
	ncAZNeb0GyKUZWbrSjBMRvmpA9r3k8AlJ2WrGzpznmPEOCT7uG5G76F3Xl/EnaTM
	TXrSpRD6dk0JYra1NWzzkWRKoMLvCR5scHUwVehs4YWg3hQ0G2jCEXKBOfujLlFe
	c+E/pg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5vp83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:36:59 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-63302aca17aso5549518137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065418; x=1780670218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVoT8vU1JD5H6cyjWhce4nmuiIGVZhevzhHyW5tT51s=;
        b=EnXVDASUk1Ua/vFmGv/ekBbIGbMJSxeDMcjlz7Z7YnCCwQ4BumSBp7S7RV1WP9HkjW
         6kyLHvK4n51cSRdGksCBkGDmwjF7Rr0tYk9PuEYqinve/tqy3n35FUwcdbXEkssCUMSp
         iKlLa56uwcSdnaElY7OXKT3Ru9QU3MoBxL5Z4KNxd5V9ySug02VxFfcQltRKaPOmRMOw
         63R11N4YN5gRmpz1g5gMVMARlOW7e1MEriUiLs9Y+THoae6YZ8APfr0W0CgQsG4KFIei
         QQgcweMy5ytEiigZ36dMuLgEv2unqc8xDdbzr981/UT8dlnMP7xOkiB9KQWAEx0nbOCM
         ktIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065418; x=1780670218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qVoT8vU1JD5H6cyjWhce4nmuiIGVZhevzhHyW5tT51s=;
        b=pQ4JDGHKfSjDK9BUq57CRtHrZafXRkG627N560K6YquQMJ2L6M0ZWhB0Ts0srO9P+R
         Qyjx9B2rXPWO1dqEFQhEJEuoFZmofjXBbYhtdtLdNj++h4qNTTU3dZokD4eikZc2yTEB
         2uCHJM06mFhyxETg0O6i47BiC0VqLn+LiuYStTQza9CkGPE64alHjZBotsXep5uT28MH
         U8n5VP8Ns8By0GqnQyqQnDJcsGwCIuKiJd7SJg8urHNMEky5Ynh7xUYZtXuJvOdhLWGU
         2lQjbTMlGQ3eoHfxx8dFAMcmeLWmQt3Ck4NDmSmXJiFNfB1qz8MO7bDdskLVL50+RlFL
         zpjg==
X-Forwarded-Encrypted: i=1; AFNElJ/jU85acpmYCJA9uwbsih7nRy5XVQ2Eutss3+DxHlKtplO1xYlEPTrXuy8lVC+sXYN0Tbci3qRjQ/aFjfDc@vger.kernel.org
X-Gm-Message-State: AOJu0YzvRT6JduJmkE48qvWceNIYyPIdD5akoirQ5WXvunLoT7QfsHbl
	HOO/1k+lM45FbhA8dqoymU55+dTALo3q3Uc4UCmL3FbQRrZl9MogI0Uos+j181r8syPzxzj/3CR
	csffSzWWOcAg5nJCNI6MJw8dM7f++aXIz03iYb+Qw3lD9UjuS5ktxzW6eUs6Jl4xLlWSK
X-Gm-Gg: Acq92OGcV2kxRVtlSsnfMclgX5Y5O3JgG38VRelZIxCp7tCoRPDIlBj+p3+RFrq4Wf/
	p36DcdnzM+PwZ/wdumQ1miQj0AZFR8G4jZFVH65KGT1UurXVDYfh8N0TBVMY+oqMMWzcg+j15r2
	M7YSUiXZWQuSI87RTlWKdDTQqw/Yf+NA0Fst+rwVRRijBeTBdPGS2Ja2tp0LY3AwsHAStlgAfTX
	hTtnqw7HRsPXk+JUix/PoEaSOd3uv4XbXmMWVUBI60ypBAs3O9K2ox8LIu1VwcjZq4nAAh1zL3Z
	E9kFh0vigzUjoEdvGvS3NAjC7X1+sLKgGn0+hm5lPhMSNyUA6LLZzpRlQYZSv6epnTw3fdqXijy
	ghl2Me9xCa4R17d5YsBEZU/0Ss1s5WG+N1PHtjgkm0PNd1AtJnhFyRt8DnQrKgcdXKjq/UanlDC
	IF3kKehI/tCTwXxT6WGz21Pe6Q95Ay6v9eOqZ0/NcWIZBgRA==
X-Received: by 2002:a05:6102:3e05:b0:631:28c1:155c with SMTP id ada2fe7eead31-6bf2fd47168mr1410119137.7.1780065418533;
        Fri, 29 May 2026 07:36:58 -0700 (PDT)
X-Received: by 2002:a05:6102:3e05:b0:631:28c1:155c with SMTP id ada2fe7eead31-6bf2fd47168mr1410105137.7.1780065418131;
        Fri, 29 May 2026 07:36:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b068a9dsm316317e87.11.2026.05.29.07.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:36:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 May 2026 17:36:54 +0300
Subject: [PATCH v6 1/2] media: iris: Initialize HFI ops after firmware load
 in core init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-kodiak-gen2-support-v4-v6-1-9a81bfa797d9@oss.qualcomm.com>
References: <20260529-kodiak-gen2-support-v4-v6-0-9a81bfa797d9@oss.qualcomm.com>
In-Reply-To: <20260529-kodiak-gen2-support-v4-v6-0-9a81bfa797d9@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oZnKWHIxLAD7FiUYWHIMeDo3t9uClgh2ie7UGzCwNak=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqGaSGO4FuZhnlQ20+b1/ECLy6cyVfhive9Ls1Q
 CtaC8CrmluJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahmkhgAKCRCLPIo+Aiko
 1WX9B/9ZfPEaWiWlvdvlkDuSYhAeVY7HaiHJkIhYRrToEkWN3ojzK4/WNdSaR0Jdwvca6aTOUVC
 6ZM2XqHGiurdDUAGNH+wCKmH4jb2rGIy7zhOFMZFPDANtMaGW56dFponaCUsGeP/4ooKFwTvhS9
 WbfMcbDu7UEsLapOcN0g+nyxcOaTxGi9jk9VZWBcZwoCyazWMx6QROVgj08xoBfiOce2va3KF5s
 O8/UuIVmoCGr4LxS1vj1bs9gMUgy176gRDGtB37jDhmAgIyx81d+WeSoBTUS0QvHIC1hRYvSPUB
 f1Fen15ryIRnOH8zHcPaygPxbtlJSDpECIRpqUXS+6ZVhnV5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 6K6XZ6c8kPweN0qxuoYr0EuXJAsX7TRg
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a19a48b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=_zkiGRivnqQB5cGHL1IA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6K6XZ6c8kPweN0qxuoYr0EuXJAsX7TRg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX/INSIH8fu/eX
 QcqZmUgQc/U6LK8doZaK3jAjwREuK1fYpRqPuI7NtUqKWHRTyy21ecxs3FtCKRztiACTx5Kf6CL
 uGKb24wA/8DBnmgXHnx1BJhj714xpZ/smBMBjPMEEC5Bl5S+sCte11rO8560JUIP7u1XbVfT2cX
 qf1AkBgfWRDsPOI6iJUxshiBg86yb/L/cURGT9QZblZNfvdx8ls3umh1Uls5RLile73KQW5/J28
 6IJUGjJjNhEcx0C8J3atXRiMqUlWLzDYwKvHhMIqD4QZ3PuKhuK/DNtr8xNfZTdozBGLAm/mpQv
 ul8AXNzf+v/ZC4ZryyhU6r1Hb5MTndRmEOLvlU9cgwgbciH4fLPiwNAgLj1NhXIzfNgjEcqvN8B
 NntKpNRmwUk+4hy6t/vAZtcNT2UcLVITKraf8hwiZQWMOIV+oSOWZA1T7u8YvT48BtV8hZrei+8
 /jiJJ75OGQG1cfsLpfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110290-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E7810603CB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The HFI sys ops were previously initialized in probe() but, we don't
have firmware loaded at probe time. Since HFI is tightly coupled to
firmware, initialize the HFI sys ops after firmware has been successfully
loaded and booted.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c  | 2 ++
 drivers/media/platform/qcom/iris/iris_probe.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index e6141012cd3d..a1823ded46e8 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -74,6 +74,8 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	core->iris_firmware_data->init_hfi_ops(core);
+
 	ret = iris_hfi_core_init(core);
 	if (ret)
 		goto error_unload_fw;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 9f8113ec7a50..40884582de55 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -266,7 +266,6 @@ static int iris_probe(struct platform_device *pdev)
 	disable_irq_nosync(core->irq);
 
 	iris_init_ops(core);
-	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_init_resources(core);
 	if (ret)

-- 
2.47.3


