Return-Path: <linux-arm-msm+bounces-77470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2ADBE0912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 21:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BBC1F5090C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 19:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668B23081B7;
	Wed, 15 Oct 2025 19:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WVanscR2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06E02FE57F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 19:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760558286; cv=none; b=RgVFkrBf2qzURM0r11OS6GyjfRcNBurA1veKCmsbgMIqZg5QUvv4JVOhlS6XeFc2wizvvBNg9VOJQ+eCQIDSzFKqhmqxPXozf7bkpWGGsDo8dqsoPv7UreJGsOms1+4IE8H5hUPsp/8YKZI0kAUxaoFlg4wFqeHqVR71SRh9cwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760558286; c=relaxed/simple;
	bh=iBbCAcZjhrqIgbhQqYVKivZiMNzfmlkCukX9J1hV+qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMZaa7d458tu7JxFqyLiHa3gRelmK1weoklAdjIQ9Pz8dUj6Kl+W4kN/++tlkEVbokw+f5C0FSLWAIWijTpumflRHNip9lx69u9mbs5GSfdBuKTnR1AD7fEauMCErRGjQbJSN6YRtVlyBaCYA9yLq4Oc/87plVCtS5xmt8LNgqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WVanscR2; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63963066fb0so14562451a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 12:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760558282; x=1761163082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X93ngL5NMyRYdgDq3leVhpEnsjXz8ZNeGovlsQr2X3w=;
        b=WVanscR2qQIOyHYPu7MjcziLqHLtqHtVZkRAkqdOtQmZVZMOzFTBQtRjabYSIwUjJc
         M1QkoE2Vc1K/OaPWiToZiLgGnruyaQbw3TFm/7p665StFQRkWWB2tdHalF8zgSReN03l
         a68FgWhr2sIDEthfjdoab8f8qcI+E40i7Q0iInLeJVd51sYVaScrcVhvekL7kxu3yU0W
         uIdwXN2Irw+QvgYLjFYqKfiYdjdNCFq9kvQgWiMGC2rqU23L6jDVYLG4hQ59OBtatbHY
         /02bJPFe1wmMls8B56Xd01Y80NJPtGOLPc88jihshRvK6PmQ+7nzcDh+ugRq6qPBSAvv
         8Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760558282; x=1761163082;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X93ngL5NMyRYdgDq3leVhpEnsjXz8ZNeGovlsQr2X3w=;
        b=Najxm5o4aU7C0N2bFrOIVRVJINQ+9q80FwanaoaMv7x/OY0/hUZ2jfMthW6H5H9V2u
         3A8zhh1U1YlqOtLCOqw8O4QCHEvoRmoLuvzU8JnojqPEv+0m9YHnDub92yTnaycWbI2q
         Dg8FsFVT41aDSEM5L9a58ka5W0kb1gas4tHKY2zVlG8VTLlvm/aZ/tTK2ZZKiaNQHinr
         lFNfmGVZbqA83MG80Pl/7zSAyK6V1FYecZco+ju4Oe8+yN5CdWy+N8K+t15tTpkhXb0z
         Z8SrxGKww6osDacH0DNI8JGaG4fVfZrowTOwJPgAtNFCWUg+R6Cw+zo9x/cNJmVJgcE2
         8/Eg==
X-Forwarded-Encrypted: i=1; AJvYcCW/RXxqwHoBVTwZQsTWMOlhux86bNdTvMZ56liR24j04tnE73MZ5D7qM6Co0tD9WiDRHjXDA/7leWhNyDNa@vger.kernel.org
X-Gm-Message-State: AOJu0YzSkS5+7A7JiOROtu4cq0+zjqlyYT9wc4ZupghGM/MDstVW7C/Y
	3PqZ+JrD5uw6LKBfrnEoK6KhQ89boAAhBlXClmWBUSRkDvSlTCbHHdHUG8YUgH5x+oA=
X-Gm-Gg: ASbGncu21MFdDEybs4uDhEAk76qNHYgtn1iaXSc0m4kPyLm/mxBJP6YqD++ozNoGIxa
	ZhfYuYFCIIsNqDpKiqwW9DNCZIj9kiPcpxLfnwivGDl65S1Hn9WrHn+g1e35JKS4HOOMssIVIRQ
	tBRuJWnaCuHno/tg0bEmdX+OjqTMr2Pm7YP6lRJa7o1HbzoEBDjJd1Ob0++0dIo785nZAYRqDyF
	/t93t1EhWCWmnsqH17q9+0caGJtMSZibHBfQFuYxVFhEaxvDZHqVZlclRDO0lYvUEqGXqDhhrmg
	lyGj5nVUg6XZrH/0z0cOGiLrGN8dbTjC0MN49PDzPhrvRky2uLX3q/sMBPy/oZwwq/UvRzMse3l
	dRcJPRFWA61XUH0NthXlVBN6OHGYMoHHDscffU3Di7870wzVwEnZn5JjUh9dKZ7FAhPUlUIzTSi
	00T6vCzV8LzOqaQYUM1sqDtg==
X-Google-Smtp-Source: AGHT+IHf2Th1L2XYSlYRjMvRiaQwEPPv0rm4KoRAruPpObpOgoCaczpFuMinqPxSmwcgVKfFpOWD/w==
X-Received: by 2002:a05:6402:23c9:b0:634:c03f:c605 with SMTP id 4fb4d7f45d1cf-639d5c75dbfmr27308818a12.36.1760558282021;
        Wed, 15 Oct 2025 12:58:02 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b71443sm13887338a12.26.2025.10.15.12.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:58:01 -0700 (PDT)
Message-ID: <ca8189d0-a518-4716-8b28-e36571cbba5a@linaro.org>
Date: Wed, 15 Oct 2025 20:58:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add support for camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-3-quic_vikramsa@quicinc.com>
 <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/10/2025 19:49, Vladimir Zapolskiy wrote:
>> +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +            power-domain-names = "top";
> 
> 'power-domain-names' property is redundant, since there is just one 
> power domain.

Its a required property of the yaml.

---
bod

