Return-Path: <linux-arm-msm+bounces-82522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 849C6C6F9D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 85BE92F032
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916623612E8;
	Wed, 19 Nov 2025 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLkMlwbN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D2RTuVJ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CB93590DB
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763565511; cv=none; b=OQXiAJlck09v7HRgDbr7yN3OyH5Zji2fTzRDYr6kDYqmcx1Koo0IB86kZbv9qJq163vtyFQW43os67nYCPFg7pub+bo81SBh64Q0q2MgNilrTRnhOuHPxNKX/rFzJ+DYqs79a2o+JAeIeyg57M+rBX1H1xJtpKd+CQRD8oN/bH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763565511; c=relaxed/simple;
	bh=oT/OGsLGkkaC9y1rpQ0CnW+mlxwNKO7XakWCsqK6Ll0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R8ViZeONWnD0WZbQfvjIM0HeL0/dEHqsPvz2ny5Thmd8EPBWR3Ae10O0vmFprxXzOWLw8iM9DUFLFvSNSsM5n/QUfCThjg8loBgwAbyKgajj3ie8bCY+1VIBhyVZNOanUD6VONna5qfN3O9rWgDvFIif0/7GJWISbI5pqSg0erk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLkMlwbN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D2RTuVJ+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJBEgqt839777
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QWpVCTGHK/nWhxNcrupPpc
	wrgXCNo8eFhd/F3+L/MnE=; b=kLkMlwbNLR7mpze3WOA0K3gF/S6YZgfJBqPYxi
	ddVBIKHviyHAvNRqRwDpRmcIC6D5jJm5bDjo/sSqt+8MVbA9x20qZs0xai1uT02F
	yLidNfPOkGNkppKEC4gTUY6HblA3Lnu0Ik6votSIIfAzAXuYmxFFI+nzc/FLu4NC
	TFbdjbDM4o+k8YIeK71TFHmjjqajd+d5cAV/O6c5ing1oXvO5gIj1jA2jZ3RHUAd
	4ErcnqfK9bc7JDAcXHnTUnN3UA4k++01pwJlt2MQkpjGDpvA/3jNRh40n3yIGg/H
	x4eCYML4D0MFtFludsXPMoHKrGBGIXOTXSQzTLziDx8RwlSA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6fg9wf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:18:28 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5595f2366c0so16906162e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763565507; x=1764170307; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QWpVCTGHK/nWhxNcrupPpcwrgXCNo8eFhd/F3+L/MnE=;
        b=D2RTuVJ+N6UBk6iuVZ3yBeOw7PQmrIEsG9UVXjg9wGjgMHU2liX2KWliQrq5Z7OUOa
         +nszX6HEZA8Bn5aOmc9lou/cn/zCmPivEE7dpxGVxs4YTe8DAKV0oUUoJVV66jjWN0tD
         zhFAP60hZsNCA7xeT81UHyYiLth3q/YKHzANY77l+2ZW3XejRr2WTgLKtFa0hdhohpZU
         qB+9bZ7DQqVtSULKi4muvnrkhj8szr7tI9qCi4jBNiMUGOhgKfGXqcBDhN/ru/F4t+4g
         379QdVrYENgEUmGxa0YIOpaeuGRQgUU++nkSCnCBv3VeofgwrGjhjt2XEhhj/xLYEqvj
         FD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763565507; x=1764170307;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWpVCTGHK/nWhxNcrupPpcwrgXCNo8eFhd/F3+L/MnE=;
        b=D2Q5IUigNLw8wgFi4LNPr7xHbRasFqAv0nRoLEWKqywFh+UMLZT7W1UYEucS8l+bMb
         pH34hs5AQBkRuszUAkyWGiQaT8wpu+511xvqIWVeigws1B0KCaX0/xap2kdWgV471zgn
         DJgJSomkk0wfFCn7qHL87XVYn8yJlbYQzkV41Fkt1ZgWyPdVGSZp+D3gHynp9c+RunzH
         OYqNvoiF6ixV/lROLo0Bb+72cekd+DjOUIUE7aYRKsCH5CMsv6NIS9yUzCLBtELvmS8h
         qHTAdFQCsrOtpeOUoRxETG0u4rWW+vM07JiJA0r6At1An16HUygmSjaFowTz46F2xm4m
         SwyA==
