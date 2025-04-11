Return-Path: <linux-arm-msm+bounces-54024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DDEA85DBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4FCF1BA7678
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1D0221FA9;
	Fri, 11 Apr 2025 12:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uBdknXfo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1661221FA8
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375576; cv=none; b=GYlcx0cH+W3O1/PodIup6trewRm8+1Qdhvhr2d09R4zT6hJYKB8xE2ihxkOrFAIMq/SSuEgydr+R2xHfYCA/aQSKxZLd74GpIrPpJSf/kGAntla8dL8FgjvNoIJvdb7fPWMu8nQrnoT4myLqedR3xgn68NSXm2Qo23oJU1ovbds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375576; c=relaxed/simple;
	bh=qMsaU3AgfYd7npEUcPpNqxwxWZ1VhJND28wYGKSzw0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRUp0sN9v9F0cKaJZMOmZppfsFBcw+vabz92aPK+dpWlhxvnB3k/iudjBhQDkNO1TkN0PhIefc8lHyfaGenUfnGjc54jpwe79kW2L4x8SyeWwLtPIMzGHS5q9FgA8YiHSDdYh3gTNRFxHzh2Jtcc26djuegCXIw9Feq2PXjmylE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uBdknXfo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso13349315e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744375573; x=1744980373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhDLvQWbhdTyN2VlzbNDlR4PYDwczdCrrExl7J1Ijlo=;
        b=uBdknXfoDK04p53+p+44C3wW2P1L2yQqQ40vUlMU5CSA7hmeVcasAMDhsuwmf3IA5i
         0CQ0Rvl0KRWGHoMeAMZfhkJkUapkkwhou+G/G6gbubeyQYtVxQkdOwtzUG0sh9QRp3jA
         oBlRXit6BD2dponBXtu+UOOxBynI4cc0beBNlMDlBfh/wS/SpgRMpsa4jSDJT2zKUCBH
         8fHVbWUiUgNPNFHVVjNaPmUkaCfjvJDBpPgcub92sZ5d4LTf1EG/ocdS/qLPqUXbm1QP
         lq0X47+z/tABqagEBkgGE5XD2hpoQ3sa3NKEnPM3KkCCSQVGJAcXyl/DI2tsLxphQcKo
         jZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375573; x=1744980373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhDLvQWbhdTyN2VlzbNDlR4PYDwczdCrrExl7J1Ijlo=;
        b=kedSJYqhQ9+w57iRQsNJgddlx8f5s3PgHYUaPU71mP/+yn+74bgb7vc6EWPDaQ+UXB
         vbMsPUiTABgTlRtUTK9M+1QFg8OiJLmqY1FduWan8jjAsgKTBvE4L6sETTBbjki9bPWf
         o9P9nC3Jnp98Vj02aSKy2u0l8QUthfVuKPT82G23wVQti4Hh64bYDiZs/waFkxk5GVNY
         rsd6q9lZdCLQajyeeqyqK+tY4xhNb98WsrAiZsDBl1aOeNgUT15FBn5ZPMtvB0X4Y+r3
         gJlHd9fxNQnN00YmMkbuIjRLzJkoq56UtYoxJBeumtAQEY/+8XX6hSiSHqqYByMgwe7b
         olew==
X-Forwarded-Encrypted: i=1; AJvYcCUY/zzb8Aatyr9n/g/7Bbr1uDoqKriREBUPDxoA/t7NGnJm8EA0IiuqpRRN6o9FCyBpgXC5L35wSpbAMWrl@vger.kernel.org
X-Gm-Message-State: AOJu0YylbB3s/QNbBd75muePPqqthS2QzjrXea4/2oy6vHkC3CJQJD27
	HIv0Vqxs/3Ankfmt1puoAYTpG7ddqX4GE99wRfh7z1BQQucVPpXZ+1tPvZeVn98=
X-Gm-Gg: ASbGncs69IP/HKqDdAdlTacKpk9VJr4WdbIRAOowvmLCfRD9tDy9S1nSAFPK6lBFr11
	idzK+zY33veYD59v52uSNA6jdPh0Dwj2e379F1NkjVDpdZyiadc5HY7lyDi+1Om1g64M8hk+jEr
	bbPlO1Xg7WXJYuz2OiTiVDFFzpDS7H5GwgX7WldpbniF03fGWw+1sSoqAeSg7VuD2eCzvVFezJ8
	dzI1iPM9B9b5H0ithsSTbvDtJyigm3DZeN0fB0Ls9+R7cnWQVx4SmmFoFH69htqP55Ksvoqp7f5
	aqGCBEumFseCQ61emc97FGjz7mlvR9n7AWEuOXdfu6X/0dard9MInv4/J3HJ16Fx/8YPVVQOseY
	KyH2Gaw==
X-Google-Smtp-Source: AGHT+IFfOHu8NpwGY9QeJT4Px/nGS9JkxmRsI2hzwbDzfKKsDsEvu0wZdG1qPhsO1ljPGuw427Xyfg==
X-Received: by 2002:a05:600c:a012:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-43f2eb50f83mr65513485e9.12.1744375573083;
        Fri, 11 Apr 2025 05:46:13 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43ccd8sm1936648f8f.72.2025.04.11.05.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 05:46:12 -0700 (PDT)
Message-ID: <697dcd15-22de-46fa-b28b-0409dd18a79b@linaro.org>
Date: Fri, 11 Apr 2025 13:46:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] media: iris: Update CAPTURE format info based on
 OUTPUT format
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-2-acd258778bd6@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-2-acd258778bd6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 16:54, Dikshita Agarwal wrote:
> Update the width, height and buffer size of CAPTURE based on the
> resolution set to OUTPUT via VIDIOC_S_FMT. This is required to set the
> updated capture resolution to firmware when S_FMT is called only for
> OUTPUT.
> 
> Cc: stable@vger.kernel.org
> Fixes: b530b95de22c ("media: iris: implement s_fmt, g_fmt and try_fmt ioctls")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vdec.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 4143acedfc57..c5d85936b3ae 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -171,6 +171,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   		output_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
>   		output_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
>   
> +		/* Update capture format based on new ip w/h */
> +		output_fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
> +		output_fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
> +		inst->buffers[BUF_OUTPUT].size = iris_get_buffer_size(inst, BUF_OUTPUT);
> +
>   		inst->crop.left = 0;
>   		inst->crop.top = 0;
>   		inst->crop.width = f->fmt.pix_mp.width;
>


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

