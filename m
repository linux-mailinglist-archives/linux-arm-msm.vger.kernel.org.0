Return-Path: <linux-arm-msm+bounces-106264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NwFJBE1/GmNMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:45:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC3D4E3A4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C5913052448
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473D3341050;
	Thu,  7 May 2026 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IvIzYQb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LAI3czjD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7F233F8D9
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136147; cv=none; b=Ts1mBq2HjyZlk6Q9v8RHjVdtvSM0WHRrwESGPUF4RcHjpWiRgGmZ7OjXvU6K6lQtc2Lf3P9TxrTXIC1qSu66zLruiWZXm3A9lt1wOE9VJHFD4beKoYjWm+rXly+yh2AP5ej7cypBnGR4zhC1x8Ky6rCjrWv7HXHWHVasG7oL6T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136147; c=relaxed/simple;
	bh=xdQhJoUl0aK+2Ix7d2cAxdXiGObKKMBXv2H0iO+htCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fzw6O3nXB0J8EKaFFZoWgg4sVoYXsoFhPlY4yoGLFRt6c2xnJOpsuj5Ihfu2h9/8YLx0w6DvIufzRN47x069fT7zOzq3pjt8lE1+zVtAowpJcKQrs3eqQFrjDynMC3dZbdgwWTrtnXywEq2cd6lbUhtmKIk4Dip5pkUFNHRYMas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IvIzYQb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LAI3czjD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475M8fW3156931
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6gPMzFlIvZlXBHM8qU79sOvtNXYw2NQG6gyfTtDAqA=; b=IvIzYQb7WOPHaE1P
	zkQoQoQ88Sn5Aua6DVMoyNqN+v/c/twkT/ZOX99Y/+Jm8v0dD/IGuXYFRX603ab0
	Oy8uaQqZd5lBwELimG7Wxk6b3WYJpJYlYXv795SMELmTbRHeP7ZxldfGKjv1OsMy
	sir7trCEPC4yBOWFguIKrHZY0fpbQdl5e8ZX/k6bTAtdiHRAH61q0rh71Zh3SOSr
	406I7FVm3TZ5DapQXesepbzyAiVOMvvzrswDMGECjuDvVpwjby0KC6miJ19loKlO
	hdzDkz6UWx4LGzEoZdMdI5v8ykGngRUXtE+4EXdN9LBAmdcBvswHrZ8zZAy4Q4P9
	rZZMLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf08pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:42:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51009190feeso10520011cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136141; x=1778740941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6gPMzFlIvZlXBHM8qU79sOvtNXYw2NQG6gyfTtDAqA=;
        b=LAI3czjD2IFJ0FDiQebvEzrISYQeLgEK6OuRBAuoFrqknQDc25Fn64M71Sovn+Tz7j
         tdAu7JAJ8B05bMbRhJIrQJh+tUXvLYAvsSBsPeyOatjI4+vGDXtLoNcZ0/557f3W8SXX
         KZOS0SaAQ+eKOtoR1Yl2PWazXL9XYs4KprcFp4iFXTM+/Z/vOmC810l7kAvwZBKE6eGW
         yIKGRuS2k6HZ1TxVPrtngsgkDluZl/0HJUXudN7rdkYd47voSbph/nZx6yiWMznYl4rr
         vxejvLy+PtCtZUBNTkhKsRbUF9kMQd6FgOwesZQlEjQJ9CGIpl8BM5sL/Nhf791ngnuo
         MeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136141; x=1778740941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K6gPMzFlIvZlXBHM8qU79sOvtNXYw2NQG6gyfTtDAqA=;
        b=LLHi9DGEW2Ka02sh4oYXzklpV6VMtmE0uEbKU1sVZDpGxBc0V8owOtQJ1q5lzu/2Le
         CwPTdMHQeWFnWmmYyi8kYP1UCThKfn1dxCnTZm2ric8IJRWTB+4dLWUIOMiTWLRT6fc+
         27eEcihrY7GzP2a4iafaLeg5+SuEZKrjaC6P4MLwGLGhCBPxbijC2zGhZ4J2HFQ7JfUj
         S6sUBr1bm1X5m/4bqvHALkSHYz3d7XdV4U+kTbROxDM/bCIVxlg/JvrLrZl7ZV/Zl/fD
         gTiZEaJaUux8X50odyA2EftEsR8A/rouUON3giZCU4dBIBKkM6iYhyoaCaO3tkvb6j9T
         ucjw==
