Return-Path: <linux-arm-msm+bounces-74192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB065B89D15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82E391BC8294
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698F5314B62;
	Fri, 19 Sep 2025 14:10:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C2B314A6D;
	Fri, 19 Sep 2025 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291035; cv=none; b=ReTYHkgwWyYnx2V1Snj5eR3wV7mbaNWljFNblmq15OW/Az0zVFwdU8Rb6TITrMH8bzBc6USwwSyU1d48ID+TOQ0lcMrGIspd/XA2QhWI3Qx2N4doYcklxruprAMyclq27Y1/6M8PyR52HPZDzbDrcqQsj5pgN0LxGWi1KjY26J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291035; c=relaxed/simple;
	bh=0hXwFoGYuDdVPmME9wVaGprT/NOSamKumbeC1/ux5Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axHM/2+NY0rpmPLVj3yqYzYbHjAxlQ1EuINpvYdqWhF6fKyRFSOSKwUJ3D+9mmR0BT8BmqjbLM6OF84hAG2CgwTB0XE93RH/oVLwKf8yOgd5kn+USn1/6piu+RCGLjjEOhnyp8FTmah9p6x9px3+aU1wWHXB/bSnGw1QBgQ3nvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz8t1758290981t77ee29e2
X-QQ-Originating-IP: c8xff3gMJrx6BoNwsH+6nJBZVwySXY19XV/90FS6mw8=
Received: from [127.0.0.1] ( [116.234.80.13])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 Sep 2025 22:09:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13887952541491144058
Message-ID: <C0056DA1635FC14E+7d3d6fb4-f43e-4107-baab-bbb871264c7a@radxa.com>
Date: Fri, 19 Sep 2025 22:09:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] phy: qcom: edp: Add missing ref clock to x1e80100
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Sibi Sankar <quic_sibis@quicinc.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, Johan Hovold <johan@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250909-phy-qcom-edp-add-missing-refclk-v3-0-4ec55a0512ab@linaro.org>
 <6A43111ED3D39760+a88e4a65-5da8-4d3b-b27e-fa19037462c8@radxa.com>
 <qohctzmztibeoy4jv6unsvevdawfh2h3drrneo5wmbfkirokog@pfaz3vht5kjz>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <qohctzmztibeoy4jv6unsvevdawfh2h3drrneo5wmbfkirokog@pfaz3vht5kjz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NqN/wpVFVRYXTETqIpE/ShUxpxhxFZIAAZG5TEJxdn8+jwImr19vh0ik
	qXPnnemUr8vRPLvlxpUf7oVQ6trGgUadog3xRDslkBhICa8QW4wCchpoHB2SOspORTqmPeq
	KAzaFuOSa6mpe3xh2aRhgBKu62Z2zVEgjX9YDd1LOBchTyxp06jjAayWXhfvzYtgSC8cAmQ
	D15/pHX3A+qTfXnrfHPSEbwTR8oMVO38urrs8dlQoagk7Vv9F57S5VuPsBfeduvPCkibenw
	1VvgLifKmTDnt9I/+X5E5HszmCfTjjdLtRuIEjG8VeOHzFQInaOOStIVQQHu1jT9aYP05iB
	P+QKuhwIjAjf11WrGmRqGM5soSGrh9zzuRVzxZ31s4jsGz4xoWGcJu91rY0e8B0eKNaGwos
	IXNn9XjeXdODM7rEhPC1ZsiYxRcpXV8CNX4eE6Ra95cLj59lUSapyd+xBp9JV7GCnyBNo9s
	9ekmGWbZ8xqyuwxd79XR3fHuIWxlvEQN6y+GEqgJCpM4K3xsmoQB3U2bQiGPBRRdZKuNuh0
	92MMB6aYv/L6fp8rzuIlz5FvKJhbhKVShByd+nG0BTym95D+mmdmQMn/7HdfrkOxZeZ7JDq
	ZA45IIHCQMVK71nBIb0S/G4YystNtMyjNNgLV/aK6ZyEXy4v7p0V6iz494iOjjKCWYHhn8C
	LDlgUf52MA6EoIOgV5coqz0FvDCO+EKplexh2tO8CmG/36CrLqzuI6FjuYxuOfBvAtaDLXx
	R7nWj9R4y6KiXUoJISEQwxd21kTK3jYCQgSy3po4tSyNF9VZ4KHUOpQ//BiedCAjg89JqVA
	lNnp38L0Mk72yGZG7TyKUtPqgJvS2+Y2UmDMtvkVajyTQNEAbEomu043gdNjLqGyE2JWxBQ
	MWOGV8ROvCTuB2seEK8omKWl5qFZnBKNpOMYfIAe8L5Pm9g0HBkJ9bRpNvM/cky+h0P7sA3
	yeqXuZ3j1RfkAOCFKgJ/jmFJFajJeVKseA+4K7IK+97Fp553uY65wYiRiaOzs42RqlXA2a+
	vLwhtWGBYy+XVtDyEVzemc9mfsED6fBCn1E6BGtAQxeq9l+FJRVxK2sSsT/Fw=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

