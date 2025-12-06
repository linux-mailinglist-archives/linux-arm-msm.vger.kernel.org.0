Return-Path: <linux-arm-msm+bounces-84593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B25CAAB98
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 18:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 588BF300B928
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 17:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC61292B54;
	Sat,  6 Dec 2025 17:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="0Io+YFLo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6DC218ACC;
	Sat,  6 Dec 2025 17:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765043603; cv=none; b=i0PvL/kOTtnvtun8SCbHCn8kjVQpNGTNm8iZtRKSBqAbwI1M/Mw5h4+1ezbS03l+W0K9f/4DsUVLUMz/nSSR5AXFUw8kpU3YQQpiWwPIXRS000vDcSF2+qN2+HOQd6VZ4uQHom7EV9at64PKav8Xr6qcz59Sg2nnU1YPpclG2B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765043603; c=relaxed/simple;
	bh=xlcIHsH37PBs5RZZH+TOMc+lX4/Ayg3qHQpI1gpCOg8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TO/Qt/WAuIXc/QyddyOonLEosjoAZvFHBA6VdCJbOiOZ56k/kp4WChozn9hi3zxHdWpLpTKcqlcUkUDyO6mSksDXy+Q5qxD7erB4n3zSJnfN2SUZWQzvaESWqN+JHY73xF5xDteI43UeVO3YHWzih1mtCFk1RtXoDkBVzJ0Nxqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=0Io+YFLo; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 8C3E1534088E;
	Sat, 06 Dec 2025 18:53:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1765043596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xHVR36shnO+nfifqdSvCvkm5Cm2VnQ8y12kMvZuHm5k=;
	b=0Io+YFLowN8+mLpibUzS48zvrNQSyxa7+VBSyubMCemJAsMMxDAp9szA69Bvf1LQC2r1Kr
	Ge6GbcARcTr+wf9fOnOn6a5TGVWUpM1NGHrSJtshfTRaq1Aqa45+nsWubTOWRkV4ZE5M9o
	7CAz244abkJJl+zdV+ZZGdU17Ow82Ts=
Message-ID: <4272ba9f-29e9-4c92-ac4a-32b434a50732@ixit.cz>
Date: Sat, 6 Dec 2025 18:53:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/12] arm64: dts: qcom: sdm845-lg-judyln: Add display
 panel
From: David Heidelberg <david@ixit.cz>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Paul Sajna <sajattack@postmarketos.org>, Sam Day <me@samcday.com>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Amir Dahan <system64fumo@tuta.io>, Christopher Brown
 <crispybrown@gmail.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-5-80c1ffca8487@postmarketos.org>
 <w2gtfgvbx5ujyfbilhyqblhlwo4ewybpmsrdl2gyafcx5etbnl@apze5qpd4okw>
 <a586680c-086d-4f4f-85f2-ab21d675c5a1@ixit.cz>
