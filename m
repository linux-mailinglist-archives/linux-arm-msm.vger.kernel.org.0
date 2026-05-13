Return-Path: <linux-arm-msm+bounces-107330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONLLC56GBGr8LAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:11:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5191534C2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A493C30603AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8806254B18;
	Wed, 13 May 2026 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dt7aNmJo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COgGPQac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617EF219A8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680208; cv=none; b=GuSgV0lcq8nR9TFE05/YRAeD5VjGpC8UXO5oEaZqyEq/H7BD6CtGfqSP/ExIWFh3oq/nmgax3NcC9BaNuDdIGaMkTgS9WtiJPnzKlc1fwzF4k6iZhAL4C/JwUlUZwUA8A94Art+kVpC/Kptk+js6V97KNxE7kKsWqIA6qXT51Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680208; c=relaxed/simple;
	bh=21ChlqnG6+1/0k98un0SM3BswxDZ2/eLtnXGSiSpg9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsWd4ITPCJueOezGnb73d8Cdm6Ii1IrhKbiIM2y5krjY33gXCc3YA95R1/VD6v/eCjp89jpqVsbw0eZZ6FlrgJS4+Jx/kULLQ+uVh9XQEubRXWPE928tdyMhPxqVURL1bJJdDc8uObRKSMv1X7VakNnscX9Cp3KrTehBMYNjWaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dt7aNmJo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COgGPQac; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9k0fs3008285
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUmVYuQhPuKy5nGxoKDn5VTEZwu2/Gq0ve+F1MIYe/I=; b=dt7aNmJowZ9f8t84
	IjAgZmLQ62UDHq4Csa1iRHBgGhuaIK+owMODgGoXyTf6GdDgFwqlxaH3/QcB/dmu
	ZhtYJ+MFwrK5Ep7lpzI5LF0ueVDv9PdnNJ6heWXYgUYxs+B60Ln3MkO+vB9FfNck
	TLoVlCgAdWdXynKtU9FmRgRPzmLnBajU4SMuyz4qgQpy1Gq3UmjnibM/jGXzpyf7
	2KRduqmMfgww+Er9LrZ9S22vYkXz5bHNgjyvkGRi7tXKDG42BH1Kap5RGBIQpuYo
	ePmGcPvHAruci+mG+vkJA5l1ZoN0++TbQqtPOFHPVXgz2T4U51VBebIyIG6erOcF
	Wwy8pA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0gup0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:50:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a6d84522so127871575ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680205; x=1779285005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUmVYuQhPuKy5nGxoKDn5VTEZwu2/Gq0ve+F1MIYe/I=;
        b=COgGPQacpedAAcmHTZI6w+3yzKL/A8MdvkJZ+5Ho0engneM4pSPqcjXmPjzJ4kE+ci
         PV9cLdWDio1Ji2x59qakl5KUQyuL6UrpLI3zO0XdR1zIFTSdtyPoKsvopRITAIP9xycX
         KGMW/DxnU5Sk1Rlr+eYQ7PJdgjyMti2qzYrVYBnwRoiugPVhX75HFMKRXlcy8XzjZ/cX
         FEVDZBhUZ5G2co0Z50nIQfYWs6njratbvLZghd54MPaXiJoBuozGmDkexOIKYNjkGyrD
         WK9XhEoQF9kSOFcPzwnSyr0Dm6nzeJZionSI+HmHEv9t5WOkjE29EwrtFe13z/oUvxv2
         FHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680205; x=1779285005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUmVYuQhPuKy5nGxoKDn5VTEZwu2/Gq0ve+F1MIYe/I=;
        b=iJhsk/LeO18qAoOqSRx2mM7WVb0sFjcJIvuNAD0Hi+6kk9+fPf3IVD2QjcNOm7bLJr
         rSExQv0IUjGh0yROJPwlHP9hw65UbAqlt7G4p4RgVDtt2GoZBB9OG56QTd5450B46cgr
         nEbKAHYQdMgUKRNQxqPCXKYYQo4lZ4u8GI5ZRurCPHvtJgb3NAtp354f+PJ93FZBWmd2
         RlqRCHiSEmAA+eLaizkvQ1gyLxLx+L+pklAnavn+CZ5ooBG7atO0+zaHUi85XkgNihwz
         3O/zUyGhWtAqmM1Uz07hCUZje9Fiwa1jrEKoWLEyqK9GTNgo0+t84XdgwrR/TTNZS3O/
         VSLg==
X-Gm-Message-State: AOJu0Yyw2UBa+iwZ2rvfY1M7oUIpkvycW9yFD4+Y4vlLrnXOZJxidtw0
	ZVV3jIkQSwkK2CAVIcmtMc90wxHZI9Z7/tpzwOi4JUro3euORqRNWdoMLOQ9yd8YZhA+0fX7mzk
	7dnxvKDw0OrC2XPzMvNc1RS+VebkdtpiogdCmG3WAUD7UEma6/sG4uKIuUlfng7RMX4DP
