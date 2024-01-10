Return-Path: <linux-arm-msm+bounces-6970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18310829F6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 18:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DE491C228E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 17:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C344CE1B;
	Wed, 10 Jan 2024 17:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LmDT8IRd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987E74D100
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 17:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e6ee8e911so4755864e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 09:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704908494; x=1705513294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HgI3b5nVyvdJT18kOSX4sUXOm57u0vvWVXG95l7nSRE=;
        b=LmDT8IRd4TWUk80hDga75nI6fXFLf8Ysuog8rnBV8TE9N41z85C05E0zIN9LpAZEXw
         bn0rautfTZrOxw9gCO267oFAE665OSNvM+2nCys8Zp5hZgSqdybt1B85cB0D8wI5ryB5
         L0PiU+aHIE3Qj0ny7HZ1Y6p+AL3UxEsgw8fJ7Y+BJQr95N6/gf+Ft8l0UtqWgDcyhp9W
         +8DzFktC0MFAbdT/s8mpBhn7KSbHAOkHnmcpjHKyqQaf3mLRZl74F6V/HXYHTpmZyLoB
         DzBlOd2ks1W01tpitDUuD3XAKIL2o/nL88EvKWRLRzjjBmN9YzRp7WGQpE0oQl5G7rFH
         AF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704908494; x=1705513294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HgI3b5nVyvdJT18kOSX4sUXOm57u0vvWVXG95l7nSRE=;
        b=LN6J/JomhQnjwAY+dTyS3Mso8eJ6If9uOFhRiqOq8tqZZ1Ln+dsiCuz1MpHSECtsVV
         mKWfaGuo3IgVxa7RoeIG2KxLA8lN5OQ8OmD33RsUm0rWhEJf30gPGwCi6QFT0vNPjD37
         9YSqclQ8gsIHyyHQMSoSo+1PG9Nw5yWq8Jwa3FpzUIKjyq76sXhxDqu2Eu+HcYV1xons
         c+t3wcroGtc0DpSLLEFGPH8bI58WISmNVN41He+ELctD1g8DtyiY/CYmc/wlsaZ/TVIM
         Hh8d466GZh8mXfkzrNZ/3cqwx/IhUIPxY29/NWxBs5uQc7EOAkZdClkMc0ioNOVrqc1K
         2teg==
X-Gm-Message-State: AOJu0YwTr97PQPU9JDJhxR8Rz8u+UasVquUOh+eLWkN53GjfeBH2ix3V
	Z6BScLYNFyNG1H//Lfcflf0cvr+tA59ZoA==
X-Google-Smtp-Source: AGHT+IEC4uszuGwST+4r1WGXDV8hmFYqZKMqSEx0gyGO+XtHZameYMXu1gqzf4ujDAdIpt9LiMjx0Q==
X-Received: by 2002:a05:6512:3c83:b0:50e:1daa:6705 with SMTP id h3-20020a0565123c8300b0050e1daa6705mr673715lfv.6.1704908493622;
        Wed, 10 Jan 2024 09:41:33 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a27-20020a195f5b000000b0050e8cd014d7sm741726lfj.16.2024.01.10.09.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 09:41:33 -0800 (PST)
Message-ID: <59ad396a-59c3-4cf6-aae4-5a8d00f1a6a9@linaro.org>
Date: Wed, 10 Jan 2024 18:41:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm6350: Remove "disabled" state
 of GMU
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Andy Gross <agross@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-3-8ad11174f65b@fairphone.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240110-fp4-panel-v2-3-8ad11174f65b@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/10/24 16:14, Luca Weiss wrote:
> The GMU won't probe without GPU being enabled, so we can remove the
> disabled status so we don't have to explicitly enable the GMU in all the
> devices that enable GPU.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

