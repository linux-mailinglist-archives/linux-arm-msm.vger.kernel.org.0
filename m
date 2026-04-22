Return-Path: <linux-arm-msm+bounces-104051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCT+LGuV6GmENAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:31:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F99444037
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76640303FAAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C864E3C2790;
	Wed, 22 Apr 2026 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SKfT2E63";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OfT6jpvp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803803C343B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849872; cv=none; b=Qk00lYf2REeBWQnbCAmbDzXI0P/Ka8plLpm49Irz32v6dbCbLHqWFOJ1px1Wg68QcNvJvTE2g5Qqw5oNcs8B18PB/WykdFjyRfguwHYv3gDX+i7h95n1zabvL8gwvrr/r2c0LnF2Jalxwlq6AZMnKV5XXqRZ+yszt+YS4MvRpfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849872; c=relaxed/simple;
	bh=wLHY1YKwTOtJ5TMOu7Sc4w4rQ5+KEfPEjuD58JrY/gw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dO9VrV5ZbYgAOnGThTkShTy/QADjnUpAu+ZT3p+tufWhsBh23gniTLueNhjyDsetoqC+wlWkqqfRbEqfcxWkBXbpCesmTf3wOtVtJG/AwGOcz+FqtZi8rAU81rtjC5kVBQkP8mMgpRTQoyEHwKm3fxapNAqFt7U/Sz0uxtqQwBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SKfT2E63; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OfT6jpvp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5Jfjr2002000
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tFUu7w/Mdhl
	BRhU4Ur6TRUhTba4EbTByy053HqbjsgU=; b=SKfT2E63EP/LASoR4GuII79LXU7
	OgawffQ6Ze4uvBVmRjBkJcWNlnV4gKIdoy4nBnUgZxbhDFyWkZYCNw9L9SGcnwUV
	/8mZVofmJ0RdplQw8tqBC3GPhBraUEobvJknFAUk/Ff9d/wzTllZVy+83SjNasm1
	fiQnWh55T0nNefHMiWytBWk3s9IABpRXNVN7Md5IwyZEI0Lq+3XtBo9en02D7MDm
	0Vj1wNOl+aeYKd6vDAStj4RVytPjcse/XuWkbAA1G9CdYS4/k+Gm0nV+Q6VJWCUR
	7k1WPYBFH63E4/71cynLiD7aXSzGAtMBr1rETGB+Wc1mYGB+UPBhXgr1wlQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfast9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa366fb79so4228213b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849870; x=1777454670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFUu7w/MdhlBRhU4Ur6TRUhTba4EbTByy053HqbjsgU=;
        b=OfT6jpvp8j14KNZumc28DZkmtUMDJlGw+DgLIrWvtvkz58UwZy+ujQKuKRhekxqF3Q
         Ga93Xwy/0W+5JqVV6lCTNLkx8U5e2QO64WwplWgM0rq98lZuvspX2afvRRTIkLGCzWAi
         xfZ5PnZ2mgM3/aTEotBWjWCgvTkHNttnNKVxG9ctrJ6cO7k+YQSfZ6l/enxm7EdlJJQr
         sUqCIN1yylfwLYMS7wkttXQ7HoYGaC85d2FCI2ts+bGuqKnvK0Ck8+KNsDlBHUrMCSpI
         ZM3hdGTG+Lv+MEBaxizAR1qo1ZRmNkpXR4cL20eodwWHctSx9BlMGC81YLqCrZQWC+vh
         n+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849870; x=1777454670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tFUu7w/MdhlBRhU4Ur6TRUhTba4EbTByy053HqbjsgU=;
        b=tJn04tpb0xZG+6IHERmNOG228/Wj7yJK9CMGUw8NbbSv6fI88w8vi3pfXvqLmZb+E2
         CxPcLAlMDHqyLSgvMkVCnmmV1ICCbTFJwfkguOqFP13sCNDR/hkUmT/bz2kQzaOanYQ6
         IZivqj0PBa/AU/SNJo7XMCDM8XWztjwC6E5+Uvnsz2DzJvselv2b3+2n/F+kIHv3F2vz
         9jk1DU1ZA2yH038g9GHmJZBFQNW7rRw4zEGWOpaXvDhFQjHgo1+W47qJ0NJBCDbJv6jB
         bqU81JhVq1vFPd5eMDLiEizDaZ44XvK5S0nlmEPT5peEY4DSFGtbkj3hvSHV0m3/sk9i
         kEQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/seGVv6tkrgaOy1Y54ich1VYYljUCMLNSg8ubAx8uTc5F97jF5ip3ogTgeEE/xPD8S0lk2wTBi/dxv7QAL@vger.kernel.org
