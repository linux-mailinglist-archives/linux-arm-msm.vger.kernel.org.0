Return-Path: <linux-arm-msm+bounces-118102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id do/pBnP5T2p+rQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:41:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9EC7351B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:41:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pWJJp0tm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QqQZS5mB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118102-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118102-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E080430A7783
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 19:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B7E3C063F;
	Thu,  9 Jul 2026 19:37:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7903C10AC
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 19:37:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625839; cv=none; b=Qe4IMIFK92jF2UcOAqMpCLFSaXBjP4G6dklc+be1P1h7QrL8NcWa9f1mDMT6s7GAhPAmXcG7FEkaokJoLCilXeBdFRivIk4o6wiAQIG9MijsyKGScDRSSQlOnxaw82tYFuvLeTacnse45nup/Jvz9wuWYGvB/KL7nnNu2KbltXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625839; c=relaxed/simple;
	bh=qG0CtifoWxLzmdZz8yI4XFf8t73NPwMCuHjhQKaS+x0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jDPLCyqfF2QgKtnS8Zyt3EFBzWWtJ8H/zfC+AHfCpp1H+TgOQP0BUxIctvRbhQdSIMPz7pQ5ioPPXODjN6MXnbn7GjUY3dKZheFuLsLG/b13TUbeSLLDqdcKssMzA71/aTYjAF3+s3CBzgYNIdGQC6CHUU1kmI73AVTg5MBbtNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWJJp0tm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqQZS5mB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXfsf2473916
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 19:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJX9lwoUKGFIAtUU8K6fUvLmeUVdKnCopXdss3WRzQA=; b=pWJJp0tmXUcl41pu
	lk3NVqdxmyw9dXrMUTTjJwH6OFDjwHRy2V8p5vJW6ffNhCG8OZKhqtgGnX3VPEG7
	h1EWBxHUGu9JJ5qzvyRiGOL9FXVJsJDLMPxM78KOUXJydID2gv1laAQIRfkKRvok
	QmBk3o97kti1Kw/mL/477XpauOn+mQwXQlKxlYMLqfM+wWKKTsTwG5ttWJSsR9iO
	xbsPVvF6bsB9QTEKfiU2OLK1z6B4h///F5wzkarFXBpAMBZF6BpBydla9CGiFShC
	EdO36H93c2UqVOOWS/dEePxukNW3SceI4qdhNK3uhPmlWP0OeQ4uDRaxAWDXgnCh
	azwEOA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqphq5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:37:15 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-969289fca9dso45494241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625835; x=1784230635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJX9lwoUKGFIAtUU8K6fUvLmeUVdKnCopXdss3WRzQA=;
        b=QqQZS5mBynZGMsu2G1xeUFgYmlONogsSmKkz8kiK6LslsO3ytFQ3y39/XnmaoPah46
         lz/n/ggFLJZJRZnUfFQjaHB2+ICT5WiGbP7VnIIHnpIK2rE3CEC2YXpALsv0/jFqz5Db
         0X44NPj+a8tgV462mMnOlzbMl0uM8Qcm1HHxwVAp6EIfB/a+WgZYTVJMMQ8TWNpPHt9a
         N9tGDe57fxeYJ+LloqTJY9aLs6eDJ+bKOp+Vs0LYabERMBifv9WKtYr8VFDIz/QJlY8I
         QeBnjQeEaIvaboojoRIkCeWMzFDQVsDIQ69Cf22l5ANZy//H4tbIH8qw13auSukdFr1s
         cpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625835; x=1784230635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJX9lwoUKGFIAtUU8K6fUvLmeUVdKnCopXdss3WRzQA=;
        b=QcjXkRd6u2Obj69NZUZRvi4Q38yJVw5KqEqANkc9QlKDCHtg0l6FjvTQyTEKYKhhdg
         doGNAg96ehM3P+IjPZ/lGo9gijGoqQ7/yzPqiaHFlswbtVeBcbyjQte+ArTI6PBcH/zV
         ozOuoNFzthlgb7x3HGSzWAspsnJSm3s69BYjw7fBNz1CYQdTgFT4cyXbaWCSH0OljYmC
         xJL5yVrYOfrAO/AvI6BMD+XBWLoulfKE4MFV7pDseNzpG2oumYBBRQcuhl47K5NeWrFX
         ttaroGNvMOJEvKm7W8cQcu2N72yAvqP4PhxEHtG2sicHNL6ybxrIQkTg5bzkXz8LEH1p
         DlUg==