X-Forwarded-Encrypted: i=1; AFNElJ9pJT89s1KcIpoNMW+oslh5RhG4w2xY5hAA0cq2VKtIhLsq0mip/VGVQy+Ek1mEPy0VxV8YcksYDxGBHcA/@vger.kernel.org
X-Gm-Message-State: AOJu0YxOKnzknHEnHYUcmm22nMT5/hbWkuFfV0BIkBmGfp4jH6x5auc+
	nb7bCMk4ze7DIiM8QtoC8LmAYJWPZArjX/0j1Do18LhrAwO3YsbJwUmJRa2dIk9Hkrd9VjPc22G
	KXCrzs6aTycjJdEmTMw8ll35j0kxheD4bI6zogHyv9bFKgVBytb3TsecCOzx/BrVE7qs+jTmBE3
	1z
X-Gm-Gg: AeBDiesXe5kfsK71ULRx/I29rNfJNxtaP2boVATJBLxsIwPA+gX0DBLNx6a2Mx5SFAp
	3iNjUqqEO1/jT0sRfshBARpVFS+DF71G+gD6YHNRo0ADRrr7TfNdL2yQKCFDIH27bK+fnqPnQ/q
	+I29IkJQORnlEOqkigkKrqSsujsKz2iE8dlzDcJ23H1MBEWQ5+Tu28yTm6UDvMewXnrbEPvup2q
	JYLb5x9S66JwFQ++ex0j2lFyeyd/RneLKOY7+VNU5W8Caa7SCUxygwiKu9YkjUAMIuTkcCOfHdN
	O1yB9g6zVdvoDucTqri+cEvZ2SYiZ2C6CplHYWRQRtaEoNUvR64fq32ZKigDNCHprSW1sBZrdYd
	urNqMJ6op+escqnIrKaA9NyRITPTqXPGnpAKzkKpnmdVSn63VB0HfrtLyFmdC8aO6rF+gWdj6Dy
	oqW4uWjjkcKGbLItqt7EEL+QKVFODRfm3mRrj8KgpLtcyasj3/vcjfeecB
X-Received: by 2002:ac8:5a16:0:b0:50d:9b07:9c46 with SMTP id d75a77b69052e-51461fa0213mr88562021cf.33.1778136141215;
        Wed, 06 May 2026 23:42:21 -0700 (PDT)
X-Received: by 2002:ac8:5a16:0:b0:50d:9b07:9c46 with SMTP id d75a77b69052e-51461fa0213mr88561731cf.33.1778136140689;
        Wed, 06 May 2026 23:42:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:04 +0300
Subject: [PATCH 04/16] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-4-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4808;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kj6DR4cWKV5C9mtO2ZoEmuI7vButCz1bmXA5tAl5t+s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ9Hyz/kn/F85otEYZf67npXz19pmKP2Hbp+
 Fgk+1pPQ0qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PQAKCRCLPIo+Aiko
 1YF7CACjGCz72GFhw/gpDY0hwHCUoaGnWm8mgR/jZt6ore8OMwxm2844pyZdKczzgoeEPs3tgJH
 spFEdZu3JDscpeoDulWpxRfaWUunIsC1FZ2z3P0PxUj/mJVlPDy/KhAbUVIHxfFCg877P6qhE64
 7tsOqp5A0ylH9TXZb3NooA9mikck28rs90hMaJz2ok4Np6CbT9sRTwcFEnFpqT++61GKD12mZZ/
 ibe5YOXKStvs3aheavHTfLg4ETLd3mIDqxIlo5moM9u+BSffCF28dH1Px2Un/mxe8AYtDbev6zU
 ftsZykq055cP7OBAqm9LrZie5G3DerAiBXKoIvtxhur81tnw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX2/6enrqktl4h
 8HMbEE2iaaN7VE/cUwpgroJCOwiY+NOxGiBHoOWAzygjZMa+msibenhqT6kDlPMnERSHkjIEe34
 dsBlV7y4QHvcffB/66E5WEavFCiVGkJdP7hXGS0iuRRWbgDnQRypHKXTO8mBHTtuHcJhhBNt8jx
 PIjAcE4bNkZBy9G4N6oWzD4Kcn4npWw98W3VawWdSmVckbQq1vfgHNWVq2UxctmqOIMCkWm0oS8
 PUs2Wbx/cneaSFMsbOzzAwSi/oNxBHZqEnfcBK8Ilov3dFt3KEjbMgVr36YoB0SaC9L84oub/yf
 aJiVrZ0uxEWo8f03gDMbx+5wDR/V7xT5SXYVPz5Rt5oy1rGSfhCEgDE9ZcoQSA42PAR95pEwTAa
 Y6f0NBpFUCZraPA4yhpAiKGjA9N0zqo+o7jQuyw1SCCEvGGjDsn1XArYuH85pJTQ5yenzaieITP
 D2/+fNvUgAhdGvG+mTA==
X-Proofpoint-ORIG-GUID: n9IUWNWV9NI-9QYHt6jsYt8te1b85QFp
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc344e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: n9IUWNWV9NI-9QYHt6jsYt8te1b85QFp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063
X-Rspamd-Queue-Id: 3CC3D4E3A4D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106264-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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


