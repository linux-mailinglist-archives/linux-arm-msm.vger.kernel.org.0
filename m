Return-Path: <linux-arm-msm+bounces-106261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DkFLJo0/Gk2MwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:43:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 105C94E39BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC25B302E904
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CE833E345;
	Thu,  7 May 2026 06:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sqb3+cLB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zv/ejK5t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C61342177
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136138; cv=none; b=TyulVOUmlcS3HmJnWyYJExFUV2XR/4XH/DxNLSw67vpsEjurAgANFz7werMfH6Y6sDj5PTQC4a0W8Iamjw7fyszKAlxdjzpq8AlA33GwKHaKv9Miq3uE43FSvDJmwfHqy2PzAEvWqsCxJZngS2eGgXAHLdYZ9XBjecAotLYuPHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136138; c=relaxed/simple;
	bh=jaIRCRQ3d69KBHmHN0Ry0EKvqFuijis4q6NGjtukHfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=INwkZXPi8unq4o0zis20Iucf0Cri0vJVl+ILN25ahmrd4/gpZjqzSJ1NYBJIZJNNaT9BWWbcvDoz1z+Ul9dpwhFbDqhpFXzrxW0PFi/UTi6uiXfV9JuedNJkiqkkviRpgrwcOuQgtqAUGawsJJMPvCFrvpYb5wYFQL0uhrQUMuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sqb3+cLB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zv/ejK5t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475LLPO1067923
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B8G0+2ZSIN+qIPIG7cPGxhr6UssK8Trq7L9tfiuvmrU=; b=Sqb3+cLBJX6M6a/Y
	jociyz9Xcge8h6fNurnPLQfCC5TPZusgyVubo93xQ+Tr4D0W8DUCrUsc2Fw65PET
	uA0g0lKeP2PghiHKIMg7JH1GU2+7U0esn0gdC7QeT8CR8BupACk0OVlvrDYgKHUp
	QCJMAy49L3ZEaX+bTPw/NJT/0gL3+fxPwfG+X+rj1FYhvD/HpM1N21NYNGSsbttr
	X6C8XdlrEQJMmklSb3pujVmjk31TF/3wccjscx7AU6YiRU3A+qgl85BbmE9f1LbT
	DWdLMbHvXaW43qzTvp7D0L4c7FXp7KG2Fl5KjCsZe1XZlkhibrPDHIjRf/7o0YlJ
	4l4Dtg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mh188xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:42:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3403e99so10701551cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136132; x=1778740932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8G0+2ZSIN+qIPIG7cPGxhr6UssK8Trq7L9tfiuvmrU=;
        b=Zv/ejK5tStG8bKpmUkr1XT0DqGK8ZCRX3gQxD6VMnUNZ8SE3Pi4pHdCKI/RLeyiWwH
         9TT+efqYhLKosVUuo58YoGFgD8CJU58XaMUZ0x7UmqpARXeXwUjM6BAF43G/HNILAvO8
         A+Gn4IICN8nZntIMNCM66LUi9pDfQz7y51qSq4mkmoPGItbVJOu0Fw4YMepL7oxhQtUG
         /GOsnZCVi/tVR8PDYe05IPhfUhKMU/kSsDvtDKTVu0imXxqbweC7zli/bs/ZJLROu2hS
         P6fivPLn7aWEOd6DqUoOsjDzYzJgUtSiX/fI7u1kP4oEon1OefcBJFSn6lkzRpdGK/gI
         260w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136132; x=1778740932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B8G0+2ZSIN+qIPIG7cPGxhr6UssK8Trq7L9tfiuvmrU=;
        b=ok3S9p5q4tFVt/IuvlYKkmhKu6xBQ+ug1MDPNjcbE4+5SRKPB1m8YMcbIfO2iwba2X
         oRlZT0OEMz3+ODUYDlL2symA5eC06omanr1bOxsm6JuKAv9vnUdLPvsgaU7C3Zs0ZcK/
         xTezJFfwW9i907cCbfJlxucptDJUN/oCky/wy6zchKjJAcu/A0EWVomVZXldyjB+owla
         Rft7sD+dkDT7WF+3vDi3yXFa2BptHMa1rDcaLjIDqDzZ3dezFNee3N5LK7Jghl41kQs0
         UvLVBRW9KWx3pSa8zuTG2/qiOe1pyU1CafAmHTo9x9+/QzNncOs5QceEj2rW1zjnR4oZ
         AQUw==
