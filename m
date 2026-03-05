Return-Path: <linux-arm-msm+bounces-95574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DD1LwxWqWli5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:08:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C68CD20F6AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4996330493A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E483793C9;
	Thu,  5 Mar 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lISM4GYy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAAyF/p4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEC1372EF3
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704493; cv=none; b=Xr/f2+202W31eefz7keip75VNAXHlIJJg/tDaBKsUb07n6UjRjyokqWrg5GnIdwzjs9kGKt1X1Rl57SccAPxCIf2hiwSXjgtlZrb9XZWIJAVoS4KSOJXvzUFZOdwDrJYj42ZoCWB0uVYIrV8U2hIGluKebYG3z0td/xgl1wjaSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704493; c=relaxed/simple;
	bh=XQukW4/ROjIRaE/AjfKafsRfg1a0xwL70/N0xAoX1/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oO4+LylMrrdx4lLE9TEL3nTRXkNbKCgy8gRzOM/RrMJYjeXUI+6djV0zrsGYUOi6ZQKAOV/iFNtgauE+1rT1x3cXEhdHy6+2SZYeXIuTWzj2ppKbdRlaRdOiEEQ5BHtFomNrx2+XLHwxrDKPyTKvN5UQHeJixUlHT6jjuNAd3UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lISM4GYy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAAyF/p4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62596ijl3665133
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 09:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8bIcgp0lZ74b/t0VJU2b2r35aufWZF3oWB9C4Cu2IJs=; b=lISM4GYy7r2YvjjU
	he4Xn7XIzqyhlsO5K1EieQNDL0YlmsoRBamjcxtaeggPUF/bFKEYsxqE7ucR1iaf
	vqYv2T+XnqzKJRHtYFyUy71iivagmE96MKe1VSotqqcezS/Oq/OjWChvOD4XkwlI
	JWJySWaWoIno8r4zZD1j9pEpPKA5o/RM17NnRH3uA9qQYtp+zz+C4iKZaDMCbqpW
	b9/AJY1jRDU3zwiNu27sgD3X+YpDvBndopQz+MoCjwNxTu31Bz6MmwYwHHtAG6R0
	6QHxt9gXTJvO/DIcsclzmbgNB9aNyqg288aW1a+ewi0Vc4mFtsYPI/4Z9MIbKyjS
	po60/w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u1hyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 09:54:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899efdcdb70so28525476d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704490; x=1773309290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8bIcgp0lZ74b/t0VJU2b2r35aufWZF3oWB9C4Cu2IJs=;
        b=FAAyF/p4ETlAjDhzYR7IzeUm4bwuG4qLmRaQZNiRN+1J8kI57cDOpOF4DpBk6iJkS9
         cV1ApoiIRGNHOCv1h4xuRKdwgn2BXqemWPHSb07YFSvmBRBo8RthSqTvmzu6e2tIJoYo
         Ibso6SeIbyt10UrgsYS7W/F78aKcIZ+nh1e6BfeTIjlgcSSxcdK2Hetqz9WIVDBHtfqq
         wWqrkvk9/sa/NldAejQjyUsKYHKDFZrQZtVb2Gq3L4fCWnUefouJf7Z/lUTqKdzdipal
         3xLIOkr9iIGcBrlLGNuYC43BtYInVkytUsnhd2nstQQeJwupNTQYSXBAh4A9wb/x+KsS
         GKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704490; x=1773309290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bIcgp0lZ74b/t0VJU2b2r35aufWZF3oWB9C4Cu2IJs=;
        b=mxOcGBU9ab/upA2fbfcCiKvjMyrH9yTUsKP/AoJiQgbldtYjeIjzr51AM+3rqLUj9f
         EXWR0UHU9dMTMmeNDj/EVdXXUh/Xc3On3O8vM5NDwhZl278nSwOySv7d+ZJhdI6z6NLd
         Z3Kf9Ft+Hyp/oU6tehUTCKZ5qbhnGf72yPXoJS6Qo0IdgEP8mzFMpZUF1Hu1hdART0Ld
         1Cz7OGcT3+QT+M92FEJx9CmRp60rhvC2Ji3/VFwuvZ9NbGJJfAY9C6KsMZ+n0X9jKntg
         fYf7wwx5+PR94OEVKFHcg/HHW5cEwYPAboMQ731cy6wTF2fUeJgqNf2Lg670tSne5Tpb
         xFEw==
