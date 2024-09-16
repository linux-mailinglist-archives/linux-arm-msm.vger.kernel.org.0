Return-Path: <linux-arm-msm+bounces-31874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B597E97A9AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 01:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73C0F288080
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 23:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFA214A4DE;
	Mon, 16 Sep 2024 23:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Id6+NxeH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB87381C2;
	Mon, 16 Sep 2024 23:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726529752; cv=none; b=VZ2zUFG47Jn6rrMj2qzqrdT3zVMgW+ewiECF85fOmqbrrnNxVhWEIcc6cxBab/lbS8w1XyNN19B8Qs4fFnfbcOqYKgvHOF6sDsoNEQvkraoItH6jCe444CWySQapd497PSQTJXu1Of++E1TVXuOJPmNILrzMiDxjGzwHjnL4mqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726529752; c=relaxed/simple;
	bh=7xpeg/FjbhZKUpOgUXcHxxEmx789PGqYbNLkHng/wis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9T6c+2d+U28inyGMSJYMs3/RTC5XfcHKXj0jovHiBBcbpOAPhgxSBqGMsNSxaf7Kf1uAZSjB7ifCd7wkbbY5mh0F3U+l6V2r9v1KddcsNuNOehJEdaDe+LWmlzy7SouUaiT5WNAGvSnb9jFrRuMMLiwRxgVPmkxA3WsQMG/CAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Id6+NxeH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F2BC4CEC4;
	Mon, 16 Sep 2024 23:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726529752;
	bh=7xpeg/FjbhZKUpOgUXcHxxEmx789PGqYbNLkHng/wis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Id6+NxeHh6z56WCWrAKMc8Vs/K+mS/zzA0XrQnj7E6TesMMR2VQXdDisVAOayl5d4
	 r2F3aC18Lte49WBax0GhXa2UM632XTPtL+6NpiojWZ/LJAkEtnS6yZzpe9mPsk3y5L
	 f2RnKEAIxpvX0np/ZKksKJgNHm7IvxcUXhCztVs7yZZl4zMCESmMFtUS0JqzP2Jvx9
	 Ff0lCeHFRXUITuGsxEK9KmzxvZ1TESlQy2xD3TprT3RqMG00p903CxFLDKSfKsZkKz
	 rlDO79A5t1Zfh1UKg4d2fVvNKTJnzuSS5Pzmr3aMfuW1A3of8FepGArcHADFvRUJib
	 QKN5zFuTUI6aQ==
Message-ID: <f2d3d18f-f671-4616-a722-2e41c8e50939@kernel.org>
Date: Tue, 17 Sep 2024 01:35:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: add DisplayPort device node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com,
 quic_abhinavk@quicinc.com
References: <20240916091344.27607-1-quic_mukhopad@quicinc.com>
 <ivbohyezb57mcqgfnjot3j2olgj4kvyoq2fjstgugscagsmlg7@vav3cbokzg7q>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <ivbohyezb57mcqgfnjot3j2olgj4kvyoq2fjstgugscagsmlg7@vav3cbokzg7q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.2024 4:01 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 16, 2024 at 02:43:44PM GMT, Soutrik Mukhopadhyay wrote:
>> Add device tree node for the DisplayPort controller
>> and eDP PHY found on the Qualcomm SA8775P SoC.
> 
> Not quite. You are also enabling it for the RIDE platforms, not just the
> SA8775p SoC.

(the patches should be split into soc and board parts)

[...]

>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						dpu_intf0_out: endpoint {

Please add a newline between the last property and the subnode

Konrad

