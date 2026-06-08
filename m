Return-Path: <linux-arm-msm+bounces-111735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wvf0Klh6JmpkXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:16:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 57838653E86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:16:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SrYht+RA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j1gCiAmX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111735-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111735-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 027DF301E83B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C6D399365;
	Mon,  8 Jun 2026 08:10:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8974395AD1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:10:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906238; cv=none; b=PhdeP/j9EofI53em7P++Inz3CVMl0eBOq836JWKSbt1k543MwD2b5nxSzVvxvl2TrZYjw0SIx3th+SM9F2ermpdZ8HP1vamfn5qhSI3ZHjyIhxSBfzTjGuTYBNfq9Gz31s6dU3EgEp32I5h3JUBMv4b1VQryOHYOZo+XSOI3vyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906238; c=relaxed/simple;
	bh=a2j+IPKlt6ho0v66O/xRJEdBdU1w7w8QYwGnnkMzSZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2HVl2Wwlx0FBpi+5dU6s+ipGAYaDzVtcYuBnvBG4Wno1qYIvMwfqYM4jSOPqA1N9vw7bQJ+mmcWI33zWxvNNApyKUfuI4RcXsM9++OkZxM8nsFCki+oKSuCz44LZtihN5X0tu6WG8nIBLHS9Yb3tWGmDnzPCgtNXO14M6xB2Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SrYht+RA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j1gCiAmX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OuCB2384605
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dwK4nxtWG15SAP6eEf7FAH9IOIg1BXS7vzSJRCfLPlk=; b=SrYht+RAwtYeCCds
	9qFb+I/dB1fJW/qmTzRTbc9GcjNLjfGJeBMpDdeE4viUNkos+R5sqNmTM4VkX+fB
	icn6WgSeTX00Np9DjXMEO52AWQSg+qDIf02IpktMzNUfAWP+4ksBjp6m9HQA5SIQ
	WhTKWZCCiNVhnaihOUZ5vcj0VYNzn1Cg2CQCXF4mwgEoBQjVypMuTpl5MwbN6c2G
	CRf5wvwwDWRc+it00cGwfx7A/AGqeNRATPRQBzpq5LtIuXfTdvNswNyz/RCN2I1R
	gRaIwWVmVAOvyIC8suT3dXMv4Fp1vXH79+uX0bu7ID7NyfZhk97fpErUWgiRCUOO
	zWV65Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1ekrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:10:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157263095fso103825485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780906235; x=1781511035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dwK4nxtWG15SAP6eEf7FAH9IOIg1BXS7vzSJRCfLPlk=;
        b=j1gCiAmXiPoIMml5MLkoCysXXsGAruHpyDZEI8zc/dtgamtLX52mU9D5ijWQgzCG8w
         1hQRSx+X5QlBO8+gJU7KsQQ2b+6KjDCwgnXjyZ32NaZOFoDsCok48gmDyJleZp0G/GUj
         t0RMaxwYKOj9W/R7h7MokLySDQOLvQ/QuuWQwICo9rnUibxd04tJgUIw7GmC28TS2h7Y
         KhPavU2g4dilH/h7NFNG+llUUOd4KCWlO4tthIPEbKEZQduCoBg/XOiajm0X/rGyfEfS
         dCq7kuPnQq75JL7OuVmdSan/FP8qIA++iwx8cp5oXH7uIhMXqPFAHrBcZrJfS/cG8lPE
         SxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906235; x=1781511035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwK4nxtWG15SAP6eEf7FAH9IOIg1BXS7vzSJRCfLPlk=;
        b=BZale40ipVWqJCNK+zURBNNcPAda3N2YSdlLn2mFDl3K3U0BaVto7LNFMuZU/PLHpK
         2U47ScGweS5BVgWhoCXAV7Ko0jxh+yYy+nf5bs+cu7rG03+mn7lwK9WypmVyn0otivkC
         +sOGF1eG7ZMn7AqFGbMsKLKRy6aSntVy/3/PFe2RiWlCEVivsThUBHrn0SIT+tBPgoU9
         ugUhVzwpu7GgYtIGPMCW97icmdE4FPY6Ot/p55WoUofQ8PF9hD/X14jZGyFIYO3NbtWa
         fguTCtZJN5d3nqL2qOGEd6Hrxm4YXF91f7U2CtXHzM0W+hq+L1ampd9s7n/JKaJSndU8
         E1Rg==
