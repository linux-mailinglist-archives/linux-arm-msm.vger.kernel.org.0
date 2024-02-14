Return-Path: <linux-arm-msm+bounces-11109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E94D885551D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 22:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75DEE1F2BC86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 21:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC28D13EFED;
	Wed, 14 Feb 2024 21:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INmBAELm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7C31DDC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 21:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707947101; cv=none; b=IUtEIegId1Oc4CFIlmKk2OHMtG3qwZPSovKAP0tizuin2W6r8ayOw5fkr4j5tAiYUL6p8SpgUueERa+14x17627DxQdFj974GUQWM8H+05ieN61R/yd33BukN1b4HPuvFSbfq6wFjs9nvD4AIcSzycUMPpigbgXMjjfsgomouOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707947101; c=relaxed/simple;
	bh=WwB54VZSMOscCJiKjV4QGINiMYG69OwYG4108VCNzDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmRalRsFzBGebVCs072KLB6Pf64LtTIdQhs3iswvOq16DdQNNAEh77SDokC1OAEfBLv4nnoctzp0pE3EfvFzXNCcMAYfPaqxlbEHtrUjGreK7woy5DhA208tCCz+oqdbNVgt/yJe95r49Uu4hrTZh7kX/ZwJMUUF4QjDw5QMGMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INmBAELm; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-563a1278f9dso259027a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 13:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707947098; x=1708551898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kM8q6lBrSyWKTQJ/0KMvCSF6hAgwRMBwXudXA6ftT+o=;
        b=INmBAELm8Of6rVSlSV70x9R12Fo02AWFbQcdPcpQ7exCiJNf3wXhsnyX+Ebqa41+RR
         SZyH1t9S1U49yWcP9dtHzros9NqSM95w3bO1t7f8++x/w4S2vTFA0hsWhUIrVAmQApEI
         ih7rVlmQZrJ61OoeGxHCEvBiyIQuB8PP4erxd459Ne6pbxXuiUXf736tk0SKjTzSzOLt
         VoXz3gB+Ozc/IwIms6hw6kwwGkwaeqoKkkC4zvKkNrNcs2VCgqfk3xid2tiOsQxGAKXF
         vtYOVxP5TO7yAXCzqCwB9eIDvuYZavSV6ePZRT5u47ARJwk6FrwDZHvu6kC8hx4UOPnj
         YxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707947098; x=1708551898;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kM8q6lBrSyWKTQJ/0KMvCSF6hAgwRMBwXudXA6ftT+o=;
        b=UQCSIL5lTuOCJ0ckx79JMMcIzDnOi+wozqTD7a4sLTlJixte4y6R8JpidyTxEPokUl
         6iw+Yz/vyDnO1i7b8kvaxZaSC8vEIx3ANwBaUpK3eD2xqEPAtnrNr1BbNascSClaOZea
         iKFlfouTtO6ZKiL0UDqK8IoiR1CSUgkaFvQNFLL+pm51FD/d5NYIza1aCFFGl2o7+303
         FIPCrwPSfUMeSYRoI+zpKR2DuIkDh5IHDy4AYw1H6gPR5wyUeQLXFfUqK9sE+o5jNGYi
         Fp35c2FvxE4Uaa0SOkH1DmLCHVKqcWukvyHlJRC6Tr0cT5pT7NUeQb8MRjJhX9689wGV
         27QA==
X-Forwarded-Encrypted: i=1; AJvYcCUxC6yHjt85i8mnS2jdfYzTSc0jYwBwH66a9Nony5cS6740eooB0nkVTY49Y6UD9qoOGJ6YEeozhs/hNWVjoUnEZsNw3+uZqI4ZiL9EYA==
X-Gm-Message-State: AOJu0YxZjtHwD057oZQ8hLaZurUWIQOmS+XbhM4ZARYz9k6DANpuxqRb
	wKm+4ToFsEm0VqxlUy2iglDh2Qi7WJuuiTqq5APcs9aQ25Wg7dTUZWNFozJWuzg=
