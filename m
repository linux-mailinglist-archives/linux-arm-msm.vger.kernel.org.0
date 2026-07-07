Return-Path: <linux-arm-msm+bounces-117151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wdf6OHueTGqlnAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:36:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 44762718053
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:36:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JVcIu/l4";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AXyHhf9D;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117151-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117151-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B7133041681
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EA139DBCF;
	Tue,  7 Jul 2026 06:35:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849A63A9615
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:35:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406157; cv=none; b=keNQgdFKJ5zEJMbkwJMSrhXQFPe+EgNeW+IVoODFyhcX3lIxdqyJ7LOI+OCqS4p84iGKdDo1h4LKtI6mdyWCHaZkx/M5xYAWTIVBYLZckMUvZ3FRb45rCTphW4P92+6qhG0H/DTWObmPk1kZ3o22x4aJy0AF1cxLY2roC9feYY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406157; c=relaxed/simple;
	bh=U+OZ9O1Cs+CPXtp/C14ZFK3x9+t47Sd15lZiuTeSofU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DRnMjMxgPp1RWFtq4bqDboDNoV+KQSyZyn9pCmGkC8+kUGOzj7MJFpqiRW2GzLhGV7y7Afo3htDTjnz3i/S88CcHVUYEtGdaSeNShsuiLZKXpIOnkCB4fnfszNiJAvV9GhW//6Z1z54iyicG+4LMbJ6SJqhqyf0oWpLO5gWvqn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JVcIu/l4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AXyHhf9D; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748h5Z2514399
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zld39roC+nUCFK9u4JX5pNXWgjY0HSPQafKAjriZJPg=; b=JVcIu/l4a12+QGYm
	sKCi/dLtHP+8i1Pn4Zm7dk2d/WBz6mFp9qnQIqEKX/+NVH1rRAElPYRlB3tJkqvi
	E6Q+bT000KN51AhsV+Ugx4mlmPgoPl8KKG1IoFFgaGX3hYqX4+yYgaQMn4b8aDHh
	Qq9XspUmB1OG4f/WwZ1baUlug+ojSsz3pTDUwbk/B3vdjQ60IwD073zvXl1jfDLR
	tNaXrYHnIXtWvqcoGiFj+fbUBzsjJRJ9kOyR0ZIl5VX7i9MCKNW6guHXZlTQ9Q9v
	khF4+bew0RLqSmwrMJdd6DobhhTtoXn0WvP1yzeKCc5OZtp0uK+txpZeCjnEEdAJ
	Ft64Ug==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8gjnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:35:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847a483ea41so609104b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783406154; x=1784010954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zld39roC+nUCFK9u4JX5pNXWgjY0HSPQafKAjriZJPg=;
        b=AXyHhf9Dwy53WuuglvCnm4VTlYuoAVuOvkRKto2MpHZi8IpbupX04Kb82kiYehAZe/
         UgWA/26URlfESHhEv6fTWgc9asYX9xnKPLKwH8tnO0C99H71CTcLmIUimzfMQnmx+JEE
         fba8jCtZH+/kV3sPXojq1vykuIGs4C+EtlS6T018whtmQWLLYXo13bN7fPePkiFU3HKG
         N9gQc20C9ctEVgqQs5Ykjdlhyz1+VST7b53tLm/0z6aP06sq/oaq0GwTnN/eMhgskk+X
         CswesRHV0UQ/O3rEdmbw1r7M1w6456B7aMoZJ67xgt1LhQjQE2Cd+DoX98WLUKq6DU7b
         LCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783406154; x=1784010954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zld39roC+nUCFK9u4JX5pNXWgjY0HSPQafKAjriZJPg=;
        b=OFM9t43JiqoXF/0ruHrNz9rlm+dZVeZMYcTImqhiMu/lwxGc71Q7M6HVNJx+vowjNF
         Ef54wa5GeaKYqIzqShYF1xXbN5UhJaI1xZKJczgZfwZ2UjEgKv7nbmOEzz4yzkWD6JeC
         77q7OwN2xuhT+JvitgO4Tj1tSrskiK1vYwxtoUqt6Ru+3EXpktbP+/Im9TcYHuPdgAJq
         Ed5/PBXlR0wf8ysHctoT6bIJZBOsDKrkiMNFsjY5vAjgZ5TXOvLPFukAqaXQ5OeKxnIv
         DIoHFKS4BKSyDejFZ4+HtUK9hT5CsUwZtSUGaZwCeH2AIp68w9M+z+4+miAhBm9LMtCP
         2z0w==
