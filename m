Return-Path: <linux-arm-msm+bounces-90395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CXhLWUadGnS2AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 02:03:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 297077BDC1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 02:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92A0A30210F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 01:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FC81D8E10;
	Sat, 24 Jan 2026 01:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oT3Lvl7H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaTO0MJ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7131A2389
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 01:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769216605; cv=none; b=Di9TRfts3HKrnzZwy5zWF6PN3Yc2+3HqaGjFa3NNDe+Pswi+tTzUBIIDpTSa00wrp8/BSjuGxcBFwsK1Zk80T57JL80+2+Hyvff+zT8dwhQOjzsPCdxnirypF1q/sVF+hn7snaBSe6rjTVyN/q54/qddEyEk9uacFO/FsvHh2S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769216605; c=relaxed/simple;
	bh=WWUyH14juWrJm9w89PD6dxeD5604M1hC0JoByb75cmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NXencS7awCq6MKYDFk/6qP73ePNfsfbcgMEG5QQ8jtNxzQ1bi27W+GiSlGXzoyXT65P2v8Bla8TX0AYFOou7MTPCkgKPC+SFcqoFTzM/DBZdOs1ErNQCD8FiDDKuKaX4qExJ0PSDnN7SMmQAlbT8Pi1xVEAoKlSmn6fVpUbFGCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oT3Lvl7H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaTO0MJ+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NNrk3D322609
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 01:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8TWxFj23kF3n8FLcjstGhh
	zu97rN3Hd0V4bM6JRXgac=; b=oT3Lvl7Hj1NUiTPoP3BPp9iWYpRibITaEKBxhF
	7FlcS80LgDHw0y6jMVkmX6RMv7Trb3MgnJPfZGUnO1WaDN3zojt80Lir7FJVmOu9
	tjW3kJbR5cmiMa34AbQaxgL22AFjmo5AQwKLrxj9LVUFG8YOgIlw6EQbDGjRbRBk
	C86IAZwRkdz3P6LDmnWhwSghhMZvy5VYGnvqK4KB8Y9UPODQXRnwJgdRAgRAqBzn
	jbSBjjhmi4Zs9k6+qo7coaXgUnyvpqjv4xkBLxC05RFO71nzgQGDm8y6DLM474cF
	htGu4PYdkH6U8Irx0L9DIHOLH4px3Kh2c/LuDrWz15TdaNPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv3mqb9j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 01:03:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34cc8bf226cso2845181a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 17:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769216602; x=1769821402; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8TWxFj23kF3n8FLcjstGhhzu97rN3Hd0V4bM6JRXgac=;
        b=AaTO0MJ+Ei4/F74feROPequTnQY2J1jB6FXe3qL9y7mtr4P29jAcXAhISrKVwZGbmn
         r5sVydbgXaAQd/U/ze73QAYkidKqow2FB6qXxNSbblpW8F3iu2G7a3syN7HYyjwAhuzk
         9sp7vWGUsmvRJaZChLR4g3uk1IWLPxrvreHgHexVkD825lJzBiL1dVKW6tCPCBVrzlV/
         7zEUE6ePqUmJJ4HvMO4qw8OkunurL/CQgp7e/BG1FwZVqeS7HD7Mk9FhDVLgX4AdcldX
         5nlpfzRrZ3DVzY7Q4WBZfwOIms3YZz8dFndhNeJF4WDcHWCj62sgQOoBOFSIFeclqTUR
         9tTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769216602; x=1769821402;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TWxFj23kF3n8FLcjstGhhzu97rN3Hd0V4bM6JRXgac=;
        b=uzYCDOI+tZUDEg1ldO5BEe0UCdvcGsrw9qnoVpVkoUrvi6AQTWiwpXRo91R6yEj7E7
         qlkBio+WLd0trfnzvCYVlyf2vfmVFnlEGCNiyJmj9JC204+7rh1R730qfzb5xSBrQy4i
         UdabTTbkxczcFTiBDJg1WvaK7VDx9NtovtBA4Uu0sM7K+nEA7rRAd6fEdq8kOJCOTfLl
         IlFQPbO3oGx+IUUVzU1UUyUQLurefDFjoY60nT2zj3rfHgrTtuX2ZoNrMWvjsQ3dYRqI
         lW4TwXghjE5HzvcRRIV9R8aybLSvwhwaMZMP3O8VYxVLpXkuzJdV425K+yTKkZp4pDQF
         fYZQ==
X-Gm-Message-State: AOJu0YyeEouYkiWjT7DQHvfk1YvCfXiU3Dkg9m+BiziMJqjEzgaBl5kO
	fEeyN3CQ0YWEMOn4K1tDfWBz3WL53xoWqfrRkGq949R4zRY8sweJCXwj2fm7AvQ0WCWlpHyo8ci
	C+c0nL2vFgD2CSLVoqy6+dhrnyR7cRjsexgNcGjZ5Gyt4E/mzFQL+4umd/D9aNS5KQwRE
