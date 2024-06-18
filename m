Return-Path: <linux-arm-msm+bounces-22992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B9B90C9F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D87AC282B63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7875418EFD5;
	Tue, 18 Jun 2024 11:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h64uMDcJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DA818EFC7
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 11:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718708800; cv=none; b=GpsXNzuM8j2OYQJoHgS4+oY6WqtpPipJkhSQDHIcboaEXuoP71YeBitrBsdRdUneiUGZLwd9lNK/nruoz/Xwn6ABpX1udsS6uW386LZywjDLSrqPRLjVYv6YaCSijTK/oXdYyRCVIoIrRuJeOgm9NKpcuGhlZDO1JS/+mYrcG/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718708800; c=relaxed/simple;
	bh=Am09hb5rNTES561xMQzEHkDAVY5vO4Ar4tuZXHwiN+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCtkzQO/i88ACNYV/WGj9WeJyVrA96I/042TkYBzuTtMmujWhD4jTVQhT+p29mizXnXawlPx76KYklHMNoNOAemCIdAAeSQUKdyjcfbbl5pW7mNhVHFgPikdXlEia4QO4Jd01DGmS0I1BoKqTKf/xZzvec+T0cy2efj036Pp3d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h64uMDcJ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ec1ac1aed2so40642701fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 04:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718708797; x=1719313597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=107/jrO9V2OrXrc4KAyCZ+/nIEIgm16zwlwCoHMLHyg=;
        b=h64uMDcJdXAwrqKuowtt4Mc4+GocEaoB2P1kqSIzyzd6W1wE7uOP6hMyZ4rrJBRtuz
         /xXk3ITFbQwA2Z7/5Vz4EowB4kPlb7mDWbNTP3ANIoOwYOd2/3CQAG0OIw/zuu73BZJ9
         0nMjs3nAoBwmq0DGvn8BxvZKCOgNO973nO+LCtx4ERxw5cJ9MPSOFScOX4MVX+T/4Yjn
         GzQCpxnaE2FAEgMfeSII19ohSqmyMG5za0uf6wScJYrnx2vlQuNRp2k2TVYeQhgTXkW+
         ez1z0YqKagAOM7b1c6bP2J2qPaanvwF3NQq3LQOVcxJCF4eOCTli7VCmLJfZ5OjNMtP5
         mF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718708797; x=1719313597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=107/jrO9V2OrXrc4KAyCZ+/nIEIgm16zwlwCoHMLHyg=;
        b=DHH9nI81KpL8+CE0feDwvFQzzIsAsgYqVFKHx5SKTOjMLaYdIoSm0fXbuN30/rReqj
         vzPO6QvdOEf6TCBWwjqfdGV0tgLPvXw34bHCdluq/kGBdt01xVEZXy7qGpS0YGCA4qG1
         D+nWwJpchvJGoKBu475eGZzUy0Fv05XZCDdZjJFu0bbKb2ky6C0Drzb7EqcKGYolSCaZ
         SlX+AHWRXeOUE6VzhuViU39uibg1fTWcey3T8Xx1xACkInETt5yxd9qH2VKsCMenEkau
         MjQRum5SmtdjJcmOQSEkZafs6LlEaAAgebT8k1oO0vx5cf4DMA6QqDMpULSen/EhYzL+
         mRug==
X-Gm-Message-State: AOJu0YxlMOVUM9iSNOFPHuGV9ktSTxnXD9nG6CE1YngVrwWlzFOB+3rr
	JCE0MtrZCl6bSuBukYVKjbIvAolaOzj+pK0haPYB93f5RWKmwU6qUDmoK0cyoPA=
X-Google-Smtp-Source: AGHT+IFcmeQiuUo4eYmQs8GBtVAruWPttXXbgsv4+msDs3zvTSjrD3ETiEcpx4MmCotUTolyCbWZiA==
X-Received: by 2002:a2e:97d0:0:b0:2eb:ea64:1934 with SMTP id 38308e7fff4ca-2ec0e60d0e8mr70677581fa.49.1718708796685;
        Tue, 18 Jun 2024 04:06:36 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec2d25ad22sm6255991fa.86.2024.06.18.04.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 04:06:36 -0700 (PDT)
Message-ID: <4a1e8cc5-5d82-435d-8a2a-5fab56f85965@linaro.org>
Date: Tue, 18 Jun 2024 13:06:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Enable tsens and thermal
 zone nodes
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rajendra Nayak <quic_rjendra@quicinc.com>
References: <20240614-x1e80100-dts-thermal-v2-1-4d4f9effacc6@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240614-x1e80100-dts-thermal-v2-1-4d4f9effacc6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/14/24 12:50, Abel Vesa wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Add tsens and thermal zones nodes for x1e80100 SoC.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

[...]

> +		tsens0: thermal-sensor@c271000 {
> +			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c271000 0 0x1000>,
> +			      <0 0x0c222000 0 0x1000>;
> +
> +			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;

These are normally wired up through PDC so that the system can shut down
even if CPUSS is off

[...]

> +		cpu0-0-top-thermal {
> +			thermal-sensors = <&tsens0 1>;

Here you have passive trip points with no passive polling, this will
only report threshold crossing events (so e.g. cpufreq throttling will
be broken)

> +
> +			trips {
> +				trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				trip-point1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu-critical {
> +					temperature = <110000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +

[...]


> +
> +		nsp1-thermal {
> +			polling-delay-passive = <10>;

Here you have passive polling, but no passive trip point

> +
> +			thermal-sensors = <&tsens3 2>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};
> +
> +				nsp1-critical {
> +					temperature = <125000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};


The rest looks okayish

Konrad

