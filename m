Return-Path: <linux-arm-msm+bounces-110975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h3O4H9IsIGrLyAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:32:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E84638165
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:32:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ioiuzigx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TuP5kYQG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110975-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110975-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 023EE31E6D4A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 13:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16692DF13B;
	Wed,  3 Jun 2026 13:21:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3D5357D1E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 13:21:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492913; cv=none; b=h4GlRnZtpW7vNQmOEcEy/kPTOLtJpsvYSc/aqIOoUCzcsmmFZzXj4PasHFikPNmsfk+P2PHJRz4KsmGpzlvkkgjkLzSjNhYBwuZX1/AIgCoV7XRJkWgwL3PIf/TTPcjPBHBxyifmB2sOx+vDRPCczdY7gl+Zih8DSyplubd1vX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492913; c=relaxed/simple;
	bh=Y6ScvDnI3Ddnj5NK+rP4hsBFGEDd5ENJuZLnhmOHh+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsLa5NpbhZpum2luz//snjDXZ/6UMQs4qmDP4lTqCNRKz67ZAh6X8pETG90IfyIZGJyI9zUfAXIPM3AG6fBeQ6ptDLf9I6geIwJjP2ho+KHRZEsYVraLcSEd0cz0tCgPy1z3BisxgB/OBibkfslMby/z/SIMM84nx+rezAtzHb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ioiuzigx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TuP5kYQG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CeBAB2076176
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 13:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MxuYYMI81SIcGX3U1gf3ulIW
	iG9ue60idPNLizmLiPQ=; b=IoiuzigxW8CM4vGBLpgO3QZLoVvS21qDHC3XgjJV
	n2w6KjIQqxUFQuqhpCBt5AzHuHY3Wj66vz9MqEXdsbMPi3w/GS7tVErVmfwSjSnh
	M9ec2cbzedOaOwhvLBb2NaANVfcHboCrXutbxx/coktM7Rr1DVxT7Qg5UtC7Exuj
	fnNBokCUkOitkzv2odN4B14ppGc98IT9SSPf7/aBQpCsGMnLWYVfA9vi5hTAMXQ9
	gE2ikJCwhIzKoNYxfzf3NlqSgKfkr84YUXUwYpWKKpMpZyvfoxD7P+qb5l3gczMA
	i+0zlqWVQGi7M70jU61TOB6dBMeyEfuKRpkHKxacJG/5Pg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev19pss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 13:21:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59ec1fcd5aaso6284648e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 06:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780492911; x=1781097711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MxuYYMI81SIcGX3U1gf3ulIWiG9ue60idPNLizmLiPQ=;
        b=TuP5kYQG1mx10e3FmZbCQNbnVGSqPp+n6r36zCZDEIv3Wb4Md32wtqgMjSdxFNlMkT
         jS9lN0m6Aiey0sGjFZX7aru3mo2TMhGhe4XIEfynGgr4wsM418fUAf0QB3unZ4wzftJi
         PfOSM9Rhb2jzhPRWVMKWtgvi7vVEjYdt/Cn36B001o6/Z3GLvTpg7HCFF8eTqYa4QZ4H
         B/RGNzy90YeVFbQlO4DHWYmCPBQ0O5aJTF0+fqUKmpmW/Re2wHGTuPcA2xOxg1aKLJA3
         PljjnZLfoJEf+KYKsceHC3e7x1HkjtSggd+bNb05QaYcf2bWkeaC76s7aqqSuAU3ApId
         FOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492911; x=1781097711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxuYYMI81SIcGX3U1gf3ulIWiG9ue60idPNLizmLiPQ=;
        b=DikK+/aK3QEs3u4U7AEkXFgTMue7Pb4LxXZAlYZdI3AkZcRwduwvWygH9/PI9oMZzX
         gyWFDcVCPuxhWbTkua5OybhOkKOSwT4Hgmuzswln2gis+pI5ypWyx/v+TrYPg50mWU2H
         d45vKWvbDGoZiElu7IVG74obnLD0iwejvHCeWUnQthuN2tixg2avd2vhAoITUJir+Mv8
         m5XHf4bbkgASO/pMKEKVo8X7acvLlQVtw3c/OW+bWlgJ/drLoaz+/kZFopVgrMHW4Fig
         w/P8/P5yWgNcWYQDtZAJxvslnsLNhoKeenjP5I9Bny4nMgYxEDv7qygi8Hp+RlaW7d30
         tUbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sQ2S32Tms6x0+Fda5VhdohZEY5dXy99CUGIVZ1KDyHY0UbnPnlm4AWKKltAzVfnBBMiOD5C2Z+Ulb2OLF@vger.kernel.org