X-Forwarded-Encrypted: i=1; AHgh+RqFfYJY40XYkkYmjgUN9e8Nxh0ifNTDgjJwILYzKeaWev1MEkXo9Iy7+rfKuZHbIUoC1d8CMnsGxLXvKmf0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9PcsL5/i3wjPUc2w/6GRW5UArSjIkUiDxrfrMeehrw+8G8Uo+
	LImQoSgnuMGlrHXCUMnpXdT46l+JibKSYsf6zmVa5k4e1yKfeZQEyhhCNuY1NlPvio7nIklwkh4
	Ab8bLV4DYbLuvKzNaUt/q79pMl7VDXb+LzCV48guYezi17CCEgZeEjj9Kkxf2Oj+ooRnojPOQ4h
	sz
X-Gm-Gg: AfdE7ckHosJuNTzdOwdLg9UhpQvQMhydQrbqhuEQDQTVq8Ep7MSxatlzUKlZB5IT5P5
	SbqxaX+Qk2KqA1g30byTlsAfkSGc6f4GJTUGefC8jbNRTRyMRKWMpYhESU24II/0uvwY4MdHUAr
	ancMsnpvBvzTOrtvkiifc6LzHqTm5V0zvwCkfQFep83DWnpmvLNJ0R8sUW1WQKLWpL8Fogxf+zu
	FN41J690VKnAV0oY0PAxmXqpAGWDLW4DdPRrHlwyDdkBdNBk6Y5W5KltGQpC+Oz83012osptFv7
	I9OzMUjCrp6TDXFORpHT1E9eBaOf9tjp3enrq7hp+2ce8/c6UCNwoucnq1s+Q9LnONIrTt6nxb6
	7Zw3ZZThO5sgl1AQrYkEZu8RujfcF1Mbpibxf8OLDwAtwwUczyTTdLxi6hddAuYpy+CbM9dx+LP
	W8vjLODl0fW1ryRRzveGAPYlfj
X-Received: by 2002:a05:6102:3751:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-744dfc58557mr4950827137.5.1783625833631;
        Thu, 09 Jul 2026 12:37:13 -0700 (PDT)
X-Received: by 2002:a05:6102:3751:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-744dfc58557mr4950806137.5.1783625833072;
        Thu, 09 Jul 2026 12:37:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 22:37:02 +0300
Subject: [PATCH 5/9] media: iris: move the decode format list into the
 firmware data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-vp8-v1-5-6af3ab578a7c@oss.qualcomm.com>
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13105;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qG0CtifoWxLzmdZz8yI4XFf8t73NPwMCuHjhQKaS+x0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT/hd/n2pj02XAiE+oZrq8nf+ba8+a/RprvvuR
 2u4OPNmYWyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak/4XQAKCRCLPIo+Aiko
 1d1gCACYJnJldpDjAj9E47P14U1dkuaZ+0Ffs6YHlccMOOWo2ZQvla9M9LPC+MfTA7MSrYaNKwb
 gJmj/AFB1J8iga/9sUU1fh62SGbA2U4KSM+aSOZTwubJkzD0gBAoHwu0jUMy2TDAbOJnXNJRWzj
 T7PocEHA9M/uu4cY107DS7pGVisG/LC/j9YwOcjLyaCtLuoFW8s9D8ZEJVZZGkrPBtnVYepGgZN
 RGccZCo9oyqMa6MtVQZq+Hkn82yE/3stupwPj0/C7dYOVPJpGaYPBoEbcxjNyuWTgGtYSJHT8/p
 nXf/q6h1LYLGhoTbbAXSGFonY75n3ulRfZhu0ALrdX2HASg/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX47h9o/7lgSqj
 6tghKBPx2wp00xFKwy0EFZgDNyy08PTzrNeAeRDfh+4plNlpU7UxVLuFUG0f6TlAPU/1mx4A+My
 2cicnluxjwvcxrDcrs7KaBMGt89c8s4nbooTAMfMnwtjeht2D00loLJuy6T+FVrz7nN+nzRcm29
 9WkRS/rrGpYz9krSOfeIRXm03H4mFgL/SRupNKuVFtk73MHVvylMRFpBl6/adh1G5F0w6FnXoEY
 u/7S3EeOwi2tpO+Ivq/6bRLP3hfG1YVbZ3DzCPPTUV2BLEeWzoz9qSYuA5v3eW+/ZI0Fusdl/L9
 K3lUb9QFlM9NPKWL/S0t73Kw9310T9mg2V7FLMu582k8rNclL4XopjrL5Dlr5WVHM66J4BgU0P5
 a0Gww+Ywgo4S34nY5SZeLfiNnnFJMbh4nRgv+XExfOkB4yMoF6/i46pU5/9+D6Gbeoia+cPbhg1
 Yqm6pziGljxdwBmZIXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX1ld2VZIoSFeZ
 DrKg+er65imPxEyHOy3p4SL5LS5GJ862ML+Dt06hW05Z9lHB0vUaVk8Sus9LLGFyr5m9aUji1ko
 AShju71xpusEuWjq/id8RGn/MPNAhYc=
