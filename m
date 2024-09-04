Return-Path: <linux-arm-msm+bounces-30685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC35496B855
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 12:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A244281543
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 10:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0EE1CF5C3;
	Wed,  4 Sep 2024 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLhLM1hm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BC51BD4E9;
	Wed,  4 Sep 2024 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725445467; cv=none; b=azi1KbSIyOkh4sya9wJzPcZbGo3X19QRlA8u0+jmRa7uRtc5EhVYB+TkwfAAYwKTyToAp4V+QOMwp8KrLn3DFEhNLnJSq0OKgItbmN12kPWQz0QleyoIrhf6azZ09Yem352gu8Jp57BsIcqbELG/RuU6KTu7luytOcncsRhc310=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725445467; c=relaxed/simple;
	bh=hQaX74NaYUbI2C72+e5ipVcgYZBCIbqMzA3PMn1lj/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IxHoJ8J2eBKTR55y9UHOVX3ersmDeHzGu6TOgEG2cBhVVRZxm7gTkxG2d+pIefAItqxSB+Ynqs30CN1xUJsM/xYBCvoTCkz8u9/VGxcVqzRsRTXwuPp5i/wk5NPL7NJXok31BhtMkRv+ekPf4b4HsSPASuJelbR6Vabb8LODGb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLhLM1hm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E27DC4CEC6;
	Wed,  4 Sep 2024 10:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725445467;
	bh=hQaX74NaYUbI2C72+e5ipVcgYZBCIbqMzA3PMn1lj/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hLhLM1hmOeP1NyQo+zXV4bnaxkBuvnCE3u211qScux7pO5VPzu6TigeJSCVZKITy6
	 hUMfDfKe9ij9lF+DGxX0DGjfdIQXGQk9YC3xaKPDMkSbvtv2qqs6Ah18P1IapkQ3zg
	 YdvURHL2RyiTkLpEZboJ3CLwpr1Qjm3arf0Pv7tvBURyhPJwW1zKvjc1LxofRLXgJ4
	 QljD6piSz0I8iXOjQ54kcPx7VBfjC1wDtrJyW1I/jyJCmhBXvhrHZaNzIPaklZ8+Yf
	 0m1qK2qjRRaJS9fBG6RKwBq39QwHvG14Femag1JIziXAjobfRzq3vsCFmOM6VehFsa
	 g1bVPlqbKtXQg==
Message-ID: <1be14849-ba98-432a-9686-e0189c9c7ffd@kernel.org>
Date: Wed, 4 Sep 2024 12:24:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/1] arm64: dts: qcom: Add coresight components for
 x1e80100
To: JieGan <quic_jiegan@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, Tao Zhang <quic_taozha@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Song Chai <quic_songchai@quicinc.com>, Yushan Li <quic_yushli@quicinc.com>
References: <20240827072724.2585859-1-quic_jiegan@quicinc.com>
 <f6813e5a-9b8e-4728-abb2-ad5926d6fa41@kernel.org>
 <ZtZmwVK8h//nDXm1@jiegan-gv.ap.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <ZtZmwVK8h//nDXm1@jiegan-gv.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3.09.2024 3:30 AM, JieGan wrote:
> On Mon, Sep 02, 2024 at 05:27:32PM +0200, Konrad Dybcio wrote:
>> On 27.08.2024 9:27 AM, Jie Gan wrote:
>>> Add coresight components for x1e80100. This change includes CTI,
>>> dummy sink, dynamic Funnel, Replicator, STM, TPDM, TPDA and TMC ETF.
>>>
>>> Change in V1:
>>> Check the dtb with dtbs_check W=1, and fix the warnings for
>>> the change.
>>>
>>
>> Applying this series and enabling CORESIGHT=m (along with all the options
>> in menuconfig) breaks booting on my X1E Surface Laptop 7
>>
>> Konrad
> 
> Did not observe any booting issues with our devices. Any relevant log to share?
> This patch also tested by my colleague.

Sorry, it crashes too early and my device doesn't seem to have an
easily accessible serial port. Does any of the functionality
described here require an unsecured device?

What tag did you test this patch against?

> 
> Can you successfully boot without the patch?

Yes.

Konrad