X-Forwarded-Encrypted: i=1; AJvYcCXEUNkpsFJZxauVcBm9WlMPQUBEpF71QVXEDzv8MrVBQAmxt9fGwnHJApR2j7te1JOixb5V8Zpmt8gUtgCs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp9abILH20UxMxBVs5pmloWR+TdXeqiZdZtcYvxwFkk0LIEWvA
	BivXbSd8YTC4IopVmXhJxhrS0U/tosJwMU2jPiZEv3fJAbubytqKco2VmWKlyDVhGEc/arUdLFI
	9DqOPOs8O5dko2SlKTWjH7mPQpWRZ+b9Fwg7xNgzOY0sgc+jdn7rvhXkbx6dhz7BuC2vr
X-Gm-Gg: ASbGncucOXubys5NNA5SHamWHR7X+Uu3iJXMEdquaBw7qyQCGPR3/Fsrya3SYz1KQrd
	ipeFm+6LNCW17DzczJvIjdxsMpLepLS76ENkqqF8/rZeaQ1L0nRduyh87YBSVZLXLY53kHJeNm/
	AqtiASwqjFLIYR50KME89E5rLgAkiSdjtyHdTGnAEChkr7Uk6Z/BP7P+iEaNPjtr5cE9wGQ43F5
	alrjMXPHADXUyNKvAiuqZD2Qu4craqoBwNIW3FVgTFtyZEU3JzShHTfZNkRT+8dxP6ROlX8H9TR
	kRiaUBPpTNYSqeIOZJGmZ1kSsOTquI4bjsUg52qsmwkDfwk4uMp/3dEkPlFNSTlHhbd96VmXYop
	VF+vQnSO5ZAoFSkOHRvyDd+Dv1/wLbe2Byz3FEG3suvU4Jpl41rWtLckcHvscefd69C86hdFXZT
	/+vROJm1PFFBQYGjN4jW+Q9BY=
X-Received: by 2002:a05:6122:468c:b0:559:3d91:5f2d with SMTP id 71dfb90a1353d-55b1bdd9cbemr7509410e0c.9.1763565506367;
        Wed, 19 Nov 2025 07:18:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrzSvMoZK6a91l2N+ixDVeYYxB+S4Ir+MztWmRPr7NJWvaFhCcmhL7vXHQNFOaA3VmUOH3qg==
X-Received: by 2002:a05:6122:468c:b0:559:3d91:5f2d with SMTP id 71dfb90a1353d-55b1bdd9cbemr7509177e0c.9.1763565504126;
        Wed, 19 Nov 2025 07:18:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040576csm4737494e87.88.2025.11.19.07.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:18:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 17:18:18 +0200
Subject: [PATCH] media: qcom: venus: flip the venus/iris switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALnfHWkC/x3MSwqEMBBF0a1IjS3o+GnQrYiDGCvtgyZKyh+Ie
 zc4PIN7L1KJEKU2uyjKDsUcEkyekZts+AljTKbiU9TGmIZ3CZsyIpT9HwvrgdVNPNaNLf3gvrY
 aKMVLFI/zHXf9fT9U31tXaAAAAA==
