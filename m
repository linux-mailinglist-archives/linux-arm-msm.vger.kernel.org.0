Return-Path: <linux-arm-msm+bounces-14780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A0088631F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 23:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C25BF281D85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 22:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1244F13666D;
	Thu, 21 Mar 2024 22:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gq0n5LP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6526D132C37
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 22:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711059375; cv=none; b=Ki23q34AQFmN9H6U7fwe4KP7Cnxtko1MumWHLUx6K+SahgdRFRByXa5StQQp3xJOrgNzzF9rLj4YZJdLVMWDdRzq7viTlf4mT+Kyhza+osFo6Y2MV6fofmoiOudwMAUz00Qy62vyeRshklbXv3C1H4CjY9iIBv9Ls3+JBKbIrMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711059375; c=relaxed/simple;
	bh=T4gQUy6GE487NDr7K2Z8n60Xt0Mrnj2glineNFHELZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVKn/N7i+aakWXoRIyZZvZJfkavac0aYB8itGc4vOYoHjvTRifUFtBhOWXSHYKdZ9vbYRQm1RLyOhlK7nJ7bLMKmnpt/R2dbnQtxTurYJRBzgIr2gM5wgrYPfH7dTlH7eJj4r3+7RZGwAMPmFa5b64VHZC5BbumnEEBXDxsk6J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gq0n5LP4; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-513da1c1f26so1915047e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 15:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711059370; x=1711664170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l24MGdMtmEc55Y3D3O3L6cnTgOl07hyHW0ijrxfPF1o=;
        b=gq0n5LP4Ft7UgeAP9pzrzVf6mcFU2KZOTUdo79lM9DJTFjK0BqFS2pXXCFTel6RYNM
         ObPH/PAbLgrrlfJuZdCadDza9Fh0MtKg6UIrgOPHfwKqfRAw8oo2MjVvWfb02HFI5mZM
         iTiaH3YbbyolhTnBF/f2aDtERTTnnG7Y0XAXzTJmD8JEEuTynx6pE1V8c1tp92XmDDJ0
         iyvC2bd598DImo7FmQMz/z0VxjEnl6kitZGSDOUxwjfo4yfzifMgj3HyrCYQvK3arwn1
         4HctAfAHc0uNBba75rhONrmL7LQkuH2Jmu9CmYzMnoH/Ie/irK+/5P5we2fyeGu5JVgr
         jVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711059370; x=1711664170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l24MGdMtmEc55Y3D3O3L6cnTgOl07hyHW0ijrxfPF1o=;
        b=PsDVCbKHRa5dx42eJvrTra3eNoT0O4XNpeK539774fVosfVTSBQ6yQICA7D4LeJ+m9
         stZr6DNT7pjfCecBKjkK0yeqrJc8MOtWpvOz5WaXe8R7PJRpcEnKnKrZnfssH6t8BGqL
         jjAg3XYabuUL+D2DKAJXRZsvRtXsNol64jSq0NJ+1EVLVsu1r/OIX+kQCg+mXzTJkmvw
         Ib1J7nqTDcDDg0YXp9Zs5VvvJf6t+uXctCRk5zXBso92Gwf4yJpY+ECk+o4Fgzsf9pcx
         nSBoe9yBpjMudhIbNahKeqTdd/+6E5/+BLNsB7AAsTWhYYxdVDehAz1SJZVbqXOjS+BM
         5dyw==
X-Gm-Message-State: AOJu0Yw5v47o8w1wkQYxWP0LNhC38aaWpjpReC1lbLrjr61p64HVKNX9
	Dd/XWMDyfcDt+pdYS1lzUUenHcWffpPEQyus2B376sPaRREOdNVWtiHhX80e4tbVn6UKU5qkXf5
	H/fo=
X-Google-Smtp-Source: AGHT+IEJOeEtKpT8giAsQGkM9VfDOK2goDjgR9nWAd9qF+iBwbxHtXbzsfn5raJtcAv2looKI/KtpQ==
X-Received: by 2002:a19:5f4f:0:b0:513:26e7:1b13 with SMTP id a15-20020a195f4f000000b0051326e71b13mr374359lfj.14.1711059370203;
        Thu, 21 Mar 2024 15:16:10 -0700 (PDT)
Received: from ?IPV6:2a00:f41:1cd8:f7de:b242:8a9a:60a8:6758? ([2a00:f41:1cd8:f7de:b242:8a9a:60a8:6758])
        by smtp.gmail.com with ESMTPSA id cf36-20020a056512282400b0051596587421sm97211lfb.108.2024.03.21.15.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 15:16:09 -0700 (PDT)
Message-ID: <76cee9b9-36fe-44ee-ad05-bb90a79b809e@linaro.org>
Date: Thu, 21 Mar 2024 23:16:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINER: Split Qualcomm SoC and linux-arm-msm entries
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240319-maintainer-qcom-split-v1-1-735d975af2c2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240319-maintainer-qcom-split-v1-1-735d975af2c2@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/20/24 01:01, Bjorn Andersson wrote:
> The Qualcomm Support entry in MAINTAINERS has served the purpose of both
> defining the scope of the Qualcomm support, and to make Qualcomm-related
> patches show up on the linux-arm-msm mailing list.
> 
> While this continues to serve our needs, it occasionally do create
> confusion about the ownership.
> 
> Split the entry to clarify which components are maintained under the
> qcom-soc tree.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

