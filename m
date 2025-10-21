Return-Path: <linux-arm-msm+bounces-78126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D08D1BF57D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 54E073514B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FBB32B99A;
	Tue, 21 Oct 2025 09:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ES1sGkVm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE15532B983
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038723; cv=none; b=gdCTM7HkCiZvTGPgASAE90DtGlh15VSTnCNXGuebVZ/xLViHhTVb0f3q49jOtiGN1Y77wU+7mF0OHEUI2q8EDWAXo2RYSwzPqeQodG0cmY4nxDJ5/plls8RikkLYuKzOAuOLORG3GcD/QAcQFiWM1rWf31szu4ObbYoLKhHLMf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038723; c=relaxed/simple;
	bh=wOmHGZyZKyJNqAdT7tHEp7PbIwkY9sbR/Ea1DPL5/o8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFs193x/3Iu89REt/1A7TKWSkhEGeviXoDnQLZevXJtCoMpRcotHk13U/LQJC19HNrZLRnakBqzzNoHOjq2j+SIlEqYVpjcdm8pRXeNmeerR+WhnkeqqZIi7FMAyus21tK5v2P/JvlZM4r4nNuisuBCIE8DLfbzK5F41EiTdRkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ES1sGkVm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8QZNb024982
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7nW2A2/Sdl+uA+0oNeIno2lzJVyfIo1jiDtXonqrUVg=; b=ES1sGkVmOXmoUqoZ
	BOuZXLEhjrmlGaBzUy8AfJwTkfgGwKDnyMlKODA5J+pPwIq6ttrAnb+efE9FZnyl
	AbVrs5C4+eWw/NoYx07MwKlhX9jeYCyR2n9eF9OVUEDyLeC2uWphjjC5EX8iUqi6
	ousMS/JP8RgDJgA19wWwd/aTAi3ghIwwyNyN+Aaz9aciUp5tIjxeqe6VyJEygfY3
	xpFrMyA2irDJMX7PbcTrW8D88xapHmuaVcizKtxcrIa/DifJMDplaWczqRX1G2T1
	H+es4mfT37LmDV75bV9Oww1vYS5wQtm76vnq3DSfHfJ/0LsIoj8dpsNmeF2JKR4X
	yaIfbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w806s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:25:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-891d3eba6f8so185360685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 02:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761038712; x=1761643512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7nW2A2/Sdl+uA+0oNeIno2lzJVyfIo1jiDtXonqrUVg=;
        b=cWSv/kdaG/WI14oOPtxUU1TuTaP5wBqUnIPO9W5h35oSNzKIoFgt9WB/8S81ZBjQCf
         hVXaKJBO05aM6Dlu4yrmLNaboLhNR+pn95TCfisd7Uqn+3xPcoUtuCHsItpiFEanSaK8
         bLdbgCP+sWxFFN+S/ZtgBCLbQsD0imW/7J7lqPlN42H9G7NtUyd3X/jO1gAFFbV1D0Mo
         GCkDEtd3qAqvYawK4FzZLvrdA+oe8/DQ6HuLGyMm6Z8cH+geldddHKp39sgbjEJBgl32
         KZ4Xuvgj8f5akB1mThu4KU63lwb2pM2KmSiZCaqgIGeErPYvVfgu6O8VHEPMvRNJfhs4
         Xg8g==
X-Gm-Message-State: AOJu0Yz0lGkurNXihPWyMjBSK2Dk++5or1xigR6QN81p1Q1MBup7LXux
	Vvn1rLgiu4NcszjpqcaVFRsctP2vLwiWCK3Y1tNIKMUOF2LmYHjrskXzFIM+Ycl7mzYYNegcwUL
	iylqTSziOROl7XfTlQLPskwcsYfNfcwLF6XBFWVmfSuhGIRwZgjBfg/PGMr5YzJ+HkOtd
X-Gm-Gg: ASbGncslrHgbzqJcYBGJ6Kw1KWpvEoVhe0FZRpp4NDWQtzHPl/8Rvy03causPWYg6Cn
	olFnZyoYP6ssCiiXE2hy8NK90R73dI6ai2Df1+pn9BAMbVTTu4OTHoNfzArxBOH+0Y2/Cm3chIG
	iXxlULeou/h6lLh7cQX2kFH/05q0bXbzjkSWz55nB3wUkFa85UdtgLuwcAjQm7i+qH/Ro5wv0Pe
	Athe+fFXn0cs9HFMRiS+ukYB7gKvALJH7KboNtSJGaxHTVcfkFCTE+Vd0JmRGaTUqC7/bJa44yK
	+D4ocTYSw015NBkQrrqvSf0IuRS+2IEjTt/z8VEvQne75rTYN4OHx97CNJcoq45w7J1r62vs6Nc
	F9CPHuKQIjkQq3q+P+AlJrctQ2B7gIqreFfSpn9hd/2Ssjo12RnPufc4x
X-Received: by 2002:a05:622a:4c7:b0:4e8:9bf5:5ecd with SMTP id d75a77b69052e-4ea1168541bmr18751961cf.1.1761038711964;
        Tue, 21 Oct 2025 02:25:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk59Wq45eSmY+tGWqEQNxDk//11cZC7q1beswb65jhbWLCg1ETbu+zF69qDRXnYYMyGb4j9A==