X-Forwarded-Encrypted: i=1; AFNElJ9zqlfS1MT2XVDzur8F0hG1Hxo9RSdGlq1L6BcEoF+rbM9AojZ7AsLm7OtiviAYH4KgWynWL0mUCfmRll2J@vger.kernel.org
X-Gm-Message-State: AOJu0YzXb3JsJWVNgVjMSuHoXtvyYfwsWhF0+LgRlXhm//pqXBZi3eE8
	PYqB/vugdql+pG94zKY9+gRs6j9NRkjTIyU+NPMoz82NfZeKaTtragRE79RO3tDwhqfJchjiMYF
	tO0nf0t/I4lxAmfAOiBOHpF7r+5eQwYB6IZElwrJuhAtxy9vCGnl0RJCAWhytSksttL9nxCWxtk
	aH
X-Gm-Gg: AeBDiesGb8XliWegRO3fwN8hNNZ6Fh2y+PqPRL0Swe8onff176nRp/dlURrt69QTzF2
	loXSU4ujzpYehbQ0/uzQm6ySWAqx6vUA0z9Gqy4t29CYbb4EnnPJzR67p4PJEgIjZ5VCnqhXO5/
	sviuhwR1g2FA3mc7V+BtfPIhe0+NRP50uhjJywr3DNsPJN4AAOJLhMyXeS0IYG2ezj3lLdo0oer
	Lbe4jRkpqM6rdmK1kvScZXxdf/cpMB85vG/O86bqD57YNXBUJQ80ru9+FdbkH87O3HWP3ZlUSe0
	nAZnx5pUegZ0yQB74E+H3NJ8+WiSEcatT/xuYR7uW3bgwhQc0tq8E/vP0XrlnecwIdSB2B+bv8T
	HxWio2HsUdGE764L0PIlTUaF0nGB4l2wz9t5z+C2WEoZKe679Y2vcehWcJTn4Hf47DYQgFRY7go
	Ms6UUVwQnUWSLnELLid6tsuWglGo9TvwMKoY+y0v6xEBNlvQ==
X-Received: by 2002:a05:622a:4d8c:b0:50e:d316:fa33 with SMTP id d75a77b69052e-51461fce4famr95530231cf.39.1778136131605;
        Wed, 06 May 2026 23:42:11 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8c:b0:50e:d316:fa33 with SMTP id d75a77b69052e-51461fce4famr95529971cf.39.1778136131205;
        Wed, 06 May 2026 23:42:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:01 +0300
Subject: [PATCH 01/16] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=53Divj+Z2S6t3+tbeAUvd2qjozMuWVZK/b7AyLFa9bs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ9WEne1cLGwyNkAVonc9IE9/EVCM7kGFClO
 lpVTKdLAkeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PQAKCRCLPIo+Aiko
 1fdcB/44RBJLJQ0xHeBwE8QYUivW+pUw5XJmoYLwZSqHDfcZ8MsMZchHgMfrc7Yhu8PRYmy1/nz
 WcK4zYVEtouSH8sMk27IICKPgF1Ixh4B33J/+a8BwoLV73rfr4gQhFVqMyVROf+rRQHtQiywqDf
 xHnv3kugeq68RbYjbSLE5paSrsBOiKW6DFFysOR9mZpka5K0d2B7/KZ+s5X0FNE5m4HQP1A6OQk
 koosVq2v27bHQf+pf9vpgo49zMVz8VZ2sbAS9DSjvAxcPzEAgArioFWMYrsZRfzjRSFK2VAI3Mr
 8TbPDXzoEFGZ++vwDilk/h/EaKEZtibPrKau8qJjPZw0+l34
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -BW7TbRx9i-gG-bk_LfYJ8-c5cJZ53yz
X-Proofpoint-ORIG-GUID: -BW7TbRx9i-gG-bk_LfYJ8-c5cJZ53yz
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=69fc3448 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX1Djr66l6bxoF
 kdsUS5qcLyWlop3DmjAUkBsxSoP2z3Zb9CSuMXLlrdplLr6d29cmiHWtMSVIx1rMBl1292aecdh
 Dkn7KDrzgBPh0iV85/08OQZOsZEZ89bVB+Af6ZEvXYsoPug4onKpriz9QRSsAfz4SxdrPCiPBrh
 /Hq5Eu0ucby+UdqAzeBFDk7cBMfXBTOwGeAHEIl3i1L2cWTVJ3JAnv6/vmx1XSFGTKPBcbvzbF3
 E1ip8XK+qWNl7nny0enb1Tj9zswfTZgjaoc0DAsZ/VVpYcEOtbe37AH2xeeDgD3XcfVdYbuE/+1
 of6gBzepoms2meh/QJUwxOtAPvxwJeTuL8iUTuUXT/EN2NGUSAqHtw7oQ5DEtnpLQrGuwOkY03L
 Lk5CRQGQSQ+eaYhUosNWZ/AUFME9aU5+jRuWTswiT9AxM8RCXN4nSSqt+rGxOBeqL2lNVJD1EHx
 H1i5X/tJoKpGe4wL3hQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070063
X-Rspamd-Queue-Id: 105C94E39BF
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
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106261-lists,linux-arm-msm=lfdr.de];
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

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3


