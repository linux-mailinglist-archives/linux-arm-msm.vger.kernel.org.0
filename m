Return-Path: <linux-arm-msm+bounces-96681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNRfAzYrsGl7gwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:31:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 118A425202D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B98F3314B240
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535592D0C94;
	Tue, 10 Mar 2026 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QrP/9SSr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iO/1tVWp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098082C11E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149827; cv=none; b=OKiHACL3meporp6S1F40A2mGljF55DQx6oUVrTg4rHoqIc8pJCG7LovIpEMxVLCJbw3W+FT6TE95Og7MsabHCjCKSF8c4OqQdwTJll9W4Q2B1mM3pCDoW8TRO7xljWTTY4dFcHI0o47+vnov5ymNRGfEFSyO63dgfVveRtrBqUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149827; c=relaxed/simple;
	bh=iFo7bPzHTVxaMKCgXFBoFZBkHbY93yDnRVkkcd8lFA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tqh5mP3TCnPGNGmvxH7acG570wEfYU6LFp4Rjz7T88ACEEmBgBlCj2KhuMtpDI5VCUNk4xf+C0duOhxPHPeAoGfqFHWz/b691sViEXT/JEhikqSCHbR9HGN7UHbSeoRZHhUEf7dEvuA6+MT8lAvyuMdwwieqq0DENkDJuK1hwLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QrP/9SSr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iO/1tVWp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACb63D026003
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eWrYjpoYXr7aa9apS4493yuP
	iU3SM0m8EnyypB5PrUE=; b=QrP/9SSruMSlU4CuYP28Dj2/nBmWBs6znud0/puG
	6VHAqW+ya6WfD41jQS8bfTrSH1j3GE+cXMd3s3Se1/JgbOYuhbuF/VpZ40qgtFUw
	Pq+2FRcl0WR94ieXcPeatKl6Keo5vapzqDpNzKAKwBHdKxGJlNJMl0ADi1XM0YYS
	tbZ6dqxnB7vwHRvfFEUGXgHUidHTDbzN66LOW+CFTEw7bwecrC9m6DeIbLZ4u+j5
	YCxoYhnZtUVPUru1U5Nsh93UvVZtg0h5c0P4C5h/yEA7q6cbjBsLlYLQ1rowFlCx
	QoZOSYQ1HcnvEhmdzZ4vZblk8SdLZBU5eBRHY/Uw9wj1IQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5nh3e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:37:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd80c4965aso839296085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149824; x=1773754624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eWrYjpoYXr7aa9apS4493yuPiU3SM0m8EnyypB5PrUE=;
        b=iO/1tVWp2pur5vvmFinnqSDHjTs2dynSWR/GPCoaBTnzxaIoWlvK6R+J1KLyyCHxQg
         75hms8wYG4zI+ypn3cVOYhn5QTqrPs9N4h96QZTvyd5bzB4Ks+Joo+BhOtPNZozqT1mO
         uUsFedFyDqMJAn6ti3SdD5jJrc5LUztRcELMRa3lLXJo5Ip7o3onimucpYBCvvNKWTbw
         twHMaY0eqF+aDB1MgXOxGJuLCbGd5cHobv0Z1tT2NxObh5a7K9xog+/rhRlG68TKnFTI
         +sGqjKqnjaApk4bLovTuAMHJWDUQN3ADkC4Bqn0I+hfACo64q6zo1Omq4Ot+5i+63ARW
         2VFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149824; x=1773754624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWrYjpoYXr7aa9apS4493yuPiU3SM0m8EnyypB5PrUE=;
        b=RDRiceyzNlrh9RUAr02z5KmY5DkuO8cObS5iGkTs3C9D0dgI4srl/O6wGkJQeLkvWi
         9E+6enHOD0PxIwYyM6HGbZQH0KvsGJ7MKVQGy2KaWQFBoaWgq1VI7H+cmwK6stN1Q2CQ
         gDm+QpE1OWj+jNz3oYEFjvZwnNpIsLMrOCfbFq+AdYb2w+AonwBR3C2JZw/hkdSqDK9E
         sGNVHotEfoO6khdoA1J+jMahSlVr7h7iTl2QvqeqDsOqxqKIIr9sJDNoa8iMsanBai0h
         Vw8FARjZQUcGxJ3abn3Q6vdkSuo7HhIZ7F1dBMAXjSBSVGBdjJytm5mFYcSEO6szjwqa
         3epg==
X-Forwarded-Encrypted: i=1; AJvYcCVZJUD57Q4NNsDeMdkPnVWkF/8hhrNMijevE8YnAsnCnbdsToNhk0FJ9FaGkLTDwAZ2Fn8leVecwVvm4j3v@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ypufA/htOLgkS9/lOV4RWCwAhA4zKChNFI0U4xJIrKvB4BPx
	Bv3eXm9WCxL0Bw6RiqEAoDrlGNYVRNZLvn3mWZJlMPxNFB05+373Opg8S8OP+1hSGYwyJf0MNEd
	AVrhuUhMLlgd8C3AFGy3R71KhuzJU5JiQTPu5DRYK+2aDYXSkWT2zx5CqLBmP2+q99Xw6iKTeoS
	7W
