Return-Path: <linux-arm-msm+bounces-21273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 403FB8D62E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6EBE1F23A7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 13:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3FC158A1D;
	Fri, 31 May 2024 13:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PVRjEy7Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF6B76026
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717161824; cv=none; b=WLperxHqaheF4OJbqVEn6zX+sPCoQSub8OhiJSZGnq0oYEiDmwbeFxDtMvrrgI4wG4pY4ZkTwaSR3btxnJ0y/H5Z6+BGH5oPmLnlqoDjwVDbYd5NxZgH2S3ds4FpS45C8czMoneaZMeD629d8qwPtVKcSkcmE7l2/3ox+WbYOmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717161824; c=relaxed/simple;
	bh=J/5xarbHmKs23PKC0G8SvwPDfV57tQoEsVg0PBA7W6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KZ4/HJPq9yXaAZIPU3oeceEAF41tsDUkK56kVGR6UguaKWqLh5k+W5EE5bAVqkc9GHTEqJvPsPi7cR5oCSq9vOpoV9OpO7zrC/eZmvHmcpHBtXTmCuBpwlesUC/ln13pOuTj17168o5KP0r4+hW0CNz47kYQAQWFerNLSuwPHBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PVRjEy7Z; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-578517c7ae9so2211614a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717161821; x=1717766621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eOa5yFH0/hR29lSG2WYAF7/povnjbX5ZLlqA4ovF7HE=;
        b=PVRjEy7Zleys/VXKFHqeJjXK4sNB/UPQM5f9YbXjT4dI3rbYxih+McmBe0KlGxzk+n
         BWYkD6OUViZgL21OPT3RVxDiobO4fWalSyEuvCY3d7T5Vnma7x4CzN5kNqwu4W0fJRE1
         PTD8QyheeYCqXaXOWXZCF1Ra6WJnl+SN6p+YwJ9OInLKCFqIR9YSXsDRy909XPcFoK6T
         Pmu6US10H9iwxlmna7q6tRobMUndz6QGFagU5yyji5hNBjhBk8AAmMgUp1ddcQrxLPjY
         FtR69NtZI2r8TzGlCA5N9cHBAFoDmnPjTJo4H9qdUoeGa/B3r/2EcBmAJv8th4u9q4EA
         AQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717161821; x=1717766621;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOa5yFH0/hR29lSG2WYAF7/povnjbX5ZLlqA4ovF7HE=;
        b=lVE2NjgDyIMKXjCNytSRSo6WsWcJ4KcG+vwXzQ/5t/9wCJ7QpuYo3Ajv0xG8esTW+5
         Xd9pbBppRWk4qLxTwMc00kcZc006dj7AMsYAMC78hOO93TfvIASygUnUUeOY48NLrvsK
         dHjOSpXRAqrryCXjsqsDEpumdYGbIqsuzEXjIu2eIFPOueWtGGaoiX3PATiWFs3o4BrH
         RDEvEC858N8PCha6L+fTaZOsDhgEcaHS4zYfMklDg8w8UtHsgKZp3JLP94Tu/w3IB2wH
         OWNdd2tAd/Kl0N2tExD9UadbKKLyBrkeYV5m+28FqhouzyRL9+TZ//NgkJ7Q9vA7iikv
         mYnA==
X-Gm-Message-State: AOJu0Yzn/+0qWi1DvCouHrdRDxnVRMyOmndpLYibLWiabzUo5uPBfAkU
	jTMGRX98cpA6MBbpaXgZ7foDITXkLGfJMdfPQEvIUKieM9Ga9YAs1ABE4+hsCTU=
X-Google-Smtp-Source: AGHT+IFJSsR7mUw69xQl/kktYJpUkc+X/0SK8XPc2Bv2Zo9tmbdkLxz23s5OW+k4/XgihhEvkA5HpQ==
X-Received: by 2002:a17:906:2509:b0:a63:4e95:5639 with SMTP id a640c23a62f3a-a6821d64767mr118620766b.47.1717161821417;
        Fri, 31 May 2024 06:23:41 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67eb34432fsm86771166b.193.2024.05.31.06.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 06:23:40 -0700 (PDT)
Message-ID: <b053edd8-2b85-4a32-ae99-c656f0b32e5a@linaro.org>
Date: Fri, 31 May 2024 15:23:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] clk: qcom: gpucc-sa8775p: Update wait_val fields
 for GPU GDSC's
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, quic_jkona@quicinc.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-7-quic_tdas@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240531090249.10293-7-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.05.2024 11:02 AM, Taniya Das wrote:
> Update wait_val fields as per the default hardware values of the GDSC as
> otherwise it would lead to GDSC FSM state stuck causing power on/off
> failures of the GSDC.
> 
> Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Without having a good source to check the values:

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