X-Gm-Message-State: AOJu0YwoNkIWZpBuQtn3jcyFNHQJy8HObYIzWgvEccDkr+6Wew8EQqvG
	69EDOMHhz1CVk6ceaY65N2winWtSX/8wECs3ZtSt6RghKImnqlCzfVmxpcALsifh/qWFWTL2jTU
	e98Fyfww9HMTpZAeS0rBswMo158sEKiIH6IDynpbRn0wy89WhZFOjPnxClyFDvpmnZUt+
X-Gm-Gg: AeBDietG3JD3iqcY6DCZ5Mc/BPa51FDCXbP11ow4afYnQNHny7YkyNx4ibTxEs+shZg
	0e9fNiF8eHP/eIuqbG7WfbPd/lBnMyooDme9+QdR2Vw4ua+0gfKatIevQ9M7P5Mi09r0Cu5MXFn
	Ax7MysztDnajzZAI5JomzB6aX0/7EWIZwGBo9x15iOIJ8gfpvv1p/yoaF7933j62Ib8sNhvjDKF
	7QQ0Hz9PKOyYgZnfA/RKZbMNZumOeNqDYgG81YntPxuPDuh1X2XqE0HwNmgvW23a5r3rm0ppNjd
	SbsOwaxKuvioRrPuUC4Zoz+nzqkJ3c6zfFqp3WmXwFwWHCZdk+L/XTGKnOJ2BmnDFb/zI5vLBR5
	yc8nZao6I3wETi0oeffljzkUV8eqBImy/HIICCBmfr7jDSAq+TeB07yZ8sKeVTDrI
X-Received: by 2002:a05:6a00:4b4e:b0:82f:3828:a00a with SMTP id d2e1a72fcca58-82f8c94bebamr22900106b3a.41.1776849870033;
        Wed, 22 Apr 2026 02:24:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b4e:b0:82f:3828:a00a with SMTP id d2e1a72fcca58-82f8c94bebamr22900060b3a.41.1776849869537;
        Wed, 22 Apr 2026 02:24:29 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb38ddsm15778576b3a.34.2026.04.22.02.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 02:24:28 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: [PATCH v9 3/4] misc: fastrpc: Expand context ID mask for DSP polling mode support
Date: Wed, 22 Apr 2026 14:54:08 +0530
Message-Id: <20260422092409.4107093-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com>
References: <20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: r6FDQqpp-A2w-OSLuT-t-F2tLkwLaF-b
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e893ce cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=JTa3dIKMUYn8LlmgGFYA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4NCBTYWx0ZWRfXyi7p6sdygY+5
 bz4VcHhED4Ieto5LHzi5ffIgcY2G35BNyQRy0O+MfP04TmEWFvKVC/bhJIZ8vgCHXeUWRtm4t6d
 Ho8WPogXzM9cN4uy2xW427GARccl1qGlUnYb0F4H6YSKwXQ3hjh1q5Offj60h/WArP0Ud59DqUc
 /5MY3an/0o48JpTDt0J7W0w3Xxjjrp7eg3xUnCR6avjzzfjc5mVwrLciQ0bGTC2MmVGtGLSqbvG
 k5+qRBEqSErNKKkg3rjbQF/ZsM6BfYcKhejCm0bwkfhmG6R7iz6HiytntZW7AL1oA8aNIBR3dPc
 d13pRrT1ma/w85TylgcOUqYUQfo27YLI/7YgUC1RpZgyLcyTdbuSNMclZKzuNKZ+CryyrcbkQt6
 5OQjLcenL26uvHZ+TCQAcx7DIGK7Tj0ohNa2W6QVHuXTHiakCakZR9SB4i0MIyvTLFA7Wl+qUjK
 4MNmukpEPpQ5hQUYYPg==
X-Proofpoint-GUID: r6FDQqpp-A2w-OSLuT-t-F2tLkwLaF-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220084
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104051-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,quicinc.com,vger.kernel.org,lists.freedesktop.org,arndb.de,oss.qualcomm.com,gmail.com,kernel.org];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17F99444037
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


