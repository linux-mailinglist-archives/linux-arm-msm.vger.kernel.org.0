Return-Path: <linux-arm-msm+bounces-99599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJgNE0BhwmmecAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:02:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 990303061E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26A4031402F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A80C3DB63E;
	Tue, 24 Mar 2026 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzVGb0Tx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="beeB9yGl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176C42D5950
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346001; cv=none; b=t4dPR484NaeoNiFo7DQyaurtZQxZzoJZknBE6ov9PWZuZC/GKc+euLsO/C7A7wbw2FWb6RDEyWs3v2E+Vy9ywaoNv2LUaQIea5Qto0JtcTm4vDi270su3p4SFn8nMOgFZZqHuQnRenkooCZKH11R1nzFfuFXSoLAprRfbGgYw+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346001; c=relaxed/simple;
	bh=QW7hI61s5bnzSm5UzyZYkq/3AHhD5Y78qxPuqee2cf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJZ03atixgvU5ht9dLUJMQ0LXOAz48CGstQdglBLky603MOxJ05uuAlCe8L8b0rTQn7cq7u+W8hCKFk6FvJ1TPACZggOHLYtI10pZM5DW7EoEEPSqqVybNsfJ0K+yd7LF5tri/tsqe07FxoC9q1yR5KxYt6/PlKiuEp3dICiFqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzVGb0Tx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=beeB9yGl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9Zk7B3903726
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iapTK+TrQmONmVoW3zX5R7ZoU2XaR1AWJC4yYw/a8uk=; b=AzVGb0Tx5agp8Z49
	C8lmGpKsqFZYFO1aXh/EmJ8ngMIYdQFqimPDL0tHsxM4/9BECYn8sRwmPOnUlofA
	AMmqnp8nPDMpvWye2VWoWmmbo40hPYkLescIl9dTERx9GWPvHDF/2IPzHyjTUOCV
	djBA0SiJdlaze1ctLXSMacF5Hy/RQkpbrdB6Zodws6IEO/CaAFYOwz5y0O0OaQaB
	2nyz+5vT8HHYLlW53+sKCPH+oIGizHHKcQb+O0chRzdsG+rMatOBGxc9c+tgPMHO
	gLLWSklZEmhPhMe16M8oD5MfFA7IRyJjrA+OfnzeN27tVEE8bOJ3meIAcJQPfhgq
	Xaa3uA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0h9st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:53:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5073ed1ec6fso50365751cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345998; x=1774950798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iapTK+TrQmONmVoW3zX5R7ZoU2XaR1AWJC4yYw/a8uk=;
        b=beeB9yGlsEU77ByOMj54YB5L/WihdG9WBpJNT1ZobmobD5xfMEPsIJzvj1qTUrIBd9
         pT+Wuam+K6ZKq0ukFtF326tLNVFpH62VD46zHVUMVyi+4kp3iR3w04/xK5gFHv8hz08+
         /zDAdYOLb16SPRBtgzH6J2rHPIusLouEeg6+LqaPPY/LQUsQ/+o1k+UuBdnExDvTPAEh
         EWjfMNk9+/XmZgLqb327pFuAfNMk0ZG6lSEhNPLCioJUUt6+noJEWISy3E8RQ+JRPmh1
         Se6Vp0dQPmKoM3/tCjqnYbR/sVnsUJlscu9whAu48OczBZWrhYqY1zTkk2y4LlpPd8Sn
         KXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345998; x=1774950798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iapTK+TrQmONmVoW3zX5R7ZoU2XaR1AWJC4yYw/a8uk=;
        b=S03opJBsshXv1GIy0VT0/H3+4DSt5C929KrSTObhEa8ENSEygWLwMhWCOiv+jWZRkB
         nITDpWzpQDt8hcdZIfJ3IzL1z9BqzJceXZEXI/FIUyeZ5hZjaPTbPwqNZL+GrRGOHtZr
         o+9/NE8pJWeH80ZbbgYiKkQ8SvtwUd1oNjB0ktxK3Ba9qj0dkQVWvAEaDTdKiMN1e83m
         zhT1dX4SkwUakHsQImHyqw0iDgr13uV1LVXDGKcBQC8bcv7pwEF6dSFvamcwtuEjFP1F
         Eqf4u5l91crohTFFvTdwijFoXeyzb9eg7xNdJq0aBhTH2kpLdQ3ZowVMQxckp5YnQgJo
         S8Dg==
X-Gm-Message-State: AOJu0Yw+qVSDv1Zs7DbrFznfhRfWtcIpyPV9/q0+rhQMqMaDFqp9TcJM
	V9q5TfbY9Oy2mMbnKMc63RGahIVXdUCFrJ+ZHhdS5tQugM7FQ057Ru/vZZHW9bapzCLnibnCLci
	Djz9oR/MNIb5OcgTblNn0vPMyL5PEE5cCDIE/mRZj/i7jWy+ZRtJWYtlJnH224d32fRud
