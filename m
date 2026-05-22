Return-Path: <linux-arm-msm+bounces-109333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBdtFW9gEGpAWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:55:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2805B59ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 853363152B1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EF944DB85;
	Fri, 22 May 2026 13:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFm1zlHV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMDIhkNr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C5544CAC6
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457240; cv=none; b=E5ti1WFGbFXBtTNT6w267n1F3FNilfY182gcD3dVtaWnYC3VHo6z/FNguHVDukPd6lUrnES91lW2lHgwx1aMXPEDPCuxobJ+Ek0bdqyc4oygqan5kqoJEwPuYYflYG/H1CFJ+bFpzNvNGvtOv7NDoSIVsZ0Pr4Xutc6EE7c5m/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457240; c=relaxed/simple;
	bh=bxwOj+1r4hE0BIdCr6O2vUvIE65d0GfBKW7+Xew4ns0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DEpC06F3u8V40KzkYWuq1Ckc/Fjg1gOu62Hv91MzmBhWEdcapoDCclaiAGZUhW6ne/RTOb1snNouekRECAjXxXrtP2+DOLP3K2JaGntMiq1HAqOmvttHGW2BdcZZoMom+1xaUbm2H9mMzkI8XKdZjalQe06P3TJaLhqRbUGQOBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFm1zlHV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMDIhkNr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M98egW3005817
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=; b=hFm1zlHV59sE12if
	pH8nBKLuhP6tWQZ0fP7EK7qHeZMHzzVSn65kEsR3gU/057Gti5OwtXpDrMq9fm9y
	TluGSxSuzgq2UOdFUtwxn31I8KMEjnGq5rbycHpvhIlAyfLSPulmXS9GzaOkyz+S
	wdU9TKltnzwoyBPKJFxwG8+mc/pOhfjBR4pFYT9vzh/pz3B5Ip+1RpEtlCf34rHa
	EZpl0mYsufGeMNgd17FHUuo7PsQlzB4k7eVilvJU+M9sLOq3wh/pOkPpH4cszi2f
	NkZo6Sun0lWJus0/deIkBPx/CNeUsq0zduFkQsrf+x4/2hNbdwXeu5K0d/Jz7qj0
	ofdc0w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrta6a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acaea1ffe7so217958296d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457235; x=1780062035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=;
        b=iMDIhkNrs7zwWiTWV9K93dC9SFDj3tYoFSzGcwvSLQloqSTisitZQa68CgeBodJifj
         bn9e3AnBJ0alYv9Pbh/jY+jSTDaiFspQ2w8bhDOUQolXO0oVpV8hFhpUwdATTo4RFbJA
         +nmKTf1pGtJ9HweHms7ZrPnnFoLard7/+cWD6MFlOr1XcK6pabFm0j4THrBLOSZa9yDd
         epb9ZmW+l709lydwE8GvDZj2af2r6KZjI4/5bZmP6eEPkDd7oSRLgd7MeFPaDzZTBTJG
         EiiJ+KEZK6g1pa2rN04n5YoHEeonccbHNVhlRmx+/TIfmrRNqknvAmw/i5tbEnJsZibx
         gudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457235; x=1780062035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=;
        b=C1cdb6cPsqQdpGXAi5bwMUUNmJDKDt//X+8j+TAysG/OkM5WVBTGgtWdn6AAM3kWvV
         kMiizqjYAktoRPB4KFQJd136yhXf8syZcfngM4qcHi6UWN5ktmrA3JdEqeQAno0IC0T5
         hU6TVc1779EejICfM/+AOepNv9FrS+xHP/aK/bYFo80A4HfY5qf3NppB8rAJygM3lWay
         lLxNdnfAvqkad/X2x+fsSh/LGnSbtu9+ZZp124hN6Y0wISSd9KjsCnoQAiT2UEwsYaSX
         3MiY/MQTM8vkkhxstg8AS+dl0hwGIYAGeel77GTlT/XxeyXsc6nzpvWiV1YR5Uef7hux
         c4fA==
X-Forwarded-Encrypted: i=1; AFNElJ+V5LNf5W9TV5Z0zEIsuguGsOv+aDVqbqrFFwoeG7h+jWUlNjEpOT4BFGsO1MHyn8dDSt8fJJLACumg3vse@vger.kernel.org
X-Gm-Message-State: AOJu0YwnQKb03tJJXEEDyPYU1UMdR+hHA8DGcKTVYZFj0rPi0vdp0y70
	+T6UtgWbQKNJ0deW3JWVRyEl7SysUDwf8/IPW/7Zztya/H0CaPD1AOm3uZtqSpbSiiEV0hyfL6p
	BcMshZm1/gm0c/z37sx+OAnBGmsFxNmNKTn1/DDC8xNtjG7fkbxe7m62uEyaYkSfgeSMF
