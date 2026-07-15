Return-Path: <linux-arm-msm+bounces-119289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U01PHaKXV2piXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 16:22:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA05375F4F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 16:22:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M5p0Eo9L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dVIpSE86;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119289-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119289-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB21F30C38DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD78230C15C;
	Wed, 15 Jul 2026 14:11:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8C8374197
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124667; cv=none; b=ngYFj+K9a4dpcR0LA3RHG1zt66+NQbx/z/iFAhrakWHuyf3zkL9n2TzUnD6MPp13D+42s3MapGSkBwRc6FdA6RCio5hRUW4+ZdCPWKOZCEjnRNEsBeCjw+rNCswKBYtnOInfmVkLjRITk8OQkmmfGZwrlLQOfjQo4bsRXrXZtSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124667; c=relaxed/simple;
	bh=D+I3piFeCESGPcz/eI+7CcWTIabAW6H9hDCT776W4Xg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gVRJGy1m9WxOFMJlydN+JH48gbjF+ai3yjtrelB80QcMWFZMaaWNzF661OH4ZMmeQrBxf9y1r5ZJTKLAyLWfF799UTKPqmt+VErhD7Bkz3SdkiFI87nLl3bHtKUq9UbfTmDSvVZ2dFxhZF3zprtVp4XnE9fKk8b2YgpZ/nCe3IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5p0Eo9L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dVIpSE86; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3Zn3850935
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfmP+DU02dQBazhbUiwzTHTt7cqb8LqUf1X5ED+Ub1c=; b=M5p0Eo9LK10M3x8V
	reHFbhuy/i3Qlh/j9PlR4KySl9NVerd1BTiTtti6cfgXk5IVHW0rCGabKJ2mWvFt
	cWG5ra2pZ+hQ7Od8DJT/f8aTg80VEyg+O/acBHWXEm631LqELbDajyR1KFABOBLC
	EzOGDtLvoDdB1upJVaDa9ffCno+5JzPE0K+fhUxGXn7bW3uNgwINrxf0/lsYMAzf
	Lig12s0JOawGVhGprn1nAYed0w63oHETAJDiwtnVDGUBaozAuYitIbmS29yT38wy
	VByqYqD1oyrlgX1Xi7phqR/1vEtgnTqK0aDSZai9jK5RlvgIgYEqMpoT0NBkc9r7
	noF8JQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68wsefs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so65798595ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124665; x=1784729465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfmP+DU02dQBazhbUiwzTHTt7cqb8LqUf1X5ED+Ub1c=;
        b=dVIpSE863cm8TU7YpLyVXlxBWfaNlQwiqs0z9OEVjoRkjEyyV1yo3u4HeuyP2nSDGY
         JR6G/MRezwPR5udHDqrXOx7r+P9O7JjBebpYpx+tVx8VKZAhg08rYiKY9yOG8kmcXqth
         o9G7Ce1ocDfymUm8jr0WsmGFIi9/nnH6fWvRr41iKcwabXz/KIU+k2wQRwLJbaRu7wyy
         CVtXnCDI1lXsT9+LYmCa0kb17vpcqPJO7z/p+VKyQexuJUr3K3vOCtMfv0EjPYJ9TEI7
         msFg4aKkzThWoYRRLtvjD7dei34VeEgQQeXEafMA+BPROuq3dE5JVUGz4jpy8F2zxx7M
         Fxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124665; x=1784729465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfmP+DU02dQBazhbUiwzTHTt7cqb8LqUf1X5ED+Ub1c=;
        b=MMdw1eZ8a8jYfely2/u04BrooXKm9C64jvurIo0u4ZFG2IaXdLJbIxOW2Qi4Uv5pA3
         PlgX34DEjA63Gkdu1rzT7crGbc6iXIhWVRMiyzhZR1+8WVJCaxamPSvMG6vBROJqB6Je
         GgVMG9qbdbYmahWqKniK+f6rgdWl6xunUEUlJPJTY/JBaq1VLIelRE4e9I/jcvkJi/rR
         Hs1Ph57Ch/7AQrLvbVem/3GvakOn9mO5aKgbmjDUCmUhFfLAPj30mRxBsBxRo4IRg0ny
         5td+6b+U9ejfhtQCbnxN6xZK2Z1RlqLf0X3TvkPUZ6PESX5XzNXgY55P7XyVykozpCNA
         9tSA==
