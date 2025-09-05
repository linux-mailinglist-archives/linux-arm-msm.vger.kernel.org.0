Return-Path: <linux-arm-msm+bounces-72180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28955B44D8A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 07:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E77AF17C42C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 05:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71AA21D011;
	Fri,  5 Sep 2025 05:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWn/XXJ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828D51A23A9;
	Fri,  5 Sep 2025 05:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757050251; cv=none; b=WtwyVpKPy7FwluZBYPT7Db1sQDbGNIOmuAzaxKHB9svsQxunGKzp3vQwIEDLSvfaRvV59BqW3sJXXYAS2xCFDJRX49j9shNbCo8ZH5IGc6cgCb89OPJw8+jdny76h1B6W2xBBYBfnAZKK2jMZ/OE0tar89uJhnhYUBZok94MMW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757050251; c=relaxed/simple;
	bh=cbLNZDh3PTn7q6E4OQ+QN+0z7GabqhC5AvixloSfBOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqRaW04TPLlSRqa5NZgQbAowzbg4TquPpPJYnY0KQVJjPA3P6jrgYghpDIGBhNN4myYhj8gaucVed6/Mxko1LjGmC7cnW/OQziv9Q7W2EonBgsAI7bGDN6MhWDyd/x/zirUztlnfvV1ubr3e8sTDZM4pPlLSBe0/lqnmTjCs0EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWn/XXJ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A60C4CEF1;
	Fri,  5 Sep 2025 05:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757050251;
	bh=cbLNZDh3PTn7q6E4OQ+QN+0z7GabqhC5AvixloSfBOw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MWn/XXJ+ofi0MQ6yNLOAOXyj0R0mJTamEQtYDYO3Rq805Q8XWzAoqlgfdxUdVINc+
	 8ZJzdc5fvu6lucTJnI7xExC3GNZ/4Q2GZPg8aXAUFJ+wBmArdR+7QDPXVi8GqYjKre
	 w8HETk4wIzk2BRpgX2yTV2CP0R+5UHpniDut0EWGNA9i12aAPnmc25TVcFupkyyMIv
	 hJ0WrtWCkAkemIzf5tROqvSzKWZI9h17xRGf5FiVfmmaDqEgRyYPRZJFD7xB8tYSKy
	 Lv9gBDntewXUM6wXywt4p2Vj+dfO5wd/YcnODeFS3SChYhA3EO2oqshNyLDQadmN5P
	 naXijp2RR6Gmg==
Message-ID: <82906e08-9583-4f4c-91ad-d5b53b2dffd6@kernel.org>
Date: Fri, 5 Sep 2025 06:30:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
To: Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <CAL_JsqKG+dcMgp1QF4F3Oxh5Shvagg6cSde=g1JMcEAquZhH_Q@mail.gmail.com>
 <990cb5af-3846-44a3-b373-ded62d3309b9@oss.qualcomm.com>
 <CAL_Jsq+zC91GPdzQQa9F8KEw5UL4xc13u5U_5vTyQG1WeJa5rw@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <CAL_Jsq+zC91GPdzQQa9F8KEw5UL4xc13u5U_5vTyQG1WeJa5rw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/5/25 12:08 AM, Rob Herring wrote:
> On Tue, Aug 19, 2025 at 8:44 AM Srinivas Kandagatla
> <srinivas.kandagatla@oss.qualcomm.com> wrote:
>>
>> Thanks Rob for reporting this,
>>
>> On 8/19/25 2:35 PM, Rob Herring wrote:
>>> On Thu, Jul 24, 2025 at 8:28 AM <srinivas.kandagatla@oss.qualcomm.com> wrote:
>>>>
>>>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>
>>>> Qcom Slimbus controller driver is totally unused and dead code, there is
>>>> no point in keeping this driver in the kernel without users.
>>>>
>>>> This patch removes the driver along with device tree bindings.
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> ---
>>>>  .../bindings/slimbus/qcom,slim.yaml           |  86 --
>>>>  drivers/slimbus/Kconfig                       |   7 -
>>>>  drivers/slimbus/Makefile                      |   3 -
>>>>  drivers/slimbus/qcom-ctrl.c                   | 735 ------------------
>>>>  4 files changed, 831 deletions(-)
>>>>  delete mode 100644 Documentation/devicetree/bindings/slimbus/qcom,slim.yaml
>>>>  delete mode 100644 drivers/slimbus/qcom-ctrl.c
>>>
>>> This adds warnings to dt_binding_check:
>>>
>>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
>>> /example-0/soc/slim@28080000: failed to match any schema with
>>> compatible: ['qcom,apq8064-slim', 'qcom,slim']
>>
>> Will replace this example with slim-ngd and fold it in the original patch.
> 
> Still warning in linux-next...
Its done now!

--srini