X-Gm-Message-State: AOJu0YxFKCw7r1ajmsfyLpTW5NRpnctk8RA5Yx+hTmXGdx0WXEmdAZ3C
	xHo63Xam4KCLab1jn4OE1wUMXGzWldGLc89+/zoCLsdE9x5Xy1lg6FGhf0UuSzlldFLurPPTzsL
	gA1D4j5+6IjVmffm1/fsmwvOL19BWkvkEOaXDXkLQZqeeQG+bQgv1Oaljhe56eievEs7w
X-Gm-Gg: ATEYQzxjgMIVFeF0d6wtDvjuM3uMoVxW4s8ADIzgB8vIhdU/Zf23ZzcXrlqB96k9fuu
	ncZxjenU1xx2Tmj38IkVHbrfzBciUveUqAUkObNBh6l540IYppDWQZyWl/7wXbl6gFjJ4V+d/w+
	xuZKsgJ9HEancmNtWrh0YkDg/UD4erfcMocHH5LxkrReru1EmcjUOeN26GBeql478ixYp/BdLD3
	73XiNi/z+1p/sZMHmg8ONiTVLvvtp5JjkHxYXU7zmvDhqsNevK6ogIA56W1FzfoijxcWEqX6pBR
	bigZGu6dDOCm0uOmdStPCdSwC3vOaTEOe+YCVZcGB953KSFod10YuY0PUqbdPVkLv9T5FdAbpQ1
	MzawsTGLoX+fybsx4LvRuEgx8fYO2RJqJ3txHRd+Wk88nKrj8fti/Rf728hzcADYt2P/vhpNMvf
	74j8k=
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr441848585a.8.1772704490562;
        Thu, 05 Mar 2026 01:54:50 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr441847685a.8.1772704490152;
        Thu, 05 Mar 2026 01:54:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac546ddsm883089766b.20.2026.03.05.01.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:54:49 -0800 (PST)
Message-ID: <07901284-a42f-488d-860d-985fc30d309b@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:54:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: implement .get_direction()
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        "Ivan T. Ivanov"
 <iivanov@mm-sol.com>, Rob Herring <robh@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260304-topic-sm8x50-spmi-gpio-get-direction-v1-1-a25612161fba@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304-topic-sm8x50-spmi-gpio-get-direction-v1-1-a25612161fba@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BlGXH_cFYdsUaCRvwK_D6qVMA-y3DwLk
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a952eb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=R7yui2fbp9-lrsd8BdYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BlGXH_cFYdsUaCRvwK_D6qVMA-y3DwLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OSBTYWx0ZWRfX/UULOyT10ry6
 cOhPuGGS/BnpjG4OKESAzsRjcMaCaQVlg1AIwUt/SPtfwqdh6hfXWMAOwqQphNyyWCoEyOHQWlT
 cj5WmXrqCZ37KQbm965YJxRHbIKTo3SrD7smyCtgWEdUJ1nRRXVY7z+XPoVD3ec7znA3iWEP2dN
 CJ9IAUZTI9+ibje2PZwKqyD8H5+BTeX9BxG3OTZ0NRgdPHjiTV2FhdHtiu0EupxlEXc9S1ICgfD
 qIXGcM8xmfv0UX7egpejMt8r7LZX17gfK7l05z+scsT8qN89vSDVquTHUQxPqKOnmHbIsugWtIF
 uVinTr7i2aMzOG1wz+n2+iDrRmlZhx37w2kimt5WqGqfwPp6wkTCAWWAkPJ3sOSNSca9r5fxbMD
 SnQESn4oxq6uwCQ6QPHHOvRXqQ51b0LP9acV2rOtpOg0OMut2ptJ8lIR2BCUl1VksyoeY/Tt3Fj
 sL3IKXnXdsI7mBO9Lzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050079
X-Rspamd-Queue-Id: C68CD20F6AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95574-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/4/26 6:41 PM, Neil Armstrong wrote:
> GPIO controller driver should typically implement the .get_direction()
> callback as GPIOLIB internals may try to use it to determine the state
> of a pin. Since introduction of shared proxy, it prints a warning splat
> when using a shared spmi gpio.
> 
> The implementation is not easy because the controller supports enabling
> the input and output logic at the same time, so we aligns on the
> behaviour of the .get() operation and return -EINVAL in other
> situations.
> 
> Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
> Fixes: d7b5f5cc5eb4 ("pinctrl: qcom: spmi-gpio: Add support for GPIO LV/MV subtype")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

