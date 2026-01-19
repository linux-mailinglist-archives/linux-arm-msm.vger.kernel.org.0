Return-Path: <linux-arm-msm+bounces-89592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 615D6D3A38D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2197C3008145
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6413563E1;
	Mon, 19 Jan 2026 09:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMFNfIIz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMeQ0pO4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818491FE45D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815907; cv=none; b=oNN6wCiJMEpx71VC9Xfn7yZpOhOIDNJy0UMjFTPQmDPlizvatW81ZVetXJcbsxFZuN7ojmDHQ3bOVPkyuj9yVEpcsCRGPCjLw92zjLOet8DwP/LREQXTpgd2yb/Ufcv7RJ7fixgJbXGkcD2aR71QtbFTU47HBEi55NTp48K8jmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815907; c=relaxed/simple;
	bh=Eky4zJKJoTQ3zm8sUP/KZ+U0jQvyt7HWXjAmamgp+aU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSh+dNG/OsePEVCuyfaRX5juBqgpeE3o0xKzKECXN/bdt8yYCRjSHZxp5yBvqMn+fJsHtF80nwx3MNbxT5aK6QANl/ahg4JXmxmUnh203kPc/uT+RRhdQpfTtY88UMNJlmOa1PzaAI6L3Y9c53B5iBOIbpkB1Qhj/lFHUvFVmkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMFNfIIz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMeQ0pO4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90jsM227869
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l755jNiGbFC3lmwA6wLPzJTW9A6JK4qf69307aSR/i8=; b=aMFNfIIzom2Eazmr
	W9WyBcbXyr8XKQrNVoRP572J4IIlJIkAVljMHbD98GhNRTCaod5nGyXJGOvDRB8V
	k5pU+39ZjBOOp0dVqhms7zI+p6AJyrUaRiJEHxUtuCvC5+uPTgyu5z4tdmivCejH
	77sXu7zTapCiG6lNeqsJZtDD/jzamAeVmBD68m8fmZT4doKwva7B7PwjBaHQUTi7
	hjuBlSuJVgaTzAcHJBPgZeBADYAu/phoHdS4fBuhYgmjteKkMxpqmOuexsEq/eYX
	N88EOCtbzGtw8RHjuAQgPW9asQb3gxm+8mWXj2/ObrmGzYNzWSANlvs2QyL7Nzzz
	14HJPw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8ecv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:45:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34ea5074935so4098565a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 01:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768815903; x=1769420703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l755jNiGbFC3lmwA6wLPzJTW9A6JK4qf69307aSR/i8=;
        b=jMeQ0pO42o7BPALnZszmNk7i8PY4+SqYGLwIyOBna2pum80MC6jCQL6x8wUiy0Q2pJ
         5dSGo7ZRfASSodj3isbDTAkywrlNAk1KzAw0CeSszo9NV7Bmn3r9E5JAQgwB2LwxP/pW
         nBfNcNezLnR85bB9hf/cICJ5ltgGTsJlVBBeaUjaqBIxEE7OLgJJUX8qaunTy+K0LxNC
         SIMG1cr/VZnWj5PTw4Vq5RYpuRmIk0xjH+r+H3RVLZo5UqKhhqxi56QQjII6We6LKEY/
         CPgEv5u9lKxDyxIPKA6UNxDWuCVH/POmKJl6sR9EfIPwAuwcSqK7DQrwt8/I+l+fRr9f
         CTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768815903; x=1769420703;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l755jNiGbFC3lmwA6wLPzJTW9A6JK4qf69307aSR/i8=;
        b=DNZx9VQeAKvbLIV7xi+nJj6Q+m3qxFhXa0H+O1UFaDlUUR7TXdbfED/Uj7F8yYDMzA
         eNkYh8USkLMeeGHbckqXRAQFsW92UVPlY708wPRBvG5TjGzIW6T8xVyKvhBcC+3jLgu6
         E7RRgqASfFaJpHkb62ykJU8aWuVQ16DtSYIsBx4TsVIyyYyggA/XHWpfqSDgvjqfv+Mb
         9ruV8fKvhe25V1rjrZnKKxAkgfLhmEToo/dx+J/dAlTroW8MoCtrxOhpT93aQ340OYMm
         G7FjAj2KVMFYaJT6DDAClfLR11RCCRfmODDMdcHU7ukqB0NMG0n7B0PKN5WOPfN/8dHJ
         rQhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/BOS3G10UeT8cMRVp3kexAQIYBH4hYBnbaWJ9b7g07m0yzYtBp3zunqeGmdQRtu10gbMuLHXvQGk1yQP1@vger.kernel.org
X-Gm-Message-State: AOJu0YwPFvFsqeum+Ya11QiUwt44AUo4OngimAPItgDXfBxtK2TsXKbW
	UlnrIO554oK/oCSXsht5kXTvDc3zBSrrJPVlUBi2zH44WoAZPKGtDQHYgfWT7t3Hvf4DgxwRqro
	Ffnbf/NZH71T7yk6TyF2uP650K9JdCWyACw7h9akp5aFj2HFzpeRIBtDBwMATnmIA25NO
