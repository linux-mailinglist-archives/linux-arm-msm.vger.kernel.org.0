Return-Path: <linux-arm-msm+bounces-111263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mtErOYPcIWpEPwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:13:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D6E643246
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:13:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Vh/Hkonu";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EpgWgyk4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111263-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111263-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99480304ED7A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 20:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BD23C81B6;
	Thu,  4 Jun 2026 20:10:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAFD34214A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 20:10:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780603820; cv=none; b=MGaz7ULZvp872khIcwFaqxklYD4juka0j7QBODKgnAo4T6OUmvG9KnzBLl6v82yPhSljlDR4u6BRcrkqOqoF8BkG3SZCKsStvVGQmRpBWQxTPY24A/PBfac+mo2qwTKq3UfafJa4DcxyqDtmjsm5dyh+VHi89P+k/mzU+Epy/tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780603820; c=relaxed/simple;
	bh=EVHNeRZOgXVAU+U68Pm5LEIL/hpQq55cLxn5qLgvDcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tjg0VtwlxN8bJ4ODfF41c7UOeEciA3sLFwLlUxuzpulRJFVaF1kXPaJWB4X8X+xL8powP5G+AJxXCOweHw7NW8EvmG9aIm0IbyqUFM/LMXOQ//JEf+va+SyqGYYomvmqwpamHVbkOx/GyjWPT4iyzVNmSAOC9S1ZQbH0K/gRB5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vh/Hkonu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpgWgyk4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EveTp140423
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 20:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilxmFuDlZLO8catcEmMGA/pntCC0AnEtroDNREYCuIg=; b=Vh/HkonuWet9ZMa1
	vZ90B1nQn4A3WwXoc+N+wGPagdxZzVZe+CP5DC12bSCEDNcHXcwH99K9Ii7SWkEk
	GDKVJbnmchm/DH32w4tveLMTsj9Yo4SW23vCP+F6L1iXuolt2P+EMRqTk8jCS+I0
	INe3n1dB7qZqQW4nC+TzrmfznLhPi2R9pr2qQ+cXM8LpctQknLs3WXSFLtg7hYwf
	D60W4kVKRQ6HchOVecl9IrHYCwJmsVRq4+4F/JvRHMfabuQKPGlntuH1KaQPQEVP
	oUBu3Y9bxwB9rqPbprERVcI16P1cEB9j0DJCH8tZzthJOPlnQv1krjyhclHh6q7/
	BN5phg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyencfqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 20:10:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8422ca754d8so788280b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780603816; x=1781208616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilxmFuDlZLO8catcEmMGA/pntCC0AnEtroDNREYCuIg=;
        b=EpgWgyk4IYy15jGXXle8COwIp4Nxb5RMnxQ4keuBxHRgnCDEL2djauZq2N8JyXSGN0
         Di5FuD+vENu7pR9FUKoQ0T+2UkC/StFbXEC2XDNRu/2h0vcSzjUWuBdMJ8qiIerBs31j
         4b5FWfObrUiSnUey+R3L1vngLaM3g2HSw7ZNtUy0c9odBONXph4xypc6qX7fG0V2Zo+B
         ub/stb+kwkY2zkMcxOlZPuMdQbbOQKIvVRqJLKnrXNcoB5u3h64NIyZvu4JjfVCj8a2E
         fbFIffBqaDVnMkv5wrV4r1CnzQ9020H9+hYim+7vMb3G6EVuPR0UR3LXLhr6eF8t/ozz
         Unew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780603816; x=1781208616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ilxmFuDlZLO8catcEmMGA/pntCC0AnEtroDNREYCuIg=;
        b=NMrP1aM3WuumLQEVOnnYkw+z0+EX9s55KjTTpk6qv7N8B5TudOvyFBIW0fk4I4O8/x
         jSgKkMzueUzXaWFZDvpZsomGITHKkAyDawa+pNW+jUgqpbmdlX6vdjhDN8XvlVdh5Sh0
         7zCzFD8+qjHvTWDlU+gohVbsLnieohAjTNINis0FkWbOc9DJ10JYzAu3oHNnLE/wods4
         gjNn95/q2v55ba2aJ5uYxLo49gU0aog7CRdmaBHbbj24UIJn8rDoXO1BgoOYwoOiDxYz
         tlgHAZfoNWpzYjFyTNdwGgMrYbz0GbeapoII2QoQYTYT4Pt0uui+3MJYWR++p/RcsrQI
         oO6A==
X-Gm-Message-State: AOJu0Yyhtb4Z25GKZbvBmXXV0wAB79d4f9878YwHuanGxHrULqKvGcug
	D0pc2+qj9qlxh3kdFkH2wiQEo88//3hzVI6t2cioXgbV+yhefc2Xs4LlIlBKsBqXeBJAtfrI6sz
	yK7Z4tg7Q4f3WzmtxUGSbY4diAPCmGyr8LLehuVEk65huifq8IC0FKi2rnqTA/pni4ohw
