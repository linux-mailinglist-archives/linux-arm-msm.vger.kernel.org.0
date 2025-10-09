Return-Path: <linux-arm-msm+bounces-76538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 748DDBC77DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 08:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 514421890513
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 06:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E45D17A31C;
	Thu,  9 Oct 2025 06:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aN7JfwTw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE9C290D81
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 06:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759990158; cv=none; b=c/GPflM6mpKsgBTpfX1Jj/DcbD8jNEwUf+d5JymfHkeP9Xus+FXoyN6NASiuGsDrdwJkNNw6bgyvNYpgZHyzfYVyR/SiHhJ6vFxZ4+3P9vZFC7LSgaft2sIgMZmUYHA1AkuPFZ3t1gcK4CHuJaP6T5k9wSn4JlyIy+pMw5ggdIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759990158; c=relaxed/simple;
	bh=GOjgXUiOC9EalwRg32Htt3OW+Yig5C3e9pGvlU4vMbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOVA/GkWSOAusRS3OELQrlTsZ+rhWGVyJ1lkvzg2Py3mgHPIbW7pDzAVmXmhhvGxJFTGYbdaG5TVML2EZbq1cVDHrcF8oUR9AzhwvUpqsNpEfh7yNkrc3VeknHvQAElIRwFuvvT6mXwKTV17xjiqkKVOSw7t1I4+Yuc9ck+IyWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aN7JfwTw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5HV3012818
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 06:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8IvL17W/Id1+6m6ZexrF987wVVzaR9/r+cvN2NSP1Og=; b=aN7JfwTwQOlSeOlA
	2qe5sgBzSLAaRM4vgoBRkE+wVc6un083lwOqaStMo+3NPj9nTWZ//HinLDzwZ0yZ
	jez7SzkRg99f5KrMDE0iCqq+d2oNGtbBTntLba0W5oqppeaTA0djWw6ogNPqFnwC
	IwGz1mssz/qyPz2EgayNDqujUW/6pHia2EVgtawVLy0c+hpN9lC1zz2ZlwlrLZlF
	UFH8fcwJTQSSsHc7koqyjigh+S1nujg1OZ94y0ZfMzmFUZd5BZc8Lv0gNCBACk04
	ghgQlW51x0Isv+9xV8Z73r39PYvH4v+59wjvbyCvOS2I25YN2PQWNVOspJyiz2xR
	Gh2oug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j1nuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 06:09:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28e8112143fso13321345ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 23:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759990155; x=1760594955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8IvL17W/Id1+6m6ZexrF987wVVzaR9/r+cvN2NSP1Og=;
        b=OIWjfjXgqo/FUJ/1+mWJbnFjvxO2W4M0Y8mWZ7Ns90i2amET1n0Yv01wuaC2ELLTLQ
         cFe+dwSYoItUZkr8HNIOZB3S4aSOPndkvAhIpafgLs/9C3+OJ9bvCMNoKDB/vSzprtnu
         96GfjgU4gWcjcKWwxevZ7lm333Ql8rRY1rlrLGuuoOkJdDTHwYNP7Q6tOo+R6pULPxnC
         HIgFzq8CzA/JhC5f8brm5DxOQoNkomHHN9KxnJu4YmHecnTJCPruUUMS3R5cLUSWD8uK
         DpKEEZFrGnAATRbJRI1rD+BY8dzFqhLaNBRukA4IUqG4X1nS4bvbIb3YKF8Gq4hWTKSt
         Sapw==
X-Forwarded-Encrypted: i=1; AJvYcCVM0EUIg/PC/7om+QeM424DbkX0hEka1YPowi2vDTy/N+ejSSRjp74SUxPgMHaSl2fKKnTAGUnUt8hj8BBz@vger.kernel.org
X-Gm-Message-State: AOJu0YxU8x/YYojqCpt6yPa67TUpVHv2eh9/3C9UJWr2lmwjH11FTE9V
	PfXu6fEVotgx047HKbRq292xJkrAFNNOrEHnDz8W1zFALgidp+U1115HYhhAAiSxqFJ3GqreJxA
	XrjxJfypzIsn2kYIJGXPXq3G/wQfPD5ouRRVCPQ4+SFKwQm4Y3Rg90+EXizWSdb8bS7xG
X-Gm-Gg: ASbGncuezTKOjxcjxXiJyzcCYA/u0Y6m6nPSEJiXtv3MNYe2VaUfSHk/e0w23xobBwJ
	/sDWqySDomTW1yxs0YPV/iE32Pk2rV19qhkCWl+SYgCbrSnhdtFsIyvXxg0C3ZutwVKB0QG+vsh
	iGFIRjG3MqqpP32XBNKFK2WYL3EFOSWiEiMzR6uANnhL1/BYRxH7lDcSKIc3Hp1cfuXKgVOfPVG
	oldMlw39QvK8BdlQWymg15Q3HzToe3wO/tO8531AcRk8qDBWLvsFzr3EQ5FhFKW/yk8c2EYhzb3
	i8a4EH0Zw/MbnOCOtpm1HQvsaV4CYehNTPKbjEsW9ji4jlT6JXfzpK7KhtfS2xvM8lDgDBRREFK
	ETA==
