Return-Path: <linux-arm-msm+bounces-102324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFtAFEpW1mm8DQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:21:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BC73BCC0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 218CC309FD55
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 13:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9279E3CCFB7;
	Wed,  8 Apr 2026 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0oj5235";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QvYUaKW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448513C873F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654018; cv=none; b=bOaJdWrGam1r8r+fVIybSIdKETQiRs5zyoSHnGXstVhsD8X2Ert66nH26MpF7fY/PaTo2z5lxoGbqk/nDhx6rsn1vbmgVnHibAWsRNEhjp+SKzUsvQwBDpfgpU8cVYfdj2uiatSvJXvqzz+Lu6FtSP3rzlC5FPca1hj1iwvPQ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654018; c=relaxed/simple;
	bh=xAsGM5wG7d+KQdi/SmKP3tYRAXT14rSUYiKYRDxfawQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TvW120iMo2xv9jkwNDAASg/fnoHkPWd+vG7KS2DqjSO2YfyOOSF+JcLH7ftRxqv08JmTs6FbbM8CL146avVhbyDJjx0cny1n49isl3blFXz+nHe69z4Y3AilwjGE/jcvZFHoszMVa9ILFoZoySlrwFr5ISepdCadMVDze4+4elk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0oj5235; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QvYUaKW+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638CfHRF1619596
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 13:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H3aeoeXAXwQFha0GEZVhE/
	XlFO0K7ui7Q0MuqliZFzk=; b=T0oj52350LthVU0nsXqgbjBfS6aRAo+3tgyRSJ
	dc5Va+LgcVDlFcdogkMjv5sMr0imCO37EGACfWb803tlFRjDsGJiBn7OjSEbRKxc
	spSAeZT+yOYiiF9EoS92lVecWdLGtObxBAhHyBMOgzi0j8OSffRvaS11atVM8k8h
	8NsWIeeXrWa9Mqq3Z0w63YIsyS5Zr9dTDc+0Aiy53C1si5XYQySJgYuONLTFnCIR
	aJj8CCXnU9XN9yIvmEkgkP3p5iEYmDWLC5UIugLozLC8sRpTTRLe/h5LZmGl/Sln
	OpxVVhjKuGZNdB++NcRUD0BoYHQQIwek+sgMouSfkkHkDZLw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddacrjwwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 13:13:36 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-605acae0d76so8410409137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 06:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775654015; x=1776258815; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H3aeoeXAXwQFha0GEZVhE/XlFO0K7ui7Q0MuqliZFzk=;
        b=QvYUaKW+xZBWsax3LHF7DzD0XQI4h3oHHvF7B+nSTVYg58kuP3aWMNPfPQPnOifFzh
         GNuGCPs/2PQh+65JZwQsNx8Kcl3OJwXNtgTY3VK8rwz0/QNyyk2Fxa1TS+ZNIpSdx3rV
         lQALXByMpGN8bO7J6dduxvLZlrpTvI4yf+HqXdGIOpiTW8k7m1fkBIznynP4dIkKCDC1
         tD0P27nn7Hll9N5BGQtstAAayFbxsBaaSLiiO5f+pUw7Oqhcbk9FGZ+krn+JxU5nGVPD
         OXk/fDTl2DnTi/GHUuAtwrSH3FJ4f1pzeeMhh0tHrTeeFckv3dq3Pmx6PCi3lPYT/dJ+
         E2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654015; x=1776258815;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3aeoeXAXwQFha0GEZVhE/XlFO0K7ui7Q0MuqliZFzk=;
        b=W4pkmqnP3KgKz8wJ4puHN6SOCaHFoa0pFSlx7CTgyiSSp+ij3Tvx1swJb2xoascts6
         P6QQyQW26ajTDaVzHnr46M0F3B9DFgYsHr+e3+umUBFjMPZUh+5HBfet6yyz5ncRnMk8
         LaXZZMctrz9uNCnLAidPZ8v0PWHrn9V/Ua2SjmCKQNzNKTt29dSDYOeICAWTGG9VLgk/
         647fJwwQ+mwzV8plXLQ/ejjqOOr7FqmGdGbDAOZ6fDBCvLnnFNP5nqb1C29NMFBlYXG6
         LiQJba7IFFlWpthLqiRtwyQCOc8b157FoyqpQrQ5YQSY3akU9uanf1x7+66TyBu6OC2e
         Wkog==
X-Forwarded-Encrypted: i=1; AJvYcCVP3S8hLD6BL9I7nOlcVmJd1vGzt+iBsp7Onazd6cUG7lvKeI1UqsiU4DuTQ+8VQx53UWg4VKMSAGc0/pZV@vger.kernel.org
X-Gm-Message-State: AOJu0YwUbAUxLXM6mEkKgp+wrjcFRwvOJ9hisSNPyj4vEPEV3KVldkxC
	4f493fL93KWvgrKjxx3FtvNenyEaFU+3jIvOGavH6IigGGXgYctH9W7KkKRZGHiXEmRoLfEu68x
	HGqyvS/1ZHF1ba7LEiQ3pqjmWUXF771+RRLm4D/lUFpLDuwi5Ema6Kv2FS3j9I/0SHnNi
