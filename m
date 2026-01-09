Return-Path: <linux-arm-msm+bounces-88221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E0ED07E11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB57E306C748
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A55A35292A;
	Fri,  9 Jan 2026 08:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlEfH4X0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOR4FhI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10783350A26
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 08:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767947929; cv=none; b=TjhdvmrTtyGjEX8ToTHknVOxigQkG73Eabr2xMBQBCA1UvGkiyyprtRub/tUgLt3ADHVpPtHSLkU/a2smEhJhQNEPzi9Ci+YWzlw9M6p5vOfEz3l/9rpFmNlEJI+7uMtRM34JQYRrJk1AiLJk8EVGavM3quKNNX5k8l78Ju3i+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767947929; c=relaxed/simple;
	bh=AlwEGpLdK7auGmVqLFJlRQmtzFlDf0nVEYzhNeAjjfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lDdFOYGLixnP7sYvlaBqeG7eE2VMylOxtNNAbvuPxGorPONNft0xcaOAQxWH3mpJVJZTXV/tsFUYdvcyh5d5tg/M0KcuVarFZCEmkjzUjbHDBNPmHgGwSfPO2EQxkx6g3Sm2+IWXmM6rGYbJlfG+eugHXqbsXxvKyC+2JAfM2ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlEfH4X0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOR4FhI2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096M4He2986441
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 08:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p2iydELEX89
	MeFSjotNCh5W/60kH6MpBL7MbZgsYBPg=; b=MlEfH4X0Oqkd9+WWa/b+2PkZb56
	xVTfEE2K1gl4jQoaJSkkbU1rOf/NPr2jdznoWZz+2mDPvojqO7gAhqoivcii+8QI
	xQ024+XRFXOqrE6eYDBJcy4PQWUvqJWe2rN7icrtRCl+yj+f5emvo9RBYeDiXnwL
	JsoFGCz7VDRtw6AaIK2rFQIeYla2MyeIxg6Hzs4AYaEgT0JehoRBteB8W9slV575
	f8iRbqEC5SiYxenrcaZTkz4DkRlaDC0zFMMreysBknW9Vp8h7vqv67+c/BkcJq6p
	VXGuubYHaSDeDHquy1qznb+7QtpI8j64wWIgFkTNja92l3bXWbz9y3Q3pGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjhwx21gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 08:38:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ba026720eeso1050834585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 00:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767947924; x=1768552724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2iydELEX89MeFSjotNCh5W/60kH6MpBL7MbZgsYBPg=;
        b=QOR4FhI2e2IbxPHIZ7gsCij8jjK0CHhHKf9BAWWDLVKxeXSH4YAKqV2XBQPF/I5Nf1
         diAJRHmvU4izdwD8KQXQSZN/0J1Hn/e2wQC2Zvnm/VswNmuVrp2qCHT4nONRGvsknvMp
         Hv3/kFLwzwLfm736ob6vJ1m8I/tH85xCRpoBaYFys0VKzJ+ysNKbSqCPOY+PmIknyWJT
         HgiR4VJzbfoITLt+tsuH3jWqeb0Z3993SDyLnYwWA494uXwPEOio64mLilvDJxw3lvDR
         ujAAe2MgzqhrmiilSKnMBsCju/2WTUweLHUg/ZgIwNDFrMenWs28mPuV3KLPlt4vrKEA
         M27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767947924; x=1768552724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p2iydELEX89MeFSjotNCh5W/60kH6MpBL7MbZgsYBPg=;
        b=YXFASZE2x4/emkEVgLI9/WDK/rB+y9YYDkF4K85RuBYxru9SFj4DU8h7/Ik3mXv8YS
         wwYE4hd3E15JMZSakqo+vnjQNu5g6Xs34pO+4oRREiR1Ae4/lpKDFKMaFVZ6lcCOSYYI
         7BYLd4M7p5cjBQ6dNBkcDwUJIAvdK5wXsNqgcviUuVEQv9kPjkz97UN2BHRQUZabdOfz
         fh8BvC67F2rW5eaQvtLjYUCN4AZset+LQXQuRu1nl2UaWJ73yaWZ3KumINiFI5cCPRTA
         D5NkcpZ9joq+dqhddTl1BsXnOBIRxahPy9N+MifwiPbz5mn1/kbzmD742Q/HaiXGqZrg
         ofvA==
X-Gm-Message-State: AOJu0Yz9occYdCSiHdTUVNgpyphMkdgrRxtetdaZpZeC4J7JPSRBsesu
	eegMutvUtfwviR08d0zzadJNc8CQBPv3MimT9azjc1WOBGXIm4yUwe6TZUTGzfYN0/pMIKJ88LF
	M+/u+K3JH1o4o/gY/FyT4Z7vyXF3h7i/NFhCEBE1mtnKwPK/7vEa5T7rb1e5ZFPXBwyec
