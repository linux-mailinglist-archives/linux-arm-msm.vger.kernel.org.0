Return-Path: <linux-arm-msm+bounces-112539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yPdKGT2oKWobbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 20:09:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DE75566C2AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 20:08:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fERRfb6O;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Gf7pVJvd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112539-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112539-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F041B3002900
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C001634E75D;
	Wed, 10 Jun 2026 18:08:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF34275AEB
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 18:08:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114930; cv=none; b=mnB6xZCVR2wmupdTmjRLWCpmszr2FDGFzDevQELmIqS9aspGGuuiYN/t3gU81JaNTsB4VHhFkBf4qVtnhhno2Fijh/XaYui3BPWlmtlRGJ+Yug87BeX7x350tfUrVBd/eeM7sC3Ie58tIpQdsWkn3Oe2oM3f4B4kDKFYaTvKjLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114930; c=relaxed/simple;
	bh=MiwGDwq8J0dYXEcvwkbwqi1QsuSnGPEN5WqLtWs7JOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b4+B8WsswXDuEFrRU7/l4kZfmLLvgHln/PUnJn92juCDdvIpUXejUyjH4kWt6LKvlQzy2ouv7BpS1scUgNP9wdtIzQeHPu0NmmX4JZjOioqJwF/Q5TOwZXOJN6G/M5DvQHXj130M0L7re1g2QK57XVjAeJAA87MLLuGKiDhf8fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fERRfb6O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gf7pVJvd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFwvbB1690414
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 18:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bXZTlyKOD1gEIcmRjq7Xyk4ej9sDT+UAFKDVbpdbWd8=; b=fERRfb6O+xaaTLz/
	foaZYn3Q7ZfJcBfUWu4Ozk5yPpWtKIMRXRcjgKV2k2plPxJKJX/wNszI2vec+Nh5
	mCIeqkelEvlLA5h+85uxKALlpQjM4oFVa6HkEa7RSdh58xEezpGpOoKhrVvM94Hx
	1PkgxGi42KxCggsjYt2k1WCSRlshE/dNLS4n/kiq85q8lysat+DreBPzw4LW1Pdu
	5Mu5ycGbIZHeZjTsgDRs1ggo24fE7yFbKv3zUq7PJebmsOfKgjAayf/k2MjsXuuS
	5eM2GkGACik9TfWpGLGYzwdQ77NA+3WRznfTKsAt2qRWAmX/XXWefl8P0WU7kT+A
	79CuVw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1t8sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 18:08:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso8346439a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781114928; x=1781719728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bXZTlyKOD1gEIcmRjq7Xyk4ej9sDT+UAFKDVbpdbWd8=;
        b=Gf7pVJvdtk87Rnyk/4mApFVVgC4LTMbJnQZzJbSSv77rOhimrjyw90XiR3X7o4mXHc
         JNoI39vjg0A7LjAZHl08c/40xVNb09fD2f7j6RgUkA5FkVuONWAEdlgsjUNgvs1RXKAz
         qxfOmQL+wXKEg+SGlcUG+UCL3V5BQ5j9yt6oL1wCgUrBF3hqvmW63ZLSnpMrZ1IsYiG9
         2KohnWU8CL5g/DRNbOR7JbNVTgPtzJcRzBwJiMX3myrqcDHrVkH5ZZH5uPl11Cxd2xCb
         SOPtl7UiYwBHWQKNyZYsURIAQhkx+MtbxAaNIxYPxOS/pWzvZ6dSbkKcSne+wxeNzL19
         FQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114928; x=1781719728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXZTlyKOD1gEIcmRjq7Xyk4ej9sDT+UAFKDVbpdbWd8=;
        b=JghOqYF05g4rLJ9EabJDZURSmQix4qTgqvsIL7xJ+NKbgKepQ6bW6rRMDXeMmRtIF5
         v/55RHcFzeKQi7UgP6sXuRs28FENbtNrOwmHBynxiSr7kjYPdUKqkXr4uH334xXXHo8/
         drNAjCjHCq235brqohuAdORo60vR86wiV9xRbpQzM+rf9ooywZ3kbd9vTXroIb+NEkDu
         AGbbstL8vvswuk/WBAdN0d0a03Tlr66H3vadxtmPY1CU+6HOCw6KBm172rWSGhxMt3QJ
         aol6uibS6cdIp2jv6G50I/+L1fa4cBb761VJS/S6CDWTGPpxt35/BBnit7cDEHxquOgl
         QYkw==
X-Gm-Message-State: AOJu0YwiQUUfakbWDU4UsqASKurrSa7qCUlW/RmTREWhH8t2isdlfVKY
	xMQCfZB0RlC0UfzmN6hVHk81nbow39ljKg5Kfi9I/3994yNpdjAaGhzMswRGdViLkZylUueYQAZ
	xiLpE1nwpGi7Q5u3j2OYOUCvaQ+/QZjus46ySsPZSCpIP8QoQzFLS73dFkHjwVsPws2Gr
