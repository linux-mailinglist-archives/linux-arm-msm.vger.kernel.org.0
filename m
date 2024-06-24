Return-Path: <linux-arm-msm+bounces-23964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE8E914F7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FADB2819EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2D0142648;
	Mon, 24 Jun 2024 14:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zm6B3DvT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D6D20330
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719237744; cv=none; b=VxGm/MLusfGT3qFZJyzHaiCamxDIbg6SWtkBjqOfLFsMY6ynSguuIjLlqNH3pCxBLR7hsd2hyODXJfjHKxh0yeU8sRYdiRYpEYa1Bfpg4yf28DyKunIMqJQ5vedDPIHa7wCJnYGorlzWkQCoLAwpkZbPdqsZDUnsdgC5vRLSgV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719237744; c=relaxed/simple;
	bh=AM1CVy2u7oBZg3LZSOUlvoSnipYQvGJHEJnrE5Vt0Y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETTalzOIrJKWEjvrsfsG4G05dG65VK9O8jAVSV3lE4lzaz49G/SjBfHEqX5+TJnL3ebGU3Xy85ppGgooiWhrIV5sX35tbXbGllTtFAjeoG1ZkowhMX1sMbagp9qIoILEpOFjXtGODm+/mVMUTjk/3nn7z+ZlvAZ/3qZi3d4xc0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zm6B3DvT; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a725a918edaso126307566b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719237740; x=1719842540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGiCYhVDIuHQY8nLb7I5dZxX04zWqpJLvrAyBZeObqs=;
        b=zm6B3DvTLuu1LN2NZLHXMExdRUJjhTq4zEyBl+3ddWod92E6uUBE2pEpyfn3nagS4t
         1YE9lD51xh1MVD/ZX5cK61SQ++VAwj2/S93vUF3DGBczip6ebGOLiWjKc7Mc3TKWfFv6
         FCQ2UF1R3IwDS4N5OETD6i89Tn748lWbGADTCCdPTiKj63D7x91Sng7HFqtsWI7OP3Ki
         nMim2zLzt6eSkM7aY7WJr9D6OJPrLVjpx3NnQM5t5OP5Cw9yiBpipSypAVMA5LhFXThz
         jG15LlSWrzPhdJePzE3rHSbGMirRLTL0yaCDzfL55h0j8OQq5tk25aDK9c3+pRpVTT7v
         9htQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719237740; x=1719842540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGiCYhVDIuHQY8nLb7I5dZxX04zWqpJLvrAyBZeObqs=;
        b=UOQ3v6ZJ58Bb9supbrkwuBnsuCqrl/lgMg5NHMK2Q+q0gq3Tlj5BTbSIBy76kiYdWc
         O0Khwlzx/VTr6ZjPowFStRqTYxtFSMSjoByWB7ZcDGIs238w0UijN9vSM656L7ZSXhN/
         QBn9pB7R0Sj9AeCsCZfJrGZ6T8NH3hMYhvTVr0Wx0jiGo2tW4aGnj38X87nkTRitO4CB
         X8VC2KH9q+ercjbQHV2A0tzv4FfrxOeELsWYMTzSDGjug3MHm4QL8+ziYn9qW1uhnofw
         teYW1jF25YhByFcLcaGmYagF8ioXKKi2aVUZcwSujXU+SqnRkp3P51n5O6VLK9BB23E/
         3HcA==
X-Gm-Message-State: AOJu0YwxTdVqPUllUwKJVC1asG0i968vjNswN+550vTRkyKj/6V+RaaA
	EFQs8KbsGqa1ZdxdxStlj52AoKqkQQmpCEm88R5Nk5E7ahhY++Bl4nc2OPIunSg=
X-Google-Smtp-Source: AGHT+IF1FcxvB/vQ3U+UXkATvxTmtFEqMS6hASlVmeKEFS9T2PngpjRUDM21FdvvI/EDu+PSVB/YYA==
X-Received: by 2002:a17:907:a08d:b0:a72:6346:65ec with SMTP id a640c23a62f3a-a726347852fmr57111366b.67.1719237740109;
        Mon, 24 Jun 2024 07:02:20 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c03:9198:7df:6a16:3e8e:ed7b? ([2a00:f41:c03:9198:7df:6a16:3e8e:ed7b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7169b12999sm266286466b.95.2024.06.24.07.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 07:02:19 -0700 (PDT)
Message-ID: <cb32274e-31a9-4777-859c-54e90889cc98@linaro.org>
Date: Mon, 24 Jun 2024 16:02:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e80100: add soundwire
 controller resets
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240624-x1e-swr-reset-v2-0-8bc677fcfa64@linaro.org>
 <20240624-x1e-swr-reset-v2-3-8bc677fcfa64@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240624-x1e-swr-reset-v2-3-8bc677fcfa64@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/24/24 15:32, Srinivas Kandagatla wrote:
> Soundwire controllers (WSA, WSA2, RX, TX) require reset lines to enable
> switching clock control from hardware to software.
> 
> Add them along with the reset control providers.
> 
> Without this reset we might hit fifo under/over run when we try to write to
> soundwire device registers.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

