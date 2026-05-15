Return-Path: <linux-arm-msm+bounces-107872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHvzCiUQB2qbrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:23:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E87054F656
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9485D31926A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0326480324;
	Fri, 15 May 2026 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fn1iwfn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAwX6BC4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA6848033D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845702; cv=none; b=aM/Uz7NDNxI+F3/28xcHo7OR1iimo1ZxZ1Er3n5Vj10HnZzojHpXosgY0Czcb0Tg22n4AH8OwZLHQH3gJcU+uteakElAWBbceAMTzdYPvBw5Lo/HxvMa9cRAwyoT8PwHXCjLQZ8/9/nulnSFxD+FDa4R9jbPA/wcGn1sdpJ9hp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845702; c=relaxed/simple;
	bh=NIeHu4ozqMa2+nVCwY8xC2WGYPW1YAI9tEryx993GPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mKtMUsqBuRtmkxd8dWkE5G/hkn/aV23WQffqQXILsS2NZG4t8wNNNBNRVGTkAJPbUPRKGvfYrtGSZsJqfI5mAmmx2kQ/l0y3U9rJI6+7U+XyWzkImWwMPY2QKGwA/li5vegbYXw2gubyifLrsU8t+y777Lrw2fUZxW6nl7sH3s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fn1iwfn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAwX6BC4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAucVf3200106
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=; b=fn1iwfn817mkcyyF
	OyIvxwfSxErPuUBQn/iGAhBvT+DoGrh2RixQSD8krZHCV+x6Q2Eqy0OJ/hsiCBkV
	zho8Zq1Gs5x8H5SnaSLmA5KS7ro/WJdWta9ZPKJgJZFfjQaUceqpjIsutbXM38Dw
	8lKWVvfI+MynyhJ4kKwlXg/mNG+kkaMnUbQJQi2JfbflpAkmwHwHnsBgITqiDjk2
	v6NK1Clw+dCxo2pkhWrfuySqaZsd+OvqGpRuEHnI8bq2iTvnKbWntRHb5U892NFA
	lGv5Jm3Pe2mMtcAk/IAnzr5g5S56DfrE1p2CWycJvypxVS9H06jbWqDYrajcKZfQ
	uSdi1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qu264-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d1c2289so115906431cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845695; x=1779450495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=;
        b=HAwX6BC4r3cZazlr1uZ+oFMQbjEC04NSjEvZl6Sk1gT6B0GO4lFa8JyxEu9415fjvE
         ZdEZ8H6DrHM0+QY6rLmFopFnmW73pGXOxIvnDsR4jYt9iGVydqQbnpOi848/aE2GeSZp
         K1cjG6zXsfJxVD+wZGGvZ1Lzff3El1oWk+PmIdm+gKuS/03EPq4BlA+uU7PuAAuU49dO
         G37vXs6RTqX5C8ybZgNQiCvRjF9Ads15s/KwNot8KYmL8BHDVlwIp6Vq/x8MqKLuKS03
         Hfhic6iYqXwMGWACZXM6StmWbR0s9dGXruyi+rxo9wPhI3PRzfmaziSgEPh623zkFV8x
         QjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845695; x=1779450495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=;
        b=P31GJKK/aqvPhYI+bCR8fW+feLohC4mKYsuUTXD8Pzd7xCFdxW+NsXJq6wEQr4FFlI
         m1/NO4pW2Q4KJ3XF6wNOJfkplVzzmgFwvWI4Uk52ISIDPKtVvZ8jZYSdtNhflhJ++Ya8
         JUieE908Xm1JXcxt5ci6q7zC9+17XqkvrD8kfxa5CZsQ9ODb1sWfCY80+t9LDYvdSWzA
         mfL4fYn79UEO+e2sAp6MIzfID2Vfh5MFmXZIMXMhGM+EjiJo2/GzEOKx0KxNz+/2Lh3v
         5Mmmh78TMReeK8sIfs8bQkftWQQMf05cAru3X+6eV4ITcrZW+LO31du7akm+acqa27z4
         0P3g==
X-Forwarded-Encrypted: i=1; AFNElJ+Am1JRJH241bT4WS6tGi4vEya2FUeDiOjabbO4WpwzOg8b0m80SAA5YRlcVy96eTKGIJnV3MITAJ7Pa0gj@vger.kernel.org
X-Gm-Message-State: AOJu0YztxcJOOddtBwcYHSbpwnxc6XAMpgTY2P15wOH3IwU7bG3LGG46
	ojnMoFZmN+5oTJJrW8gWj5cNF69E0U2LolK+I2p4dK7qEFEn28v+QnRfTkDMzb2SKlR8pjI9+mn
	UKUQW3U87xTbZm6vIGrc4CWyf3eWKY0FY6XzqM0LettoQnJA9Q98zHPVvvv0qjjRo9Tyu
