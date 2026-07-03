Return-Path: <linux-arm-msm+bounces-116344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8uPZFOjPR2qXfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:06:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F22A6703B48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:06:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pSjNwadW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DpWP0a5Q;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116344-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116344-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD988300F14B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40B2414DDD;
	Fri,  3 Jul 2026 15:05:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C1B355F22
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:05:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091152; cv=none; b=gUCmo9qsgL3plE7d/6DponhfeNdOsbmrkqnSdq/2/oJPsiLS51ftkdlsJdk4B9oEVIdKPF5CME01Cm96d0ummYLF32fcrSkQtxfg0LsT6EmJiluKWiPZtCgvm3zgxDx2tTgLWfKNV6vJOejr7P9TODxPSdiAKbemwnNUMQw5NhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091152; c=relaxed/simple;
	bh=+1AFISiUFHQ4vbjZNkqW9aWZMrSy4vCzMTnu4c7NCh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPZijQZUoTpwtlz5bGAYbs8sUnSNFHqw+7+BY8KjffC922Q9HPNxauGheDe2qX6VNLFrpv1sJKQriEbu8NPB7dNzFYDMWddC4ETu4NsfuOikoUrc/WdHW0Q81oqvMc2InX2EOMCQUtWg2NGR/VclHptgfw1X435IyeTLVgfm4fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSjNwadW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DpWP0a5Q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663D5dpS3195080
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 15:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6WeUVekFxFkuveS+M2x0ccM56quUUYg6HrGNJ97KLF8=; b=pSjNwadWc5o8+Bx6
	hts1chv7RdRcidjgnMa0AL3V8enFnXFkutJhZFIcwXOLJN75Xivfyluyk3PxYnZt
	SnuI5gcRqHzjhsMDDkRb1LywXMzjaM5fOWIVLOohfcL2BuBSwLDigj3XD2yoDfSP
	DzIyp+ZISPoNNVF5ZZlDtJ8kSqRLmbqYgtzA8WG4S5Fjl2jKqKhla9UCqZT4fIwa
	J/0PrkDNMsOV0Lpw4s/inRnW5e6gU2FUSv956Eu8RX9A/emQ3ROjLQRoCGIiCzLl
	mn1ymqSvkVKe9hQLp8AaP21zbsyeF+yAf1b+KujIxdLjq1rzmsDPun8JjtoXbgwp
	6xEgjQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyspfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 15:05:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca3b314193so11391885ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091144; x=1783695944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WeUVekFxFkuveS+M2x0ccM56quUUYg6HrGNJ97KLF8=;
        b=DpWP0a5QcsiQURy+sZmDvmM8zWNmKSLj2gAV5rxPcrCD8Gmg+kPer0eGGKMsxazCEf
         2rcWypfHObDDhfIwXd31eqFCeejesFuGdexO2gMaXJDx04C3c8/GnC/OWhkls3vf2Iey
         17j30teUPvSNxb5BvU20r8d+DYT6jcRvr1h6wz5gzCA1WlIEFR99JVzn4VdfU9UZ0ie3
         NDGDSaIzYmXxPNCpXjNQiLN2hktKhBnD9njrod1pRN6b+5ea6jTNAhBJu1qEE079vGwg
         mUuXY2aCEwyFdTP1nXLP+Y9+Vpo33it74T/RB8xw9o86fG//lGxTmpvuW+xw5RUCDA9D
         6/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091144; x=1783695944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6WeUVekFxFkuveS+M2x0ccM56quUUYg6HrGNJ97KLF8=;
        b=BHwJP6jYfqvyxMuCopsIu7z5WB/RbkH4COfJdcrJomonnwAsG9YUS5fAwvVTI8TMCK
         bnNoYd9zVUn+yOhBQlATdo+h5NoEOCejN13OlWKhlx+NoW1loJRYJT8dRnsn3S3emAvo
         nfiFTiQD5KKfBW5S/zt5wT1HP4vIeXl0eZfzp+JcHOVnQZAW/AG7YzPZim2/ush3GGUZ
         wkgv1EXyrSypqqJWivuhVqHkCwHjhAzaywdONkw92kIOIncrghiMOjDyzcyG3x7jJisL
         p4czykqwwX1wc13CqS8AQNlH/UMk5wL6tDVKWui9ZbAxnImjyG7SiExj/r/7Fe+SKp2O
         QeaA==
X-Forwarded-Encrypted: i=1; AHgh+RqmLGAk1bprzxdelb2hCVW+h5VNpNu1tdL9EYo1XrRJJ/exgpR0zxizavpxcff4NWY49Q3nK92dEauxiY1s@vger.kernel.org
X-Gm-Message-State: AOJu0YxlRXbRKnCpIn358w3LceeNwTiEUPy0zTtB4x/NbPnAxkloI9dW
	GVjNPE6W+zR9WuDAfuvVcZWnN7HMSlVywi8VszAsQ9IiIrf/gUB5yW4FQStofLdXaukjHcg74ae
	itelOZc9tumAwGFeGIMoUoSiKMz01MVaQ7B+sOMdAzH2Una6L3Ol+eXhyX8Msh2Bq/z8w
