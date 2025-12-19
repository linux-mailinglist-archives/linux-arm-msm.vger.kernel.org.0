Return-Path: <linux-arm-msm+bounces-85925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F06CD0824
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 16:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94454300AB0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCBA33BBCC;
	Fri, 19 Dec 2025 15:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVICYD1i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269F233B973
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766157871; cv=none; b=AQpnl2rFixN4IJSE0p1huyIAkTnSZncXfH9KPEA9CpOsLltGLmhF86cjMxqu2XT9RO7mJ393j0S3K9irmQ1HmBouYdkH4KqQRDw5odetnjFUGFShqpWkJDQjoyO+G77eMijI3HgJn/NhfmYoEz8QDindl2emPFsFJIlgnkWJ3wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766157871; c=relaxed/simple;
	bh=pyaIykGPB70j837ze1Yr0lmYLtFDXAzteGopj7k4P2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJ4ea/6rC7DhhW0qYBO0fYR1HEe7xjRtbtlvKl92uz8abKBnMn96MPwjbVNyibirUiMKOOYqo6mbpxevqTX3CNCMVuJdjU2Y5FkO7jR+qEReI4MF6aEQgAlrqZo7g3jxb7ygG7JDjDwJLNKuCV44Fwfaef6oNMBH6VR0TIqVsks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVICYD1i; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso1659559b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 07:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766157869; x=1766762669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KXMyp0AmN42Z6/oPi4y0Uh3k5P2iSKmKeUWrXrw/OhI=;
        b=HVICYD1ij2cv4eM4QwRujz5hmSrSMIP3N7AZTBLZrOV3aiISFaDg72wWSJXZaxxj1d
         11SWWWzqLN9Ihkh6GpeNlSSx6/xE+uXW1smKk+hXYwiKg+zc1kTc0rv83lZBwsBYswyI
         PUmXGQ4pu4I3zmQ9XAT7E4TlnblQXir61deWR0oWTyOWLtDOdKccZrZ/EZFgB7U9BpAV
         /ZauCkiMGFha3DryhZgsjPefwtgGrpKqkaFimi9+F109/XQInyNzcUxtMoXXPuolIudp
         WkD2jrxM7ho6FBSCACQm0vnpr9Rh1vYfLyJITDabF/eP/sORlLOBBJzeQrd6926+H1OZ
         OBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766157869; x=1766762669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXMyp0AmN42Z6/oPi4y0Uh3k5P2iSKmKeUWrXrw/OhI=;
        b=GQpRKZJU5tN+CTeWf+uanCwHdD47JInPcmp2ek+Kx0ijWGEZLYlQCfWo+t8rkEBtsF
         hnffunYwvnbJ7mqh3DvkuktZHoOWBHAnY5amKX654OCQCsfyVkJQEvolw0Bd12RScYM0
         fMy4+u7OY31aVDaj9+prPW6BCvMO6cM6dP1oCNuKJ4swQFBmOg0oqQ/GQyteqmxopMmD
         99pJK1otu5NvQFB7hHLHfci0h1XV9NOvE9XwzPiGo2crmSYwKX9guEA5hysk/4lWMnw5
         YiF9dQ1Bg3eDN7WZoLGxNldDEAqE4YAHH4JiuFdbnYZ3ByI/gfRCHiuKgJKInJYktLt7
         lwjw==
X-Forwarded-Encrypted: i=1; AJvYcCWbNfVhidsdTUQNWhPxFNLSXTETxtLursjT9ybCFg1FlPg2aSWBXIOH8nybsfLLsUxxLrmnlIfmDJE0XTuY@vger.kernel.org
X-Gm-Message-State: AOJu0YwbOrG9W1RNS7Qi3x5R7drhcTqhx9rW+g5b8K59omtG0jIgj2vz
	9Fp07feONbmoaJKUpb3EMdX5iJupwuVDh9B05rKjgeODe/XOKOy/+TW+
X-Gm-Gg: AY/fxX5ZUDph8R+Qea5M4gs/qDJJTETeFltgWupXLdyqmlvXd+r2aRxDqLCD+i2z63G
	DcVmqjYbYpgbJ6gbHadr94H6eoBG5ShX5f0uGp6riQj904uYhCZjkHKDAM1ssCQpeZBV3dusQ+F
	ZlrjIlBMRTpS9d1HegVUR/ZIqpIS5HwG6ZgQtYPs7CkPIZDZ/fVe5Ua1AV0wHb5stkHDAT4H0Hj
	jz93tzZwX5Y1N/xRr5U+Qqc1ov4pcnfSo0EKp6U5VaS0x/vGEOKPQDZPpYNHnNWaV4DFmrPiSAh
	jT/pFLoD6AYY+uu5JQrAYDuf2+cWIjZVSgCE4+jzt6TkSpNeYFH3488+c9A7VCB3LQXIBnPmBiW
	8gU+RPXPuTInjVTua+yVr6XfCTtnSjuMiJjYdLSb4NlbqgQpYPZTFw6IEGwNFU4L0KnLSZsdkLR
	ct8vMDRSPCQQkwUdrNVp7PFxb3o118/8mxmKUfH+I6AfiG0DffEpN6dT9I1ORv
X-Google-Smtp-Source: AGHT+IH3aUgWlSLmmNgeXJUtVuAJkCaCPzHfOPGwYGlINzMZ5QrtjAjTFU7dPdRreuBeByHrfX4TqQ==
X-Received: by 2002:a05:6a20:7d9b:b0:355:1add:c291 with SMTP id adf61e73a8af0-376a75f5bb2mr3608090637.10.1766157869355;
        Fri, 19 Dec 2025 07:24:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm2495572a12.19.2025.12.19.07.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 07:24:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6dcc54b0-7b52-4759-859a-983edb1a8337@roeck-us.net>
Date: Fri, 19 Dec 2025 07:24:26 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Document X1E80100
 compatible
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
 <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-1-fdfc6ba663e6@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-1-fdfc6ba663e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/25 02:00, Abel Vesa wrote:
> Document the compatible for the X1E80100 platform to the Qualcomm watchdog
> binding. The HW implementation is compatible with the KPSS WDT.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 54f5311ed016..f2c4bc900e5f 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -43,6 +43,7 @@ properties:
>                 - qcom,apss-wdt-sm6350
>                 - qcom,apss-wdt-sm8150
>                 - qcom,apss-wdt-sm8250
> +              - qcom,apss-wdt-x1e80100
>             - const: qcom,kpss-wdt
>         - const: qcom,kpss-wdt
>           deprecated: true
> 


