Return-Path: <linux-arm-msm+bounces-73554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1C5B5776E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 198ED188E7F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 11:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6B52FE567;
	Mon, 15 Sep 2025 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OccjbSNe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B1D3009D8
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757934018; cv=none; b=AKPzQl5qvO7g3Vg5fzxOi1wEan2yNsLhv0ug/VXkN3LiFe+PLGtCQw2mc8msJ5TMqWcJstLiKaZcjHyTg8JBoajjNYwOzLlnUCbV5cudTOXigK1Xqf7UAN2U1xFaQF75/LXC+6sSDDVYzbPLeqP5DlYEjjrxE3UnlU9GZNuz68I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757934018; c=relaxed/simple;
	bh=wfYWp8Pc+UKJ7u8yqUly5+sstAVS3iqcTk4Y694W6tE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDqRkfBSfgmJSnrVl7GzYdL3zQx34Z+bHdq5cwlBPRWs8NTMVB1KWFWSxYic67EP3lF82XbhEAqVC/ArCdgtMrLgAB5jU1NaqKIEHSaffqefTmyYTvwfx5b8/DLFfVL68CBU1aMAvq/ZihzNDNjfQzH1W7PEHs0mlZ+va90+s1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OccjbSNe; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so8292815e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757934014; x=1758538814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cGG4uvrLGLaqWZFKcwV746KSIB3cs3UMAq8Ovw+PWKI=;
        b=OccjbSNexltgFmncG4Gdh3NfulkzvtRHldiYED47R6s6HgLTiB4TDTszxm5v1F996Q
         oAHedUuZX54v9xKO/wwGoUub/8MT+KOsW+JFN8Gpjp4vR2k1DK1+BFcKEZi80/eKVn+g
         L8VG8IStuRK4mccHbwyG5zlOoL4JAXSs85ENFyUOrSB6RjwUkv3Y9qhPWWS3ZtcmPzv7
         q5p0m/liPRGFR5x2oEkgvZf4GvwNhJe9EH8geAemhIoCerfBeBapYEOf9mqcuP1SK1c0
         SBmC6wtVqqXmfUoRw+qPNedI9uD0pVQOc/DgKmzlYagfGjB7pqPjTOSI7ChaGhJ62dhg
         g9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757934014; x=1758538814;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGG4uvrLGLaqWZFKcwV746KSIB3cs3UMAq8Ovw+PWKI=;
        b=TZa7SNesnARaad/db2rgjoJHoqYW0j8wYxYuXbjh2YHAAaY9Nb8J42kOI0osk9QoRe
         bsq8abrgBlgT/mYm0lDs12kqmnDExZzb0w5Ls+6KbBPacXEgNVvY7qObBCTNRLEZN3yk
         QJTXTUbdvYOixUvsxyJlVVsgSwUlbZ5O7NTn4+AuESIXV9kJn0ckKvDlXu4e9ZvR9ZfA
         Mmu0kjpvELFP0ZQNElF4P1yUGfGgV45qpPZkLZ+Vw54KxeQ+Yl6ibnG/4sLEQojVIKh2
         LzrJbkWBYKxRyP+kF8w05HmCvUmFypAxQLInVE5JH6BCfRDEQc2YgvITUjdAADdtSl7g
         4AHw==
X-Forwarded-Encrypted: i=1; AJvYcCU1JlL21qV7NVhLZn/yaHcH5uk2ZNYMHW9SucKT71EfIl5ZUjC0w55I9UzXEHMM642kI22EIzpLQxFTyvE4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg/4dHhzB0JTau4nISVRiiDFrVYjMqa1rfN+DfTEkxFFUpP7ws
	2pN3Fh1qZCn2KOA3gG8NGrBvfMyNJ9TbqC0FzLtSXZJBdXWAjnicmR7tygPnGuMlrBo=
X-Gm-Gg: ASbGncsx+jkh4mxtHCZ8vl4YtfEZr9t8mWroXPdD/14FwgIZGk4HD3AjEGmfMqd4b5w
	wpjgiZ810R4kRPbrRzdmYackjqy9M88tuXmlsd9n3kLzMa/TTTrABwMaSqnc7F8kJx4Aztb9VH5
	kJ8nYV6LDqOgUYOyKoLhbGSZvdkoaPSnJV1OJR6TTHV/pObFOs2XjF6BsVrvLDlfVeGvHTJM/WW
	qx9uk7EDZR/wT9SUDox4q1CG+mNSeKRJPzIDpFj4Tp/E1ITccqMK4Dw84vW3ym6bgq23SOaGKss
	TwyxYMPFoGBYWElkoETyLVcSSSgpxNYh20GorgIyC3rtDdoRkyTcIuZbLc1ocFk3SDXPZyT8YEj
	GHfPcqykWJcz0JVj2Bo3ZRalGFKMzx1CmdIIlRV5lvPzlmalMEgX0SRlYgMiWZ7sYUaISNW7BJ+
	klJqAGo5ar/wCQPv2IYxw=
X-Google-Smtp-Source: AGHT+IEz91FCTl1nmoK5pFTyflSGIV86EIxriwQSn5dTyu41cWmq0H40aC2oqi7gM/aMoDsw0b0qeA==
X-Received: by 2002:a05:600c:49a2:b0:45b:92a6:63e3 with SMTP id 5b1f17b1804b1-45dfd5e3d5bmr99292885e9.9.1757934013500;
        Mon, 15 Sep 2025 04:00:13 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e014ac1f5sm90871305e9.0.2025.09.15.04.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 04:00:12 -0700 (PDT)
Message-ID: <e825b2f2-c54e-4189-9194-5604c08cca96@linaro.org>
Date: Mon, 15 Sep 2025 12:00:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable
 IRIS
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
 <20250915-x1e-iris-dt-v2-9-1f928de08fd4@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250915-x1e-iris-dt-v2-9-1f928de08fd4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2025 11:06, Stephan Gerhold wrote:
> Enable IRIS to allow using the hardware-accelerated video codecs. The
> firmware is not upstream in linux-firmware yet, so users need to copy it
> from Windows to qcom/x1e80100/dell/xps13-9345/qcvss8380.mbn (just like
> GPU/ADSP/CDSP firmware).
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index 19a2604038a88f37e6ab87129a6318db78345339..58f8caaa7258077d2c267048ca048279109ddb71 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -875,6 +875,11 @@ touchpad@2c {
>   	};
>   };
>   
> +&iris {
> +	firmware-name = "qcom/x1e80100/dell/xps13-9345/qcvss8380.mbn";
> +	status = "okay";
> +};
> +
>   &mdss {
>   	status = "okay";
>   };
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