Content-Language: en-US
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <a586680c-086d-4f4f-85f2-ab21d675c5a1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/12/2025 13:37, David Heidelberg wrote:
> On 06/12/2025 03:09, Dmitry Baryshkov wrote:
>> On Wed, Dec 03, 2025 at 01:40:54AM -0800, Paul Sajna wrote:
>>> Also include other supporting msm drm nodes, including backlight
>>>
>>> Co-developed-by: Amir Dahan <system64fumo@tuta.io>
>>> Signed-off-by: Amir Dahan <system64fumo@tuta.io>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  8 +--
>>>   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 75 +++++++++++++++ 
>>> ++++++-----
>>>   2 files changed, 66 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/ 
>>> arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>>> index 165523db4d49..50921af83a51 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>>> @@ -450,10 +450,6 @@ &cdsp_pas {
>>>       status = "okay";
>>>   };
>>> -&dispcc {
>>> -    status = "disabled";
>>> -};
>>> -
>>>   &gcc {
>>>       protected-clocks = <GCC_QSPI_CORE_CLK>,
>>>                  <GCC_QSPI_CORE_CLK_SRC>,
>>> @@ -517,6 +513,10 @@ led@5 {
>>>       };
>>>   };
>>> +&pmi8998_wled {
>>> +    status = "okay";
>>> +};
>>> +
>>>   &sdhc_2 {
>>>       cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/ 
>>> arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>> index 55bfddab3afd..506e6fe8e798 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>> @@ -13,19 +13,6 @@ / {
>>>       model = "LG G7 ThinQ";
>>>       compatible = "lg,judyln", "qcom,sdm845";
>>> -    chosen {
>>> -        framebuffer@9d400000 {
>>> -            compatible = "simple-framebuffer";
>>> -            reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
>>> -            width = <1440>;
>>> -            height = <3120>;
>>> -            stride = <(1440 * 4)>;
>>> -            format = "a8r8g8b8";
>>> -            lab-supply = <&lab>;
>>> -            ibb-supply = <&ibb>;
>>> -        };
>>> -    };
>>
>> I think, you can leave simple-fb in place. MSM driver should be able to
>> replace it once it is loaded.
> 
> Any chance, do you know if the issue OnePlus had is then resolved?
> 
> ===
> /**
>   * HACK:
>   * Fake panel node for simple-framebuffer to calculate DPI from. Only
>   * needs width & height specified. This allows us to break device link
>   * from simplefb to mdss (implicitly via panel->mdp->mdss) to fix drm
>   * device probe ordering. Without this, simpledrm would probe second
>   * after msm-drm, and confuse userspace with 2 GPUs in /dev/dri.
>   * Alternative workaround is to boot with kernel parameter
>   * `fw_devlink=permissive`, which is worse, because it can hide other
>   * issues with device dependencies.
>   */
> panel = <&fb_panel>;
> 
> fb_panel: fb-panel {
>          width-mm = <68>;
>          height-mm = <145>;
> };
> ===
> 
> Ref: https://gitlab.com/sdm845/sdm845-next/-/ 
> commit/6a0a09c4dddc1b973209f5ffea086eb7a3fc24b9
> 
> Add Sam into CC.

Okay, I did some testing without the hack on sdm845 and OnePlus 6.
Ut seems there is no longer regression, wrong sequence or errors in 
dmesg nor any problems when using the device, so i assume this hack is 
no longer needed.

Sorry about the noise, if it's still relevant, please let me know.

David

> 
> David
> 
> 
>>
>>> -
>>>       /* Additional ThinQ key */
>>>       gpio-keys {
>>>           pinctrl-0 = <&vol_up_pin_a &thinq_key_default>;
>>> @@ -67,6 +54,47 @@ &gpu_zap_shader {
>>>       firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
>>>   };
>>> +&mdss {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&mdss_dsi0 {
>>> +    vdda-supply = <&vdda_mipi_dsi0_1p2>;
>>> +
>>> +    status = "okay";
>>> +
>>> +    display_panel: panel@0 {
>>> +        reg = <0>;
>>> +        compatible = "lg,sw49410-lh609qh1", "lg,sw49410";
>>> +
>>> +        backlight = <&pmi8998_wled>;
>>> +        reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>>> +        width-mm = <65>;
>>> +        height-mm = <140>;
>>> +
>>> +        pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
>>> +        pinctrl-1 = <&sde_dsi_sleep &sde_te_active_sleep>;
>>> +        pinctrl-names = "default", "sleep";
>>> +
>>> +        port {
>>> +            panel_in: endpoint {
>>> +                remote-endpoint = <&mdss_dsi0_out>;
>>> +            };
>>> +        };
>>> +    };
>>> +};
>>> +
>>> +&mdss_dsi0_phy {
>>> +    vdds-supply = <&vdda_mipi_dsi0_pll>;
>>> +
>>> +    status = "okay";
>>> +};
>>> +
>>> +&mdss_dsi0_out {
>>> +    remote-endpoint = <&panel_in>;
>>> +    data-lanes = <0 1 2 3>;
>>> +};
>>> +
>>>   &mss_pil {
>>>       firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/ 
>>> judyln/modem.mbn";
>>>   };
>>> @@ -85,4 +113,25 @@ thinq_key_default: thinq-key-default-state {
>>>           drive-strength = <2>;
>>>           bias-pull-up;
>>>       };
>>> +
>>> +    sde_dsi_active: sde-dsi-active-state {
>>> +        pins = "gpio6";
>>> +        function = "gpio";
>>> +        drive-strength = <8>;
>>> +        bias-disable;
>>> +    };
>>> +
>>> +    sde_dsi_sleep: sde-dsi-sleep-state {
>>> +        pins = "gpio6";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-pull-down;
>>> +    };
>>> +
>>> +    sde_te_active_sleep: sde-te-active-sleep-state {
>>> +        pins = "gpio10";
>>> +        function = "mdp_vsync";
>>> +        drive-strength = <2>;
>>> +        bias-pull-down;
>>> +    };
>>>   };
>>>
>>> -- 
>>> 2.52.0
>>>
>>
> 

-- 
David Heidelberg


