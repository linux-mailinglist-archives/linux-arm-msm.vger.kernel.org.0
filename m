Return-Path: <linux-arm-msm+bounces-113079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OUI9CESPL2oWCgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:36:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB3E683827
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:36:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Pyo97Pf2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="A4/BoHRx";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113079-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113079-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 293D73001FDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 05:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1253AA1B0;
	Mon, 15 Jun 2026 05:36:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CDD3A63FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:35:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501761; cv=none; b=Nio9Gx2fFjD4QpxP+EQvDwFXanI7yFBLI1Ru2t3CEXPoIeKFGYceHCVdMy/StUCPXSbJfNWW3Ao2LJDjLNV3XMtdBzk+pdpf4V0wRnPnnfiX+riYhSq5F7gCKLYaPnzY2fKPVgZWhpRG6xvx+D++SxM418FTUrKUN0vEv2p37zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501761; c=relaxed/simple;
	bh=dqTxwBE0ndeNI4p89sERCO/AVO4VgpAF218vctzv1Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ha3SPDix7FIFIgCe7lS3U/zLp6jEboHkIbB4fi6TI5mky+WDhdF7IuVH2syhD+zNERlf9j4rX0jrt/X6w6X985f/1ALynPEWp1n5iTzz57lh7UGmNHx9lnRwSln9jPy3OKuvJEbaxUF7P35x/TdWYVSSRvrn0eXKcvjKkBUN3Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pyo97Pf2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4/BoHRx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1j2MB3244029
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Al+gKbBHNdbBsiWp1MXXGDUpeRROLny1uWI20QOnrqU=; b=Pyo97Pf226S1bWrY
	MM0AyKyAHjACgId2pBb3v5nowUWCN5KuA93A+PS/yobgF0ZkeDYJIQosiI+hIztr
	fzoUWlCbyi4u8etKj3HqvJvR35K7DZa3+MHmkEXkbZ4SrluOIQkLblNkSwRHhfxq
	TNt8CTKp6K+lFehHpSgvDutwL/j+Vo1wDRhMKGk8Gok3SXdgcNoBKat7VYeBY74F
	/RhZXVc9RFCe7J331l7yxBWMVRpMlKHaXNu8f6r5i8dUf1/dveBVPoLST/TuGGv7
	FH7+qwmZbWTD0QAigXAAigfZFaq4UUjc+no4yTG4YzuzN7sU5OcecevlB+0hDjP7
	epbpFw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gwr9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:35:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b9d265308so2128319a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 22:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501755; x=1782106555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Al+gKbBHNdbBsiWp1MXXGDUpeRROLny1uWI20QOnrqU=;
        b=A4/BoHRx+TOa4oL/A6awisIwOWh5Fy6YTWJPvPLIvaHMPYdQx+4s+fofHANOARhaEZ
         QsyEG3/Aii4+JSLPIELI4b0Hsp2V0HwZfwRFFmcqlgjEGoX3ByRpahX8PKWg4yOsLy6I
         AClIuIN3dyexcBSmF1huVY8xmlvJ8BJuO4C+szMNFhMQob+sxINT5ntnlB/179ycIMDY
         4ywAhoRs8hkw+U6ZWr1tZjOA3FRibPURkaor0YZqNBcUu+49mwqr9NWNzKPLPMfC6Eb2
         QKZ75TKEXA4LDmlcfFKv2n8YO1jKiaD8D44hszLxIAY+a1VB0CN98TNn1JYFq7QApXkY
         Ff6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501755; x=1782106555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Al+gKbBHNdbBsiWp1MXXGDUpeRROLny1uWI20QOnrqU=;
        b=eiI7GMVWhN7Ohum5/7XB6k+xoTdBprvAYKWHSC2Lm2G/IBo/d3AB9Da1ecern7lBFi
         pQUQolCMoMVCedVT1IkdNtWNYXPpgHH78nbwLP145oGqP/cIm/cOnhR7MRahvQnZBv1e
         x1TIQSogYwIhf4y+AuQ5QCWq/yhoh7Mq1bI/sWSpeDblKBPN7tRDAIBWVKmQtmXyqjk9
         mAJKIZB/c5GMR6l96QOgQnxjgbqYd85SFTY04R5c61eurqu9xw3bKElcmFYzdUi0GjNV
         Wct6W8u81pNQee/9eHxjdj0Cs2911oe2ChzCdN13+R4w99Af8fQmmqmrA1L/bHFHBVvi
         6t2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/nAyBU0FqZteVc8/0JCcEEKt7PSstWKhk22IHlGknXGlNU/m4PNHuHJbukZrBvBQwZZtBCBlfzDCMpDIxj@vger.kernel.org
