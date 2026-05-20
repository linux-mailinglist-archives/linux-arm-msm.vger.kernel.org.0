Return-Path: <linux-arm-msm+bounces-108894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMdfCS41Dmq58AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 00:26:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD74059BFD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 00:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19BCA3025AFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 22:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E193750DC;
	Wed, 20 May 2026 22:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpjhyQv3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4983BFE3F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779315990; cv=none; b=PHdWVL9p+k3xjmGd3qIQZHnHRSTIuibFh/HiH5D+KuM2tZw6PjApZg8T+sUq1sqzPuz5rA1jJABxhzS7btYXfdZa97jKNEtVhKfzAO0L/8qTsQdMpZhYHTnoIck+JhgaxQxaoW6luKj7dC+ObXLVqadYqcKxCA2j7Ixp6RqnFxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779315990; c=relaxed/simple;
	bh=j+vvG9tL9x9Qm2N4qCmquu0PIMkZ01SDZnad8HjsKkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFUQhjxdRFtB1G+3t34xg/qLabNZDOaf3QWFp1YFIqdfwPyHYRtYN4UyJjtw+5DkAojHBFyVItfSTP97DhbiJeq+vEdVlFIic4Nuw3NdzEwNZ/KrdyEtRfs5EnuRJjfq6PNPrANlcrgrR+Wp8F2Ht4OHm97R6wzzOxsnm/UNgaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpjhyQv3; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d73422431so3805101f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779315986; x=1779920786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YG82xVAXQwQE8PumNL8zBtus2ibRKhYEPkSULunC6/w=;
        b=KpjhyQv3vClXosjoGWZmpqAYKelW8CDboFucNDCLebSdcjqL+k9S7q3hyuuAHh0lHN
         0+abZeVZgZqyyDO1m9oGSre1k8S2KYj6P1XFfAYKK8B9wqlGclNWWmQnoT+mo85HEupM
         PXPyFLR7xbEanO/YuzOLirj/kCZueVgK5D0nNdhqpw+sk+xHqEwEx2km7A3v2olWadur
         vk2Tsz9T1qtEu+BZJnieURhwWipITU8pmrgo0e24uCALwfVkHTLf1YadtyaOkb47MjxW
         2zPL8AszT0RJwlBXEauCkr+lm2Q1P8vi/IGDeqZRYE9n7H/TcK5kwuzzNKWCirO6oL1m
         AIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779315986; x=1779920786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YG82xVAXQwQE8PumNL8zBtus2ibRKhYEPkSULunC6/w=;
        b=ZChpCmlMhlluxU5wc3ii4G4X/cWvA7lF8kOTmX1sRe0lj38Zf65yQFFDgXQUiWQgyn
         Ad7m3G/Ojta41zAYG4Fnx3TYZ4F7B7JJNbhG2b+A+Cb6NiTQPQjbUzbHOQOUhESBouan
         i07ESl3RKIRxtSe+sF3EbwjtsuQ3/PBP0GRfmKqN4dOYHEq4FG7Qvnr+VOT6TdvlAddb
         psvO7R7ktz60srCCpyJRlp9puO7zAsZZHVehQwVhwzfVfamKr/MsHtZMSHjj5sZc6Uwc
         QyRUKzJ9kv9jjLCxYeMndpQZhDGh8pBziBPOVb8Sdbu19ltLL9ppbT/6kKKenFBetdu+
         VMvA==
X-Forwarded-Encrypted: i=1; AFNElJ/F4wRMM7rbbMMQc5UfPH5bY442gHH2hmbPA3ji1jRFvWOgcjLEVw1EcY/lEJp2JsrhkzEj2w1g7EfTymFM@vger.kernel.org
X-Gm-Message-State: AOJu0YxqdOj1kGDgTuVo0c10n1lWLcbqwcW0V/LVQDG1yJDf5GLIBcFu
	/AdCXjdCNztoHTCkkGceGXjvVX9/yiC9IFxt+QEvsHbam22ZlAtwXqU=
X-Gm-Gg: Acq92OEM71fEPAc+iIR5SypxAQF2T6gJwlGY4dQMFgLOW5erblQlCfnhzYG5qEBa8ix
	Fyi0+zEq2vrTugpI+6TSjAnTQOJORIQ5foMm6asS6pX9oxPfinDor5dGhfYNX+wf3cxhfwuohCC
	s0JZJZfs+FhCdjiDWMp6IltMn62RhdxRVTtDnCO0WAXRUmg2EpmdbNAudu9lqG/uq7ENAbq/l6R
	HFEGxAQJpyuqaixd00URJmp/Uo8+JodhbF+kFO5yx0oArNpiAJdpAwXhJ8e5Fdr9EJHLB3em2lN
	e4yJYyUHrwktS1QaY3dvBq6AOEkTEhwiAPtGx2rJNzL1ZwwPw9aZaR8RVK9fD2sVgYeOZY9IjEq
	rwk+CyudMEaJofKq519wQ6f85IQk5NEK/iR7pD8QFcf8hZZaVYMILcwe6H/HPtKAkxHYWvYRnaE
	dqTyUtBF975D3rs+W11L7WFaCePs+L/iE1EoinNNk3JEtnUMKpSiQwkIFWdYxyX4fH61f60E/Ds
	M+wfvMGtix8X1bCozp8mF0jRAvvZH6m6OYjd6exiMEotvveeKQ4fLMvzi5q5QoOdp0geg==