X-Forwarded-Encrypted: i=1; AHgh+RpAv09skJE7JFXYj3vW88wcaYDSoHxd8ro4cacLw8bVwaVtIh2Mx8VbhXqXEaUsBs88XT6rBWR4f01uGWtx@vger.kernel.org
X-Gm-Message-State: AOJu0YwOrtfQOxOTg+SB/Fym9kDBN8eiamsAz/3iCWq7q3Ot9lzvd/TO
	Syv9WjTfjxV2ojJWG47Z0tO3mf/lGbYQf8vHRkBzQy0IFsO3TVu3FhdaaILiqg0gv5Z3FRWYvYm
	frHSvUYDsvQrR7X7PCXFlkDHEaJ1UQA9h5dxwnTjpAbdGpjyKnnd8Vd7t+MA/vVT5jfrS
X-Gm-Gg: AfdE7cmHu6Pt0KI9eC9KYwiCeeRxLyAzqpBd3eWaK58Yd/pyg9wDg0uliBhEb85Cv2+
	kgwsvTCDqBNwmtOYlCOS7227Y2PlB8KAQbs85iln64Aa8WpvG7yQyJG3vXzKGm6L19bAK4V+Ire
	QSoMXcIBUZJoyz7GFehgIlCYTFlWS1njZHispCH8HApu+MbXE2xmm8a04V50x6/VfAUSPN3/6xu
	OR9nVTa80rpMALfuPegg9jnYs5a7A8IqLlcozMNJvJbQsS0O5RJFCcUEo6u7ww5eLWOOpGgg0Ub
	sIW9XBAlFZowlHRB8mUGkvZF9gN7igI0278+o0B0zM9Qj93HVJOiAkWwYWXwV9E00oOQpgY1hZS
	6xQJ6g9ksXL/CM1d9ZU81Qoaap0z92+XOv8EpW6L+KMN4
X-Received: by 2002:a17:903:19c8:b0:2ca:feb:303b with SMTP id d9443c01a7336-2cef143a620mr81040585ad.25.1784124664548;
        Wed, 15 Jul 2026 07:11:04 -0700 (PDT)
X-Received: by 2002:a17:903:19c8:b0:2ca:feb:303b with SMTP id d9443c01a7336-2cef143a620mr81040035ad.25.1784124663930;
        Wed, 15 Jul 2026 07:11:03 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:11:03 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:02 +0530
Subject: [PATCH v9 08/14] media: iris: Add power sequence for glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-8-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=9727;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=D+I3piFeCESGPcz/eI+7CcWTIabAW6H9hDCT776W4Xg=;
 b=CMIhHzkz7LGG6Rj8JOLfZyTJee+ddrLeso5QCLWlV7wV+VlA5d9LO+epM/wRcqu6L4CTNmuOn
 V0kZ2+KXFeWCfbE3CNcQDItwDW309y1ZgahmSWSfSQftBR+mTanAT3U
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: qbCT_t2cHhhRrRYSZqDXHe1JkS9EAWZg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX1f89jwtRZFxq
 gF67ecw2tBgXUcCzq63qFY8nGWi9hQSdKDLARWCdGwKkw4cqqvqeNEkQ/jCcy3U0wPkloMG/6jI
 kJoorjhdYn9sR20kfus43SQhOodL8J896KnYdWvj+lntWPUecZ7rkTqgSfs7dtDUmiPLPv9Bz3G
 9b4yMtCTEwcdFLXnurb6SB2/IZsZkKz9otJfe/TehOON8Trob11KBFhkLs2SIW8u6nBzcc59Jr0
 cICnlEE7hnaQHVC/sY1hnFsPGAtyfiQObrKT3dRrJb5iKttMK5QvPiANPX+5fzXCIlU3E9O/Ly8
 dTF6N5n0n/OViioVNAI3rdJEhxbRtbnnzZaol9ytuz74B4Yoz1ryAvKL+H6WiPkFpzKymuY7nFu
 2Y2gXIzxyvwzBPsOWFY/zL8I+0du9YgH4b+zzeyuVwq5n2ZAfTj1d1RUSieOyRVpoc9lZ0h1hm1
 X3oa9kGgoYq0OXOzYTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX5PPbRJQTjeh4
 F4328P1UQVOtByIzc2wujVe/NpELg65i1KHRDvzfEn+TBPNuez8j5OKDIPyFrHjNPvVaXI4F/qh
 07BhnNuDrPuYxUTgwybKwHsO0VaCiWE=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a5794f9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gBN5huzyN1sx2lhoZCEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: qbCT_t2cHhhRrRYSZqDXHe1JkS9EAWZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119289-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA05375F4F7
