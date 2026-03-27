Return-Path: <linux-arm-msm+bounces-100282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP6/Gf9sxmmkJwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:41:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4DB3439F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CA5A3043BD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C5E366049;
	Fri, 27 Mar 2026 11:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnCTSFZ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aN11Aq8t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440C372B53
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611343; cv=none; b=kx1HWPupGZL/Xt14HnMF1gOtnvA9oiOfG8/ariVd8HWjbdIIYLoW8Hpf5kVuJUY3mampCgXnytF8KLlOCWdruSGVdLW1yixbMJCVx3Mq62Flf+KZh2486TxpbGbQBIubkDFot81vnh35x1EztjVX4MfKmCFRgT6i7r5UqLUbjC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611343; c=relaxed/simple;
	bh=DyCUbqtppyHawVCYlxiZmA6NJ/eiCPE5Znidx3j35KM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToVmLsX+Vx0+fGiwR1LCXVWhAwyS5Ien1chPs9AX+nwh2TjGc1/1rFzx3PgUt63Om3A0KLnudfYelpk6wFy1lxHugHvxnO1EdyYI9xoBSbUc9AicQC0QTHGSBEFBqxdPURM2l4jF1Dzh8ksAww0vGgBPPZXcFlRS70fSHQaBx90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnCTSFZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aN11Aq8t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wG092538644
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30ZC0GJstGxIxDb7g+6xkWIqpNTdQrufacREKq2etWY=; b=cnCTSFZ8JJcxYv3d
	JGcPi40ja7iPN672yEyDTRr8Gr1FN4QxhFrGT6Irr4tnsDsrOm4hIlnpYiwOuQs5
	Pw7UdLw2PZAkow+2ddHo3/0hITA/zBRLvehrp6x7HCVKXPdPvhIeOPUwYagFbXZK
	KHrMpm0dJR9QzSYkN3KIHbS8y3xA0Q52Dou5aBubyf9qiXx42Jutf329qp7cvg5J
	Ly6l73zdPNAOqQdeC23+6rCITDOpCa4aUoIUeehjYRTKB2wiGI+6Pc48sS9FYNJe
	kDKNr9uhywsz1imwy9Ik86H4T0t6WhQwIfFFcFFtQjSQf2EMBtdf2cazgO5SbLi4
	uwi1SQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5883ks2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:35:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cbcb48003so7292326d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 04:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774611340; x=1775216140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30ZC0GJstGxIxDb7g+6xkWIqpNTdQrufacREKq2etWY=;
        b=aN11Aq8tovt/YAV4LQQRWvnXNMtR7IlLWpR4v/NtcsLZhfQT0eZ1trnCBJdBeL3fku
         Uxv8WoI2HVHljX9io8JX4qLTr/4yXL3AO/JZWbYoyhJHZfaCyZzv9+FycY2uFQT76hYz
         +zd69BWpF6CsUpkh71x5x36FETMVw+/PbxJNKlh5gYL/QIZqGaZwbECEuH1zgLSh0Hwa
         80SeJkRLS8qRvhyOIQpYObKREMEbZzTSV3b6jlGd9yBQTSFvmUvLV9ELkMcR1vgqsao1
         Uixhpplyw1dO2qzB4RiltCqIc3KTv6zVqJFV5FcKvnLgYFZlOL7HKmPkM4sjmbqHcNQk
         XBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611340; x=1775216140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30ZC0GJstGxIxDb7g+6xkWIqpNTdQrufacREKq2etWY=;
        b=res4A8WxJI52Kwehh9s1VgJ77On2S2DGKRPBhq/VmNnS46jc2Xe+4MonHTPqey6KPe
         CM/4aU+u2iMBjcJAlu9eewLIAQKLbaTq8D/8Lt84guvH+kE4AKKY9T0/Woqlx0dh8ibJ
         63ojXeWvH3Ncw6VMA6gcvrqmrO/fy8R2+sPflyBCuBnNA7UGMwGciE5UZ3c4yMBZLfO+
         p1jABIXvmvUfa9hf8cD/8LnDlcW1GOxxjogh7gAcuhUKa79hcSm2b6KsIpq94Lp1b0I1
         ykLz6t6NS8n+rrxK7apdrfFfuXJok6og5lqyAUUPZXEU03kw32jn39LrnhmPMNkUfhct
         S3mw==
X-Gm-Message-State: AOJu0YzCoqUJ4XQpySbG80R3PQBqKBTefz0RqprzMuSy3s/PR9HyelIU
	uy9O1ocOayhZ8d9BbXC/8cXcFswPAGw062X9x1K9dv6D+9uEHrG8nVOpoefbIYx7s0kG1IENR+a
	hIt+eobf9d0W7K6c5NQ/WudZD+GS9HcVbLQmRh4464fj7PKUaxisc4NXj6iqtuJeEXpHK
