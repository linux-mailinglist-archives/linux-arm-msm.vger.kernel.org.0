Return-Path: <linux-arm-msm+bounces-108629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOiyAG1aDWpuwQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:53:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FBA588798
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E553308C9E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 06:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C817134A3DB;
	Wed, 20 May 2026 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PY5IXu+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmfpYWx3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B774366575
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259869; cv=none; b=kZSxsQrEFHvKdTUJ22uiCOgGZiG94J4D3STcqEX5iEqq2o752mW2sn8LYzZUeC5Is8cP9we7dnqWpi+wBpoKAf6LtkcA+xKUFUVnOikVG2rjN0xRWMK5G82mEH2z5zTGB0oGBgQD5m+BJd2OUyN6hqoXdbRBy5vTWy+VYhnGIEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259869; c=relaxed/simple;
	bh=wLHY1YKwTOtJ5TMOu7Sc4w4rQ5+KEfPEjuD58JrY/gw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pFeM9sxPEU3mMaNWd+OjvzCeY+TAfTKzDYeWoS8gryhRgoOjmcKBz4H/JqV2NhhCNQK7u9Ep5q7ZKOiy1tRvRyPVI/96UUm2vOJO6ihEsUNWrmkDeEvm4CvdRwkByCkvA7Cku/cXLCXETxczcJb+BncG7EEzvTdOpovb8lP2FGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PY5IXu+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmfpYWx3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JM5kht1636906
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tFUu7w/Mdhl
	BRhU4Ur6TRUhTba4EbTByy053HqbjsgU=; b=PY5IXu+QmiipXKS5ptBVL/hfa6i
	irYkrRW5+36Ep7v/ipE3UqaybAj56aw7Ho3f2QaadkNBaqBO6tMu5dSQyu/DnUpl
	l28Pp5qpR/v9a/HQ7KBLkBqq/HRfOywC7Ewxs7z0dNzI7ExI7WJWUQk9d4VFrbEw
	iVRReHKhZJGDUAhAyP/t4x+kp0D/M/7SSyul/dgDBb4KR9xKlvkgWoVUXR5ohfhr
	eSnZgBSBAtJhowGrol/MWtMLfXU6/PMu2RpiFutLb4I09rRx8Ups60LXQGkh6n7F
	/7eN5F4mgOGpQIUIyqtxm+oq1Q5NNKKztAo9/gX5TvYFitKElfG5mpWrwaA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sb9q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:51:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2babc42244aso111342885ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 23:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779259866; x=1779864666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFUu7w/MdhlBRhU4Ur6TRUhTba4EbTByy053HqbjsgU=;
        b=AmfpYWx3SW0xAPusrMrNcBEXNghkiYIyDeTaVauJGVplVdWi6KbbikN8JX3NkixR6Y
         jqMco7Q6Opgj26Q/XUmgLq/f1vbPUKgpKcta7V0rfE7asgLWRqTcd+DNYfjWJzRBT7PG
         xeneHJdsoEfvr5W6F/Jwjl5MHoX4EUPGHUt5hK2jcUgBWqIOAUMde67dpAChbdFC+3IG
         cnV/l7G33olqJl052xecjilUehUXo9Y7HzDnyfo0Go+0xLsXHeR2AXj+tVpazfHPDrLk
         CFj7s3knVmWAAnAzgDlvq7ing5C0HG/Tl88SyeCSgEMtgNplxFHsT1UDtfg+0VdIPJZT
         P/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259866; x=1779864666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tFUu7w/MdhlBRhU4Ur6TRUhTba4EbTByy053HqbjsgU=;
        b=B0xUB09q8qWSYBxrQAZR+spTKmUYvSJGB9/I3mviY+Qg8QScFaYKs0N9WnjeijAMSR
         DZWV3GIoG7j4xI3bzmKL70ctZTK5JN8EtgBMkL/CL42B2+Og3AMeDEONTPtobqP3ooE6
         Jk6tDg6mYNvC1svr1A+kjoJUq8yupkWmluL7tizG/kThPj9Wzud1j1tznLhjkCWR8JOM
         gdC4uBPjgC1DrCLHAoY0Xj4pLPzdSaKhYBMBlEm+1X4nR0SOp5jnWhTMBXnlXPAO0Vn1
         8e9XHpuYMgHLV5Z2W3B2DQp4x0/dyPBYZ8VvRfxWf1p7xpivoT9Y2WFXUojr2k4YF5Zg
         dumg==
X-Forwarded-Encrypted: i=1; AFNElJ/Bx1pXq8Ec38/d8FUwwqpZMxruu2uVoz0rLGiWwxgRGdu4nZVXzSi0hpsmaWaslt0dfFk0f7a0nAGNsWQg@vger.kernel.org
X-Gm-Message-State: AOJu0YxfYAO409qee2dC4aMEIVFrMCI43VHVo5FfOe3MPWaHgJwl1O6D
	ghDg4WQo188Z3dlRc3n+L9itK/q9Ieu3v9RHami6Ws9rKaYomN2y1YvpUsuX3deLtW9rTBBFJf4
	rwnly+nJcBKu8FnIszE1fsSFphWUzEYbr9eXhwr/xu3ROK6P6z0GBtf9K3ZEM6YRaYQdE
