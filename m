Return-Path: <linux-arm-msm+bounces-104083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJLXNLau6GlDOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:19:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BAF4452CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 647ED306DEA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366903CF04F;
	Wed, 22 Apr 2026 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqdAaAV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kaF0/Y4Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4603ACF19
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856623; cv=none; b=kmHPrqg6DB9JI9f78NULaQgNV+c7TePBIPZEw2dzzz+irOjSm21wn90f22t7WEvUsNikHCDck71oUhIHXMYTTh4/RVl1EHaq4FINaU6o2ogWGbSQ8oNbjOIwYtwsQzCyaxawFIuE+2EGQeJd5VLpi3xFVrn6BBULmL9VDptICpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856623; c=relaxed/simple;
	bh=VC9WposBlvve2ycacip2kliKPfx0sQcMrhIp6YST/BM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CQ9HiBPOYrf+9gZot5Piqy9ztiz9/hekkHmuHxE5y8htMb2dHKXDUA3NP9ruebMDe+HHUxeBYl4p6THxPR/aU847j4z+wh78sAIeBfXtgPvnRZ4ePPpuGHH6s+wavWzxZO7Qa4OD4oQofb1o9SMsRXGeNY2FwGAF591TtqRaUi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqdAaAV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kaF0/Y4Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M99E1b1082101
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1lzMCwbAjL7qV1kx/Xu6U0s693kcoGBTXqWxUmoSiBY=; b=mqdAaAV+7IKvawnK
	iUp1aLBGwDiPYnLfgtZsGh8hpS9EkGQS4vcM93CPdxHKOpFtBYGz2kGCAnLKw2qf
	cDQBZaCfFQ1EZLwFAVhiFVIVpgfYadTnwICvjCF+VSnlnT9xE2Mmdhpykt/+7Dg3
	OQj38Z0Kor19zIijR18RzyHy9aoiLqfQgPuVfl+m5JjEuD6dHb06Q7GbEnHXWJKS
	t1IvM0wG1ulN5RxPFcCIDNoCOZwbN9/Y7Id3p3wo5xjIZUQrYZpWtTDUfigZK2yf
	70FKzK76O+/lUcnM6EnfkwUBt5IawivlAIutY02ODwXjPGKXaZd/wN4odk9nLOU3
	8JYM7w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng35ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76cb2dce57so3183546a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856619; x=1777461419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lzMCwbAjL7qV1kx/Xu6U0s693kcoGBTXqWxUmoSiBY=;
        b=kaF0/Y4QH7Cl4qhMUKNo7KRS46x5mvU9UAm6gHHgZC43w+rpVHdcDGUNfV5z48U0qy
         kVOxh2MQNNS5SIAVklLHZSig7D6vfatqHYEQpJBJhHw0VTjQ2wlD3xv4Gs1Vj0KFJGql
         Ivycc3FzC+qqo+nXI57pEIRyE1JsjcGe9lzdCDQ2FfNiDu79dTkUFxKA6GaXFEjjht7Y
         0dwX7o2g95ZQnpx9gRft2LaG59Yv3q18fK+Gx0lJdkd6ovnzfNyJauQdaK6qCq4AvZzZ
         xUouBK18MwrKjFlqVUIuhQTVy638AVPUdflD5HammIqgPQ09r28dAxebkNDBU5tAnX76
         0ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856619; x=1777461419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1lzMCwbAjL7qV1kx/Xu6U0s693kcoGBTXqWxUmoSiBY=;
        b=AWhwolIBSc4/G1gg0dtFn5ezz0v/saxBqGBpQLfzAW1E2lD3ds2eyFpRhw/7QppL3X
         ah0yHjgJr+zZfZDlJNBbZoTWBO7L4GKbGSZSyQIX0KQvqyzV9HTgoUL7uW5Rl1yUrtbt
         yNjczgWruhKkxnceo6itCFkCylpWExtJ/scW9oN2fFCBKtYlYV7cGodu+NfBZuFDD6xB
         POGDONJqxS3jQcqD/zOuFdUPBxNXg4t9iWpaYvuvR8QXiXnmnC1hDRn7K8IeTaraKrsc
         39eBt8D5Zka9TmSOW+IoknnFcqS06hqm+u1CFKKhxOg+vPChN+qYtCCOPLtw0vh+WHs+
         A9mg==
X-Forwarded-Encrypted: i=1; AFNElJ9P07VE+vVkjwBaaVW5nZp5KyQ4x2hrVB6ICBZXmfD+GaBjreZNX/jANLiaVsXv/a+rKIZsyvUmUS+KNjPC@vger.kernel.org
X-Gm-Message-State: AOJu0YxnYqJGt/wtcKhv5+1j80ZhzxJpbTxfGBzA6w2/vempEZq7KpBq
	1xNu3eD7e/0jUlcjK4ewWsm/qyuRSZkH42+9WilUv4Itggv/5VHM36tDzLVYLPILjgPRuOHAMJe
	lehRcmE0aK/nDm1rzs+WCI/bbC59+P6FreCW/2q7aCOlqCIkCzKapAv3HPrMv6GrwXQ06
