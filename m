Return-Path: <linux-arm-msm+bounces-107292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFZSGx94BGqpKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:09:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D4C533A85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4483531B7A2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E7146AF1E;
	Wed, 13 May 2026 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkgrZ7k8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkJ2CcJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C9E45BD4E
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676561; cv=none; b=e0J93hKMLH1mkJzCreTJggjwjb6RqgorSzDb1j16WMcJvVEl0BVQWaZHRmPa92s034xIQ4jpO0YSVWg2Ox4qYD3ObFBq16x1IJAyLVCEQMLKY4RFmxKrfKwcvVsS4sM9xdzrSEeULKe0B+VNxEjkC8xCHHACOXbaIQ9glGp4Cr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676561; c=relaxed/simple;
	bh=9MMSW5/Ed7QpArLAviQFc6KStndAKsio49V65Hx+FaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hLty3RwidzrRVydZ3gISpo1+mDJOwYcTVnSVwBBZqz/arUXhf0gpPBd5TbY2jQniioF0NToSwGIOLJQnXzSjAubcrpZ4K+X0/K8ypTIh10S+WMmDE0q1/IHDEAvI7JejbP+Q0spEDkmlcwCZQfee6zTwbWBXyBsmuGynjx+E+Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkgrZ7k8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkJ2CcJT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAvg0s1393173
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=; b=YkgrZ7k8Hz4DAeEE
	CLjsJgOhs/4ujwqz11UXV8rm/ICqMwveksPbdXQvq2sL/lwd8vTHdTsNLs7rCDRk
	OueDZPyWs2BzYF3/gRd8+si5ZHM+YjWoTA25Kjy/M+F0Z9OsV8zEzueNLVcbNi45
	5YpHQMWnqsTLRHjfcy0OITa+K28wn2EWJ0WC74mY6gXO1JSaDil+OEvqHePDKCML
	VMLV8SYHNFHnzz22GQ+exwyPUgowGd9LiXF27Oabm6umL+/sc2p/cSIcYYML/HVV
	plte4YEe9ESoVEmTRZIwm32axmOeZPH32jElMeuf8IO//lbDTsg9FrS2iFFVwid/
	8iKxeg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k261nyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514b673c8f1so38668581cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676558; x=1779281358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=;
        b=hkJ2CcJTJUA3fM3276h3jr6Z6H0xwLlKPKIl+vwmB8FZD5hhsefY1qRd/iG/zmg4t8
         HvT9sGneKsylXfxT7Rn60SYNN8Xub8n2CxZ/8KUfbcH6G9OXFjWR7HgEXbREa+9dOQqv
         AuJFeIzCutWh9fDBqgDMomlNbWN1MVQSOEEEcr/nyMIJfe268gIgHPuP3fyOCIVt3P8/
         i3jkkPKnqkvNzIaPcoi5y5QMV7KUcyd7oLRLbkswQaJom4jCrUS0wqQCcpbreqkp5RKm
         nzjD7lIPwOE4+qCfPh9EC6nRhHHnDUGts7OURgW9SuQ4MR9AQTHfrCCFMibnDDRVZFP1
         PjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676558; x=1779281358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=;
        b=hlSivaOzrSBoJ/jxadodIW9PsJE1+ASM3ROFS1ffEwqZ5awLUuyeCnWZbGnCfkhRKZ
         9wGA3MN3X5Ch9papUj0q7xvMYYnCgTXaKQMEQQSp9pLvbLqSaA/V7sYx3OOW5ujQ4vz/
         l+2r2oKsndA2AM+CBR6AQ/wbXZdlPCggHlN1MatUeSiOW67ued15HKtjqytbJAnUTnSG
         oDSSVHcrRmeGKFvEdMx1N63zPJ+vk70gOgBSRP8Y4BJfgp8HJw5vDem3IV83N20inbcK
         k2nVFYeACG6HuoqQY2c6eeEG/dy4/lkVt+TQFkSQ3JFGDtgy2HfMBYXdaWAKFiw4yylS
         5V+g==
X-Forwarded-Encrypted: i=1; AFNElJ+qHJpdE5lfg6qcTH9u59ilj4rWUCqliyrpge9dR6+xgUw2y4k6VvgoDVdSEzF0BsSkTStiM+YtYdStWOGB@vger.kernel.org
X-Gm-Message-State: AOJu0YzjWW92aOqSr31szzF7NaxTkZ6oTinKPshIrbXBzoOqm6Ku3RW6
	OqBYag7OnrQi778ODabziXhr+amPSdlq+tiOgQWY4pnwCSUOCa3kVPbO4qJHZfpHQQhZLAozbWV
	koQcT25p0o/6sDINZ34coIF8WG9uuvHeyEM+ag2QthnDfiSuMnaeLloMqkxWXO3XIE2TG
