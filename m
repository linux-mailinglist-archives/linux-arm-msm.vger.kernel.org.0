Return-Path: <linux-arm-msm+bounces-104087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIZMG7mv6GldOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:23:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE7B4453A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 995E330D3CD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA493C3448;
	Wed, 22 Apr 2026 11:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCMKw/MN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXZSZEfH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE7D373BF3
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856638; cv=none; b=qe7rK8ZPwgISdI93qnoR5bHf8X4UuvVjn9SGCrYh8G3UHhLXw9L9NPUOuKdtzicCXBlFrzorUHZE/mia7TSR6i9AD9JQI3NQVch3QI+OAUqrtZi60L1MdVFH10kgdIIz+KIs3SnFZ06w2RO2dLwrgrrfcPgCIiNvvYqjie31Jsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856638; c=relaxed/simple;
	bh=g9IR8KnHH6+1Tmoj7gb2YK2cNjAd/VRLFVaxwWPe/vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kt7RAjXf+5UOqzcEZQV9JvEqag0CtCPid0aekO8WY9ehG2iPyCJXRRmiEAatQUWAcIrHNlHNZU5yCvArTBbmhkFLRZ+9pHmHJw5DqSr5cmaBDSmpRsRfJg+6MQNarQZQybV5IYTjD72YSn+MFf8LiD6qiIJ88yvpdv2fmufY2QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCMKw/MN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXZSZEfH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAYFbE3083500
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Km58GpJkLRFDB0UlfVyXA5qy9bxrBogWZ7Kd/EqcNDE=; b=iCMKw/MNYv7m1xB6
	UaoGnjfHWgbFh+KnxBBd8ancih9iFc0NRw22cKtzIt2AZyhJpW9uIHg6SskpysvX
	SpImGjlzOgLEYNq+jVnh7cEwtk88y02/lqJX+ig+qvBEkjwc35DX1GoX0QooXRRk
	XFr7Z8LH7FZnJAxoEJ0E7n0PDYBCq0HERo97s4V28ZE7fXYMb6ofIdmweP8uBnao
	IEBye4cQ29AwzDJK0TE6iocaP+vklsXTV742yMWFpQBDxNyejsAIpquoGwzniwrk
	S34oQ8Gb6dAy3oIP+vgo3m4NVMcyc66jo4WPVgW4oOTgvMfCGq6mVkNZ7frBtbcS
	La/DQg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmk7td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso4881502b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856636; x=1777461436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Km58GpJkLRFDB0UlfVyXA5qy9bxrBogWZ7Kd/EqcNDE=;
        b=ZXZSZEfH9QhHCCm9xnC7UzNuCANdVc+jZBJ0xq+VOM0W/pL9WOZAbPzOm4P+9RxdiA
         nZxUDU/7cs0LbWsiM5I2Bftbk2sjgm6ANkliXrKb8p5ZcpYFdydQFsw05B5EcRIhJdM+
         qCuPebVIhsaukuwM3mvD203avIqmO7wKt4Gk2052y/JL7fsM+eD31ltXGzFpr0BzOZUr
         /+RNZMpOEnwiSPQjKPYS/zf11h6nojAYNqg/ltxl1lAQhXOtGwdBCQ8+SfSgu/xCh+fl
         9hmfFV2tVHvpIjhzEorSKvOUznoZsZBQ9imGiJHRcnafQpwXIpshdaCe5owWN4NCpVuM
         uj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856636; x=1777461436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Km58GpJkLRFDB0UlfVyXA5qy9bxrBogWZ7Kd/EqcNDE=;
        b=TDo6boRdaznoL0l/9RYWA3NyJIxdezFderpI3vusgLWKwLZ0wsqag31OuQJTdStvyM
         kW2Z/RL9AbAZr/3Dm5tfEqCNk3NJoJ3E8chPbHXwhGm+ERs9srkjjxQ6bHr7Pr8Sja85
         msC2hr+KKsdlxYQTjzFO84GzoXIyyvU2IGeqWvGaGPixLFMwOLhOOJMc9QXs2AmqmG7k
         Y6vlUT0asz/Zqc0EE7GA1LEJyMR9bW/WsxlfX3yUlH2KoKmELtuAy34VRxv7NOVR31nD
         QMERcPk3sNq4CCzDhJx+FNxXKhZC84Hrt6BSt920WM1A0bRQYUtuSnxodrZB0yT/enf5
         8fjg==