X-Gm-Gg: Acq92OHcnC5BtoSiuTQ/NdojD+oQegixgXHujwG1mBlGDFYva5rVBhTFQw3DLushNJa
	vYR6kJzpcp/kwGNr4LhE4xi6dALvsN7z93PwrNRgOhU4FBbuH9f2Mj6682wDC5X7IwXgrsuTEU9
	6i/K9GUf/vJ7rP9VJojU1hVL6tzg8OagwVvKHuddz9+/KxhvB3ju0q1I70IytHfL6l21TGfn0zn
	yZZvGmcqWtDZx4q1ZiKV8aXnMjJ9ae3Obq1buYxMoK1sCeRNp+xeljqx+0vZktHmo/jZ3lqkyS/
	9iAVYedqnVwFUpyIi1GjxqhgByP936UyYqMAMhRFDjbiJoXeOSLHaOJpiRqR2svUuNAyr6rirUU
	8iBhFAUVynJPMZUDHkMfqTIy0rxo/wUs7GXrRpTB76wq7+WMN1RC0VGnmtscV
X-Received: by 2002:a17:902:ea0a:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c2da80b9b6mr3538365ad.36.1781114927960;
        Wed, 10 Jun 2026 11:08:47 -0700 (PDT)
X-Received: by 2002:a17:902:ea0a:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c2da80b9b6mr3538105ad.36.1781114927490;
        Wed, 10 Jun 2026 11:08:47 -0700 (PDT)
