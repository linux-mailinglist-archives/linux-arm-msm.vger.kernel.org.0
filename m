Return-Path: <linux-arm-msm+bounces-21583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D61E88FB156
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 13:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F401C22300
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 11:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56528145A0E;
	Tue,  4 Jun 2024 11:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XkYJSVhB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D71145A02
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 11:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717501538; cv=none; b=VGMe4x+7id86JudVl1ApfKFmJBozJPfuu3Zw7ZjR7FH7wP2+IFmbRUwqQ7ZziHZSOhN+aAHT/FT6aIgN+/VA2IW72sbZvUB/XizlsCLDbrIxaVnyf8kvyfvxwmJg0mjmO9dW+sCmYCGcRKpbvvqqcyvIBCyW7WZV9ez5OsrMzOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717501538; c=relaxed/simple;
	bh=EqkGWZ9F8GOUzilRYOYPTx0A0909TDaKfDfPNVFxtdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNhx32W95qyzTl0rPG7/8kSFYGI4AJaQQ71BHIhiXwFeqRHlCcAzrBtzZNXjUaiJcmtkYPZdbyIZHFqF4jPQjLynGpoQaQr3BHu95QsgYAxpmhIqiZIvksjnM1P9OglKALMyMfdtiOga3AeT9gcDTvq3K4wHb329Oimhp2vnVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XkYJSVhB; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a68f1017170so96356466b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 04:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717501535; x=1718106335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jEYPS1P1P/pg/x7T6VsyXUmYK0wASnWZkTb2yubv/Tw=;
        b=XkYJSVhBxhYqOjVGtiu/Cj+gWp63lJQiRpSvlMH6C8Xefg3WoE/F3qk7H2uZmr6yC7
         5tFARy2br0b7/zREMjrvyLdk7tL4fGyPixWSQOoddFUyJsZGVuei63IWbLJpDT3uLyXa
         DnOAkMulwIYBGZNaKzin92wLgxNIqqTqb0WVfgjijl1AWfh0euTeR2s/aCbPGqz+Qlz1
         cU1TWiAeGL3BIoImrod1rl/gLOrxeWzs6Z4grDlrCoAMcWvMtBeLa0MVfc5qyfv8fLba
         tqi47R8kdIYoslWZdRGfYSQjxn/StdY4rDcm+7+QKaeFz6Zgt1zufi46PNC7SoT8Ukoc
         Oa4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717501535; x=1718106335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEYPS1P1P/pg/x7T6VsyXUmYK0wASnWZkTb2yubv/Tw=;
        b=kkifTABkx1YYnBpjwWgnB6tvZlB+kdOfn8oLbKbTN1TYKidEqP0aEdkO5CeWbgFFCx
         2np/Uiw3B5yE0uA3DmHOimc5MzH+ybdCPp91WQr/bEB0XsIQtwqz/j60DkuCWjYVhjZT
         B0CpmPHKXYk0f2rZDWUHywzsUaIYRPfPnnA8m66wT1jB5ZAtvZFIvtFLU95E2OxOAMXE
         317FPoEOgXvgWr1LOv0Dhew5x27hlmIUW+xHPVhtpEGLqucc2doAMLMEgdatK1d54ScF
         RhLkioPEfzKlE2rL5cmGuZGHsLmzKDlfqdESi1iHJ/C2d2j5WcYKSutIAVTTQWua5t/c
         nOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQFjPnA/NOCh7J9drTeVATlXnSHNRMR8IVa8pQEYhxxsR8ZYdtk3ci8Tz84f6FoqykfsQ5RUzHWoH/bQ8dbsdUujFJecOItogv1yFEjQ==
X-Gm-Message-State: AOJu0YyKETStEf+fcEN+fuADxoCxxBqhqw7EVq6OQyvRMuPunHRz+tf9
	qZdz7ehOETAQ83Go+JkYdNzInebH1/g+t/Cb9iNwqNmZ/MbXQqlDPkxavn7H+j8=
X-Google-Smtp-Source: AGHT+IGNC+G0CRWDuySvVpRylDriDDDpg7AMDvN3xv5vrnBLp5WpII5byOdlZw58pQV67Lx+l3WClg==
X-Received: by 2002:a17:906:5957:b0:a68:a958:db18 with SMTP id a640c23a62f3a-a68a958dcbamr633833166b.76.1717501534980;
        Tue, 04 Jun 2024 04:45:34 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:a035:2af2:8d85:1f72? ([2a00:f41:909a:a11e:a035:2af2:8d85:1f72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68ad1d7c8csm489285966b.80.2024.06.04.04.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 04:45:34 -0700 (PDT)
Message-ID: <da4c6403-7886-468d-a1f0-a3454bca2c6d@linaro.org>
Date: Tue, 4 Jun 2024 13:45:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Disable SS instances in park mode for SC7180/
 SC7280
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Kaehlcke <mka@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_ppratap@quicinc.com, quic_jackp@quicinc.com
References: <20240604060659.1449278-1-quic_kriskura@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240604060659.1449278-1-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/4/24 08:06, Krishna Kurapati wrote:
> When working in host mode, in certain conditions, when the USB
> host controller is stressed, there is a HC died warning that comes up.
> Fix this up by disabling SS instances in park mode for SC7280 and SC7180.
> 
> It is recommended to set this quirk for all Gen-1 SoCs. Will identify the
> other SoCs and push a separate series for the same.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