X-Gm-Gg: Acq92OE7jfN+Lcv80Wf+x4h5ZedJeTw99S2lwd+FqEJGyKizlD/ZeIPr2s6869yTygA
	7xJJ44OXAj+Rc1V5+9w/1+Zd6dVAn7GGnlVOUf6OtcZjKjRW56AI/VSuouhQbPCZuweKDymXiBy
	iUOLuY1Qrf6bv9YdtElwzX2Kg6jzPF5dEWfJyUDlddJuHjHvIUrK7RW5oWiMvjcaON02C8gwKA1
	/ZaEKvebXGf96epaSXBqkLIoYDVByxspm+hfDoHXGSt03d1zioJQsiM6iC6KggxcgkPOcZZMNL5
	kobDr9AvK1j5JKwqDNR/ZfVdt0d3ViiD+Ytz0EyybeQ5zl2vPRE9YcnA/3VVBijTEZD7W1BfaHC
	Cc8VgQ2FShP3T9U/KyNVsNcdw0DegvflPOcPpvmgWJ7Q8gon/fA==
X-Received: by 2002:a17:903:17c6:b0:2bc:8f62:990b with SMTP id d9443c01a7336-2bd2773e38fmr37055465ad.41.1778680205306;
        Wed, 13 May 2026 06:50:05 -0700 (PDT)
X-Received: by 2002:a17:903:17c6:b0:2bc:8f62:990b with SMTP id d9443c01a7336-2bd2773e38fmr37055095ad.41.1778680204806;
        Wed, 13 May 2026 06:50:04 -0700 (PDT)
Received: from [10.219.49.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e75fffsm160721795ad.59.2026.05.13.06.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:50:03 -0700 (PDT)
Message-ID: <407abe2a-3a82-40a2-8072-24ba927bfd99@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:19:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260508113636.3561383-3-ajay.nandam@oss.qualcomm.com>
 <b2e69a76-e484-4b48-a0a6-89279e597da1@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <b2e69a76-e484-4b48-a0a6-89279e597da1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MiBTYWx0ZWRfX2npssYt/WUdM
 vIWWuFO4Y0s6pN1AoUjo22SMwilO62qI0LtsYMTp++E8PnNjMExZIGNx4xw8DvpfsV/751TuIYj
 Iw7lo+APIvnvFDcrRhNQ5CVaLg49Ts3Iwpwfskytix6aS64qVAYufgwuplj+0vvxra+zrcX/n7N
 7fIc4nn3JZRpBY+0XymvRnxWXkEZJSLyNcqdHoBUE3Km2iRsk+g41wYBV+lPjy5bwyb+hQOLHf3
 +bq/iqXG/5K+utgjRJUJvB8kcuDb9UnO2SuOCgm21VTZdKj8voo0WCm5U22ZPZ9UtHKaKaVuM11
 y6usJn37I9EJMWpT1+sGIRS5MhG+dxvEYlqjWry5t1OWmXpg9JubAry2Cp6OoaRsCnjze5ZcvdZ
 njB70qWBiV83gM3wq3W0Xsi1Od5qAtXl+3hfhyTOE35lrWJDwIdCKgHue6yvZ7Wdldpm4F51ArD
 RODbtMnGXyvOdlP7NsQ==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04818e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=wtJw0QWr3tSJ1Ft8UIIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: B9Oe4y4rFMCPOnXYOnAkqA8RtA-aVx7q
X-Proofpoint-GUID: B9Oe4y4rFMCPOnXYOnAkqA8RtA-aVx7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130142
X-Rspamd-Queue-Id: C5191534C2F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-107330-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/8/2026 7:10 PM, Konrad Dybcio wrote:
> On 5/8/26 1:36 PM, Ajay Kumar Nandam wrote:
>> Convert the LPASS LPI pinctrl driver to use the PM clock framework for
>> runtime power management.
>>
>> This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
>> improves power efficiency on platforms using LPASS LPI island mode, and
>> aligns the driver with common runtime PM patterns used across Qualcomm
>> LPASS subsystems.
>>
>> Guard GPIO register read/write helpers and slew-rate register programming
>> with synchronous runtime PM calls so the device is active during MMIO
>> operations whenever autosuspend is enabled.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>   	for (i = 0; i < g->nfuncs; i++) {
>>   		if (g->funcs[i] == function)
>> @@ -119,7 +133,9 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
>>   		return -EINVAL;
>>   
>>   	mutex_lock(&pctrl->lock);
>> -	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG);
>> +	ret = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG, &val);
>> +	if (ret)
>> +		goto unlock;
> 
> Please remove the mutex_unlock/goto calls and replace the
> mutex_lock with guard(mutex)(&pctrl->lock) instead. This will use
> the scoped cleanup mechanism and let you simply return directly,
> shrinking the diff

ACK, will update in next version.

> 
> [...]
> 
>> +	pm_runtime_set_autosuspend_delay(dev, 100);
>> +	pm_runtime_use_autosuspend(dev);
>> +	devm_pm_runtime_enable(dev);
> 
> devm_pm_runtime_enable() can fail, please check its return code
> 
> nota bene pm_runtime_put_autosuspend() also can, but it's much less of
> a problem

ACK, will update in next version

Thanks
Ajay Kumar Nandam

> 
> I gave this patchset a spin on 8280 CRD and seems to work fine, nice!
> 
> Konrad