X-Proofpoint-GUID: iU3oSAdpFRNpkJJeNuDSlP6cbes-ffwF
X-Proofpoint-ORIG-GUID: iU3oSAdpFRNpkJJeNuDSlP6cbes-ffwF
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a4ff86b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5FO-dSMzq3C07ddphnMA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090194
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118102-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF9EC7351B5

The set of supported coded formats depends on the firmware generation:
a single SoC can boot either Gen1 or Gen2 firmware, and some codecs are
only supported by one generation. The decode format list was however
kept per-SoC in iris_platform_data::inst_iris_fmts, which is too coarse
to express this - a per-SoC list cannot describe the two different format
sets the same SoC exposes depending on which firmware it booted.

Move the decode format list into struct iris_firmware_data, which is
already selected per firmware generation, and drop the per-SoC
inst_iris_fmts field. Each firmware data instance now carries the exact
set of decode formats its generation supports, so the formats advertised
to userspace always match the running firmware.

No functional change: every SoC advertises the same decode formats as
before.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c    | 12 ++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c    | 21 +++++++++++++++++++++
 .../media/platform/qcom/iris/iris_platform_common.h | 12 ++++++++++--
 .../media/platform/qcom/iris/iris_platform_vpu2.c   | 10 ----------
 .../media/platform/qcom/iris/iris_platform_vpu3x.c  | 17 -----------------
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c   |  8 --------
 drivers/media/platform/qcom/iris/iris_vdec.c        |  8 ++++----
 7 files changed, 47 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 4f205757647a..8119c639ec24 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -419,6 +419,12 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
+static const u32 iris_hfi_gen1_dec_fmts[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+};
+
 const struct iris_firmware_data iris_hfi_gen1_data = {
 	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 
@@ -427,6 +433,9 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
 	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 
+	.dec_fmts = iris_hfi_gen1_dec_fmts,
+	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_dec_fmts),
+
 	.dec_input_config_params_default =
 		sm8250_vdec_input_config_param_default,
 	.dec_input_config_params_default_size =
@@ -668,6 +677,9 @@ const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
 	.inst_fw_caps_enc = inst_fw_cap_gen1_ar50lt_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
 
+	.dec_fmts = iris_hfi_gen1_dec_fmts,
+	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_dec_fmts),
+
 	.dec_input_config_params_default =
 		sm8250_vdec_input_config_param_default,
 	.dec_input_config_params_default_size =
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 110b5630902f..6c1d562ab8c2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1236,6 +1236,19 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
+static const u32 iris_hfi_gen2_dec_fmts[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_AV1,
+};
+
+static const u32 iris_hfi_gen2_vpu2_dec_fmts[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+};
+
 const struct iris_firmware_data iris_hfi_gen2_data = {
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 
@@ -1246,6 +1259,9 @@ const struct iris_firmware_data iris_hfi_gen2_data = {
 	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 
+	.dec_fmts = iris_hfi_gen2_dec_fmts,
+	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen2_dec_fmts),
+
 	.dec_input_config_params_default =
 		sm8550_vdec_input_config_params_default,
 	.dec_input_config_params_default_size =
@@ -1317,6 +1333,9 @@ const struct iris_firmware_data iris_hfi_gen2_vpu2_data = {
 	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 
+	.dec_fmts = iris_hfi_gen2_vpu2_dec_fmts,
+	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen2_vpu2_dec_fmts),
+
 	.dec_input_config_params_default =
 		sm8550_vdec_input_config_params_default,
 	.dec_input_config_params_default_size =
@@ -1934,6 +1953,8 @@ const struct iris_firmware_data iris_hfi_gen2_ar50lt_data = {
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_gen2_ar50lt_dec),
 	.inst_fw_caps_enc = inst_fw_cap_gen2_ar50lt_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen2_ar50lt_enc),
