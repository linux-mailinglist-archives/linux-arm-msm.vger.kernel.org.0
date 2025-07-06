Return-Path: <linux-arm-msm+bounces-63850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 601D5AFA518
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 14:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C91483B30A5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 12:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959151FFC74;
	Sun,  6 Jul 2025 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="JhQvPAHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7902954652;
	Sun,  6 Jul 2025 12:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751805156; cv=none; b=Qh4haNGk13O6BGid7QTPVYtTlThU/HFbthgbIzjJeVFO/N/mnGGg9Ov2DcJeGIBNnqiW8pzXkmNlRH6u6rarSNcs4RmHU/nOzo0RNxvo2u/v8nfGrLr+hNIaSSc1Sdnrn/Ij3kih3QIpN5/I8Uy9wiyyT7ic2mOomUl/QblhCwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751805156; c=relaxed/simple;
	bh=nukMN18DhY6oFRff9ULjKE8c1DQ0EfuB5KKmA5eW7lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gs/DIS0+0AvwgJolV8Mdu+OlCEMs2xG1f4jEsqyJPz0mpMlAMi7EnZsrkn4g5CTuVNL6OF9+CQvG4LvO+232mKfuWD0mVSQTsScyetPNU+FDGCzkfrCKYevGVAQrp98ELhoTK4QKfN+t5w38ysDUbyhZ/U5tz36FtK32TAmFm9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=JhQvPAHL; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1751805147; bh=nukMN18DhY6oFRff9ULjKE8c1DQ0EfuB5KKmA5eW7lk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JhQvPAHLRCPrwm36KV3JxO1Ox04pjiO0+lQxpTxCQHuYzgEf3Eulf6YIzkE6njxBh
	 FUjdsC4pwHLuSeyLfjnGKDxSF8tX191KXv9sCoFQ4IWsuVpPH0iJOMDx2iKGCUsDyM
	 liCb2gikNmHYY12pBj4Wwomh1V31LkUZPxu1QgYA=
Message-ID: <6733d2ca-f73b-4332-97c3-ba79377538c2@lucaweiss.eu>
Date: Sun, 6 Jul 2025 14:32:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] remoteproc: qcom_q6v5_pas: Use resource with CX PD
 for MSM8974
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
 <hwewzj4ygfbb22vxrahjfc3b4oxyagh3nkd26bs3p5k2fcxr6m@mkgtyjkxz3d7>
 <226fd16c-8071-43c7-9ecc-9bd95e319aaf@lucaweiss.eu>
 <znv7ish4ufkgnzfwyxjt2ercdvemxh644zwpqthj7rtf5gb4fe@auvbeemdlbtk>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <znv7ish4ufkgnzfwyxjt2ercdvemxh644zwpqthj7rtf5gb4fe@auvbeemdlbtk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06-07-2025 12:08 p.m., Dmitry Baryshkov wrote:
> On Sun, Jul 06, 2025 at 10:31:38AM +0200, Luca Weiss wrote:
>> On 05-07-2025 10:57 p.m., Dmitry Baryshkov wrote:
>>> On Sat, Jun 21, 2025 at 03:19:57PM +0200, Luca Weiss wrote:
>>>> MSM8974 requires the CX power domain, so use the msm8996_adsp_resource
>>>> which has cx under proxy_pd_names and is otherwise equivalent.
>>>>
>>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>>> ---
>>>>    drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> Hmm. You are modifying the ADSP configuration in the driver, but at the
>>> same time you've dropped CX supply from the MSS remoteproc.
>>
>> The qcom_q6v5_mss driver has this support for .fallback_proxy_supply, which
>> are used in case the power domain is not specified.
>>
>> So no driver change is necessary in the mss driver for both old and new
>> devicetrees, but the adsp driver does not have this fallback, so that's why
>> the adsp config is updated.
>>
>> Does that make it clear?
> 
> Yes. Would it make sense to implement fallback_proxy_supply for ADSP
> too?

Definitely would be possible, but I don't see the point in doing the 
work to implement this, to then carry around a bunch of legacy 
compatibility code that (very likely) won't really be used in practice.
I don't think any platform apart from msm8974 are going to be affected 
by this anyways.

Still same argument from my side, I think breaking compatibility here 
for this one driver outweighs the effort/code of implementing compatibility.

Regards
Luca

> 
>>
>> Regards
>> Luca
> 


