Return-Path: <linux-arm-msm+bounces-76320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4FDBC3C17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 10:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 751C24E2C70
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 08:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68B434BA3C;
	Wed,  8 Oct 2025 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n24/UCeN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539B921CC55
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 08:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759910873; cv=none; b=iTwJ+Bv+doXoLjEiGpc12tNuIvlgk86zZ1F8MXQYQdS8GgZ+btvCnzChXqE+dkYNWyFtEHY1FT4Y2i5A6tqmOnkJuRppEEKAefP+ph2VFPZAz9Buuxxhi5cj6GytIlcq2BCYQAZ63j0aHFitWUqgnB/DNRIFHQRuW9uIjkVft4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759910873; c=relaxed/simple;
	bh=GlAS9v82xMR+f+PiIo8yltvT3Yx17cqEy7wFa5tVMM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcAXPd2Wz7fWROhkhZVPdluAM8gTBpie1MsSq+8axDkpUcoJgDIsJdWHTDdTBnTNm2hRmgcK3qTX8SCRcDsqjCalEh0/x3t0zWKmpLN5kgdjJhgggeia9ULKAINLk/BoPpBcQrdtr758SAr9mdwSoY/qEwaEgh0IIZFKQdpVGqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n24/UCeN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987ahLK017560
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 08:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kq4YzR3vhm4SYmSa9+hmdY+KgdgAz/2HcGkjiLTH8wM=; b=n24/UCeNBykD0lsn
	uWQgmoqRqKAf8mxEAXlHA1Y43B1xVByyReP8Gx4tXoa8TNDRIT6PaGof9EE1xYSE
	MURn8tuspJfw6mnWgFR8ZTEW8vNx31lzYgezzL2FlWyT0YUFltqm4HXBpF8NjV1a
	TRyorreuZMviXUiYmMhOv036JYWYCXkZzEEPx7fhS7kL3hLpYK2NZiFx2Uo4E2Ma
	ZmHKsmCMANQsQDUntbehhmOHplcF5urPLPYHzLIxKdxe53ml9o1+HC6WNeP8p0fM
	f0v88S+21dE1tNXmy2RzBL1d4Mm7HaY09k9eLGF/asTzxsaU4DdHrzmG/x5Jz4W6
	Dgr8vg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk71sj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 08:07:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85696c12803so304524485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 01:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759910870; x=1760515670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq4YzR3vhm4SYmSa9+hmdY+KgdgAz/2HcGkjiLTH8wM=;
        b=XtIkCrZMtUJG7cUCFbX83TJNDTg22FOMj8a+UcYDICrRe84jCG+AY3UvP6KmvYJcpw
         Sx6xs+DalCmKz4v6oXqRSEypqkEyjhsr9dgZLV6YEiwspmxV4eFkRWR+VnBRONIQBtV9
         737TzwGXSzEE5prmrDtJeubBJ337rsSiM4RXxPrGZmLxXe7SVoAuELweH9drhZ81Azvs
         wWIGOXnYkI8rarTN2kdRIt3gXqt+vHgk18SVpxq6dRy3YSlKpZDd7gsY66JfUICQzVaV
         Sl3Jq/ggCVObx3C2Lk0o0WZSubcAnw9B7cZqAcpzqX2V4RTSfxivoGgsz8YFEX5xk0X7
         4QMw==
X-Forwarded-Encrypted: i=1; AJvYcCUiQIQRtH44FWomz3cl4fa6EJegHswQbEYsKaXOBAqI44KldQt9racEuFGvkixqtvZKq7VqtsSudPUq6M4/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq0OrB26lYJ/n6Yng1ic0+vYozqm4kaBTtRg0dnhEwoo1Rn4hP
	ehiWa/F5v6t4kwUiShpwgSMuvz+1HD1zXvVsYzPqzDMUiJYYIXZaeLo9y3LyPu7gaMIZtjdkWjP
	iIcmGv/3QkB0VyqRwe5DatQ0lSEq5Y5Xlmyoj9O2Ndg/hT06doRlVIKYtDKlntTT+81fg
