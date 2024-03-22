Return-Path: <linux-arm-msm+bounces-14828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB11886BCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 13:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A725628674E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 12:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002A73FB85;
	Fri, 22 Mar 2024 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOQXRbX5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB743F9DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711109035; cv=none; b=ggLYkvQVmAfhaYyMy+YFl9FLP6MC/A1YTGFo5d3YAMViYr5TYxcqR5nZd4DDi9sSBLPtl1ccVam6vAvIaAzXUFhgdQI3pnu+rbV6lMDA+8Hk+GfqsMjuln5lkf02DFharYopN/BIxuKbJS9/LSqixmzheZkCHUHiMXIChV8WNVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711109035; c=relaxed/simple;
	bh=Y4dOlSnG1mp5DbfHiWqcxPfv265KzC6b5wyQVWaCNIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lrfa+a5iJSihsd6eh5i5X/BKFcXlhqyIOamUW/ns/jWk70eUk0Is3kx40iK8KU3PVw6rrubfjelZRyDbuuWfVyrEPoczFOqHWpXm4Mm+sYuYS7+x5Rav37qfa1HSNbohhqbPAqhUmqHhQJyqU7ZADHfAFJ5nGVjalOz9yqKrvaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOQXRbX5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-341950a6c9aso1475242f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 05:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711109032; x=1711713832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rGs4qRI69HmirbYdoo/X0WlJUf5KRctON/6+5RBKAyA=;
        b=iOQXRbX5nYE9A7gw80/uhX9L4DBcmS9md42ehkCWPMaYeLnmpzi4j8eDTcC/6kpBOJ
         u1xz8zh0emOWb/pPDw0Qiufo8m1ww8mJsC4BGmYusxzmx/xOJUW9BUVy1nLaQBU039Mg
         4u1BanU+Br8YveaHoRBVerqK0VQAS+nTEp0iVDNA1bjdyhZv9Z9VN5ULtuciOpsMS7LM
         YkrFEM9rhE5rl+p848Rz1O08ZNtdjIi39xzlKk/1rxbi12G2t0MKw9PkSTR3UMdgCUjH
         /IRtPzBl3jc9E3gQQsuHbFWc6oarR6lAe9xGe+G8Vkrpo8BU+qpbK3O4cPS1+6K8C38k
         /g0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711109032; x=1711713832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGs4qRI69HmirbYdoo/X0WlJUf5KRctON/6+5RBKAyA=;
        b=wukWJo5lFmcYS1EHcfDfFa6G0KwZ5xJIHSDB3A7dq7yZrQ9MnX061POtADgVISkkif
         3SyQVpXDntcWpeY7e3WmSqortsk21GL5AJU/8e/lnCD6EZS+yT/26Cc5Ffmdzb28AStX
         Z/oOZTBbusOsv83+Eb9pqW6DNabEcWEzBsp0N9e+TlxmRbqXuOeOc+aDo2UhVMhWEMOU
         p4uZoWeJSDmUPUaSoXASiP8fJsedOWStISlz6frXiHyz+9JXt6o0hJ/sXzdI9WacSrBI
         4GWhZJCZNrJ/A0cqAcpqgwZgfWzaKm6vAvWDSrUqNL/ypoayh9HM0SAr/u7B5rBlWrXC
         cTvA==
X-Gm-Message-State: AOJu0YyI+vSSHXV+XEBallxdg28ZlPhob3c1amvLTC8Xm+A5+YZRrjAp
	w7rv3L64GKYBnl5lG4lySVcImoFXrt8y8Rdfhj6Rxs3+X9lecWaU/KqTcPW2/pY=
X-Google-Smtp-Source: AGHT+IFO/z/zCR8zDHG84NH9P3H6rTvXVlOBLgULqH1YZiOHMt0jBLPjjbcvbZO+VyY3d7hLuXaRhQ==
X-Received: by 2002:adf:fe4b:0:b0:33e:bb67:9596 with SMTP id m11-20020adffe4b000000b0033ebb679596mr1980258wrs.64.1711109032506;
        Fri, 22 Mar 2024 05:03:52 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id cl1-20020a5d5f01000000b00341b9737fc5sm891207wrb.96.2024.03.22.05.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 05:03:52 -0700 (PDT)
Message-ID: <30f71224-7340-4255-bd48-a96252985b15@linaro.org>
Date: Fri, 22 Mar 2024 12:03:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: describe HS signals
 properly
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
References: <20240322-typec-fix-sm8250-v1-0-1ac22b333ea9@linaro.org>
 <20240322-typec-fix-sm8250-v1-1-1ac22b333ea9@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240322-typec-fix-sm8250-v1-1-1ac22b333ea9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 11:58, Dmitry Baryshkov wrote:
> The OF graph should describe physical signals. There is no 'role switch'
> signal between Type-C connector and the DWC3 USB controller. Instead
> there is a HighSpeed signal lane between DWC3 controller and the USB-C
> connector. Rename endpoints in accordance to that (this follows the
> example lead by other plaforms, including QRB2210 RB1, QRB4210 RB2 and
> all PMIC GLINK platforms).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hmm

I think if you are going to change the name here, you should also do so here

grep role_switch arch/arm64/* -r | wc -l
54

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

