Return-Path: <linux-arm-msm+bounces-103077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJBWKSb/3WkRmAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:47:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 086683F780B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DAEE300DDF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A81C3B635B;
	Tue, 14 Apr 2026 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3CwwvwC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKXYo83y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36FE3B38BD
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776156306; cv=none; b=r+8Gop1+WcsBXl/cb4hRDe0815AM28RhRB2Afy3gU/XoSWvguuwRLVKpvcIyCFyvHjMOMz17/MD2AWoRrzviM5uTaQsDXzSt+5MiE+5ACtInLnYUmQaQ/Wc7YBWcvHLtHocCrKLlDUjFq6QKxpVfuy6k4MB9RbP8t7FDEk74rw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776156306; c=relaxed/simple;
	bh=HTEX90PfXymgMT//DFg1G4w6F5SOGPZeb6W9LFpW2Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f21qVz17etda7wN6Wy4x5cMEw7wdOpSInwP82FmOcaLTEXcogKfd/8BKBEy7JS1lql89bDvEOOF39tNypGOc85jseZ2iMrUPqIhMh6ESXCzA6n/3C9grGIIc227RVhTKdU1cwkcz1h6W6O7V8LbQxwET4xq7GWMv6F/EE3jV5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3CwwvwC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKXYo83y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6hex7280813
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+zwomaoPZB2k9QUwyaY7hnwguNk8gPY4TrD/qvJv59A=; b=J3CwwvwCpKE4oefW
	NkZ34IsFxzXSbpwq0Y0A2CtUAOF4e+1mORZZGz80hE2PD9eDfI2Jmt/LLpOLRxGM
	8OMOtcpcMqUsb7ZufWxFIOBWkR0cvVrWC54y8/Vr9BMT3e/Vf34/mRz8tNQ/30tK
	coPSi6kXh/bkyLbFo6VdWXoNe4kyN6ZsRTPLs7pc98FVEzNYbJbMLNkhgiDPGppK
	YLcM5ibC5zTK9ILRX0tHya2D0WMluwt2sBJXQSAzsbBdNNBkWnQSmHgYj3Hn3K4B
	jB2DcF603DaZiRLyow0GsvbN3LEILsogTXVR+ybBf7TpsOUEEQqaBOuaD4/xjjF2
	CyPqog==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vhtxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:45:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aa9fe6b6bcso9698266d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776156303; x=1776761103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+zwomaoPZB2k9QUwyaY7hnwguNk8gPY4TrD/qvJv59A=;
        b=EKXYo83y0Q5HbeeGu2mlH1nvURYuoP8iPiKlNz4C0lFVd0Udz9+wQrh6uINfFpziLj
         PNxvuMACDcSLDah1Eboi6C938/x0W7CL6JVDvN0Z/ZJbcqfsxTSn4DNNVre8mL/eWClI
         TEjZ2v9wt+NRE329yvRPkTocxuGiG8thD4dSTHXhZ5LP4R5coCEuWCAR49OK/VKgK3L9
         Acbvy0i0TS6wPyB0II6NzAckkmOmv9mkIe73wUzWQOV71VNa77uAaBqR93odWVzJ4ujU
         aRibYVCaDp+DfWvF1e4oPaWa3bgP7ogxlXs/ml/nORCdPu9b2SiLZWLHRnqj6MRv/vYu
         +oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776156303; x=1776761103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zwomaoPZB2k9QUwyaY7hnwguNk8gPY4TrD/qvJv59A=;
        b=BFbichhmk1HWhFLzdvZSn5QI0mq0THLW7G8+QN237Uz9ebcw5KgqBLK1M9lljvWBbf
         nHyFbt3NmtrwG3py/QdFCSps+IeU0gBelycLQ586SFlr4CcVSYxYIzcvSFDbV0OiYiqJ
         yTIR86Iu5qQ/DFiXYMoP6Oriij8URZPfdbyxXhE0156oXOBc4VHx5bz8yyi+Fl++Q3IM
         fIhT61wHQZNW+3kZHVgZkYEJDzhkxaHC14AWLDYdReoXzCC2mr1Z6k92rhc5fKhhh4ho
         ww5fpPPQW7zDEPWoMPC8eZI+sS4h6xxPkwXUEn3pwAkt9yAdsOJpJqJiO28BEVHUR0Mh
         8dPQ==
X-Gm-Message-State: AOJu0Yzj6hieU8/1wvzE2mKqlbDWJuCy/eFvt/XvwH2k0Ww3kF616sUw
	Gf/lrIhW4tLLu10V6gC09x6cgUEU63XjltzPjLjLVMDSbgfPbs91Segep08rxJaN1G68+UWucKD
	PjaCVKjw6H97AdcnjBkTsZQeEtSo61pwDw4csB4UuFzgZb+X1sVXzlnUBn0KtK+MYhwlCcJXgWJ
	eT
