Return-Path: <linux-arm-msm+bounces-107550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id d2hIK1uUBWpLYwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:22:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A21153FB76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D1933021EAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B0A39D6E7;
	Thu, 14 May 2026 09:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bc7GwRje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TM9a2plC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6308639B94B
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750550; cv=none; b=j6POqqUutweCbUEFk7LdumEtwl2K/L9AjYe2ng6aU5oZd/KNqsfS8ppskir5wqipxEe2deuRslkZo3DwVZ2E7DOvNPUT4Mhxv5Ilpywj1ndgtAzGr9yr3MKHGzX/cnfNi5ASQW86SZSm1AUzjwKep1HVT0cgMAdL9DKqnfkOFlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750550; c=relaxed/simple;
	bh=8qvCgOo9gFGl9XcfkFEwQQd+gul4avO4zIY395CfJiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoJ7hCVAOX/MtoZz9n+A6Ol7A/KPSbYz0RoASmr9cy8W/3aNMc6blHO5DKp69qbNVSNhHYcPQ85wRCBP5gbxoPQaybFpWV9IyhXvajbgT4vhl2knF3i9Kyxb4u+cJTmHKsoCazwlQsBIk34oWNNtss/0IpNdsnOFVw5nmILFezY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bc7GwRje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TM9a2plC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E982Ni1762759
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0bgWw2JnGIEYuwfsPsRuR3+f
	K6lh7stB/T9o5jqNXgo=; b=bc7GwRjeHKoPPdUJGNHWcPwkKOF69aKvhgyV4nzK
	QP+2BpS5bEIWAl2VfNPlsDFX+wYkg0LFyQ9zZJ279EOwXOxPGHJL4mpyucUNKJeG
	cExfN4oaGBDMvf+l7py2Jx/bCJ3B1qfnABosL5bhaur7KUphJ+0ZrRdEkUrQLTQb
	snFEL1OpF0RJdueD5pnW5t0llugHRyUJhjO5Usfrc3ZNNmVhcprBx8FqX+6lGW9R
	uYTOKa103IwSi6di14CJdbOhLQtISBS80wSYVMBm/OUrdvc3K1k7ucaPciskCI+R
	nAv6VlWJQ9mmepd/hgIg8PhV76nP35YWOdoqOEGRpkh+pQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e554a9c4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:22:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf01172bso34447441cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 02:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778750547; x=1779355347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0bgWw2JnGIEYuwfsPsRuR3+fK6lh7stB/T9o5jqNXgo=;
        b=TM9a2plCkMFLbU8nYLbi0RP+yh1s4r7kejiYVc0U9xPh9AzRN0wAbIFdaeMg2YIekT
         M754Cdub5N31lLcUOS69bd79NJuZxj/i7jG8gpzwlpnwYXmXeiz+ZzlfD2rh4u5KeA48
         UoYNjtT5QANpbcAsNFx+czNET+ib4do4J2v7PGsJ2Aafd1T4cU6UOBElnzOm/zHZC/NJ
         zoagAm+dZZmSHpnBPYSWTm9qssSCDzn9JOShHXhfKpY+C/Vnuw9N/aT4B2ehbN9+NM3F
         GDU7f8ySzfsyXcjmiEWho7vN6LhCOfml0rXf40JCHYi83UjtSytupMmnK0NHqDoKzMUx
         9r9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750547; x=1779355347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bgWw2JnGIEYuwfsPsRuR3+fK6lh7stB/T9o5jqNXgo=;
        b=Kk0OOxZoLizbQB2OLpDT6xyjho4zbjaliD33EZob2F1YzLBzbwJraz8l++TTXx7LAe
         eusQOJ8EWXUBLgI+IprbOoa6C3LWe+yAyM+32+qRhxZUO+7IMcKJ3HNzXx4pnv/Jh9Zh
         xf0yo60mNuGUTJiQLcoW7qwVH5wST9tszY5CBbBC+OzQXvZS/s9xx4jESfUQkDJuTaUc
         FOH+FKZDzeJyGhupC+5sAGScZyTRExmalnOoZizL7GXGC87whchDhLRdo1x55lZaKyJe
         A8k8E7JPdFQgLwPvAp7WCFRgU3A/tlwA6+VBMTynHRhg6t4Ex+i80+vWd0Es8/6e7y63
         De2A==
X-Forwarded-Encrypted: i=1; AFNElJ8IPSBQF9aOPPhTV10OlCrzMI1wnmCUfX6d4B+nNzOyq5CyhKiK7EtXcH46Wi1g9/B/3+TGS2q7bepQrJoy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+PF9tvsqNUFyRVA1o96aZmHWEbbKgTayHcb+9WWYQFGHEToYg
	Ac57uWF655Gczw+tEAM1SL56+Hsg/Wx8Oc9mS1I5LD7LCx0nyDXQzT0rOaKn9SPtdu18+C++cuc
	R4xKY/UuR9ItNbSjzueNRu3IC8aR1W/DXdHQKqHGhoaq3qJ1K3TQjouM3QTWCOUtzFXeb
