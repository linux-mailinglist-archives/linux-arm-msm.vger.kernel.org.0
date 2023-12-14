Return-Path: <linux-arm-msm+bounces-4765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 039B48130D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 14:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B49912813E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 13:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C3C54BC8;
	Thu, 14 Dec 2023 13:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c/cZNQ2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D2118A
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 05:01:35 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bf8843a6fso598392e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 05:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702558894; x=1703163694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hEBNj87fP9250zui4T/Hvg1xpkDfzNZnKnVDxt1bMUY=;
        b=c/cZNQ2Z0vfSqTkKgxr6lG0OXRJajUMTqpoy7zJ3VvQkPKHDIDqROQqUXD/DNNhz3w
         soLa1tsM9s7HUvfzVaXAKPrbejdY68Kkvu5UCN4q6raPbwHXHAoNswcy6qnI+gHixg2k
         egNpuOllT5hdaPCMfhC1KHhi+cISA249t8amqu8M7/IIr+725/WJIfq6GkQXM7YLU0aR
         sgtp2msCe9hTpuKtrJIZCSbb0mHtqPcqIu5Vb3WxOM7hZzPKJCAFe50eYvXDkuXRx+u5
         Ma8Kk6H811winPIQ2eRrn3d7ZBV3J8eR/x9JzfJyTCHP3hv0W37GJ2uDQMu6pehIGeX+
         B8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702558894; x=1703163694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hEBNj87fP9250zui4T/Hvg1xpkDfzNZnKnVDxt1bMUY=;
        b=sly+thG/6g1nPpUBmZxjfG2I/m7rFR3AK7yo30qirWTkELiFdzI9T/NRo4IFFumAxf
         LEjNdNHmymeiha7woZyaeIICbG3wEUGDpzxWyPXs3p2CWTHzYtQD7zEegqGD5HyYzpQ/
         nzha3zo6lSePkx1CmkF4kWczHdvuUEHPcrCsujurYK2ZZCdHaehuxTveodLlvr86YgwG
         R6B803jSE8FfiM/ayHSunVvT6nOl2CBdU9/+VgFthb9yQGUIeyCesVqi9bf4czMNrdXV
         GgCUDmDxA2cetDcvkS53gQJVVcMWGl9KgF2oloBPxy2XdNurKuEPlOSm8JwusCMh2hxM
         1p/Q==
X-Gm-Message-State: AOJu0YzD0BGvPPSAuVHnpDEiJIdR18xF76Z9kW/gPbp9OQP9YtXnnoQ8
	9FVf+zqbSvvYJXGZXfN8jJGg50eLABhpHBqrhtV5DHVE
X-Google-Smtp-Source: AGHT+IHDwfUDUX4A8h+6BpYMmsxXIr+8mmt9c12FvptD9zihDInwN3uM8coAVGJ5D7hEzSztlmtQhw==
X-Received: by 2002:a05:6512:3ba6:b0:50b:e472:d825 with SMTP id g38-20020a0565123ba600b0050be472d825mr7069181lfv.20.1702558893836;
        Thu, 14 Dec 2023 05:01:33 -0800 (PST)
Received: from [172.30.204.158] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id m16-20020a056512115000b0050e1b9c6ff5sm34796lfg.265.2023.12.14.05.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 05:01:33 -0800 (PST)
Message-ID: <32a47aa9-4b4a-493d-879a-0cf3f7fe9c00@linaro.org>
Date: Thu, 14 Dec 2023 14:01:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: qcom: Fix ESI vector mask
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 andersson@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>
References: <20231214125532.55109-1-manivannan.sadhasivam@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231214125532.55109-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 12/14/23 13:55, Manivannan Sadhasivam wrote:
> While cleaning up the code to use ufshcd_rmwl() helper, the ESI vector mask
> was changed incorrectly. Fix it and also define a proper macro for the
> value together with FIELD_PREP().
> 
> Reported-by: Andrew Halaney <ahalaney@redhat.com>
> Fixes: 0e9f4375db1c ("scsi: ufs: qcom: Use ufshcd_rmwl() where applicable")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
Looks sound

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

