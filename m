Return-Path: <linux-arm-msm+bounces-79182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 312CDC147B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 231C1189B0BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9F031578E;
	Tue, 28 Oct 2025 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/mwc5Fb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D410314D1B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761652650; cv=none; b=dfR/YZy1C7xe90Dtzmx5iQKDX5Ok2YtAaEb4setVzAT18zZKe8Hr13CljGyS9rVWNKel52DMAjqIdKPPjdwVwsgUkJJ8nPqnIFkheM+6JKa2XGr+UsjPQ0hrTwAtbdjvKqUUbSjYq1hAGcU6Tte6y0Ee2vqwvFgwLhJKsxvofa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761652650; c=relaxed/simple;
	bh=9xkHgYIC5kr9w1gwfKZuklAm0CvF7Aip9Ua4e6pxhbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qyq9Xce8Vv+vBOfbuEk1R0KufVl7QGM6v/oLhKhKF70X79EtFtoeNQx8fgZZHqDLMFYSBRcrJaCZkByJ7XT695Te3BGmiPfxP+2FjCvyM4+qk4Bbco3HVKNIUyebR13kmw7PFAmfsOmNnpDltkfLNAtqrRzV8mjoR3UNOuKiD/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/mwc5Fb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S9q5JW353700
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0hz2jfODAAr0ZC0/E+I8v4TQoFcW072mTuJka4S2b0=; b=C/mwc5Fb2cQ+6xaL
	wjAp2lunp/miyzgNWXDSFcR3p4Nrifhgw+I6WwDaJedPu6bE5RiEAVdx0n6EvKPJ
	+E6tjXSynFEkiqOJXRHwkM/xLU2u92rJUNHaGHM1HfEnUj0ommhkY99fa5w37ZHt
	8YziXsoUpfbT9FzUa8MUTGU0vO9EGb51E+y/WNK+qkQcG5Nhvo06Ibo+/uC4pn1I
	KcvQI8bSQOUxhU/rsd1TaoKFqe0oCXdi+Hpz+QDgLwWzzSdEysDo1CVOulrB6Tso
	30o98jmMmOsiaVPMt5r3p9nDVYf/QRwixVsOZ8LlnKJaG04QBjIn2tzQ2GJyZao5
	51/M5Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2njrsgfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:57:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2930e6e2c03so62336885ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 04:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761652647; x=1762257447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M0hz2jfODAAr0ZC0/E+I8v4TQoFcW072mTuJka4S2b0=;
        b=omux8RtJG4Yi+MXS10YksKhtSyxU0Za6FuwT2r7xAm/EEeQJsnzcfjGYCTQ+fY54Ox
         hkDT5Z45obfsNnt76WNHPUQsVZBbVU40/9h6mlXtOgsAbJCQj1xjwC9UB03ettz4LvXR
         NSzj3mXYgyFRf/p3THntktAyWBPFYtzUC8gT8I58Yir1ZaEguC3eFxDiPWH7gj0hVr5c
         br7xHBlYxLtnQeq/nlapwyQPOwxCDXHu1p9wF2OCXgiqBr2nlIT8rL/WC3uWGqKdTTic
         LIPTiLPUYx8Xj1V9B7P8PPVZB3BOiJfKHO2kZ2SNd5f5dwsGR221zkpLiEsCHolNRIMK
         vJEg==
X-Forwarded-Encrypted: i=1; AJvYcCW7VQJgvQpYe0Rx5i9EVHaKIHfwj6qwmNi7Ef9YNcBnqgQ2igulmISBwwzOhBVw32uGBNOMNfkv9TG5O+mM@vger.kernel.org
X-Gm-Message-State: AOJu0YxCdxRCh1jqm8BGfbkPIZRWp7SiYto/TF9mTEAnxNBHz7sV1tXJ
	ouQZU8nqTGWMvTKxTg6oOly+Cg8wFDl/YlQJy5+7uykyvvB6wRBG/H4zRNO3sJf9KcXoLTJnh4k
	9Dc5dNykfv57kyZ3wAynxsXQr/wWbvLnqwXUn4TZoev+A2YqaUv2LRISxR1CTMK3/M4k3YLLYfU
	Cc
X-Gm-Gg: ASbGncuSfXi4KDJ/Gqtqj1pMhxmrQmmA3g724SIBrXC6wkl23vJJ3AAgfLX58+tgTwB
	xhlGtCRiwu0hBsaLfFJIFV07unNrEb3PUXlcZikwK1MQezfqYokZtcnVSBtAYaWtSYmSkfXuXBt
	KKCOu76ho2+7OF2ZztHaoW07lbrU+0osRNeyZ1Eovx90C0nv7QB9RBX7c2nX4WdAozsOAyunBqK
	6TUpC4F64MC38O4AkRh41yeeLhSbyTsHSEqD1uoNqr8wnFQPX4SFGzwZhHNJ3FaOYewJq/rIzfP
	fnjF03yubSo/k/BWtLgSHgh5ohhxtNuuvD8pSR4W9zzVfJDO24YWbKqUMt1J//Hc7dIKu3bwwQF
	uIPntWJHMBuZ3kFBmMII3IXvCAmsSmVI=
