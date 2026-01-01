Return-Path: <linux-arm-msm+bounces-87149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE4CED0B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 14:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A5D63002949
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 13:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324F023ED6A;
	Thu,  1 Jan 2026 13:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dy6LgFzh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14452264C9;
	Thu,  1 Jan 2026 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767273810; cv=none; b=Bb9BSQipCqYjRYSvbzVbLRhLOcAMdTWNFEaMiuBi0XiOJzpSeSHXHqRz8tmF9hWV6/BlukV4qMbehqMaAAbmA0saMLhuME95U+dylQ8OYpyyW3aPAY0RTyjtbvhzR6jSymRDqJF5Gw45JRyWjWOIbbhsb5PYvS5Z6VpJcJgvUQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767273810; c=relaxed/simple;
	bh=ZgsPuDN0FoX5Njpl/pVkcCyuRuVszPY2EmOzE5zZ1GE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UXz8eZGmYvqTjzwh7tt0iN3+BI7kqv93u+jsUQw0SI1xCAE3ioU1rySe2XKIsEfCJwHIV4bexZYA+97VOLQhWckXQfTLxbUIIvy7P/q0UTKD6JvaPu4IC8e4VpFGhV18x7TL73Mi8SwvauPe2MN0+iEqVC8Pi/PhqiXnv+TJfxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dy6LgFzh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66330C4CEF7;
	Thu,  1 Jan 2026 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767273809;
	bh=ZgsPuDN0FoX5Njpl/pVkcCyuRuVszPY2EmOzE5zZ1GE=;
	h=Date:Subject:From:To:Cc:Reply-To:References:In-Reply-To:From;
	b=dy6LgFzhqgaWb3pILceiNgvksMtfWa1lHEcKKJCMdav2m3WVHycQbw4GlzZl6PKRD
	 lJfhkeG2iONP99gyd6rrAoRFQCXKa6Cngk6SBK2tp2ItdXiWxwdWktQ8IBvvXxdP96
	 gPWzDAf2215jrKuD+KELa+8+gIcQcvjAWJGe4AHgjtBKdn8vwHlpbq7Lwk8K6VJ3Ly
	 w/T34bTd2fIMKwESiO2iKdv0k/9bdE3I11Tp0qyshUKCd/uWsQ9BntK+4GvSCTNuI9
	 l+EYpYSstbu7NpwFSTtUlV4UzgL8CeMEc6yJVVFsBC61WsYL7yWNaybTj0i0CxAW+t
	 0QQO37rC/qX6Q==
Message-ID: <2a731ca0-c335-42e0-9990-82275c6767f9@kernel.org>
Date: Thu, 1 Jan 2026 13:23:24 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
From: Bryan O'Donoghue <bod@kernel.org>
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Bryan O'Donoghue <bod@kernel.org>
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <NLGulU4z-1Wrf5120YfX8CYJ_8DSP-9-DhaJ3KAIQCvqF9Qf184udOzFoEQH1qgJDZUl9cxEpsdyztfhcz8G-w==@protonmail.internalid>
 <20251231-mss-v3-3-f80e8fade9ec@mainlining.org>
 <bhfoYnVs7452tgSQQdem4OsIZpx27RNAfLgcTgVCY3QX8lm0hiUmFxwxH6kRFfrCBFBFfIxmLNdL5dH0X8U0lA==@protonmail.internalid>
 <6bfc790d-b0da-4c5b-bd2d-ceed9a75bb24@kernel.org>
 <q8bLkTmp2FFsKHr8nU2P8bl7A9O22WJ9OLhhT1rUmdoYOZSt-A-aUJXthfnpT-nErk_10-5Fv0UgUpybs3vxYQ==@protonmail.internalid>
 <39090d1c-06ee-4a74-acbb-e63d1b8bdef0@kernel.org>
Content-Language: en-US
In-Reply-To: <39090d1c-06ee-4a74-acbb-e63d1b8bdef0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/01/2026 13:19, Bryan O'Donoghue wrote:
> In the first case you care that the bit indicates something useful, in
> the second case it barely indicates anything at all.

Swap these bits, the first case is an acknowledgement of receiving a 
command the second case is a status bit from carrying out the command.

Either way it seems a bit mindless to just or back in whatever bit you 
read back here... in fact shouldn't val be _equal_ to the value - 
instead of or-ing the value in ?

I think it probably should and I also think if you are error checking 
you should check your flagged bit actually appears in the read-back dword.

---
bod

