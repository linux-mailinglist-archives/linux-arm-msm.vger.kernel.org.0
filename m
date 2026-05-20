Return-Path: <linux-arm-msm+bounces-108820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCUJHyrTDWpP3gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:28:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6258A590D56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BBE7309CF58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A83C3F54C3;
	Wed, 20 May 2026 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTcRUO9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZLhPebip"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE83E3EFFB8
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290431; cv=none; b=pcRI32oBVrk3z3A1mXHHjbv1mbVxhIUq09kiuAvo6SnltsT3wj+OPjdrV+BQyqFKF9+HrX2gHAhTHQ4Y42/pHE95xO+R7Rd07i6lcGzTUvECtkADm8rVzA3bNuLmU44s27Hr9P+lTlEaFb9roZg55FeVL1pBAo0289FWX6HqqYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290431; c=relaxed/simple;
	bh=w/o8ALu3JhTui62UkO3C0AbOHfMtZJQPDhlfOzkGK7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X90W4uTEyq8nspwcG1DyrrPPxw0SgnBiVMq9t4k+/EkLk9XDbYZOx25+KeiC5UBpzZcge9/AT3wKlrYv/yqzeB9T0Fi+jZwJnzIPrUsVqQS1SaAs7gUKdhOSOMXG4iARh7c2oLkM7aq/ZLWXi7XjpQY+RUEibu5z4CPc4kep7xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTcRUO9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLhPebip; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oMsX1177868
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mT+rMK4/HIfny/f0nd19A06TzmRHuaqZ9n+4gyyLAbs=; b=gTcRUO9WY7w9IHBq
	auVNP/PWNdAhI1JDrkGv+puTAs9PpXorZN5RUNjQianQ+YdeNO9TPyIYz3MJOgFV
	BJZxcKBPEFEP8pV4XQBpE7ekshDVFiMq2IS64bgxSKRWTKfIoS9o0tcTVAfLiLgr
	JaKdxj66r0t9f3rq3IRi0qxDJdvsXgQMCUmEUMxG207XAp0YNIi1NXUwif7nY/lL
	YAXoqYIdamdvViB08Xcsym8Xirj+eU2qHCV4tLlzn6/1fOHqY9jxFtEObzv4lID2
	VyFkjXCFJfZXGof0gXW8NdQvny8aKTr03A5j7WPxsmKfVLKyLoEpeHSbPilHoA4V
	lbMoBg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6s829-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:20:29 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4718a1723a5so9598593b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779290428; x=1779895228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mT+rMK4/HIfny/f0nd19A06TzmRHuaqZ9n+4gyyLAbs=;
        b=ZLhPebipYPdVlkuDc3nYuv3uxf1Wni2t9WWXfxybT0KjbIEC57xO9KWc3TPLvDPEqZ
         qCCpI1DJO7edlMFhtNORdxBmBRwhDlqgm1bsp7A7Lf1pfZzptICgI4S3QeucLIyYd3FY
         XV/oMJjIPKiY6wEIxk4qC2imyQB7lEdwAYWScFEy4Z+930MZV93uJWa+jX4nr7ORduHl
         WSP1QagFejztilRtRYcKIRhS9EVybfXSwevYInIYyyJoJasKi40wo4lNgjWyTsKWALAC
         Ju/0Yfrh4CuZ9xg3ERqWO8DuIUH3bFPZELcsiZGtSNvQvEsa4d/RvbJTvQyqxWP+HVWr
         ZPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290428; x=1779895228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mT+rMK4/HIfny/f0nd19A06TzmRHuaqZ9n+4gyyLAbs=;
        b=BMbKu6hYo4CqhMUrS30QA6HMJ9bCtWoLN7TiDjPP7q4t1QnKibR534n56eDRcdPpgA
         E8RbWMYwHeaxTqcdgBpU2jYkA+vn27sunkqVT6CcmazUeidUOhaJeJurJZV8i9dzNDSZ
         MDoktml/MuDU8Bp8dCKc2Q1+CUcH+D1gWuOFaYbdsKbhSKs9q1j13ZCLCUAIGTWrqsJP
         hY5066GcmZWM/4vAXrYiAVEmxHxz+cVQ6Ux6/L7/cara3tK8H0QXSgHrLWlkeIM9s8m8
         HGG1zx4zhYQ9JC7D+y6Ov82Z+cKKmfGw/UaIrMNtcScERJ/PC+ZBYhdrcOj07/DKS+hl
         zLkw==
X-Forwarded-Encrypted: i=1; AFNElJ9/tc/9BR6zM8iN+xY3neghdbzrrYsFccROu6VDfYudZKCnxjr7XA0HCYgMJiXpp6a4UQsIA9LvKBuHp7OH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx72Sbn2iG35dCf6KKgg6jMUlhNu7pnSu6zjfM8yoGUqE0nRC9S
	t2CrsE7GQY+JPKFBZOSlBkDno7QtqyabjQdnGhgv8HDd/Anw1MaSdokCzWd2Z/LWmd6IJCGbDs6
	VPkQcJHcfSbu94QAYfBzKuHxN8Z7lNCzxrDzDvGK3vgXEPlQY4xJmWQZdpVzFFA6QrDHX