X-Received: by 2002:a17:903:1b6e:b0:294:ccc6:cd31 with SMTP id d9443c01a7336-294ccc6cf68mr33391015ad.16.1761652647440;
        Tue, 28 Oct 2025 04:57:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6NHHgc+bevFWOYNTOyhx/IK9uUVX3a2+fvaHYWDRweyl69NQatdOfr8zuxd8txq1BmuzJ7g==
X-Received: by 2002:a17:903:1b6e:b0:294:ccc6:cd31 with SMTP id d9443c01a7336-294ccc6cf68mr33390665ad.16.1761652646962;
        Tue, 28 Oct 2025 04:57:26 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42f34sm113081035ad.106.2025.10.28.04.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 04:57:26 -0700 (PDT)
Message-ID: <34097d61-ce31-0ea9-bb89-7b91162a0c71@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 17:27:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: iris: set default size when S_FMT is called with
 zero size
Content-Language: en-US
To: Val Packett <val@packett.cool>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251012235330.20897-1-val@packett.cool>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251012235330.20897-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dqvWylg4 c=1 sm=1 tr=0 ts=6900afa8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=R56oJKbAf1OrWRSGOwIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Z86myKBWBJn1JJMkxbjrJpU4AMh-zR2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEwMCBTYWx0ZWRfX/uJzRn2jlU4K
 SWlBCTC0H406EfW5Pacbm6a/hBrPjrXFlE/kFh+gxqeuXOPHIo9azDGtiinEAsQqs5f4UZ7FQ5u
 1+GcvqrWfmlavKjh+S8FY9DcFsglKMqpIcsUsT2iHjAiNAfwDnKWGJjEDZ2ANiJfjT/C30OQB2F
 aVSAnEtfe+WRX6q97aL1RpLgDBS7AJCcDxT5nVBFLpXIqRhvR5IBj9ojl1M24hyDkyEXppWIANE
 p40XMdQQ/J8pF0uojV/Q9X928DAvmNSDwpql2dh3Qd3oAInzzX8o+A2cTrOGcWbSJBgkrmt77cD
 4uOYxuQici10PJAhf9EyFwBxda9Jz3TFgzE3v58c078EVvdGFKrO4phVInnMbqirxNczz0XfM0b
 RBOYrmCTtcfBee/ooYr3eO0I4OZZ1A==
X-Proofpoint-ORIG-GUID: Z86myKBWBJn1JJMkxbjrJpU4AMh-zR2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280100



On 10/13/2025 5:20 AM, Val Packett wrote:
> According to 4.5.1.5 of the M2M stateful decoder UAPI documentation,
> providing the width and the height is "required only if it cannot be
> parsed from the stream", otherwise zero can be passed.
> 
> The iris driver would only set the state fields to DEFAULT_WIDTH/HEIGHT
> once upon init, but they would get overwritten with zeroes from one S_FMT
> call and the next S_FMT call would already see zeroes in place of the
> defaults. For clients that used that sequence and did not pass a size,
> such as rpi-ffmpeg, this would then result in REQBUFS failing due to
> the zero size remembered in the state.
> 
> Fix by explicitly falling back to the defaults in S_FMT.
> 
> Fixes: b530b95de22c ("media: iris: implement s_fmt, g_fmt and try_fmt ioctls")
> Link: https://github.com/jc-kynesim/rpi-ffmpeg/issues/103
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> Somehow Venus didn't have this issue and didn't explicitly handle this..

In venus driver, try_fmt is clamping the resolution between min and max
supported which might be handling this case.

> 
> I'm not familiar with this code so if there's a better way to comply
> with the UAPI requirements by just not even getting to overwrite the
> state with the provided 0 size, I could not figure it out.
> 
> Still, let's get this fixed one way or another.
> 
> Thanks,
> ~val
> ---
>  drivers/media/platform/qcom/iris/iris_vdec.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index ae13c3e1b426..6be09d82e24d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -196,6 +196,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>  	if (vb2_is_busy(q))
>  		return -EBUSY;
>  

Can you pls add a small comment here.

with that,

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

> +	if (f->fmt.pix_mp.width == 0 && f->fmt.pix_mp.height == 0) {
> +		f->fmt.pix_mp.width = DEFAULT_WIDTH;
> +		f->fmt.pix_mp.height = DEFAULT_HEIGHT;
> +	}
> +
>  	iris_vdec_try_fmt(inst, f);
>  
>  	switch (f->type) {


