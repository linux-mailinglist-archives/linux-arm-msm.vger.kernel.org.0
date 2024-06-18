Return-Path: <linux-arm-msm+bounces-23095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A3690D5AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FD3C1F23B4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B55B16631B;
	Tue, 18 Jun 2024 14:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OT+sZ6GX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDB816DC3F
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718720888; cv=none; b=YaTjy7srwy3rrLepDJhXXYlijiZXru1J369b1UxHWBDM6gwSoJ2AtshjfPviAvAb8L19vE8/Fu+1i0e6i1YXX+l8GldtbVO8EKwRqBcYro6xNHjZKdwgCftBLT6qBePxNJ3lJrp8p2OnK75a35aK/6oWqoIQhsasqxTNZ+Xx01k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718720888; c=relaxed/simple;
	bh=NNNRuGLddPKeM9Yh5xEuTsi+jatuPGGFxwB3SSxir1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0lQEeeskNusa4ej6PJBFL6jAP3dD9U2twH8Q4oshFWtW4At+Sq6SWNXB/OcGQVHCqLlqZ78nfzsJZUAftVFI7BeIpBH2aBkIlHEvpF01hoOrAFYbSOEYhc2+aw2D+UnSD+/M0UVBBVCj8ARvVqVvsInYP3FjZBSt/mm21cft9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OT+sZ6GX; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52c4b92c09bso7106478e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 07:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718720885; x=1719325685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K1oD9cAlhoFUpaJXK/MI3nR3DbJ14JaglZi8r1oHsa4=;
        b=OT+sZ6GXLh/YFfkUTPPlUwL3ecHLBl6M5/KK/e6H8qKr3rmBTRDf2S3oYfC+1wMK5U
         vmzs87hybPTaYLZKe2YlsCw/ruxlpyckz4v5j+htU+9usoI8xWilLt1rCY59eXOwjLKY
         id6kxEl3wcK18SLLPwiRyw8uGAs+6E0qI7loYtuW4A9UW72FF/o3kjYtP99y0/k14Rwl
         Qrcufqf38qbZIEOcHNGr5Pzyvjo5gUgH0TitLJR0XUtErQH3frninaBvCPNTQhLGUbbb
         uCdIf1hHVfvBKcHfm415V9swy1Wx2IHk1z/br8lIo3fIEIxKgpbDc5L7DirFK91LlaKV
         i8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718720885; x=1719325685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1oD9cAlhoFUpaJXK/MI3nR3DbJ14JaglZi8r1oHsa4=;
        b=G/83HGPl79Hk7ue3Y2pMkSEbHRo1C2Hv4vrS3eRm0GkinpmdPc3QHSo+3hyBEw3izB
         hDSUxNI4Ezb/Yd9mNt3pnXRFgghwQaHciECUDO3NMYwbxZKjUBIxF90uEaM8z9LBEppY
         G3+W/mu1UZDelWGrO3GNYGjT9xgIxt52QNQ0I3xr2iT7m99wRH6Dzj7sIAIHzHVvgRsc
         7MGcVHf7ZT2kFpNkO6oEZf+64kAliEB6QbX30HckyU3BkeYaKs6yYVavIknGYmvMTQVK
         XIWBL2Azg5pN/gX7U3XpdQF0YFnNCxwdT2wrPn9hyroemuTx4I9RQdiUCMWHySwozOuM
         DhMA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Yf6mJnQsKNbDRjqDX00YPOby5wK7ccGVnJDVs3JwQelE9PZRMHbhzg0Li9wS2oxthfMDJaD6sYLBQW9VNnO37j5+vty+PHnNaP5pPA==
X-Gm-Message-State: AOJu0Yy36WQN0CiFGTzNmd7jiJr0jdE6bdRu8WMkDZ9aJIY8x3WxaeiH
	BoStV0C9hBY3WsQd44oRRTXGw9pe/TSDqOAEtjfIaIoaedRtSOinIujRjnQRqwM=
X-Google-Smtp-Source: AGHT+IHBx3GtM/7wDLLkUt6Vmc/LNvxwypfkaJ/S6LtCJfYKvIG2fRy62ZT2KiZrAciOWnz/Niy0CA==
X-Received: by 2002:a19:e041:0:b0:52c:842b:c276 with SMTP id 2adb3069b0e04-52ca6e9182fmr8918009e87.53.1718720884661;
        Tue, 18 Jun 2024 07:28:04 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cc0f0285esm384783e87.184.2024.06.18.07.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 07:28:04 -0700 (PDT)
Message-ID: <4a1b5ad3-56a9-4b83-97db-0781d68bf507@linaro.org>
Date: Tue, 18 Jun 2024 16:27:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] interconnect: qcom: icc-rpm: Remodel how QoS settings
 are stored
To: Mike Tipton <quic_mdtipton@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Georgi Djakov
 <djakov@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
 quic_okukatla@quicinc.com
References: <20240326-topic-rpm_icc_qos_cleanup-v1-0-357e736792be@linaro.org>
 <20240326-topic-rpm_icc_qos_cleanup-v1-4-357e736792be@linaro.org>
 <20240508014530.GB25316@hu-mdtipton-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240508014530.GB25316@hu-mdtipton-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/8/24 03:45, Mike Tipton wrote:
> Hi Konrad,
> 
> On Tue, Mar 26, 2024 at 08:42:35PM +0100, Konrad Dybcio wrote:
>> Currently, the QoS settings are stored in the node data, even though
>> they're a property of the bus/provider instead. Moreover, they are only
>> needed during the probe step, so they can be easily moved into struct
>> qcom_icc_desc.
> 
> The QoS settings *are* fundamentally a property of the node. The nodes
> are 1:1 with the NOC ports. And the QoS settings tune the priority of
> the data coming out of those ports. So, logically speaking, the QoS data
> does belong in the node structs along with the rest of the data for that
> node and port.
> 
> Only a subset of NOC ports support configurable QoS, but for those ports
> that do it's a property of the port itself. Those settings impact just
> that specific port and nothing else.
> 
> The current method of directly embedding the qcom_icc_qos_data struct
> into qcom_icc_node isn't optimal, since that data is irrelevant for
> ports that don't support it. So, the size could be optimized by
> converting qcom_icc_node::qos into a pointer instead. But I don't think
> we should separate the QoS settings from node struct entirely. It makes
> it very difficult to understand which QoS settings are impacting which
> port.

I think that would make more sense indeed

[...]

>>   
>> +static const struct qcom_icc_qos_data a0noc_qos_data[] = {
>> +	{
>> +		.qos_port = 0,
>> +		.qos_mode = NOC_QOS_MODE_FIXED,
>> +		.areq_prio = 1,
>> +		.prio_level = 1,
>> +		.urg_fwd_en = false,
>> +		.limit_commands = false,
>> +	}, {
> 
> How can I tell that these a0noc_qos_data[0] settings are for the
> mas_pcie_0 port? It's not possible from the code anymore. *We* could
> figure it out internally by looking at the NOC SWI to determine the
> qos_port index. But this should be obvious from the code itself.

Right

Konrad

