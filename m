Return-Path: <linux-arm-msm+bounces-13885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BE1878C0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 01:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 812011F228E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 00:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9440A847E;
	Tue, 12 Mar 2024 00:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dR/g//lj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9AD79C0
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 00:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710204823; cv=none; b=RxFLx2+ejApnuDASbuNymv2Y1734l2E3zR0Oi0Sa+xgwqRtHA58N2fD0bolH9/tNypvVcCDoOwWgjxHiXM4z5dVoEJxn2xM0TWOy6cEvt9yWZZa0YVjD9WEVuTu5efXkrmlHEl9s4SDSRbjAA0mfljQjG9QlOV+Z5joSmKgZq5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710204823; c=relaxed/simple;
	bh=HRl+KVp0V0W00QnN93JM9gLDCTRYitW5LllqOJBHdp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDD1d/CUFHszfZ3X3r5JqXI5a5tcKZMqBKcqPaAFdw2RJeG33eaXlPBQNvd/CAb8SUZKYLuL/4M9dh6THeHoY2dQLpj1TSbDpvciMWwoFb24DIcga3Lpx8RjxmtYzLW8kP/A3iBb/y9U7px8PFTZxOf871nH0PcU70RMpyVAiwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dR/g//lj; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5133bd7eb47so5973279e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 17:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710204820; x=1710809620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ljQX1YTQSh3VKU8MEyaNfB4gAsQnxEN54+xmiuLiaNk=;
        b=dR/g//ljMq8GOHIBPA6rIykSMQe/6kj/XW47UTVqqkeKlVLv9wVDYMHaE7mp02PkfX
         YxnOxoloMEtoT1Jai5/pG4XbCwaHigyczj71SepvWrgU/RgbEusNkQGmd7wvhUjygW6o
         LkpNDx6VCf0ei2ZIFdNb+J46+rlS4YscJt3HpqnZRlHdhKEksbqFhkHCUOSdiD1AmaS4
         0SAYYD3rJcjK3J4S1rIsyEcwKWn45HwKv5hbhn+KnENtQl1nWYptFaJQ2ZzSp4X9AbwD
         Q0X0mZG0b3h2zlfogKnJGGgTWHk9Js8l7rPe08y/1J3KVlZVZ/+/SQeHpodhz1s77//z
         m9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710204820; x=1710809620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljQX1YTQSh3VKU8MEyaNfB4gAsQnxEN54+xmiuLiaNk=;
        b=ewZ8ykcFu52Fhxje8JpevAYO+q+4NRYdMWK0uvPXZJnIAi2fKlRpwHWlUQK8n8V2zc
         FzbwdI6AFF2NOeRblbkp4M5r2W+kWDOVBOVj5/OEIYLiycjv5yjIUAm73NvjXIuDUp1d
         +tthxVjKjPVmVAdPtAUVMXlQ4wtHxHm694eRSXNfmWj7nuvrwi+dVaM7cMtMxauJQc/K
         5z3y+ImNQvVTtkfMKrMq24Q/2Tq4idyPxBlCluydpfGE7xPV39Kqi+R0Mqvx3VwRak1l
         1SEGx+LG87A5qj+p0N/vOjQGsoeDnLZxuoq6Cz0cONf4PolgBbAJBKwFLY2BbGIPuvvi
         nGKQ==
X-Gm-Message-State: AOJu0Yza47fS/9keryWfqLN/2s3ftryWSpzUjF8FIwSe5m+3BPIOzUnf
	mwVQ0LXjcwJACqb373yZJ3Lq55T7+oQbzwOxTIN97h8JTKX7xiG65hV6ZLCYyEo=
X-Google-Smtp-Source: AGHT+IFM2aYEoFHW0oVsIIOzTHbHVIFlb/dMl6fv0ZI94Akk4cg4Qxa3bhfGPq/jmnTcvXUOmS/3Hg==
X-Received: by 2002:a19:ca19:0:b0:513:5a3c:e8cc with SMTP id a25-20020a19ca19000000b005135a3ce8ccmr4439914lfg.19.1710204820104;
        Mon, 11 Mar 2024 17:53:40 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id i26-20020a198c5a000000b00513177e424csm1363399lfj.168.2024.03.11.17.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 17:53:39 -0700 (PDT)
Message-ID: <05b640a9-c5e4-4140-95dd-9b35269d85cd@linaro.org>
Date: Tue, 12 Mar 2024 01:53:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] soc: qcom: qmi: add a way to remove running
 service
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-2-24679cca5c24@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240311-qcom-pd-mapper-v4-2-24679cca5c24@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/11/24 16:34, Dmitry Baryshkov wrote:
> Add qmi_del_server(), a pair to qmi_add_server(), a way to remove
> running server from the QMI socket. This is e.g. necessary for
> pd-mapper, which needs to readd a server each time the DSP is started or
> stopped.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/soc/qcom/qmi_interface.c | 67 ++++++++++++++++++++++++++++++++++++++++
>   include/linux/soc/qcom/qmi.h     |  2 ++
>   2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
> index bb98b06e87f8..18ff2015c682 100644
> --- a/drivers/soc/qcom/qmi_interface.c
> +++ b/drivers/soc/qcom/qmi_interface.c
> @@ -289,6 +289,73 @@ int qmi_add_server(struct qmi_handle *qmi, unsigned int service,
>   }
>   EXPORT_SYMBOL_GPL(qmi_add_server);
>   
> +static void qmi_send_del_server(struct qmi_handle *qmi, struct qmi_service *svc)
> +{
> +	struct qrtr_ctrl_pkt pkt;
> +	struct sockaddr_qrtr sq;
> +	struct msghdr msg = { };
> +	struct kvec iv = { &pkt, sizeof(pkt) };
> +	int ret;
> +
> +	memset(&pkt, 0, sizeof(pkt));

0-init instead?

> +	pkt.cmd = cpu_to_le32(QRTR_TYPE_DEL_SERVER);
> +	pkt.server.service = cpu_to_le32(svc->service);
> +	pkt.server.instance = cpu_to_le32(svc->version | svc->instance << 8);
> +	pkt.server.node = cpu_to_le32(qmi->sq.sq_node);
> +	pkt.server.port = cpu_to_le32(qmi->sq.sq_port);

Or perhaps C99-init?

Konrad

