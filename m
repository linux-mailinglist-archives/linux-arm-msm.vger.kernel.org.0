Return-Path: <linux-arm-msm+bounces-28471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E6A9518D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 12:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D64B1F22238
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 10:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6B11AE044;
	Wed, 14 Aug 2024 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjLOT/ol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6F81AE038;
	Wed, 14 Aug 2024 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631410; cv=none; b=ZLyjdtL/3pt90LYE71trYjSNm750Cx2ZwIoAsLJYiObvlVq6L+JzMeVPU7AUjbPFVu6Yu2uiTKWYNuKa1CwhpR7OW5vFtxp94qV78k8p3uyEmJv7j3Dfpc0gG7lyOFODF34GVDxNXpVwfAbGU/vaaNOMlLqg4vYh7HYHJV8ScV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631410; c=relaxed/simple;
	bh=K6G/iVkagitlkBAW0XnQFiBIC8Njt7zMbRnHDyYHvUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QamOAmrvoAji/ASX2JKrCM11HTOaC0UydA9yaBBiLDm2i5ngKrqeXoqudRqzz6mHnjw4dtI4zPMt4WuHLXJX7Oq4f84qt8jpI9VNoUYRLvJKWG2crO/pmenEVxXsNerQXOehtBCBWrrqdHIP/M+5oJCCWRduu9IFe0iu/LWVmss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjLOT/ol; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6341CC4AF0E;
	Wed, 14 Aug 2024 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723631409;
	bh=K6G/iVkagitlkBAW0XnQFiBIC8Njt7zMbRnHDyYHvUQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MjLOT/olQjjNrZ+8agrDv2BJZ19s9teYUeSjYjm8BBAOKtr57qk7/vLb/3NL2TNrt
	 JgF1Lz8EBaHOKikZc3SnaIqPRgsPtgWS74FJoOxhqc1evCdJ0Qo2A2H8uMHMEAMWSi
	 gfb4UgilueqsU+UfeCSjIRscXOggWsMMr0of33rmQ5LUaZGopEThu2Kw9Vr84eH+d9
	 CSy20MK2LZ5V1KcxlJ8+VZEyL0N3KMqCaSaS+s7bxkc0t9XqtZZ8lN0F+Mjz3IG94p
	 ublPVW9Farfa4s9+aulpBThqC/prcmT6frRkrX6QHuWQ5CH4QNxNnSJBfZH8AnkZw6
	 m4lPcYk8n0DSw==
Message-ID: <2b118a49-2229-4346-ab21-0aa5377d7a4e@kernel.org>
Date: Wed, 14 Aug 2024 12:30:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: qcom: eud: Update compatible
 strings for eud
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Melody Olvera <quic_molvera@quicinc.com>,
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Trilok Soni <quic_tsoni@quicinc.com>,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 Elson Serrao <quic_eserrao@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20240807183205.803847-1-quic_molvera@quicinc.com>
 <20240807183205.803847-2-quic_molvera@quicinc.com>
 <dfb1ac84-f011-45ea-9fb1-b8c6bc36cabc@kernel.org>
 <46d0627d-877b-41f3-83f6-4c33b562f460@quicinc.com>
 <0ebb1ca3-722d-422f-9f71-fcc61c3470b0@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <0ebb1ca3-722d-422f-9f71-fcc61c3470b0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2024 8:15 AM, Krzysztof Kozlowski wrote:
> On 13/08/2024 22:03, Melody Olvera wrote:
>>
>>
>> On 8/8/2024 4:00 AM, Krzysztof Kozlowski wrote:
>>> On 07/08/2024 20:32, Melody Olvera wrote:
>>>> The EUD can more accurately be divided into two types; a secure type
>>>> which requires that certain registers be updated via scm call and a
>>>> nonsecure type which must access registers nonsecurely. Thus, change
>>>> the compatible strings to reflect secure and nonsecure eud usage.
>>>>
>>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml | 6 +++---
>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>> index f2c5ec7e6437..476f92768610 100644
>>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>> @@ -17,8 +17,8 @@ properties:
>>>>     compatible:
>>>>       items:
>>>>         - enum:
>>>> -          - qcom,sc7280-eud
>>>> -      - const: qcom,eud
>>>> +          - qcom,secure-eud
>>>> +          - qcom,eud
>>> Commit msg did not explain me why DT bindings rules are avoided here and
>>> you drop existing SoC specific compatible.
>>>
>>> This really does not look like having any sense at all, I cannot come up
>>> with logic behind dropping existing users. You could deprecate it, but
>>> then why exactly this device should have exception from generic bindings
>>> rule?
>>
>> Understood. I won't drop this compatible string. Is alright to add the 
>> additional compatible as is?
> 
> You always need SoC specific compatible.

Melody, is there any way to discover (that won't crash the board if we
guess wrong) whether secure accessors are needed?

Konrad

