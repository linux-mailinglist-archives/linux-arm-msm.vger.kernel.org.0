Return-Path: <linux-arm-msm+bounces-113384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7LFaAggxMWqGdgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:18:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F1D68EBAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:18:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fgDwNjjw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OgS9oD4D;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113384-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113384-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 577C730055F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A336B3655E3;
	Tue, 16 Jun 2026 11:18:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B668351C14
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:18:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781608703; cv=none; b=UBBbFC79emNBV0jjK3S5hULey7/vFnlBIXvssoVngLO9KQLGKBECqLY2Bqx13tuI7pUAiRVlf/X4qJgbYDSaFK8QCFrBovad3J4ZpsbzB6lveFnAjnROt8ArZ5e5m8ZVe1sVqosctYZGpyhydAscUb/hhko9z40DeM8Yw/k8RFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781608703; c=relaxed/simple;
	bh=my90AxcsOT0BM+hQjh9MNTinNSbEdC0lQeKCWBsWE28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ImhdIC2B3xoTqps7esFYvmHux/y5H08rVE/ULrOVWhQfPa2iRYIqopYJ8lvLEsaZTkDafU89qPOX6vn6Ra+rBfeKiH6V5rPzGV9KCFYoFbPr08rv7SBkcufm14ckJlJvuzid/HU9SO3XaEo0neEStgHgHpBIAqP9+5Ana4XPmf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgDwNjjw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OgS9oD4D; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAVALQ1465496
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1mC4p/ZORnTCo0N4Vz/PvLV6xnFXcvPjV/Xeey750iY=; b=fgDwNjjwMqTyQK6Z
	JwROqnBq6ifyMPf8FYZ0BMUTM+TNiGYFFM0KbbgH8C0AbdpOc/fFQKx1YcI71tQq
	U0OMrwJFlaRhbRUoRxsfUvFZ0FWGnyEJJUnj2z74Z/6mqd0g+gaN3e8hbVLMSdDd
	aQH2iKoECXSFDjptpP3UgrAKbF8rRqEVnbobqesPV4Yy7bcA5X7RYHDdcPzU03ud
	DskvVN7ekHxTpMh/CV0/leBaX71aBfBnwf9g2uq/VIi864hH0k9NV5RTcY2ogegE
	5Wy+C9c5QVWgUzHTTMFcBsjInP9Sdy48DnDsh3QuUxtJsmce7Q6JPMR0AX5S4kS8
	J6RFhQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct0jgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:18:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso5186149a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 04:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781608701; x=1782213501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mC4p/ZORnTCo0N4Vz/PvLV6xnFXcvPjV/Xeey750iY=;
        b=OgS9oD4D0YzDiXyR8tbOKDjuvB0i/1mMjmx38+BZ2ssFVxAi9+k9OMzKQmJj3qbBvd
         es0ZPnhMK4YG5HGie4+7YLFrH0XGLrLHS9sIli8CfgrglFueIsK7K6CgdysqeZ6SvGyR
         /3DLytIjRYzY+/PyA9FjTBCXokLNS/cV7B5fj1Mpy2t+3hU1ZcJedjZxH8189FU1z15b
         w/q+FSvf5Z+UomHyhOXe+Ts41qiC6W/wfSGmyjNAAm3vR6NrlrvvWG6JKD4JqV+mx/Pz
         058JVh1LcUZjuQdhRZuief8g6vKfJUmiVxaEEyB86cISTF+HzpJ6u8/cx7n6cZ8lLI8J
         eLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608701; x=1782213501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mC4p/ZORnTCo0N4Vz/PvLV6xnFXcvPjV/Xeey750iY=;
        b=NqhZPZWlXc6Jjf5dR3qjdRV0PGSInxEc48bwBEla4eJGEzor+xr/FFgB6LDFuVePiQ
         /xq/KSznbwI9dbIbZYnG63KmKoXKVU4/bsMIe5fpnPrwCwVje9MCYVlDvtV/PJxN6sCZ
         CJXyFGBpuLPjqcPLcKh6ZBh6wxkzowG4bBMj+aoIt4KCWI0vB4UTMiDvTvz2r/nRbRrD
         aZMMWts8AHM+ijrqoyzyjcRB/T1qcy+JNGLoZr3OVy4UtG+OxXSe0HdFyJH0/x/Sj0mE
         kW9yeB7D575uYPH/bwgjfXm3cyGwYtjq5qfZaYithSkr0/xNlh8RlFV14VO4AosvOhKS
         XzsQ==
X-Gm-Message-State: AOJu0Yyu3A9OPIE+8r824K8AqOGroyUklxJrYNsHl90juA01TNgHGeLh
	czbQ3uplMJgbyDXK7zakA3nEtUjNzwVdhTAyh1WXfBWiJmRVxAlvDkMgwTnPEkGVUieWyNpr8EK
	ZIFxR+IDSwSVyUnwzT6IFe1t3jPx++He/nnFO1ssLdpQC6vf9Rh7JCxG/eCkVFzKdzGK+Z2z2xP
	zm
