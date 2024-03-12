Return-Path: <linux-arm-msm+bounces-13956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F5F879D07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 21:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBC5F1F22024
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 20:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2199D142913;
	Tue, 12 Mar 2024 20:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHeFOoCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C56382
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 20:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710275964; cv=none; b=PMLWb7ZMuB97yd2JVep37hcR5gGttfN0TI6H/sgeUm1FQ75Dwk3nndQdHr8OuYxS5YflZAlVnAviYNXJcsi9PeR85PKJyS2cF5x+SfOFCAxDu4GiJs2ks7FLK01bFnyvTkY/JYvkbJeCz2E+JD7oryrgM1vQt7Et1SmC51W2US8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710275964; c=relaxed/simple;
	bh=5dIIDioEedQVKeslk6sHdJ38vdna0ZniV+9gULNiGkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHGeuSX7sMYnTTLYgnVkjmsK7n5FgOj4kllhgm1tXWgV/QmTlWGuDOdTnrYESZ7ZOzK/5+Bt2ovxFe14TMPhJauIJJz80o1gT2NybOEa37FiCqntszCE5b5fKBpM7Ewuq/rOQKUIPVzHzgBHXyG9CqbgRnoxftV5sM2vfY5ados=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHeFOoCj; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5135486cfccso5848990e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 13:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710275960; x=1710880760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CMa9uy1xjyCYcVnS1D56e26rdhN3qgYq/HM1aZSyxxQ=;
        b=lHeFOoCjGC8/Tfqsq2br2WENzwrLFoVpP22rcFn6rXTxsmK40LPsDjvkbLsqTNLam+
         TA6lBccJGJ3g/sduCla++lLl/WOvYYGNLVU9JECtFFLWai6oo+xRiy5hpweAmz6F/+O7
         EjOgcz5y7Cma8sI8n2quE1MpTlLpH6SLeniwPPgRKi0ij53OYHZgkBo21MKsHSj4NPD9
         o0rBdH9Og0OVu/Ine7ydiTncXpgcZwhfy2/gnZDdFE1DaogQ4S3IHI5oLN549MnXet0T
         rVlAyqU3kzgKSiBwuRMiLMc/OO3un8kFIT9n9wbdvRxu+9KJlxl67IHE+627lYW50G7p
         KFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710275960; x=1710880760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMa9uy1xjyCYcVnS1D56e26rdhN3qgYq/HM1aZSyxxQ=;
        b=t2W40fs2L8P6khRJN9M2G6w6Iric8I9kxt9hMZIdUkAaMcJrf9mJ+XmXIm5D/zGUz2
         cQm84yZEan0v1lngBF49ldL6cZNpjBXGePszfD6TOdwVUCOEBcP2B4tVippsvZLgExOm
         Aip8bl/1vmJFk+kbRfCxtelX+1RUzqvK2NFnIjiyv373PXXVnZhfV2JVJmzYDUqdQNiD
         TbAJSJsQO+PUdeh0Rtqv/1pTtZBqdj58zhwIjmWktAATXKnCyqsmPeXiVVxNjwbFNxH3
         6aKXyvLzf2Ny7C6k6StoEPts/0QxzdjXn86QHy0Cn7ExgMSvB4dbp09yW7hVJzE7U6fF
         HOng==
X-Gm-Message-State: AOJu0YwL3MIgZMRYLGC/uDqbNUCgIwbMeWH8VnrOQ9EFHpvRHtS2g9rT
	4lmEDEMzLDJvq/PJ1j//Msb4YqwihHgOlD1OAj0202QTXHe2WIknsXT8OR06vPM=
X-Google-Smtp-Source: AGHT+IEFqnfYYAqbOkd1uofvkZfrQN9GSRLx/1bjUeXeGqTXRPEUXnzY5ruOC253oQHGieN3PO9JlA==
X-Received: by 2002:a05:6512:2f4:b0:513:2e60:a75b with SMTP id m20-20020a05651202f400b005132e60a75bmr7246874lfq.34.1710275960546;
        Tue, 12 Mar 2024 13:39:20 -0700 (PDT)
Received: from [172.30.204.193] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u14-20020a05651220ce00b00513a238039csm1426317lfr.287.2024.03.12.13.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 13:39:20 -0700 (PDT)
Message-ID: <a269a263-70fa-46a3-a7d1-31f369db4f05@linaro.org>
Date: Tue, 12 Mar 2024 21:39:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] media: qcom: camss: Add sc8280xp resources
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240222-b4-camss-sc8280xp-v6-0-0e0e6a2f8962@linaro.org>
 <20240222-b4-camss-sc8280xp-v6-4-0e0e6a2f8962@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240222-b4-camss-sc8280xp-v6-4-0e0e6a2f8962@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/22/24 18:17, Bryan O'Donoghue wrote:
> This commit describes the hardware layout for the sc8280xp for the
> following hardware blocks:
> 
> - 4 x VFE, 4 RDI per VFE
> - 4 x VFE Lite, 4 RDI per VFE
> - 4 x CSID
> - 4 x CSID Lite
> - 4 x CSI PHY
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