X-Forwarded-Encrypted: i=1; AHgh+RqsHp5gJXyr/V9YQ9MrDOEFACNj7yFfTUJx1aM0J2YefkWwtoJrs0aBKPO7OVsp8qyeetIjMylllKKhHNcH@vger.kernel.org
X-Gm-Message-State: AOJu0YxvQy0aIcZ2kfpi53u16R54d0FUsfyZ3dKBio1KtaXSW4udeDy1
	A6CJfzrpW8T3XaXL4/2KPQ4uDhnZWSrR7nfx0aK9p8Z96fF+SeQOfl0vEuh75o/0CCNf86ECOj6
	JqmeULAGaLb5OIYQi9zHes9UHguiECKHtMo7UsyC5LURMrZJ8Thp5eLQdBtH1M4mTbkYD
X-Gm-Gg: AfdE7cmboo/4+mDe7WoqzXnqo13zl0TUZgHZV0TLWH/vPct/+J9ehAz43KN0jdjI6H0
	SC7xYlBMBpP6qkF6MSrVHrti3GiIxhRXLJHsukjA6W2FK/Pu1t0mHtKOiXFh6OKlQppPLvexJDR
	dDAtpJoCX9zBoy+2A9fd9o9CT6ageh0xF5y/FR9W/f8EtTObRrYWoIBVD+zyTNrw9e3Iqhg8vAE
	VDXIYyHMvmS8+V6P1gdyxA/KZ3CBE9f8zm0nwHRXXC9mZaLPq/OhRKhqf43bueWy6Lc3OpvLEMQ
	01/J3ETe3U9z1wMEzx9yWShephrU1QNbWoWt44zP0nskNBZL6fDKgnxZShqfIdpkCEIWL5xhUfv
	VMdH1mtrqrXjTapkOz/887dknQ3KWjEK0tTOCgg/aywRX
X-Received: by 2002:a05:6a00:3698:b0:847:9515:9296 with SMTP id d2e1a72fcca58-8482f2bd6bemr1324396b3a.6.1783406154026;
        Mon, 06 Jul 2026 23:35:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:3698:b0:847:9515:9296 with SMTP id d2e1a72fcca58-8482f2bd6bemr1324359b3a.6.1783406153480;
        Mon, 06 Jul 2026 23:35:53 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm4889973b3a.53.2026.07.06.23.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:35:52 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 12:05:24 +0530
Subject: [PATCH 2/2] media: iris: disable time-delta-based rate control for
 VBR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-2-33fa130bc535@oss.qualcomm.com>
