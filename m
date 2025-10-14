Return-Path: <linux-arm-msm+bounces-77108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7287BD8253
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEC1218A2800
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCD730E849;
	Tue, 14 Oct 2025 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Id/xKfdF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6763430F55C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430150; cv=none; b=jjJK/Ic2UjGHOLTDkmvxge3OS6cC25UB0RvZTRUgFYji4QUbhD1Uisj6gxUkILRMp1UMKK4whFLJgzoIWetjpPH4orFwMsECBZ+LEtWe9j993rHmqT93E9IQI/hzDUUsNLd56DJsObamBcoFxm6sryFDyvmh9h+6f58uC30Hr9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430150; c=relaxed/simple;
	bh=CAw+2q1jb4+KyAhmwvSFmEXCgypuAgJT26FqKT0LMNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=giGLfWvvl5UMAxSbTGsOx82vAca9nzLlcZ2Y/dBPy1ej7aynSFXu/Y8fz3YQjkX/CDNYkYjox0dfacHgZE77usDpQsAVKAZalw4TvfwzzTYpTFJ3n8x7GIeBsrx+ONEIXebCPdH934s0dEk1DYTlV/imgndlrrWvNxRGy+Z6PL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Id/xKfdF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87JdZ009033
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJro/XUVZL6sNNGMbVoX0we2kE3710IaAzwCCDD1JY8=; b=Id/xKfdF8m1FfW4T
	/NxROPG1I4FbwG5vwQejT71fkYEOpDq+6sZ1VRNbxu5Xo4q2npM20qib/mnu1j1o
	iHWZEDGT4ApFl6ZgIbtzWUB0++K4mgHEcm9FZh3pGNOeW5cpxE7ihEJzURf1kCjI
	RsAsshMotnH2E8o4Ia81HXcrGWqvHQ7IOIjT6ttoyuF5oYw8uJ0IcWaPJ0bYNt7b
	La4NXGUH2AeBUbrYqloL2C4JgR/BGBb0kjTx/QiEn+X6vfjPwaDPfu3rhotM2wbC
	Rb6vn9jrcfmp+8NoOgHaWZEq7+z65GH+QSPBM+L5Mmnx0SBlvVlg3tRJdDp/GfPy
	FiuCjw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5fr9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:22:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780f82484faso5924822b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 01:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430146; x=1761034946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJro/XUVZL6sNNGMbVoX0we2kE3710IaAzwCCDD1JY8=;
        b=bfcetc6xIE3LtZOEvJ4OtYoCxlRAhuDSOiiPEhpnUVDcRqp0x2X9QfHNPedSzdq87l
         8rMIsvr+fFlH8Xc6/jtfgPyUO7ahwKjDZmG4wCGMzjJ6KDnYC6yIoFLThLdYezfqhoZs
         C7Gy28guXG+/OONQAywTVOfeZcwZEVFeQXfkEcYkKy/ovMODGd2Zim0u61EeVsJlSHQb
         OGcAHuZiyPyzENoBDXfOplfZDjOt9n6R9/yiIBbICegPkGMVc5BUfzMUSX76SA38rLl7
         asPanjIT8AClqZwKoxw5O3pjY221Z20EbpewpJSYuj/mEQwH1YqO8BypgSmtFV2LVsCZ
         SVDw==
X-Forwarded-Encrypted: i=1; AJvYcCUWjnS6BXVXNETYMrjRfMKGG5CF7XRI31IIs6ZRrSkAz4uQzPNDHfgumRty7JTT/lZOA2Bm8Awl4XOxN7Va@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw8Kf9Fn2ZDmAwkgDQrKzzj1ufXtBctN5iYkiiqQpnWX2ySUPL
	NJW9XqNVeWvE0f8sStTGIV9GTO8+EWgDmgChFwM4mPQ/U9cgrez48RzHDC49SKQqBdt+UXEpDQH
	34RVNqfiDV+hQr9OZWn0OtqLfSWMFGoEyes1jTgxCC8Z3ZLaO6BGb3+EBOz9pK2b2BHRA
