Return-Path: <linux-arm-msm+bounces-78957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8697C0E8AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E9FA4FBBB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD042C21D6;
	Mon, 27 Oct 2025 14:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUUKXjTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F13830DEBF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761575951; cv=none; b=bH8UPpr9zoZEUbodG3zPSHp4RVxf9GDAoR6UD1PV6If0Z55rr1LDZBVf3Nr3MHNH5zP04DNS4EbfW7ayFEfM5ZWpeaUN2rj2J5T/80Ednd+I5rodvJaqIMwbQKZsm0l8+EMDGtXEUF4Dd7Wr08O8J5OyBUN1rNtmIGd+HPGj7Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761575951; c=relaxed/simple;
	bh=47HzZofMxL0ovAwgF2N0WwWZU4d7Fcqxln3pLvlcFrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQj/TMtSbY/FBTyFtTZlw+rDwEkoYZnL8ah+MpUNnhGA4+3C1A3yyseoxniPC9M5/nJPG0b4zU3BqyjCjE/rA9Pkxnph0mclW9RwdVfDOJYjv5SRyJvVmc8Wete5Kyzy6hETYiFBB5iVi0asen9px40RGh6bcJLRxxISql/SldU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUUKXjTp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8sVcb1090823
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aYCptxushuK85zBtS4ghGUMa
	UfbytrxnOA8EMRRHrZY=; b=UUUKXjTpHCKASlEf0rB5/nCagNQ/5xVg9fGr+oWR
	veStfZsybImG24joodx6e9Ax3C842i0HTslBXrUIkZu7+clFwnfeiuRv2LKIL0tj
	g2kt/2jJ9Que83VTHP10ve/RKnAG8+sMC/g+Hkn4vEhDiWKcbImHukQkelyt6a4E
	pKDmLwpqPkMybRiOq/rJkWvRRY4iK+GVydD543mova5ikhDcuKWXrB7pF6dqYfqn
	rbCwfRJ9Tu7qc5wA0fcVbm4FlblkcEJIx3qLFvAyKobBXtA43zky95lzTNx7azb9
	yhpP3OHVWlA2yNooWa8uvskQTf1LQmPjmsiomSUoSXG6rA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a1ud1tcef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:39:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e894937010so130932571cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 07:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761575947; x=1762180747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYCptxushuK85zBtS4ghGUMaUfbytrxnOA8EMRRHrZY=;
        b=nfJtmVSet8qNt9CWilaHApVpQdC6ZkEV6cy8g0xTNHmvrezT4Cy1pMgg6uc3EiXHMC
         0GU2ANYmUHAOtnUu8naaKRhjPn2G+PIC02z6fRRnGwLyNyi0KJ51ab50HZ0NcBlpZ5iu
         cfMNY2NbG4DOZWOV03fqA1eNDEpW9AhGsoc8ZXC+/N+EnrqUUGPOcGLJNfONCnfIgpfN
         v4DYWk/Wg0vOXMz0ScK9f7g0mdVUQ6iKlrWe/LvOEku+RvZG1CugTLFymzeU9DgfODm+
         Qtrq/qDFH4K9RlglfoyY+h9/94wVSN8C++jAjAd14bdHG9qi4oZ4+HQ2FL96Dl8EOq+A
         GcWg==
X-Forwarded-Encrypted: i=1; AJvYcCWXm7EQcZ7dH+68B5xDIo/5s3DieQOtt3BkDip8w0/dCmBmoCWlGmYpLAsQgtKda841sERqwh+HWeXCwDo6@vger.kernel.org
X-Gm-Message-State: AOJu0YzU5EjiN+QW8NtcSShbywDa0nLXjI5ztFU1/juJh0MuzVKKCjdj
	gQZLPgY/O9Q50hsKtbvBICGSXkgRy6eOLtcPomP8RaPxGUKxAI3LpKluBhXaQSw+rLOqoIQH1g3
	jvV4ckW2VhPtIkf5wlABDCXFs7VQLFEPYvcJcAZnAPNGkMYPwsiR/fOEMt2kw+TVhPuu5
