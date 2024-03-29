Return-Path: <linux-arm-msm+bounces-15725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB4F891F78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 16:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB7CCB33777
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 14:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6171A5682;
	Fri, 29 Mar 2024 12:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KKprKeJi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA8B16C611
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711716449; cv=none; b=M86oGDV2ZSQNqEAyOZJqvnzPUtlgVzGwIThAXgGkjw528DfQPPYMTVjMIFIK6Fi+5Hx5d2d0+idaxb+IxxnaaY+D6+V9ykPOc3UaN2Bj3/9XaFXrXtbCIW4ww5WUvnuMLoUWeH0NUybr8MsEULmMwFyP41kq3ivq9Ka1T/xVqV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711716449; c=relaxed/simple;
	bh=lFcmJ+wfwNFtG3gNMtScAWeBN6r+w79cN0moMnF23jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDQeEICUy9FtxeMjqrS5bvG6Hk3Zx9Yfe+K4xevO5Tb6dmYM2DdZBYv0g/lbeaKYPHqzmJHvtv4wrLPKGiRTHtfFZG2n1EjqIz9QZ8DrTANhBggGhiyx2kIHO6cn1nKAJupOiQtiY1gVMVpZnMh2vQ8KkN8izJzJ4IMqWl4q+Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KKprKeJi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41551639550so2131675e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 05:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711716446; x=1712321246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qZ7D+5qJ2pNz6EYwHipxqxpZRV6/vgGZ6gzPku1VvVw=;
        b=KKprKeJiVFuVnNP6oP7i+Rl9ep++3bTIpaRPz4ysrYLQlT62x6LC5yTeOfrKzHfWkT
         b47HK4O4G/7c2aeyvHQ3YZMQrncinTRR0wN13B1M4V/h+o8fPkzhM6lDwvKzmNNmD89c
         q7hp5znOeBRwTCoyBsh1gtXghEom0xa3ifaeMuDI0hATYjddP0F2/NbXlcpUG5+l6Yqe
         v5NOROvvI7dlV13WG/4La288Dm86VkzsXCuRIi+bMEpzDYdWIW6e9zMyqmKn+sVg6DeW
         8kVQHkC7O6+vnuf4RB/Zc71MR9YF7u5MhguX1tKDvu+5zUyByloK7iQiTfJ9m5SriUsM
         7amQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711716446; x=1712321246;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZ7D+5qJ2pNz6EYwHipxqxpZRV6/vgGZ6gzPku1VvVw=;
        b=oJgJi+rQWiW1lP6NRiYgnQSZ6Yr9HmS/hoLOMSsL/t/wMENX96UpUmP4rgv+6MBmiB
         IHis829IJjPs4u5d/JJI1DMTmj1B9gDm7NuNrAYs4GQVYtp0RQNUFdExe0lo5KqY8OPI
         BnDLA0PG0GGg90cuB/MzYSrm0mKU7hKbTnaT2pxalTMf4uMwyHp2qXtf3HP6wxOb3QUv
         3EnZh1PV19A4RP7j88so+w8+gewkgycU8gAhT0mfWFLstxVNDijakZh1jZ2uNgOg69+g
         ugUnRem9/TZiAq3TuQEFMJkbN6ysqygEGoKHiJa/heWVwbyCVzPGAWrqyAs4t62OKR4J
         fEjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf3sHrpT1TPnSxWcUOaxE80bBHun9JVj2kT97RpSWq/5yc7dfdxDeqhNuQGlka0bvMauq4V/nd8FqHNO6gFx9BfJqXpBJl8W0Gx6yrGw==
X-Gm-Message-State: AOJu0YxqcNLaG547DMY31vpsMa3mOSNWOK3Ig6G37/1U8ClA57IaDT0D
	qZMQXjuxIN+RznHQ9cLPDg+OXi/s49eV4oGI223rV1/r6pWIxRZp0TcFnv7lRho=
X-Google-Smtp-Source: AGHT+IHMksVfsCu2pMKySfa/MLdds370aYD+GVM9XdFWAjzdOCSgnoygNfqulU33DpUs71aRe4tyDg==
X-Received: by 2002:a05:600c:3587:b0:414:887f:6167 with SMTP id p7-20020a05600c358700b00414887f6167mr1791150wmq.7.1711716446277;
        Fri, 29 Mar 2024 05:47:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.50])
        by smtp.gmail.com with ESMTPSA id fs11-20020a05600c3f8b00b004146dd6bfe2sm5281882wmb.47.2024.03.29.05.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 05:47:25 -0700 (PDT)
Message-ID: <9ec7f1a1-2156-472d-9a3c-0982910e6b4f@linaro.org>
Date: Fri, 29 Mar 2024 13:47:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: visionox, vtdr6130: Add
 mode property
To: Jun Nie <jun.nie@linaro.org>, neil.armstrong@linaro.org,
 dmitry.baryshkov@linaro.org
Cc: sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch,
 quic_parellan@quicinc.com, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 marijn.suijten@somainline.org, sean@poorly.run
References: <20240328111158.2074351-1-jun.nie@linaro.org>
 <20240328111158.2074351-2-jun.nie@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240328111158.2074351-2-jun.nie@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2024 12:11, Jun Nie wrote:
> Add DSI mode property and compression mode property
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../bindings/display/panel/visionox,vtdr6130.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline), work on fork of kernel
(don't, instead use mainline) or you ignore some maintainers (really
don't). Just use b4 and everything should be fine, although remember
about `b4 prep --auto-to-cc` if you added new patches to the patchset.

You missed at least devicetree list (maybe more), so this won't be
tested by automated tooling. Performing review on untested code might be
a waste of time, thus I will skip this patch entirely till you follow
the process allowing the patch to be tested.

Please kindly resend and include all necessary To/Cc entries.


Best regards,
Krzysztof