X-Gm-Gg: Acq92OE81qVA3dKCXMHNhdM/eYwkhYQMVHTxFvJD8K8WH9WMWScEpIQunfDP5+6b8SK
	+WaR4tv0Fk+03w6Z4Bp/ju9hRrRkuQLYzs8lFMGr1fcBqtPQw07lg+U+FjLMihOnpqgc6wgR5YR
	Tm6BlZ4Tp63sYdGpcD2AGXGtN1IFi6RgUIFv18CLiJHGEXsJjpp/1IapSVNS/AwNOB4spcHrqAR
	E0zeF4KoSoG6lrhh6HRnsh3v4tXO866hLC77Oh4FVD3atbHSxNFN+6uyg6G9YdRkGrk+QYxLkzx
	qsChBKkQ6Bygl6XSaRK89noimY+O2hGKuUH12HWMVLv7AzMaLJbBv/5hvLi7WA5Fl+FAj0TMQED
	JbObK5pKxdz7d9W5Jy1sbR53CCBfsfSVWywARCiSo9TYP5zU7X05thZ94
X-Received: by 2002:a05:6a00:bc81:b0:842:5a18:9af4 with SMTP id d2e1a72fcca58-842b0efb8fbmr208262b3a.18.1780603816365;
        Thu, 04 Jun 2026 13:10:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc81:b0:842:5a18:9af4 with SMTP id d2e1a72fcca58-842b0efb8fbmr208229b3a.18.1780603815857;
        Thu, 04 Jun 2026 13:10:15 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428290067dsm6721425b3a.53.2026.06.04.13.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:10:15 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 01:38:18 +0530
Subject: [PATCH 2/6] drm/msm: Recover HW before retire hung submit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-assorted-fixes-june-v1-2-2caa04f7287c@oss.qualcomm.com>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
In-Reply-To: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780603799; l=1149;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=sCyhvltmN32cvMyVIs4m/if40/Cj5ebIU1UMeNNMVWo=;
 b=dhPyHwxuQ2yTZzxERFHZWt8Iw4FNwVHUnlfxMyfMHEXDatrPKhl7skcv2878t4g440BzWIJnX
 QyOLU9xFtMOD3PE8zqUgAeW7aobGJ82pjOLAe/74FKjjRAR/v7NKWPv
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a21dba9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-HvVqG6-LJ5utcurNgEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Ifi8fjJiwIlyYuCGvsBB1RpFixxQI48X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE5NyBTYWx0ZWRfX6EUkKNtA1HYq
 of2CWhjsCQLBAPcWZyIssyW4yNWJZlwXZ//EF+25nU6nyzbH3LENFltefOCDVOfskpAxaOIaOQB
 cJKn5sRZHkkDvGzFzV/yk/CPg2PuHqmDWUec0MF0xK4q56aWWl+UOjMtwbfKKtWkHHQpFHVo8Uk
 6g0kiXUH81WLD4huAq20XS/h2qA8bY6+OWxkZr5h9E/hOi34Q5zInMprK+WfuDh792GmhdNm8oP
 sej3o9wcFdW8DRqrbBlvtGsuosNUlxB0WxQdX74cTMogZDTqIU+Wux+fO1mcUE7XsFIiBX1YlyD
 C3M3MFqtbceoUQ3Zseuq/wN4VXSUDg2M6+18zAdhqWC0vAftrP13vEsEmkBjZ0HyFgZnqbnKKIw
 aEdzr14Ho441R7GmhF82EKGSV4IoAobL8He5A7vECCY5oObj1zG6eevl0R2sl4QQfwc8R8SRgFn
 lYvn8P+wFnKfvTorHAA==
X-Proofpoint-GUID: Ifi8fjJiwIlyYuCGvsBB1RpFixxQI48X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040197
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111263-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:jie.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44D6E643246

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

During recovery, it is not safe to retire the hung submit before we
recover the GPU. Retiring the submit triggers BO free and that can
result in GPU pagefaults since the GPU may be actively accessing those
BOs.

To fix this, retire the submits after gpu recovery is complete in
recover_worker().

Fixes: 1a370be9ac51 ("drm/msm: restart queued submits after hang")
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 18ed00e5f143..9ac7740a87f0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -552,11 +552,11 @@ static void recover_worker(struct kthread_work *work)
 		msm_update_fence(ring->fctx, fence);
 	}
 
+	gpu->funcs->recover(gpu);
+
 	/* retire completed submits, plus the one that hung: */
 	retire_submits(gpu);
 
-	gpu->funcs->recover(gpu);
-
 	/*
 	 * Replay all remaining submits starting with highest priority
 	 * ring

-- 
2.51.0