X-Gm-Gg: Acq92OGuq7PTro5c5tZa55v3GM9rLBUSYV3h7c1X5vobJqaUjoEO+2SGKOqqCM+QohL
	3b2r78tlZH05frIaYOKhosqSFHs9E4kpnwHA0OkMUwoRKHEwA/rctkAssDHO9Q4rK90vXoomRHn
	AC+ETQNF+zOwlHNXxAHGuAZeEXAf55N2dBa0ngxwKzjLkXzXqAi9VcyhsJtcp9Qm8aufjxsI9go
	WWKnW/5RXTNuA9otQnr71s23ECAJ4GFIWE5TLfJioUJGzuYgRaYfp+KBL40ldzejZCWXWH9SWx9
	i0EpAAjjefvoa91FRhQLoAP7HaICdw7wN/pOo02EPuVPXyLkvSw3kLq+WaJ/gI1kJQvZI9giZlE
	4pMrGk8BMhh2lKW8gg883WdrtvECDlUZ8fHCkvOy+KidihdvH4su3Djx2B9CQ3p4SIG9jErVrVt
	44WcaoHpIda1g9qVwzbOi/FdDbgAOtybJR80o=
X-Received: by 2002:ac8:578f:0:b0:509:26f4:64f5 with SMTP id d75a77b69052e-5162f60846dmr40360371cf.48.1778676557435;
        Wed, 13 May 2026 05:49:17 -0700 (PDT)
X-Received: by 2002:ac8:578f:0:b0:509:26f4:64f5 with SMTP id d75a77b69052e-5162f60846dmr40359961cf.48.1778676556935;
        Wed, 13 May 2026 05:49:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:38 +0300
Subject: [PATCH v2 04/16] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-4-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4871;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BLAFo17mDNzRt3RGOIKqa5vQlLgViburqFmg/i4bsbc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxZLsUPCzE3Zx8QCuksX+jzjdS3bvLQpvY3t6nvfZNnSW
 s5o0b5ORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEzkrAEHw6awz3NmOHiyzrV+
 aupn9Ny2Y1X6CT51qUttL3ZenaTE/rOn3bx4x6ZHjlUH0t1zr1fyhcr7JdhcTElWfsr8TW1d2zL
 B3LythoFfHrYu31Hp63lvt7nNg/bCzf73z3vtT2sQuF/qqSHAqP329+PCQw5HG5vKNziUMWqp1O
 sIMu/gcjrDt4Bt3utdDiqMT+9m5Yi/Fr0zR97Za8VyvZIpPX/4Cst6bZaJLV057Yc4g41+TfvG6
 W1hot++aV4y85xpvadIg+36eUP5+QI7p6/7ZrnzlROj4EbX1SE3knrVW5a4WN4x78/k1Xn6Z9aF
 tDNff8j+kPscV3oyrdyz/wFT9/zeI2vP/Hz8xMi82XsNAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a04734e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX2h7cBVNrpDBA
 a8Be1KARPcbXz3sAhvsiNS1ZRDBV/Z/6AMv6L/Y0zuHI11slnuj1aEGOk1Uv5EHGap2UcEkcPvr
 r5uwKd3NH3ahAVcjMxmE+qzGAyYVGW1EaAkAmDp499c3TC3xyCK3qv712LjJw1jxAb47fKJJI3P
 FIbKMEhPC1j+S6MwwHwBumh2u4LnZAR85hpa/arR7a3D/AaIIKlmzqDwvkL6af2Tx5AdbB4cEQ9
 n4dG6fHYu6jeVRORVs7Nxv/uq9/Cx8YX0SLzKcaTMHtNPXO7+tc4U9oT0rQDUcMZncO1C+ggYJO
 rTocUXP/DA1WQZQis9Qj9yq2+B2f3mMpCBH/2wpL1SkmM9l7fHcAIm9zTdZZhpfiJ1vC4kAYX+4
 9I/EBtfjKbegGXgSRpNd0KaSxklwkPpB1wWuq47ZcQSeogk97yXdgpb9QCQi9lB0/3rlddujUCf
 PXDtcei9PEhQZFoOUOw==
X-Proofpoint-ORIG-GUID: _TBxCIIGGNKWGIKbUjHH0tWJPggsH3LI
X-Proofpoint-GUID: _TBxCIIGGNKWGIKbUjHH0tWJPggsH3LI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132
X-Rspamd-Queue-Id: D5D4C533A85
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-107292-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The interrupt_init sequence is currently shared across all supported
devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move interrupt_init into a vpu_op to allow per-device customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index d61902c9a213..d49d22b14753 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -46,4 +46,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index dc02ced1b931..c3b760730c98 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -262,6 +262,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -272,6 +273,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -283,4 +285,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index f608a297d4a3..90ccdc0d2a07 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -369,4 +369,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ff0070c85ccf..59e4d68d042f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -31,7 +31,7 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-static void iris_vpu_interrupt_init(struct iris_core *core)
+void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
 
@@ -474,7 +474,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
-	iris_vpu_interrupt_init(core);
+	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
 	enable_irq(core->irq);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 21ed4c9bd5e3..9151545065cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -23,6 +23,7 @@ struct vpu_ops {
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
+	void (*interrupt_init)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -44,5 +45,6 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
 void iris_vpu_set_preset_registers(struct iris_core *core);
+void iris_vpu_interrupt_init(struct iris_core *core);
 
 #endif

-- 
2.47.3