X-Google-Smtp-Source: AGHT+IG4ZYi85zothxaHsK/GpQL0cHVciztRWwpTNJuz+c7k7+DvWxIuTbQburnCCNtF5XtUrqihHw==
X-Received: by 2002:a17:906:1702:b0:a3d:7cf5:c2bd with SMTP id c2-20020a170906170200b00a3d7cf5c2bdmr290856eje.4.1707947098002;
        Wed, 14 Feb 2024 13:44:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTTFv9ej44nyXgjNNRVDKsHO6Zjdx38niJkJ8JthLWIWRbU27+CavjPL3CWI0v0IUt+xfttiRTT1sjtVEop6eSUTgNaM3kkYMExT3SaDTGmmATHuWV5ZC5/nug7Jwy+94SVuVFnHm0SwfXQMdy+xZ/MYHqgzsSTkNAz5n7kBrofAzxvj7P3gGA3haEnt3d1x28TFBmyXJwJDl9LLGbGtXl83e54IcX/svAvfxNyxIInYfVAp8MQciFgHYMHFz3QZzhYjRoDUD+bOpSYoaiK/IWIfylJ3Hcb2UQiUOdxpY5Weh3iotAYrBbauoK7XW44UmWxH1GGAdYf2aUvWV/CB7V50Gnpvh4+rnrGCwhAVSyGcUuerGnj7E7xpAe+q6UFjs8jw/Qj628RNAbb8s1IT1RkE7+6tjN5KzGkVus8/I7kvzREDT0R0uMzNnRL0RYU4Qb/oj1MlbF5RTUlm+7+wVazSnNrCm4HeyRre/jGSG2cqnl3m0JoQ==
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id sa4-20020a1709076d0400b00a3d841e627bsm51757ejc.58.2024.02.14.13.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 13:44:57 -0800 (PST)
Message-ID: <5e878fd9-8215-499d-ac1c-191cb5bfe798@linaro.org>
Date: Wed, 14 Feb 2024 22:44:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 3/4] spmi: pmic-arb: Make core resources acquiring
 a version operation
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-3-0bae0ef04faf@linaro.org>
 <d9d8e86b-a499-49d1-90ad-6fae5b7dcbb7@linaro.org>
 <Zc0yXR/fC2OcObLB@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <Zc0yXR/fC2OcObLB@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2024 22:36, Abel Vesa wrote:
> On 24-02-14 22:18:33, Konrad Dybcio wrote:
>> On 14.02.2024 22:13, Abel Vesa wrote:
>>> Rather than setting up the core, obsrv and chnls in probe by using
>>> version specific conditionals, add a dedicated "get_core_resources"
>>> version specific op and move the acquiring in there.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>>  drivers/spmi/spmi-pmic-arb.c | 111 ++++++++++++++++++++++++++++++-------------
>>>  1 file changed, 78 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
>>> index 23939c0d225f..489556467a4c 100644
>>> --- a/drivers/spmi/spmi-pmic-arb.c
>>> +++ b/drivers/spmi/spmi-pmic-arb.c
>>> @@ -203,6 +203,7 @@ struct spmi_pmic_arb {
>>>   */
>>>  struct pmic_arb_ver_ops {
>>>  	const char *ver_str;
>>> +	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
>>>  	int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
>>>  	int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
>>>  	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
>>> @@ -956,6 +957,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
>>>  	return 0;
>>>  }
>>>  
>>> +static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
>>> +					  void __iomem *core)
>>> +{
>>> +	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
>>> +
>>> +	pmic_arb->wr_base = core;
>>> +	pmic_arb->rd_base = core;
>>> +
>>> +	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
>>>  {
>>>  	u32 *mapping_table;
>>> @@ -1063,6 +1077,41 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
>>>  	return apid;
>>>  }
>>>  
>>> +static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
>>> +{
>>> +	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
>>> +	struct device *dev = &pdev->dev;
>>> +	struct resource *res;
>>> +
>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>>
>> It's no longer indented to deep, no need to keep such aggressive wrapping
>>
> 
> The pmic_arb_get_obsrvr_chnls_v2 is used by both:
> pmic_arb_get_core_resources_v2
> pmic_arb_get_core_resources_v7

I meant line wrapping

> 
>>> +					   "obsrvr");
>>> +	pmic_arb->rd_base = devm_ioremap(dev, res->start,
>>> +					 resource_size(res));
>>> +	if (IS_ERR(pmic_arb->rd_base))
>>> +		return PTR_ERR(pmic_arb->rd_base);
>>> +
>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>>> +					   "chnls");
>>> +	pmic_arb->wr_base = devm_ioremap(dev, res->start,
>>> +					 resource_size(res));
>>> +	if (IS_ERR(pmic_arb->wr_base))
>>> +		return PTR_ERR(pmic_arb->wr_base);
>>
>> Could probably make it "devm_platform_get_and_ioremap_resource "
> 
> The reason this needs to stay as is is because of reason explained by
> the following comment found in probe:
> 
> /*                                                                           
>  * Please don't replace this with devm_platform_ioremap_resource() or        
>  * devm_ioremap_resource().  These both result in a call to                  
>  * devm_request_mem_region() which prevents multiple mappings of this        
>  * register address range.  SoCs with PMIC arbiter v7 may define two         
>  * arbiter devices, for the two physical SPMI interfaces, which  share       
>  * some register address ranges (i.e. "core", "obsrvr", and "chnls").        
>  * Ensure that both devices probe successfully by calling devm_ioremap()     
>  * which does not result in a devm_request_mem_region() call.                
>  */                                                                          
> 
> Even though, AFAICT, there is no platform that adds a second node for
> the second bus, currently, in mainline, we should probably allow the
> "legacy" approach to still work.

OK right, let's keep it.

Konrad

