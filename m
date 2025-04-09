Return-Path: <linux-arm-msm+bounces-53605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDD4A81CB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 08:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56A8F17F476
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 06:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682811D7999;
	Wed,  9 Apr 2025 06:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFjjhB7O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C48259C;
	Wed,  9 Apr 2025 06:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179040; cv=none; b=RGeiO8UjOXPOF6PhtqBSlx+bnKOtXzB0dGrqlj4U+lvo/lCioFFKFFUhEWzQPizRCSutlKYuUyqdbuWwwwHpHSKxheSeArfQTbf7Q3gAAJXVFKu8Ou5q+JujdN8MEg0vqc66D6j3Jrx3YOzz9vC1ETNlWm02S4NWarJlJMVwxMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179040; c=relaxed/simple;
	bh=fcb3h/TEDOOZlExJ06Sjkb98E+IeGhwQKU9+F/GNFRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5QwVntinjB1E/mqVMx9bzE/T4/1xsR4IaJ19iHTnHlYdEyfQPZveR2WtDWJqscb3z9YFuJO4gwG6H2X98B5zW7W+FkQE1/EMkmSswwWU/5RNVAY0TlsJDtt81TWWiQsPlZz1pyin3ezK2OImly/fqEY1e7CQWskq4noxbuGOsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFjjhB7O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DC0C4CEE3;
	Wed,  9 Apr 2025 06:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744179039;
	bh=fcb3h/TEDOOZlExJ06Sjkb98E+IeGhwQKU9+F/GNFRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kFjjhB7OMiLNGC+dXWbTK4QwnM3o0/d2n/V7LlizQckxrTzu8gDgWExSbNImoTxgw
	 +/2yFkXEhi1qBJmD5Iy5wKR9hqPXk02fIMeDKR+UxMVukMjcGDcoXo1rIOFPBpb67U
	 /zF9qaw6zLTuNNv0PXEmQeFBXmlK8Sf6dEG5O17juczTSWlBZiATh3HMtave1QRAlg
	 QgAsrD4dDCbiZ2KtROtvwJkhkJXjn7UvdvJwpG9byNWJ/Mk3vD6a70LFiOCYv/6b0H
	 853j53LLyNBPQpi280S3SgSzwkrBaEGO1U/t0yKHetZFNHWIydIJy/AGA567wTGHHV
	 0D2CVI5CZppAg==
Message-ID: <7bbe235d-be3a-4851-b9db-c3c9e956a9fd@kernel.org>
Date: Wed, 9 Apr 2025 08:10:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
 linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andersson@kernel.org, konradybcio@kernel.org
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-3-quic_msavaliy@quicinc.com>
 <20250404-provocative-mayfly-of-drama-eeddc1@shite>
 <4fe9f898-63bf-4815-a493-23bdee93481e@quicinc.com>
 <e93c50ce-30dd-45ef-b945-019e703bd7c3@kernel.org>
 <6ab62bb9-2758-4a12-aec3-6de9efc3075a@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <6ab62bb9-2758-4a12-aec3-6de9efc3075a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2025 07:48, Mukesh Kumar Savaliya wrote:
> Hi Krzysztof,
> 
> On 4/9/2025 12:11 AM, Krzysztof Kozlowski wrote:
>> On 08/04/2025 15:23, Mukesh Kumar Savaliya wrote:
>>>>> +
>>>>> +static int i3c_geni_runtime_get_mutex_lock(struct geni_i3c_dev *gi3c)
>>>>> +{
>>>>
>>>> You miss sparse/lockdep annotations.
>>>>
>>> This is called in pair only, but to avoid repeated code in caller
>>> functions, we have designed this wrapper.
>>> i3c_geni_runtime_get_mutex_lock()
>>> i3c_geni_runtime_put_mutex_unlock().
>>>
>>> caller function maintains the parity. e.g. geni_i3c_master_priv_xfers().
>>>
>>> Does a comment help here ? Then i can write up to add.
>>
>> I do not see how this is relevant to my comment at all.
>>
> What i understood is you suspect about lock/unlock imbalance right ?
> I know that Lockdep annotations will be used to check if locks are 
> acquired and released in a proper order.
> 
> You want me to add below code in both the functions mentioned ?
>      lockdep_assert_held(&gi3c->lock);
> 
> What exact sparse/attribute can be added ? I am not sure about that.

I don't think you tried enough.

git grep sparse -- Documentation/
which gives you the file name, so:
git grep lock -- Documentation/dev-tools/sparse.rst

Use sparse instead of lockdep.

>>>
>>>>> +	int ret;
>>>>> +
>>>>> +	mutex_lock(&gi3c->lock);
>>>>> +	reinit_completion(&gi3c->done);
>>>>> +	ret = pm_runtime_get_sync(gi3c->se.dev);
>>>>> +	if (ret < 0) {
>>>>> +		dev_err(gi3c->se.dev, "error turning on SE resources:%d\n", ret);
>>>>> +		pm_runtime_put_noidle(gi3c->se.dev);
>>>>> +		/* Set device in suspended since resume failed */
>>>>> +		pm_runtime_set_suspended(gi3c->se.dev);
>>>>> +		mutex_unlock(&gi3c->lock);
>>>>
>>>> Either you lock or don't lock, don't mix these up.
>>>>
>>> Caller is taking care of not calling i3c_geni_runtime_put_mutex_unlock()
>>> if this failed.
>>
>>
>> I do not see how this is relevant to my comment at all.
>>
> same as above


>>>>> +		return ret;
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static void i3c_geni_runtime_put_mutex_unlock(struct geni_i3c_dev *gi3c)
>>>>> +{
>>>>
>>>> Missing annotations.
>>>>
>>> Shall i add a comment here ?
>>
>> Do you understand what is sparse? And lockdep?
>>
> Little but not clear on exact sparse attribute to be added. please help 
> me. if you can help with some clear comment and sample, will be easier 
> if you can.

You did not even bother to grep for simple term.


Best regards,
Krzysztof

