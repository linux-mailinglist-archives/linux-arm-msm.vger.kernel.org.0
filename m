Return-Path: <linux-arm-msm+bounces-17092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D74089FEC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 19:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E66C1C21DBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 17:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB0417F371;
	Wed, 10 Apr 2024 17:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FpCloBne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB8D17966E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 17:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712770757; cv=none; b=JHAMDaP7CokDyVxzjTIGecDjfBnqcnV5uM1rrD9mwahGDM76JgOM5arUutB1Rc0oPs2IxXqViRGfaft3+D31KK5EUWH2F63pHZ++CUSMfSZFIqCVhhrl5DqctA5hNVv+GizaOJTnINovTo7JeypzE+wtl3KE8xOV8103DpHOzLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712770757; c=relaxed/simple;
	bh=Ae78iTX5Gi1u5H/iJKMp5ReYCFnEnOmbK4zUk7vZlRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CeMIa3rXQpOAOsf6cRI2ZtAtGDbqVvccA3Zox+1jTzK249trjfRpyD6iX7PQKFPLG0In2TnBjEORiXGnsh/YrAk0lO3pTSyGYbH6/o1CY7bPXigJVXDkhYMAc7ALdIVEDyZYyO4F1czCrQNIKCSiUdTozjaAygMD6TspYCYn/Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FpCloBne; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5176f217b7bso1514201e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 10:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712770753; x=1713375553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FOAAOfk0ZAGGudRLQ06zTrFZTJcS2I7LIhPpzIE377o=;
        b=FpCloBneh9c6e3bbs05wVjJRbXHDZdQUl574vqV6P5L893hGny1OVqmmeIeiDvtRM0
         +G6iOds0Qqo+V+NmDXuA0lxSuKWfDIn4w2sF9iP5G+sBP+u5Tsn4Sy+7cIo+yZPeDeu+
         jgSOC7s5RySrJsbnuU3Zl5Xd21TXI8Za+GpKx18Khlb2MfGNj9NMrQwYXSzBpYwMay7v
         vGDc8eSR7QrZjkQEx09DY8t+2ljHvLSg0tznXhJj89Exs9qQ/5AviUxAqS+MdpZoh1ms
         USCpmDW0RxywL/hnkir+5uCSKt3fgu3nb89NMy5OZ1WiKAPDF6jRbMWJCYEdKw5sMfpl
         VxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712770753; x=1713375553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FOAAOfk0ZAGGudRLQ06zTrFZTJcS2I7LIhPpzIE377o=;
        b=mZ9UBvqroEdGqBQLwvdE1Clouk3JXtUw65Bytm4rStXcYBYTEQJRRfqEpGZR1nDWxY
         wNwGAQXZ3ZOb4wPoE1aYzJKbQF7+4okcb0aYz4qwS/W8UB+24SE0hxGb48bwZYsT8Ae1
         Sr2G+wF18NiyaNfZyXcPlkot9H7Snb+ZoqH0rAFheLnTUNnEJei5LZA5hkF90/1W9437
         uOOo4fLaheC3BtV8aOgushrO3mWxZ/7Mgd0xeJMApWdFlmSyzqb0C1QqSceO0zGroxoi
         LtP4ZEfUjlnuMR7Y0tgl3ib95jPMErTWprrDDizculSlNqmQ0OKi0+G3G5qgO/vTFeC+
         3N5w==
X-Forwarded-Encrypted: i=1; AJvYcCUWHDlZwXlWTtd+eAE0qq5k/yHSxTrwoMv8lT22Fr2jg1jA9QFsc2lKM64jOc/Zudf7cbhrRRoOckdXTlzWTJC19PdK6KCN0FRjMul1Ag==
X-Gm-Message-State: AOJu0YwenxppOyOgbac5Aao38BQYz5C9fzjn0AwTydnXsuGDAyyr+qEg
	WAnIFVK+JyrAblDjsuw7fh11xcF4zsmdlfRT08raGM6KwKsOlFiCmqmHPji9Mc8=
X-Google-Smtp-Source: AGHT+IG7dDYe1gFQPvGL6M6ksyXaTfBAbfvpOrw2k5MazcBmNsiHemV0NeET8m68BsHQlkw2YDSGmg==
X-Received: by 2002:a05:6512:203:b0:516:d26e:ea6f with SMTP id a3-20020a056512020300b00516d26eea6fmr2650668lfo.35.1712770752736;
        Wed, 10 Apr 2024 10:39:12 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t21-20020a192d55000000b00515dcb7ed9bsm1925034lft.144.2024.04.10.10.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 10:39:12 -0700 (PDT)
Message-ID: <16faae0a-ea86-417d-8588-375ff41160d6@linaro.org>
Date: Wed, 10 Apr 2024 19:39:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] regulator: qcom-refgen: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Robert Marko <robert.marko@sartura.hr>,
 Luka Perkov <luka.perkov@sartura.hr>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240410172615.255424-1-krzk@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410172615.255424-1-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 19:26, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