X-Gm-Gg: Acq92OERznDfhYn1q4PLbcJYL2ZcmW8EQmsPuaAMozB3fUcb2RHAXNliZHG1I4X7Hwp
	B/QcRlLID7YclDp5yjK9pEkTL6HiK2E0KVvkGWUgL7EhuIe+CTKDVxQJZsEFf3Qc4BbEEmM4rio
	m5FgUy3ClfQODR974sEeyxEHQaj6P338im9nvUY6V0xG8BN6V7/tQUyk9w3dW0qx0sGcjsCa4zJ
	4k/lHjeWVfobYqKdjlbnwFLMoW2n69QQtpBRDsSWy4t6nrfUcAB7ZEozTgEg+epopQxuyFvKKDA
	oDqsg5fSEQ0Qm7zRTWGYGEceMKvAQDiemTIwxd5yXWJzXP6fSawuRTCniiaQDEkUC+9kKI6Nb4t
	kw7H6W2WrCWWcTIOvC8Xr/HLfubLL5C7DLSQywHRSTONiYSikW7VVqB2XE8Mt/RbDymn8q2UrNH
	E/Km3yXfRrkEiW5bOf0gGCkTVFhUMU4WJhPi+ltQPmQN/jZw==
X-Received: by 2002:a05:622a:2518:b0:50b:526c:541c with SMTP id d75a77b69052e-5162ff58d84mr87254821cf.50.1778750547467;
        Thu, 14 May 2026 02:22:27 -0700 (PDT)
X-Received: by 2002:a05:622a:2518:b0:50b:526c:541c with SMTP id d75a77b69052e-5162ff58d84mr87254491cf.50.1778750546968;
        Thu, 14 May 2026 02:22:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c944sm363072e87.6.2026.05.14.02.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:22:25 -0700 (PDT)
Date: Thu, 14 May 2026 12:22:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, jens.glathe@oldschoolsolutions.biz,
        linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, johan@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com, Stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: q6apm-dai: Allocate an extra page for PCM
 buffers
Message-ID: <2pe7rk7jhc36osc6i4rxeyw342mvza2m7i4ztsmm6pjgwtlemc@k4gkw5b4jg7g>
References: <20260514090607.2435484-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514090607.2435484-1-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: o5ln8QwuoyJb1dht0TYWjUxxBRrNcPyr
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a059454 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=_Q0duRmiTN8AZcyA_C4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: o5ln8QwuoyJb1dht0TYWjUxxBRrNcPyr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MiBTYWx0ZWRfX6EIM8wiBQZVM
 WqO6QeQmuTKnifNOcwRL73POmEdpv2YjI3rjvhO27SlU+zC1idtVboNGgJJ+beLnOIkAxFl4IbD
 JM/UFXDp7KAiSiuvmyBqFVQO+22Bljd5q9nRuhdNHxz9+K5lF3fq9eWi0GNO4VcYeOD6qI6i4i1
 u3zLed/C30lG87slhKofDifD968HgBEOY7IaBp/moEo5e9I3FbALnmeg7UBduDlDVBAXTNFZgs9
 yd/c9Pubbd2zVDgk/1yiOzjslz8N/usiSLLEyrb3XCFXdj7J/ndwb4OHWZAPSTdlKqUb9HPGbYB
 /Y90VLIeTCAWM6R2aa/wVGGbz8RwaAwdY/aI0qvO+oHL1++3a3CfkUo2T0ZAV1Kzj/qhheaRN6F
 VjxGi7hdmET0iLFye9Nt8xyngl+3NB3NMgpGPzq5C414A2vp6BCeVbI8/CF3zablz0W3XTLUm5U
 IftDddVypqtkuFK1+Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140092
X-Rspamd-Queue-Id: 0A21153FB76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107550-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oldschoolsolutions.biz,vger.kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,packett.cool];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 09:06:07AM +0000, Srinivas Kandagatla wrote:
> Some Old DSP firmware versions use 32-bit address arithmetic and size for
> validating the PCM buffer address range. If a buffer is allocated near
> the top of the 32-bit address space, arithmetic calculations involving
> the end address can overflow and fail checks.

Should we limit the workaround to those platforms only?

> 
> Work around this by increasing the preallocated PCM buffer size by one
> page. The DSP is still passed the usable buffer size, excluding the extra
> page, which prevents the firmware from seeing an end address that crosses
> the 32-bit boundary.
> 
> This was not hit before because PCM buffer allocation and DSP-side
> mapping happened at different points, and the size mapped on the DSP was
> usually nperiods * period_size. Therefore the mapped size was unlikely to
> match the full preallocated buffer size exactly, although the issue was
> still possible. With early buffer mapping on the DSP, the full
> preallocated buffer is mapped during PCM creation, making the failure
> reproducible at boot.
> 
> Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
> Cc: Stable@vger.kernel.org
> Reported-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Closes: https://lore.kernel.org/all/7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz/
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index ede19fdea6e9..3a1be41df096 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -497,7 +497,12 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
>  {
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>  	struct snd_pcm *pcm = rtd->pcm;
> -	int size = BUFFER_BYTES_MAX;
> +	/*
> +	 * Allocate one extra page as a workaround for a DSP bug where 32-bit
> +	 * address arithmetic can overflow when the buffer is placed near the
> +	 * end of the addressable range.
> +	 */
> +	int size = BUFFER_BYTES_MAX + PAGE_SIZE;
>  	int graph_id, ret;
>  	struct snd_pcm_substream *substream;
>  
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

