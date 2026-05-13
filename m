Return-Path: <linux-arm-msm+bounces-107290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJb5IYl1BGqdJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:58:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0F533758
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DEBD31D9151
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF2B44E025;
	Wed, 13 May 2026 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bL/L3bOg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWFJbpem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091824266A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676558; cv=none; b=g1C74GoFsn2yglfn6Q4qWDWy/BW1iEyl5lJZw1Pru3mqrYq9r6i3NI4Y5sSW5B6BCajEdl5WDGtB89gcyTVJ6M1mEVec2Zmai4xgnqN/BtpiwWNtKwpoJhb5tK3lbbOoByOFb7NBAEdI39+YloOz0bqAX059PmPWmZU/aFqg+Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676558; c=relaxed/simple;
	bh=NIeHu4ozqMa2+nVCwY8xC2WGYPW1YAI9tEryx993GPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VRduQ//Gkb4jCgVgA9Eq4GCXYyDje9Ii1jPhtfCZt0KYRCzr3zu54kGgaQkhRZIGAIEjM/bo9D6Kjhqp+PH8i7FN0ZefpZyVx+yT+i3gvzzxw+ia3Zqeqsq+Xy6LEScLGdpM9QG+SeDRdALc1z4nhINbhw04sEvQ+YjPTLRN5Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bL/L3bOg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWFJbpem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8nDLU2887912
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=; b=bL/L3bOgrSl0SUcq
	lQEqlB+iqOC9qFHNrorGnj+JkNLwMJWNgI/XrlI0e6rQvSAlThP0qkwOYzT6RQz/
	fpbI046CpIjYssPBn8QiTCHG6mOpgtMqBf4ubp/k/hG8hGwjvTVNIdS9RzYbmIuT
	hfKSNOQUYPMJDFFjFk2LVHytPwFogQnPeBAOhHAw15DhafSYSbz34pcxnHESFmXm
	IPUKBwsawWtylaqhllU977WRafkl0Dlhaxn3GgcYLAVysdOWuk+IxLtK9YOzeNb8
	wASLSt6zLJU3xbz3rjBbw+dr5I4DDZNOn3E5NVWsTpOEhgUNNEDCwzP04XL7PRjk
	PaYx7Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ggv5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514ae0edeb6so94051021cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676554; x=1779281354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=;
        b=LWFJbpemRgfyhvZ5o2Le+CDdvfRQ05zn97X/Ji/B6JGN602pcZKv/7yXsWJCI+e0Y2
         g8Y3lLB+F7hvPsIr30RH2+i6I1SIL4qVNPP/eqZ9Iw4Zq+sTtx22qiXBd3lhM02Kp1PG
         IHXoe5EA6Ziqc/3aS9afjljHf3XXDANSC2EQbKgT2mA0v3PY3ix6JJWxI6J+CzrUlc5F
         Wbm3NV2mhm7V9VyTXaKcis5vi54AiVMKHkKxZejRnW3rNNn5flcwkuuAKq0wZVtK4tvp
         p07AneOHFoXSC59FJiouuYpWbXh56r6dpDRWj0QiW7NOPZLj1exi0FUiktT/S/tn5FCV
         jnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676554; x=1779281354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=;
        b=YhWS7KU+zLhpum0SAMvF3AlgudA8ZFhWi83Z/ZJRQ7ulHm2f5CMbMzbjsrH+bkVVAU
         4qOhXvp8bECNISNiinAC9Yj622YScyINqDqEGHJj0sxzJdk/PNH6gC0EvIWh4adA6Nbs
         a+BW2iH+PDZIshsCy6CycL/rMfSOk33S6Ir0lzkkplfCimaqZegFzklXXLtMhPZXrBGU
         Ej8pvKi7z0F4r8v4ysYlxUNwsyJrmd8wt+Ykwvpv4Dfplejwa8Vg36q2+p+Xs1kyMoE+
         S6Mr0zCNIKoz8n51+mLXIurWsBqYMF5X/FICLYBqSAPiyUgKCFMa5smWLr5qnjese2pT
         wasA==
X-Forwarded-Encrypted: i=1; AFNElJ/wuCvQ6AJg4RXosnypjnwDWZkSubirwUfUnaNiWXhAS91gUZz4PTSrWdVhyH+qkL1SLE6dCW/6bsy2kyVP@vger.kernel.org
X-Gm-Message-State: AOJu0YxiqG4ddWoHExoV0rfirBlcs49d6Q/suQXzM99ThPVgWMjqBfMC
	sDDN/9QTHcr4iJoAu8MFPmZnDCTfeD+g0nG5S0cn2J0b+Gpvu047fRmXUdyinY2qX8Lvy4x108+
	W8X1BqU16MQrmaaPCTPgz7v9/0rln4NMZ0sItQXUEel7y5pH2g+ZV11iXLc+MHopW2//L
