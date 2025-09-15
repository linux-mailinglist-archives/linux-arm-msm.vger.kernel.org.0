Return-Path: <linux-arm-msm+bounces-73556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE890B5777D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AB56162DF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 11:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D502FF67B;
	Mon, 15 Sep 2025 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hbtgKJUa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264E62FE071
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 11:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757934059; cv=none; b=LzWyIVjLQMsmowfbqg0ttjkkOb277eXFsgdtcEAyqy8b7NER8aBCWID60JwfuOIJwUNe3Op/ogX9YnkvagWYFbFnU+T2+q5HvjikQf0AObEtjHNXLGR2/9rTJtwWFzpWz8ZHMc8tBCXDyg0vxigJbDzKTKUk5rDxIGU0bB2jeOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757934059; c=relaxed/simple;
	bh=Oa5cWbDm7uUKMCDYHkC/Iu8pqcZkNUOYxbEMQLIRbsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTbPfW/zE2qWR2WKS0HbAbzS/Kzwi/YllU+bQofcLmiYkoO0u8Hw/IzOEiROA3mAM2iayOmJc49fvwW8hCAgdtP9ZeyWasSryjMOZPYps3hpMTMSKZgxk64eARXvJ/b7xGfIIWITtjQd7+WEzVIsCtZkvW3nV3XpHE20BlbYHto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hbtgKJUa; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3df726ecff3so2198157f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 04:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757934056; x=1758538856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T63X1LQwQk/2hAt8FKtd7anGWLgK9h7B68o/CL4jZ6U=;
        b=hbtgKJUa9vPLZykYf7Vy5SIj0uogdEUHkP9dSCAGJiGGqUXmGGIleSUr5xvijPWcDL
         JrKLEt4q5Z6LHtMojVA8C8JfsfGFflWVwE+f4qtPau8Z0pr3lXrpnMF9VHdIXe+W+yBM
         k6rCS8KEsCJSSsUKGJiLZLlUb8WXfust5jTbSLPuUVWusZMzNpHuQz9A1rrAw4XFcV57
         9elDRxcE+KH4VdxwMywHZ75avK+1L2etboYiGprznIOfrjuAYtRPWoV9ZuckSexh2gWB
         FNEMy1HSrVVt0lefMVLZOWvYk8Q1jnRUzIyChjPAag1pmwD2Q5GR+r6rkZZ2DkD1mTtO
         i16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757934056; x=1758538856;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T63X1LQwQk/2hAt8FKtd7anGWLgK9h7B68o/CL4jZ6U=;
        b=Yk2xTDoONxyzkwE2qCtWJUFnE+cjQUJt3F8EHzwMutfc8eNhPnxJ0bI3ciQ6h18UAC
         GHJd8SV9Z1mt5LThIBZntbRQVxm9C7ozJ9k3UmqZCLeBJCqBvW2a9YXYz1kJueXyjXWd
         KO1drqbi+b7p2GqjO/InPqS8fpzfX60ZtHvohTBjM/DOjWWW+EfsUUyJkwlKR63Cjc5J
         2lrirJzkTaE82wVSlnKcqj+xz4L0bUevpXqkKhoWau8ym2FRh3hxNgEGE+BfsWGuBMyn
         152Ic7q/xBwBozejIKI0WxAsh6Sw45DAZVYf76ym6EyvrK80icIo48ucVr9M3jfp3Jo3
         R5Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUT6oZRmC23UT2mvO3uTclhbw8vvr7/bqMrdaJ+MyNMmfBQamkR8f84XmUIQZoNVL2vBLbDA11mLJ+4/J6B@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb2peuLhhCYojqMabusuk/ztB0AkKlbXPgrsrOkDBtYr36B3k5
	cGUtnlMnwCu56VmNm9z0bAtVNUaaJ5F+Xw/ZFayyDtrjY8mXqanO2b6TkT8Id/67Zig=
X-Gm-Gg: ASbGncs3Qmp2X24HkVkZjddNynU6/wN5cIwtGDyuaWfP32srsowpwf5qs0XOgXLIdhw
	PXBZJfZdoBDhTjjlfDDGF0POmeKyaz8ngRbm18hHc9PUCreaCWLz0j5/RvTxmE/aHK3IBnHoQgF
	rLxuLMoIAvU4gsgqk63rE+ufgMO+epEtFoRZ6VZI2B263EozfnjIuyE/bEK4qnarEzUEX+LY6bC
	6vwKgP4b1lQfb/LPgbT7UypHn3my4tVaGoVn5wBMNLVioKnH5LrlamJ2hKA6x0Ty2TTziPeh25q
	6LY09nf8+/6Uq8fF87rYjYLFqH1xL9WJ0Fv7TijEEj5MKZ515sj6Pf40wqeOoOammbeSrKmhMd2
	H6XP8GxeiwWXfdP+nDqK+pQ3sRXrAFu1me4YcW7SfTpGrNnygKBLg6MCu6rlWuDfPc5Wd7QR/3F
	N3MKQBoQHc9+Tv7LPLPLinkA2l/aA4gA==
X-Google-Smtp-Source: AGHT+IF2gIGDbHEOgoK5pROighRDhmTz+p7m86Ot1mCrRJvMBJ6OX02h9vrPcUk6pgDO2JUXpwgQlw==
X-Received: by 2002:adf:f547:0:b0:3e9:2189:c2ca with SMTP id ffacd0b85a97d-3e92189f2edmr4043887f8f.39.1757934055977;
        Mon, 15 Sep 2025 04:00:55 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3eaa6476fadsm4123755f8f.45.2025.09.15.04.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 04:00:55 -0700 (PDT)
Message-ID: <51f233b2-f348-438a-ac11-0b711617dc0f@linaro.org>
Date: Mon, 15 Sep 2025 12:00:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 Enable IRIS
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Anthony Ruhier <aruhier@mailbox.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
References: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
 <20250915-x1e-iris-dt-v2-5-1f928de08fd4@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250915-x1e-iris-dt-v2-5-1f928de08fd4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2025 11:06, Stephan Gerhold wrote:
> IRIS firmware for the Lenovo ThinkPad T14s is already upstream in
> linux-firmware at qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn, so enable IRIS
> for the T14s with the corresponding firmware-name property.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 23213b0d9582822e9503e4acf18c62d5c8c7867d..0a989e9d3d23146cb9689b68ba6c5779283b3c98 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -967,6 +967,11 @@ touchscreen@10 {
>   	/* TODO: second-sourced touchscreen @ 0x41 */
>   };
>   
> +&iris {
> +	firmware-name = "qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn";
> +	status = "okay";
> +};
> +
>   &lpass_tlmm {
>   	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
>   		pins = "gpio12";
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