X-Gm-Gg: AY/fxX7PNToXa2JtYethsMNTR5/Yly7AEAcWQoB6IZTUXDVGrTfKCaSoxw9dRS+6294
	4yg92GCc/uX1dnKVcn3RidROx+tl3brWA9LsUWFBkzNL7WYYTp6p4hX8eVpfOuZKivlPfw66zZo
	wnFM5UqVh54MzDTRU24imbNVa+ZMEg3oUHP3UlFEZTUX98N9w6qf4/MXhJhP5WYk2inBdz7tKE+
	1+Qgb5pQhwOnRZOf0WcL3NcY0K93jmUqvuWhuzHBH7nTlY6iHlXA8mstTzk9N3ntXLQOPvffb4O
	srRtpJfOCo0LfmRoKXUN7Tg6ViycK2yKvcVyn8y2940PgFNBIiXZ8PVTKL4ceee2NDR3H4mYhdY
	EtmX12t+GPEdOEP7CSl7wmyO/3cBU7M7KjYEX/33eesxxVWSTX1sJQTDnuCJKKSMbBa4=
X-Received: by 2002:a05:620a:2a15:b0:8b3:36d5:7544 with SMTP id af79cd13be357-8c3894203f9mr1062565485a.82.1767947924415;
        Fri, 09 Jan 2026 00:38:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9rYzZuiEjS050fTw4qdxmLAcU8rZYTKxOswGCOeUlxovtPH3VDw92USgjLqt0puAdgHj05A==
X-Received: by 2002:a05:620a:2a15:b0:8b3:36d5:7544 with SMTP id af79cd13be357-8c3894203f9mr1062564185a.82.1767947923974;
        Fri, 09 Jan 2026 00:38:43 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f530c35sm771262185a.40.2026.01.09.00.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 00:38:43 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: [PATCH 2/2] drm/msm/dpu: use max_freq replace max_core_clk_rate
Date: Fri,  9 Jan 2026 16:38:08 +0800
Message-Id: <20260109083808.1047-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2MCBTYWx0ZWRfX75/jT72uad9u
 roZBOITEAUPcY/zCnPzoC3zh7O6xs2bZq1uq0AxXaSKEaqHuozqJ5Najgo6FSkzKLa7G5Mjo8nV
 MgrmErTemmkOUw6O6BWG7STcgZUeymTIYAWzGkO5DFVyW8azwszbRUbyz3Jrl9j4/2xOY6SzuqZ
 E05LN6sqwzEVydecdDS0953wq073Bq7JjNooCWktY6GNNC0ooB9BBOw3omRck0PCLph5WprSE5A
 BRUAuZDFhJ/zuZELjQlaLFqC829HLdsqNpvhQSP02Zb49tjwjn9+m4EDAdWzGeETRvjPQByKjPk
 nt+goMzDTjFrkxQTgMtPgUl7EC1eTxQlNjpqEPCJUs7NNqXkQvp7XvtvbKlCU8pgsYd30rqa/2w
 D3JYdIyIEge9mZvr+aeDutEN5kTcdxA1HcpjO+xBVXvBaCo32Z68fwNVuvPemrmKTHR1F/vDQ9Z
 1mPK/Z0zRCC5DwXzGXg==
X-Proofpoint-ORIG-GUID: heQKWT2cawk4pAN-mJrgewQZR6bcCohf
X-Authority-Analysis: v=2.4 cv=ENILElZC c=1 sm=1 tr=0 ts=6960be95 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qtVmDkmmVSxoQgGSxMgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: heQKWT2cawk4pAN-mJrgewQZR6bcCohf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090060

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Enable power will use max_freq to set opp, so remove redundant
opp setting, and use max_freq to replace max_core_clk_rate.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c31488335f2b..973fec1c328c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1233,9 +1233,9 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->hw_vbif[vbif->id] = hw;
 	}
 
-	/* TODO: use the same max_freq as in dpu_kms_hw_init */
-	max_core_clk_rate = dpu_kms_get_clk_rate(dpu_kms, "core");
-	if (!max_core_clk_rate) {
+	if (dpu_kms->max_freq != ULONG_MAX) {
+		max_core_clk_rate = dpu_kms->max_freq;
+	} else {
 		DPU_DEBUG("max core clk rate not determined, using default\n");
 		max_core_clk_rate = DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE;
 	}
@@ -1317,8 +1317,6 @@ static int dpu_kms_init(struct drm_device *ddev)
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
 
-	dev_pm_opp_set_rate(dev, max_freq);
-
 	ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
 	if (ret) {
 		DPU_ERROR("failed to init kms, ret=%d\n", ret);
-- 
2.34.1


