Return-Path: <linux-arm-msm+bounces-108122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL4zF2LKCmqf8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:14:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 635D056880B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48251300F275
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED823D330E;
	Mon, 18 May 2026 08:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="an5bPjxh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fDnOkG5h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D72B3054EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091498; cv=none; b=Yx4FN8DfoaAyybaEf0dfnxaE7B9vXf3C1EFuNtoISZ+QPlqMa5H/GV8q9Rrlhh75Fk7SKzfN12hqPcfoOgcWxut5RJvKhtrw0T7tovg7yBCynex9ru4pgY2pYWwe4gjGkY5Ci4dsm/GqFuHZ/dSjufMhyqhn5CHdVM2kWh2TkCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091498; c=relaxed/simple;
	bh=gBipkm12xNP0wibk+GNikr81PqPfshJIl/JWFX4BfiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9jcuFR8PB5R0xi9L6YQAjK2mmXskpuXV9DmYxTn/dlf+C18tqHYRK0YCjLOAXZJVMcvnYFcYc6e9xoZbt2QR9IpC1rVEFIrhBzqe7akH/vCazh/unnsYjpnhtD0lk8BeECBSuaisjOT4nYiG8e9D9knj95+TjUhsP1UmnJ1N1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=an5bPjxh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fDnOkG5h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I25tFL2343774
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZewacJ3i9lKnkmzTTca31dtk4aGbjL3egDzG8Fs6hJM=; b=an5bPjxh9W9uZAis
	qJ7AWW2Gyc+6/v8OPAslx0aP+c783pPpC52iegEeBmd4xOTu+E/f5VO8qjW/SND9
	lCEKKRKK31oKDifc5fvYKN261vn12J1UVi9YP3t1AVd97jCAg6R7mFqyUrJBENin
	TAHUD1teG9wd08hC5BrUVd3bFWmmhhnWadk5s2YWxY99X17FPC5mfbky7AGWdLmz
	JeLqNOJw4v1tl1p+cpRf0QpAXqy51E6IBjwZ6w9R0T1K2/Qtr/Spj5TBLyghoEGj
	ykbySr798kLVC4mwS5fSsqMGMvzHNEfk8HF6NrTRv1Uc8RxKvvSsV3UEfOgX+4n4
	+YsG3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6wbj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:04:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d840206c3so7910801cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779091496; x=1779696296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZewacJ3i9lKnkmzTTca31dtk4aGbjL3egDzG8Fs6hJM=;
        b=fDnOkG5hTbfMJCwsvsdujtSZWSVaFocHMIqsBplhPIFZO8oMuWw2pBEjL3c31Q81LO
         GoJXSGSfTEa0OmwEsKP/mqWBrLIq3h5lTw3fojDVVphJmY4utvDjg18zfk/CRLMx7tFe
         8jzh+T/KQA1hbsIGbMyNvtvMZuyzkwVv9vR1ypbjbSpERIKogSaFyrkIsk49GqCBFaem
         CtjdRaD0mEjc49TXfNKX/jWWjL09h7VF4nIjvIDw66GnZ3U3z2nqc6bvcXdGmCIpWF7x
         SZspGMAuDluByBe0abGQQhi8nUmfulyk4wDW6lC4ONA8KTqOKNck1Uzm2qCJQFRxzTSq
         ExCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779091496; x=1779696296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZewacJ3i9lKnkmzTTca31dtk4aGbjL3egDzG8Fs6hJM=;
        b=oDm+Y0mfUKK9d14KZkFrGW5cTebv2fI4ir5LUC2SKXrIjSCesyyfFPZQyXQ5ML+lFC
         9hExt62BPCfpAJY3cYUZMFy8oTJRMMmQMGmXav2guulJpfuZGMjzpQpCSnbk8+GKioxo
         KnXxJyxO0KIcpjm4FWaggW+w3sgtlCKKoqvK1ab8aNTmH8CQZUUA1TbiospathEad4qw
         gHC4Thr6b5PBvJM+6CMyeJfT3V84Ly2dslSrNjeBZDAWexy5Paa+sNKHva2eWeQLr0w2
         GnpZ/3wnTl6TJKoj9D80U97Cet4cNXL4I46+EHXotkpJRmXLxdIhWkBWDE/mBkMVvAa3
         X+jA==
X-Gm-Message-State: AOJu0YyQeKZwQI4jxXTrJzoZgEz3EF4qjzR/vv3/byU9Wil2g2JMrHkM
	hvy+ca8W+wsPlQ+e7v6b0Tksgxpgp8EP1vYJi8pLS6jxM8Ay9LT7rDVJJskrHhOORSVgOlkQRnu
	6EAaLAp6+6reDEDa9xhRBLBPMNtTlh+YIXnwjKK91lrM5d3AzQ3T6eQv1rMZOEjUSc17H