X-Gm-Gg: AfdE7cmsP7/RkeDdhyvzqAmWXiQRrQWQoPn/l3EOoFTTjeuqDJnkdkTpuocsqH5Sq5P
	ap8cIjBgU7qYCWNZSuC00etePw02qCsDqG0WDqFBsDXN54gtKjFaRTSQkq3NdGbb+Qulj3QR/Uo
	8TYX88YYrhD0MjGJT3IFlkniddvsp0yNWA+GUGy35Nm8X/h/OLZ0dLOgVM7CK5F6kVWBhwhZWCl
	1oEz131P5bzIIqF6tSZNRpI/VyKYAg0DfxzdD5UBv21e9hF7qmQiaRHPeuPEhDxfUZBUj3nRjX0
	/aS9OehsU9K6Wcm2669W0cYbo+lAd05f/rsR2un2leyCBzEQjRa0b7Rg2AqNSRH+8AtRG9BBx9r
	KrpOkmREw8grI0sW2VO9BV1B0zKif/xQWSYy919o8mwCH
X-Received: by 2002:a17:903:2f81:b0:2ca:d151:382d with SMTP id d9443c01a7336-2cad1513c0bmr45356585ad.14.1783091143875;
        Fri, 03 Jul 2026 08:05:43 -0700 (PDT)
X-Received: by 2002:a17:903:2f81:b0:2ca:d151:382d with SMTP id d9443c01a7336-2cad1513c0bmr45356165ad.14.1783091143295;
        Fri, 03 Jul 2026 08:05:43 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm32904517c88.10.2026.07.03.08.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:05:42 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 20:35:20 +0530
Subject: [PATCH v2 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-1-578b78a0cf46@oss.qualcomm.com>
References: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com>
In-Reply-To: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783091129; l=2052;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=+1AFISiUFHQ4vbjZNkqW9aWZMrSy4vCzMTnu4c7NCh0=;
 b=WhkaOSwYX/KACsdDCwK6cOceV9G9k6O41aw/xNJptN3pHVbX6NRj3bPwGg3tCIGB355tgCOhi
 iXsJ4/uG66RDjut+TD+/pBhvFZr9wz2auoG+gT9Oy5f08xH8B+2oKG2
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfX4gUveMF4xmhJ
 Gfpa+SGMrYVQSikCEZ8GE918MF+wobQ4WvBxu9dlaVvpFUj3Ap1s0iZkxtIhOj5MHamWz6henuL
 fzCiwfTxq5v5Pfm84lFLlk5H5AZPzF9EBrRLzjUPivMFcalAFvXYh9NSrx2E2LTLaUD+9yIHnGu
 Xe2egY9faGrv25tco4Lrd8kGp8w0SHuuMMV13vKn2w6AaR4bKzDSQOB4KSmVPZtfSWMTfmAYnBW
 2TQR9I1lymZDj6mXpt3k28YQ8dVnofZgL0ABGhTM5aCZc/4gYUEM+tuHDR6zMTqalrhlAVcOQQP
 bkp0FAzQFJgfm7tEnkxBZRbRttLaFZdMP3a6N1XzYEwrFsZcMb0hh+/D59176CjU3rFMDfPAFaZ
 Lijbs671/onukpEJ/rlyICLBWwT7lhJrOxB0MlGgKZGJCuy9mAXebGqN1j2JYOBIAdrfxBpKE8g
 AEA+vzhYRgRQjVH2WkA==
X-Proofpoint-GUID: DZtoxkDf-IJ0jNVRA5R-FOxC8pXQjlYW
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a47cfc8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4WVRsyPI6hImBWJIeNoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: DZtoxkDf-IJ0jNVRA5R-FOxC8pXQjlYW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfX9qzN2jztfCjE
 /s87xwEYg8cxdPSUBJSA72IdgB9G5gVhXFxwxvX3oqAklA2E04xGo+Uv2a96z/yuecfBiXmEuIM
 7SQHpUVl+R4Cf5T5hk13vZhyMNBTLMI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030149
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116344-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F22A6703B48

When a runtime resume callback returns an error, rpm_callback() sets
power.runtime_error on the device.  This causes all subsequent calls to
rpm_resume() to return -EINVAL immediately at the top of the function
without invoking the callback again, making the failure permanent until
runtime PM is explicitly re-initialized.

Unlike suspend failures, resume failures should be retryable.  If a
device's resume callback fails transiently, there is no reason to
permanently block future resume attempts on that device and all of its
consumers.

Fix this by conditioning the power.runtime_error assignment in
rpm_callback() on the device being in the RPM_SUSPENDING state.  At the
point rpm_callback() runs, __update_runtime_status() has already set the
device status to either RPM_SUSPENDING or RPM_RESUMING, so the two paths
are reliably distinguishable.  Suspend callback failures continue to set
power.runtime_error as before.  Resume callback failures return the error
to the caller but leave power.runtime_error clear, allowing the next
resume attempt to invoke the callback normally.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/base/power/runtime.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 335288e8b5b3..70d933bcd295 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -469,7 +469,13 @@ static int rpm_callback(int (*cb)(struct device *), struct device *dev)
 	if (retval == -EACCES)
 		retval = -EAGAIN;
 
-	if (retval != -EAGAIN && retval != -EBUSY)
+	/*
+	 * Only stick the error on suspend failures.  Resume failures are not
+	 * treated as permanent so that the next resume attempt will run the
+	 * callback again rather than short-circuiting on runtime_error.
+	 */
+	if (retval != -EAGAIN && retval != -EBUSY &&
+	    dev->power.runtime_status == RPM_SUSPENDING)
 		dev->power.runtime_error = retval;
 
 	return retval;

-- 
2.34.1