X-Gm-Gg: Acq92OHN4880eerd5zmurQX9wWnqw3nXkNcnCrTYyV/dto0dmTh4Uk38Mpm79mgwG1S
	efyaqIu4gJsy2/bx0/7Qepakq41t3Dpa2R/skgc1ewnnxWCphvPiNpOpL2O29vy+t5axH1C5WI6
	0+UHiGYGMbdlJGYVzh+piPMPM2pKfeyFSwv9nVQDCP8WcPub3uiCKlkoO7p043i8QqvEdkS9hzM
	GOa1LT8uWW9YKPTgRGQq4oQdwao8AMFQH2UTlUVOChT+Gvlj4TQ2clLQ5wG0REuiou5peJOswmu
	oWVbYIaqIicO8eeGFjRzh6Uuhm9bltc6QCDmAdGpEyiMQ/Qridrjrjz4+ThSYdbFoTPLlqSuZDS
	YeH+AwvYt4YSEMtEOH/L5Lvcz0quCOOX/5kYIdZy7PbMn5laDCXutl0kW94n3
X-Received: by 2002:a05:622a:446:b0:516:db5d:ebf6 with SMTP id d75a77b69052e-516db5e07aemr19429581cf.59.1779457235453;
        Fri, 22 May 2026 06:40:35 -0700 (PDT)
X-Received: by 2002:a05:622a:446:b0:516:db5d:ebf6 with SMTP id d75a77b69052e-516db5e07aemr19429081cf.59.1779457235055;
        Fri, 22 May 2026 06:40:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:40:01 +0200
Subject: [PATCH v18 08/14] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-8-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qxst61jdIT+8Ht+en2AytpIG+5WhKs6TgGXh9cEYbqk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy6BGklBaP1lW8n9Q0gaQ++0gYBLLHAPfPUj
 Pn6QDYsHf2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcugAKCRAFnS7L/zaE
 w21JD/4iKA4zWq1eo8131QpnLuCtj0jhM/ZelDuhM9ibrZfv91X7S4xQ1LFEKU0g7zq9/dfmIbo
 QBDd0DRHFHuoxjwJF47NHYwHeQsnWtuQaanIlkITMdxltp4vjT9NSZN1ls1mk/KdfUBwdGg7q9t
 odm2ClpGr/UxBis3w/Dmqp0jox/D5T0YFE4xxzEkLWnIsjSFvo4lH/mL8IQbyH/uBOC0T8fNdu3
 2YyixuTnTC/Wr+lHT37sthmfP1J8vUL+l3Pog8Os3LTz+UVeLaM4xaOEmPgQwldLjsRxYtjujGt
 ID6a/vSU3AgusypMEuPexklUuxUba/4SohLgBW11Jg4CrgFFTt1CBwa3nJx4w9H38K4jxBBdAEA
 nFADhoYg9ISvEbMutcACZbTrtaGNrhwkx9l3HliHrhVGJAX3FMBdwVxHnrv8EAK2ljpfI5eHSnB
 pAcmC10IlfcpBUq+BpOCy5PqEVWxEzp68go8jdiAux6NC00i/izE2baJBjQUOx+YNevTECGPsoh
 OpbDGgsNqfYck1Za/oVuXor6E/pQ3woJioHCcybDuCQB/tty24iWhvjLZAGoaDALiFVrsMe6kN/
 SZw/Yz/aJM9+eicofXDvybZpmUadpzf+RC0QQxcpuCIiIZCEYzZZaDt+N9c9sNIDvfRCw3IJyi4
 tVBYEj1xMmvK2dA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a105cd4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX3UQGsXuRsmrI
 OC5dOSIjgHvCM2KdYRsqEwTEYpDwlhtlSqnUY36V5t7Rl10WZn5n0t1W48UM7b+r/YGjOLKg73n
 F6Uv+JjUFrp+ZmKSJKpV2G0MijuuBV0xQfKq8WeHkYzI7stEPFTKiHskCN5CsDBd07B9+bIL+L7
 KsZ4kqmaDADNG3xBGYx+98oz1xNvLSDf1th6AGO8+QtcqePCOTK/9UbiXo02u+fh3LpsPeF3wKh
 /Ni4Njbsx0ZW5bT7DydaSKEUdyj18C+UEIUeTnjkLd+3LKTGfCP9Pz0PnrxAx13saXmhmfrp3qE
 QiMeEC41dzSAenevPUBjBvxQmIVa+sGGAELWAv11tm11NPRCir78uZg8mB6RTzBKSFNN/shGrnO
 LBF3i2YSC64rTnCeFBXI8YEw+WPFnxd23Ekad4tlqZrHzoRz8QPwJwetyy0m7ezQ++5IcA65nT0
 +rgLzpkcuLLOaVfSlQA==
X-Proofpoint-GUID: ayYcd_DqyDYttTRET6--i4HA5rQE6wOu
X-Proofpoint-ORIG-GUID: ayYcd_DqyDYttTRET6--i4HA5rQE6wOu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109333-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE2805B59ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index f671946cf7351cd5f0c319909bafd87e3af701c7..ad37c2b8ae53a373bb248aff06c3b7946e8439a8 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -13,7 +13,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.47.3