X-Gm-Gg: Acq92OFA2q4/6imGp60PwPxmqjbjqn05GasbsONLfJH6HMB88Jhs02RDpQqfHIuDZXB
	1zA2HdnRI8/TTTCivlKptk3LrszsqOT79VytZt21mLVwA9daMvHmdYQc/ldYptfxvL2f4YbUTrp
	CLGCAjl/++iLCt9FCziHOIaRlk3BOhCt42SvryMBAYROertsWvqN2U1+PlbKpqjC5SG4MPz3Ugq
	QsXyJk+G4Y8VaFcmdbeXKF+JCh8ks0v2AepC7OhIolzQrve97egbmTblWxWsm+QG46BcOi+OXF6
	I+fBMMqMeL3pFXBR38RyxBXAMINKXSkKy18LOiq3RX1QkPvYN65ScIctOuTmpewGfMo2mvQnZYw
	bcuJpIPS/60W88BzFSBs5GMP63w+QRuzzbGZNo8dnGuqyP4KCLp8vTVgyTrWXhVDnbn5SXHFjQU
	cifnr5WLml56JkO2C+8j4umxCX0tT/tFLa4Jo=
X-Received: by 2002:ac8:7c4b:0:b0:50f:b978:82e9 with SMTP id d75a77b69052e-5165a022a0emr48351641cf.14.1778845695430;
        Fri, 15 May 2026 04:48:15 -0700 (PDT)
X-Received: by 2002:ac8:7c4b:0:b0:50f:b978:82e9 with SMTP id d75a77b69052e-5165a022a0emr48351271cf.14.1778845694953;
        Fri, 15 May 2026 04:48:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:02 +0300
Subject: [PATCH v3 03/16] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-3-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yjv3YSjey6H8VPHigK1PHGPXENr2QgLaW8YDZ/WLE3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf0grR79YTEqtux1xHVvJisDhvDATyliQ8BX
 e93M8/CNXOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9AAKCRCLPIo+Aiko
 1ULSB/41CiUjd7G1MgpWsJcX+OdLldopRQ5Rh+PTUoHjmFyuqnK/BmFC9JIH+yEBGPamigEzZgN
 0Pt/qD0PYq0GK3spYRduyeZAzTTEUGmhWrfY69mdLoFGgQDUCPRr4pSuJYwGTltu30TEzspmqQP
 aXRoWQf8oAzH1165C3M/dr2Eg/01ZbDYc8HvQhZQMzVytpDGfi0PwwOc4tRNE2dWeA93a0z/56f
 7LeFpCqexk6RzqnWPYU7+ODQ8Pdzv8ofPxy9BXtzoIyfy3fnkJYVnt7q2N1wU6TgK9VGx+7RpNO
 pw5VDy+j8IqVIeW2QG5yEYqdPcAntfGy/aHcrtJXMybLYP+D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a070800 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: LwjwhV-T3OsYIX3Rqr1XaHEXHrgVTd4C
X-Proofpoint-ORIG-GUID: LwjwhV-T3OsYIX3Rqr1XaHEXHrgVTd4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX05eaUEOrtGdU
 V2xhUP/csjMBOOGy2sHW6u2377QF3xgOLSk7tIJRDMM+2GHi6AtbmEyJyrMi68/ybq9SkgEfZ4S
 ZQZUgq1HZHrWVvs4YjHzJWpmygXzc3KBph/1sywfrv6EtcTFRB2sFbbVLoHGSRFoZPMciROKJYU
 9L+kpgldF9Tqc/wSHgmbaUO/ZeaYPEFUu5JCa8PZzR67P8vlBH0JOqCBKTwloJSQNia8syAIqtW
 Ihpd6qjPki2aJxMifdm10ZTNZ2QncEtl9nZ5KQg158T/Yr0YJl0L7h28bpnftpuxMy7IjqGKalM
 6vzGBeraK62r0If0/ECT+Fg8TfqK0PIAOZ9336lu/fSP+IQ9HOR+IO51HRxliXDMHQMd2sc2rOw
 KH0oDDODCBC/YZSH0/vaRb2Q7iiHeuGF2fWrVFaRokvJUXkXVMiUHyzq2Apu7dWQVioy3XRHuTT
 uFAUuaGAGALdJ925XmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 5E87054F656
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-107872-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The set_preset_registers sequence is currently shared across all
supported devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move set_preset_register into a vpu_op to allow per-device
customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 01ef40f38957..d61902c9a213 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -45,4 +45,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b5..dc02ced1b931 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -261,6 +261,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -270,6 +271,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -280,4 +282,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045f..f608a297d4a3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -368,4 +368,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 7bba3b6209c2..ff0070c85ccf 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -472,7 +472,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	iris_vpu_set_preset_registers(core);
+	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..21ed4c9bd5e3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,7 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	void (*set_preset_registers)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


