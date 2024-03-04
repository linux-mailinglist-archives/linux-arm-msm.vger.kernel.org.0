Return-Path: <linux-arm-msm+bounces-13284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E63BF8708D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 18:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2A58286EEC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 17:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05EA6217D;
	Mon,  4 Mar 2024 17:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsSDbITv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CCC62153
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 17:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709574976; cv=none; b=Zme3rEJ8cvFzsVOcxG4evned25Uw8Ndr1LwBlAsxPBXcnjXhOE0YzZ5NgauW/9XEmRANtbI3YO2pGe6QZFcHEi4QRFkkMs+4rAet5Iqk1QCyfjKyhyoRLuJ4Kq0XuUfH2Olw0URP6YvR+63gAzrV+vAJxAvm7pjtei0Eqm2uQwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709574976; c=relaxed/simple;
	bh=kkrPwbwq3HUb7dryDp5pAq3pLbLwY3Tp45E3kugU5S4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVGkSMvuOLf/JZ4LQL5kAeAv8NFX6kZqF81wotbdAkbVNixpYdo2wQ7asTjcaZgBx4joe9shExjZlkTVibAxzsatGVW0xxrWA7a93trum9R58oFSXnsBKXREVSNPM2UNISgf/73QBLRAM6bCAcjM2YFd0bTUgciE9qlLyzdUUSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsSDbITv; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d269b2ff48so55445641fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 09:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709574973; x=1710179773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SpMuUtqDP80mrn0s2WW+RwGSbgeBVA1YFpkb3uniFDs=;
        b=HsSDbITvd2kzOSNdUqqKHbPsGjnqSZF6ekdcbwrcct1ttzjf9Xqk3eibWmk5osW7DS
         vj5gHuGSoRt2jnIQeLtVN2+nlGIsl/x9B6z+65e4CpXTrAVZw+mZpOgO8WNy//mdzPUB
         YdP4mqPiz8H/CcbJaja+WzLOjVtKQmdr0in93a95tqsgVSAYP6DZabJo55AH/Rv7m6YA
         aPAObZnDlvwNH0r1iRJrlbqHlG53HOZjkEAIhJpWuAvKG3aPwBcEpvgQA+7NzSNS6Mu3
         rg/fA8OrcJBL5+15RFQzltmzZDaEAB05mmk+4N/hDrbZvzoXb6ITJNuCeE+BpGBR+POi
         Gzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709574973; x=1710179773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SpMuUtqDP80mrn0s2WW+RwGSbgeBVA1YFpkb3uniFDs=;
        b=aCAz87ENBSuWR/x2GD65pUDYiL9c6P8EskLOq3EwkyQa66THtbi0pBBPEuNwsXi5Gl
         SUzw4dF26FSQBGRx8WohSJImR0YPEXR7EPc20H35NltE4bAWxpp87sA3WIV2tiqvQjeK
         dIHITL7CfhwtS/hdAgzS4VLfXvD1aVIV+fs8XpfqXyps1rWRZxWXp+PomlgZYgXwZwt9
         B7+tIsYxaCkK3xdJGExlAJdPIoa6twnshK5lLghL+BAiq878SBilMgj00nmOyeoNXium
         8JLADg/Myi20FF7woDNrDiT8i3HypJ6ZfRw8T2AbnA2987K1HQLzB9V7horHCm3hB7nZ
         qgzg==
X-Gm-Message-State: AOJu0YxMOha8uDKYoQtdOKFzxEFdAadbJ5GLaFf9Mxs18c8unA8SYsFs
	dKYLa1OHQelzlExlVIcCmJE9VMumywB1YJJwhUPpCQwxyIgG3z5cBI/bB0iBY1hjZ6JJeNpGBSP
	MlJU=
X-Google-Smtp-Source: AGHT+IF7F4P8R+O9yUi9Koz60hPU30oDeTiJ5K3hVO7gXnUQSLl7GUgoL9GWXBIPe7Q1MyDmEDFxvg==
X-Received: by 2002:a05:651c:1a24:b0:2d3:a68a:9462 with SMTP id by36-20020a05651c1a2400b002d3a68a9462mr3761444ljb.20.1709574972936;
        Mon, 04 Mar 2024 09:56:12 -0800 (PST)
Received: from [172.30.204.149] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id bg12-20020a05651c0b8c00b002d3236a30bbsm1496732ljb.140.2024.03.04.09.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 09:56:12 -0800 (PST)
Message-ID: <c5abc503-2019-46d4-bbfd-8295bc0240fb@linaro.org>
Date: Mon, 4 Mar 2024 18:56:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 2/7] soc: qcom: qmi: add a way to remove running
 service
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
 <20240304-qcom-pd-mapper-v3-2-6858fa1ac1c8@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240304-qcom-pd-mapper-v3-2-6858fa1ac1c8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/4/24 18:03, Dmitry Baryshkov wrote:
> Add qmi_del_server(), a pair to qmi_add_server(), a way to remove
> running server from the QMI socket. This is e.g. necessary for
> pd-mapper, which needs to readd a server each time the DSP is started or
> stopped.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +
> +	list_for_each_entry_safe(svc, tmp, &qmi->services, list_node) {
> +		if (svc->service != service ||
> +		    svc->version != version ||
> +		    svc->instance != instance)
> +			continue;
> +
> +		qmi_send_del_server(qmi, svc);
> +		//list_del(&vc->list_node);
> +		//kfree(svc);

foo

Konrad