X-Received: by 2002:a5d:584c:0:b0:452:c246:ab69 with SMTP id ffacd0b85a97d-45ea38c687bmr331364f8f.13.1779315985965;
        Wed, 20 May 2026 15:26:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe1a41sm61784681f8f.31.2026.05.20.15.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 15:26:25 -0700 (PDT)
Message-ID: <f5f70aa2-a1b8-40e0-838f-6709e6e08a5a@gmail.com>
Date: Thu, 21 May 2026 00:26:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] arm64: dts: qcom: sc8280xp-arcata: Enable backlight
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-2-9df52552bf87@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-2-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.01 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-108894-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.34.96:email];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jeromedebretagne@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.3:email,0.0.0.1:email]
X-Rspamd-Queue-Id: BD74059BFD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 18:40, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Add backlight nodes and enable backlight so that it can be controlled
> with the corresponding buttons found on Surface Pro Type Cover keyboards.
> 
> The nodes are almost identical to the ones from the ThinkPad X13s with
> a different enable GPIO for the vreg_edp_bl node.
> 
> The difference was found by looking at the output of /sys/kernel/debug/gpio
> on the ThinkPad X13s to see the properties of its enable gpio9:
> 
>    gpiochip1: GPIOs 742-751, parent: platform/c440000.spmi:pmic@1:gpio@8800, c440000.spmi:pmic@1:gpio@8800:
>     ...
>     gpio9 : out  high normal  vin-1 pull-down 10uA              push-pull  medium  atest-1 dtest-0
>     ...
> 
> The same gpio9 on the Surface Pro 9 5G has different properties:
> 
>    gpiochip0: 10 GPIOs, parent: platform/c440000.spmi:pmic@1:gpio@8800, c440000.spmi:pmic@1:gpio@8800:
>     ...
>     gpio9 : in   high normal  vin-1 pull-up 30uA                push-pull  low     atest-1 dtest-0
>     ...
> 
> Looking for a match on the Surface Pro 9 5G pointed to this only one:
> 
>    gpiochip2: 10 GPIOs, parent: platform/c440000.spmi:pmic@3:gpio@8800, c440000.spmi:pmic@3:gpio@8800:
>     ...
>     gpio6 : out  high normal  vin-1 pull-down 10uA              push-pull  medium  atest-1 dtest-0
>     ...
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---
>   .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 49 ++++++++++++++++++++++
>   1 file changed, 49 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> index f2b4470d4407fb5b6a3dbac8bc972c010c31bd06..14287092fb07ea15e527fd318f7ea2155448b26c 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> @@ -46,6 +46,16 @@ wcd938x: audio-codec {
>   		#sound-dai-cells = <1>;
>   	};
>   
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmc8280c_lpg 3 1000000>;
> +		enable-gpios = <&pmc8280_1_gpios 8 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&vreg_edp_bl>;
> +
> +		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> +		pinctrl-names = "default";
> +	};
> +


Investigating the feedback I got from an AI bot review [1], I plan to 
update this patch in v2. Let me know what you think.

I was skeptical at first but upon review I've tried the following patch:


diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts 
b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index f938e68c69ea..82e0a01276a8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -198,7 +198,7 @@ vreg_edp_bl: regulator-edp-bl {
                 regulator-min-microvolt = <3600000>;
                 regulator-max-microvolt = <3600000>;

-               gpio = <&pmc8280c_gpios 6 GPIO_ACTIVE_HIGH>;
+               gpio = <&pmc8280_2_gpios 6 GPIO_ACTIVE_HIGH>;
                 enable-active-high;

                 pinctrl-0 = <&edp_bl_reg_en>;
@@ -1050,6 +1050,11 @@ vol_up_n: vol-up-n-state {
  };

  &pmc8280_2_gpios {
+       edp_bl_reg_en: edp-bl-reg-en-state {
+               pins = "gpio6";
+               function = "normal";
+       };
+
         wwan_sw_en: wwan-sw-en-state {
                 pins = "gpio1";
                 function = "normal";
@@ -1061,11 +1066,6 @@ edp_bl_pwm: edp-bl-pwm-state {
                 pins = "gpio8";
                 function = "func1";
         };
-
-       edp_bl_reg_en: edp-bl-reg-en-state {
-               pins = "gpio6";
-               function = "normal";
-       };
  };

  &pmr735a_gpios {



and ... backlight still works! It can also be enabled/disabled with:
    /sys/class/backlight/backlight/bl_power
as expected.

I have no clue why both gpio6 on pmc8280_2 and gpio6 on pmc8280c can 
enable and disable the backlight. Is it a common scenario?

Anyway, if I follow my own investigation fully based on the X13s 
reference and the properties of its backlight enable GPIO, I should 
switch to pmc8280_2 to use the better match.

I will update this patch in v2.

Jérôme


[1] https://lore.kernel.org/all/20260520165709.E485C1F00893@smtp.kernel.org/


