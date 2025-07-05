Return-Path: <linux-arm-msm+bounces-63822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D918DAFA06A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 16:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FB031C25D9D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 14:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CF319F424;
	Sat,  5 Jul 2025 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="W9tbIoiG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2142E3715;
	Sat,  5 Jul 2025 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751725008; cv=none; b=HaiSmoSJMMDPuGv1xHnNziIQP1/ksJIyJy8XcqO3dYN1OcmIRATVaRUSWL6aMicYeyxVV6RZZHefMgoLZPCnSkcUDiW87ppLTmA1MGJvtkgLsSFaqtkQPbnSd08sHzkVtpZ6JNAsf7F+K9WPwKYspJI/f345o8s/yqnt4NJ88GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751725008; c=relaxed/simple;
	bh=MDdJEYq2doyNGE6EUzPQJPJZ4ZXYPI7/XfL8g6ttZ08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvJT7/9hVoshbKB3FvZzr/x5/nELz6al8YB9Wg8WgoTSv6/FIUBmagP6p44qV09owXzaDyeOQnULeMa7b6KrzjowIav+AWKI9yaQemVvjN46ni4lw2KLppdpv4KucOW7bHDML61/O+uHUQRnjdry8sD6jwhzuEzIhAOu16Fgy9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=W9tbIoiG; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1751725004; bh=MDdJEYq2doyNGE6EUzPQJPJZ4ZXYPI7/XfL8g6ttZ08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W9tbIoiG1e2S9tK40GeYgJ4butdrSXEHCYu28e9Pm/ONj0v0D61e49sOgMjwvMrJ+
	 nzBhoHvss2XXjv0TOuUeY627q+ra2b7K8YV/Zy4gG0n6Vjfu1t/vxjCO29RgW9kCak
	 ToN5KKCkLW43lqKYxUxUIDNQRIL++tIsfga561x4=
Message-ID: <2e338f72-c676-425c-a96b-1cfed466f9fc@lucaweiss.eu>
Date: Sat, 5 Jul 2025 16:16:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] Start using rpmpd for power domains on MSM8974
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
 <amfgwjgstu4hoxz4lo7fqrqz5fqtf3r7o6wqvrrjkcfubwrjyz@5i75peprq3wn>
 <841c41cc-e44d-40c7-9431-a77feaa49b05@lucaweiss.eu>
 <225b94a0-eea5-4061-aebd-da497d349527@oss.qualcomm.com>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <225b94a0-eea5-4061-aebd-da497d349527@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dmitry,

On 24-06-2025 11:03 p.m., Dmitry Baryshkov wrote:
> On 24/06/2025 21:46, Luca Weiss wrote:
>> Hi Dmitry,
>>
>> On 24-06-2025 2:59 a.m., Dmitry Baryshkov wrote:
>>> On Sat, Jun 21, 2025 at 03:19:55PM +0200, Luca Weiss wrote:
>>>> Switch over the ADSP PIL to use power-domains instead of a regulator,
>>>> and have one commit switching over the MSM8974 SoC plus all the devices
>>>> to use power-domains.
>>>>
>>>> Note, that I'm aware that these changes are not backwards compatible 
>>>> and
>>>> not really bisectable, but since it only affects the ADSP on these
>>>
>>> Why? The cx-supply is handled unconditionally. A single-domain usecase
>>> is also handled via a special code path. I think this might be
>>> backwards-compatible, by the pure luck.
>>
>> Honestly I have not tried and not looked much. I mostly added this 
>> paragraph to avoid the response that this change might break and is 
>> not really backwards compatible. If it does (by accident) work with 
>> the updated dts without the driver and the other way around, then even 
>> better.
> 
> I think it's worth checking that new kernel works with older DTS (that's 
> the usual rule). The platform doesn't have many users upstream, but I 
> think it has been used by some PmOS users, which might mean not-yet- 
> upstreamed DT.

I was finally able to test this, but the patches except the dts patch 
does not work.

[  170.802573] qcom_q6v5_pas fe200000.remoteproc: probe with driver 
qcom_q6v5_pas failed with error -61
[  170.803127] remoteproc remoteproc0: releasing adsp

I didn't take much more of a look but probably adsp_pds_attach fails there.

For postmarketOS users, all msm8974 mainline devices that are packaged 
as part of postmarketOS, come from the github.com/msm8974-mainline/linux 
fork, which included this patch already since a few releases. I'm taking 
care that all out-of-tree dts that are in that repo are updated.

Fortunately this is just breaking adsp probe, bootup still works as 
before. So from my side again: I think it's not worth the effort to add 
a bunch of complexity to the driver code and support this use case. I'm 
not aware of any msm8974 upstream users that would require that.

Regards
Luca

> 
>>
>> Regards
>> Luca
>>
>>>
>>>> pretty old boards, I say it's fine to have this. Get all the patches
>>>> into the same release (6.17?) and then we're good again.
>>>>
>>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>>> ---
>>>> Luca Weiss (4):
>>>>        dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as 
>>>> power domain
>>>>        remoteproc: qcom_q6v5_pas: Use resource with CX PD for MSM8974
>>>>        ARM: dts: qcom: msm8974: Sort header includes alphabetically
>>>>        ARM: dts: qcom: msm8974: Start using rpmpd for power domains
>>>>
>>>>   .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 18 ++------
>>>>   .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 13 ------
>>>>   .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    | 12 ------
>>>>   .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 12 ------
>>>>   .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   | 12 ------
>>>>   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 50 ++++++++++ 
>>>> + +++++++++--
>>>>   .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |  8 ----
>>>>   arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  | 11 -----
>>>>   .../dts/qcom/qcom-msm8974pro-oneplus-bacon.dts     |  9 ----
>>>>   .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  | 11 ++---
>>>>   ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 12 ------
>>>>   drivers/remoteproc/qcom_q6v5_pas.c                 |  2 +-
>>>>   12 files changed, 56 insertions(+), 114 deletions(-)
>>>> ---
>>>> base-commit: 7fa2fb97cd28e1d9670da538095565b6fba83977
>>>> change-id: 20250621-msm8974-rpmpd-switch-b19b166c02be
>>>>
>>>> Best regards,
>>>> -- 
>>>> Luca Weiss <luca@lucaweiss.eu>
>>>>
>>>
>>
> 
> 