X-Gm-Gg: AZuq6aIAIdt4/+uLpCgNNt1l4SuYFFRBls5a24gGKnTo4Poz+2oowA5r7WMAdywW/Pg
	6gTBMaRIzhlVgKLYv7ZLTMhbi9as5Q+NtXbvynrViabcsyIzzOZSr70t//dmXdvYaYuyJBbVreN
	vqk2Qhd/zw7DC0z6uWqGQITGlZFxbWf6MrwpgPC3gYJMbpw/fkwAqhMwHtFUMn4e09HFK4KFYMZ
	oXTqiTTXOAahXOUoAo3VzWyh9edR+PPCVhsHHpUU8LVkgnSwwP2CrAUp3ePrw3aZCROqU5cj0to
	m55To7QSIWvq0Uw4VwOzibj6tfsLZQHymMb3nj+oO3C7C14HSwaKQUIccMsoUYPeWQpT8FcTeuf
	VMCb+RiIV8cxA7ov7Bd/Pqe/Fx7Q2sRq9NQ==
X-Received: by 2002:a17:90b:1802:b0:34c:a35d:de16 with SMTP id 98e67ed59e1d1-35367013bb2mr3866359a91.11.1769216601389;
        Fri, 23 Jan 2026 17:03:21 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:34c:a35d:de16 with SMTP id 98e67ed59e1d1-35367013bb2mr3866331a91.11.1769216600907;
        Fri, 23 Jan 2026 17:03:20 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536eaaca08sm1601449a91.2.2026.01.23.17.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 17:03:20 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 24 Jan 2026 06:32:56 +0530
Subject: [PATCH] drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD8adGkC/yWMQQrDIBBFryKz7oBKaTFXKVkYnbQDVdvRhEDI3
 SvN5sP78N4OlYSpwqB2EFq5cskdzEVBePn8JOTYGay2N23sFX0UygVTicubsPmpr5tjcKS1M3c
 N3fwIzbz9q4/xZKHv0uPtPGHylTCUlLgNKtWEmbYG43H8AEkp/c2RAAAA
X-Change-ID: 20260124-adreno-module-table-9fdc9e009170
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769216596; l=930;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=WWUyH14juWrJm9w89PD6dxeD5604M1hC0JoByb75cmU=;
 b=D59ESeUE7GzbXhMQw40VelZqZRH5odZu5aPQm4w5JQOGjGupVHzRKCaxqjiBnWSbKc3iXl+uL
 nWDWQqVfxwABwzw/tBYiIiPjAiqCVrFca87bZpPVZwkwMEDHAG3ZdnX
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: Bzzv2q3nfhOug6vsgm3WnsSd4GO6umKH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDAwNiBTYWx0ZWRfX4/x8NRE5wOoZ
 sHH5LqShCektKsxt7S1BnDDgvdjp/daIPvLj42aXe6Nej3a3NVPIR/7v44W8GcVOJQIBbfNYPBY
 M7t91wSWFxxIMtzAUG9bU0LoTXPQInTfHphSBPjovaLI4Bv4O6KsoDVpvwoiHS4mIXj0gBhVo8u
 NB4Ti9VpLgYEvrBG5TU/VetCMafGiUcuYAH1QSG3FJOvZ1JBIufdJ4UtZnMmATPDSSrX0SBKdAV
 q/RzlfDeIoLOg4CAqwgxspXzEUR7c3ynjA6AlsELiCVl1tW7FhQ05Ne5AypfGXOomwRJA0/5sgd
 N/uYTROYN8Wa99FjC+Oq3UB136MOH1SCqOo7T2LzxIAeqtLeuTpXSUp6y1PvIFy52dAc+Sx7FuY
 A5bxOZkvdFjN6SZvG4aidiRgbfNQ3pTiQ5o0fz6fADVx2QCMxUpQJmMrKGFDHBfET7as4IPdIrf
 6OihRZTqOevEw9vr8dQ==
X-Authority-Analysis: v=2.4 cv=SMpPlevH c=1 sm=1 tr=0 ts=69741a5a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jyu4jWsmuh8SW6qgMwcA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Bzzv2q3nfhOug6vsgm3WnsSd4GO6umKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601240006
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90395-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 297077BDC1
X-Rspamd-Action: no action

Since it is possible to independently probe Adreno GPU, add GPU match
table to MODULE_DEVICE_TABLE to allow auto-loading of msm module.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 554d746f115b..4edfe80c5be7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -302,6 +302,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,kgsl-3d0" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, dt_match);
 
 static int adreno_runtime_resume(struct device *dev)
 {

---
base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
change-id: 20260124-adreno-module-table-9fdc9e009170

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


