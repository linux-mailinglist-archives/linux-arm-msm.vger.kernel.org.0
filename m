Return-Path: <linux-arm-msm+bounces-84160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF2EC9E39B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 09:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD31B3A5292
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 08:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539C724DD09;
	Wed,  3 Dec 2025 08:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvBSoPY/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZE7atec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC002D47EF
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764750702; cv=none; b=izu8RiCX4j8SuePaXZvupgEw/7pMxwGHSX2nl4zJu/6gJBdeSzar4qUCM/V8igvqFFfeh5TfjoPTz0qpmzKs/rEAwvE5aBdR44qGGUJlO1dUowOIP3cIt0NRIhJvFTZGKw7y4++7HV8h/2wwRYwT9QV4nYvMZOWgVFBfK7ZtZ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764750702; c=relaxed/simple;
	bh=R1G4rlhyPvUDu7seOX1IenYosLHkkDKcXsiRZN5i3aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3dzcn0hj3NSZdvj73k83jr3AtRqEzlQoIguFGWkunzR6/DS62Riqna99VlAmGy4dJuCVXsUlUthJkTmKTIUZKSfrKnhr7vhBPAXvt0PF7Ku11xTv4HjCn6Z98fb/mJ/Fuu35Hcm2wI6AQSnCz84PwwAFp2JfqNrCQO3Kkc4BoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvBSoPY/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZE7atec; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B37WQgU4011467
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 08:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g57G43+KQ/R2mvLnTQxgh3JZ
	AKXywlaKdXICL9trxWs=; b=gvBSoPY/KpyiKIvCMRBw9HqHiJ2eJddTwHg2Hr++
	ac0+Pq+miwBtC109GRlkSMt4a4xOfK+aC1mPtHZcZCCW6l9+LVwtdMYkroIn4Xve
	tHp75I2IRJBdqU/Hchhh+oaIKtILVe5VeELXgQUluYgTWaiStUoTPlECMW+fGrWw
	AADulbGwqut3hQ9ASjp7dlVNETJhkyPIhEIYlK+IhsxEr3U1XQIVISE6WjTdtcMz
	eWnjF94VDEOpQGz1Aqm0c1Ij+glG+c4UIhTv1RAt4dHFyspHwLXIPhLSgHy5m5PI
	PkwdYLSP6ldZVXvQdi7GOMH6E6CxKG/AMln5PLQWzd+10g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at8d9hn1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 08:31:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-343fb64cea6so11881239a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 00:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764750699; x=1765355499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g57G43+KQ/R2mvLnTQxgh3JZAKXywlaKdXICL9trxWs=;
        b=PZE7atecmnCkAFyIzbS96UxW+DqLht8MIOEcrj47+iTNjTjVPO3KhrhbdQlnGWhzAK
         dvJMNaCyET/Cc5qRkEPGdRxDciOoGiKsrBITLWQhJMmolXxTnWHCBbV34XTfJCFHXdZ3
         +iqfYgmUkA4nzfhfEMMhccSwsnt8QQT6i135QiuYbwUPP1yQwd2NC3/FQ4LCuWSMS/lE
         FTNtMtnzrZPrvW6k+D5qu074qDgYw4te8nKSO6TO2v8drm0Bik/4zJpiWTfPxO5I796e
         DLjKk1lp9/wlHnEHBclQNmLPbHaLSdCv76Anrqpkw9JAaxt2FGYQ8V0h0xiGOj8wnYeW
         RizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764750699; x=1765355499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g57G43+KQ/R2mvLnTQxgh3JZAKXywlaKdXICL9trxWs=;
        b=NUr5fp/joaAIoh6WgKrj93p+wl0oXKCGrkogTE8aRrmqSrk6EJZaxzIHgJGNi3//xd
         +3OEQcJcCqdY/KPS71cDFwp9aScUOpFmUEioqpMhamC3PtmztmD0qInRWh6y3gDn4as0
         L4+yMje3XgkQXll5bV6BZmBcXQSHwbulErGOZZrF57h5sEYXOg8wVKUMJ+abNkMtcBiQ
         bcEumX32grGDItpytNa95OhNPu5wa+O7atzakTZXWDUtMOmTxJ5pCUWEqoLdTluyokR+
         fuQ+tXasjYa6X25B5rjEsVtLmnDwDS/xmNoZn9edyGFgkqt3LViCBaIxCQYFP0P/rB4X
         tcog==
X-Forwarded-Encrypted: i=1; AJvYcCWpE5toF6w93MRESq0LbkvYOsNHzlZ5hdFMdj2/zMo5y5Du81Lkou2abIhc+Yn6EOkg7mp1ph3ro15fAOKn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx1ZIoXyyasT51pnkWYMKmxnmMgPif2EzYI7+5zRfWWT4vy0S3
	4LsdsovIcp5oJEH1/Mq19TinooGaZN4DAoqo6arOmO+r/FU/McOtBp31ZRqYUdI0Q/pkzmtoBer
	h3DnmQLJio6QPNEs3xQK+W9h2JLK+oIdKxdzXZQ8hrLBcJamionIFdyhReFvzef2EVKcY