X-Gm-Gg: Acq92OGUfvn7ZJRCu5xZnyVAlqrgULLqNYFaQ/FzWgjI1XuDqCAwTPis/f6ZcgfX2yM
	eqzVZ4zIMRgt+D/FO4Kr6gCF+g548rM1jSaYoH3JIV65Eqlwfu1ePUN05WDwfVQi090FFsbx7Zs
	RO6Er70sakf4ZYiDRiaD47p353IU8FVP11T1kga316OBsn6F+QC7kP/V9vG6aFgkcq/BQ5dkA2i
	yW6OqygIxbCTq5cI/YX7GoyeTb+7t0EfZUBoG1hKEsKmEmropugYA7YFIsklhl2FoYS5st7+J4P
	RcyAEtUJmOSu5NlS89g0RDfKW3D9m2cnR856WdSWbkcWbx5yTxUgBqfjsAonHE5gln061+vCstG
	Vp20hg4HQ1f+gXlMRVvLmOXHc9ME78UdxZzfXr9SqfkHYOQIfGfP+6w==
X-Received: by 2002:a17:902:f64c:b0:2ba:fed:7891 with SMTP id d9443c01a7336-2bd7e92c24amr260092505ad.30.1779259866271;
        Tue, 19 May 2026 23:51:06 -0700 (PDT)
X-Received: by 2002:a17:902:f64c:b0:2ba:fed:7891 with SMTP id d9443c01a7336-2bd7e92c24amr260092335ad.30.1779259865775;
        Tue, 19 May 2026 23:51:05 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fe51sm206410165ad.2.2026.05.19.23.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:51:05 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v11 3/4] misc: fastrpc: Expand context ID mask for DSP polling mode support
Date: Wed, 20 May 2026 12:20:46 +0530
Message-Id: <20260520065047.3415790-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520065047.3415790-1-ekansh.gupta@oss.qualcomm.com>
References: <20260520065047.3415790-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA2MyBTYWx0ZWRfXyibepPiN/CiY
 kq4Z4CVIwPl+6iAm4Ns5NcG0PfQZ/wl2XTXHBBVvUWGTLNUAQVfkYs2xNukA5fRCGAvQUkTveJ6
 ob7TZ8QwZ80UxRV0tVW9ZwaIQlGTApNx1L5d9uGB5iu1duCY8JVVCU8VfXfOWUSNY00FXBeL3W0
 dyfbZ2pW0VZB5Hesi4e+o+W4LKUjzT+jt+bsdjuJb982KNYhO0pdneeWLXGMSS/Zb5WIKk1ZvbN
 NDZZO5eQjjhYnLlk3Lc6aRtJ/W8AISvA9qmlsd6/dW0sthHKwH4dAp4wLe3uVgSBbzd0wnXoiNq
 PZu5txCNZGqWPGhpp9teiFExpRUBm475vBn69CFWCoHeEG5L6g64xR8uVMoxKutLdRYu+Dsf6RD
 RlyPabuj6r3hGJ8fJEAZW5q4Qu25BN4oCVETFL6iSVd7Jn65LJxhIG8i2NEQDGjN4SRULbF/Mlu
 9FUp11c+UbOnimFBKlw==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0d59db cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=JTa3dIKMUYn8LlmgGFYA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 7DIb-Q2UpVfSXx5bBVdCyW24GYuUcj3l
X-Proofpoint-ORIG-GUID: 7DIb-Q2UpVfSXx5bBVdCyW24GYuUcj3l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200063
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108629-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88FBA588798
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Current FastRPC context uses a 12-bit mask:
  [ID(8 bits)][PD type(4 bits)] = GENMASK(11, 4)

This works for normal calls but fails for DSP polling mode.
Polling mode expects a 16-bit layout:
  [15:8] = context ID (8 bits)
  [7:5]  = reserved
  [4]    = async mode bit
  [3:0]  = PD type (4 bits)

If async bit (bit 4) is set, DSP disables polling. With current
mask, odd IDs can set this bit, causing DSP to skip poll updates.

Update FASTRPC_CTXID_MASK to GENMASK(15, 8) so IDs occupy upper
byte and lower byte is left for DSP flags and PD type.

Reserved bits remain unused. This change is compatible with
polling mode and does not break non-polling behavior.

Bit layout:
  [15:8] = CCCCCCCC (context ID)
  [7:5]  = xxx (reserved)
  [4]    = A (async mode)
  [3:0]  = PPPP (PD type)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 3f5d5d73be5a..c4a3547a5c7f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -38,7 +38,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK GENMASK(11, 4)
+#define FASTRPC_CTXID_MASK GENMASK(15, 8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
-- 
2.34.1


