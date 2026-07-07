Return-Path: <linux-arm-msm+bounces-117149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0/7KLEqeTGqbnAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:35:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A5571803F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:35:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dDKTdT1u;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MKBzzgmR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117149-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117149-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CD9DE300AD51
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A472D3A83A9;
	Tue,  7 Jul 2026 06:35:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FA53A83B1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:35:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406147; cv=none; b=Z3SYQ050I/uLutlsrSVO8N5jkww3h4HNLN6hdFZ69P6l3ei9wA+sI9TCD76q5ufXIKxPKiO8NWMCC5rwXmQPMVamw2aH2Cr6hgfRtQ6zmbJHvBgfROPheLjelbKAasAVTLN5joufj1dW5Ff41yuui5sCrItspsaYzpyAaG69U6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406147; c=relaxed/simple;
	bh=Dh2fxo97rcw/HY7O42KDHhXFkESXOFHYWiIPR09Lu9o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nmKWxxSJMYpQ12RSH8vdX6W99aoIAHj0ohKPBIR0PeOO+874ok4DiL60aruNFPaqE8gsYHZ/MTOkcFoRNtUSg0jlcsrrsfSLUsZwABWL1zzwn3Ui18goRDEYPFWh+N0pRADtl9s69PE+aH+vKwA3652Ndmqewhi7oOUqDMq7/pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDKTdT1u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKBzzgmR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748muw2649162
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yZfqIHDoqfWte/kPeYZGJE
	lmLBj5Xw+6kjVlLGAmoKg=; b=dDKTdT1uAk8DfkhMz8a2LjpGDV+JXWrWoJOCvv
	bCUYuPkAdqdtiu3ZPhmXJLxV8MgJ+qclIVWXwwj9YTIraRNzSUhGvmEnEs8As/Gt
	MeTQH87y1rPPwI2j8TZXYC8WOBY/yqcrwc3SZAR3OBLaphGd1H3oOP27t95isMP8
	vOAPM1YOwM6bimTyHIHP7hN+wPHQbnimIbgyT1LmGW7pmwqVhj1AMGwuc8QWmHk/
	ME+7eQDq7Xw+owQlIG96uLAuI3GIfdYdNOyWbJoCfB8Hul+Xw6iksZxBU95JqL4Z
	YVA7qjbAcXCjLh3WR7CkQ9LEyRSlwE6Tgzi5uYecnPHKu1YA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw2w01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:35:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845e6a11332so4931936b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783406144; x=1784010944; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yZfqIHDoqfWte/kPeYZGJElmLBj5Xw+6kjVlLGAmoKg=;
        b=MKBzzgmRPcPnWBFosxRePYMvEuqqH2kxz/1bf+KYKqpSTAyARDPWDERfl2oT7ySZ+9
         ysVwNyRRNAgaUkX/KnGviS5T1MYdWIF6XaNHYwAznNOfShfJ2IO7qs+nVqg5Ymu2YnGe
         2zaWLyLPSkA6CUqsUBtqmfYA0v8wHRLmcWwOwQ4I+arzSQ42M9lXgoK61UDZ4apsh4hR
         nGPf8zmDHdkJviVpm3dLUfETH+TEKFxilzcVpHKLQMLNV5aaoJLRb9bTL8A0BB5nYzzg
         TFrqjcPFcB4fThMUxtDYhReA2ACl1CcCE12DROyKVSa0NdnTVlb0VNaNN+vydXoP4EGY
         VvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783406144; x=1784010944;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZfqIHDoqfWte/kPeYZGJElmLBj5Xw+6kjVlLGAmoKg=;
        b=rDICWMh6j20AxlssRFWY5jBIXqPGuq2fPOScqe0lo5bNoQedsaQUbawMb4Zg7DA7ss
         Zpf8iIAyHIT+7lAhhAXvaG/+S8sOlDnZJOHeuN6UptIvSSqEEvqWs0RoF2BE3pPvxc8h
         JFIkLZzqHQxDrPqOGmEvih7RgfepoJwuF5V5vLbPxyNMI2ZYJ66B/1SV3xO9he6WiqOc
         WlBC3DebH0r10BpbPbxFOAHgz0y3MrshwyLWBW2Ecsl8zzIPpkJZGHwLTMeR1ujl/ZoF
         2RMtZr+sf6mwij9jtgHENPsnU0FLai+B8TZ8xj0+cEfFmklvMLlE5Apy8Sfy0pvdYuPP
         dBEA==
X-Forwarded-Encrypted: i=1; AHgh+RpkEavLS9tRoodwGAhMNhS261X4x++K25U8DKZDbRchGyFb1jhk5yfIUi/l2/WSAvyk7/uqz2ANWJ7cAvxy@vger.kernel.org
X-Gm-Message-State: AOJu0YzYhSNTYeTW6WackYIYocYfCftkvZkTvqa+42wZZZl83iPq/uJF
	3tOnipyizIH6vB/xlwwZ3dPbcGHF1rOUQ8MvWiRpPV2CR85u0ujtmYudFmGLusXOYilYGxF2LgF
	i0dp7W9o6rww6xZjsc3HL1h4ZnsHAfL6qaq6MuCr5aecNSVje5bGKs8q5MWEy1h17HTPK