X-Gm-Gg: ATEYQzzRZgrFQI99F8p+jorzVB3vSYSXMVlyhQ2TBJAhm6TmPmgYhV52e4hXwoxjXB+
	QDtZitOn296LPWfdf/VyexHtGEGrvGO4T/F95pfJFYBmow5ZYUpMpeB/Xi8vuLZ6udgm9KLn4CM
	NYVnndpCIh1yEQSgu0Orpn/irFlf/CXfWGHz4RF706MuXPUax0GSmTO+TymEC7ZSUFl+QiT2Ahn
	yJRiGD6myI+ZCkQ5NMBwcRm9Kc+VD4paarjXgRjnEJyoGFkLqSjwGm5Fgqixw2KA/8CWrlTcwOf
	86PsJ9EEnGbIN1Wua9bDnL9j3Dk5LICkt+JM2H7ZEo/iDrntqAoJp1o49FP0SiaX7ZO59Wpe87o
	DKLp5/j4XxzTFz2bPK8JuIAlRK67jPycIlv0ls4w4uf3jIgtRvv4ejFYIYEFZfnfqLEjxrQjx87
	kw9IGBOKmyj6HQAS7D552CBUtKbU53y2P0iIM=
X-Received: by 2002:a05:620a:220e:b0:8cd:94f9:1bbb with SMTP id af79cd13be357-8cd94f93cdamr213043085a.29.1773149824180;
        Tue, 10 Mar 2026 06:37:04 -0700 (PDT)
X-Received: by 2002:a05:620a:220e:b0:8cd:94f9:1bbb with SMTP id af79cd13be357-8cd94f93cdamr213039185a.29.1773149823645;
        Tue, 10 Mar 2026 06:37:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d737sm2781938e87.88.2026.03.10.06.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:37:02 -0700 (PDT)
Date: Tue, 10 Mar 2026 15:37:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/mdss: Add a TODO for better managing the MDSS
 clock power state
Message-ID: <rn3jeugxuyrm6iihsmivzrw5iuhgtleby3eir7kmfvmdwi2dyt@pueuga2tx72u>
References: <20260310-topic-mdss_power_todo-v1-1-59457b8b7486@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-topic-mdss_power_todo-v1-1-59457b8b7486@oss.qualcomm.com>
X-Proofpoint-GUID: 9SY-O4AaNnj6HNfdIznJ7qGZoVRy-wPo
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69b01e81 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fNJ4iHBr628apSTVAaYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 9SY-O4AaNnj6HNfdIznJ7qGZoVRy-wPo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExOCBTYWx0ZWRfX0kRETekhT4nT
 ukw5EH792Y/mka8eep58ReU7CdbXs/JRI8RG7gZQQHAuO5K3n8R84SkJkk+dYUiCRf9KIJBnQPv
 DnimvCqxNPT5d6lKN2gv1DoIUemTBxSKS1pi7EOn/vG0ww/S6lCo+oPPcOhAVe18laea71wmKwg
 FiC50JVrcUxUDc6gg6CvLkh8Dkzfpn1Yd9kBC093KHiaS4weqIvgX42VpZ93wt76sHkzw50ll1J
 7A6aQfPsLni0q1P4ZQL56LUV1oqvOV2RtloHA2+uhG/mGVQIKPF1UeAV+c85Ksz3LkwMTne5dFC
 MBv882P6qRZffS9gtzT/9lRts0mPYhRsv7KsDcYeA7mCb8HV5Ch5He2Lpo4MV5uBEnnOb2+SECA
 y92d1ScxRo/19NJzMb0bkvnnYr5y/lPQLzzr+DtUCW8i2ORXh9EVgb1tPLy56bnCI4kuBnFGG8w
 pWQyryqxqBdeOwprxrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100118
X-Rspamd-Queue-Id: 118A425202D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96681-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 02:20:25PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There's a small window where the MDP clock could be set to a high rate
> (say, from the bootloader) without a corresponding RPM(H)PD vote to
> back it up. This is normally not an issue, but could be, if rmmod fails
> to shut down the display driver cleanly, and the module is inserted
> again, or when the providers' .sync_state has timed out.
> 
> Mark a TODO to fix it one day. Linking the relevant discussion below.
> 
> Link: https://lore.kernel.org/linux-arm-msm/d5c4eed5-bd87-4156-b178-2d78140ec8a9@oss.qualcomm.com/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 9047e8d9ee89..b783dfec83b8 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -262,6 +262,14 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>  	icc_set_bw(msm_mdss->reg_bus_path, 0,
>  		   msm_mdss->reg_bus_bw);
>  
> +	/*
> +	 * TODO:
> +	 * Previous users (e.g. the bootloader) may have left this clock at a high rate, which
> +	 * would remain set, as prepare_enable() doesn't reprogram it. This theoretically poses a
> +	 * risk of brownout, but realistically this path is almost exclusively excercised after the
> +	 * correct OPP has been set in one of the MDPn or DPU drivers, or during initial probe,
> +	 * before the RPM(H)PD sync_state is done.
> +	 */

I'd have preferred if it was not exercising 100-char limit, but there is
no reason to enforce that.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
>  	if (ret) {
>  		dev_err(msm_mdss->dev, "clock enable failed, ret:%d\n", ret);
> 
> ---
> base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
> change-id: 20260310-topic-mdss_power_todo-4a19cf5f5183
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