Received: from [192.168.1.8] ([122.174.150.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d1e5sm239164985ad.12.2026.06.10.11.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 11:08:47 -0700 (PDT)
Message-ID: <93a55513-b09c-47a6-bd3b-cfed25ca7a70@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 23:38:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: qcom: lpass-lpi: drop unused runtime-PM write
 helper
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
References: <20260610180012.3505877-1-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260610180012.3505877-1-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: M0ccTk7Oo9mSEtkS4_MoLPr3X5GP23EM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE3MCBTYWx0ZWRfXz5gprGpNpzYS
 c72nuVaIZJjatHp36G6A6509gtAaziTOTaxnRS+FfSB3MNF+hGRQeUbFx2GtqQOw/19NK1XIMb6
 ZNpErrWZq/4U9gOj6rnCOg1hWBObIFRak9K1u82VmWNjRCxitk+JkKyOHCn90TZkGKZpv2lMabA
 VyReiGWdsMoEpThZwp0Vk5WMIdgwjAe8YHLn/q4es1NBdZ08er1wQhKAWyP7W7PPiML3o+CWRs7
 zoYYZgMNCzk3JJqoiYPtPAxyJAcdg4nuk41GsB4eRhKUtSF0YpeJU+Jvr0+U2VeWE0EMnetqvaL
 JYZsEJLrBxwrbMpVvYIcDXG8rdXCronyjP1gBztGg8pnreHLcTVmtmIdP42XWL8gzy8ElGbfsX1
 8D94Q+3vVud4GSUDPZuS9LvR1ZJGhzzf+cIGogJgFgDAPpeNa42YQHHKi5BFyu9T3sfa4sOakAe
 wNa6WutZOlqS61EQTIQ==
X-Proofpoint-GUID: M0ccTk7Oo9mSEtkS4_MoLPr3X5GP23EM
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a29a830 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ph9GlEvSy1Vz2RjkXBjw8g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=byEZ703KndBbruZr8VwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112539-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE75566C2AC

Hi Bjorn,

Thanks for the report and for carrying this in linux-next.

Root cause was an unused static wrapper (lpi_gpio_write()) left after 
the PM clock conversion.

I’ve posted v2 here:
https://lore.kernel.org/all/20260610180012.3505877-1-ajay.nandam@oss.qualcomm.com/

v2 removes the dead wrapper, keeps behavior unchanged, and also 
addresses follow-up naming/style feedback.

Thanks,
Ajay


On 6/10/2026 11:30 PM, Ajay Kumar Nandam wrote:
> lpi_gpio_write() became unused after the PM clock runtime conversion
> switched write paths to register helper calls inside callers that already
> hold an active runtime-PM reference.
> 
> With -Werror this triggers:
>    error: 'lpi_gpio_write' defined but not used [-Wunused-function]
> 
> Drop the dead wrapper and rename the low-level MMIO helpers from
> __lpi_gpio_* to lpi_gpio_*_reg for neutral register-accessor naming.
> 
> Fixes: b719ede389d8 ("pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/all/f03850f6-186d-4988-a450-e6e95f24a551@kernel.org/
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 50 +++++++++---------------
>   1 file changed, 18 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 4d758fd117c4..5fd4a4eba654 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -52,15 +52,15 @@ static void __iomem *lpi_gpio_reg(struct lpi_pinctrl *state,
>   	return state->tlmm_base + pin_offset + addr;
>   }
>   
> -static void __lpi_gpio_read(struct lpi_pinctrl *state,
> -			    unsigned int pin, unsigned int addr, u32 *val)
> +static void lpi_gpio_read_reg(struct lpi_pinctrl *state,
> +			      unsigned int pin, unsigned int addr, u32 *val)
>   {
>   	*val = ioread32(lpi_gpio_reg(state, pin, addr));
>   }
>   
> -static void __lpi_gpio_write(struct lpi_pinctrl *state,
> -			     unsigned int pin, unsigned int addr,
> -			     unsigned int val)
> +static void lpi_gpio_write_reg(struct lpi_pinctrl *state,
> +			       unsigned int pin, unsigned int addr,
> +			       unsigned int val)
>   {
>   	iowrite32(val, lpi_gpio_reg(state, pin, addr));
>   }
> @@ -74,21 +74,7 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>   	if (ret < 0)
>   		return ret;
>   
> -	__lpi_gpio_read(state, pin, addr, val);
> -
> -	return pm_runtime_put_autosuspend(state->dev);
> -}
> -
> -static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
> -			  unsigned int addr, unsigned int val)
> -{
> -	int ret;
> -
> -	ret = pm_runtime_resume_and_get(state->dev);
> -	if (ret < 0)
> -		return ret;
> -
> -	__lpi_gpio_write(state, pin, addr, val);
> +	lpi_gpio_read_reg(state, pin, addr, val);
>   
>   	return pm_runtime_put_autosuspend(state->dev);
>   }
> @@ -150,7 +136,7 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
>   		return ret;
>   
>   	guard(mutex)(&pctrl->lock);
> -	__lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG, &val);
> +	lpi_gpio_read_reg(pctrl, pin, LPI_GPIO_CFG_REG, &val);
>   
>   	/*
>   	 * If this is the first time muxing to GPIO and the direction is
> @@ -160,23 +146,23 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
>   	 */
>   	if (i == GPIO_FUNC && (val & LPI_GPIO_OE_MASK) &&
>   	    !test_and_set_bit(group, pctrl->ever_gpio)) {
> -		__lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG, &io_val);
> +		lpi_gpio_read_reg(pctrl, group, LPI_GPIO_VALUE_REG, &io_val);
>   
>   		if (io_val & LPI_GPIO_VALUE_IN_MASK) {
>   			if (!(io_val & LPI_GPIO_VALUE_OUT_MASK))
> -				__lpi_gpio_write(pctrl, group,
> -						 LPI_GPIO_VALUE_REG,
> -						 io_val | LPI_GPIO_VALUE_OUT_MASK);
> +				lpi_gpio_write_reg(pctrl, group,
> +						   LPI_GPIO_VALUE_REG,
> +						   io_val | LPI_GPIO_VALUE_OUT_MASK);
>   		} else {
>   			if (io_val & LPI_GPIO_VALUE_OUT_MASK)
> -				__lpi_gpio_write(pctrl, group,
> -						 LPI_GPIO_VALUE_REG,
> -						 io_val & ~LPI_GPIO_VALUE_OUT_MASK);
> +				lpi_gpio_write_reg(pctrl, group,
> +						   LPI_GPIO_VALUE_REG,
> +						   io_val & ~LPI_GPIO_VALUE_OUT_MASK);
>   		}
>   	}
>   
>   	u32p_replace_bits(&val, i, LPI_GPIO_FUNCTION_MASK);
> -	__lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
> +	lpi_gpio_write_reg(pctrl, pin, LPI_GPIO_CFG_REG, val);
>   
>   	return pm_runtime_put_autosuspend(pctrl->dev);
>   }
> @@ -337,17 +323,17 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
>   	guard(mutex)(&pctrl->lock);
>   	if (output_enabled) {
>   		val = u32_encode_bits(value ? 1 : 0, LPI_GPIO_VALUE_OUT_MASK);
> -		__lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
> +		lpi_gpio_write_reg(pctrl, group, LPI_GPIO_VALUE_REG, val);
>   	}
>   
> -	__lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG, &val);
> +	lpi_gpio_read_reg(pctrl, group, LPI_GPIO_CFG_REG, &val);
>   
>   	u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
>   	u32p_replace_bits(&val, LPI_GPIO_DS_TO_VAL(strength),
>   			  LPI_GPIO_OUT_STRENGTH_MASK);
>   	u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);
>   
> -	__lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
> +	lpi_gpio_write_reg(pctrl, group, LPI_GPIO_CFG_REG, val);
>   
>   	return pm_runtime_put_autosuspend(pctrl->dev);
>   }


