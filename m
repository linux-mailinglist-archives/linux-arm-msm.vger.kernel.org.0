Return-Path: <linux-arm-msm+bounces-69543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4FAB2A125
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E6A17ABCC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C9030DEA8;
	Mon, 18 Aug 2025 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRbbCsbo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8AA30FF29
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519051; cv=none; b=aYJxEpsWQENTnNFXLRxvL0f162BQQu+gizPey9JqflywnzjJjxLhAjSRBit8wheLrFuE02rtkzX9GvwLZEkZQ6BoQPjyK45/bvf3U8rml3KrL1klbZaRUDiW6QMwgLZZWey+fCA65y1BaKKscdMbRQCDiqykfycFSuwMtnADjDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519051; c=relaxed/simple;
	bh=ntj8WCLKC48E3RqrJqdwUp6JvG6kd4zyY6tqV2E6kIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbZlS/Cne/OVOqRPl3/eYty2sdf+9iYWSusHLfMHAVWbNNVLjpKh7pU74EFw98t/gfeHwQsdXFgxXD6rCEuWthZWAMMvoKzW0VhIexUui7P7pEes6PZ/cXBql0MFYjqB/7NQNAjftGEpSB18TT0FjXx86aLRdal2EBSxqLp5eRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRbbCsbo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7V4NY004123
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkCumoRo2vdkK1vJUdNAG8+5dWwDOOe6LmYrb1+L328=; b=CRbbCsboCmEeSV5G
	He/9QKkQkSmpqBbjylTHOsOuzhgOf2ZhdMWXnzJfyK0gPTKGdEiKKsTzy0fg7u19
	EByc/RZlQ4mD+wRAmk7W90I5z3hSLiS/Pi0/aB54nJLnE0jtuzkfP54FVMJQKB0L
	cU7oU/ydbX9pbuGUsGNDh9ExK4dqWRDWUTanvWQLQHKzDU297sSq/kyGCldhQBda
	UwOSozM4LuL+lz6hT55a5NYtIwLq9wGCYv5z3XaEUDeqIaGBCt64A1NclTy4zx/U
	a+QHWW069SO57XSNorziTvrd9Lx3aY/TcT/hB4CsV+fl3aPJji/sZXS/coxL0K1r
	P8bdQA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyur8uba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:10:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445823bc21so104576675ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519048; x=1756123848;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkCumoRo2vdkK1vJUdNAG8+5dWwDOOe6LmYrb1+L328=;
        b=BG7dwPUN64ucJHza6NH7En+XWwXcMwaoqOazKBw074e8GPkuQ5+j6Zxrv1DbDsjisR
         pZZR4yf/OIHZHkn7KbqOUBqBNeujixo1aSihBkey8eYh3iePMZSznq0WftxSVzarEC16
         RNmS3w6KXxF269ENl5isTKb9t4RwqTcwRCul0RO1aAtmkFbtceggWX863F02zJ2DupNq
         q17aNVQWBCgC59rdBCrJ8kFnM0b/lyzrmcGQ5JfPlgGpLsvoQ5k/qPUv1SOJ9sJclc/r
         3836Xz2Mt+uM++2YusuNAZhGPVCpc1CI5fzde5UxDVPthSKT2k8qgAQei2C80qYprqVS
         FaVA==
X-Gm-Message-State: AOJu0Yxhy6pENnL7c3ge3g2XFzoJXxzdnUZ4wMJqxdgAvSwDtUZcFgiF
	4hULJcZAhf5+QHySRERSdTC/CapYkejZBTlCgN1X+asbnR41Mf+SYCos1dZGRYM4N0+Phk3eyy1
	PABKv0loAqxN+iE0Wjoqb/zMYtAJX5yC2h0frBqJtugE7Qs09GkrosXUSCjKl4DlpnbOM
X-Gm-Gg: ASbGncuSUW95vWfH36Ril0wfqW5dkiwfq2bN+aNVlUzfJUnzXT1rQSkzPsrri/VR36L
	tvU45laAb8eEAnsxNdoyB+eEf0iEPBZm48uxXTVCkQYuMPripEDLkzw/I/takFZNk+t1EoDKJ8r
	B0tlqdZN0PugbLjhQ2a/k3MLv89WbmhYFQJxjQmmjuhppaAHTHZaT+XvcR38ND0gmwGUS779BB/
	TYObKuKJGEa0SSNw1OXjtzwGT6q2mDIG9GzuUfNKcZfu6R/7a3+iG31Ya0xzB4063XZNd9CYotP
	YQlraUHV1bYjeipcSMX2SLKU69Z5x9OF31Caz7w1peGoE7LgMqSBZLPgH+BLjyyi
