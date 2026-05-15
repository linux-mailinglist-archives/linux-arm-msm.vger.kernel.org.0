Return-Path: <linux-arm-msm+bounces-107925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFuJGPwiB2rasAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:43:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DA6550A50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C7B9306AD7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D103E6DF5;
	Fri, 15 May 2026 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwMpC3a5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SAHedOo3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034E73C8C77
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852006; cv=none; b=PQ3wwUR57/IdGPbHFt4+Pfx7BcgosGubWIg5Dqxp/csA9/3ZTFmAcxxpYeIiU0sMerYXZwULIil7p7D6adKMUwP7A6gYLmh8NCaF/EMXxPuQ6vT4rGiDcZatGqIDLNLYHqB/VxvMDF3mwiIeZD7q6WwepAEKlpyrkXqsMEtG7hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852006; c=relaxed/simple;
	bh=nfSCTdRlAjlZVDOsrJa3RlVJur1Fst99NvyD5YS+Wcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvvGLcdj7UfQalvD6/yJJoj6h/eqen1+edq0Vc2975/YulZHY1CC45k769jlss4eS1swv79HIrbUNywz0PWqPCD8y3k6WXaHNN4TEaoRhKbuDvY8A0XcSMU93k06InKL+gkIT/CcmjTkNN510HbDkO2Mjoo2Bur+unS1/oWjFJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwMpC3a5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAHedOo3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBkKeN3197820
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m0xOM7VOPQoZujb+gaqC0lLv
	yQgX/qpmVlsX/RoLGUc=; b=iwMpC3a5P/TYNs9rw5RwFNGJz/dUeiw+0w1FFu27
	PLnfQmZ9KEj0swU1FCuwEOkD/uCYYXobwndRyv9pYrQVXuloGmeboLoSZGQ9fMJN
	27wmdBwyHnSuCFlxuULIHWRaBtLxbsEc+RM2XwpdL9GsRHPeswevzbqXX2t7nBq3
	8Ivyb7BWBSti4R+qZA8+JhSNCqxHahN2Zz8fhXDwkw3gXwqEvoKH1nm6Jy8coKWq
	CqHyzhMU3wLYWVr2y10swiYYsV0PwdgukiCG6LjbfEY9hV5FzreV+PaCefRttGp4
	1R9d3vnJ1XcBX5PoJayopAUAzC9tsHummuYlK/sZOPuefA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qbejr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:33:20 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4398773e510so6468998fac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778852000; x=1779456800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m0xOM7VOPQoZujb+gaqC0lLvyQgX/qpmVlsX/RoLGUc=;
        b=SAHedOo31GE7wPO4WAxDX8cuBx/wGuc1XT0tLwyT8GxzeT5GF92v0tOboLyaCdN8Dc
         sp67Ko/830P6Ss3zY+nvuGageGLBZf5V7sSZB2uw3ccY2UfepmTHDbwBAIDb1INUuU/u
         qyxBzsARa04UEwQ0+J/V1AWSzTpE3j+PUpFYWLy3Xlt0uKJ3o43qKVlQmj1pw4aSa7L6
         bHlPBH5Wi0h4GDqzkLaJ9L9E8FTY+SVG/T4HIjYOScIT4wZpIR0BTvkIAXAyA8R3Nqkv
         FMf8BtWfMok7UrVNCrGWgwrtvWnHpZdyaPGz3bBCcbivUnMo/GOCwfHVBQzBDPEgGtgj
         mUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778852000; x=1779456800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0xOM7VOPQoZujb+gaqC0lLvyQgX/qpmVlsX/RoLGUc=;
        b=jJ3rpTWvvYYy63BqzCNzHOdb90DMJb0inMjN77fGxiZjCqwJv54Z8+Ak7PEofbghBw
         K2vsgNjyxOnspxumbTNtjYcdJklUWF2sCUpKTS5c2cFcboi8Iot0s1j4RvSZNQodA7hg
         jeFQT6HKMS1eVLTRc/fVfmKppeOdOcCHOQ+60u+5H0iIgWlFPBQkcgnpvSFxXtPFNoa6
         mSDKPOOy41x0K/fSlGrlxuwDfo50fcAwqpzdly/0W6A+3Z9J7gwPEsaALByQLBOv8+Ww
         caOrN3wf3Nfoi0WtZ0BMbaer0IhdnjeDkXzXfd0P/7h/JwDCesvqjFKuxd5MHpBEXXsi
         4Mrw==
X-Forwarded-Encrypted: i=1; AFNElJ/nP9qhgeArZP3MBzN14ALtp0cGaEyVdUIJ4B8D5DpUpHJU+9jjQ6DYvriNKEgDhaiI+7YYTKvaUJ0nb+oh@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+NRmwkA8t9p1i+R655KzwWyAdGCcOqI9o4YjjH6JJ0gE21Qd
	DWpXxQJtXy8075lGvmHGwu2YOEAkId302MPlhg2fZ0hIAo5HvzUWAb8iru+5j/ePymUhu/8GdCH
	lxghd7T2xySBt0FPtUHGs5RlWakhWLor02iocIz9dE5x/4cqcO9pyVenWjtnhn0tyGyZu
