Return-Path: <linux-arm-msm+bounces-22551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D73B90657D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 09:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17E57281020
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 07:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3679813C8E3;
	Thu, 13 Jun 2024 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xY/vec3c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7372813C908
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 07:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718264713; cv=none; b=R4k6eeOTyd4USr7oumFjL7d5QAujVoUAk2cmScIzDuzk7Ffd8UXcClXmsGYiO33CqqYD7Ni1+QSAGN3AB8xuBFXua6c48u8dIRx0/LP3pVgYVoine0HCJBfbZ6bRwHJzRrLjcyGJc973nUoLIntVo81sejEB2PlDXm9D8/Tbwrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718264713; c=relaxed/simple;
	bh=kruOkB0C5mtg+qRidPLwNLCl0wybSGrd8TELQRoYoxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bsuZcJv9yxUupIHyNaVQiBoELJMhVkRVSnUR6VeTgoFvAJOF0v3vCb1g7YnlZ+T3BCi2EncTFtkPIV31dudThVMTMhO+EhrgOjdgY55LluECcSDwiNymxSYD7ngSEeY8EfbCN98uFMnWBjYLkiZkREYQYZQBlfRDoFNrODiunBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xY/vec3c; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso829960e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 00:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718264710; x=1718869510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdVtOlMNp03m2x6MWFcqw0pftt+PVX8U/mJ39Asz150=;
        b=xY/vec3cEa0SpuS4oP8h7nXg8znqm75jiR/SUmwA5+N3td2jTcvyOG7OLgXT6skQgy
         q1Zj/o/g40amMdqdhaXcSInA45omv2LDf1MCRgBaeeLJFzrIJP6dcRxE07BwWMaNFa97
         POzIgjJrDFccp6SSfVBSGqeb9PvM61JCl4ikJn3iKEPg51ttiehDtcmtScdhYYit4KZ2
         AY3rS39oE4x0ctQYKXgXqMWrTnmfpRxqFjweZL9hhPICJcT+DYWwG7Z/7Y5TlFad3bhe
         kY14cz12O68kN4jXB84wwC2Dicdxv7o7Mi4fdFRVyGqiITGUqdnXU24V55YvvOJ3vwIy
         O6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718264710; x=1718869510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cdVtOlMNp03m2x6MWFcqw0pftt+PVX8U/mJ39Asz150=;
        b=e/keJ1sjhSf02cEebps4PL4GS7hDiDbYdQ6F43MI58WKRP3if/ynNS/5981018W6KT
         M89meViJOCXcZIlH0qy9Nlowr6W7lNsAbxGpqhtjuvkoTODT8QkbggJ6EAYR27zRXCKK
         KRyY++qz4UyWw273GofscUZmkwsUT7+0jRbXK4yC1bcwVlMvkRJRLFLhAGsjIpzGK6/l
         Ry4aHp5n9xpOQrDaPbbF4rPM2+M3w7R3vkH5IttzU+X+5+feFD5HeT+d6DcE1EF9C6J4
         F4GScm0UH38zQkDsUQ4428zIY07dagsbLs2ataCwPe25Y6zeJZnVTurPlp91hWuAfmvF
         EC/A==
X-Forwarded-Encrypted: i=1; AJvYcCVvnkC5Y+5Tb/WUl2jagH4DFm/S8FOBQmc/oQC+lBfJ5ikNBU84us+26LL+uXzM/qEWjWrb2vrxcUFr7OEGaDNQgZvIZLRtVTO6mMAfRA==
X-Gm-Message-State: AOJu0Yzy96X74rmlWrHQ4KanGYiGDpHA29yQK1DmXST9McalXMKf66tY
	yy2yHIqE6cr+W3GgVXtWtp1s/CBjIsklI7PwrjULQk6ZGgPk4cVAkb0TPWAK0ew=
X-Google-Smtp-Source: AGHT+IEPJte/WZ9LVogMrND6fyInO1gJkzDc8M6RNxoglEUrvh5jJ2evyEf+/qAVoLW+M/bkgEzy0Q==
X-Received: by 2002:a05:6512:2391:b0:52c:820e:a7e7 with SMTP id 2adb3069b0e04-52c9a3fe5f1mr3123521e87.50.1718264709652;
        Thu, 13 Jun 2024 00:45:09 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:c71b:4253:8a9f:c478? ([2a00:f41:900a:a4b1:c71b:4253:8a9f:c478])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282f79dsm116007e87.118.2024.06.13.00.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 00:45:09 -0700 (PDT)
Message-ID: <90f5ad41-7192-4c01-90c0-ad9c54094917@linaro.org>
Date: Thu, 13 Jun 2024 09:45:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-crd: fix DAI used for
 headset recording
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20240611142555.994675-1-krzysztof.kozlowski@linaro.org>
 <20240611142555.994675-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240611142555.994675-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/11/24 16:25, Krzysztof Kozlowski wrote:
> The SWR2 Soundwire instance has 1 output and 4 input ports, so for the
> headset recording (via the WCD9385 codec and the TX macro codec) we want
> to use the next DAI, not the first one (see qcom,dout-ports and
> qcom,din-ports for soundwire@6d30000 node).
> 
> Original code was copied from other devices like SM8450 and SM8550.  On
> the SM8450 this was a correct setting, however on the SM8550 this worked
> probably only by coincidence, because the DTS defined no output ports on
> SWR2 Soundwire.

Planning to send a fix for that?

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

