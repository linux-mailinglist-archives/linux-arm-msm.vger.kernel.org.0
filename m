Return-Path: <linux-arm-msm+bounces-21589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 869B28FB1A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 14:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B88DF1C20D79
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 12:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D7D145FE2;
	Tue,  4 Jun 2024 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yp4j63PX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753EE145B3B
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717502423; cv=none; b=S2bwJh6QTxWMvFmG8w6KAYra/FvvzYQM1xpDRcrIGdt8OZ4Ari8rKkKToEZGQy53i9b1+B/xcPnvaEwKrqCPRHaNeXZyiHVFDKwVr/vnnGnYow086bTGWp7/n4TzA8nS9++Bm4owXPrRiYr368xIAPoXbdNGUCsoAfJxptnSrHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717502423; c=relaxed/simple;
	bh=ITmDK/o3vZUBIPrdr54txC310yi36/Wx7TXNE/zjdpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=isWsYBlUHMCWFCn1D1MxaIUGTcfO6SitvmkzjWCOFcYviqVHejfeTVKmhVx6pIirqzw0uClc3jVJBJGm9PNxey6topB2AcvD5mK2QBhBvyVK3iKMyWXNcQpzsK9Eq1UsJuUchGehjIWo1L/zUmj+tp9kn+Y6PZ3KLXaTPa797o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yp4j63PX; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57a033c2e9fso7085363a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 05:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717502420; x=1718107220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gxZZBV6os56KANAv7SzQ35RGN2CB4F4JHMvmXBGcdT4=;
        b=Yp4j63PX7bB/5Dfjtq0yJcztgKyDPyPByZJJF4b0ka/nbRCUcLtfnN68YnJfpRze8E
         ljU68VfXs7cXI8uA/dzq182y7OXQzAboxiexFBc8O2b9imQ9kowcrrKZPOpOA4W99JrH
         vP0BF4mJsIbROm7yZ/kdHBpnHiswixeuuVQav8d5qQlMxuhI1G7T9twDEhxu5c1dYN/O
         dQh3foAStCa6rqLq2guN/a8ACmRW9udrHqCWD5OufshRRFl3XxtnFNLh14lFAjqs6UuA
         MQlVRX3GmqdbdLzffrCzmgsWmzhq4UXSNFIcG/Z4BHRanfBj0LagbXzyH2OSdGd6zYz6
         Q22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717502420; x=1718107220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gxZZBV6os56KANAv7SzQ35RGN2CB4F4JHMvmXBGcdT4=;
        b=bRRfYl6QQ0qFNpw20aJ5NeNk6T6DWYmT5Ha13yvBpIFcOAeNx0WJQmqcc/DpZ69JsL
         q7Om7qQu/6vK2jY+tlJ9EXXdHwRXXLm2VHpxB4GqxveOgVUwzJa7CYNdURoa32gQIHjW
         lFG8DFHHhk1htrlQBO64acLbXIR7cy8j5jmV0u8yaEFBHlBL5j+qkFO/eGRo0e2n82qi
         NFrizG4F4+srcRnXo6BTjyMwiBNf8q1AZfvyH0gWbbbOOJ//nGL4QfAeJqDwuiBE0izF
         MSYYT5wnUGYfnyIADCmHfrbUZLRUk3AhP2rrLsi4uYL24iIw3t+U1BGo+d/lzffgDe9W
         Z+iA==
X-Forwarded-Encrypted: i=1; AJvYcCWFpKjGv+gISUkA5smambfM5JJhju7Fzqzx6O/6z42d18xxpQ5dAXzwH9/jpFyAkjHoR/PnKtjgAJ8y1V1zDz231imsvOQo1LCQChBCCg==
X-Gm-Message-State: AOJu0YyWieiWECSjOswdarxjC7EPwytnMxK03HhEr3gnGJzsSmaFBfGl
	qnQNBdJbjAJptiXKeupdXxRlKShymqL1Jgfm4p0akNNqQvJW2fGPU71NRfrb8WM=
X-Google-Smtp-Source: AGHT+IG7QzWP6TC0xP0LnvsUQdt79OEW+vUjnsDphskiqmixjCLQXCnOn9Q5pGxgijhnHA5ckYPChQ==
X-Received: by 2002:a17:906:a046:b0:a59:d2ac:3856 with SMTP id a640c23a62f3a-a682022f87cmr857478366b.22.1717502419771;
        Tue, 04 Jun 2024 05:00:19 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:a035:2af2:8d85:1f72? ([2a00:f41:909a:a11e:a035:2af2:8d85:1f72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68b71450c1sm471790866b.152.2024.06.04.05.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 05:00:19 -0700 (PDT)
Message-ID: <d93fe55e-7c65-48cb-bdaf-5e15bc22be30@linaro.org>
Date: Tue, 4 Jun 2024 14:00:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: Make the PCIe 6a PHY
 support 4 lanes mode
To: Johan Hovold <johan@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240531-x1e80100-dts-fixes-pcie6a-v1-0-1573ebcae1e8@linaro.org>
 <20240531-x1e80100-dts-fixes-pcie6a-v1-2-1573ebcae1e8@linaro.org>
 <Zl28nvnpGFRsYpGh@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <Zl28nvnpGFRsYpGh@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/3/24 14:52, Johan Hovold wrote:

[...]

> 
> As I just mentioned in my reply on the PHY patch, this does not seem to
> work on the CRD were the link still come up as 2-lane (also with the
> clocks fixed):
> 
> 	qcom-pcie 1bf8000.pci: PCIe Gen.4 x2 link up
> 
> So something appears to be wrong here or in the PHY changes.

Is the device on the other end x4-capable? Or does it not matter in
this log line?

Konrad

