Return-Path: <linux-arm-msm+bounces-108920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAoqEl2cDmqZAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:47:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D63159F340
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EAAC3082E6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFA834E75C;
	Thu, 21 May 2026 05:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpTzfy0M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXlT3Ors"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B3132F75B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342359; cv=none; b=gkS/NxalRuMkVxN2PiozJ8pPciB2n6Mv3Fy5YtYuaaQLAYDnSOD4AF5rLoZNiKG8wKYUmqnBf7mnmFQ3ZCZi/Xti7Br9rhqUmSIA8CZmcBtmS2Ctfb44yWmeU817zooZPiMNQBtzf2XDtp3xXyF6iUpFjufU93mSHqDJvH/1K9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342359; c=relaxed/simple;
	bh=wLHY1YKwTOtJ5TMOu7Sc4w4rQ5+KEfPEjuD58JrY/gw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WbG7CY5SOofbKvEo75niTvjrmdwDB26aOkmmT6X2nedQv+rJ5KOkGfCuZEicC7WEZeqB2CCyB/MTYnPSh1X2a7uB/XJE6clX+LoClkM89HmjPp5n39O7YMb2ZpEh8o9Ug4hBhXc4/S0A+laeuTWc6DeFbFoWpKpT9IPjB5fbCA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dpTzfy0M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXlT3Ors; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L1ImLB2072183
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tFUu7w/Mdhl
	BRhU4Ur6TRUhTba4EbTByy053HqbjsgU=; b=dpTzfy0MDrYxCzoOjM4DFdgB0Ed
	1h2kkQrHkhtDaZ7aHB/xRq7sNFWYXp3yZM9GAvrIi1PIIJBtzu3gNcNyMb3ynrRW
	dSlGwiNQki5fuw3PeQIeghZZg2OkI2w5nyFiB9gCOEcstRAVhm9miNYrLzI4gzOn
	EW+7vj4kQ1RkctB4Q1o21CJOXp6Ewj1a8QkrT9xEKztNQls5XAVpJAzDV0vipZ7V
	8FwhobQs4Jp+IqDYND1fObtmGQhUMIMNJ7AhuRgZQJHA1yt8nVzcN9jO8qM6GPRe
	oCyImXXMCBKywCDa7IVvY5X8yI63R2rGvXgw98FLvJvZsOE+DT+JUzSGWvg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r960tk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:45:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so5131926a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 22:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779342357; x=1779947157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFUu7w/MdhlBRhU4Ur6TRUhTba4EbTByy053HqbjsgU=;
        b=QXlT3OrsaiavuzR4syVZVnFsC66DHl/7zAenb+6nJw6NEgouB0AMwpIV5yuUh3A0Vh
         DQQTU/Y288vS3HC8GycELk8AdALiO3DMEYbAu1er5vxXPPN4zsoPR0kiLxFpQfPX2+X8
         FWbZ3zf1mjp1EJ4Jn5aSxBnFnGGKtapjAfKEVgIKuWYf98bpEWHr+MtHb1mpF5lAojoT
         i+5pARkNFt7Uex1BaLcfFJrExYlLsTdUg/nrhifxKJIIzCMKctOS7Ujf7nUGKd75AqiQ
         chO3AbzzQ/pgdIfEbrWHXwrTKwSm5MenapWi0M6J9wJvEiAcQ6TuEuLpV9O4XWklPp3/
         wGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342357; x=1779947157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tFUu7w/MdhlBRhU4Ur6TRUhTba4EbTByy053HqbjsgU=;
        b=J3s084zuiWQmW5UtmppJYU6oNJ2NTu4qakjtyeCcQlG9aXTJBzyTVxmgj/5wp/bKov
         OPWSeGHlK0sE2Q3sEaWVIQ89MzCaep8Yxm8fl+VTmUioMrghmX/F1dQi8KNBbmgG9sKW
         686N6YafEQnrBAE3P+JAyxTx57nVu4yhLReOgk4zyexfYdY11/ovS7CF3xdcJaVY+w8y
         qW6Z+YgE/yk5znP7wSNBGy99Yg93YYUFpqiaEO5cvgSIlAv7gxML8dYELDwSW3DlzxH0
         5+VZOy/UqY9iY637wwmeJySSZbyBgNct2cOQS0UqiqDuvAqUzv/mP3TZDjxyCoDVqxTt
         LfIg==