X-Change-ID: 20251119-venus-iris-flip-switch-d59a3fbc6a4b
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12279;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oT/OGsLGkkaC9y1rpQ0CnW+mlxwNKO7XakWCsqK6Ll0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpHd++59fi+BhOOfaH0grHWAph7b4EwgQEVELTR
 oGVDTnhJv6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaR3fvgAKCRCLPIo+Aiko
 1bw0CACDYGsybwDuP0q+AmUYR1ayMUY4US8fhKeKSzHCpzPaIU9pN5AfPffEpaZ1UpP1Z5zEUdc
 k6PZ+sr+yXyEcDBhncdQqEz+D8dGsrqrkz1+gmBSY3Pjw6YkgdjIP6bASFDPlxGKqPWt6PC2NBu
 rY0WzoSfjkm7VfdkJopdrfjc0uQ14l4oWcDJHJP5aa4SiJkOWQMOSGjSiEKfi80syej1Q0QrhD9
 3HB6dUipqZXjRgw2c3+9KnwNjFmdQnWrh9wEg8iQvwEc4RbiWEkOu0xl7lTqQ0WgWnxCVUe+27b
 d3bxwducr/KyDZor083Hr+Yht69AlrY+cswZN7CZXmJZNoCa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: EPmWgxgVWNkN3HJsPsFc5EWK81BZ4TGG
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=691ddfc4 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pI-9nvPbGx2-jEZ2MXwA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyMiBTYWx0ZWRfX5WbEFXBG+sCr
 EpKj3BSH5QwIyPKxklnY5eOXLZ/P3IjdhCoNXAAElWKMyvqV/ZiQcNWO+Muu3TkYc/Cj4dv1Ci9
 ze7fe8n0XQx4dfq6JTmz/qIGDrllbtf+x7bKPIDmPoqAScU1epgyPVr4XHSofgNLh6+g5eAL5zf
 1LiDLL+xfS271UdB/HS86MA8xVkPMrSPL/6qwXV8dlxmhCKUkEIrhvSi9NPnCahTMmsygVgnHHN
 8+IxHzHm9YtOxNtnS+h+J6z2BXctuB/ZXrrx0n+tei37p+UBiSQAE6KUgWBf2b8jsHJc9VQqQZM
 DqZokQbgZgXv+TVPpwk+cKCsljPpwnBamanEo2pl7fsMvPMrSsw7UfbduW++rJFQa0onOkQMOJV
 ll9trsausK6gUMmUJcvfBbcYHpbG3A==
X-Proofpoint-ORIG-GUID: EPmWgxgVWNkN3HJsPsFc5EWK81BZ4TGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190122

With the Iris and Venus driver having more or less feature parity for
"HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
switch. Use Iris by default for SM8250 and SC7280, the platforms which
are supported by both drivers, and use Venus only if Iris is not
compiled at all. Use IS_ENABLED to strip out the code and data
structures which are used by the disabled platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note: then intention is to land this in 6.20, which might let us to
start dropping those platforms from the Venus driver in 6.21+.
---
 drivers/media/platform/qcom/iris/Makefile        |  5 +----
 drivers/media/platform/qcom/iris/iris_probe.c    |  2 --
 drivers/media/platform/qcom/venus/Makefile       |  5 ++++-
 drivers/media/platform/qcom/venus/core.c         |  6 ++++++
 drivers/media/platform/qcom/venus/core.h         | 11 +++++++++++
 drivers/media/platform/qcom/venus/helpers.c      |  7 ++++++-
 drivers/media/platform/qcom/venus/hfi_helper.h   | 11 +++++++++++
 drivers/media/platform/qcom/venus/hfi_platform.c |  2 ++
 drivers/media/platform/qcom/venus/hfi_platform.h |  2 ++
 drivers/media/platform/qcom/venus/pm_helpers.c   |  3 +++
 drivers/media/platform/qcom/venus/venc.c         |  3 +--
 11 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index fad3be044e5fe783db697a592b4f09de4d42d0d2..ce360c67846b1243dd9245972672591076bfdee2 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -10,6 +10,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_gen1.o \
              iris_platform_gen2.o \
              iris_power.o \
              iris_probe.o \
@@ -25,8 +26,4 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
-ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_gen1.o
-endif
-
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 9bc9b34c2576581635fa8d87eed1965657eb3eb3..0d5f37e51558ed1207554b3a3841096d8699c755 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -356,7 +356,6 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,
 	},
-#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
 	{
 		.compatible = "qcom,sc7280-venus",
 		.data = &sc7280_data,
@@ -365,7 +364,6 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8250-venus",
 		.data = &sm8250_data,
 	},