X-Gm-Gg: ASbGnctBNwmSUKT7c4nI6Dn7ZeFB2fleQQhY+FZgPWs/RZbvVuH6MNKNLVFH3f0cs8S
	uGz6MAVF59ze6o0QrLeVxkVwI0yaqQKRn22nI0LxKOjRhbOv39lpIGaOO/Ot25gEIkJw+aQyFUw
	lljF5KNJsYvRO1E/cuwBKuW0UoD8r5fPdm3zN0j7MyQm6uLb+f9kflc/S2eUd8SaXnomcBrc1aU
	lpx11a0SBr9sE64mMKPx1eCJWfIMSVPwcfh6HFBZBrovCyDRvKXJ2kkEaRdsLrpbE/GRhWk3dJw
	QzDZ7IRa7nONopI7MMLhGy4bI97cY2c25wnwM/NmZIxfW6N/Mg7sowcGfg18OCqAyOKM5IPELJs
	kfQf3h3Uf2mKB8Pjp5s5QPlxq6pw=
X-Received: by 2002:a05:622a:4c6:b0:4db:1bd:c21c with SMTP id d75a77b69052e-4e6ead390dcmr23511511cf.12.1759910870119;
        Wed, 08 Oct 2025 01:07:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMbrsiezWEJoTWRCEktTHCv3y9jzulgOOKAyA4HNbMx1IViPW4142QRui1EwQ702G/O1391g==
X-Received: by 2002:a05:622a:4c6:b0:4db:1bd:c21c with SMTP id d75a77b69052e-4e6ead390dcmr23511281cf.12.1759910869563;
        Wed, 08 Oct 2025 01:07:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9e66sm1563216966b.14.2025.10.08.01.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:07:49 -0700 (PDT)
Message-ID: <e335be9f-641e-4835-8b9f-69398b131b7a@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 10:07:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] media: iris: remove duplicateion between generic gen2
 data and qcs8300
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-5-def050ba5e1f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-5-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX7BzAXU1KBTyL
 SmUaa22O3NoHGVUbAEodVVVmKyVdTwQoebiS8Ty23gdFBvK2fBjuOstnfJrEKgEXuluQxSaTcqt
 b7mWLnx+yqa7QlcxX/dqJZSgGDtfwQKTlzbQWXHcztMZ75mqMswKhyHGcKqzylpYUyhgDlBLXp8
 cmEjrm0MlYx2UhV9dehGT9KTaMwmivq/+aZSXfA7LLqg06X3eIXtOxuX8/QVUJXtCShp7RtIngN
 Yk2ISkyUnYoXEDov9wYMU3UdspxgZMou2QDA13yjZXRifQkyf0wsP8xxTVdRfhF2U0ULuCFESgH
 sCrrOFxVOUXOTurfrnDYbyHuWhFdnOcceC5XhGgaHnHxJ77baKHDb+8fbXhT0oh0NTRfXHQ6vD3
 QunkcCZe4Zj4d/1hK9xLX0++QYlHFA==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e61bd7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=uSlV7dY6_MLFwoWj4ZIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: d7trbOEdU_kRkINxVT0hcHje6nJ1zY4j
X-Proofpoint-ORIG-GUID: d7trbOEdU_kRkINxVT0hcHje6nJ1zY4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
> Now as we have removed PIPE value from inst_fw_caps_dec there should be
> no difference between inst_fw_caps of QCS8300 and SM8550+. Drop the
> QCS8300-specific tables and use generic one instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +static struct platform_inst_caps platform_inst_cap_qcs8300 = {
> +	.min_frame_width = 96,
> +	.max_frame_width = 4096,
> +	.min_frame_height = 96,
> +	.max_frame_height = 4096,
> +	.max_mbpf = (4096 * 2176) / 256,
> +	.mb_cycles_vpp = 200,
> +	.mb_cycles_fw = 326389,
> +	.mb_cycles_fw_vpp = 44156,
> +	.num_comv = 0,
> +	.max_frame_rate = MAXIMUM_FPS,
> +	.max_operating_rate = MAXIMUM_FPS,
> +};
> +
>  const struct iris_platform_data qcs8300_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
>  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> @@ -1022,10 +1030,10 @@ const struct iris_platform_data qcs8300_data = {
>  	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
>  	.pas_id = IRIS_PAS_ID,
>  	.inst_caps = &platform_inst_cap_qcs8300,
> -	.inst_fw_caps_dec = inst_fw_cap_qcs8300_dec,
> -	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_qcs8300_dec),
> -	.inst_fw_caps_enc = inst_fw_cap_qcs8300_enc,
> -	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_qcs8300_enc),
> +	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),

8550 enc data has a .set() under a number of caps (was qcs8300 tested?)
and also additionally defines:

 * INPUT_BUF_HOST_MAX_COUNT
 * OUTPUT_BUF_HOST_MAX_COUNT

values of which should probably be cross-checked (they say "DEFAULT"
so it's probably OK, but just so you know)

dec is 1 : 1

Konrad