References: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-0-33fa130bc535@oss.qualcomm.com>
In-Reply-To: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-0-33fa130bc535@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783406138; l=5488;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=imtBPLnerSwb3oU4/NP33rvM71DYb2DBrfePh2rdoG0=;
 b=kosY8GPm0Ihdmjo+jq8atYUt24v4SVSAKvj1RZezUxduwwireEtemc5KWM+CJzyLChFALA9re
 WNI8oN+SS9jAI7wGF8xP6cTh+/4Af/B3c3m8CGYJ3vB14QFzegr/dcD
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2MSBTYWx0ZWRfXyPj72bKuOXCw
 PXksF7TbuMgsL4q9Zrp3eA/ufoBGD4TuQjMv6ilJYXZ6KYGrauySBonMmn/zxCS3rwLx77hRYhx
 mnsd34UpXNtZi63TtlT7Y/NvegyHKkEkbKjzhD4mC2BKwY0Fk45xnRUhkChf/pSwQWwU+bX6Frr
 j8Bt+iZEeRTutPP6QhIlerjCOuz+Ld+VMjAMfwO8cZ8F6ER7yJzd7gTZrm0YyA/HuNyTw1tZzQg
 +hSjJJ7scoc1YD1DmJVP67WhtWMpPGvG+SazdlzYz3Qwrr0kkxGzBo/YeUZI2K8JEAUhRUV+K6L
 6/fhI6EoY8d/I4DFV2/NArt7l0lVgNbfreGvlV1O88iv2ZnPzZ8HM7ssMikl2xqnmdia6TGhQRB
 bZLe7o3Bap3ngSOW+5Y+pftUOO8/y+x/XnpDrKplZY6zBZNh1EqCu786GW7tXMPm712T6EaG9RT
 4J0CHRc8bgTXsagosFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2MSBTYWx0ZWRfX+SgK+cVbEPU6
 QLuj2XKvtCJYcT4Q2wCN5lYW3Hk+kQMZ2iYqO5ioWQp+65ZheBlv2YpklzjV7zMYy/uMD+H/V2w
 1OhowfThq+eIeEUprdNc0vHyfVtq0R0=
X-Proofpoint-GUID: 0TbvVl9fgeORWYJEl73xudw7DHvBOt7R
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4c9e4a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hCni5AK2fHxqBZM7pzMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 0TbvVl9fgeORWYJEl73xudw7DHvBOt7R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117151-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:gouravk@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44762718053

From: Gourav Kumar <gouravk@qti.qualcomm.com>

The iris encoder driver was not sending
HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL to the firmware during encoder
initialization. Without this property, the firmware defaults to
time-delta-based rate control (enabled), which calculates the output
bitrate from actual frame timing rather than following the configured
bitrate target.

This caused variable bitrate (VBR) encoding to produce ~5x configured
bitrate. For example, with video_bitrate=896000 (896 Kbps), the output
is ~4.4 Mbps instead of the expected ~896 Kbps.

Time-delta-based rate control is designed for variable frame rate (VFR)
scenarios where the encoder adapts to actual frame timing. However, when
an application explicitly configures a bitrate target, the firmware must
follow that target regardless of frame timing.

Fix this by adding the TIME_DELTA_BASED_RC capability with a default value
of 0 (disabled) and sending HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL = 0 to
the firmware during stream-on, allowing the firmware to use the configured
bitrate as the target.

Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c         | 19 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h         |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c      | 10 ++++++++++
 .../media/platform/qcom/iris/iris_hfi_gen2_defines.h  |  1 +
 .../media/platform/qcom/iris/iris_platform_common.h   |  1 +
 5 files changed, 32 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..f6136e655b98 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1477,6 +1477,25 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 value = inst->fw_caps[cap_id].value;
+
+	/*
+	 * Disable time-delta-based rate control (value = 0).
+	 * This overrides the firmware's default (enabled), ensuring the
+	 * firmware uses the configured bitrate target rather than calculating
+	 * bitrate from frame timing.
+	 */
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &value, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190b..10e046722ad3 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
 int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..d119ad599c31 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -416,6 +416,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_bitrate_mode_gen2,
 	},
+	{
+		.cap_id = TIME_DELTA_BASED_RC,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_time_delta_based_rc,
+	},
 	{
 		.cap_id = FRAME_SKIP_MODE,
 		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 776b21cd11b2..8766d9e49611 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -67,6 +67,7 @@ enum hfi_rate_control {
 };
 
 #define HFI_PROP_RATE_CONTROL			0x0300012a
+#define HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL	0x0300012b
 #define HFI_PROP_QP_PACKED			0x0300012e
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..99dc6d5c72ba 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -183,6 +183,7 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	TIME_DELTA_BASED_RC,
 	INST_FW_CAP_MAX,
 };
 

-- 
2.34.1