X-Gm-Gg: AeBDiesrv3jLZssrUyD6CoPU5KEopYhoN60yVCGRbBkjyu4DdET1ExITp1HeJaiJgC4
	/nYuuarqonom17gg/8+Zo15smph6+kSwh1KVb2/Pjqa3iqvm8H0atae4YYMXlNAAQRnV/M9jYjR
	lGGZOjN5spVXw0RYj6qoUP4654zbR03lXGN83hDLnFemnb309HmJsEDygQnWTBMko65x75AQDCG
	5jKuFzXi2IWssB1YIe7hVQX0mTZ7+jSYQ1wGtMvZpuFzVMUTdrEcZEHtlGEcyR7j2yVAICutYYL
	63i8SjnR8fRh7N/Vzr9p27iKltAi/ZJ7zAGs4h4Clu63fEYp2YwxXZPp++n9rFRfSgoqWyQUwZm
	S5K5mDUOLjMhbZVki4hID59TALdlaORrjRANlXHrVOT+ernTZshqV9LFFs8Lx+D7z0O7CVW77Rr
	qPH09ktQ+84Eg5hOAk/CAXZKuqziiHoF8SIqI=
X-Received: by 2002:a05:6102:5093:b0:5f7:24e9:ece2 with SMTP id ada2fe7eead31-605a50d7628mr7944207137.28.1775654015369;
        Wed, 08 Apr 2026 06:13:35 -0700 (PDT)
X-Received: by 2002:a05:6102:5093:b0:5f7:24e9:ece2 with SMTP id ada2fe7eead31-605a50d7628mr7944157137.28.1775654014944;
        Wed, 08 Apr 2026 06:13:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd3509sm4804775e87.75.2026.04.08.06.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:13:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 16:13:05 +0300
Subject: [PATCH] media: iris: use IRQF_NO_AUTOEN when requesting the IRQ
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-iris-no-autoen-v1-1-378d290a019e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGBU1mkC/yXMQQqDMBBG4avIrDuQikbtVYqLqL86XSQloyKId
 zety2/x3kGKKFB6ZQdFbKISfMLzkVE/Oz+BZUim3OTWFKZmiaLsA7t1CfBcWtS2ahzGpqAUfSN
 G2f/Dd3tb1+6Dfvld6DwvpMxG23IAAAA=
X-Change-ID: 20260408-iris-no-autoen-56e8679aef94
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xAsGM5wG7d+KQdi/SmKP3tYRAXT14rSUYiKYRDxfawQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp1lR9UE2D8cfDF+bIN0Nke4wtiKSJVh61+nbnk
 Wv7k1OuGtuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadZUfQAKCRCLPIo+Aiko
 1f7RB/9uuaCLF9O3ckExz1nE/RFHG9mA356CLjzZOoHFs+1Fs0jhQgGSmopS5BKtA2mgbOqJzjm
 BNwXjHVJIPKCafav5L/c4R189l7c6qs+mXQGHB3Gx8cOE3YTKtu+FeQ4gPnRFyYcno/tCoXAliW
 6DKjV5YRr5L2ycPPeSwb2KFepyvmkk4Vqnwi/0rWTJcarb+3OtFGwuhBqX/Mc4ZCL982DC7DGrf
 QrQFyeyf09ThKYK1P3WkTJ6D0zs24JrOWaooDeJbUshIWlfXlPHVAzkujzviRZQQ5Zrv/Nnnnbd
 hJ4ajrOeyOn2mEpM6H+AQxvb42y3fbxbGs9CXtvi5X5IJU38
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: iTCfPQwr2A1dLTFHDJ3Dh-2IlkHzqE9f
X-Proofpoint-GUID: iTCfPQwr2A1dLTFHDJ3Dh-2IlkHzqE9f
X-Authority-Analysis: v=2.4 cv=WZs8rUhX c=1 sm=1 tr=0 ts=69d65480 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=EOH_RX0NK_dA2BEO_QQA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyMiBTYWx0ZWRfX5JZJqv5V72bL
 yONsLIR5SHQGZHk2/xcwIyZxpQPqV5WWUM3X5Bc4rPgfaO7fUb8HtPsMoGfZON6f+rVhOelNP7B
 fuvJYQr0Z+4OUTZ8T32yEImFbM0pG294Sur3VWEaPZOErRAInhGFJI7+HPAuRrMsvqrlATxecN3
 JaAjGmA5JLz7GgwA2m/aGS2zkI4lnHS39TPRHAJacUW8VT3f0LxRNNsWNEbV4SE0e81uOQ19lnE
 RSCsibNBpU1P3kkHaCvP84aPLcFKFEe9WnykdM72Ks/TnPntNefAe4k6b+ZnnEWBKitdGTjFFS5
 C7OW/BshOM64KXfvRNXhqheMM6bBCkLlyrIw8cnYbd3wmUpPgjoU3MdZCVqmcuqk9Ux8B8Blliw
 fjqqWU868Rl8HBJHWtW5mzuXJadDQA4CVNieB5qtH3RZmuMZD4P1kRzdsjn9xVpHedm3yIvduWH
 yXkf6XMMatKeyjJUIcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080122
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102324-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8BC73BCC0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Requesting the IRQ and then immediately disabling it is fragile as it
leaves a window when the IRQ is still enabled although the underlying
device might be not completely setup for IRQ handling. Pass
IRQF_NO_AUTOEN instead of calling disable_irq_nosync().

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..baec43acd6b6 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -245,12 +245,12 @@ static int iris_probe(struct platform_device *pdev)
 	core->iris_platform_data = of_device_get_match_data(core->dev);
 
 	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
-					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
+					iris_hfi_isr_handler,
+					IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
+					"iris", core);
 	if (ret)
 		return ret;
 
-	disable_irq_nosync(core->irq);
-
 	iris_init_ops(core);
 	core->iris_platform_data->init_hfi_command_ops(core);
 	core->iris_platform_data->init_hfi_response_ops(core);

---
base-commit: 816f193dd0d95246f208590924dd962b192def78
change-id: 20260408-iris-no-autoen-56e8679aef94

Best regards,
--  
With best wishes
Dmitry


