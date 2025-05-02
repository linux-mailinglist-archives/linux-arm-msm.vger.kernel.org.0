Return-Path: <linux-arm-msm+bounces-56499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97389AA728B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 14:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 372CA188C546
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4B6243371;
	Fri,  2 May 2025 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wnHTSFzx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D186FB9
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746190202; cv=none; b=vAJc2T6Otd1CS/2pofSWW5MSVQ7aney2DFb/bFXdlqCy4bbo8vbLqX9v/FUcpooFal5glVKncWTe5LQZaisrPWO7DYsWcU7e0eLOZwrinrLXoNl20u1X1OWTTPeQx9hhg97/H/smMxGM5KH+2rjMCSwL5BjHkfi8UzYkFeAW8WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746190202; c=relaxed/simple;
	bh=JrOubkwGe9p+sK08ebhN+YAgR5LXsT2jghNi9jx0xWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M9EbjSIrFMuaXVYQfA2xBYwM5CZaIfN7YtAZyPv4HTkPrFe4gXv0bu7qlUjTTNEXYjvMx/UcNIiNOvjL99Ez3qvUe3zjtjMiFlP+Y1HqmxYnjAa9h9IUlS6TMW8zxCyyscZqf0eOOS4/TNs3P/qQ9rJxTs3+epZ19bP+t6PqlZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wnHTSFzx; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so1212786f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746190199; x=1746794999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NhKThSlafFeqp4Hvo+pSEwoDYjQos7s5HRDgvc3EtFA=;
        b=wnHTSFzx3/6pSWrGx8P7N77VGRiwT9Vq1nbzjX1f1Dj72T9VhFmJf3+4+bSp9zSyQo
         5hvTg8gz7fJNUt+T1yFdzeofPFaZyZQ7PeCm2QFnuzpB+Fqq7j2uXfMejsfoNsYyBzU5
         +aBaHC7oCyR/h9nziGbEmTABIRdSrzDAvBRd6pKjQOLpj6kdP32aevnlLXkJO5qaDjfM
         ax+nFDlwWMdRYu4LczEZz/5AdukH32mZKk/NfpDRbixV6wG3jg3XlAIXrloJvwaLNtmx
         N7DuQjIk64FvUOQzZ0uZ534+Qz0fR26M+8mfBQ4NEZq8LlH34MtEeMS6DbqayUzvdHPt
         dUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746190199; x=1746794999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NhKThSlafFeqp4Hvo+pSEwoDYjQos7s5HRDgvc3EtFA=;
        b=eRBCyWZXYw2K1FzeJA6Bpy5I0fyEbpL6Vyz2EZ5qVJMKdjaOx4oCUDFyoar+BJOo6/
         s2+3yTOaylpItJbb8XK8hkfV26l/QRDH8Thz92NkgmtVJBSG0Bu1vzONcTwIseqeO+qz
         dLiqJwcKLBJeMwboZagwX/y5LHEJWOLtPixOnnsfOtmrt+uYzZ5y6dBOEGXLILQYk7Bt
         YBK959NHCYnZ9sGKf+t9ZpWur8iqM9TvzSMkOmjOBVzIN5Gk49zr7DnIWp9G9MakMGgY
         lFCPmR3eyLwyY3eYVVMlJIF2BEJjgZCumaaoDvcM/KcGZ19zmcBQkJOaj1Tq7srHwBkF
         LF5g==
X-Forwarded-Encrypted: i=1; AJvYcCUrI4Dh8hoEIHZHtFvoDxnNjTjRYLu3KWzfH7Es5gIR0wCFl9llzbDY6Y3y3noeb50396q3Pkcwxxrmh0rh@vger.kernel.org
X-Gm-Message-State: AOJu0YwKfqWyIWnk5fY7ZVSoxhD/+gbPzp30Kjd14/lmbE5xW2ZFhLzp
	Oaww5YQZrCxuXuMs7XRBMgMpuH/zZHCzINoyoPgOfpQlJZtrAhRf5FnS17VPy6A=
X-Gm-Gg: ASbGncuOvY1RpmXPseixFqEz+uquXeM1AuvtQ4TrPFI//dcbsOzqwT+N1a3XDiymEJf
	JV4VuzYn7zTVwMlGEDYxvZq3rqYFBv4/VPud6xOkm5qhVMMgXtwZ+pJmIyAn8WRaBmI/Np2l+wU
	2AxEUULrXdXwJE0XTWVdfda1P25nKD15JclJcKpRr9XpNmNq0D2IjiUO5oncQ0VS7waFjKJPyxO
	7Vh4rtQxi9FtIW6JUjObGgMt6VYnlB/wpZI43Edau/DxjnuKklCAZYTspg5T59Kw+OlvXdce40H
	gehSAvmkba4ZF6+Q9VyajZ8CcLVR94EPyqmmxqQ60gWh6pZXdjG5FP/23kADf/6Dvp+v9XoB+jP
	rsmQ/cw==
X-Google-Smtp-Source: AGHT+IGSngeiJzMwrYS7IpeghcL1Q/aGw28NETws0AJluPOXa5GCJRNjj7kYUwaCWH2uCBerdODN+g==
X-Received: by 2002:adf:e38e:0:b0:3a0:99b1:bab7 with SMTP id ffacd0b85a97d-3a099b1bb0fmr1867838f8f.55.1746190198863;
        Fri, 02 May 2025 05:49:58 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0fe9dsm2072190f8f.71.2025.05.02.05.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:49:58 -0700 (PDT)
Message-ID: <f9767d12-a9b4-41f3-bd96-f2b13cea5b86@linaro.org>
Date: Fri, 2 May 2025 13:49:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/23] media: iris: Send V4L2_BUF_FLAG_ERROR for
 buffers with 0 filled length
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-13-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-13-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> Firmware sends buffers with 0 filled length which needs to be dropped,
> to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
> Also make sure:
> - These 0 length buffers are not returned as result of flush.
> - Its not a buffer with LAST flag enabled which will also have 0 filled
>    length.
> 
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 4488540d1d41..3bb326843a7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -378,6 +378,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
>   
>   	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
>   
> +	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
> +	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) &&
> +	    !(inst->sub_state & IRIS_INST_SUB_DRC)) {
> +		buf->flags |= V4L2_BUF_FLAG_ERROR;
> +	}
> +
>   	return 0;
>   }
>   
> 

This is a pretty complex conjunctive clause.

Is it possible for say 1/3 of these logical criteria to be false ?

i.e. if you get to:

1. buf->data_size && inst->state == IRIS_INST_STREAMING
2. !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST)

is it possible to get to

3. !(inst->sub_state & IRIS_INST_SUB_DRC)

?

This also feels like a bugfix ?

---
bod

