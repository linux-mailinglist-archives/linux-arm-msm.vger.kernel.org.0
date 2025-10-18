Return-Path: <linux-arm-msm+bounces-77878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E244BED4ED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 19:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B410D5E99D7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 17:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40832257435;
	Sat, 18 Oct 2025 17:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="eRn7YjYp";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nb8NctA8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70426252900;
	Sat, 18 Oct 2025 17:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760807934; cv=none; b=FPBrW5lCU11OTCqos/4RjtMUTCr3d8Or5aud3PEBTLKtJU8RZahTIWfh0GSpQAk7jQUkX9kxVJYQ4oKR4q2r+XhuGDs5IIHEqNbroTKBzHkPjDpLax2E21AQRIgLUJ9AJQwKWhzOWm9f6pzVSuccily8V4B3k2w43xq2sjaBp+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760807934; c=relaxed/simple;
	bh=mZDIfCjgW+4CuS/ZjYde3Fi6Ww9P4szyaVI2r1EcYxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCLG0fPMV1wJeKYS5RPTjM8m5k8HIt/8+gcJITn5bNQ7CM3eakU2I9YOnLA8yYD4vS9qUX67HRCj4YkN6OwBtjbmioYwSb62lg04RluaQW3/+KMcKqkFNTj0WOr4unkfA5z+R9QQoU6Pab4vIs5tqNwtT53s8jaV51o1ADfxBuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=eRn7YjYp; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nb8NctA8; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1760807922; bh=VWGBpk/Pb1PaC49QZbcNZ7f
	NBul+/e7qAHsiMPGVHCE=; b=eRn7YjYp5es+fUVRICoOgNkZkmkzcy+f2ZAltmIEzDsiKird8q
	GzLQr1Q9CGx4ge5vte0AYUlpfS4YppQfLf0S21AuQqrzHXWzCIlFIrMrcytHCap0AyZ5opnxuyG
	npCx7eImRrqKQL3pf05wr7NRCBLxqVkmCihJyxOzgATAlqSuJVGBLzUHO0Z4+3tSeV9u5tThU9u
	WOhZHZNN5T6sBLjGRtMgRWiujaqj0Z5WgGxdEFJTGtYBNZSb2bBd7Ca+r38d7cCDxRX4RHXMaL4
	PqHrrnMTsetNViwGVOUi6n5CMlYeboI/p0eMw4I5GrXR+/g3G3LdHYmTpVHxSLOhnXw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1760807922; bh=VWGBpk/Pb1PaC49QZbcNZ7f
	NBul+/e7qAHsiMPGVHCE=; b=nb8NctA8d0rcCiqs3o4N3Q8A4o8nxYvQcx20+iCuxbjD9mmZFN
	BaadwWPGOqwotjusJqsLQfNL2+P/7d3iZJDw==;
Message-ID: <3c4b2915-6bf0-4067-966a-8fb13a81eed7@mainlining.org>
Date: Sat, 18 Oct 2025 20:18:26 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: adsp: Add SDM660 CDSP
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251018-qcom-sdm660-cdsp-v1-0-042e283db29b@mainlining.org>
 <20251018-qcom-sdm660-cdsp-v1-1-042e283db29b@mainlining.org>
 <57f5083a-cfe3-4a2a-9d0b-fa953b8db52e@kernel.org>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <57f5083a-cfe3-4a2a-9d0b-fa953b8db52e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


18.10.2025 18:42, Krzysztof Kozlowski пишет:
> On 18/10/2025 12:57, Nickolay Goppen wrote:
>> Add compatible for the compute DSP remoteproc found in SDM660.
>>
>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>> ---
>>   Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> index 661c2b425da3..19d16c97d8a4 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> @@ -24,6 +24,7 @@ properties:
>>         - qcom,msm8998-adsp-pas
>>         - qcom,msm8998-slpi-pas
>>         - qcom,sdm660-adsp-pas
>> +      - qcom,sdm660-cdsp-pas
>>         - qcom,sdm845-adsp-pas
>>         - qcom,sdm845-cdsp-pas
>>         - qcom,sdm845-slpi-pas
>> @@ -178,6 +179,7 @@ allOf:
>>                 - qcom,msm8998-adsp-pas
>>                 - qcom,msm8998-slpi-pas
>>                 - qcom,sdm660-adsp-pas
> Where is the constrain for everything else? clocks, interrupts and domains?
I think that cDSP and aDSP compatible should be both added to the "xo" 
clock, interrupts and "cx" power-domain constrains, but I'm not sure 
about that.
> Best regards,
> Krzysztof

-- 
Best regards,
Nickolay


