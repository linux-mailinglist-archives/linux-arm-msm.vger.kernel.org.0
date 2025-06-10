Return-Path: <linux-arm-msm+bounces-60747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3EBAD32A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B06753B7AFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 09:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FEA28CF4B;
	Tue, 10 Jun 2025 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="scAx+Ssr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6DB28B7F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548897; cv=none; b=K3Y66yNhXtsUrMaETR+08SNpiSj0y+9sINKEEgEHdSWajX2WszE9KKWgxoEmSM53CIR98FdNgRWV/u0HbEvVlVXK1dHYaExnmMqwapOihjWBbLCujWhxk1GWuU8xSikIy+egnGjh1QjriRvajOa6oKmwCpe4nXPYbWbnsGppSBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548897; c=relaxed/simple;
	bh=drtc7gbE8EVnagG9aoANO0Qzm9NCLkeYbn19VDrN7lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKDle8YJSu8XBGNoEANU+y56rZVCB9Nrpu+uJ8tYAE6UYaiUVwC0qFgzjMUKbGsXRxnJz4rjIYWHkRJmWnQSGU2Sa2YT3sBqwCMnhACgWfVcYh0d8nH6i5dd5jD84CeEWMfoNm5GQG8zbY9l0YApBI5Hl5EOuXl9Pv3rCLxc1TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=scAx+Ssr; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32aad2ab31eso2109901fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 02:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749548893; x=1750153693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgWX/fDU4kZifwwXOkRhcJUMm2OkuAYm3wpAj+nwwK8=;
        b=scAx+SsrlfVuPuqcaMtTXapNGGrTB5aQau5mq50//ivDM8yO1CJcmReZzhMlsMy6vK
         ftl3ZMclXD6FVwN2c2ZGJQsTnruNK4EW3kv/EpiG0zu1bkTqUlBS92VD/yNG41MXeWmz
         WX/UgUkfMjGMwI/kMWg4sGaKLlH3tdlhLGy1XoWAArjwUFiAkPFyHugg6xZJcVA+raPK
         W0Pa0P4WCdvQ9CIuj5B7RxYW0GLJ1Ahbz7SqMc7opdXZEp40LqCJ+sEkTyO/5jmLoOgp
         mr1xPKawAjKUcs0DoTFx+5W/JNP/2+wtBzbpydrdVTbfTDDx0qk3+vVf9QeCNXwmpWEi
         LP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548893; x=1750153693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgWX/fDU4kZifwwXOkRhcJUMm2OkuAYm3wpAj+nwwK8=;
        b=aDIynQeG+G7REVPE9HzBjm/GKhlh5K3zXDqRiT3YFbVSQ+kKV5mag2FYDEFOQXi60H
         Om9ZDkSRMQ7mUzXCY3pR5zKSH3XmH3O94wI8XksGbdVJ6zwYwtGyp/oPJvTyhH3U0e/A
         fYRzejF8hM41pbhv/+zjOvpF0kpaBX12L1LmANH/VyMuBl6/Hbcv83QvAMyeBXrHGUO6
         Uhd5NPwrc9vx68aONEY8Z4G6IUKCnGWZC1KNh1rPN96KvtR1VEECbyrwEDjvd0Rk7DSl
         ujSqmJQFgrc/5jv/fWSD5g6XgZnpgZxKzVz6C0DJ6/Jqad8ek59g8gf6xeoD6gL/HCl9
         N1dw==
X-Gm-Message-State: AOJu0YyO6dtJkDH39hJgSRXiX4EoCEYxBkCCA/1vRvSbbDbLd6aXtje1
	UCfSbpFcayJ8p9TeMR+DuccUDhuVT0w9S6+EN82y08sw4mKhU25G5X1NL4brbZQ9TiI=
X-Gm-Gg: ASbGncs2Ams+vjqbqC5J+KV/NecoPyO2JOypXZ3IYrbPFyMR5DRrWJ9oqQWJ6ezfRSv
	q5EOsYTST6hLszW2nkcMT4b5J02eivNCzbsq86k1jc2VjCU8w4iL0PhWFeRfvr8HIyBBef/ponv
	RMMP19FBkVhIPe/noXD4+nxviBtIVgiUKlxh9ayJX8YZ71R6oCYHxrBFL5FI0d3e+w188GdO3wv
	xI/l2vcTw7/hCiFPmOQ4JEOtTKAf7Xf7p2KeTynp/rbFi/jkXuAcgIsji7OYK8cZUq31Hn3Wqt7
	XrW8paFVrGhbEis0N1+t8Fot9m1WDMTxWMOBt6qJgiYl1xJPHwVA8/q/zzZw+hzESrAhHFUPsVy
	7FAtIlWMn+QhkDj4t1+FGW7JFINwUCsHDNNY8sdKN
X-Google-Smtp-Source: AGHT+IGe42fvbz6UNMq3WeYyozKULgQbXzEyVJQNlI32jNbCy2BtIg4bwXtTOyqOT4GzCdoEQ38Mew==
X-Received: by 2002:a05:6512:3b96:b0:553:2e90:98c6 with SMTP id 2adb3069b0e04-553687982cemr1368395e87.11.1749548892235;
        Tue, 10 Jun 2025 02:48:12 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722392sm1471777e87.127.2025.06.10.02.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:48:11 -0700 (PDT)
Message-ID: <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
Date: Tue, 10 Jun 2025 12:48:10 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
Content-Language: ru-RU
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 bryan.odonoghue@linaro.org, todor.too@gmail.com, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Wenmeng.

On 5/16/25 10:27, Wenmeng Liu wrote:
> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> 
> SM8550 provides
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 8 x CSI PHY
> 
> Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 210 +++++++++++++++++++++++++++
>   1 file changed, 210 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e9bb077aa9f0..722521496a2d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3326,6 +3326,216 @@ cci2_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		isp: isp@acb7000 {
> +			compatible = "qcom,sm8550-camss";
> +

This is the first time, when 'isp' label is used instead of 'camss', it might
be I missed the context, is there any particular reason to do such a change?

If the label name is changed to the regular 'camss', then

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