-#endif
 	{
 		.compatible = "qcom,sm8550-iris",
 		.data = &sm8550_data,
diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
index 91ee6be10292e0c275106f090f521f268da4c50a..60a3f948adbfaa4c6c91abdbbbe050f0bd724c9c 100644
--- a/drivers/media/platform/qcom/venus/Makefile
+++ b/drivers/media/platform/qcom/venus/Makefile
@@ -5,7 +5,10 @@ venus-core-objs += core.o helpers.o firmware.o \
 		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
 		   hfi_parser.o pm_helpers.o dbgfs.o \
 		   hfi_platform.o hfi_platform_v4.o \
-		   hfi_platform_v6.o hfi_plat_bufs_v6.o \
+
+ifeq ($(CONFIG_VIDEO_QCOM_IRIS),)
+venus-core-objs += hfi_platform_v6.o hfi_plat_bufs_v6.o
+endif
 
 venus-dec-objs += vdec.o vdec_ctrls.o
 venus-enc-objs += venc.o venc_ctrls.o
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 24d2b2fd0340b55ed1aa329f49ded449dc466f14..646dae3407b4d13454eedd8e926f16e7470d5d3d 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -949,6 +949,7 @@ static const struct venus_resources sc7180_res = {
 	.enc_nodename = "video-encoder",
 };
 
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 static const struct freq_tbl sm8250_freq_table[] = {
 	{ 0, 444000000 },
 	{ 0, 366000000 },
@@ -1069,6 +1070,7 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
+#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1125,11 +1127,15 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
+#endif
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+#endif
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609ac8984ab90ba207e64750df8a9ec..c7acacaa53b880c66b11bba2cca8d625b4f8fb9d 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -54,8 +54,10 @@ enum vpu_version {
 	VPU_VERSION_AR50,
 	VPU_VERSION_AR50_LITE,
 	VPU_VERSION_IRIS1,
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	VPU_VERSION_IRIS2,
 	VPU_VERSION_IRIS2_1,
+#endif
 };
 
 struct firmware_version {
@@ -525,13 +527,22 @@ struct venus_inst {
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
 #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
 #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 #define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
+#else
+#define IS_V6(core)	(0)
+#endif
 
 #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
 #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
 #define IS_IRIS1(core)		((core)->res->vpu_version == VPU_VERSION_IRIS1)
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 #define IS_IRIS2(core)		((core)->res->vpu_version == VPU_VERSION_IRIS2)
 #define IS_IRIS2_1(core)	((core)->res->vpu_version == VPU_VERSION_IRIS2_1)
+#else
+#define IS_IRIS2(core)		(0)
+#define IS_IRIS2_1(core)	(0)
+#endif
 
 static inline bool is_lite(struct venus_core *core)
 {
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 2e4363f8223171b497e6326877d37c5075735a30..f44f382f7d8dfbe71014c0b167b686e18616ffe2 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -329,6 +329,7 @@ static const unsigned int intbuf_types_4xx[] = {
 	HFI_BUFFER_INTERNAL_PERSIST_1,
 };
 
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 static const unsigned int intbuf_types_6xx[] = {
 	HFI_BUFFER_INTERNAL_SCRATCH(HFI_VERSION_6XX),
 	HFI_BUFFER_INTERNAL_SCRATCH_1(HFI_VERSION_6XX),
@@ -336,6 +337,7 @@ static const unsigned int intbuf_types_6xx[] = {
 	HFI_BUFFER_INTERNAL_PERSIST,
 	HFI_BUFFER_INTERNAL_PERSIST_1,
 };
+#endif
 
 int venus_helper_intbufs_alloc(struct venus_inst *inst)
 {
@@ -343,10 +345,13 @@ int venus_helper_intbufs_alloc(struct venus_inst *inst)
 	size_t arr_sz, i;
 	int ret;
 
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	if (IS_V6(inst->core)) {
 		arr_sz = ARRAY_SIZE(intbuf_types_6xx);
 		intbuf = intbuf_types_6xx;
-	} else if (IS_V4(inst->core)) {
+	} else
+#endif
+	if (IS_V4(inst->core)) {
 		arr_sz = ARRAY_SIZE(intbuf_types_4xx);
 		intbuf = intbuf_types_4xx;
 	} else {
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index f44059f19505a0b33e582f8c6c0723bf7f6ce30b..6157aa79f80aa8eb3c7f33c7dc87739cec632a74 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -395,6 +395,7 @@
 #define HFI_BUFFER_OUTPUT2			0x3
 #define HFI_BUFFER_INTERNAL_PERSIST		0x4
 #define HFI_BUFFER_INTERNAL_PERSIST_1		0x5
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 #define HFI_BUFFER_INTERNAL_SCRATCH(ver)	\
 	(((ver) == HFI_VERSION_4XX ||		\
 	(ver) == HFI_VERSION_6XX) ? 0x6 : 0x1000001)
@@ -404,6 +405,14 @@
 #define HFI_BUFFER_INTERNAL_SCRATCH_2(ver)	\
 	(((ver) == HFI_VERSION_4XX ||		\
 	(ver) == HFI_VERSION_6XX) ? 0x8 : 0x1000006)
+#else
+#define HFI_BUFFER_INTERNAL_SCRATCH(ver)	\
+	((ver) == HFI_VERSION_4XX ? 0x6 : 0x1000001)
+#define HFI_BUFFER_INTERNAL_SCRATCH_1(ver)	\
+	((ver) == HFI_VERSION_4XX ? 0x7 : 0x1000005)
+#define HFI_BUFFER_INTERNAL_SCRATCH_2(ver)	\
+	((ver) == HFI_VERSION_4XX ? 0x8 : 0x1000006)
+#endif
 #define HFI_BUFFER_EXTRADATA_INPUT(ver)		\
 	(((ver) == HFI_VERSION_4XX) ? 0xc : 0x1000002)
 #define HFI_BUFFER_EXTRADATA_OUTPUT(ver)	\
@@ -560,7 +569,9 @@ enum hfi_version {
 	HFI_VERSION_1XX,
 	HFI_VERSION_3XX,
 	HFI_VERSION_4XX,
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	HFI_VERSION_6XX,
+#endif
 };
 
 struct hfi_buffer_info {
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
index cde7f93045ac4567bf4239eeb3c489b887d4ad01..fa4262a5cd284a3f123b564ff71bf460942d1790 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform.c
@@ -11,8 +11,10 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
 	switch (version) {
 	case HFI_VERSION_4XX:
 		return &hfi_plat_v4;
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	case HFI_VERSION_6XX:
 		return &hfi_plat_v6;
+#endif
 	default:
 		break;
 	}
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index 5e4f8013a6b1db4f4f83cd983ef9e83347ef4e0a..164ef5a892fbdce6c6d2833e8d2ab3b03c5193a8 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -62,7 +62,9 @@ struct hfi_platform {
 };
 
 extern const struct hfi_platform hfi_plat_v4;
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 extern const struct hfi_platform hfi_plat_v6;
+#endif
 
 const struct hfi_platform *hfi_platform_get(enum hfi_version version);
 unsigned long hfi_platform_get_codec_vpp_freq(struct venus_core *core,
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70eb72384a06aa6a215e2046abf5c2..62b2ae661a365941dfe8987f1c0733189a6d4de9 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -1188,8 +1188,11 @@ const struct venus_pm_ops *venus_pm_get(enum hfi_version version)
 	case HFI_VERSION_3XX:
 		return &pm_ops_v3;
 	case HFI_VERSION_4XX:
+		return &pm_ops_v4;
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	case HFI_VERSION_6XX:
 		return &pm_ops_v4;
+#endif
 	}
 
 	return NULL;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index b478b982a80daec54554e46f7c582a6f9b68e352..164152257bdee17b6dceef07a0df8ed2df15bd31 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -898,8 +898,7 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	if (inst->core->res->hfi_version == HFI_VERSION_4XX ||
-	    inst->core->res->hfi_version == HFI_VERSION_6XX) {
+	if (IS_V4(inst->core) || IS_V6(inst->core)) {
 		ptype = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2;
 
 		if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {

---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b

Best regards,
-- 
With best wishes
Dmitry


