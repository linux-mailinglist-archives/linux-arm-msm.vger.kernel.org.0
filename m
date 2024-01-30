Return-Path: <linux-arm-msm+bounces-9034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B28EC8424A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 13:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5229A1F2501B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 12:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C11567E64;
	Tue, 30 Jan 2024 12:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="B/oOkdhx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6E767A19
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706617089; cv=none; b=RIZQHB4yevwfAMDrTG3B+DuGgfiXY0O7VPm4X2WhM4vry8zj+8EX7ilJUfVj+ClcSS+eGytsRv0IgKCbdWTi6CGNKAgAwrf+bB+ACtwJ9S4PHYPYf52LDJeO1B5iFL+Gz7eIxVlbD+ii+eWsfcaqljJwqPZ2nSIJxRTj5btSp8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706617089; c=relaxed/simple;
	bh=aDZg9Ysv9ypMXY8FZH7IcBkC8f4G67xupV2uxqvZIGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=My6ECSlpMxjMEXD1q9KHHHeAMD6qaRnnAcmls8nfdANbxpZ9gvHd0dQxHOT6CNVTuDHFdw5uYX9rguruimcj0pPvW1y1kCHdM7Bg03rCR1evNGqTuLtIP3FAFWUkJUh6iiz4TtswDk8HeqFBtBoUKPSRhGP1YCyCUX66gboA0Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=B/oOkdhx; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7bc332d3a8cso209462639f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 04:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1706617087; x=1707221887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EVuVKhonMTk5V3LL9uQwVTl3LUQ4N4vNXM25emFwWhY=;
        b=B/oOkdhxDjrJtU7NY3EMbK1AXNzpVu0d4W2DTes3+OSw9uoGjtq4xiEAoyHA7N1xvj
         JUW9bCkz32Fg/FeaTgUyntoxl8VRfgarrqJiHXCEfL+ziD9gpMPXioq+DMGQO2kMzKyU
         Quv0leMON8QXKw7c4MD9wpEvW1mAZ7XcXjusI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706617087; x=1707221887;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVuVKhonMTk5V3LL9uQwVTl3LUQ4N4vNXM25emFwWhY=;
        b=U+3yFx1odDBZJu6Q7rjhWDYk0RlHX+/0Euom+1SkA6hjU/c5pN1MVy6G1pd6cw75ZN
         cMmQ7CPmW/pBHAlzbe3Cy0di+GVomcNWrvt4arsJYTOof52qSR9xDOY0QgF5mJkV43XQ
         vJFcGymiwCKfr85oYYnyAyvn/9djR72mnBB/gsY61ltBTH4e2tqWGEYo9G1+WL3TLzRF
         xHkLrtZ7xAosBMm++fA3i74M/cwu737aQSfbmj/0/WoR0LnlH2XfR6WjtiM2xsgzhKHY
         L3zE/2fm1ZMQsClbkha/2McY2krYfd82iRrzuO9gXyMA0fiYaF5jbf5z29XJww0pdsQq
         5iJg==
X-Gm-Message-State: AOJu0YzeIR+idZgEWYvW7QE+4U1tGL4n+sYGJdxFBapjem+1ZWc8HGTn
	JnAxZbwI9gJhk++/NZQsY0WeUB7RAF1iiZEgkGHqqfyB9HSqnFUhefORP43ldg==
X-Google-Smtp-Source: AGHT+IEH3KOqJ1oHywcrGCu2pHFm7feqj1n5lzJpLDg26IuVpHt7ix13wz4jRmSDBxCcW0ABiiLpww==
X-Received: by 2002:a05:6602:2d89:b0:7bf:b56c:ac25 with SMTP id k9-20020a0566022d8900b007bfb56cac25mr14110896iow.0.1706617086797;
        Tue, 30 Jan 2024 04:18:06 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id q18-20020a5ea612000000b007bfea3c536esm1539313ioi.28.2024.01.30.04.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 04:18:06 -0800 (PST)
Message-ID: <a03fdf68-efbb-4cc4-aea6-d5f01b0fc604@ieee.org>
Date: Tue, 30 Jan 2024 06:18:05 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: net: qcom,ipa: do not override firmware-name
 $ref
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240129142121.102450-1-krzysztof.kozlowski@linaro.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240129142121.102450-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/29/24 8:21 AM, Krzysztof Kozlowski wrote:
> dtschema package defines firmware-name as string-array, so individual
> bindings should not make it a string but instead just narrow the number
> of expected firmware file names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Fine with me.

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   Documentation/devicetree/bindings/net/qcom,ipa.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> index c30218684cfe..53cae71d9957 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> @@ -159,7 +159,7 @@ properties:
>         when the AP (not the modem) performs early initialization.
>   
>     firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>       description:
>         If present, name (or relative path) of the file within the
>         firmware search path containing the firmware image used when