X-Gm-Gg: Acq92OG6QaF92uOzA9R8qolFAFj4jbWejTmMJSEDr6v4PuaxqhQ4eWwKQbvIR1lkRIT
	Q+Xs90ARBl45GEs5ri7o65epvkVn1FCHkyhZG8q+9QZSkBU0U89Q0SdPSZ2ZjUMLPdU6KI5p62k
	ADgPp6j8Htk6pO4YLzepIHQZG/TUUQAWWk9rdVvxzjGlvhSY2GJ+KWa1OEGeaT22h6Jb0RP1rJI
	zCvgsBL40C+Gegx6WK8RMPMBlsQJqzH2px1Weg7JLjx9DUzQ4zqdZYBKfknD2lZYQ/NomGJwEus
	0+XAvFR69tHwQnGWoDJcekrjeFDzp1IWRxlo/7L0fvP6/Z2/i60/KKADvQ7dSPMhmxrYVjYwSNx
	QnaI0GMXYFypY+A437vmxrFj8pJ1OXl6tmtZ4Sv3cYU8TiC0VWA30jzNx0qTzDkrz6S/2K85jE1
	g9gHuTFW7GrCGWso6ThFY0WGjK5lOk0gHw+pM=
X-Received: by 2002:ac8:474e:0:b0:516:35fe:5524 with SMTP id d75a77b69052e-51635fe8150mr11792441cf.5.1778676554135;
        Wed, 13 May 2026 05:49:14 -0700 (PDT)
X-Received: by 2002:ac8:474e:0:b0:516:35fe:5524 with SMTP id d75a77b69052e-51635fe8150mr11792121cf.5.1778676553532;
        Wed, 13 May 2026 05:49:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:37 +0300
Subject: [PATCH v2 03/16] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-3-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxZLscP0l1MVnT4xK1wp0pdlXa59nnfC7acZl0q8c46eZ
 JJkcwjrZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBE1hpzMEwMfv/eYHtzd+CW
 Jf3Jzplib7v23XsaIDP19yUZFh+xPLf7pb99GL/rtAsF7pddkrjq7Of4z61rFeM4a+43z/329+u
 huqhfYayCE1wOetnGXC6rvTU9csbeG3qqIV3b2oIKk91KYq4scpt2q+9bSU2vYFbCnNOTMplUZv
 M8O2rV0KpySFrzb3ST4V3vA91JnF1uIRwuNU78Wcw8s66mXpJboWO+4DmX8XNtcaYLPyVCP089K
 1Cqtf3EnWCTVfqrWn09zouXhkq9fiRXIabefOuqg7Zt/pm9jmVvrnQdENro/urM93fhHg+4q37d
 eGazls+pdsqWi7wlQfN7vd884kg6YCU6uXqBALNipdVqAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: l1wNYvRpctmReBuvv6QtUkhFUh4qJNvm
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04734b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: l1wNYvRpctmReBuvv6QtUkhFUh4qJNvm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX+8/mZF/6kCJP
 qehvHhVBcPGBhV0+ExNhdtlsmpEaELA3Z+kPX47FEjBy+qNKjiFdkrymzAtLSkfVxwz10bFxoTH
 IBrEJEfJyuk19PV9t7iJ4FV88MXyIsJ6nPZ3SRI0d/4vA5m1eWr1fr1/mYKPvA6YrbgDzLbMI+g
 bkk2QM/BAmNBtcDDLP9ossSw7QK0R4cq8iSn4tuq2llQVJC7Ubjfasui+dt3QQXGMP5DfVHygH9
 Yf2MuOvJmwv6rIHAhzfwzzOQDT0p3nHulH9x3QH6sYQGKnknjNTfb2lYnNc4Rt8HzPMd8XeO1Dn
 YL2QsKjKuPosYOzcu8LqVoGdKj1/Wt8NwniGeFUXQ41TRQLoZGpr61n4D8K3B43xSB+x0Nyrr2L
 +coWi8OCxOH02E8ZcZyhgDNfShPoTpHaS0OTpSfq3prhoqpBJBCA1hkTUm+Xc1c0CFUraH9DXZX
 DOWFRYJ4O3Z5XMDEdKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132
X-Rspamd-Queue-Id: 06C0F533758
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-107290-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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


