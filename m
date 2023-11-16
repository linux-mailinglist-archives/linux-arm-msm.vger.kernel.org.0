Return-Path: <linux-arm-msm+bounces-812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE7B7EE3DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 16:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A3E81C2083A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 15:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFB42FC5F;
	Thu, 16 Nov 2023 15:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wcRQS4J4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7119ED4E
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 07:05:20 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507a5f2193bso980047e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 07:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700147118; x=1700751918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T8ztruwTEzNqGhDwNxN4hXW3N9Yo9g8CNvr+Y4z6O+k=;
        b=wcRQS4J4mXukG+NgrAqu3gF/dCLAXWRVykRjT3a0vq1Sue6ye9VEl0prJmlZJJpdTy
         mHuHhgNXGJ2mtGRgLehALAP/oD4o+IkjSXlGz0GRPK+EiZdfkcRlLEcRU+4d1Exg6zU9
         y+1zvxEaJi6GaLeLCgXmOIV71yldeG37P/6Sc+mWxBycBwYKUrKGB/SiSxDNQ/ukVLVI
         1/yj0I3/FTFLzV4MuWFmSCIZJM0u9lS8QW89LKGhn5mrC416nsqNEUfxdPipgjTnMpB+
         qqESvOV/Y5jdfUyrFCxBYwg7MlfZ5H9NO7lAZ42avXUoGjj+AwWGDwfprM2pphOA9fYP
         jvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700147118; x=1700751918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8ztruwTEzNqGhDwNxN4hXW3N9Yo9g8CNvr+Y4z6O+k=;
        b=XxJWegALknd8+q7nQE6Gs4TJPGwPFpH6TB0xGG86mXD2XNmBzhVBIEjeEnRusQ8r+Q
         8agNBhA/LkW3H1CTIfKEB4B1nuXYF4rmAxFlVqI7vojqXgn+muRQMlEROU9JhBxnBjmR
         apYv+l8OxTdjV8UYxFh9Uxe8JPKcCeZJEYZ8zgraCUUFBTk6k2/arDxRiXtEiOnjn6/3
         1abTeKmJM+aTc0fsz8+aPUjl+bWCm+ckdAuxf7+CIvdD4t+sKlgqtY82yFMULsn8azDE
         HyCs8S6ffPtMNJL/ulO7LiAgZ6qBF5pk6Qf495Wt37QlUSo3U7L/GpPiqTsjlm7a+SFo
         0qVw==
X-Gm-Message-State: AOJu0YzYjKXt9peZ++IXjoxAt+QKO7Apa/tec2Kwjx6PxEce9iHN5ZD+
	eC/vMrYIj+43s69EScBijJ36sQ==
X-Google-Smtp-Source: AGHT+IGgtkvKHvRCkcC8IvrfG4Jr4Gtm0TsvyhM0PmD5yiJB/6F8c0YaysiX6wR5ayIUsM/MoVqACg==
X-Received: by 2002:ac2:4117:0:b0:501:b929:48af with SMTP id b23-20020ac24117000000b00501b92948afmr780178lfi.34.1700147118541;
        Thu, 16 Nov 2023 07:05:18 -0800 (PST)
Received: from [172.30.204.128] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id b13-20020ac247ed000000b0050a3e7e718dsm19556lfp.189.2023.11.16.07.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 07:05:18 -0800 (PST)
Message-ID: <0f618da5-e742-4c0c-908c-1d37ff90a3ba@linaro.org>
Date: Thu, 16 Nov 2023 16:05:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/4] clk: qcom: Add ECPRICC driver support for QDU1000
 and QRU1000
Content-Language: en-US
To: Imran Shaik <quic_imrashai@quicinc.com>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20231106103027.3988871-1-quic_imrashai@quicinc.com>
 <20231106103027.3988871-4-quic_imrashai@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231106103027.3988871-4-quic_imrashai@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/6/23 11:30, Imran Shaik wrote:
> Add ECPRI Clock Controller (ECPRICC) support for QDU1000 and QRU1000 SoCs.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
[...]

> +/* 700 MHz configuration */
> +static struct alpha_pll_config ecpri_cc_pll0_config = {
const

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