X-Gm-Gg: Acq92OHZOBopN9ZdAHFq0koUP/5tCTxpZmALOlaw/LuWsiOXPoSUQ0l2X0ZbxqkxO9H
	bQfxGue4+JuTsV80+/4rsJZnN4pLbpNaz/X31qQ9ZrECAOXBnZFITYXzl8ck/US67NZd2vZxh39
	Q6MpqylObURfW+P1i+/kcyVVf0PJtXUG7TRw2aOdbih6Nn85SnSm8QqwhwOHdlCl3CrtFojLRbP
	noRQDGt0L2VHF9F+BJncyjOikCU8mulw8w1GcKpR9V65Kwyz7Md3MgtCZZPt7AK2XO7f5qun4N7
	GWes7QL04pXxjBLPKFgi/OFvzdQ0c6Jba3QauQEGxrEkN7lEMH7/99uxOitJzZpoun/yUAO4JgE
	Z5XQsZtDFe5zOAAfIsOIqAnmjpzWKO2lTofZR9XPBjlYpJ3nDKTq4blM8o0PWciSGtEiwzQ4dJR
	GdXvhef76L/YF+ObgrFEn2PHyfXSFEG6umLP8=
X-Received: by 2002:a05:6820:616:b0:694:21fa:4ef2 with SMTP id 006d021491bc7-69c9bfaded0mr2413845eaf.43.1778852000293;
        Fri, 15 May 2026 06:33:20 -0700 (PDT)
X-Received: by 2002:a05:6820:616:b0:694:21fa:4ef2 with SMTP id 006d021491bc7-69c9bfaded0mr2413810eaf.43.1778851999809;
        Fri, 15 May 2026 06:33:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11ad33sm1350151e87.33.2026.05.15.06.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:33:18 -0700 (PDT)
Date: Fri, 15 May 2026 16:33:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: Re: [PATCH v5 1/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
Message-ID: <almtuwpdab6oc44zljo333iv6iels24j27ucuiwsojkfc56zmt@xrbj6baxc46b>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-2-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515124217.20723-2-jianping.li@oss.qualcomm.com>
X-Proofpoint-GUID: 76ckCjRxQ157tXnETo73aG2iUzeMZJqh
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a0720a1 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=tbY2IoXn8WmGO_B21IcA:9 a=CjuIK1q_8ugA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzNyBTYWx0ZWRfXyN6fORdY7Jd8
 5RteIYWdK00k2aLbFo+YrdY9051uHqNod3fGJdayZRKDzpp6OZ4k8eg8stBPVGUv+/UpPpd5v5O
 GcwxyibVEPyIYwShfQrwJFGeUSkasQxwa5p2DelK3aTOT80v7AfuleBL4qA0FFbTLrX8ei4hrly
 icnYcUz39WpKqlp2HFCaqbs+2+ns/+spx/+uyCm1vh1eU163f6wpIpOnUU9ilfp9eURjJwvfxVm
 Up+TPWlmDuYsb8PqlKL2Kd5J62xnbLB+OATlnImrhgFFJSEA/LE0VLDl2mP6UjzOf8fkpobXnO3
 UPI3bYKX/9Sz0MGszS2NUWJwyjwpCUMVcU5hs+Bqix/hb+gH3neVwSIaoXbucowFuXfa/nN/qVu
 8/h46A4mP16p4UBYT7TKFpZZKSYgf1j4JSQrLesRerT9RRhRh6VmZ6AKcm1yhZOPTDmFqrmSwCu
 TtwvVlldOcPcShIYipg==
X-Proofpoint-ORIG-GUID: 76ckCjRxQ157tXnETo73aG2iUzeMZJqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150137
X-Rspamd-Queue-Id: 00DA6550A50
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107925-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 08:42:13PM +0800, Jianping Li wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> The initial buffer allocated for the Audio PD memory pool is never added
> to the pool because pageslen is set to 0. As a result, the buffer is not
> registered with Audio PD and is never used, causing a memory leak. Audio
> PD immediately falls back to allocating memory from the remote heap since
> the pool starts out empty.
> 
> Fix this by setting pageslen to 1 so that the initially allocated buffer
> is correctly registered and becomes part of the Audio PD memory pool.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

If it's From:Ekansh, it can't be CDB: Ekansh. How can Ekansh co-develop
the patch with himself?

> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1080f9acf70a..8b21f85cd9f4 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1324,7 +1324,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  		err = PTR_ERR(name);
>  		goto err;
>  	}
> -
> +	inbuf.client_id = fl->client_id;
> +	inbuf.namelen = init.namelen;
> +	inbuf.pageslen = 0;
>  	if (!fl->cctx->remote_heap) {
>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>  						&fl->cctx->remote_heap);
> @@ -1347,12 +1349,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  				goto err_map;
>  			}
>  			scm_done = true;
> +			inbuf.pageslen = 1;
>  		}
>  	}
>  
> -	inbuf.client_id = fl->client_id;
> -	inbuf.namelen = init.namelen;
> -	inbuf.pageslen = 0;
>  	fl->pd = USER_PD;
>  
>  	args[0].ptr = (u64)(uintptr_t)&inbuf;
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