+	.dec_fmts = iris_hfi_gen2_vpu2_dec_fmts,
+	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen2_vpu2_dec_fmts),
 	.dec_input_config_params_default =
 		sm8550_vdec_input_config_params_default,
 	.dec_input_config_params_default_size =
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9743573ab083..317ba48e6305 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -255,6 +255,16 @@ struct iris_firmware_data {
 	const struct platform_inst_fw_cap *inst_fw_caps_enc;
 	u32 inst_fw_caps_enc_size;
 
+	/*
+	 * List of coded formats supported by this firmware generation, used to
+	 * advertise decode (bitstream) formats to userspace. This lives in the
+	 * firmware data because a single SoC can boot either firmware
+	 * generation, and some codecs (e.g. VP8, MPEG2, AV1) are only supported
+	 * by one generation.
+	 */
+	const u32 *dec_fmts;
+	unsigned int dec_fmts_size;
+
 	const u32 *dec_input_config_params_default;
 	unsigned int dec_input_config_params_default_size;
 	const u32 *dec_input_config_params_hevc;
@@ -317,8 +327,6 @@ struct iris_platform_data {
 	const char * const *controller_rst_tbl;
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
-	const u32 *inst_iris_fmts;
-	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 8f01cf7f6d49..37aee82a49f4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -36,12 +36,6 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p4.mbn",
 };
 
-static const u32 iris_fmts_vpu2_dec[] = {
-	V4L2_PIX_FMT_H264,
-	V4L2_PIX_FMT_HEVC,
-	V4L2_PIX_FMT_VP9,
-};
-
 static struct platform_inst_caps platform_inst_cap_vpu2 = {
 	.min_frame_width = 128,
 	.max_frame_width = 8192,
@@ -89,8 +83,6 @@ const struct iris_platform_data sc7280_data = {
 	.opp_clk_tbl = sc7280_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_vpu2_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
@@ -122,8 +114,6 @@ const struct iris_platform_data sm8250_data = {
 	.opp_clk_tbl = sm8250_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_vpu2_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index b8099d7ce556..30c95621fa0e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -50,13 +50,6 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
 };
 
-static const u32 iris_fmts_vpu3x_dec[] = {
-	V4L2_PIX_FMT_H264,
-	V4L2_PIX_FMT_HEVC,
-	V4L2_PIX_FMT_VP9,
-	V4L2_PIX_FMT_AV1,
-};
-
 static const struct icc_info iris_icc_info_vpu3x[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -109,8 +102,6 @@ const struct iris_platform_data qcs8300_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_vpu3x_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
@@ -140,8 +131,6 @@ const struct iris_platform_data sm8550_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_vpu3x_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
@@ -179,8 +168,6 @@ const struct iris_platform_data sm8650_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_vpu3x_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
@@ -210,8 +197,6 @@ const struct iris_platform_data sm8750_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_vpu3x_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
@@ -247,8 +232,6 @@ const struct iris_platform_data x1p42100_data = {
 	.opp_clk_tbl = x1p42100_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_vpu3x_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
index 99c839a0424f..e569817a0c80 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
@@ -25,12 +25,6 @@ static const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen2_s6_desc = {
 	.fwname = "qcom/vpu/ar50lt_p1_gen2_s6.mbn",
 };
 
-static const u32 iris_fmts_ar50lt_dec[] = {
-	V4L2_PIX_FMT_H264,
-	V4L2_PIX_FMT_HEVC,
-	V4L2_PIX_FMT_VP9,
-};
-
 static const struct bw_info iris_bw_table_dec_ar50lt[] = {
 	{ ((1920 * 1080) / 256) * 60, 1564000, },
 	{ ((1920 * 1080) / 256) * 30,  791000, },
@@ -100,8 +94,6 @@ const struct iris_platform_data qcm2290_data = {
 	.opp_clk_tbl = iris_opp_clk_table_ar50lt,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_ar50lt_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_ar50lt_dec),
 	.inst_caps = &platform_inst_cap_ar50lt,
 	.tz_cp_config_data = tz_cp_config_ar50lt,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_ar50lt),
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9169b1335b5c..59200ca72ded 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -83,8 +83,8 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = inst->core->iris_platform_data->inst_iris_fmts;
-		size = inst->core->iris_platform_data->inst_iris_fmts_size;
+		fmt = inst->core->iris_firmware_data->dec_fmts;
+		size = inst->core->iris_firmware_data->dec_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		if (ubwc->ubwc_enc_version) {
@@ -128,8 +128,8 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = inst->core->iris_platform_data->inst_iris_fmts;
-		size = inst->core->iris_platform_data->inst_iris_fmts_size;
+		fmt = inst->core->iris_firmware_data->dec_fmts;
+		size = inst->core->iris_firmware_data->dec_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		if (ubwc->ubwc_enc_version) {

-- 
2.47.3