X-Gm-Gg: Acq92OF3VteaXpm5gMAHqDsFW3M5oKfsLNm+jH2a6D+uaito0rPgkozVLO6yk7vBi8F
	OKx53jbYiI19hD01V2XRmbTqsPqtEHMtQs2Zk2uoAeVB9bGBPL7iwJ6l7XT8hvg2o8VVw1EYJ+9
	Gabr8dan8kNVH5dZ6N3gd4BSaswFUcFcrFIqdoR00E+A8GtQob5MMzsVh7KoUXhGfHUYK6NGvUp
	VJQsiANeRr2F9X/LghjBQgBkYAmCg09yS2SVxX4kk9Tt9j48OBIxrTjKrgCW+Bw8WH6EUU7nisU
	Wldyf1ULMH4Yp8kT1O8Zrv44kqAtFKg3sro6Xnbcc/xJD5o2JANhzAH69+4UCMkR410fI6mOnkW
	ptjxRHPATo3fZewNWP8WalVu5iblNuIRQ69O1FUWjFr+I+KLpAtwFdKhiz2Fu3TtWSYfPHbA/tM
	CdFT0HJKAMnw5iTg==
X-Received: by 2002:a05:622a:11ce:b0:513:43ce:eaa3 with SMTP id d75a77b69052e-5165a202f87mr142817461cf.6.1779091495649;
        Mon, 18 May 2026 01:04:55 -0700 (PDT)
X-Received: by 2002:a05:622a:11ce:b0:513:43ce:eaa3 with SMTP id d75a77b69052e-5165a202f87mr142817141cf.6.1779091495183;
        Mon, 18 May 2026 01:04:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd2f67sm531577166b.7.2026.05.18.01.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 01:04:54 -0700 (PDT)
Message-ID: <bd5fd048-7336-4609-ac78-abc6c2caeae8@oss.qualcomm.com>
Date: Mon, 18 May 2026 10:04:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/msm/a6xx: Add HFI support for CLX feature
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260516-a8xx-clx-support-v1-0-62508bf651ac@oss.qualcomm.com>
 <20260516-a8xx-clx-support-v1-1-62508bf651ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260516-a8xx-clx-support-v1-1-62508bf651ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AKDmi1dgbPsNQdijC60jLP1lNf4EVbDu
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a0ac828 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ktFr412pgo1MGF5CTeQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: AKDmi1dgbPsNQdijC60jLP1lNf4EVbDu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3NiBTYWx0ZWRfX/SG8iJFlNxbN
 sHnW4CvbdHTQ/cgj3ROqSEPHMiFU9ct8spfEcUGPOJejB9DdCffAnsVGTyCIAXEO7Neqj9j5DO0
 ljZUwHY/JeQpY6QRzL5x90D29Zxu1FHUMiWKvBGzjydmw0E3GQLqo0vxDqvdOhRE9dV25T+e3U6
 4D7HdiEI3iA5Zq2/RQSXehjL8KQ3Gyxkmkenm9sbUBKo4gOlGzap6c+bgTQaJfLbBm3co9P/nTi
 1o/1c7h6zX6S2ey5WpqdARI2l4zmLpjT0PvSod888QKzii5+e2oxeSrDqdjZROSqBFgJuyVUsKX
 6R43O4deVmkxO7OkJ5nCVykErtIXA+5DQ3FoFNgONcxb+gSPswy2Z8jjAZSCJf+VCGpdBVVSZ4L
 Z84ePJnWNFnkBCa47C8AnLxzX7Yc272PKKaXBeV8qixle4ppqXv3ckgU/RFj6SRxxtG2+EINGbR
 AXK1qpPfGuDL7fOT0Tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180076
X-Rspamd-Queue-Id: 635D056880B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108122-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 10:07 PM, Akhil P Oommen wrote:
> Add support for Current Limit Extension (CLX) feature found on a few A8x
> GPUs. This feature is required to limit the peak current consumption to
> avoid HW spec violation on GX/MX rails.
> 
> Add the necessary HFI interface support to pass the recommended CLX and
> IFF/PCLX limits tables to the GMU. Per-GPU configuration is consumed
> from the catalog entries.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +static int a6xx_hfi_enable_clx(struct a6xx_gmu *gmu)
> +{
> +	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
> +	struct a6xx_hfi_clx_table_v2_cmd cmd = { 0 };
> +	int ret;
> +
> +	if (!info->clx_tbl)
> +		return 0;
> +
> +	ret = a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_CLX, 1, 0);
> +	if (ret) {
> +		DRM_DEV_ERROR(gmu->dev, "Unable to enable CLX (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	memcpy(&cmd, info->clx_tbl, sizeof(cmd));

You're not adjusting anything (unlike the other function), so you can just pass
info->clx_tbl below

> +
> +	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_CLX_TBL, &cmd, sizeof(cmd), NULL, 0);
> +	if (ret) {
> +		DRM_DEV_ERROR(gmu->dev, "Unable to send CLX table (%d)\n", ret);
> +		return ret;
> +	}

Konrad

