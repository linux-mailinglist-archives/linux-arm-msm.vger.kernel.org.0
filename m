Return-Path: <linux-arm-msm+bounces-106448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAw0BFCn/GmwSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:53:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 665AE4EA97E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78BDC3038B83
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947E441B366;
	Thu,  7 May 2026 14:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVVSz7wI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MRNhDBCi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1144841C308
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165056; cv=none; b=FGGDCp8bka0PEzYUXQLaYQYF9xo9UaHyeOZjsGvWfO4fYSaZliFAwlBJZRSmuuItc5GGQoS1WpyznLqTLddtZrvXcaXIudVkPhL1FMbPctkAPQaZdndVD+mwSJUpxsRZaGObyPnfhzqOZW1tw4SUdWIW/lx+z0fw/OAvm04jUv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165056; c=relaxed/simple;
	bh=yxxFW0lGHLlrJIKZ+qN8cjJC/Uz3gM3CTDcnUzHMmGc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YrZlBDpZUGx9JVPPMu59xGbhztV6drhUURXspXSxClX00rjNxR4iX7eGS1XS7qZN2RUir2EVfv1qtm6RhhRbi0y3Tm6ul/j7R34PhTg/+hJoIZQwJ4z+/vRWGdDZnD0FP7reNdGmtQ8d4Frkox3+BoswDWmyUEEMwmS7O9ovR9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVVSz7wI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRNhDBCi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647ADse81669568
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dZS4Z+n5yl3239JmhoNbCdzxJTz/lzr+NgykezCYlEg=; b=EVVSz7wIFyrLJmZz
	poqDC3p78W4clIeM/dnCNcNXkaMl9hccxhUDA1kztXGceFFPT1+RfYYwsNuym+wC
	7u0waGaZrVg96sa7G0K2pUbTzqVaTsDioOnkmQO2Vim0bGqGiBk5A3oLZj9WUB3L
	YsZPwunY8DwBOQ4tXrKefPz/yHz2sXS6/tsNuR86NYl/kukj5WfyB7z2VwJ9kJJ9
	Q7zJByAu6lYhRsxgK/M1IBILIdKVvdSBAv+gO/17XQ0pUssg7TBXcr7ZHyq4BBPD
	XqH88/Qw52PRlp7eOzVLy7oMp9D1uTpeC2gBw7vjvaKJdbKyTnMjUFO4461pg0FT
	o1qPWQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p2c5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:44:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c797e31a9b7so1024305a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778165054; x=1778769854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dZS4Z+n5yl3239JmhoNbCdzxJTz/lzr+NgykezCYlEg=;
        b=MRNhDBCiim1HPRHSWPiP0KkoDWe+UY5uuCW7+vN5p9EiIACvrxOhXDXlNWZREATz9u
         LbJwS6FFW15JXhW8MPt907x++4f1e3dZYiVhCwiw9RyAn8c75LzvWh8p9ybi2X5E83LN
         ry7xHSUpOForrVu3oWS/FVFjZbsiuV/dr8YpwpQVO+ZuQGvSbD+Ex4Dq9rFH+kQTB9Yi
         Qq1MnRfm3+6TIyv05FTRMcKaf0e/dVurtMH2cToMB2k0fyoRL6cOWCFDzhSk40Hf398R
         L8fbx/ZewUAXx/ZjNVv+pMB8phjLR/+WdYAW6lqhq7kbECqVQHDjzFXkoylk7Dg2cEPy
         pqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778165054; x=1778769854;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dZS4Z+n5yl3239JmhoNbCdzxJTz/lzr+NgykezCYlEg=;
        b=qD2mMSpTDveV+RjwrazPkdl5A5hWU1XcFcWZwbcCq+bQqJEDfmXLMhsIR2hueHUXDR
         sMlyHasmJX2MhO4Y0G7S1wUmzMf1ZCsXQvFhPcsUSWTVzjxsMhdJ+b74cGQvtzFwLnzR
         P7vHx3fUazuJ/blYOtY89Z9HCn/TA3OzObK/8GVUR6PIBZyEtIP+V1W8V+DAGSUZS/x8
         GiyjNGhsqrny52iW38dC25t9qzn1p2BD4UxrbBH8bm/9pDINRVb8tqLnPn+FiMFqnx9u
         Zzk0j+XiMHIsk4soyISb00E8bxmTsQpIGQNSxqmsbWyMTX9GwvpY4eHkI8PXSTlufcpk
         r2Dg==