X-Received: by 2002:a17:902:e787:b0:269:a2bc:799f with SMTP id d9443c01a7336-290272b54b6mr71066235ad.29.1759990154987;
        Wed, 08 Oct 2025 23:09:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH4qaK8++GdSK4a9nJINH772gWn0nUmeHNyLqRwvjmnbfqBBysBHMmIHywGEilc0MnfbnNrQ==
X-Received: by 2002:a17:902:e787:b0:269:a2bc:799f with SMTP id d9443c01a7336-290272b54b6mr71066025ad.29.1759990154515;
        Wed, 08 Oct 2025 23:09:14 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f08ddasm16250015ad.65.2025.10.08.23.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 23:09:13 -0700 (PDT)
Message-ID: <fac9eae2-3ae0-9638-8767-ef4a26718c00@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:39:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/8] media: iris: turn platform data into constants
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-2-def050ba5e1f@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-2-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QUfGUJrUkAosWT0jpWDHurAGBMdKoh_h
X-Proofpoint-ORIG-GUID: QUfGUJrUkAosWT0jpWDHurAGBMdKoh_h
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e7518b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=L4P4cphVmhIBbhJv2lsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXycDnsvfbiQzZ
 3tC4eElug1eXPo+/quvlrBZ+8vhbIs2vy+rLX/USG6faCg+rHzszP2Cn3iLxvcNvwiYkXzcSE/i
 PtYjyuNj576jkzcfIcQbjHBqYT/C1e/opz/GOBKYM55SpQV5+t+Zq+CP2ubG2fRce1tz+kZIBkL
 ZzouC68NLz2kk8YTiZ5J/PYskAXpqUlQfJTGTIm7pslwwBHFCkuY1ddoANuL3p3kqMAWEuZsBG+
 0mPBYhTOlrQKfC3lVSBnj70JzidVyQgr0kFjwJw5/7T6lz1bEyOWmKszTU2vho1IrTXAHrMFIHv
 oYtgk5W+xcv1SiW1ctJw6VygGRjsFuwR60iMR0gmWlbrEsULXU0sMX5livnCoMqB1SkrDckvGuM
 3+fqtrP7tKXg+9lUn7xLmB/lGTGxew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121



On 10/8/2025 10:03 AM, Dmitry Baryshkov wrote:
> Make all struct iris_platform_data instances constant, they are not
> modified at runtime.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 10 +++++-----
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  8 ++++----
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c |  2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 17ed86bf78bb3b0bc3f0862253fba6505ac3d164..5ffc1874e8c6362b1c650e912c230e9c4e3bd160 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -41,11 +41,11 @@ enum pipe_type {
>  	PIPE_4 = 4,
>  };
>  
> -extern struct iris_platform_data qcs8300_data;
> -extern struct iris_platform_data sm8250_data;
> -extern struct iris_platform_data sm8550_data;
> -extern struct iris_platform_data sm8650_data;
> -extern struct iris_platform_data sm8750_data;
> +extern const struct iris_platform_data qcs8300_data;
> +extern const struct iris_platform_data sm8250_data;
> +extern const struct iris_platform_data sm8550_data;
> +extern const struct iris_platform_data sm8650_data;
> +extern const struct iris_platform_data sm8750_data;
>  
>  enum platform_clk_type {
>  	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index cbf38e13f89e5c4c46e759fbb86777854d751552..b444e816355624bca8248cce9da7adcd7caf6c5b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -737,7 +737,7 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
>  	BUF_SCRATCH_2,
>  };
>  
> -struct iris_platform_data sm8550_data = {
> +const struct iris_platform_data sm8550_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
>  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>  	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> @@ -827,7 +827,7 @@ struct iris_platform_data sm8550_data = {
>   * - controller_rst_tbl to sm8650_controller_reset_table
>   * - fwname to "qcom/vpu/vpu33_p4.mbn"
>   */
> -struct iris_platform_data sm8650_data = {
> +const struct iris_platform_data sm8650_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
>  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>  	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> @@ -912,7 +912,7 @@ struct iris_platform_data sm8650_data = {
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
>  
> -struct iris_platform_data sm8750_data = {
> +const struct iris_platform_data sm8750_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
>  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>  	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> @@ -998,7 +998,7 @@ struct iris_platform_data sm8750_data = {
>   * - inst_caps to platform_inst_cap_qcs8300
>   * - inst_fw_caps to inst_fw_cap_qcs8300
>   */
> -struct iris_platform_data qcs8300_data = {
> +const struct iris_platform_data qcs8300_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
>  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>  	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index e29cba993fde922b579eb7e5a59ae34bb46f9f0f..66a5bdd24d8a0e98b0554a019438bf4caa1dc43c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -314,7 +314,7 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
>  	BUF_SCRATCH_2,
>  };
>  
> -struct iris_platform_data sm8250_data = {
> +const struct iris_platform_data sm8250_data = {
>  	.get_instance = iris_hfi_gen1_get_instance,
>  	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>  	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