On 9/19/2025 7:54 PM, Abel Vesa wrote:
> On 25-09-19 19:06:36, Xilin Wu wrote:
>> On 9/9/2025 3:33 PM, Abel Vesa wrote:
>>> According to documentation, the DP PHY on x1e80100 has another clock
>>> called ref.
>>>
>>> The current X Elite devices supported upstream work fine without this
>>> clock, because the boot firmware leaves this clock enabled. But we should
>>> not rely on that. Also, when it comes to power management, this clock
>>> needs to be also disabled on suspend. So even though this change breaks
>>> the ABI, it is needed in order to make we disable this clock on runtime
>>> PM, when that is going to be enabled in the driver.
>>>
>>> So rework the driver to allow different number of clocks, fix the
>>> dt-bindings schema and add the clock to the DT node as well.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>> Changes in v3:
>>> - Use dev_err_probe() on clocks parsing failure.
>>> - Explain why the ABI break is necessary.
>>> - Drop the extra 'clk' suffix from the clock name. So ref instead of
>>>     refclk.
>>> - Link to v2: https://lore.kernel.org/r/20250903-phy-qcom-edp-add-missing-refclk-v2-0-d88c1b0cdc1b@linaro.org
>>>
>>> Changes in v2:
>>> - Fix schema by adding the minItems, as suggested by Krzysztof.
>>> - Use devm_clk_bulk_get_all, as suggested by Konrad.
>>> - Rephrase the commit messages to reflect the flexible number of clocks.
>>> - Link to v1: https://lore.kernel.org/r/20250730-phy-qcom-edp-add-missing-refclk-v1-0-6f78afeadbcf@linaro.org
>>>
>>> ---
>>> Abel Vesa (3):
>>>         dt-bindings: phy: qcom-edp: Add missing clock for X Elite
>>>         phy: qcom: edp: Make the number of clocks flexible
>>>         arm64: dts: qcom: Add missing TCSR ref clock to the DP PHYs
>>>
>>>    .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 28 +++++++++++++++++++++-
>>>    arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 12 ++++++----
>>>    drivers/phy/qualcomm/phy-qcom-edp.c                | 16 ++++++-------
>>>    3 files changed, 43 insertions(+), 13 deletions(-)
>>> ---
>>> base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
>>> change-id: 20250730-phy-qcom-edp-add-missing-refclk-5ab82828f8e7
>>>
>>> Best regards,
>>
>> Hi,
>>
>> I'm observing what looks like a related clock failure on sc8280xp when
>> booting without a monitor connected to a DP-to-HDMI bridge on mdss0_dp2.
> 
> Am I to understand that this is triggered by this patchset ?
> 
Sorry, it's not indeed. I just saw this patchset and wondered if it can 
fix the issue on sc8280xp. Just now I tried adding the missing 
GCC_EDP2_PHY_CLKREF_EN to DT and gcc driver, but it didn't fix the issue. :(

> I don't see how though.
> 
>>
>> Do you think sc8280xp might require a similar fix, or could this be a
>> different issue?
> 
> There is no TCSR clock controller on sc8280xp, so it must be something
> else. My feeling is that this is probably triggered by the link clock
> source not being parented to the clock generated by the PHY, or PHY PLL
> isn't locked yet at that point, but I'm not sure.
> 
> I'm not able to reproduce this issue on my x13s.
> 

It only happens when mdss0_dp2 is not connected to a display during 
boot. I believe laptops usually use mdss0_dp3, and it's always connected.

I guess the Windows Dev Kit may have the same issue, since it also uses 
mdss0_dp2 as an external mini-DP port.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