X-Forwarded-Encrypted: i=1; AFNElJ8rh1wB6nxe8VDRMhcC1HYkfyT5vBjSbVwMraj1OaRVrOwuNLTRCs+HWZaGXeQkgOGO09TmkfBtDyDbu3WM@vger.kernel.org
X-Gm-Message-State: AOJu0YyWPFq7C1gLF8ZkJLYBX71v0tjhVDjgZRW/VI7bmlTfxWqfguuc
	L3DnifeyY48LXS+3SNEXm3RniKt4c1hLjnvJAbn0sT1aHeUPqZwPRB8f6Bi4ZtSvrAA0zroX8hR
	c7PEWxCnXjVvqRqQMxnYdIHnSagoP8FdUZfX6INqArMQjADNq2Aplpe4t3w1XMzN5B8eF
X-Gm-Gg: Acq92OFjp4VWdoj2rrNV/0hkttMLFKFDsSi8fbdo+TFStYpdFA5HIgBvp80ydZuNWoH
	tDuYTaYx5Xp473Ld5Qyz/JXPUJA5p+JBjF9LQroxb1VpldnfiTC07X+/tdUWzz+wxL4WS+EoSXP
	oMXOuMuh5L9d2G4ez2lJsd7o6KYSU3R2Pk7qv79GCoWGLyOfr//rS2lBKE8LlT+43hYoymWS2oL
	GUH7HzSHL7KxnYILj1SOPN/6XDgHXpPlu9KgrX8bgGavmty3aqhk+G6Cji7vNU0aQZw1Z5xIm7l
	4vMwS0PtyQ+nEIsuFw2ywgrsECvR7fRfhCTYFH8t0D81aTOOzQUVd60BpBzllpmmq86RPtNN+C8
	uiDmdHWrV4jpkLpcoDNZk/pAjaF1z3MAXe3Z3KWD4z98LCqR3hfdzLQ==
X-Received: by 2002:a17:90a:dfce:b0:369:a962:8cc1 with SMTP id 98e67ed59e1d1-36a45130fadmr1415884a91.2.1779342356659;
        Wed, 20 May 2026 22:45:56 -0700 (PDT)
X-Received: by 2002:a17:90a:dfce:b0:369:a962:8cc1 with SMTP id 98e67ed59e1d1-36a45130fadmr1415857a91.2.1779342356200;
        Wed, 20 May 2026 22:45:56 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3cb323e3sm1474847a91.4.2026.05.20.22.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:45:55 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v12 3/4] misc: fastrpc: Expand context ID mask for DSP polling mode support
Date: Thu, 21 May 2026 11:15:38 +0530
Message-Id: <20260521054539.128651-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521054539.128651-1-ekansh.gupta@oss.qualcomm.com>
References: <20260521054539.128651-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XHcExgFdx9mgLzrJ3AwdFQUdM3GSJ_7X
X-Proofpoint-GUID: XHcExgFdx9mgLzrJ3AwdFQUdM3GSJ_7X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1MiBTYWx0ZWRfX3tzi3904m0nI
 lp/KA0SqzO8Id/+p8oiQiPVlvEHaBabdPfft9UBT4hSXKZlKhzzgIZzTOKTDZn0oK3iLZaGSRhY
 yxQvR6e1A/W47/Y1QcwZ/bfbeekv8i+L5ilnGjaV9FMPG0LD0rWgFIay2Rfq0zHW4/a+UOkIUVU
 r4Qe1GyKkFJit3cMNks7seGAAJCFk7hl/0CWSq57R8zTHE/sM+tFAZhx80WZV0XXl7a+YlC1pFN
 AphGk6Bh0SApSmRE9tpCCAIpiDzI7IAHXFTDm3EKyLBv2mYYscGt+r/3vWa+SCczPnOF2bnSHjE
 x+tiFmtrLG+kHEtlSbV6Kn936vZC/p/DefP+B0nXr5laQhU4hBKhhl0y2ljg+G2AY6atKiJsYPE
 z0rP1VNKxo1yA0wj52K7Vxvi5N+FAoMnAzplHZFEUYRmOaNrEKTDKjWpJCohfKhBcRuY/7Hurc2
 LRWYUeS9BcdWK5seaKA==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0e9c15 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=JTa3dIKMUYn8LlmgGFYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210052
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108920-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 9D63159F340
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


