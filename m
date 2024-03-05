Return-Path: <linux-arm-msm+bounces-13380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5643587294A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Mar 2024 22:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C8181F23167
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Mar 2024 21:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CB012B174;
	Tue,  5 Mar 2024 21:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KhMJjh1f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4524129A99
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Mar 2024 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709673553; cv=none; b=JZZ8BOlaSTwV4S+SDzyDHxmybJh0eOz823CyUCzXwqEvw0rMuWyqjWU3s/007oRpCFVClyj9gfNdpyuDbTgjIp3nsITyycvERDZzIpKFXP60aOCZiILTAMWFUKVLKuCWD8JNbGZgaq2xWof4tn83rCnOFwvzZXK/xjPzn96Ol04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709673553; c=relaxed/simple;
	bh=BJFDyvdTEMTW5MSbpMK871B8ihwn7AOJZYaiIQHZIxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfW34Q3oqZ531sWIa4IER15qa3vTJNsD+4oLX6Ai2oPubKERZYm+acPmW3JGFFWCEBNZulEE20SxnUpQM2E8QO8tvtiMSQjlb3HCgrGZw+z3NxLf8aKTVA8LZ9B3K5Zn9m0XPZlltj4OUazbr+G6hcBYWHUsyGJUSf+PY8RrGow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KhMJjh1f; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-512f3e75391so1234748e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Mar 2024 13:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709673549; x=1710278349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rx0dXZC0eo9mnWpqD7RaNvBESO2LzAYpoVOQUXDj5TM=;
        b=KhMJjh1fIu6Ye0R8yS3wrPAaLsIGyehJy2vLkSBndDfCxf/hvd/pzR8+/DrH6BXBqU
         +1yvoJNeGgtBmwq2OlMWAtTi0aO+KEh2Px+FgCHoVObJFTPLvHLJzq5EC7pmiPZ9OoxC
         /PNgqYhcA0JNAN4IjdzTaEI4XPD9SnIBJgsbVoAAudTCLT+WMi0TeNgm5Z5tDdREhlGx
         GIIQf6U53b30Q0AEH2ev8vxEn0ik9zEZQmsXASXTS09UFkw8haErRfyZFP9kix/TLp9C
         P8FgEyAqracIgHDMRQbK1k/EJc37zCmTnoK2jK2HymvP6Rf70HQtPcPtTJBX99LA4DfF
         +a0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709673549; x=1710278349;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rx0dXZC0eo9mnWpqD7RaNvBESO2LzAYpoVOQUXDj5TM=;
        b=pXpdoenTq+/VxsLzVPAOKjQohzm/KDKK/ckwJDmOhSxcjno9BPvFbXNvHtssWlJQ+H
         cMDnQ3Y6BHA2Ng0LOL3K+qmf4HY1/DT+egbJL9xZaMl3MfMJKLCn0vjTn7Mzcaiu+Ub/
         Z9kQZpuOqjJyRpc71+0glIfgXP2xRkoQGkhPFx1iZhh9W86OtWgmQN3+FxnrwLe6kQDF
         ZG3NBUg+3NT4SvCANf35lOi3zQ+RENmQJLNb3o9NsTJFuh8AxPK5L8i2+W3M0qgye1rN
         T7Qk17mTUSGV46A3jPFmNiypeDaXkJZ6vLtettQ+26CItDe/6PmYsRmZfP1dspgENn6W
         yaZg==
X-Forwarded-Encrypted: i=1; AJvYcCWJePLV96utfutxQU/foGBqenTmJboESBz6aiwwCWK7UsBNYyzugshFWvuT33gSAE3R5yYKCOkO002VFdLb85TRBteVoAcQOtnFEu84Ww==
X-Gm-Message-State: AOJu0Yykxh9h8B9eWbWJIr3kw8VvhqhHgzLsZHhXYF6vFg7mAVmvoFPd
	Q0BegU6Pau4963NPlcoCRbcQQ66TzMgq1bjUzxFBssPdlFvrW29VaGpjIzn2yeA=
X-Google-Smtp-Source: AGHT+IGEpTYRkNLmD7fnHi70eyo0sSY88oYVLPgLJn7LSx5tVyosvtZnPjCHcH2gKOSCl+aDVEqsTA==
X-Received: by 2002:a05:6512:3b10:b0:513:4a0c:b6e1 with SMTP id f16-20020a0565123b1000b005134a0cb6e1mr2677590lfv.62.1709673549109;
        Tue, 05 Mar 2024 13:19:09 -0800 (PST)
Received: from [172.30.204.154] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f14-20020a0565123b0e00b0051326e76ac5sm2245658lfv.306.2024.03.05.13.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 13:19:08 -0800 (PST)
Message-ID: <8dbcd393-580b-4c29-9d6f-42988a5e7655@linaro.org>
Date: Tue, 5 Mar 2024 22:19:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] slimbus: qcom-ngd-ctrl: Add timeout for wait operation
Content-Language: en-US
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
 quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com
References: <20240304134228.16627-1-quic_vdadhani@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240304134228.16627-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/4/24 14:42, Viken Dadhaniya wrote:
> In current driver qcom_slim_ngd_up_worker() indefinitely
> waiting for ctrl->qmi_up completion object. This is
> resulting in workqueue lockup on Kthread.
> 
> Added wait_for_completion_interruptible_timeout to
> allow the thread to wait for specific timeout period and
> bail out instead waiting infinitely.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---

Fixes: a899d324863a ("slimbus: qcom-ngd-ctrl: add Sub System Restart support")
Cc: stable@vger.kernel.org

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

>   drivers/slimbus/qcom-ngd-ctrl.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index efeba8275a66..c27076d8b7db 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -83,6 +83,7 @@
>   
>   #define QCOM_SLIM_NGD_AUTOSUSPEND	MSEC_PER_SEC
>   #define SLIM_RX_MSGQ_TIMEOUT_VAL	0x10000
> +#define SLIM_QMI_TIMEOUT_MS		1000

This could be inlined instead

Konrad

