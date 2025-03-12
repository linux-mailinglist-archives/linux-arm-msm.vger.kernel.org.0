Return-Path: <linux-arm-msm+bounces-51205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB82AA5E85D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 00:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64B0D3A7389
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 23:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0FB1F1526;
	Wed, 12 Mar 2025 23:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="POsKFPb3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3E81F1515
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 23:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741821936; cv=none; b=HG53SEEIqLCmynboQagObT7godw9xwt52/TP3GNbLFJW7lro1BPJ5IaToEKkSvm0TO9RK/tZcKpXyo6iNd8y3FM83i90uXWLTIAyf9YA5Z3aMBiuCPzzuR9xjT+WfJA6+whjTuCBHo6YNht1oYskEfvIsAm3Ec2NjGHu9pCjFPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741821936; c=relaxed/simple;
	bh=KNOXCxB49IWpZXkEuShUxxFDdmvuAFP6JtXUlRzTWE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJBf/JS2tVYKBjUUc6DGk4HJHw90cs99jX/BVC3KJuZIhu0hXeH4VmjQjz5Qc3WEWqKM4/tGoMZjAp07VWYPBAF/etHpdvfHeqSb6+ATsW3ZrDAl8namciXv7XIhn3lcxi4wHBtoRFG6p1eaxSc0jXKTYzn+nLp1bCTKBAXnHqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=POsKFPb3; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5e7fd051bso414257a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 16:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741821933; x=1742426733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cbP3u4ukcH6UtAZm28jTjg95b8wU0mnB31L/HtHfr/Q=;
        b=POsKFPb3cgKruwzgXihPs4RTCjHoXI8CqbOhsYbLezi7cB0EY3kF126c2kp7FW0Glm
         TQvUHOGxFY8P6mhcJnv4vNI9+svwl8VBoyQWuxNlHuPduNPN4BgwZXbzoj3Fzs2jDr90
         iMrpEfZ8DheLnb2mHVEhU2HDrDBYCsOMMtlO5d0PPYNG9KxFkRtDoS2MItq0D6ChDg3z
         1pFVywx21U0JImeOrn7mHdTMFs7R3mt7EqyFjqLPQeKQga81Cgpc8+qSA7ON1yldeZrc
         NgV4cDxJoU7mqbgRTEVJX3lLFJVn092ITMY4xbEUin+oA83PR+pZUNElMYsX7MwfNnto
         3O/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741821933; x=1742426733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbP3u4ukcH6UtAZm28jTjg95b8wU0mnB31L/HtHfr/Q=;
        b=AMYvklpq8Qp6Mplavc10XzL6gIq4D4QS42UOyQkLowHYatPpzdphzGYNSQmgP05hnc
         4KwEPu8xP07pe78MCeq7Cs9FIsOkPtEeWnGbfvQCFs2SPTT2ig5IeIjF4q/oKcB/d0Bi
         vFNjYKOJ1BTlnOeUbJQnY7vTnl3sDqbOD2GYH/modTlbExk9L5hEbg/nSK09Tc5XnHDE
         NzG69YaLbsl6ia8KKNHaJ7MpbblFhaV8aYMv9zEl7jcy24jCdgTuUuQAwPiiJmhCnEEk
         OV1ziigFD3TRYDwOsj4TEsBpqjJYCexcpinw0mTDsiTTQFBA0BGyL0bqoDeepSoddff4
         83sg==
X-Forwarded-Encrypted: i=1; AJvYcCV8Qkp7a7wdkNbacMqQpFSO7XShYmc6qBW2nbz/bKMaXx0ms2pMaZbMo+CHBLiP6bBMaSwizpwq9pW9N49g@vger.kernel.org
X-Gm-Message-State: AOJu0YyktgTrziZR8/8lfYPZlxeD7ZqtyQid+vqP/wC+ke7E5rxvVD0z
	Fv4QG+gp7exSe4gUu8PFhsz/YnIGjWRQG4g/pX/llZVXPBeuxjmJ3w0kAahWPcuLECHLVHPjyrc
	IMcznIQ==
X-Gm-Gg: ASbGncusJkJaYhSw5yg3MHsTcOaa3bC0rp1Plk0DUiKvdD7ZP7Q90i9Jwl11U0k5jfv
	Hz2lHTtqtREKBCf4wjz+YFF6pYz0pYUComh5a6N16BvjXDDKMjktOyjO3aukGL6M4ntgyKLNc8P
	7t5Xh5nzDN1dl0xMIocaKZjzv4+e+/M7q+FNvFyefJNXJjjyxP9WL8l86f2nI8rsMsWUD8SJDmN
	Ptcd8yx1so7LnLqSSzAYS/9CHfbMQN02kQi8IrgiCxv6bMf4588JCoD42Lcn+3/oUqIaOJijEam
	pUa8nG6szEYkysgLHXi0r4mouBxOUtEyKFiye06+3HNEGPy3SBxM8x4UACxeesu4sZultC4iGsJ
	ivhdcwT9BRQOzmTMY0lup3HbRBbFbNhEKAAK2SrZOL+cPUp4dvYdHtpEe1PXSaOd9muM8LumfVJ
	dff28vET3O4rGTPyGIMSPX8o71hpbFIt8=
X-Google-Smtp-Source: AGHT+IEQ9vjHKRKBUp2ycACrS8aKwBtnDiyRwBCDM+O3Ys0xwiBai+d7QgwA4ZAZ03T6YvvBIIvtoQ==
X-Received: by 2002:a05:6402:4489:b0:5e7:8848:f567 with SMTP id 4fb4d7f45d1cf-5e78848f991mr10629817a12.20.1741821932981;
        Wed, 12 Mar 2025 16:25:32 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816afe1f6sm27754a12.77.2025.03.12.16.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 16:25:32 -0700 (PDT)
Message-ID: <4a5ace5c-728e-4ae6-90d0-94270c83db3a@linaro.org>
Date: Wed, 12 Mar 2025 23:25:30 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: qcom,x1e80100-camcc: Fix the list of
 required-opps
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250304143152.1799966-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250304143152.1799966-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2025 14:31, Vladimir Zapolskiy wrote:
> The switch to multiple power domains implies that the required-opps
> property shall be updated accordingly, a record in one property
> corresponds to a record in another one.
> 
> Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../devicetree/bindings/clock/qcom,x1e80100-camcc.yaml   | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
> index 5bbbaa15a260..938a2f1ff3fc 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
> @@ -40,9 +40,9 @@ properties:
>         - description: A phandle to the MMCX power-domain
>   
>     required-opps:
> -    maxItems: 1
> -    description:
> -      A phandle to an OPP node describing MMCX performance points.
> +    items:
> +      - description: A phandle to an OPP node describing MXC performance points
> +      - description: A phandle to an OPP node describing MMCX performance points
>   
>   required:
>     - compatible
> @@ -66,7 +66,8 @@ examples:
>                  <&sleep_clk>;
>         power-domains = <&rpmhpd RPMHPD_MXC>,
>                         <&rpmhpd RPMHPD_MMCX>;
> -      required-opps = <&rpmhpd_opp_low_svs>;
> +      required-opps = <&rpmhpd_opp_low_svs>,
> +                      <&rpmhpd_opp_low_svs>;
>         #clock-cells = <1>;
>         #reset-cells = <1>;
>         #power-domain-cells = <1>;

This patch is fine as there is no current upstream user that depends, 
there's no ABI impact.

I'll take this into my tree as a precursor to a V5 camss bindings but, 
it'd be nice to get it merged ASAP.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

