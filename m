Return-Path: <linux-arm-msm+bounces-90537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MOKEu1Sd2mdeAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:41:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF89187B8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BE5F30010E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE4E332EC4;
	Mon, 26 Jan 2026 11:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N7CeY/hK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A297302151
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 11:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769427690; cv=none; b=kQL3xiisBDuVlZHa7vD1d849FjmmOSy3ER3ouFlgXuj/sAq9tIwFOK8IVIrK3hMUMeN/vLX2PzGYt0KiYjvMjRN8Gd2XW0o5KnR8ywJy0Lz/FsGCR+zw3foslxxyHs3d6dGAehALUuQYJA7zKN6dE8UjCY6QReN6ux77fDsfswg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769427690; c=relaxed/simple;
	bh=AxiyoaABzXqMP4w/uMab+PrtYh1Z0TFJQkq97Gw4i8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPqEn+smlDGPdB7fI8vzP2w9IYa7+R5gyh3GxbAlIuwphH5N5xjw1tYXnDr/JnLs1vJT9Zh36UgQij1NhvA9HmPBtIqx+gb6rw0hk/WF/HJckljg4ealhGVw8hqZhBKs/4vD7j9RF1H8rXOR3OVUjUq44Mz5Lh7gojovdcT7DNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N7CeY/hK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-435a517be33so2681699f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 03:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769427688; x=1770032488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rN1oSNDkGLBy6EHwhjHDF6Jrov42HwjEw9RdQlJcNw0=;
        b=N7CeY/hKava6XQQ/h38THONZbwLfrd8ykCvvjqfwdFmS+pBHPJdSfjuMd+EVN4HD/Z
         pg/fnlUkjlQ5nMT575LsObgYKXv+a+Qna1IHm8/ge+4UT+nwcswITHgmt5RHab7965PK
         vh462n6WONI3ZQX2IRclp0bTd+c3qHsLzUcvr+Jym2knvMeB3ClEXVhm+aAh1M4irkVz
         o/rL2K/+9wWGPwX0GYGYedwpw/1IoNzqRV00cQqTi1lgQyN1wQX4v75HmaDd4aHxT/9e
         auPsRzPHtfa2d68Su6Rb+XGAkejiLTUClBfQ6mnhUG+FAyOYmui2gU6Leri8kf3LlNrB
         Kucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769427688; x=1770032488;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rN1oSNDkGLBy6EHwhjHDF6Jrov42HwjEw9RdQlJcNw0=;
        b=tqtd4LG7ask103KlwmlPGLoIOlQMzyPBKMkQSg6m0Vywj3SPbea0YPKF8kW2f8s5uQ
         8yScFegnfGQ7fyERgwAeeIhvEf+G5916cCxMRpAYlOtGVCnoWQnH4/HsLYAcBnt4IfaM
         41wdjK2PsmZFlwx8Bf2YxdDM/utTjXEe+IV1Hs5xi3tPsxMxJ3RZiq4HzLhSwvVofDRM
         xo8Eqv35Fkzra2oljTGiVM+tSj5J06v9qT2FDlghknE210mafJ3F/hND62yOc3X7eEzP
         984dwd7ep2w7rhuPh3TFr41cLFMS7rUbIvuacOWgwtaXKq9AhhrHscmkIEVm6iDzf01N
         l5wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgLPMmNVHdWAefFL5O2GaS/5nQoVlxnxowfGHWgj2KT1v+UVM14kbBJkhV3XPmdkn50OZ3UonNgLWsyuVg@vger.kernel.org
X-Gm-Message-State: AOJu0YxgCV941xBNmrXq81M+zRkWExRd4YtFbyfLkK20DkjgQOOkpK5Y
	npp2D/D1CWbWGRh/2gPhYRqP4qcVGpoVjJOWUj3hphpk8VUJQ1NMNVSsuz49V/cYCNg=
X-Gm-Gg: AZuq6aJaM8i5jCQVKczXsikw4BnpqP+Lk7pM0jVcdGyL7TFp0hVtNm3RXLAXhgvmsDG
	x21odMr3T2xicc2+8EzgJ1lMEYCNVmTSroDUQlZxXy1GiQ3+blAvaeHD8W+F69S0CnPXwrjGFTQ
	hpN/4pmA2aOfYwrgQtcmtX5nBgCb0I4QNHabS6lpa/WuzeJSd4AWPgico4k5bc25Wjb0a+s1xB/
	nx+r08BU1+SwFMqDjHtZRtoWvBv8hu+eFxn6r705+FFhgV0DULeWUOzV7ogsZsPc7i0fyan0Hb3
	NdwDhThunuMQ2Q7IX7+aKqHedeBCVkmx620tqSV1MXQQ8lril1QXVVHC3eqPOi/3FMSFifUXprN
	/GJLG6qXb29xHnodNWa8HZ1wV48sD+veAxw3c3xfkoP5OC24mt2dedL6Jt4Fg8I3NSFYNeIJCKa
	4cvunWruqvSiafsmqZulmHUc2uOcJy8BuxKvopJ7epGX9UCZYw3EYE
