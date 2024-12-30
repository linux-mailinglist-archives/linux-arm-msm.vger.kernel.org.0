Return-Path: <linux-arm-msm+bounces-43615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9239FE507
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 10:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C3481624C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 09:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EAF1A2860;
	Mon, 30 Dec 2024 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jbktwipi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936041A2543
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 09:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735552166; cv=none; b=p2QtEV0PEJo+sRIb288jR7jKMKP9DBB1jDSc9sHUlYJ4fe2ssGhQ7veqIJAMqZL6zucGZ94DKZ9RJHGhckW/gf4e2nlh8s740q8YYmy9sXbI5YkiCb6fheNEUbggIMaUqMmRd0whKCN7XlzWcNbEFwjxS0lWqKTVHGr8X67aZWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735552166; c=relaxed/simple;
	bh=bL2nLNo2ee8JJhIu/TxKvxZbGOlAb51BZepDVaLijl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Okz8W8N6PR48nXCnTe6XMgUpFsk/tBDXICKDSteLSK1Dl+IY+FrHYZtuckurEvu02QyepFWKpsMBCqWqwT7W1PjjOkxEfubJzLdsrmJDRx4HQI/m3hCNslO5999ewbia2so6EgZpJzn9P79NZ/ai8AmSkeMFsiQpO3rle3eE9HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jbktwipi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43618283dedso90294835e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 01:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735552163; x=1736156963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+esN3YIK6pTMIxTy8e4iBTxv82+x9YWQL4TYuB0OW4=;
        b=jbktwipiLIJ9DA2usQNRXco7hPRrvFTJCvQdvIb4n+xPrqfbZCkF3hd41k8dneGLrA
         CVe/BF9ASwVZAaJDoSY+8r31e+9gyyOhpYWGdpeoBg603OtCRRAh6cVAjR0bmkdvfU4k
         b6LmSG95bMxhhTebNb84YhmcqhKzDvSslVLjmlsuNBvg0l98Ynppxg9db8G8yPhB7rFm
         ZwJcUZpMlsMJCRnQ8udgSpfKdbUO6kpqlR3D+jCHLKyRxXX/zrC1OoTK54Dcg9atMghW
         gLQmKgPfZ9usTKv2lUQO92WnuFyWrdBhK+JuV8idTA0S5d4jPx2SsQ/JzP5hSuTuk31N
         2uXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735552163; x=1736156963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+esN3YIK6pTMIxTy8e4iBTxv82+x9YWQL4TYuB0OW4=;
        b=KYaViMKHpb5+2hLNAJrMa2GU87G/AlRGngevfPaQFO1aAvn2KjOTIc/xMjlKtEdVlM
         RJGs7ERX2mtD9Tda9Bdf9WNKPFr1pXSfsM1yII61zyNQzYOCGCAhB64FHNoyqLJHSnkr
         LtPaeFcAfwF80hgxRbSoLdq8SPQJ9QI8iLyX01odUNdeQ+PVXWDm3wtGD3RoTPJbG+BP
         GGLUlPQdOCerIswvk6ksbnHBf2uTtqZyOfu3l6wNMdOQXTzOXVZqD6jSsDiuH5tgdRUr
         JTqe4eTvMDOwj1kmltbqC9KGOfRqxzqggRwnDgaYueMWMGUlq2EYopxwFO7AkH0COIBN
         XhCg==
X-Forwarded-Encrypted: i=1; AJvYcCXpjuwUPmd/ytWtijNuuIGXe+q4bkQqj9btV6IYRh74Zshbeflb7jn5CkxciNXQUpzMeTITJ+ASRnTLtvkf@vger.kernel.org
X-Gm-Message-State: AOJu0YwI3PbRizNp8wliqr7PWpHGdde3lnmVD9fqiaeEzVbBcu27Aztt
	6GHd18anR2i7oV34KCDxCvVm42/PZBK+VVl2L1JTY/s0fKyuLIlqKqs9whUw7c0=
X-Gm-Gg: ASbGncu6/nbXeZEGSKgGS7JHJoORT/3H+oraBnJw9jje3Q/F+9RFk0T4hnofvDEq2zT
	Ns7/9MxHMzCEruVjM54RQBs+cPvVLNWwqTBjjgpwWVW4fJxydNdM/6n/x02zxG47HLg9a+pJoJ7
	o6GV9DuUrYfk8bFdqsxj0bBkyU2zPlwRpYViovFRmhyW4iUHcWQR8UjYVvCuK04nHqGN+mjGZZb
	j2yZC5HUwwth9PkUh+F9C5r4uzYZLw5irqqUu8jiF/4aw8OqAQCaTEM1e+gEAJ+q/tMlQ==
X-Google-Smtp-Source: AGHT+IGBVBAwtvRjcbYqsbwxH7X6VcNR0cs3om8is3kIMRxC/cZabwyi6iTGqksVNpbL6UitQwALZw==
X-Received: by 2002:a5d:6c63:0:b0:386:3e0f:944b with SMTP id ffacd0b85a97d-38a223ffbfbmr26437077f8f.37.1735552162869;
        Mon, 30 Dec 2024 01:49:22 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea423sm355041835e9.2.2024.12.30.01.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 01:49:22 -0800 (PST)
Message-ID: <ef139090-8c93-475c-a715-9413ca28e4c7@linaro.org>
Date: Mon, 30 Dec 2024 09:49:20 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/21] arm64: dts: qcom: msm8939: correct sleep clock
 frequency
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, Georgi Djakov <djakov@kernel.org>,
 Shawn Guo <shawn.guo@linaro.org>, Stephan Gerhold <stephan@gerhold.net>,
 Zac Crosby <zac@squareup.com>, =?UTF-8?Q?Bastian_K=C3=B6cher?=
 <git@kchr.de>, Jeremy McNicoll <jeremymc@redhat.com>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Melody Olvera <quic_molvera@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Stephen Boyd <swboyd@chromium.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Fenglin Wu <quic_fenglinw@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa
 <abel.vesa@linaro.org>, Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Sibi Sankar <quic_sibis@quicinc.com>, Jun Nie <jun.nie@linaro.org>,
 Max Chen <mchen@squareup.com>, Vincent Knecht <vincent.knecht@mailoo.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
 <20241224-fix-board-clocks-v3-2-e9b08fbeadd3@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241224-fix-board-clocks-v3-2-e9b08fbeadd3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/12/2024 10:17, Dmitry Baryshkov wrote:
> The MSM8939 platform uses PM8916 to provide sleep clock. According to the
> documentation, that clock has 32.7645 kHz frequency. Correct the sleep
> clock definition.
> 
> Fixes: 61550c6c156c ("arm64: dts: qcom: Add msm8939 SoC")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8939.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> index 7a6f1eeaa3fc438f7b6c1d3b2dd17fb1b6f81d9a..7cd5660de1b33def5b9dc8a0d02583c3eaffb17f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> @@ -34,7 +34,7 @@ xo_board: xo-board {
>   		sleep_clk: sleep-clk {
>   			compatible = "fixed-clock";
>   			#clock-cells = <0>;
> -			clock-frequency = <32768>;
> +			clock-frequency = <32764>;
>   		};
>   	};
>   
> 

Here's a quote from "MSM8936/MSM8939 Clock Plan"
Section 2.1:

"The chip does not have a separate sleep crystal. The sleep clock, whose 
oscillation frequency is 32.768 kHz, used as the source for timetick is 
generated from XO using a divisor of 586."

---
bod