X-Gm-Message-State: AOJu0YxKeAncy9fdyDWZknLVEDaMwACQlXmH9e5p/4schuqr94tc8USx
	q80CWr+4rgmUmmJqhbYHoO/iyO2jSsDjxjTKq0GEGyGUwJR/vKgmXKWAOjoTXOPxTWbO4x70SAK
	mzF0rf1oxGY9ahQHPQWwtNkGWJXwF+pZ6vvGFZU/vqURk4QVkFj65VCBJLZFpLli0sl+Z
X-Gm-Gg: Acq92OGCVAOTDUjFiWQ914p9jmO46ll5M8PwdaykkSW38gtmEI8BkmaH2pyEpsY2oS0
	d6Rm6COIiw9e61/NBsmsBscKga61iFY4qAWO8q3eK+cR9Zs547sn30oAOYyziXXHfY5lr0K9MNj
	LV87r+fQUGe49DlimPzzUxltPp8GTIUIU/JvIVfRdWqHtDezQ2oB+uecVdMujRFdM/UmCCGPxrB
	FFgQnMuxa5+asWbp8jDtVOgquwxX8rB7hhyV7veQaLBn19UEtUHtmoUAoqkH1RrcRKDvR37Z3xg
	ilJx45yia4hQk7uMA8OhwYmgi7wT8Ign1TU44tp8jm0C144m0JCwZQjPuq8hocHi4z5IYzsPJVT
	t/FeBLeVPxl++YJJWeEbV+TVArmqxvjeB9WUogtRCc9IOkP+iBWI=
X-Received: by 2002:a17:90b:53cb:b0:36d:8e49:d8 with SMTP id 98e67ed59e1d1-37c2bcefb0amr8644751a91.15.1781501754604;
        Sun, 14 Jun 2026 22:35:54 -0700 (PDT)
X-Received: by 2002:a17:90b:53cb:b0:36d:8e49:d8 with SMTP id 98e67ed59e1d1-37c2bcefb0amr8644729a91.15.1781501754124;
        Sun, 14 Jun 2026 22:35:54 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1f07bbfdsm11133492a91.5.2026.06.14.22.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:35:53 -0700 (PDT)
Message-ID: <39bc7472-a643-40bf-bbfb-241433dd71d6@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:05:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
 <ahWQmTr-9a33b9FY@linaro.org>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <ahWQmTr-9a33b9FY@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfXxFuOcklRpFYI
 Mdwl6U7CQvKg8XRehbKzWTlRhG3jBDdvdSfH/Xpm4F5XpHzvvrSzFq7dMqfwqcpGhqPUXHNcyxd
 Iiyx9x8sxGtXiD85NAscmwJDo1fIUto=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2f8f3b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=F36j7lWHSACE9dnm3LoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX7xZzIaqsFTBe
 mTPotKb0opkbmIx3eutc5PEnwimY0i2zfoqRO7QCd9IidqPSjU9jY6yeljUM2NfEe34unPOH1FM
 xzuZAMHSxFhL4Ftmxwvv41T7X13I0ZJqeMV1gKxrL8zKhCRN6VdRvxF7+2C3BnMxsc7oDg3xzRy
 /kjuX7LjR/LgOBcyM4hmD/v63NGSqHbk+tAMfg3+K/4yhLzjlK0DhtxqzjlYDGzI8NvSPKuvOHz
 5Xt7IQYFMl1Abihazhv8Oy2eTqGGKAZmr/fC1eK3lU2RWMvIqkC63tcf6wqHmHSeSNwS9DNXI3W
 V9ZyHBykmmzWDoKZHbkB6J9PCRPyRBc2d7oJe3iR3oNGvPNyVgad4zUuUKe7uT9jGIy8EfwLbtq
 Bbp9B5aSUQx2amQcfnO9tTncxg5KVFVVoOWkdVjTPHppCLPPKOFqtnMcqZY1EVtyuF86Wd0H0tt
 b8JCmq0AgT4Hz2/jM4A==