X-Rspamd-Action: no action

Glymur platform has two video codec cores: vcodec0 and vcodec1.
Both cores share a common clock source (video_cc_mvs0_clk_src) and the
same power rails. The clock dividers between the source and the branch
clocks are fixed. So when both cores are running, the source clock always
runs at the highest frequency requested by either core.
Since both cores share the same power rails, the power corner cannot be
voted independently. Scaling one core's power corner up or down would
directly affect the other, leading to under or over-voting.
For these reasons, both cores should voted the clock and power rail must
be based on the workload of both cores.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 131 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  12 ++
 3 files changed, 139 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 7cda94601555..4894cba62677 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -17,14 +17,14 @@
 #define NOC_HALT				BIT(0)
 #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
 
-static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
+static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core, u32 pwr_status_bit)
 {
 	u32 value, pwr_status;
 
 	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
-	pwr_status = value & BIT(1);
+	pwr_status = value & pwr_status_bit;
 
-	return pwr_status ? false : true;
+	return !pwr_status;
 }
 
 static void iris_vpu3_power_off_hardware(struct iris_core *core)
@@ -32,7 +32,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	u32 reg_val = 0, value, i;
 	int ret;
 
-	if (iris_vpu3x_hw_power_collapsed(core))
+	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
 		goto disable_power;
 
 	dev_err(core->dev, "video hw is power on\n");
@@ -78,7 +78,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
 	u32 count = 0;
 	int ret;
 
-	if (iris_vpu3x_hw_power_collapsed(core))
+	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
 		goto disable_power;
 
 	dev_err(core->dev, "video hw is power on\n");
@@ -221,6 +221,118 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
 	iris_vpu33_power_off_hardware(core);
 }
 
