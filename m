Return-Path: <linux-arm-msm+bounces-23045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6B590D32D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 15:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47EF81F22553
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6565161307;
	Tue, 18 Jun 2024 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P2B63vUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327AD156C6C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717765; cv=none; b=R7DhE8X/hBaDifZosEG/40E78sHKS0djkCVi/YCF8mOH2snmYRTHSs9bLFkO1WdHqKIB8UzGHnIvkAACXqCaI4v3c/yhTKVXg+QjN/taq1cl2kcaYZ7j9Cv2dJm27fUQfi14y8WMGVjZtJ37NdIlO2nVwEqLiGxuja5y0SHG3gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717765; c=relaxed/simple;
	bh=gE5K1CMg0FDplJQ5qb/JC8BlAQdTg4qg1zpQnY6aNRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1Emhg4v/Na02Jfh41yiVzs5qvmrvsT2T6PilCvdr93lMj89xuhtHvGg9zWUL4NF6tPgfCZ+PTq5qED0AUC/WLdRtkyoOMntXSqY7RLkp5w3DQvzmDPXhNLAORqYb5AFCg/x31zKWLLdrqHKeVdsiuE7pWvpb6z/zChhxdWdgmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P2B63vUY; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52c84a21b8cso4980150e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718717762; x=1719322562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9s5hs5ZuL2Zn53VjZAMHLo13K1X8TUCRyypHJObaGA=;
        b=P2B63vUYfZ59vNDRxC9yU2S2ZKWYTl0FUTUIm9Ezh2a96cIal8cz2avtHwjaYIgrh3
         3+ATRLAnurGStP3+ayiwh86DJ6ObcSu1+TE6Pz+DZQasdo15onMzshoiGX5rmgpgKUWl
         wT1wJK0aGumJSae89Uf/+61nOcKWIoc/eKHyK2xbgiPwlWPDfXmUzIQwimuCMYQYv/pw
         bvSa/23o5i9Q8VI/BDcrFvokoJ+knOWqB9rNPbJ4/+/niji7HGc+FUDs2POZliqZ4ZMd
         W3otcU4d0lhvyJucusKwQ7vN7Bqp1xcsZIaCfZsmc1knLmDLZ4pDcFR/K2muYE9U55MD
         GbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717762; x=1719322562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9s5hs5ZuL2Zn53VjZAMHLo13K1X8TUCRyypHJObaGA=;
        b=duVVFj4X9z8+QPLPXe4c8nw+L6oVKebT+pwkmtAivhBRisPYHlAr+GoZeN+ImZ6UvK
         UdYWRRKUpQ8o4h1WPQ/DQuYf0A4OV7E1Bzx9pFsgbwUnc9SoJwSYVFPYopbkr92tCQqs
         ih0W7jN2C2f1vfh+q4ll2h1j8JhMWEigsewJZuKO7X4daqFZGZW93jDT2DbRZ6IwC8fm
         zYBu3v+d0Hj+qhWHHbx/8XApt9fM7nDenorVNE0ZeirHZ3omLVais8WkcHb8gwe+YIEJ
         Cb2/YRIPk74Z6/Eqqkcy2NAgGTnvxEpvYucCJtznUvgdxqMPDtxQbTuuJVrXEQX53U22
         xwgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKXP88Sde3dAb0clrnyGMzjI4IH1Lf8eBQYEqX4xefnLNON7ImIbmE1CuHLkvzqB6Wxmy15Ipz7LB+LvbFsKVIf2GFROd4sIq0P2qRew==
X-Gm-Message-State: AOJu0YzPjvyG4wJtZluPe0f0cE2r5fQjbcZOLN03+4QOEFKCIU4A3dp+
	W5MM2iZ34IniDFCfnlhpEcEfY5pweFX9I6kE6es84mOLTYqj4vw0TrX3wOWLwOE=
X-Google-Smtp-Source: AGHT+IG9ei9VafGhogll0ZfQrnWQuX3q3mJNG9ItxBVOsOkRff58mzJtsjaCsRuB3ayEgZ5pWyxEaQ==
X-Received: by 2002:a05:6512:402a:b0:52c:b196:ea37 with SMTP id 2adb3069b0e04-52cc4767572mr906296e87.0.1718717761608;
        Tue, 18 Jun 2024 06:36:01 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca28720acsm1509466e87.146.2024.06.18.06.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 06:36:01 -0700 (PDT)
Message-ID: <180bb76f-a547-44c9-824c-b8d57f7eb10a@linaro.org>
Date: Tue, 18 Jun 2024 15:35:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm6490-shift-otter: Name the
 regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Caleb Connolly <caleb@postmarketos.org>,
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240618-qcm6490-regulator-name-v1-0-69fa05e9f58e@fairphone.com>
 <20240618-qcm6490-regulator-name-v1-2-69fa05e9f58e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618-qcm6490-regulator-name-v1-2-69fa05e9f58e@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 15:30, Luca Weiss wrote:
> Without explicitly specifying names for the regulators they are named
> based on the DeviceTree node name. This results in multiple regulators
> with the same name, making debug prints and regulator_summary impossible
> to reason about.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

