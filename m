Return-Path: <linux-arm-msm+bounces-28402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 542CE950736
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 16:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F22131F248E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 14:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C13E19D076;
	Tue, 13 Aug 2024 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esFCVw53"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2815419D070;
	Tue, 13 Aug 2024 14:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723558208; cv=none; b=nbxYYSW1lqPBHOfXZ15fJMxwH/BTMBDP/86UeLl2XRxPCwGenH7Yn+l0vuYbvHfL9OFINlusEL3NwtugpLgxMm3dzBIrQO3UJ4R9XxsAkUC1rxSlx6gx7XDDdCZkNjkLdqgNLgT/5n4keUP/VJy7LGHkv+0eLO/8OitCFIgUXQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723558208; c=relaxed/simple;
	bh=RpIFegKVGdY2i1i7rxQWNRzkKROe7/96ZO1cRg22JhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ocODuEmAKuzikxChK4KPLwOw9CYA7IA98WnpEoOYiCtcky31CM3pPTNKXtH21zQZ+GnIruXkcmEUc6D6xL4xyMAtG5WNxTB0POdMBbm6zXleIosTHgM/fwDTgHUQAzEmTrBlH/uCPGaUgLpRP1BXWChbIbkG7Ic8DMqFO053Ips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esFCVw53; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF90C4AF0F;
	Tue, 13 Aug 2024 14:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723558207;
	bh=RpIFegKVGdY2i1i7rxQWNRzkKROe7/96ZO1cRg22JhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=esFCVw53/LXr1OUIv+mJDyM9PfcRbQ/8KDV66i4DHQWsdEL8nUvquKt6nl1S5judJ
	 A6/jhFHZdWceoxjFOBeNg7lA1vXdktI7aXi7SAnXMJ+QcJ8TcOxibVyCiryqVNwvJN
	 x5IIpNPRTqmlgQaB47mhH4J0KO3iWYpkIL+LfEV3hw3H8+KoEtvDqnHlTALbEYFNZ/
	 LCp/Te8aL7iLjFNScLdMavMyAJSus/hbWj9DB+hkvOMdZpaRuKRoGvEhXcLgnf0uzu
	 nqW3j3KWwAttWreQ5rkD0I+LJR5GlHFi53pC9059Skmyhd0EWxQSYD5ibhUG2XH0RG
	 eSk0lvdiQFh1Q==
Message-ID: <cec50e6e-aa5e-42a0-886c-82f3f1062d3a@kernel.org>
Date: Tue, 13 Aug 2024 16:09:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: Add USB Multiport
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krishna Kurapati <quic_kriskura@quicinc.com>,
 Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20240809-topic-h_mp-v1-0-3c5f468566d8@quicinc.com>
 <20240809-topic-h_mp-v1-2-3c5f468566d8@quicinc.com>
 <b37b3c8e-902f-4a62-8a6a-ab9b8cb6cadb@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <b37b3c8e-902f-4a62-8a6a-ab9b8cb6cadb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.08.2024 2:48 PM, Krzysztof Kozlowski wrote:
> On 09/08/2024 15:18, Konrad Dybcio wrote:
>> X1E80100 has a multiport controller with 2 HS (eUSB) and 2 SS PHYs
>> attached to it. It's commonly used for USB-A ports and internally
>> routed devices. Configure it to support such functionality.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> You have from and SoB mismatch. This was sent some odd way, because both
> b4 and git send-email would produce correct From field.

So, I'm:

- sending from @kernel because it has a good email server
- authoring from @quicinc because that's my employer
- sending some older @linaro patches because I made them before
  switching jobs and it's only fair to do so like this
(and I sometimes reply from @gmail because thunderbird works funnily)

I noticed locally that if you switch emails & edit author too often, git
gets confused and `git show` Author: / `git send` From: don't get updated
properly, but if you do git format-patch, the resulting file has what you
would expect..

Should I resend this?

Konrad