X-Gm-Gg: ATEYQzyi0rislav3WEXOJK2kWpRnniLO16PD9QeYbmaHsKydIzmoD2t8FOWz/g4t62V
	yHMGSwoMSjMNhR2kXmiZPhVZBAlMdDX52MIBf8mmZYfn537cvA/IUDs/18SKnGJidRSsVxtfKqS
	hmqmjDjpk0YMcI0l5enLteu/VS9A1Eg5w4kK9HfjbWR4MEwq6+ErV1fh10UzBZXxpDKURp+N+lr
	hTVdcOO4tAIEfCELA/kSGfW+nouS7dFPUUWexznrrS4dCMYrmw7Ju/5tdDP/FiQulutDFoibTUz
	6ebkbJAH5L8wboxPqZmFyF6cYVAqFj8g7UdlPQPrapUvKwq6v2Pn7mATUI58avPrRq8OQ0Grgiw
	k90IDtFAibZRI8ak/we+l3IswhHfBe4I0DVKs0n7DaNyB05LuU9p5YqD7/kLhEe1aKP4YKEuGXz
	WE+IU=
X-Received: by 2002:ac8:7d09:0:b0:509:bed:db5 with SMTP id d75a77b69052e-50b37518e31mr180228341cf.7.1774345998292;
        Tue, 24 Mar 2026 02:53:18 -0700 (PDT)
X-Received: by 2002:ac8:7d09:0:b0:509:bed:db5 with SMTP id d75a77b69052e-50b37518e31mr180227951cf.7.1774345997739;
        Tue, 24 Mar 2026 02:53:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66a36996b12sm472185a12.25.2026.03.24.02.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:53:16 -0700 (PDT)
Message-ID: <d52be851-401f-4157-8bb8-675744aa484e@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:53:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] drm/msm/adreno: Coredump on GPU/GMU init failures
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-5-fc95b8d9c017@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-5-fc95b8d9c017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zsFNWJzonk0rooF4CBA7ZGF8nAQ4c3na
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c25f0e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3MGHxYdU-HpZmC8ccYkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: zsFNWJzonk0rooF4CBA7ZGF8nAQ4c3na
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3OSBTYWx0ZWRfXwcxPhorI6Gw0
 Awnhb2cCkmzpKGRwzOkorNyErnnchkgZWnJqV5zDvi8ezrFzK6exssfBFrl5LXg+d1v+IPITuOK
 1hlQIHxJPaVH8ZQ19g+sk4jEsti6PZhxi3KlTYwC7Zs4WcEZrol2EE91kg6peFDLYaZFd9xbZnW
 hhh2goh9sqdgvn0Rs+XgUkbMR8+QzSx27G+bM4L2J4aysAi6e7MO2DW3SvgXh61kLSE81EU7wVv
 79NXoON0zZOicwXpHHcHe4wFySR+HiDth8HVYs/wg+TLKit2hfZA92sRIZWlorssJDTIeuAawoS
 P3krecav4OFPdlFO7hozd/TMbJ9CSWiDmrstI/n/eNm/db92GnHNUT+Boiz8KK48O8ty9/VJ6UT
 j6BKVMqvHamQu7u66R5zNDApNj8caUH6APNWat3HrGEzNTPfF93GEpJU7sIJCZyTRjx60pXK8FX
 X8EW1ZbZ7Hs1TVvAVFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99599-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 990303061E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:12 PM, Akhil P Oommen wrote:
> Capture coredump on GPU or GMU errors during initialization to help in
> debugging the issues. To be consistent with the locks while calling
> msm_gpu_crashstate_capture(), call pm_runtime_get(gpu) always with
> msm_gpu->lock.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 1 +
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 7 +++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 2 ++
>  drivers/gpu/drm/msm/msm_gpu.c              | 5 +++--
>  drivers/gpu/drm/msm/msm_gpu.h              | 2 ++
>  5 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 690d3e53e273..6d511dc54e43 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1240,6 +1240,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  	/* On failure, shut down the GMU to leave it in a good state */
>  	if (ret) {
>  		disable_irq(gmu->gmu_irq);
> +		msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL);
>  		a6xx_rpmh_stop(gmu);
>  		pm_runtime_put(gmu->gxpd);
>  		pm_runtime_put(gmu->dev);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 4edfe80c5be7..85b3e1f0e4fa 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -105,6 +105,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
>  	 */
>  	pm_runtime_enable(&pdev->dev);
>  
> +	mutex_lock(&gpu->lock);

guared(mutex)(&gpu->lock) will let you drop the subsequent
jump-to-unlock

Konrad

