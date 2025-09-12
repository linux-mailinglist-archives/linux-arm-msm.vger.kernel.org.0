Return-Path: <linux-arm-msm+bounces-73291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C24B5491A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C8644818A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957C82EC554;
	Fri, 12 Sep 2025 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sPjzKbxB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0C02EC547
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671989; cv=none; b=vD7Kw1Xy8pkMNC6JZf+9a36bpryu8K6MFeIoRT4ubVKr1TtvJ4XGn3r6Y22mAriFeILy70jnHRDRMtdbxgeXzD11wmL01pZCCqOd8EsI4Z3uSExJPqnBVBypabugDDqjxX5fxpGStaTzRMiovjLm7GWbgvNMqcc9442qTkIrIpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671989; c=relaxed/simple;
	bh=X6t16wMfNguzOH1YS0pAbwIHjWds1uPx3polU7pfZS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=noDyBr6MOmDAHhLvL24UOLakVUmlTPcIOCpHnEri/ganHQpJizzhQqAIfbx13V1WidCHC6O00s04wK0b144qPI1h41uUUW6ZFQfJRw4cn+fqr4yQfqlo1CV8PGe8GSQki2oAbvF7K2X6swxL8uSik6fLXjPje7qEzNoMD/k+3UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sPjzKbxB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e7512c8669so1224517f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757671985; x=1758276785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ogrvh4x3WIFqZnyWHHbCEFIhgIBr8KAgDXVdkxwiS4=;
        b=sPjzKbxBPoWT9xYk/dugSRJSiQgzFYpnANPISWpf4SSM3bZLG8lgWmjI+cVt3U+FiF
         ykMrnjsRPSnFyM/QGdT+Ur7VJW0X118fCSGBt07nfAdzDEyGM1oh2wPt+r5Knmg3s8OT
         jHiKv+mLRXYqVLonsAATvAFTmkiTFdSr0sN75cE3yISI0LhJwfaZapVB9XNzGJX/NkSZ
         WmE993zvxZbb8s3YtEZJ3tLeadmNbvdUbuTsNHgVhzJCH7TOf0/Uwwa0cDtW6A4L8WqY
         B+IfIGSYvLZobjBopQ4XupdBdfpmoJ8pIwcqYeJGjC4dRBFlM/eVr+rBpCeJoxmhysbg
         iBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671985; x=1758276785;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ogrvh4x3WIFqZnyWHHbCEFIhgIBr8KAgDXVdkxwiS4=;
        b=uScajmrsJvceyQVRLzfsuuHrNntCwJtXDcjYPldpUkMPUnNvJDWMLIep6ACd14utxw
         Nxp9BvC1fXETEojAWxK6h6Xbw0+QNq0FWGC72weHyib9c/c6FDP4+gNkUTrWB7y+15RI
         6PqX8C4HEgUi4Nd/IoG2GoVs1Sh2y4x2eOgdSQpslJx0JlLwLkPKLX/DrdwFr/Wy52Gm
         rVPl1EF+R3jKsCmC5Ok5z9vZjcJlrG2jwF0vwhj/odvlU5spaSMXYpVibUGoXcBiA6Zq
         ruLJp0E8ffW/B+yzFvnpfLRXTAo0SYbX3hlb0ldhwGvSDF11DmOgyt2d44MGlTvbwyHU
         mZRw==
X-Forwarded-Encrypted: i=1; AJvYcCUX1BPXVUonRpwidfuKTQt0D53msfGuGoyrRrpANQdEKIaY8GgIPmb4zwjgu8vqMyNwRQ7b7zzOfPHsO4h6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2VyFiEpuzCYW6MevXW0rirelzHF78swIVM0lR2tNX1UPo8wLo
	mexjKi2YXmsPnJmcCdP6gLBZbQ/FbhaMfnW9XpzYYu/8xSMgWeiEaUhQHZp1cu79Mjw=
X-Gm-Gg: ASbGncvKuWIvvZWTtYSmJjbgx9DzpLApbhrzsIU2eJVn+x7tIyDd6q/u3M8djnWKDK5
	BbjPrKsvXQVMZBP6SER5pF5EKFsX/J7XAaPWY/oKQX0wZBJMFxdX2/R2okTIVzEJnGB4LI+x1ik
	27xtVDKO3QmhFa9MVbKUYLmSzE6n7FjpkswZGLroMM6uwI8szTy5F63iUFlGpYBzq3Y/XU3t6V9
	hRKPIT+0t8UuMK8uRolvMDz6kzQrr92+WfX8vdN2pL7ETyZkmwOVY5xqwkrLJzGkSLlU+65co7r
	nYtJZFf4wCIYpyslgBO1gdIpJzmU0fHIIHgqwTp41oKmfpwCgQ2+WAoZIDlBJjzC66KJexwX0oa
	YuWqUch5ovB0y0sLZ/t+v2cA0dGO6THyFchzWVoQotCPPu8YclEW3fLPf+pGFTE4pM8NaQPaKIH
	yjjs1uKVnMTpdKanYWq3OdN93OmZD3Pw==
X-Google-Smtp-Source: AGHT+IH1zom6LPRnNBHMonuIQJ/D9nKfSF3IDdc+LGoQK8bZbXWpZodVhbfY3TzofC5JKbf7Hu0Gpw==
X-Received: by 2002:a05:6000:270e:b0:3e7:9d76:beb5 with SMTP id ffacd0b85a97d-3e79d76c25emr549344f8f.14.1757671985367;
        Fri, 12 Sep 2025 03:13:05 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76078fe3bsm5975071f8f.28.2025.09.12.03.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 03:13:04 -0700 (PDT)
Message-ID: <bf54b526-2dc6-46f4-968c-9a00f43b569a@linaro.org>
Date: Fri, 12 Sep 2025 11:13:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: camcc-sdm845: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <QzAPOBSJJ2DSDLJ71RGr_7pAbeHb7IIdtAj1wpI5h7rfCYIQw13c4RjvXdAy3N0lrJdhgkyQJYIRS4Pc7_di3w==@protonmail.internalid>
 <20250911011218.861322-4-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250911011218.861322-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2025 02:12, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SDM845 camera clock controller, and it should include
> IPE0/1 and BPS ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sdm845.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
> index cf60e8dd292a..fb313da7165b 100644
> --- a/drivers/clk/qcom/camcc-sdm845.c
> +++ b/drivers/clk/qcom/camcc-sdm845.c
> @@ -1543,6 +1543,7 @@ static struct gdsc bps_gdsc = {
>   		.name = "bps_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -1552,6 +1553,7 @@ static struct gdsc ipe_0_gdsc = {
>   		.name = "ipe_0_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -1561,6 +1563,7 @@ static struct gdsc ipe_1_gdsc = {
>   		.name = "ipe_1_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> --
> 2.49.0
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