X-Gm-Gg: Acq92OH0FRhjooE5gLVcFGgRyR52a1wbPA+X5T6nJD0C1trRBRwPFEL6vzmBC5fL2Zr
	U5569Eud0Y705i5E5Juq7pcEQTf3dt9I2IVBrDEhawlroZXPyTl3Xgi5dE8wJNiK48T6dT6xvXM
	Ul1c19gNbjA63nCYSFYGX2B7/ukB50jmYeqyZVwVx1FqUnI0TKU+soe0hkabEt3QfMVC4NCzept
	2TQOvftLtu4VqcpZgLHFXrwDtqdC0QZzXtSJGzkINVrSf66g1wSwTFJEfCHkp0DCQjWZZG/kgAX
	RHH2fIfSgm7BH8TnkSxK0+yN06ddT6WPs5WHodsBHmezOgBlffq6/vnC5WyY85yiC+f0L2ySddu
	ttLLQpGm0MgGO8ukfgrnkYukLIFmjy85lEZmEEk6eR+2qQdLT8g7lT+Vzrk/yRqiVHQHkGCkhle
	754Z7tI7Ogz7Ek3xMisj4=
X-Received: by 2002:a05:6808:2388:b0:479:d779:353e with SMTP id 5614622812f47-482e57c9a13mr17237421b6e.24.1779290428296;
        Wed, 20 May 2026 08:20:28 -0700 (PDT)
X-Received: by 2002:a05:6808:2388:b0:479:d779:353e with SMTP id 5614622812f47-482e57c9a13mr17237386b6e.24.1779290427794;
        Wed, 20 May 2026 08:20:27 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ed59:2b99:54ea:b713? ([2a05:6e02:1041:c10:ed59:2b99:54ea:b713])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm230047695e9.11.2026.05.20.08.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:20:26 -0700 (PDT)
Message-ID: <4d2cba0c-6418-4bb6-91e9-9730ad4d692f@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:20:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iio: adc: qcom-spmi-adc5-gen3: Share SDAM0 IRQ with
 ADC_TM auxiliary driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        David Lechner
 <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260515-gen3_adc_tm-v1-0-39ba29f9b4ab@oss.qualcomm.com>
 <20260515-gen3_adc_tm-v1-1-39ba29f9b4ab@oss.qualcomm.com>
 <aglpVX2NeQ8jxN6Y@ashevche-desk.local>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <aglpVX2NeQ8jxN6Y@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: naeYNrxT5rhQvUyWelKhgTesNx9hEGOn
X-Proofpoint-ORIG-GUID: naeYNrxT5rhQvUyWelKhgTesNx9hEGOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0OCBTYWx0ZWRfXweOpOaHTri4z
 RXSHw3hq6zcdfj21P5r79r+JvZ6b9a4gPvkXlT6B2xZddgO2jTHrtWq8e4SDOxlxn+k3OzzmL8G
 QsxsbZlZUo5XG2TFtrgv/L0Nk4MLbsqBQZu71bhUj+B0QWLjPUA5JBTk9WTlt9Wdo02UDrJc9UC
 Df1JCMj8doMYWYx4Ac3o5ycVsEsX7y6tLcUdQIAkp48IQHOpYTDqKa+Ov6/0JuBkUiwfvFxD/0z
 NCbmIB7bhL7PqQBYpTNM71UzygmykIV24LIGk30RRFBf/O/0g/0eN815EjXU697RwAxi4balye2
 y2r8fY9E09ymksoVlkMrKd/sq6bhu7ed2c5kIB+ipJs3wJ/TjORo7CWwP6dVAR7+Ex1326FHniR
 kl6BQ23KquUj4YMhOp7vo8+xeQ0qgXunhNVpdr7JAcAHbETCWlChrpUINHQTiNdpDsdHxwshOON
 RS71KbyYf+GzaP2OsWg==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0dd13d cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=-F_JFAN9hT3LZsc5xrMA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200148
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-108820-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6258A590D56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andy,

On 5/17/26 09:08, Andy Shevchenko wrote:
> On Fri, May 15, 2026 at 02:23:44PM +0530, Jishnu Prakash wrote:
>> The SDAM0 IRQ can be triggered for both EOC (end of conversion) events for
>> immediate ADC reads done in this driver and for threshold violation events,
>> based on ADC_TM thresholds configured from the auxiliary ADC_TM driver on
>> TM channels on the first SDAM.
>>
>> At present, this interrupt is handled only in the ISR in the main ADC driver.
>> When the ISR is triggered for an ADC_TM event, this driver notifies the ADC_TM
>> driver by calling a notifier callback exposed from it for this purpose.
>>
>> To simplify the interrupt handling in both drivers, share the interrupt between
>> the drivers. With this, ADC_TM interrupts on SDAM0 will be handled directly in
> 
> "will"?! Do you mean this patch deliberately breaks the working setups?

No, the interrupt is definitively shared between the iio and the thermal 
sensor. So when submitting the previous series, all IIO patches were 
picked up but I asked Jishnu to revisit the interrupt handling in order 
to make it shared. That is what he did here by reworking the ISR in the 
IIO and resending the thermal sensor I did not pick for this reason before.

This patch does not break working setups.

