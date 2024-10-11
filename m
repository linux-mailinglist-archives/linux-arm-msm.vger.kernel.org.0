Return-Path: <linux-arm-msm+bounces-34058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A094999F09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 10:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55BD1282142
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECBD209F3B;
	Fri, 11 Oct 2024 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2MMUnMv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFF64A07
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 08:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728635471; cv=none; b=lzcPA/zSc0SR20RmngXw/qRIVaQibBQ01/J9R3LMRcwx1ao4t6UZXaozqWRwPQiClIA3PJ/daDVcmCixErvg347XVLVuBWg0RKQZn2I6OQqYCb//pia1FgH4iKAm+ZbpY4YS06E70d+NGEb9620eVUv4GsQgCGVQBgVS2up9RZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728635471; c=relaxed/simple;
	bh=SEJdlxQ23Wh1PJutMKkwgNXKdM73Ivu4Y76y3S/iMcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=okRP8/RohONBTPU5ZmMDQbFm/49SRC3u6MUUMkukbStNZknfm4TjSWzi+bG86SywNi82Slihwxn//txd1LP9mkYX+OkcP5MYKbD+HYs8IjzhG0au5H1dMWHccnkC1kDwN5WTQRklQP1ewI51xf1yZVsTbfMp2dbpBVKOwHfOiQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2MMUnMv; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so2094305a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 01:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728635468; x=1729240268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nAD5v+org+QPFKjhH7xH1l9zocUcHG+37XArsBcPgZg=;
        b=c2MMUnMv7t50613fX3tILGU74tI24Vqck5uE9B2W4RMWrFfSH9D1Ur9+J3dkKOt94/
         TniI3UuP2PWvW7sVNAGEziDxeqgapzUDFmEqb4mrATi9nQK8xG5WxtFqTOqNSow1bHX9
         87x8ljpQXz5iCXB6I7jZ8Qr7kaR4FsQjTJSyrGN+rzcD6meaMiRNWpil5KCiKuctkiNj
         zQG0XatjPuURd8J4g8s1t3PbeALQZzbMd0WkJ8h0RDYyElU46T39y52n0aDL5uMIjDUT
         mPyAAfLwH52VX/b6GuCH61f48xLIGpJK87IE+42gyM420VHocDQrBIe7eTYhEqrA4mmv
         9dBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728635468; x=1729240268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nAD5v+org+QPFKjhH7xH1l9zocUcHG+37XArsBcPgZg=;
        b=wK4Wzxpwog+GUPC2eDeneods2Io5K/tOiOj6untDjuhLF9XhBrWuAg2Gx+Ui+bC2Wz
         /lmrNP55+jtn164U9wBfwQbhVyH8UG62w4ix6Ix4rL/BrYlGSws2u/iQKyM1djJqogpo
         CyvubTfUebzuGOq0CBWJKw0XcPEYioknL9LWQJ0aXidWHGaeUiux7gQbcKr6GreedzDs
         7tnqwjzdInEBrN47ZYqe5Om8hraOhDzJpfirz5Tp0bWUWiftHOuEVwiiOddiLneIRDuL
         mQsLqrN7KKsU9o8/9isGK5VBTmHWKhnFFND5UuNwbInzzl0GNoAba70k2RI4su/M1lCh
         JBCg==
X-Forwarded-Encrypted: i=1; AJvYcCXd8kgRLbwm0C2OiQ6nzJAvxxPN7V1+VbM+phBAUICUb5Vpm9ee5mioGRUmMntUhenspbNFHLB6969ZPHHB@vger.kernel.org
X-Gm-Message-State: AOJu0YxzXzywqVRJ8pds45kLE/WR8/xkYKlLEoeh6nzrYEVeMWKFV/PF
	2cJyxlZWXMher6AtOaS+T9P0zcLmrzTydGjx5nzN56HU6DfvV951JyaC9oaYxX4=
X-Google-Smtp-Source: AGHT+IGwUhHDGXHO6KgriwcoHKU56ZhIDBRkdsGJETJImu6rNJO+hbQAho6na7sM96Ccnl3slVQy9A==
X-Received: by 2002:a17:907:7409:b0:a99:c85c:6646 with SMTP id a640c23a62f3a-a99c85c67a8mr12978766b.30.1728635468259;
        Fri, 11 Oct 2024 01:31:08 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f5cebdsm188524266b.93.2024.10.11.01.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 01:31:07 -0700 (PDT)
Message-ID: <a230de8f-a11d-41c1-9bc6-7e06e850b51d@linaro.org>
Date: Fri, 11 Oct 2024 09:31:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <20241011023724.614584-9-mailingradian@gmail.com>
 <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2024 08:14, Vladimir Zapolskiy wrote:
> 
> Two most recently added CAMSS IP descriptions (qcom,sm8250-camss.yaml and
> qcom,sc8280xp-camss.yaml) do implement sorting by reg values, I believe 
> from now on
> it should be assumed that all subsequently added CAMSS IP descriptions 
> to follow
> the same established policy.

My preference is sort by address not sort by name => we sort the device 
nodes themselves by address so it seems more consistent to sort by 
address inside of the devices too.

Which means sorting reg by address and irq too.

---
bod

