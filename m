Return-Path: <linux-arm-msm+bounces-63716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C53AF9662
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD5385C0F5C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 15:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A001BD9C9;
	Fri,  4 Jul 2025 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TsGzQbFF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074902C325E
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641709; cv=none; b=PY97JxZTUVv5NT+MoaFW26VgAcEtxhRaYM2L2z0zgu2KYyAW7fd73pgmDyXMBgCWL3m8nZTIYT9Gjn28Usv6oXx3FDluCQheiIe+bmsG/rW346UqWagdWst2sbdnPlzpWrhDfbvUlwHL5F9hn93op0UYtU4FxNwNJH5YVnR7fzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641709; c=relaxed/simple;
	bh=z99ypbhgt7PRN8CNu5zmUrW+s65R4pj9X6lJOs+6Kxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJd/d18uz7Ow3AbL2vZyHpfeSUBtokpXFocmFopOGFt2M7wS4RmLwzITckCg0iGctTqiooAzpusbQxKQSwfZpw124RW/AQHQlMhCP/+IWEKQEWiJsdnrWbTR1m80sjdd1idxPvccsGJzRbwvFBINthwJghjDd+NPK06781vdlPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TsGzQbFF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso8689915e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641706; x=1752246506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JRqGvyBumH802l+nR1KOGYBxhhomQIR/CQn84+0wMY=;
        b=TsGzQbFF8RL+7dmPk+WF6CWVnx1xG0MJ+6u6RX6i+R7FRtfg1YT8QqsElhddbGaYgz
         dTqIl751+WFPl5LWNw2W8qTDA1gHOWAZnSZDBOSggvfy/PunxJpl9+4W5q/tQCqwJH5Q
         joPiAYwHwOc9VJeRTYXARvIPuY6koX9soZm8IpG8N0mV6gggwqcjz6ZfhKTyr0C2G8oy
         eeOeB9CGobcrcnjrStG52jJ2HUVa/9ss7B71yw5gnArgGVUBecKs66tt35bd/i55G+EZ
         b7yg9ZLKv4TYEh+h5Fb23zzFzqza9KSTlat/OzpKE1SmfYErxn9u8gVjzWnQrxUNp0Bw
         eCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641706; x=1752246506;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JRqGvyBumH802l+nR1KOGYBxhhomQIR/CQn84+0wMY=;
        b=BSY5YBWNdeKPjB3pfUfrlwmjlHet0jn/6t4kZcYn3t+xZ3RCVcPzl6rajHRVHMIYsL
         o35E3BQwuPMEzXut7PLvhL7LVYcWsNoQZM9EVSmaK2bOaoMGWPQ3HMinqF/HgH+CJKuq
         R2yMFB+1dUxWYX4dA+ndf6RWgc6L3eDszIiR51+bBRkxR1iAXxvCDQgrLivKqLPAUhX2
         jcI2LNPagAWILinE2/FbE7nTJjlLH91Km43H58tK+a/aVIL7Gpp5CYL/1Jdwfn8akkcq
         SvjJvHr3LiS7FxjS/AJvXreQywBjyqpqs42pFaEb9XQvtJDkI/kBaRuTvekfXLSfWUCD
         Syaw==
X-Forwarded-Encrypted: i=1; AJvYcCVpHP7uiTe/EKQgFF/+plyToFJXt4i8V+mmCGFcUCQsbxD6JDHbBlNvpzjbL9BfCUK6bFLlN5eH7cZQJWW5@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ5iBBugeVQM1oOKQNNoJtdlM+k210YRly3fO0BmmrKBpIkcjX
	lzTpiCgI4ex8nGWqronvbAIKnR6dvy/1s7Ar9cjNu3nmwmYzV/bR2V4rXXvbONAJQJo=
X-Gm-Gg: ASbGncv1aWphFtrHnR09dWHCkkNtvk/4rLDaqt4Wa1G7LMLtQgOKMV7B6wKm09hdJnb
	QGtzvgo1otlBjSPOVbTEcokCOQE+PBzPN/awigLOAvrxK2urMjvxQ3DXKqDrE5c3HgPR1B/F7QF
	BfHJ3qadQMh5+FO5Lb7LDJJdCjRAEWrcYfVPa4iVQCQ9ve3AHMhzf6fjmgWpFPHsT3zcsYqQkTk
	nWY2ctvBWW8QMvZM55SgnCG0DD6Chz/ToSqfu6hFXnev1R2Mq6+JPc8NlNFIBBl8ct6wCMKDdPU
	yc7NWUQCadP2RhQfgXpFOa2cZILWtd9NqAi+eTw0UBjspEWppoQpytOd1IMjDIdE45oJlkMJykO
	Yy1eF+3cLoSjVMaO/eOkT3nPzpmAzSsoxzZvRuQ==
X-Google-Smtp-Source: AGHT+IEhXyWUKZBqJ1/rbt2q/CXsfjI081WY8MKxoJLn03mwHiCnJ6/2m4+MnYAdB1lvJU/vPxvxlQ==
X-Received: by 2002:a05:600c:4706:b0:454:a37a:db67 with SMTP id 5b1f17b1804b1-454b4ead1c5mr30539075e9.17.1751641706107;
        Fri, 04 Jul 2025 08:08:26 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454abea60d5sm37229795e9.1.2025.07.04.08.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:08:25 -0700 (PDT)
Message-ID: <93a1f14f-ae25-442c-b495-e66c74193d06@linaro.org>
Date: Fri, 4 Jul 2025 16:08:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom,sm8450-videocc: Document
 X1E80100 compatible
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-1-785d393be502@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250701-x1e-videocc-v1-1-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
> X1E80100 videocc is largely identical to SM8550, but needs slightly
> different PLL frequencies. Add a separate qcom,x1e80100-videocc compatible
> to the existing schema used for SM8550.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index 0d99178332cb99d3f02f50605e19b9b26e3ec807..fcd2727dae46711650fc8fe71221a06630040026 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -25,6 +25,7 @@ properties:
>         - qcom,sm8475-videocc
>         - qcom,sm8550-videocc
>         - qcom,sm8650-videocc
> +      - qcom,x1e80100-videocc
>   
>     clocks:
>       items:
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

