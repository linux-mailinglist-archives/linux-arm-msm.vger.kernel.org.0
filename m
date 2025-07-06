Return-Path: <linux-arm-msm+bounces-63860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFAFAFA631
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 17:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A97B53B117C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 15:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37931FCF41;
	Sun,  6 Jul 2025 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="js7udxOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723F6846F;
	Sun,  6 Jul 2025 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751816109; cv=none; b=uLoL5OTyGnwTA6aj3UCrq414Ww3Hs/XuVehyIQ1Wdhtc+XiNSddGXT1iKVLzqc9Zdr8A7RU1PriKT0ZMnr2QFqcXJEXFbrQijc1spis1PL0b7mz2vk6V9YNke1Ex2B6KhHOEGqq+4Bn9lsNgCeojY45D1y0Yv+d4LPV/j2UiV4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751816109; c=relaxed/simple;
	bh=rlwxG7sH1Lq1ELPmVXXMdJGBsVnrQjyv03fZYRTg4/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axbTZYUMOFpQqLItEVzKhZ4b1UaxIadluoapqYVOov5DlhWUweCHNr1eb2StKgP4JT7KGT3NpoAnJW7xfcxrSlbrWr6BUNBXnHwS9mndqG4sE/croXJ9m5gqhwTjcAdmpsZyGu/4o4Z2BsRYqlpn/Kbs4xY2XO+nczI43VTYs9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=js7udxOY; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1751816105; bh=rlwxG7sH1Lq1ELPmVXXMdJGBsVnrQjyv03fZYRTg4/0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=js7udxOY9UmQ1UnPxiw/HUGfT8IkgYp51hh2yw4EAAvE3Vau49O+k5QpI9nRELJDK
	 ojaK3SxUCd+fUuHNyGr6HZfp0AnaQBT+umlJmjGinLoyNwyEt8pcjbNQRvA/A4pmZR
	 TXfez3gdOv1CjJtFQ+AMP/qrHCQ+nRtdABUuVlyU=
Message-ID: <0fb280c0-803d-439f-9ce4-5a0074b58a93@lucaweiss.eu>
Date: Sun, 6 Jul 2025 17:35:04 +0200
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
 <6733d2ca-f73b-4332-97c3-ba79377538c2@lucaweiss.eu>
 <huvsqr3hxkeerjevhvjobfyxzfjldoawlgj6xgmdgf27kwbea4@ijh6gqbsa35i>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <huvsqr3hxkeerjevhvjobfyxzfjldoawlgj6xgmdgf27kwbea4@ijh6gqbsa35i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06-07-2025 3:17 p.m., Dmitry Baryshkov wrote:
> On Sun, Jul 06, 2025 at 02:32:26PM +0200, Luca Weiss wrote:
>> On 06-07-2025 12:08 p.m., Dmitry Baryshkov wrote:
>>> On Sun, Jul 06, 2025 at 10:31:38AM +0200, Luca Weiss wrote:
>>>> On 05-07-2025 10:57 p.m., Dmitry Baryshkov wrote:
>>>>> On Sat, Jun 21, 2025 at 03:19:57PM +0200, Luca Weiss wrote:
>>>>>> MSM8974 requires the CX power domain, so use the msm8996_adsp_resource
>>>>>> which has cx under proxy_pd_names and is otherwise equivalent.
>>>>>>
>>>>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>>>>> ---
>>>>>>     drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> Hmm. You are modifying the ADSP configuration in the driver, but at the
>>>>> same time you've dropped CX supply from the MSS remoteproc.
>>>>
>>>> The qcom_q6v5_mss driver has this support for .fallback_proxy_supply, which
>>>> are used in case the power domain is not specified.
>>>>
>>>> So no driver change is necessary in the mss driver for both old and new
>>>> devicetrees, but the adsp driver does not have this fallback, so that's why
>>>> the adsp config is updated.
>>>>
>>>> Does that make it clear?
>>>
>>> Yes. Would it make sense to implement fallback_proxy_supply for ADSP
>>> too?
>>
>> Definitely would be possible, but I don't see the point in doing the work to
>> implement this, to then carry around a bunch of legacy compatibility code
>> that (very likely) won't really be used in practice.
>> I don't think any platform apart from msm8974 are going to be affected by
>> this anyways.
>>
>> Still same argument from my side, I think breaking compatibility here for
>> this one driver outweighs the effort/code of implementing compatibility.
> 
> Ack. You have my r-b for the series anyways.

Thanks!