X-Gm-Gg: AeBDieugHwkp7NjrNsRCDUaoDqXwkErLU5bwVQ0HTzooFXy9gWTEAMukYY3+6k3LaQg
	o1KsulpEOPdf9ldG+3qy7RqNcY+iK5BRCdA+ronoAz7uq+ymlbBshVOMHk32tSYNfoTotIiUYCC
	59b9bUVyB/FLotuNgj00cixytgoeeXrJEiykEv7XFBUL+9af1PHSNkBH9Z0XaFme8cLvT7ujMwe
	1fXueEU445x99jtNuUTLh7Uofo9iCDZkAanMOFi+jrrYCMtuBzKVAmUH0rXDQBbr2KdyDJ3CWKp
	JF0KZXn32i54Z17P9mU3WrlwZzcoxyTm7eUXIhjHMQ5T+gZzD+R6uJm+b6jW+lQrYYZneES19L4
	qLRyxEbILkprYwwOyi7mF1WOYg8/3yWFnj3m5Dy7yeoSr6l+PcqXJ2ZKZwKi7vpOgD6NHyJZCzg
	+fR0gfd45le6Tl7w==
X-Received: by 2002:a05:6214:4e15:b0:8ac:ac2f:c8b4 with SMTP id 6a1803df08f44-8acac2fce64mr87407116d6.0.1776156302919;
        Tue, 14 Apr 2026 01:45:02 -0700 (PDT)
X-Received: by 2002:a05:6214:4e15:b0:8ac:ac2f:c8b4 with SMTP id 6a1803df08f44-8acac2fce64mr87406916d6.0.1776156302412;
        Tue, 14 Apr 2026 01:45:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd77c2sm381252866b.24.2026.04.14.01.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:45:01 -0700 (PDT)
Message-ID: <dbbbd4f9-ab27-4568-a06b-5d982d54bb51@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:44:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] pinctrl: qcom: lpass-lpi: Resume clocks for GPIO
 access
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
 <20260413122233.375945-4-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413122233.375945-4-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L0zmu2bHk9xdZFtcr7zBA2RLZGbtSYRZ
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69ddfe8f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rVK_4phez1sAFflzw9YA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: L0zmu2bHk9xdZFtcr7zBA2RLZGbtSYRZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4MCBTYWx0ZWRfX8iu3dTWJfp/G
 IIzdT8MOtcriJWRriZcuaRo+U5TkIpQHIk7J59hXEi6rKYE4j1r1b+w0pwv981M8IWaJTB9b+y5
 K4gR1bDexaw4rHX3NGX0WzpkBfdAzxuq9obO4f1uh9TVjTmTImOHdbQRsxh226h2W0ALtoAivTX
 9l1CbhV8iMCoZAgvp6ij5OBkuGQLuTqn7DzgvBf0cphtHYxlIVNOkO//OtxbM0HCP+qoDmL684U
 /JEfFS4NR8INwJPgfDc5nosw9tCt4Lweo+0kKHychWLp4Xc8xs0Lovq8zWWkJIAOjxn5d9DY7LO
 W34UnC5TLV2Fw9V2tmbqa7W3oKXr8FOKZ0VY6L0Ea2PjDOm7DSOVUn1upR3IOxR/VvkYIIvSokI
 k6fExa6z/1Rfa+gSETKOgIMiVLkwgdvU1xRsJWzYfPZgdqwAy1m05sxtcP2YpgGEPNuwa72jKtt
 tx0bCPlKnAcEsLYfWFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103077-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 086683F780B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 2:22 PM, Ajay Kumar Nandam wrote:
> Ensure the LPI pinctrl device clocks are runtime resumed
> before accessing GPIO registers and autosuspended after
> the access completes.
> 
> Guard GPIO register read and write helpers with synchronous
> runtime PM calls so the device is active during MMIO
> operations.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index d108e7321..4275f2734 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -49,8 +49,17 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>  	else
>  		pin_offset = LPI_TLMM_REG_OFFSET * pin;
>  
> +	ret = pm_runtime_get_sync(state->dev);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(state->dev);
> +		return ret;
> +	}

Okay that's how they can fail..

Please move from pm_runtime_get_sync() to pm_runtime_resume_and_get() or
someone will come around next week to "improve" it

> +
>  	*val = ioread32(state->tlmm_base + pin_offset + addr);
>  
> +	pm_runtime_mark_last_busy(state->dev);
> +	pm_runtime_put_autosuspend(state->dev);

put_autosuspend() already does mark_last_busy() nowadays

Konrad