X-Received: by 2002:a17:902:d4c6:b0:244:5cde:d384 with SMTP id d9443c01a7336-2446d85f7demr181641515ad.31.1755519048381;
        Mon, 18 Aug 2025 05:10:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZONzJWFtT1XNEyRK6xcm4gebbokS24vhl3Ky3z4naJfpk4imCqD/UHpgAJi8OHvE0+TLUjg==
X-Received: by 2002:a17:902:d4c6:b0:244:5cde:d384 with SMTP id d9443c01a7336-2446d85f7demr181641135ad.31.1755519047954;
        Mon, 18 Aug 2025 05:10:47 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.229.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446c2f441asm79279165ad.0.2025.08.18.05.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:10:47 -0700 (PDT)
Message-ID: <272d2a39-19ce-4ac5-b3c6-3e3d6d9985c5@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 17:40:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: skip re-emitting IBs for unusable VMs
To: Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250813-unusable_fix_b4-v1-1-3218d166b8a8@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250813-unusable_fix_b4-v1-1-3218d166b8a8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA2OSBTYWx0ZWRfXwKqORfGsTE+K
 zDezd4JtL9uYlu023271YiP0DAGhQ450v4c6Op/QXkGF+0LCy7QHfI+Z/VOvH+2kPWPnZ30Z7pv
 OkGMb6QPID3RdTGrudHf4+vdTXqWKWr6AKC5uA94BbLA9Kcy/xncZfSDBQP/hmbAzqtJHteZjxA
 0WhZG7gImSXdvMad8ojP3KBe4T95tzMfOF0yHtgMnLfX9ibsYyaQ04zoEAUZb8oFdTWnTPAD1zi
 RphRyXxrcqALgwjXYfWcgV5XdFKUJg9o1Ak+r5d0a0/PtBA0QukL39l6UHS1E3nKZ9rJdWkPFEh
 NscFYKfxS1LGk4RtNoSwk9HRUOfEbGMKaC7FZo6MwsegXvsjAZCeJdIC+8VXGNAK2qNHRiTx2Z1
 fpsr/XZr
X-Proofpoint-ORIG-GUID: 32AoZMtYhHOHUS-WYT6sao_OP36QJeMi
X-Proofpoint-GUID: 32AoZMtYhHOHUS-WYT6sao_OP36QJeMi
X-Authority-Analysis: v=2.4 cv=YtIPR5YX c=1 sm=1 tr=0 ts=68a31849 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=9Q8gPALlkHEzzDxkdHlyxw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=b798ue3nI8IKDaXQGNYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180069

On 8/13/2025 6:34 PM, Antonino Maniscalco wrote:
> When a VM is marked as an usuable we disallow new submissions from it,
> however submissions that where already scheduled on the ring would still
> be re-sent.
> 
> Since this can lead to further hangs, avoid emitting the actual IBs.
> 
> Fixes: 6a4d287a1ae6 ("drm/msm: Mark VM as unusable on GPU hangs")
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index c317b25a8162edba0d594f61427eac4440871b73..e6cd85c810bd2314c8bba53644a622464713b7f2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -553,8 +553,15 @@ static void recover_worker(struct kthread_work *work)
>  			unsigned long flags;
>  
>  			spin_lock_irqsave(&ring->submit_lock, flags);
> -			list_for_each_entry(submit, &ring->submits, node)
> +			list_for_each_entry(submit, &ring->submits, node) {
> +				/*
> +				 * If the submit uses an unusable vm make sure
> +				 * we don't actually run it
> +				 */
> +				if (to_msm_vm(submit->vm)->unusable)
> +					submit->nr_cmds = 0;

Just curious, why not just retire this submit here?

-Akhil

>  				gpu->funcs->submit(gpu, submit);
> +			}
>  			spin_unlock_irqrestore(&ring->submit_lock, flags);
>  		}
>  	}
> 
> ---
> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> change-id: 20250813-unusable_fix_b4-10bde6f3b756
> 
> Best regards,