+static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core_id)
+{
+	u32 bridge_hw_reset[] = {CORE_BRIDGE_HW_RESET_DISABLE, VCODEC1_BRIDGE_HW_RESET_DISABLE};
+	u32 lpi_status_active[] = {NOC_LPI_STATUS_ACTIVE, NOC_LPI_VCODEC1_STATUS_ACTIVE};
+	u32 power_down_prep[] = {REQ_POWER_DOWN_PREP, REQ_VCODEC1_POWER_DOWN_PREP};
+	u32 lpi_status_done[] = {NOC_LPI_STATUS_DONE, NOC_LPI_VCODEC1_STATUS_DONE};
+	u32 lpi_status_deny[] = {NOC_LPI_STATUS_DENY, NOC_LPI_VCODEC1_STATUS_DENY};
+	u32 bridge_sw_reset[] = {CORE_BRIDGE_SW_RESET, VCODEC1_BRIDGE_SW_RESET};
+	u32 idle_status[] = {VCODEC_SS_IDLE_STATUSN, VCODEC1_SS_IDLE_STATUSN};
+	u32 power_status[] = {VCODEC0_POWER_STATUS, VCODEC1_POWER_STATUS};
+	bool handshake_done, handshake_busy;
+	u32 value, i, count = 0;
+	int ret;
+
+	if (iris_vpu3x_hw_power_collapsed(core, power_status[core_id]))
+		goto disable_power;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value)
+		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
+		ret = readl_poll_timeout(core->reg_base + idle_status[core_id] + 4 * i,
+					 value, value & DMA_NOC_IDLE, 2000, 20000);
+		if (ret)
+			goto disable_power;
+	}
+
+	do {
+		writel(power_down_prep[core_id], core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(15, 20);
+		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
+
+		handshake_done = value & lpi_status_done[core_id];
+		handshake_busy = value & (lpi_status_deny[core_id] | lpi_status_active[core_id]);
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(15, 20);
+	} while (++count < 1000);
+
+	if (!handshake_done && handshake_busy)
+		goto disable_power;
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS, value,
+				 value & lpi_status_done[core_id], 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	writel(bridge_sw_reset[core_id] | bridge_hw_reset[core_id],
+	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(bridge_hw_reset[core_id], core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+disable_power:
+	iris_genpd_set_hwmode(&core->vcodec[core_id], false);
+	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
+}
+
+static void iris_vpu36_power_off_hw(struct iris_core *core)
+{
+	u32 num_cores = core->iris_platform_data->num_cores;
+	int i;
+
+	for (i = 0; i < num_cores; i++)
+		iris_vpu36_power_off_vcodec(core, i);
+}
+
+static int iris_vpu36_power_on_hw(struct iris_core *core)
+{
+	u32 num_cores = core->iris_platform_data->num_cores;
+	int i, ret;
+
+	for (i = 0; i < num_cores; i++) {
+		ret = iris_enable_power_domain_and_clocks(core, &core->vcodec[i]);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	while (--i >= 0)
+		iris_vpu36_power_off_vcodec(core, i);
+
+	return ret;
+}
+
+static int iris_vpu36_set_hwmode(struct iris_core *core)
+{
+	u32 num_cores = core->iris_platform_data->num_cores;
+	int i, ret;
+
+	for (i = 0; i < num_cores; i++) {
+		ret = iris_genpd_set_hwmode(&core->vcodec[i], true);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	while (--i >= 0)
+		iris_genpd_set_hwmode(&core->vcodec[i], false);
+
+	return ret;
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -248,3 +360,12 @@ const struct vpu_ops iris_vpu35_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 };
+
+const struct vpu_ops iris_vpu36_ops = {
+	.power_off_hw = iris_vpu36_power_off_hw,
+	.power_on_hw = iris_vpu36_power_on_hw,
+	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
+	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu36_set_hwmode,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index a8df9af0d3da..34ecb18aefb3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -12,6 +12,7 @@ extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
+extern const struct vpu_ops iris_vpu36_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
 
 struct vpu_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..c44c85eac3b5 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -7,6 +7,7 @@
 #define __IRIS_VPU_REGISTER_DEFINES_H__
 
 #define VCODEC_BASE_OFFS			0x00000000
+#define VCODEC1_BASE_OFFS			0x00040000
 #define AON_MVP_NOC_RESET			0x0001F000
 #define CPU_BASE_OFFS				0x000A0000
 #define WRAPPER_BASE_OFFS			0x000B0000
@@ -14,6 +15,8 @@
 #define AON_BASE_OFFS				0x000E0000
 
 #define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
+#define VCODEC1_SS_IDLE_STATUSN			(VCODEC1_BASE_OFFS + 0x70)
+#define DMA_NOC_IDLE				BIT(22)
 
 #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
 #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
@@ -35,6 +38,8 @@
 #define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
 #define CORE_BRIDGE_SW_RESET			BIT(0)
 #define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
+#define VCODEC1_BRIDGE_SW_RESET			BIT(2)
+#define VCODEC1_BRIDGE_HW_RESET_DISABLE		BIT(3)
 
 #define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
 #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
@@ -52,14 +57,21 @@
 #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
 #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
 #define REQ_POWER_DOWN_PREP			BIT(0)
+#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
 
 #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
 #define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
 #define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
 #define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
+#define NOC_LPI_VCODEC1_STATUS_DONE		BIT(8)
+#define NOC_LPI_VCODEC1_STATUS_DENY		BIT(9)
+#define NOC_LPI_VCODEC1_STATUS_ACTIVE		BIT(10)
 
 #define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
 #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
+#define VCODEC0_POWER_STATUS			BIT(1)
+#define VCODEC1_POWER_STATUS			BIT(4)
+
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
 #define CORE_CLK_RUN				0x0
 

-- 
2.34.1


