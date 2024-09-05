Return-Path: <linux-arm-msm+bounces-30903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FE996D8D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0D9728ADA3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C3F19B3D7;
	Thu,  5 Sep 2024 12:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pkPvFAdH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA0A19342A;
	Thu,  5 Sep 2024 12:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725539997; cv=none; b=jMG2udNmpGXckXmWThJehgO33Z+U6O+uEgvM7nMQAwQId9JN4TzVMNavozUf6ZQyuQ9Uv4+X6FhFeKA+te0T7ZKwQw3zF7yckt4rYMlBU0eYRTLeI9auPMNAjSdXxEeGtFhhUPN+lgNF5HQLguRpTH+814lbaSvLZwdQJJ7j0Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725539997; c=relaxed/simple;
	bh=9j1KjfMf0NG341CChvhkeV1HYjZA+7AlSIuPsckLYRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jiv/0SilW/vBG8TUcqJDeJ+3oH/tiN8eLZQPeTmnbapYnxVizoprE0YCy88bxHBjFYp5o+CwfLygLznhXoia1YwDt8Dv4wpJLt3hTZ7YLPx8Fdnu2iWXqsLdowO1sqXK41/Bb0iiqlhWoAqqxKhMMcn7zLdg1BxNOI8tq/8WN+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pkPvFAdH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB1EC4CEC3;
	Thu,  5 Sep 2024 12:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725539996;
	bh=9j1KjfMf0NG341CChvhkeV1HYjZA+7AlSIuPsckLYRE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pkPvFAdHHzT2pVM7m2vPaNUmaHitJKB/VOxmK5AMJ9k/aEEjv3OrBNgMQ0+ByA6Aj
	 sopG02JK7/ONIEwZG9flQ3kQDUAV4LcBFwRhBuGWwaBzypIoDBLduHDewrEendFfMI
	 wBkpDC00fznJAoAAOMKGwo1wsyiCxR3U8tctbvyOKIpczb0aarx15TU0e1jXznaEf6
	 4t+A2uaYsXwA+g3Dz4FWAYq+HViLlMnMNMfH3XLnBaPda4q/ojgkWDACOkHSitOnz7
	 wYSFNUbx5Ge9FEOo5kU2nofiUAVzZgg9RaVVvU43AmMD8TUQN732O/TneExmCpJHgN
	 rakqBeL5nnGdg==
Message-ID: <e868a812-def6-483b-95a1-ffc8e47d0577@kernel.org>
Date: Thu, 5 Sep 2024 14:39:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8939: revert use of APCS mbox for
 RPM
To: Konrad Dybcio <konradybcio@kernel.org>,
 Fabien Parent <fabien.parent@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240904-msm8939-rpm-apcs-fix-v1-1-b608e7e48fe1@linaro.org>
 <2a15105f-67e2-42f6-b624-562485b0bee2@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <2a15105f-67e2-42f6-b624-562485b0bee2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.09.2024 2:38 PM, Konrad Dybcio wrote:
> On 4.09.2024 8:26 PM, Fabien Parent wrote:
>> Commit 22e4e43484c4 ("arm64: dts: qcom: msm8939: Use mboxes
>> properties for APCS") broke the boot on msm8939 platforms.
>>
>> The issue comes from the SMD driver failing to request the mbox
>> channel because of circular dependencies:
>> 	1. rpm -> apcs1_mbox -> rpmcc (RPM_SMD_XO_CLK_SRC) -> rpm.
>> 	2. rpm -> apcs1_mbox -> gcc -> rpmcc (RPM_SMD_XO_CLK_SRC) -> rpm
>> 	3. rpm -> apcs1_mbox -> apcs2 -> gcc -> rpmcc (RPM_SMD_XO_CLK_SRC) -> rpm
>>
>> To fix this issue let's switch back to using the deprecated
>> qcom,ipc property for the RPM node.
>>
>> Fixes: 22e4e43484c4 ("arm64: dts: qcom: msm8939: Use mboxes properties for APCS")
>> Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
>> ---
> 
> This is fine as a stopgap solution, Bjorn can we push it in -fixes?
> 
> This platform is admittedly not of top importance.. but fixing this
> eventually would be nice
> 
> #regzbot introduced: 22e4e43484c4

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