X-Gm-Gg: AeBDieuy/eI1697PqzmxqNkMycFT40YJvmTjt7GAEZbASB1l//mfznQjzoxA4kE8Pg8
	1sKTJz2hLbguc4Gbx6Rujx5RBWvHl1VXpPk0UECsP/2TXr7D4ORg0MHCawwMOnSWplhEkdfArMz
	VdU8ntym1z14tMmcNSH611VjM1hxTJSmiV8V65Vbjp8pWoCYj59SrimfuyQojUwaKnPeG7SJUPT
	CNdMttPzFv4RFfKNrzkw0QkHM9Ec5UJxkibe/zMUgBd61nme7r9JomoggjqSWvM84VTEqgx5e4r
	dY3GWSBJybWywT92hN2NnpTm/v+LzXfXE99S8J7SnLwAzHEj9Nc9XhvdvZF66F/NYSeiDaB2QhX
	DJltQdqqOn1LFxUUTiEHg6058Zx6E8P8EkjONmrbvlJppd9SyN7axAR+E/syait6HqyeKdg==
X-Received: by 2002:a05:6300:210d:b0:3a0:d88:6d6b with SMTP id adf61e73a8af0-3a08d90b33cmr25778799637.49.1776856619431;
        Wed, 22 Apr 2026 04:16:59 -0700 (PDT)
X-Received: by 2002:a05:6300:210d:b0:3a0:d88:6d6b with SMTP id adf61e73a8af0-3a08d90b33cmr25778757637.49.1776856618917;
        Wed, 22 Apr 2026 04:16:58 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm21100782b3a.48.2026.04.22.04.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:16:58 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:46:35 +0530
Subject: [PATCH 2/7] media: qcom: iris: fix state-change debug log printing
 stale value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-iris-code-improvement-v1-2-8e150482212d@oss.qualcomm.com>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776856606; l=1218;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=VC9WposBlvve2ycacip2kliKPfx0sQcMrhIp6YST/BM=;
 b=XRyt4NbjzTkcPs9rnszE/7tjuhN52sg/EEloca15RHAHSaBRXfkw4g0GwU2zJzmX02gAiVEqk
 M4AOXfRReV9CCEqJ1oCXjgvecVg5cMWcOh8Un2GA0S8lT+oMllVdD2u
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e8ae2c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xFg6UwmA3-Dp8VzUGb0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: po_8W_7-_m_vGqkUr7CMCJPHBbWpvBKe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOCBTYWx0ZWRfX615wG+Ropmsd
 Wvj3reTVaFjcVMJsllDIvJmrEe/xj3XkEgadUQAvp/XVK0JBb70xR9d2p43dpBvBNXFQfJrdGdv
 UULquqeuMIDKvy37GNtYJIlx0jdX4AAAsLbnpBcdE/XlYo/gIOT3V3+3kvI7jMYyJvhAWj9jDVl
 hil1/Swu/R6zwbhcziDB8w7jKDX+JD7K1KSzmeaXzQPH0SjY7KTlAU2DPVVloqhC0UroPbkB+qh
 dhjPbQdipLr707dVXUTNob93Y7SVxMwgQR68+S6qwq8reETgugPX36jRq23FCzvTiblImyw+EFW
 IJBQEYrY7FujRwIblScFu+D3emuSyO9k5IPSFsAqyJfgf6S928YlVVuIJCSVYCUEMbq2MComVUh
 5gFp1oMSvEXZZto6csgp9v9gjfZTgcv/X8fS9R8Uc+CjukfNoRN+uyaBz2fZo/yQjiomfiv7Dnf
 k2Lv9c1hlW9sPsUP+gw==
X-Proofpoint-ORIG-GUID: po_8W_7-_m_vGqkUr7CMCJPHBbWpvBKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104083-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52BAF4452CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The state‑change debug log in iris_inst_change_state() always prints the
same value for the old and new state, rendering it useless for
debugging. This happens because the state is updated before the log is
emitted.

Log the transition before updating the state so the previous value is
preserved, consistent with the existing sub‑state handling.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index d14472414750dc7edc4834f32a51f2c5adc3762e..e991f34916ec6e74f3d2cf98bd61b8b1e12a3ca8 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -60,9 +60,9 @@ int iris_inst_change_state(struct iris_inst *inst,
 		return -EINVAL;
 
 change_state:
-	inst->state = request_state;
 	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
 		inst->state, request_state);
+	inst->state = request_state;
 
 	return 0;
 }

-- 
2.34.1