X-Gm-Gg: ASbGncvICaRO0STSSxaOUZkHc8r+/DZ/jahy3LDCOPijDLEFTR6+jGST5LugaHRz35x
	TDzWmP+Xhev48mq06oObJb1Iy7BtUgYsbiI1N6eFqAmMHOSoP0Uh8hgVoeWNrP50umnov7gyI7e
	bHoV0aHwgsIX6gDANaVK8tpHe53pKXG6LQM3mupwbdLEtokVenKif7cGbMrZlZ9zRvwbNJ9Makg
	lNVsHJlmF3U6OZEERgT7DERI08ijMm3HE+pJFhA20cXfPouuJIHJOPLVlh8FfHTx1SHRPkq6OHW
	T9eDv0OMP1VIZzN+QbRZC/yJbQ3fTeJcvPfumczX/2FkPqSxFJFbplLUe/r0MNtMqoBXqouMNhW
	McI7bKO44jnSH9i6eL9S6vpLrTCvtIcNRntg2
X-Received: by 2002:a17:90b:1fc8:b0:340:ff7d:c2e with SMTP id 98e67ed59e1d1-349126b9982mr2048248a91.29.1764750699136;
        Wed, 03 Dec 2025 00:31:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsZWI4JXEPkdop6rwyM7H2+OuLhTToCnRC+xEmSNS8spQoTtrdcrXz/0+gmA1RMfkTQjaubA==
X-Received: by 2002:a17:90b:1fc8:b0:340:ff7d:c2e with SMTP id 98e67ed59e1d1-349126b9982mr2048229a91.29.1764750698519;
        Wed, 03 Dec 2025 00:31:38 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be509d58e47sm17115889a12.31.2025.12.03.00.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:31:38 -0800 (PST)
Date: Wed, 3 Dec 2025 14:01:32 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v10 3/3] firmware: qcom_scm: Use TASK_IDLE state in
 wait_for_wq_completion()
Message-ID: <20251203083132.lpx63c7oium52sr6@hu-mojha-hyd.qualcomm.com>
References: <20251130-multi_waitq_scm-v10-0-5a5f2f05a417@oss.qualcomm.com>
 <20251130-multi_waitq_scm-v10-3-5a5f2f05a417@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130-multi_waitq_scm-v10-3-5a5f2f05a417@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA2NiBTYWx0ZWRfXxmOhzbNCUrdg
 4YGV7Qj3QzEigjI/xEz3btC7KNUqMsIOFhvdq58qHLM9Ef50XaowJAvYgSLzUSVA5yHh+eKEhJe
 MPRcEoY9SuuYBA4Xvr6b6RJvQS8uQDiKnzj5tvXGgIYiHwjxZCoYva5jdTTocgZuXuexRBLx1m5
 z0adbFy/jfspSihHPKd5OrLCbohapFTdASgSDndRke1GBPrk93r6LWSkGT3C09TrIB/M3qM7G4A
 YQaDBNECAN+zO/K6JjxDs1xoEeE06VqaFslKPKkwlKq3B0IwSpNhbbasTGAJY0M+8FqBDKxVui/
 yMgsu7WeHNUzDzUycqG6YkENxKPleFbQCc56I8qYI3fTBTO1PPplQRt5sdJWKRAQItrcAZQc+ql
 l0QEcwoRectQXYzY8r29pNERuCT+3A==
X-Authority-Analysis: v=2.4 cv=A7th/qWG c=1 sm=1 tr=0 ts=692ff56c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=HpDnvd5R3rDAItYWOp8A:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: P2loy0tbmsAZcFH83reTcRufSFAgxDBh
X-Proofpoint-GUID: P2loy0tbmsAZcFH83reTcRufSFAgxDBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030066

On Sun, Nov 30, 2025 at 08:11:04PM +0530, Shivendra Pratap wrote:
> From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> 
> When the kernel issues an SMC (Secure Monitor Call) and the firmware
> requests the kernel to wait, the waiting thread enters an
> uninterruptible (D) state. In case of an extended wait request by the
> firmware, any device suspend request, cannot proceed because of the
> thread stuck in D state. This blocks the device suspend.

Not only that, it is stuck in D state after holding a mutex, which is
more severe because none of the SMC calls can go through. However, this
has been the case since the day the firmware started supporting waitq
with a single context, which is somewhat acceptable as the firmware does
not allow otherwise. Since, you are adding the multiple waitq context
supported by firmware with your other patches,

Do you plan to support multiple waitq contexts i.e parallel SCM calls,
in SCM driver as well ?

> 
> Replace wait_for_completion() with wait_for_completion_state(...,
> TASK_IDLE), so that the waiting thread, show up in TASK_IDLE state,
> instead of TASK_UNINTERRUPTIBLE (D state). This allows the thread to
> block until completion, without blocking the device suspend.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index ef3d81a5340512a79c252430db5f09cd8c253173..45951c04f377b725cdde4696d834435abd92f015 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2316,7 +2316,7 @@ int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
>  	if (IS_ERR(wq))
>  		return PTR_ERR(wq);
>  
> -	wait_for_completion(wq);
> +	wait_for_completion_state(wq, TASK_IDLE);
>  
>  	return 0;
>  }
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