X-Gm-Gg: AfdE7clkRV58uniIQ99NCy03v50HbHmggQgFVtMrzuN0v4ThHcAtOpJYBS/LWh0duzL
	ujvAtkU85Lgq5IQcACA9ifZMDO8zDTE9xRcx63a0XL/5ftWJnwz3TonD0huH//dbUNImB+tmRYZ
	rKWdBy2ibxyg0Qri621ZZBB71p+igTzyF9AJnJ5YPzXTQVrp8WOa6sgyCQ9oJxeUU4XQ7OkipUm
	wyBV7QBd0n1DrfWM8mV2/77IrKxHqLOxIWDKYszrIbUjsLr2i8oTpVLwCP63as/+gT154uXMBmK
	Bs3h3rgabHmmLlOZNtYuFbKGAPHsw6AWNdls2T8Ez/o4GqA95ShbzkOxsdEKrJB0PPhopLG+A8q
	5H5jlw3K91VdYJLLLpsFvWnYkC/VKkRo9i9+hAcvOwu7q
X-Received: by 2002:a05:6a00:3a13:b0:845:e1a3:1080 with SMTP id d2e1a72fcca58-84826d81a1amr4000305b3a.55.1783406144199;
        Mon, 06 Jul 2026 23:35:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a13:b0:845:e1a3:1080 with SMTP id d2e1a72fcca58-84826d81a1amr4000265b3a.55.1783406143691;
        Mon, 06 Jul 2026 23:35:43 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm4889973b3a.53.2026.07.06.23.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:35:43 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH 0/2] media: iris: fix QC10C format handling and disable
 time-delta-based rate control
Date: Tue, 07 Jul 2026 12:05:22 +0530
Message-Id: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-0-33fa130bc535@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACqeTGoC/yXNQQrCMBCF4auUWRtIqjboVUSGJDPqSI01E0Uov
 btRl9/ivX8G5SKssO9mKPwSlXtucKsO0iXkMxuhZuhtP1hvvXkkZxOe5I0hE5JoiCNjlRsj8Vg
 DxqBMWJLZ0OB8H9e7bXTQ/qbCbfZrHY5/6zNeOdVvAJblA85kCRuNAAAA
X-Change-ID: 20260707-qc10c_fix_and_disable_time_delta_based_rc-4d6172b395b1
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783406138; l=1201;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Dh2fxo97rcw/HY7O42KDHhXFkESXOFHYWiIPR09Lu9o=;
 b=rt7AYHwVCnoDZ3cTnKurcTiIxWMfKwwzTlf8uk1zbFfZHN6uVxWy7+w5Dlg8MeUYH4Y70vFQS
 KCZGH8+r2/XDYGNKfNG9LxFyvadMtwqLoC6ia4OiShyBT4vdvxDq46q
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2MSBTYWx0ZWRfX9st6ELvi2rv9
 72kYW6jTvvtqZ5Swlu3KjBf442pkbFgB0bL/eqA8AWVC8VnR9XfC46q1GD5n8q5v517SN1CTkjk
 xoIX5GUH+vv0NjVfZb/Ag4gBHa5eqAc=
X-Proofpoint-ORIG-GUID: bXbMNqagDgl3uWty5K4wTFTLdmYBBlet
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4c9e40 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bHM9EGv_eIyXTYkJAFYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2MSBTYWx0ZWRfX4myLxTzmjvxO
 27rs/aEEKqwPGsiwF+Avkk2EGIipgMXP2dwgi/EfU1B1qtAxC3azl7ybwgnjC35k1LpN1nh6Tb4
 7qfvYqnT9z0k+xxzFI9tkofARFgnEbSodelonq/LBzxG9tDDnvDOmdjRTGcvx6+smN0ZQRB4KDC
 sakmcyqSFCAPkczPIeTI/NAe9ckwof7uV9cILAohMjb0tnCP/XE1C3npl/rlkH692bZZdIayrNO
 CVZc4kuT7tqH5FHd6JLZhasGz8mYzgt9VSx2a4ghBA1ksPG9zh8xgMNYzkGDBg98XnLUeDChsV9
 sIwQFeoN9LC6KpsNhA5GHlYqcqg13MxohK4VrCF/v7MmnjiTZNqGD6htF1Rki58f5QUUzaA+0tr
 KSk3yT+5zvqXkIj0Oj9cBTeM3sQnIyDam14OAklOnlhAcn0pn9wKBdtZO3z+MsQCKUadUXkOts5
 yDzINk2yss16YDal99w==
X-Proofpoint-GUID: bXbMNqagDgl3uWty5K4wTFTLdmYBBlet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117149-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:stable@vger.kernel.org,m:gouravk@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4A5571803F

The first patch fixes QC10C format requests being silently replaced
by P010, because the bit depth was checked before the firmware had
reported it.

The second patch disables time-delta-based rate control for VBR
encoding, so the firmware follows the configured bitrate target.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Gourav Kumar (1):
      media: iris: disable time-delta-based rate control for VBR

Vishnu Reddy (1):
      media: iris: avoid bit depth validation for capture formats

 drivers/media/platform/qcom/iris/iris_ctrls.c         | 19 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h         |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c      | 10 ++++++++++
 .../media/platform/qcom/iris/iris_hfi_gen2_defines.h  |  1 +
 .../media/platform/qcom/iris/iris_platform_common.h   |  1 +
 drivers/media/platform/qcom/iris/iris_vdec.c          | 10 ----------
 6 files changed, 32 insertions(+), 10 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260707-qc10c_fix_and_disable_time_delta_based_rc-4d6172b395b1

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


