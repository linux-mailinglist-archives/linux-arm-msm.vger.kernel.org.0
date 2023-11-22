Return-Path: <linux-arm-msm+bounces-1446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DB47F400D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 09:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACD62281005
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 08:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AE222F14;
	Wed, 22 Nov 2023 08:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="y00lX2yo"
X-Original-To: linux-arm-msm@vger.kernel.org
X-Greylist: delayed 578 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 22 Nov 2023 00:24:53 PST
Received: from mail.manjaro.org (mail.manjaro.org [IPv6:2a01:4f8:c0c:51f3::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6ED9A;
	Wed, 22 Nov 2023 00:24:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1700640909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=344eE/zF04wdsbwUUyPMJHUHm7b7bgjWnD7hX0tAWOs=;
	b=y00lX2yoRuI5GcAvxxLqMeutqSIajRKfUc1DiFHsAu/omK2D9ON8PZh/mrwmVkn0jV1O9v
	8ku/Cr+kckgScDhXDY3WIJ1QbFDku3no72CtSv6go/hhUlnWJjQ+VcqEX3vLBdlanMvLGZ
	otWOZmmQraYaw+F3aqp0AA4yW8eOoWxjHLpZJpemedJ5Yc/Fp77ed4lCr+PYRBtczCKOS+
	rNj7Vw5OLhUbtwb1x4V051jPcs6xFo+IQkX/ddwUFvV/E+6lpihXxvmFwqv36Brgqhk8ga
	Ujq6mLpzvHwYNEpk/6MvJaQkf284cPLivRDsjI1xcRG10WsnjlMZNWhuk3OKbg==
Date: Wed, 22 Nov 2023 09:15:08 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andrew Davis <afd@ti.com>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson
 <andersson@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Heiko
 Stuebner <heiko@sntech.de>, Konrad Dybcio <konrad.dybcio@linaro.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>, Olof
 Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
In-Reply-To: <26b5fd29-fcd0-4c68-8bfe-a73a660fb2c9@linaro.org>
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <19358871-009d-4498-9c13-90d5338b1e9f@amd.com>
 <76fa8f61-fe31-4040-a38d-cc05be3f4f17@linaro.org>
 <6c80a285-27fc-4d61-9eef-af4744a9decc@amd.com>
 <cc57dcf1-3c32-426e-920c-6f0741027797@linaro.org>
 <CAMuHMdVGyXizPw9Rggj8fQeNdbx3udRcsHFhz_sqYZzjN1CnZQ@mail.gmail.com>
 <26b5fd29-fcd0-4c68-8bfe-a73a660fb2c9@linaro.org>
Message-ID: <be7b6656e2c8064ebf1f1e6a301aa83b@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2023-11-22 09:01, Krzysztof Kozlowski wrote:
> On 21/11/2023 17:04, Geert Uytterhoeven wrote:
>> Hi Krzysztof,
>> 
>> On Tue, Nov 21, 2023 at 1:36 PM Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>> On 21/11/2023 12:55, Michal Simek wrote:
>>>>>> device-tree specification v0.4. Chapter 2.2.1/Table 2.1 is 
>>>>>> describing much more
>>>>>> valid characters for node names.
>>>>>> It means above description is not accurate or DT spec should be 
>>>>>> updated.
>>>>> 
>>>>> Spec allows way to much. dtc doesn't.
>>>>> One thing is the spec, second
>>>>> thing is coding style.
>>>> 
>>>>  From my point of view spec is primary source of truth. If spec is 
>>>> saying name
>>>> can use upper case then I can use it. If upper case is not
>>>> recommended/deprecated because of whatever reason spec should be 
>>>> updated to
>>>> reflect it.
>>>> I know that DTC is reporting other issues but isn't it the right way 
>>>> to reflect
>>>> it back to the spec?
>>> 
>>> Then why aren't you putting Linux Coding Style into C spec? I do not 
>>> see
>>> any relation between specification of the language and the coding 
>>> style
>>> chosen for given project.
>>> 
>>> Zephyr can go with upper-case. Why it should be disallowed by the 
>>> spec?
>> 
>> I thought there was only One DT to bind them all?
>> IMHO it would be better to align DT usage of Zephyr and Linux (and
>> anything else).
> 
> I actually don't know what Zephyr decides, but used it as example that
> it might want different coding style. Just like C standard allows to
> have all variables (including local ones) upper-case, we do not have
> such coding style. And no one proposes to update C spec to match Linux
> coding style. :)

I also agree about the need to differentiate the coding styles from the 
underlying specifications.  Also, as we know, the C language is the 
unifying factor between various projects, but with wildly differing 
coding styles.  Expecting all those projects to have their C coding 
styles aligned wouldn't be reasonable, if you agree.

BTW, having this document as part of the kernel documentation will be 
great, and it's in fact quite overdue, if you agree.  Huge thanks to 
everyone working on it!

