Return-Path: <linux-arm-msm+bounces-23472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B58C9115D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 00:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74D121C20B8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9085B7E563;
	Thu, 20 Jun 2024 22:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A6TDDorv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9D45FEE4
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 22:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718923668; cv=none; b=pTEAVXzIdwak6rhvCG06pMxNmyiPVyLBV0Ix3h0ukHXaAMBjb24xfcWvjEA1/VV2ITK2VSQVGLg7iKH0YLtsfFgUuVohgK7aMkDF3Y3GmeQS4xu3S7pFrpeYZDUluDhqpdwjZHwzijUdOGBCjdZJFOy6nmLWRVQTQhyBkZnzhTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718923668; c=relaxed/simple;
	bh=N7791Drbbolvz/Zi4CEkZ0XIrcd/Ukk3RAfAstpZLV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvDyaiY1H9naG13tsn6HPHKhMVaVVpmlq2cFpJHeEVygtCRw7Lzf3jpgqq37ozDK6zLjHjj1TurKmMpcHUglvwztDEEvyKInSPCN+/EtvkLgyC/kQs/y3rRfqdFmPQ0DzUr9D7WZL/1pWwmFKkuYzJHRL3T66MSDUAuXCeEO48E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A6TDDorv; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6f1c4800easo152557566b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 15:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718923664; x=1719528464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4I073d0BTX95Go5STXxxrqm3YTQm7wdPzYcykgxi0es=;
        b=A6TDDorvlQWugQVQo2/tWnvWH/7QiAxEs8bs4qfEbAU3MeldtJNr8YGeYAntf9iMrG
         eCjDPZcBLTDZZbEYQEL62ZPo/1z/foxr/pAH9rdagtXj/ILi8nO47tKnUfH+DBpAzPhy
         hgO3FDUt4GiHGwBnEmsMjCbEkHduLreEFI3M/jpbWDRweL2+wjUrxsz8EI5PcppNCoCn
         nDR3/PGuXdGaZqyd/uUAuESow8kKZuM0NL21x37Km/b3mT6opgXY2f4GwbGPogvjj81I
         bRZ5H7C0JXd/ossjTiDdv1B/vf52hXR1DIOYdujAbFu+be8OKeNrSwQCA++3tCzUA6By
         aVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718923664; x=1719528464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4I073d0BTX95Go5STXxxrqm3YTQm7wdPzYcykgxi0es=;
        b=bOIy7/Hc0fG4uJYPkwjmE+Npxzx8k0yFqrTS5NNJ0lDdxMay9qrpBbTt+FOzts3yUX
         be0NGAJpEfK28whb+av4XgDqIDP2CitYUaMeQ/1wKrRl/NN+7EU1ccQo+M9bzvNVzQhx
         54JE/zeoqe/R+t6LCt6vm/SZOJM1XPA4j6wGnz8xtZBO6k23BrJz8uSSVKCQ5kaL5qTA
         +0FVHmkYNj9gSf2q6L468DVqjKQWrm0iHin7GKQVFwCVh9aj6TcQWh+RMjTNg/ibiO+O
         KrnzePXCi2ACbLuvbCFcyfY6LZe0QET9cfbhkUxyImVEjVBRy5vfE+u96jL/DJsnq1Wr
         o87Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdVmj1ofGMgJTFjorvf/cC2WQhTKkHfjXJ+Vg0tzitTsifc8LCO3GQ1sb6RYsLKjKmdHUt+H3PKrMxSwZ8kcSNkI4cOZ+WYY/tqU3/tA==
X-Gm-Message-State: AOJu0YziOSjmXR+WJMTpzhyaA+ws9XeFoWaQpI+r2WVcgbLKAxym7mBZ
	VwTw5Q5rJ/nr79yqytif4o1O4MnTMlgHRf6Gl3byMkbO9cfygAyXByCQs+RXu+Y=
X-Google-Smtp-Source: AGHT+IHmD+Gya/nhlhxOrWtEB0hFxetdUkl4tZxvwdn9QG78XjNenK5hvKKgWCxgXbZXFjeg6GZ8WQ==
X-Received: by 2002:a17:907:cb81:b0:a6f:af8e:b76d with SMTP id a640c23a62f3a-a6faf8ec937mr336001266b.49.1718923664033;
        Thu, 20 Jun 2024 15:47:44 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9090:3594:c427:be6a:c9:3e84? ([2a00:f41:9090:3594:c427:be6a:c9:3e84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf48b38esm17300266b.79.2024.06.20.15.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 15:47:43 -0700 (PDT)
Message-ID: <717ee43e-41f5-4940-b404-c348812c84c9@linaro.org>
Date: Fri, 21 Jun 2024 00:47:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
 <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr>
 <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
 <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/20/24 20:24, Dmitry Baryshkov wrote:
> On Thu, 20 Jun 2024 at 20:32, Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Thu, May 30, 2024 at 2:48 AM Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>>>
>>> On 16/05/2024 10:43, Marijn Suijten wrote:
>>>
>>>> On 2024-05-15 17:09:02, Marc Gonzalez wrote:
>>>>
>>>>> When create_address_space() fails (e.g. when smmu node is disabled)
>>
>> Note that smmu support is going to become a hard dependency with the
>> drm_gpuvm/VM_BIND conversion.. which I think means we should never get
>> far enough to hit this error path..
> 
> Does that mean that we will lose GPU support on  MSM8974?

Yeah, that was brought up on #freedreno some time ago

Konrad

