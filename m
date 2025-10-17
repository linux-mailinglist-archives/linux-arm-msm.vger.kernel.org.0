Return-Path: <linux-arm-msm+bounces-77824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F42BEB550
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 21:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6FDC735D9C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 19:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E6433F8B3;
	Fri, 17 Oct 2025 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="j0xAkt8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E533F8A7;
	Fri, 17 Oct 2025 19:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760727941; cv=none; b=JzDMR6ndwCNS8YEOLVybPr1HLx8urtjAE3mqsWh/BhdLMjE21Tyg2jVCtxGmYzPhV9hJHPf9JQV0pLzNP3j91AHRUpRJQ5CmwzH2oDaNSae/vSMFUV4FTNPdofjWXwFXRFWc8+jKAzAycZxDVdsjfod/qD1JagID3Fs7eV/r8IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760727941; c=relaxed/simple;
	bh=EAZ20eAFYtrCKWFpLn1xY8QMM/Vv8cQrzxqTpD3ltts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjT9J55/dHsZE+4EWBb4HrxGwBKJAA14bWWl3Sb0LmU7RU2Us/G0ZJHrAENygpDuHjJeikhw8EWY3mXcAXEetyYyT/r9lExmO74jcDm3mgZym+mo0vpQAZf66jfellCFpLEgdgrysNIX0RsoY8kA63purM7wAIja4f5gGYrgaq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=j0xAkt8F; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=+wIx9xQFFwn6Kvjt5KdJkNScO1SwKhEm4dQYZjip9DQ=; b=j0xAkt8FRdmIAXtBxWlVY+EOjN
	GADL9Mv/sIOWib0yRu2vlh/z1GX8FDUZX3+BTcIXwO+6aQiv7aVk2JBJHus3PyDg0a/hlgF3sIZXl
	bRVeMNQHq6S10vWAczH76Ev5OAn3GhAKPMobtLddNfbLPP9Ia8oZe570hIkuFoVUx7XOW61gk2LV7
	ZW7Nnb74JcCy4zeQWgZr7y3gUcUQu7XYBJmmHqlANIGqN4hn2FqMe5Nf8hp39qNlRfx2pungyscut
	FTTHbSkIo6iZKkt9MhNm6WwN/mL21E+4eCu5qWI8EA5+5ZfOCbskFgX6YcPZMjm/sWhx/PJV4uIVz
	bA2lu7Lw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pli-00000008nXm-3laS;
	Fri, 17 Oct 2025 19:05:38 +0000
Message-ID: <dcb8e0ac-ed47-42a2-9882-c2cd6d6cd6fe@infradead.org>
Date: Fri, 17 Oct 2025 12:05:38 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: tzmem: area: fix qcom_tzmem_policy
 kernel-doc
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20251017070702.1637092-1-rdunlap@infradead.org>
 <dfc03399-d4f8-4e52-b097-75fbbfd1c8f7@oss.qualcomm.com>
 <CACMJSetEtS6n8cA0bnH2VORw_4b3Jpw74nqNAqE4W8XLKo6grg@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CACMJSetEtS6n8cA0bnH2VORw_4b3Jpw74nqNAqE4W8XLKo6grg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/17/25 1:25 AM, Bartosz Golaszewski wrote:
> On Fri, 17 Oct 2025 at 10:17, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 10/17/25 9:07 AM, Randy Dunlap wrote:
>>> Fix kernel-doc warnings by using correct kernel-doc syntax and
>>> formatting to prevent warnings:
>>>
>>> Warning: include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
>>>  'QCOM_TZMEM_POLICY_STATIC' not described in enum 'qcom_tzmem_policy'
>>> Warning: ../include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
>>>  'QCOM_TZMEM_POLICY_MULTIPLIER' not described in enum 'qcom_tzmem_policy'
>>> Warning: ../include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
>>>  'QCOM_TZMEM_POLICY_ON_DEMAND' not described in enum 'qcom_tzmem_policy'
>>>
>>> Fixes: 84f5a7b67b61 ("firmware: qcom: add a dedicated TrustZone buffer allocator")
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> ---
>>> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>> Cc: Konrad Dybcio <konradybcio@kernel.org>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> ---
>>>  include/linux/firmware/qcom/qcom_tzmem.h |   12 +++++++++---
>>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>>
>>> --- linux-next-20251016.orig/include/linux/firmware/qcom/qcom_tzmem.h
>>> +++ linux-next-20251016/include/linux/firmware/qcom/qcom_tzmem.h
>>> @@ -17,11 +17,17 @@ struct qcom_tzmem_pool;
>>>   * enum qcom_tzmem_policy - Policy for pool growth.
>>>   */
>>>  enum qcom_tzmem_policy {
>>> -     /**< Static pool, never grow above initial size. */
>>> +     /**
>>> +      * @QCOM_TZMEM_POLICY_STATIC: Static pool,
>>> +      * never grow above initial size. */
>>
>> Didn't know inline '*/' was cool, but if the checkers I'm happy, I'm not
>> going to complain either
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
> 
> Yes, very surprising. Almost doesn't look "right".
> 
> Anyway:
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Darn. It looks OK but it totally confuses scripts/kernel-doc.
It has to end with a separate */ for each comment.
I'll have to resend this patch.

-- 
~Randy