X-Gm-Gg: ASbGncszcbNM7fFGZcVmct2qb6wL66aNvz16WWviH5uNTnYox0ayGQWXVFLIORMkm98
	1AmiR97oml7OZkO2kXmZY0ZsE8Hpgp69/0uN9Tkd4HPKdC0sFmb/+cXZILdlYzfzzFXCITuxkyD
	fuhamlzj8tbaQPcgRtNvV7510RLvjOoLy3eG2CXp7gFupNOpQaN8rPdWR4Zi7DS+5JB/bCjZ7UE
	luWGQ7PsdXpQbww+3dj9xZLytiteclSjeywV/6AesSB2B5OqXSEMUNTnBGpS3+wF7vXqJMDep7B
	qKM91PrAthPLbS11Kl4ywDZpgsK3R6ra7XRNUnUP1r18HKrmNo5JiVKbCGuivXwXH5DiV4Vr
X-Received: by 2002:a05:6a00:17a5:b0:781:18de:f7e0 with SMTP id d2e1a72fcca58-793881eb478mr30456592b3a.31.1760430145840;
        Tue, 14 Oct 2025 01:22:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtVXUxvT3BTmAWyeKc6CnqZyTjDz0qtj7wJr27aCf/zysLVgocmJ0HQDvzjqsQH/oZZheWKA==
X-Received: by 2002:a05:6a00:17a5:b0:781:18de:f7e0 with SMTP id d2e1a72fcca58-793881eb478mr30456558b3a.31.1760430145348;
        Tue, 14 Oct 2025 01:22:25 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm14124339b3a.64.2025.10.14.01.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:22:24 -0700 (PDT)
Message-ID: <7f8cafd4-1e0d-13ee-bc1a-f0a230b4e3e2@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:52:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 4/8] media: iris: stop encoding PIPE value into fw_caps
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
 <20251013-iris-sc7280-v3-4-f3bceb77a250@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-4-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nyU2mp1tf9YKOrip14w9A1Potev2g65J
X-Proofpoint-ORIG-GUID: nyU2mp1tf9YKOrip14w9A1Potev2g65J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX6IO2wKvrlD2w
 HtpRIpA+x+0fRSANEv7b0sM6n3nCbcRoBvBKYi/5yPbihXgWQLXDkrR0ZpDY02LhcBAvnEiuE3F
 +LfcsM5nYx5vsD/lxIdhXCAVIF6zlJQY9QmzyjmjTPRZvA8mOOOiTvFhhqQPRyU1iKAVpOhAEp1
 JumMzi/Ukc0p0fkxL4eGCWVB2U1uFkcykXNPYLXP7aIYay0F9EitDy9Oz8dqV6RGCCHf634OXl2
 XVEoUSnP34JAsX6kcuZBncR1hMVed/vJQ7sXDK/IKIz7mdEm2BboGgokjRdXoPCwIO2EI5OHw/z
 5FXGLSgIHEjqByYvVAmLzskqvVce8YGmhmzuXAvGcZ3kGwvMfoWSkUcCvgq2trc5nOQ01PMCgfF
 BcRQ7AKjpOHe9px3aDxBHWTqF61kTA==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ee0843 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JV23JpkejX04UPURfCkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020


On 10/13/2025 7:38 AM, Dmitry Baryshkov wrote:
> The value of the PIPE property depends on the number of pipes available
> on the platform and is frequently the only difference between several
> fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
> iris_platform_data rather than hardcoding the value into the fw_cap.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c            | 6 +++++-
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 4 ++--
>  4 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38..8db3fa222bdb92a7ffff3dfe62d33f16c0550757 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -318,7 +318,11 @@ void iris_session_init_caps(struct iris_core *core)
>  			continue;
>  
>  		core->inst_fw_caps_dec[cap_id].idx = i;
> -		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> +		if (cap_id == PIPE)
> +			core->inst_fw_caps_dec[cap_id].value =
> +				core->iris_platform_data->num_vpp_pipe;
> +		else
> +			core->inst_fw_caps_dec[cap_id].value = caps[i].value;
>  	}
>  
>  	caps = core->iris_platform_data->inst_fw_caps_enc;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index b444e816355624bca8248cce9da7adcd7caf6c5b..7ad03a800356ae9fb73bdbd6d09928d0b500cb3c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -161,9 +161,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  	{
>  		.cap_id = PIPE,
>  		.min = PIPE_1,

Could you please make .min same as .max here ? I understand the context of this
patch, but since we are updating this cap, pls update min as well. So far, it
picks the .value from cap to set it to firmware, so its never an issue, while
keeping min and max same, it would indicate the SOC have that number of pipe and
not variable.

Regards,
Vikash