X-Received: by 2002:a05:622a:4c7:b0:4e8:9bf5:5ecd with SMTP id d75a77b69052e-4ea1168541bmr18751761cf.1.1761038711453;
        Tue, 21 Oct 2025 02:25:11 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb03671csm1014961166b.38.2025.10.21.02.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:25:10 -0700 (PDT)
Message-ID: <5569198e-5548-48f7-b64e-b7574ea59691@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 11:25:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] backlight: qcom-wled: fix unbalanced ovp irq enable
To: foss@joelselvaraj.com, Lee Jones <lee@kernel.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021-qcom-wled-fix-unbalanced-ovp-irq-enable-v1-1-edd304d165a5@joelselvaraj.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-qcom-wled-fix-unbalanced-ovp-irq-enable-v1-1-edd304d165a5@joelselvaraj.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX2isqcOUMwavF
 nrrPITPJJoW/4LfZdn9Y9redXDqO7T/Rpq13gvvwAH1CkIFi6Ft/sfrU/1ZWZgHxW3eFceEy9rs
 eiimaEjUYmWoz8COx7nchHrBHIWznhKL1gftz8QsL3Y8iVPKUL6qx0buofGqLb25Vw3Hnjh3CYZ
 J2XuCY16MMCF5ElGvCCCeog4O3Bq9MaNjujYa7fgW/ecBYt+BKtuFzwXs51rb6k6y9WypvsxXrD
 S237Ov4QHpXajZVVCyFnAQBhspHSEyUUwH9D7Rhx6hp5R/brEWzUHVETdOSlNxHOXK7Sfw2q235
 Vw25J/NnEHN4GB3MVgK+zBN2R7GNVEB5acv8jD2aVVK4mc8S/Lp9cpnJQ3+Wy8/aVxCFbuFAk8W
 8zmZTNsMkF8HvdFY9z8N6b6VFS36ig==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f75180 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WFa1dZBpAAAA:8 a=6r-yMKpJyw27a2n3RXYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-GUID: M85G5P9dAR0MQb5thxCDmqIjB19hZ-35
X-Proofpoint-ORIG-GUID: M85G5P9dAR0MQb5thxCDmqIjB19hZ-35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

On 10/21/25 9:33 AM, Joel Selvaraj via B4 Relay wrote:
> From: Joel Selvaraj <foss@joelselvaraj.com>
> 
> In Xiaomi Poco F1 and at least few other devices, the qcom wled driver
> triggers unbalanced ovp irq enable warning like the following during
> boot up.
> 
> [    1.151677] ------------[ cut here ]------------
> [    1.151680] Unbalanced enable for IRQ 176
> [    1.151693] WARNING: CPU: 0 PID: 160 at kernel/irq/manage.c:774 __enable_irq+0x50/0x80
> [    1.151710] Modules linked in:
> [    1.151717] CPU: 0 PID: 160 Comm: kworker/0:11 Not tainted 5.17.0-sdm845 #4
> [    1.151724] Hardware name: Xiaomi Pocophone F1 (DT)
> [    1.151728] Workqueue: events wled_ovp_work
> ...<snip>...
> [    1.151833] Call trace:
> [    1.151836]  __enable_irq+0x50/0x80
> [    1.151841]  enable_irq+0x48/0xa0
> [    1.151846]  wled_ovp_work+0x18/0x24
> [    1.151850]  process_one_work+0x1d0/0x350
> [    1.151858]  worker_thread+0x13c/0x460
> [    1.151862]  kthread+0x110/0x114
> [    1.151868]  ret_from_fork+0x10/0x20
> [    1.151876] ---[ end trace 0000000000000000 ]---
> 
> Fix it by storing and checking the state of ovp irq before enabling and
> disabling it.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---
> I am not entirely sure if this is the ideal fix. But this patch provides
> an okayish stopgap solution till we can properly fix it. I am open to 
> try a different approach if there is any suggestion.
> ---
>  drivers/video/backlight/qcom-wled.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index a63bb42c8f8b0333cd6d0ddc5bda93916da3fef3..36e2fe5c5fa37cfb8750254a75eff612741983c8 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -197,6 +197,7 @@ struct wled {
>  	bool disabled_by_short;
>  	bool has_short_detect;
>  	bool cabc_disabled;
> +	bool ovp_irq_disabled;

This is generally "..irq_enabled"

>  	int short_irq;
>  	int ovp_irq;
>  
> @@ -294,7 +295,10 @@ static void wled_ovp_work(struct work_struct *work)
>  {
>  	struct wled *wled = container_of(work,
>  					 struct wled, ovp_work.work);
> -	enable_irq(wled->ovp_irq);
> +	if (wled->ovp_irq_disabled) {
> +		enable_irq(wled->ovp_irq);
> +		wled->ovp_irq_disabled = false;

You can also create a short wrapper like ovp_irq_enable() that would do
it internally (making it harder to overlook assigning this variable)

Konrad

