Return-Path: <linux-arm-msm+bounces-19526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B00978C0484
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 20:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12626B27A4F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 18:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318C93F9C3;
	Wed,  8 May 2024 18:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RY6z9kKQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73757DF59
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 18:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715193602; cv=none; b=r5f1y8yLwNMTMyhp8kpOCUze4Tb45nP5w6mYNh1qAMcRfz4XPgUAGocIBW0sTxmEnXCZ1odzbfkKFJ2ZPc+UoDY7DAqPPxkW5x0E9qKeU6/+Fo2Ye4jH5P9zhX+Qxy8hp6iH1Vc7l5wzTVtQk5UqCr3Kz0jOmQp95f2NIcU2AFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715193602; c=relaxed/simple;
	bh=hoHi3AjYgp2H4mxjsiI6khkQzm1qsZ0lI7XMou4a9g0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y29fk7G/XbqBTbdtKyGZ7Wdl864/kO5dasr9B7jncv78ydqYcGEaSrvcJ7wsdfapO3UclrxrFNypaYNpXxkU8kjgu3bWh73oSpQSzX+EC3QKg7GC20ijIbZYrAThaMIyOoaR83O8kWZbC/0NOguPDFUMOQ2ZDl+vK3ov3tr4F4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RY6z9kKQ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51f0b6b682fso14425e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 11:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715193599; x=1715798399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PQ9I4ZgOvNPHMd1mVaqCXOzp4qB4tIGn/b7upIZyGwo=;
        b=RY6z9kKQwxLwYRv2NzS1AU+3qPK1yjj++z3Ig2AxRZKj8IaF2DWxaIrKuyGCA4ZkFW
         5NqyEKmHB7PaAyOt9mVIoM45Ok3gInZwzwY0/qWk2CDkonhKE0YqFctAJekOkQVKOODy
         DKTbdXPsmbvQUnOi6ughbbJDhIhCiMi3YsYPnZzT6fQMvcqaiLAzqU7cz2hsx4Y80f27
         AlzXwBfg8cyd+6ys18s/zvC7K5pxOgT24UcifX05OnLGkEf7r0q3uX6qKIYM++I/KQYX
         8algsV9iI0PCUh1dqO5vimWW9/q5qV1/ULKiq8/W5W5Lgq53OwCc8+p0OjXtQx804xey
         6rrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715193599; x=1715798399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PQ9I4ZgOvNPHMd1mVaqCXOzp4qB4tIGn/b7upIZyGwo=;
        b=CGc6HNprblm1p/xKVfcJlAl2RmFWeFDaXpsTtEZUSbLqjc8xtM4L6YrKu9Q5PCFUih
         6CGqa7QwhiDVwIELIyyR49KJUxil2K/WtaJzDQk3lIeXpZdn7q2TLXnuJnERmTiVF3/H
         aK0j25AeHdjh3GagVtriAqlGebhOKyLWOt7ie8JyolJp9JnzBQpxjrR3bG8byCpkVLLd
         3BHBneXwAu3pWmwwH3tsU0Peiu386pjwRJMpu78rkD/0vwd7LoLSVtW06mnAnH6wZhQt
         wI4//W0Pf0cgWFFAYa1B98oezARvPswwpgmC8g/nn9DD+s6zhvW5p6CibXxKW89XFuvS
         9KUw==
X-Forwarded-Encrypted: i=1; AJvYcCUAxuhChQQ5TEF1tKkcclHaWXSvonEtJVki74FB1yw0FWI2ge1xi7M38tHJbH6xnmCS+XG2hfQ0w/pPT3KRdFEoFFEe2QHs/VN820rYkQ==
X-Gm-Message-State: AOJu0YznOTOo35Beo4fNGdM9JEr0OBPTiUD72ZL2giq/Ipjxd847sYNI
	QGpZfbBU2mwZubj1qzMWe4knSPw+ktyMnVaNL82bOZ6hUAQ0nQiN3ddk3Wvc1So=
X-Google-Smtp-Source: AGHT+IFcKJO0kqjUVP3Onb+Gg2SFImiD+z8mGQ3L0TQ4exBwG5dLqQVdwkigSlwdxqTJ8W78ypgZYQ==
X-Received: by 2002:ac2:4e14:0:b0:51e:fb8d:796e with SMTP id 2adb3069b0e04-5217c372db5mr3607513e87.3.1715193598528;
        Wed, 08 May 2024 11:39:58 -0700 (PDT)
Received: from [172.30.204.208] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c6-20020a056512324600b0051b0f4e1b0dsm2619915lfr.276.2024.05.08.11.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 11:39:58 -0700 (PDT)
Message-ID: <0e898bff-6208-44a6-8ad7-1dd5856321c6@linaro.org>
Date: Wed, 8 May 2024 20:39:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sa8775p: mark ethernet devices
 as DMA-coherent
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andrew Halaney <ahalaney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20240507-mark_ethernet_devices_dma_coherent-v3-0-dbe70d0fa971@quicinc.com>
 <20240507-mark_ethernet_devices_dma_coherent-v3-1-dbe70d0fa971@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240507-mark_ethernet_devices_dma_coherent-v3-1-dbe70d0fa971@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/8/24 03:31, Sagar Cheluvegowda wrote:
> Ethernet devices are cache coherent, mark it as such in the dtsi.
> 
> Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
> Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

