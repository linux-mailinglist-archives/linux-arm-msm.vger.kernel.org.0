Return-Path: <linux-arm-msm+bounces-109805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PvRHjCRFWovWgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:25:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BCF5D57E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CD5F302D09F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2513F99F5;
	Tue, 26 May 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vLWZ+Thk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4D73D9DB2
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798315; cv=none; b=P4HitAO5lxOaqNxTQRza3S1ajn2nO1/XH0LhAtb5KAIL1xmbxNd7i0CQ3uGBEvh7K4F1qqTJoYwkQfnz2MIjBQ+/3AzxOt+wOhBuEL9EcG6NrEyFAh6FOY17bwaVyKK7PNGFhsskPKci0mKAE8Q0eEFMMT+k2OYVsHVN4BDkH+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798315; c=relaxed/simple;
	bh=OBdNDmdFyX3Btzx0luHZFVbkPIZYv5WwtCm4c5mXnnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iy8WiD6Ucl9onw5WVKDUZtQg67F+SMz/D3cD9Bqfr+Pz0O/2f9GA0kohbn4Db21atcEj2DfrSP1h+uvngf1xL8OmKdoDh/kcCYhpvle2hbiMTy38RoCJ2xY68o51HB2/tPnyjAHLondIpBJ60rr9Fkd+wC0mnd/i0JJ6sLFOLrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vLWZ+Thk; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43fe608cb92so6404552f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779798311; x=1780403111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgI53DJMq4E1/u2WXvBPkXuolOc+9wuhSnRSjksHASg=;
        b=vLWZ+ThkhFXsC8LKnSTk2ErfnJnZyY6y9PnwFfvGAO7w9sU9mJIqgXeSeV1TnIDUTE
         TNLsVyv01kkVJmeLml9elRJgJxRnCZgAFN/EbuO89QXYoLuLclXk1MxiueOnBvUeJ4cV
         jzgyrCxj529GO7l6U6qtrqHjBJ40RRkyLaOmzodRZRYN9YryNIDE5EB8rxQFSRccAID4
         22y78XIgzVNP/Px1ORKXRZC12ekjTxSLMfMU7GPEG/EGP7xZPJlb106IPbJOAmjmOnzG
         ISpsvhVohX+sp5gWfF+PqjQwGzNRNGc0NLY0jg7xdQFW9yVFxjHhK6LDqZVq8661pFYv
         KicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798311; x=1780403111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgI53DJMq4E1/u2WXvBPkXuolOc+9wuhSnRSjksHASg=;
        b=flI1gmyCfl+CEv5vTjsQj1wYaaFxsxXwMJa555+PDwSUaRRlBRZfmt++lFhwIeMmcd
         Y+xTAy21XOgVff43mv55HQ+H2JDOcAewvg/FDj4s37+ZbWQX3RxQshHlrVShN+xZO7dU
         8jFf2I8RrI9cyV2KXsISh4ohB6kNWhokDL28psczI8zxrwaMgGT7wLo9NRMFvE2iZUlL
         o1leqZZpZdBn+tM65+XKsudswe74JubRoOz+jyFpsnqTnqPIVZmWS4FVe0CuQ1MtVd8g
         8lCUpyiXSMvsejdAj71m58eE7jn1yreVaJr3qOBwf4bNzdx+pQfyvc1zI3Dx61l2rery
         lYKA==
X-Gm-Message-State: AOJu0YzxcKehxqVSKh8cQ3M9LTAjpwYvptzv5fqmfGgTjjlxJijRJj4l
	ftlX6m6lY62rfiLzkN55tpGd8L9rzmLAGIzh78ZXJ2Al8n7bWau/o+cIlwqzW7ynJwo=
X-Gm-Gg: Acq92OHzMKGG5TbZUtdWWWBx7sPfIxfNdc31dGAVFJ/ZFL5jlyKaS5XfEcf5McIJwEJ
	QUiIp7fJVOo/7PT0tXQrabUhGmHl7ilBITm1sWg0s/SFv9zV/ZXMU9AbDrRlmmBEK4mSvv/cn7/
	taw54AWLTC2fy2cKe8sqJi2APOhmjj+x1LUKH6NRukbt6KZefPnbNQe4q4GUB/7RTuNDYccdsrl
	m6FyEzRoB7OrYQ7iCWYYr8nkgUIRL5m9RTJIWrfxEILlnKXxYvJ5n3XVvaPMY3mBMLzFOm0LbLI
	7LOp391lTDWmQUo5hW19TNn5wAOTf+ROyXe47Ay2Y77YrlqRri1Ec/9U+pRlUA7f7RzMeehUmCH
	CyhIFegmAKrbH3v3KaAjXQ49JAXI3t+AwGRIRPqkekSauPFOdk+Z7LVr+OZk4tt9nQpqYetznzQ
	ciTIA8dta6bscXuR4lcAblX2qOLstgufR2ITZ7LZUBvnU=
X-Received: by 2002:a05:6000:2412:b0:44f:9b70:2996 with SMTP id ffacd0b85a97d-45eb38c53bamr33323679f8f.21.1779798311332;
        Tue, 26 May 2026 05:25:11 -0700 (PDT)
Received: from [10.149.200.45] ([89.101.53.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ed1939c6asm14041928f8f.2.2026.05.26.05.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 05:25:10 -0700 (PDT)
Message-ID: <9ececc65-d2d4-4310-9218-beaeb5496dca@linaro.org>
Date: Tue, 26 May 2026 13:25:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add
 Embedded Controller node
To: Daniel J Blueman <daniel@quora.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Bjorn Andersson
 <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260526112409.66325-1-daniel@quora.org>
 <20260526112409.66325-2-daniel@quora.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260526112409.66325-2-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,kernel.org,infradead.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109805-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.76:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quora.org:email,linaro.org:email,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E9BCF5D57E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/05/2026 12:24, Daniel J Blueman wrote:
> The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm Hamoa
> X1 Customer Reference Device. Use the lenovo,yoga-slim7x-ec compatible
> introduced by patch 1 for fan control, thermal sensor and suspend
> behaviour.
> 
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> Changes in v3:
> - use lenovo,yoga-slim7x-ec compatible (introduced by patch 1)
> - v2 link: https://lore.kernel.org/lkml/20260502063518.15153-1-daniel@quora.org/
> Changes in v2:
> - corrected DT compatible node
> - v1 link: https://lore.kernel.org/all/20260429103301.17449-1-daniel@quora.org/
> 
>   .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index beb1475d7fa0..1ee2a2296129 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -951,6 +951,22 @@ retimer_ss0_con_sbu_out: endpoint {
>   	};
>   };
>   
> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	embedded-controller@76 {
> +		compatible = "lenovo,yoga-slim7x-ec", "qcom,hamoa-crd-ec";
> +		reg = <0x76>;
> +
> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 = <&ec_int_n_default>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
>   &i2c7 {
>   	clock-frequency = <400000>;
>   
> @@ -1352,6 +1368,12 @@ &tlmm {
>   			       <44 4>, /* SPI (TPM) */
>   			       <238 1>; /* UFS Reset */
>   
> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
>   	edp_reg_en: edp-reg-en-state {
>   		pins = "gpio70";
>   		function = "gpio";

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