X-Gm-Gg: Acq92OEYdSPWmmeJp/Ly8MzQtOJOveNjavm8PnxyCHUjul5q2RjYfSADfOMRRRhuHvJ
	78RpAzesooEcb7UPEOcCb/KZWKMrd4bqUtkoVzoptecB2nDkhtC6rk3ILretoLM1vgbe84PQPle
	cyEXb+pXJiF8GnlTLuvusPDyWgY/6GlaJFCnT1Q8Lj/97qbEwwN6j4Oe9eYMt/TUikjeL/zAq89
	WRwEHWC/Bnd3Bnm8wwv2ZU3QpczlKooOV3NvvoWIpvgdLHSJy3KNNZ8j9Pa5FdQDTA/iJhg4AkA
	6hmvFGq+dHlJ9CJp/Q/PHOsXRXgIXFdPTtXcN9kWZkr7xhIOA8UwLuC0UPZIkQWchFSiYHvmxEq
	mladLQ3G+lZmbE6gLgQehg65Ue4A6LX3PNAsYnZDBx3OB/KcKNw==
X-Received: by 2002:a17:90a:d40b:b0:36d:6315:1de4 with SMTP id 98e67ed59e1d1-37a036ea1b9mr19181541a91.17.1781608701101;
        Tue, 16 Jun 2026 04:18:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d40b:b0:36d:6315:1de4 with SMTP id 98e67ed59e1d1-37a036ea1b9mr19181517a91.17.1781608700654;
        Tue, 16 Jun 2026 04:18:20 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ca7a7sm2624672a91.7.2026.06.16.04.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:18:20 -0700 (PDT)
Message-ID: <f6dd1ea3-52f2-40fb-95c4-4e15618aaf8c@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:48:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: qcom: Unconditionally mark gpio as wakeup
 enable
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260430-enable_wakeup_capable_gpios-v2-1-8c26ac795318@oss.qualcomm.com>
 <2ba8b020-c8b9-4c60-9fa8-545642bde1fb@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <2ba8b020-c8b9-4c60-9fa8-545642bde1fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a3130fd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ye5m1eMZPwjv6mJ2BMQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: lIC4LFX0_cYVovS3yUktrJtO29SBXaFc
X-Proofpoint-ORIG-GUID: lIC4LFX0_cYVovS3yUktrJtO29SBXaFc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExNCBTYWx0ZWRfX163BDR1bCvIN
 UcJW6kpg5o+r9uI/KtpjebxFMKa0kOS8QYAf4QE9EYZKYQfHj9Qaj/XAxcHor8f8DfmjWSqdbUX
 orJAHf82YcnoKH733gLxU2cK7ZhlS9m5yz5zUntx+jtqBP2VsD3cwJOCWtjhyRCJYCT4g2RJ5mn
 UxRTdBrYKHu7lZ+c8ATnGzOt7mFKbSzs33x4PEMBpQ0dxaw25D3nAc7zhIAPDIrdSKZf8CEvSg0
 9wtMESAqSf4aZULZhDR7/JuWRoIi1q80BiGRHAnYzioqfa0HOep6n5/vZ4G7slPsJ365ZUaoCFm
 V/rK3W5hJiZY6drmUb0VyTjpluyNvuF4Mg1N4ABcIDrMCXQ6sddRlCaoV28T0F2cHU9rkfVfyBE
 Usq5Ik/8R6O2Y3/esGw+Xa1XnMK+8xar5HGybGmejs8szQOnqq5giWJ8A6p99nK8GvlARe0A9K9
 8olg1i0dcmlI/SOoCbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExNCBTYWx0ZWRfX3LevKJkzHfmb
 g7qNUQO9XF2IJzqymiShtP8Zkv3TIDY6VeY0EhwC3VazaipwQfNP/+LbRuZQgUP6SZOntaiVXHR
 r0h1BTZpHWYu1v8aNKwK0y5AWrgNhhY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113384-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:maulik.shah@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0F1D68EBAF



On 15-May-26 5:02 PM, Konrad Dybcio wrote:
> On 4/30/26 11:20 AM, Sneh Mankad wrote:

[...]

> 
> $ b4 diff 20260430-enable_wakeup_capable_gpios-v2-1-8c26ac795318@oss.qualcomm.com
> 
> [...]
> 
> 
>       ## drivers/pinctrl/qcom/pinctrl-msm.c ##
>      @@ drivers/pinctrl/qcom/pinctrl-msm.c: static int msm_gpio_irq_reqres(struct irq_data *d)
>     +   /*
>     +    * If the wakeup_enable bit is present and marked as available for the
>     +    * requested GPIO, it should be enabled when the GPIO is marked as
>     +-   * wake irq in order to allow the interrupt event to be transfered to
>     +-   * the PDC HW.
>     ++   * wake irq in order to allow the interrupt event to be transferred to
>     ++   * the PDC/MPM HW.
>          * While the name implies only the wakeup event, it's also required for
>          * the interrupt event.
>          */
> 
> This is not what I asked for.
> 
> Instead, please focus on explaining what skip_wake_irqs is, perhaps under
> what conditions it is set, and how that differs for PDC vs MPM
> 

I raised v2 in reply to Maulik's comment. By that time I had not seen your reply, apologies for that.
Will raise v3 with added description.

Thanks,
Sneh