X-Gm-Message-State: AOJu0YwkgYlerNKh2Iip8T/6lWkIJqI6CJ+8Le5lJupWkKSPxBx4tC2o
	/v2/3YL97d0mQm2qBZ9jmrPOLuiVNqLu1ltlwO7bLjkgDqR2iwl5OD/yDyn+qj+jt/avKdAZU29
	z2gtlUIVotYa8FpuebN7R+etJaZq4rouHvhHJ2WvdCQyAm1gsbiX0y97rll84qG4Z15dn
X-Gm-Gg: Acq92OGarY1400w1rh712iww9k8gftNzlIFeicyvo7yq6V3cXB7IhuzKOa1Ws2qN8th
	8M7oiIDT/vGUMGFXncghUdcr7Z8ueM4n8mTpgUb9uYsIVjJ9XusIWhalxdrO0Koxi9p/fn3VNUo
	21jIK4Hz+zvDkISF/1BD+aAH/6eAjVTZ09uiaCytULvf65SYZEdgpjesqvj1uL16BqIgoSKjj0W
	9absXP51sFlM4/KkrgGaH6gaQWrlZi6BveQldqgpoagsxyxqyQ/p6wY42AnuDPCI09+Z/Blm2Xf
	2/8UHiMWEgqX2fY1snt3Gskobx9wYlap7fq3NbtZmcRwAGTwksUAOifphRZuYzostejERqANmN6
	UNmQgyYYSfdTGBl47iaH4YXx8YKPB7XxX6CvJaJ9izlKpL+sc8jJn5qMyC0K4qjr8DwzYUfxmy9
	/rzoPcFMSCexojVXvi4PqNYnsUVOblCA8zUWZQh+vmnMUWDQ==
X-Received: by 2002:a05:6122:311c:b0:5a0:c38e:6199 with SMTP id 71dfb90a1353d-5a6e3f99f4emr2032531e0c.1.1780492910756;
        Wed, 03 Jun 2026 06:21:50 -0700 (PDT)
X-Received: by 2002:a05:6122:311c:b0:5a0:c38e:6199 with SMTP id 71dfb90a1353d-5a6e3f99f4emr2032496e0c.1.1780492910316;
        Wed, 03 Jun 2026 06:21:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b0f5sm651785e87.41.2026.06.03.06.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:21:49 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:21:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] media: iris: Fix FPS calculation and VPP FW overhead
Message-ID: <mzjjwa3yhp4v67eyxopgnlsn5ujvhjrvlshk6q7gw4tx7cqe5e@cmbppnfbtxvw>
References: <20260602-fixbranch-v1-1-b8eccaad6d17@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-fixbranch-v1-1-b8eccaad6d17@kernel.org>
X-Proofpoint-ORIG-GUID: E7ZI6vapH6ZIqL1Bi-ldj1e87-4Qzwoi
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a202a6f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=2PWsFjt7Tze8jpAMuKUA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: E7ZI6vapH6ZIqL1Bi-ldj1e87-4Qzwoi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNyBTYWx0ZWRfXw+yRt/RrGig2
 KdZQg3yj0gj8ntnbJbyPyPuqq00ifUnZnduDfdTNJTM91RjAM0sCFjV5g7qy6JD9Urmj/i+B4cJ
 LRp+yTja+jcehvfPRStdnVe0EK+WRKin3GMeOCpE7DwsOcVpSVSh1s5xVzlhDqkJvibVGmKUGV0
 bYc863RZjpOPKk2cdQ+Lo8RUyYK/qiTrtmaHsNkkkNvVHkZmgUctUtQF+G58/x1Hg6vKB6lx3yS
 JnqTH7bPq0SFIa3AHcb0JoYOfBjpxgsUuMkC0HqWHaySPDZauLgAaXvtiqsW3cFFsAXKbHY9f7Z
 UYFYY6dp5mbF5rWfTTPsV2xXRF2zcNzhFQ98rChoIBYKlUHZEcsb77i2Qpy8YHUfG0KbLj2jzBd
 S/sL/Sp3veaUYCk3KcV4GpgEf9FlcZyGd8/qxrGVL0p2ivsXzLRP+ebfoY9g6I2IkUE7vtan9U2
 q9rxjBlmfZeigj5OOHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110975-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,intel.com:email,cmbppnfbtxvw:mid];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00E84638165

On Tue, Jun 02, 2026 at 10:01:24PM +0100, Bryan O'Donoghue wrote:
> Use div_u64() instead of mult_fract as u64 operator division fails on 32 bit
> systems which don't link against libgcc.
> 
> Fixes: 5c66647a5c3e ("media: iris: add FPS calculation and VPP FW overhead in frequency formula")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606030132.qnBXVDkM-lkp@intel.com/
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
> Quick fix for u32 bit division error in -next.
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 5a85568c5ee1c..37dbfe433a085 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -444,7 +444,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
>  
>  	/* 1.05 is VPP FW overhead */
>  	if (inst->fw_caps[STAGE].value == STAGE_2)
> -		vpp_cycles += mult_frac(vpp_cycles, 5, 100);
> +		vpp_cycles += div_u64(vpp_cycles * 5, 100);


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