X-Forwarded-Encrypted: i=1; AFNElJ9i0PfiUCVFEIrZXSvYbPfAa1XjbR/uz6BYyv83uwycQ+8jQuQWOWwFPMxqs5TelC8j8kNt8RbRySczUO8M@vger.kernel.org
X-Gm-Message-State: AOJu0YzbCdzxteKuq1OlTLduB4G+vLiDmZkF5JtkPWUsxbJNWXEpNzeF
	HPKrd7Rs61cQGNfNXzfOSkjyL4egq0pcwcACS8iItXzrIqYban0Fzec6swl0XNFDCTGt8829h1U
	k1niU4LIBERJwOhEkc7t5Iu+XCu8NQ0Eghebwhb8sjYHR4eFbfUHSeZ2SGgxX5TUzcD9L
X-Gm-Gg: AeBDieslJehz4eOnSWCbt/TVPCGrOxuf4OKItCuujPcDy/o/y2GTgJLZ6c27afDB/Cm
	FMqANf/uIwDsMuRZ9txAP6JlDLkETro6hwrm+++A6u5wb1DhitFePVZ8it/MmXiCI5LGuWelQ1g
	6dgZfj/SMEI7Aj5RvyfJvp1+MUlXbxcFgC3LdX9OCA8adzQVNRCSF6uI/KfY7AG3F1sC89nz8Bq
	O24VnYAodvVZvT0xghWzJXuFRPOgSy1lOxnWxWzXJIMl4AWkGlELuClcPQ7un4gfJNv520RR5cX
	EP/E+J/28B6vrwlhIP9W3uoP6gfMkYBcHRaxqmGQnU9r3S2OyzY7R0dZFJa9NKttDxU9UyXs/PS
	nKxT5WpGM3kvA8UgC3/470GLYe5148nntq4vHjqYm2Lzepy6roa2OBfnZtIgxUoDicPc1fg==
X-Received: by 2002:a05:6a00:c8b:b0:81f:5037:a317 with SMTP id d2e1a72fcca58-82f8c852deamr23556158b3a.11.1776856635985;
        Wed, 22 Apr 2026 04:17:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8b:b0:81f:5037:a317 with SMTP id d2e1a72fcca58-82f8c852deamr23556115b3a.11.1776856635447;
        Wed, 22 Apr 2026 04:17:15 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm21100782b3a.48.2026.04.22.04.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:17:15 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:46:39 +0530
Subject: [PATCH 6/7] media: qcom: iris: Add missing break in
 iris_hfi_gen2_session_set_codec()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-iris-code-improvement-v1-6-8e150482212d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776856606; l=976;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=g9IR8KnHH6+1Tmoj7gb2YK2cNjAd/VRLFVaxwWPe/vs=;
 b=juH8HyrkSGURUlxLT/h8aMnPuevI6YYYK2DueuFH0IgBoBEtOvTxCX53QeJb2ogHWvDVr7huo
 3MdJeJbF5n4BTigQ/BqeWUxZzytQICjCxbrC2MccDduq7f5i+pFCv1A
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: 4_Jir20swR8Ckf9O1b_s6RzMJqBs5mch
X-Proofpoint-ORIG-GUID: 4_Jir20swR8Ckf9O1b_s6RzMJqBs5mch
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOCBTYWx0ZWRfX7N74vKyVxmlP
 t0zPqaPRoW/Sx7jl652v7EGsBopssrdEDvsJi78jYZQH9Wzk8ROEdXvQZ2g6n1gTP9F2qN2Ifa2
 Z8i1ZdQucP+DmN3L4X3naHoXQP2Ynn+I/n++EaKS4vxpNxA7FKXVQndmMSnTqwsNaIOGqK+x9Bf
 6RlkOX8+a3gcp2thzgR+vvkb5ag3mi9/S2cQU330HfeT/4ZfJY/leTUJq8c1WhR1BKlfOYH1mzf
 DwEDCfTouzC5C9TEO9ZZepMH5DQWyynRBkQU6e+6aKT5EZcfvuh/UNFORcmRPfN/znfaVwZeTzY
 uqYV9Q4XvgqyEYjh1e3hH6PdOUmAQAUzzMiyEIptlBYxo3mpRtPbLB3NhqxHGiBUjzFTtRQKWha
 9T7uS7aUzDGrx3s6Kz88zEUxi2p09EZ0tyJw4JXiwFXg7U/pQcyYj1s73kAuaVIKbbKaveR9qMN
 GKz+mWKQaOgkx9Z4vdQ==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e8ae3c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TZpohm96M3O9q7pB9U4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104087-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFE7B4453A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Without the break the AV1 case falls through, risking unintended behaviour
if new cases are added after it.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index dc7acde1913e65eb39734702cb164bb26b8ea6c2..494c8d9fe14b4d347fcc3bb3cfe494365de360d3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -696,6 +696,7 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
 		break;
 	case V4L2_PIX_FMT_AV1:
 		codec = HFI_CODEC_DECODE_AV1;
+		break;
 	}
 
 	iris_hfi_gen2_packet_session_property(inst,

-- 
2.34.1