X-Received: by 2002:a05:6000:230e:b0:432:c0e6:cfcc with SMTP id ffacd0b85a97d-435ca0ef509mr6845789f8f.23.1769427687426;
        Mon, 26 Jan 2026 03:41:27 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f73855sm28803758f8f.29.2026.01.26.03.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 03:41:26 -0800 (PST)
Message-ID: <b699fcf5-5cb0-41eb-b9de-e5c6e98aefaa@linaro.org>
Date: Mon, 26 Jan 2026 11:41:25 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] media: i2c: ov02c10: Keep power on and use reset
 for power management
To: Saikiran B <bjsaikiran@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 bod@kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 vladimir.zapolskiy@linaro.org, hansg@kernel.org,
 sakari.ailus@linux.intel.com, mchehab@kernel.org, stable@vger.kernel.org
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
 <20260126061528.63785-1-bjsaikiran@gmail.com>
 <20260126061528.63785-2-bjsaikiran@gmail.com>
 <ef6cf6c5-3b5d-45f2-af67-0567262a4561@linaro.org>
 <CAAFDt1spRkj7kySCa8P=jehQHbYVT2j+nxLira1vwYkiCJ7LDw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAAFDt1spRkj7kySCa8P=jehQHbYVT2j+nxLira1vwYkiCJ7LDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90537-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,0.0.0.36:email]
X-Rspamd-Queue-Id: CF89187B8F
X-Rspamd-Action: no action

On 26/01/2026 11:23, Saikiran B wrote:
> "Where do you get this conclusion from ? Are you inferring it from
> what you see on the platform or can you point to some known
> data-source for this ?"
> 
> This is determined on the Lenovo Yoga Slim 7x (X1E80100). I tested
> extensively and found that if I attempt to power-on the sensor less
> than ~2.3 seconds after power-off, it fails to identify or times out
> on I2C (brownout behavior). If we wait >2.3s, it works reliably 100%
> of the time.

I don't think we've established the regulator is at fault. That's the 
feedback I'm giving you here.

I think it is far, far, far more likely the power-on sequence of the 
sensor needs tweaking.

> 
> "2 seconds to discharge ? These regulators are PM8010 anyway - so
> you're saying the PMIC takes two seconds to discharge ?"
> 
> Yes. I checked the regulator driver
> (drivers/regulator/qcom-rpmh-regulator.c) and found that unlike other
> Qualcomm regulator drivers (e.g., spmi/glink), it currently lacks
> active_discharge / pull-down support. Without active discharge, the
> voltage rails float and decay very slowly via leakage current when the
> load (sensor) is in reset/high-Z.


Right so looking at the power for this part we have:

&cci1_i2c1 {
	camera@36 {
		compatible = "ovti,ov02c10";
		reg = <0x36>;

		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
		pinctrl-names = "default";
		pinctrl-0 = <&cam_rgb_default>;

		clocks = <&camcc CAM_CC_MCLK4_CLK>;
		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
		assigned-clock-rates = <19200000>;

		orientation = <0>; /* front facing */

		avdd-supply = <&vreg_l7b_2p8>;
		dvdd-supply = <&vreg_l7b_2p8>;
		dovdd-supply = <&vreg_cam_1p8>;

		port {
			ov02e10_ep: endpoint {
				data-lanes = <1 2>;
				link-frequencies = /bits/ 64 <400000000>;
				remote-endpoint = <&csiphy4_ep>;
			};
		};
	};
};

// qcom standard RPMh -> PMIC LDO regulators
// these are not the droids you are looking for
vreg_l7b_2p8: ldo7 {
	regulator-name = "vreg_l7b_2p8";
	regulator-min-microvolt = <2800000>;
	regulator-max-microvolt = <2800000>;
	regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
};

// this OTOH
vreg_cam_1p8: regulator-cam-1p8 {
	compatible = "regulator-fixed";

	regulator-name = "VREG_CAM_1P8";
	regulator-min-microvolt = <1800000>;
	regulator-max-microvolt = <1800000>;

	gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
	enable-active-high;

	pinctrl-0 = <&cam_ldo_en>;
	pinctrl-names = "default";
};

Dell has used - likely reused - part of the x86 design in the qcom 
implementation - and toggles 1v8 via a GPIO directly.

If your theory about brown-out is correct then

vreg_cam_1p8: regulator-cam-1p8 {
	// add this
	off-on-delay-us = <20000>;
};

Then please let us know how she goes.

---
bod