X-Gm-Message-State: AOJu0YytJzskUpMMEqVP9IddZHiS9WhR17aaNzGUDi9kgey3mf50YhYQ
	6oiT3Gx6fGy6VmlkjkIGlHPn760TnX7BgnLLaiP7mvMRDFGTWiXi32Uf4KkqSPXxSnSHYYkc0eH
	K9B+rKmX/xSXhCLSlqKFnOOp2fhGFzfbp7Wni/dC53LVSEZZNZrYoCougXJMBGFkKzZMX
X-Gm-Gg: AeBDieu09yfS4OgWTC7KaRjFoOIAxwAj66vz+aEcgwWZgsSA/7L2ZLmK3IV83HnSLCh
	BJzhzB4x8zcA9RjGeNkhapOZmfmzymQ5695v0baaytpnJGNIFwXtkOjhlVmsTRj508vHEFlRA+z
	bSju4Wsqj4kQhJwVcTxVSdZL8MLtgQGkWAKeOy+G5hu5XSwWh9Nze04vnxtkxEPvmOgJj0TCtF3
	UoGBbUZfPkofJTRcKrWqDNPQD987beY0hkzD4ft7jZIsTya7ubYcKJzLjiDfKnTjnzivVY0uJt6
	mtDgOJh1X8h4DmEo4VitD2lWrcX4lCH0IKGtr8VYLfRpgKS8sYcgw2K6D7d1b4zLTWsQZqV7kll
	m7m37b2fZn8LFQSig7FOBL7MN9UcXffKYymFZiLSmAn3Prgx9ejOz31M=
X-Received: by 2002:a05:6a21:6d82:b0:3a2:ecb8:56f0 with SMTP id adf61e73a8af0-3aa5aaf65f0mr8713539637.33.1778165053519;
        Thu, 07 May 2026 07:44:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d82:b0:3a2:ecb8:56f0 with SMTP id adf61e73a8af0-3aa5aaf65f0mr8713494637.33.1778165053030;
        Thu, 07 May 2026 07:44:13 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965c30ddasm11425000b3a.21.2026.05.07.07.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 07:44:12 -0700 (PDT)
Message-ID: <2b3e5751-4de1-45fa-95a4-6d3d69fbe2dc@oss.qualcomm.com>
Date: Thu, 7 May 2026 20:14:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: Re: [PATCH v4 16/29] drm/msm/adreno: write reserved UBWC-related bits
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
 <20260507-ubwc-rework-v4-16-c19593d20c1d@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260507-ubwc-rework-v4-16-c19593d20c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0NiBTYWx0ZWRfXwTzDUrqBHVfp
 re0uN9sWyjHpTiFGM81ssyjJtVYzufNTQf9qkL5QxuU8qs8SCH+GI5qzHGYqN4Ck4Qg0AGqcmPR
 /cY6mpOi8VmILKoJNnGwxSZDZsLmBB6ZYpCrKa+GnzI+siHc5YyKXRXwvVYz1aQ9erVyttLeAqi
 LyBc0s4uDP77swrr43O3FPpDJpvt1oElVSLv0dNTQaoytk7zgJi0qO4IOKHX2tO2Su0EpOfIcBe
 2f/1ZSCebrOhP5AM0AeXI66CyNabQIFWNmJnpKW13iWilK9sxy65DEGVQvSzRuc7Y3kh7/2zxGU
 8piSVl3GfIaoZV9IEYcBoyvBpY9KGy9RmyOwSlohWBnSWLXy5k4Ddu9UgisoGlK62jj4nimQx/A
 ETE9JTtXswaRw5HtsXCf49wMxTyVhiFcYvMb3YDv/cEyxawaxWNw8yf/Nzsbax3Au4+wEohksx0
 G2zY9YMsX5CRQGUY8CQ==
X-Proofpoint-GUID: kmjHp_9biM0PInwnhkx8YhiHuz5Hu6CH
X-Proofpoint-ORIG-GUID: kmjHp_9biM0PInwnhkx8YhiHuz5Hu6CH
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fca53e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZswEv4b9r44Tze3PQiwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070146
X-Rspamd-Queue-Id: 665AE4EA97E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106448-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/2026 6:33 PM, Dmitry Baryshkov wrote:
> On the latest A8xx Adreno chips several of the bits in the UBWC-related
> registers are now hardwired to 1. Currently the driver doesn't write
> them because there is no side-effect. In the preparation for the
> refactoring in the next patch, write '1' to those bits anyway.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 53def136e0fc..7a6223ddd8cf 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -288,6 +288,8 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  	switch (ubwc_version) {
>  	case UBWC_6_0:
>  		yuvnotcomptofc = true;
> +		amsbc = true;
> +		rgb565_predicator = true;
>  		break;
>  	case UBWC_5_0:
>  		amsbc = true;
> 