X-Gm-Gg: ASbGncuLmic5P23Svjf+MAI17FTKnypt61uF7hIXwe3L6LDdZ36xYbOAiaLmwe1J86o
	8+g+ID21vyupDs7WzTlJelB4vflPTCMVJHE3NCinkUBSiBn3eXdXpYAn3k+X7hYYuBfKRW+IVsf
	vKzFi2NWjiPesecsfj+6TGX84uOElAOixh8ROhVPpYsm6CKyAIbYSubMDtwhGiuSkcPSjVvjAsw
	4l6x/hhtGXCb6+Wq4FCT2pkaSIhE3BstjY8ThsxN5K65Jq/GFXTYyUrqeb6l1eAXKlRSC3wyJM0
	mbxzkh35vgg5nVoKBxxLWSNb743XbC1AsNnajUSJzNLsxkNpu3wJ7wNp5eoxuxCJQyHvUP2UhM+
	zI7xk5YArgXYezq8vN+/AQ6/sp7rv92CXV05ktLcdba17eGGR9zDAHC+38x+iMcdx0LzrySilv/
	29FG08DCB16JYB
X-Received: by 2002:a05:622a:210:b0:4e8:b739:6b5d with SMTP id d75a77b69052e-4ed075af157mr2499751cf.46.1761575946958;
        Mon, 27 Oct 2025 07:39:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE25V05R9DFD8UMFppmwdaHhnps1+EhW4/tRntEoJQnX+uPBq3zljmulhRuh9PeNVhTxFxKCA==
X-Received: by 2002:a05:622a:210:b0:4e8:b739:6b5d with SMTP id d75a77b69052e-4ed075af157mr2499321cf.46.1761575946421;
        Mon, 27 Oct 2025 07:39:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41cddsm2320354e87.17.2025.10.27.07.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:39:05 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:39:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] slimbus: ngd: Fix reference count leak in
 qcom_slim_ngd_notify_slaves
Message-ID: <ke5p44nthtwvmptp374xtkkc7giwvnxwheyx4ohz6fugdwinta@w5timotaxhkq>
References: <20251027060601.33228-1-linmq006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027060601.33228-1-linmq006@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEzNiBTYWx0ZWRfX/pXjH9JEUtFI
 JoZ6ovcY8t4XtntVBwAopUuvbPf4AUq2x3n0v4QV3wCyoRy0d7frbVh5lIT5dIqBvwYrH/qz0P0
 fP9Wx5+V2cBKMV6fWrm9g92ybs8fKGeSbkC/hs/Cb2XxAcJvh+GSD6gh+jZ3CEqa/te3csi0Wip
 ixDDi4KyXA5w3WxB+mfYelsS/uOPITne3ml7D+20vORcXYzdLsKTasHexNKqx7bY8X1MzjcJHU9
 764o4JPrFhnhxZRLbG7XAdfSGAyPkAsXal1jTQNM1jGjsn4PUctcHqfyWMjZEXvxdvuCHxXNt7u
 K67mKzjWeO3CjKwcriBXjrhEpc2xsoT3NA7eeUCvPAs3YOifcVJPS8vmX/A++pyG3DzDe50lb0e
 1jVVYV7UYfCyb3fWgVHi0fm6wsRVDw==
X-Proofpoint-GUID: rXEH8NoRQc4kC5x55uUcN-bMDDMhqjOF
X-Proofpoint-ORIG-GUID: rXEH8NoRQc4kC5x55uUcN-bMDDMhqjOF
X-Authority-Analysis: v=2.4 cv=UqNu9uwB c=1 sm=1 tr=0 ts=68ff840b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Y9G3A3km2bKrLaHVutgA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270136

On Mon, Oct 27, 2025 at 02:06:01PM +0800, Miaoqian Lin wrote:
> The function qcom_slim_ngd_notify_slaves() calls of_slim_get_device() which
> internally uses device_find_child() to obtain a device reference.
> According to the device_find_child() documentation,
> the caller must drop the reference with put_device() after use.
> 
> Found via static analysis and this is similar to commit 4e65bda8273c
> ("ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()")
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