X-Gm-Gg: ATEYQzzBZ/Z0XIGsd+p/ki94wr2TBYw6/scMw7tNDcpTwUEZDymrouQej6fo733+A9V
	8eZ1anBEcOC+XNt6ho27oLuQZOC12qWAltjkHZ/+qy4GkLqi0Y52MhLbnu9/+y1HW/VbqMU1ZCR
	JOa3O4Tj+5fDE6GgK+XNALohm3NBuHwSe7cO+DRLAdlq20hOPFnE5Oty/YUzHhN1+OTbLvw+LAB
	lO7RfvajwdWcTLuKcWE22E+BoiHuipcyTpN1ASdPfFSK6OyT6iKEEuk0ltfbPriM0iEkGNF0sxG
	iNcJZ+WnQny36xIR7+IkjjcVtmg32lPzyu6XrheqGPCslss1Dcr4DDJ8QOrEqkBjg9RamOlWP9e
	KyBf5VKdkW1bkCvPOq+e/Ny/GJDSUbPvrbQHs5HWtLdklxQ11cT6ABgRi2RkoXYswST1weET6XC
	Si6/4=
X-Received: by 2002:a05:622a:5c0e:b0:509:e68:22cb with SMTP id d75a77b69052e-50ba394ce8cmr19051711cf.5.1774611340615;
        Fri, 27 Mar 2026 04:35:40 -0700 (PDT)
X-Received: by 2002:a05:622a:5c0e:b0:509:e68:22cb with SMTP id d75a77b69052e-50ba394ce8cmr19051501cf.5.1774611340184;
        Fri, 27 Mar 2026 04:35:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6751cc4sm2337139a12.18.2026.03.27.04.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 04:35:38 -0700 (PDT)
Message-ID: <8114a15d-510d-498d-af79-a75493a8fc71@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 12:35:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] drm/msm/adreno: Coredump on GPU/GMU init
 failures
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
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-8-2b53c38d2101@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-8-2b53c38d2101@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2N66KSf1DzKzfpscvnbUoGq77HMR8UBJ
X-Authority-Analysis: v=2.4 cv=bopBxUai c=1 sm=1 tr=0 ts=69c66b8d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wHiI9OMDwfVBJI4OM5sA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 2N66KSf1DzKzfpscvnbUoGq77HMR8UBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4MCBTYWx0ZWRfX9syQANGRpfFG
 UGTZk26DN7vicB8Dsqx4v6M9fy8DhiYAF7/6GbsLg1lKwdEJj1mG16LPsI6SAswVaYXkTCancNQ
 uh45R4WGYtU3VZMQaqlmUKabhfHHyRKMNn+mBOqx/ucHayWbjouzEkKEBwLzaBrRC3W+NmybIfV
 j0qNbU4i81jxGvaZ+09/7Lhu7uiwfn7/TwQwbjqe5sd+1hecZ/GGqtohlGGny0TLMTWJrKdVtQ6
 kDXJc2MZFAsMOMCZUcw6HkJLOQ247rPIFnSCWPXbQz2K5OZhuzJP0JWaIN/PyFEEZ9yOVTrGa6B
 56UC+S8fBYjwHPEeJapgXIPKA0UBz5GJ9PYC0M6JyGaVRUe7MP0AUssr7La583P1wRfxRsM2Mfl
 w9yiwwgP2BLNxbQlYk9PZH+eY4Y4+CZ9SsamxjmXinrl4dCNA2mF9NvW3sWHiL79XRmvij2Dbb1
 EoegO5himRNOIQzaydw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100282-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE4DB3439F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 1:13 AM, Akhil P Oommen wrote:
> Capture coredump on GPU or GMU errors during initialization to help in
> debugging the issues. To be consistent with the locks while calling
> msm_gpu_crashstate_capture(), call pm_runtime_get(gpu) always with
> msm_gpu->lock.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]


> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -391,10 +391,13 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>  		return 0;
>  	case MSM_PARAM_TIMESTAMP:
>  		if (adreno_gpu->funcs->get_timestamp) {
> +			mutex_lock(&gpu->lock);
>  			pm_runtime_get_sync(&gpu->pdev->dev);
> +
>  			*value = adreno_gpu->funcs->get_timestamp(gpu);
> -			pm_runtime_put_autosuspend(&gpu->pdev->dev);
>  
> +			pm_runtime_put_autosuspend(&gpu->pdev->dev);
> +			mutex_unlock(&gpu->lock);

This is something to take care of in a separate patch, but get_sync may
fail and then the read could crash the device (GMU may be off too)

put_autosuspend could theroetically fail too, but perhaps -edontcarethatmuch

Konrad