X-Gm-Gg: AZuq6aI8yeUJCaukIM/u2BIHDPTNM4aaWIjUOpXXvtpWANTQgjcfx7+fpCn/SOIbnoM
	KptVVttIgcpi5d+s+VM8mARRkR9iWolh7q6iFhv2/lzDt4jzQzU8LrfaC3dcniHTV2HGRlSlyp8
	wSwaoqiBHeVKHPYs6ph+8fxIkU3O4ucOP5V5tBiAz639fpLo6lgCm7s+nscSMWehs4O27mtVJAf
	T43MGDmYNxo/jBUpNdIipyy9V8MkY7HBhvHWLSQqldNAqLtwAHxAn99CqF/nHY9A8Z/qA5CWPM2
	1ghgiB8Npb+6kx2eZb0YpGrsam5rm+wOIB04MBmjWuR9EWRClgcvO7vNhgWWP1La4xIARpcUnes
	pASAvzqpTz2zVSvMTqk7ZtHSnWSzCjDXh9Q+NDc60wSpG
X-Received: by 2002:a17:90b:33cb:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-3527329c911mr9818552a91.37.1768815902952;
        Mon, 19 Jan 2026 01:45:02 -0800 (PST)
X-Received: by 2002:a17:90b:33cb:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-3527329c911mr9818517a91.37.1768815902343;
        Mon, 19 Jan 2026 01:45:02 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677c90easm11181982a91.4.2026.01.19.01.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 01:45:02 -0800 (PST)
Message-ID: <d1e513b4-3333-aa0a-410d-5ca6b5056a57@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:14:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 6/6] media: qcom: iris: Simplify COMV size calculation
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <20260109-batch2_iris_encoder_enhancements-v3-6-196855ef32ba@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260109-batch2_iris_encoder_enhancements-v3-6-196855ef32ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J4BtegU8y39kN8bmu4hMAJQzvjGXxGtE
X-Proofpoint-GUID: J4BtegU8y39kN8bmu4hMAJQzvjGXxGtE
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696dfd1f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=veCZvnjz67tEVBlp6j4A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3OSBTYWx0ZWRfX8x8bLy2iN4ME
 jAEqSGvtiapsZgO/p7tBHhcemQbshfImTKMQjVuKN692W+ZQP0/vBdNq0JwdRMY8LpJU1LqIFnk
 fpO5GrXMLZAAApQo8RPBEXbDG4oKHmK8P8JxJGpK7JZmlDPzwu6ZTdy1A8Wy6cUiEArVJ27OKdm
 Z9zKMUSJX4tA7UuTYsG1Gx31CkSmFTNgBI9zEZoHxwycO2r3uR0n+8yV1qZPVN4EMoCEiUjMnBQ
 0oXb6ioTAbWiD7sHjUJDbUOkMFV5w9Kh2jreT6qogxVZncmg4pXBrQkC/ponkAi5hqUdeXgYxqO
 gVVGN/KI/1sBhrEL4DVGqN0kGBGigZtmRswGMGQFtMfE1TaRpFiMXt0vKJ4Fo2vmExeDcufvy59
 RORgkq+Rlkud8YaVvjEXourLT/rgNf5G6+Q1ZLKqwHXp6jvfmiYgtMhcyR6EGLUaBJvKsvjTPwy
 8T3ugm+2C5jM1+S6abg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190079



On 1/9/2026 1:12 PM, Wangao Wang wrote:
> Unify AVC/HEVC handling by computing codec and lcu_size upfront.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index c962042518fceb0f82a48956df01c8f3cd26df99..621d5c6b4940e146f117e6b206421127c7cf9656 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -739,16 +739,13 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
>  	u32 height = iris_vpu_enc_get_bitstream_height(inst);
>  	u32 width = iris_vpu_enc_get_bitstream_width(inst);
>  	u32 num_recon = hfi_buffer_get_recon_count(inst);
> -	u32 lcu_size = 16;
> +	u32 codec, lcu_size;
>  
> -	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> -		lcu_size = 32;
> -		return hfi_buffer_comv_enc(width, height, lcu_size,
> -					   num_recon + 1, HFI_CODEC_ENCODE_HEVC);
> -	}
> +	codec = (inst->codec == V4L2_PIX_FMT_HEVC) ?
> +		HFI_CODEC_ENCODE_HEVC : HFI_CODEC_ENCODE_AVC;
> +	lcu_size = (inst->codec == V4L2_PIX_FMT_HEVC) ? 32 : 16;
>  
> -	return hfi_buffer_comv_enc(width, height, lcu_size,
> -				   num_recon + 1, HFI_CODEC_ENCODE_AVC);
> +	return hfi_buffer_comv_enc(width, height, lcu_size, num_recon + 1, codec);
>  }
>  
>  static inline
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