X-Gm-Message-State: AOJu0YxVMibZ/GzVJcxZE4x0arYWdfoCY52JorMam6sMOEFHHgOke/SZ
	0UzlUb20KYamOKjJYO0rgkLbTdcuJgkfvT4gu1MGh7JLr2aylqhSilNz9cEQbCTcwvO3A0dSaVh
	YdeF086gP7LpYxkmOD9nVOzEXOmZUANkKALDvtOXwhsGovdDM6SMoqYm0hOPJakzXCVKKcGZJUw
	zW
X-Gm-Gg: Acq92OF9YtxVffBICiSwUX9/iut6sAx2XRkfaOgMB1NWUeRKcRbYuiZDxld8YNLzUdO
	pgOHatKt3ViPkt21kzVrlt1kcaO4E7xVm7RTqtfSEuMI/mUSWDk0VdVzAJlba72XcGXlzIev7yI
	k6EopqaldKRBeWrkJVW4QtG25UVC0ZiMEowLJntxhmxAaugxWBlQ8zQQloe9hk8qGPphkrQD2EA
	8x5uAKCRlnlfKUsRP5DeEDOmvdGHs90/MiIDV0ve4lAW1DEA1U8ne+Kr98eFB7AHxhhw1X3bUeG
	QxFMApK+5nQzK3KiY6Of7FM8gsnVmyACYMjMdwY3mAF/M0zVTiB90/a3zlEnFU84CRYWauLrXWs
	ih870KbojRb046BMSo1NJurC8kbNBgFb8AZVuahCjcTUCH5VglRV7Q/Pw
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr1287257085a.8.1780906235148;
        Mon, 08 Jun 2026 01:10:35 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr1287255785a.8.1780906234714;
        Mon, 08 Jun 2026 01:10:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05208e897sm817000766b.25.2026.06.08.01.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:10:33 -0700 (PDT)
Message-ID: <35449083-8124-4eab-a17d-a9b7854a8bbd@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:10:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Fix stale rpmh votes after suspend
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
 <20260605-assorted-fixes-june-v1-1-2caa04f7287c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605-assorted-fixes-june-v1-1-2caa04f7287c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3NCBTYWx0ZWRfXxvPHCyV/33mh
 W6W+lSk1r/5sKzUwyX9ZYRXlILlxV2F9quvE8utQfHComeYimhIUJcqKzzzjZnnXH3GwQN5j8d1
 1x1XS2pYoBnC7VW6Uv385T0TeRj0UH1OWX9YN5mT+jMgeDl2xxBwQB0KV+F49F4IjjzrXtQlQW6
 XZSQ979kQTtUWiuj/d+MfwJFF1FGGBv4S4fCOL4puqeII/0H5zB9u+3HhVxPPjpr+pt2ZKipYUx
 rysoiXoD7YTVRxlSBou4KSKWsFrij8pQxNB9H7me6Go0kp9zSmp1tPz6mNNxBLFuQOpTYGuBLzt
 PQblWyZlF2yauH7u+Z5zei/byBM4uztIZFZEbJ5kzGXWzEZ6yNRAf1QlRLSiHEV8K95lyhoLZRc
 GrF2PYPtjdASI+YdzNKfEhB3eKqCle4z1BkyAnzU8EW/OOEUcQQFpwa7pNB3GR7jbjLbABKD7NG
 1EW9d+M1RHg7FLNxVQg==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a2678fc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DOYe0rhNWOoO_G-RWt4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KZragiyPaObxGgavMT7UBQzN-8dH5tBS
X-Proofpoint-GUID: KZragiyPaObxGgavMT7UBQzN-8dH5tBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:shivrawa@qti.qualcomm.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-111735-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57838653E86

On 6/4/26 10:08 PM, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> There are stale RPMH votes (BCM votes) observed after GMU suspend. This
> is because the rpmh stop sequences are skipped during gmu suspend. Fix
> this and also move GMU to reset state to avoid any further activity.
> 
> Fixes: f248d5d5159a ("drm/msm/a6xx: Fix PDC sleep sequence")
> Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 2e5d7b53a0c3..a2f6918c4f7f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -642,7 +642,7 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
>  	int ret;
>  	u32 val;
>  
> -	if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
> +	if (!test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
>  		return;

Hiding in plain sight!

>  
>  	if (adreno_is_a840(adreno_gpu))
> @@ -1465,6 +1465,9 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
>  	/* Stop the interrupts and mask the hardware */
>  	a6xx_gmu_irq_disable(gmu);
>  
> +	/* Halt the gmu cm3 core */
> +	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);

I believe this is what kgsl does as well, so:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

