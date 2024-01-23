Return-Path: <linux-arm-msm+bounces-8013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D20883978F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 19:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 200731F21F2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 18:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F0D81AD1;
	Tue, 23 Jan 2024 18:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ARVs8Xcl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACF760EE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 18:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706034160; cv=none; b=a4maAPfN91bb4nmXul5yw+iIqiyzLonuN6YAfwvjIdhsMsKbtgnvyWwiMDvjm8rTP6AYqDWc2cQrYlnEp+GooCMTBtW54VvC0fENBlJDrNVhSmrhmJ0O55ExEOQ5xjevxb6MqDcXc3V9nsXNm9VCBbP9HNtbvj5x+F7z2uSL9yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706034160; c=relaxed/simple;
	bh=VeyyMoBVIKlMH0NcHNj60fMKyjSi0lWbBJa8NNMG8Ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u4Q9GfrU/G8i7dcME4q0UUhRoQGnojfolzEAy6mP8uUIAwnQOxRagw3n/I6ifvYP6rL9NVw1aDSOV79Vb4U7Emv6euvSx4sm6Tj4FXOW8ZNIPC+uz6JWgqLkF1bZGklQZnsN+2f/sz+hZ3bS1rfFgmROJLLEveLdo02mfYnMzJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ARVs8Xcl; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4bd4f4c8a21so113138e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 10:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706034158; x=1706638958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Txtw4XL0y1j+c0lxWfVcA1Q/ie+rL6Vj9yfU8yVg4fE=;
        b=ARVs8Xcl30GeN+IjrEX3orHg/Bq0fiMPHU4xBdjcNYFYLuj1jF5aO7UPPaS3yKZ1p7
         2HMlT7Wu6zUwJGF1UJidlUzoQHIW5bc54kOd8QwZ24RD0WMaJUsB8+DQbY4K5Qcpbd3Y
         s1GL0V/vPzQvzAnNZHeC35QBLw5hVXarpUT3xom6k0E2j0bWrLh3wl28fjfin+AlTBWw
         MpSXc/Y1rRmyE3K62PY4Llxj01YvLaLI3bpZBdT+RTXKl4CNs1PVXqR1XKv9KIXVITpF
         nWlJ0yAU2tJ0MeJ4kYnjUiX36/+nXlop/s5+xGLcoNJERmllRQPWoy+zb5mYcYj5441Y
         zWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706034158; x=1706638958;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Txtw4XL0y1j+c0lxWfVcA1Q/ie+rL6Vj9yfU8yVg4fE=;
        b=ClfTWuXwM7TtWAxrLqCvWmBGKcH3eey5KET+T3w3JvBHD/0Astg+2JW1C7hfvXoT8T
         EDPMxuh/PwxCp2jIIy8a7x4fHKLFFS6eMNfkmGr1On4uCR/CcM7IuHAq6c/bK88hc/Uu
         YnnomKln7Za5j6LB60squ2F/GK7Ud4JIz0XVDjwMJo0EgasaKnNTZBDRbzm7i2gKGRZH
         FBTU3xJsjj7loOoAyEqjicEjMfC9BIA8/zoC6zmrX9n2aJm2vasIKUgEuisY/zEjxhLj
         F1sR92wEGLPX3RugdTUY7tyE5NwE08WSpn8XQqo5WWNDRclmWSmhy8KR8DmGAvqXHrTk
         efSQ==
X-Gm-Message-State: AOJu0YxkLR8GhOTfKI7nwKO6N2mm2qBtlr49OFQfKwgWzVr0Ke3SpdpP
	sRhLu0H717hX8EKnEDjq5YCvFL4+ToJnpJad9Pya/vnekmH50hYtbIHw/CALCfU=
X-Google-Smtp-Source: AGHT+IGxg1xctE52EPgHbz/k7cD69YdinPWJapWnvqXRGSxG2NzhyId4NpRhDgcvk6rb3tEMHa57kw==
X-Received: by 2002:a05:6122:1691:b0:4b7:30f4:4066 with SMTP id 17-20020a056122169100b004b730f44066mr3103168vkl.25.1706034158304;
        Tue, 23 Jan 2024 10:22:38 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id 36-20020a9f22a7000000b007ce1febd008sm1658773uan.34.2024.01.23.10.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 10:22:38 -0800 (PST)
Message-ID: <e1313275-ca10-49be-ae68-ce783c3262b1@linaro.org>
Date: Tue, 23 Jan 2024 19:22:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] arm64: dts: qcom: x1e80100: Add ADSP/CDSP
 remoteproc nodes
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240123-x1e80100-dts-missing-nodes-v4-0-072dc2f5c153@linaro.org>
 <20240123-x1e80100-dts-missing-nodes-v4-4-072dc2f5c153@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123-x1e80100-dts-missing-nodes-v4-4-072dc2f5c153@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/24 12:01, Abel Vesa wrote:
> From: Sibi Sankar <quic_sibis@quicinc.com>
> 
> Add ADSP and CDSP remoteproc nodes on X1E80100 platforms.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

[...]

> +		remoteproc_cdsp: remoteproc@32300000 {
> +			compatible = "qcom,x1e80100-cdsp-pas";
> +			reg = <0 0x32300000 0 0x1400000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,

Is there no PDC mapping for this one?

Konrad