X-Proofpoint-GUID: XWX6M8KhgsRM-kUYyR0JdHlzii3xmPTB
X-Proofpoint-ORIG-GUID: XWX6M8KhgsRM-kUYyR0JdHlzii3xmPTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113079-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACB3E683827



On 5/26/2026 5:52 PM, Stephan Gerhold wrote:
> On Tue, May 26, 2026 at 04:24:41PM +0530, Maulik Shah wrote:

[...]

>>  static const struct pdc_cfg pdc_cfg_v3_2 = {
>> +	.gpio_irq_sts = GENMASK(5, 5),
>> +	.gpio_irq_mask = GENMASK(4, 4),
> 
> BIT(5) / BIT(4) would be clearer here in my opinion.

GENMASK gives uniformity.

> 
>>  	.irq_enable = GENMASK(3, 3),
>>  	.irq_type = GENMASK(2, 0),
>>  };
>> [...]
>> @@ -184,6 +204,14 @@ static u32 pdc_reg_read(int reg, u32 i)
>>  	return readl_relaxed(pdc->base + reg + i * sizeof(u32));
>>  }
>>  
>> +static inline bool pdc_pin_uses_seconary_mode(int pin_out)
>> +{
>> +	if (pdc->mode == PDC_SECONDARY_MODE && pin_out >= pdc->num_spis)
>> +		return true;
>> +
>> +	return false;
> 
> Can put this in one line:
> 
> 	return pdc->mode == PDC_SECONDARY_MODE && pin_out >= pdc->num_spis;
> 
>> +}

Sure.

>> +

[...]

>> +
>> +static void pdc_clear_gpio_cfg(int pin_out)
>> +{
>> +	unsigned long gpio_sts;
>> +
>> +	if (pdc->version < PDC_VERSION_3_0)
>> +		return;
>> +
>> +	gpio_sts = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
>> +	gpio_sts &= ~pdc->cfg->gpio_irq_sts;
>> +	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_sts);
> 
> Is this guaranteed to be called sequentially, i.e. not in parallel on
> another CPU? Otherwise, you need to add the lock here to make sure the
> read-modify-write doesn't race with another CPU.

Right. with irq_desc->lock held it will be called sequentially and no locking
needed.

> 
> Note that since the irq_cfg_reg is also used in qcom_pdc_gic_set_type()
> it would be safest to add the lock there as well (although since PDC has
> IRQCHIP_SET_TYPE_MASKED it's probably unlikely to be called in parallel
> with another irqchip operation for the same IRQ). In my patch, I handled
> this for all users using a new pdc_update_irq_cfg() function [1].
> 
> [1]: https://github.com/stephan-gh/linux/commit/59ca2a7335ede83e4a7cf02704dd7c469c725c14
> 
>> +}

[...]

>> +static void qcom_pdc_ack(struct irq_data *d)
>> +{
>> +	if (pdc_pin_uses_seconary_mode(d->hwirq) && !irqd_is_level_type(d))
>> +		pdc->clear_gpio(d->hwirq);
>> +}
> 
> You might need a write memory barrier here and/or read-back here to make
> sure the write is complete before the interrupt is unmasked in the GIC.
> IIRC I added this in my patch after seeing some test tlmm-test failure..

I did not see any need for barries and all tlmm-test passed.

[...]

>>  
>> +	pdc->unmask_gpio = pdc_unmask_gpio_cfg;
>> +	pdc->clear_gpio = pdc_clear_gpio_cfg;
> 
> What is the purpose of these function pointers if you always assign the
> same function?

I have updated them in v3 to be assigned only for secondary mode.

Thanks,
Maulik


