Return-Path: <linux-arm-msm+bounces-48984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B621A3FF8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 20:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FA067A6F96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 19:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F228A252907;
	Fri, 21 Feb 2025 19:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jhlp4fF7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653315223
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740165395; cv=none; b=cIOQWrk95gkxsaCtiscMTua5vIWW7ZF6jMYdvQVOczJ+6ZZncZDhK2B4nXnhx7VQRI8JzVUShN6TUG91dFC57EimKygBZjABO5v3u2Am1HYdQAfiPUJf2ADTcCvHwdXCRlPVSr1XXP5QwDT7FFwMWf2oU9u2u59jQbamY3HNnCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740165395; c=relaxed/simple;
	bh=5fvG/DVaGj5l8z8BF8vLq3u/qF14rEVt1HH0vUnX6qw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=B3PcoBHyTtuAJIrAcG4cIBijqg7KIvC7dYAezuDceMTsIwYUv+OyD31xWf5Z0igL9j69vhMmIepvRe8CW3XttMDclggR0Yr/YfRWnUP6Zmoz+0ZPSBx7WeQ83LYVO1++QdNcBEQwx2McQ1GateMqFgL7jvOSLooMka5Ema5UEfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jhlp4fF7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43948021a45so21780385e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 11:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740165392; x=1740770192; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVZmPLX9SKE4OV/m5m7MNKgR1nn72J93NrOuCk0UxAI=;
        b=jhlp4fF79+aaHu5NjiIxAjtLP2Arb58VoghKjVLT1o4339vf//wkkIEljuU9SihVuj
         q9xODfuPoHFB6INogOBb5XbRhclmOtk86+Ly31KcxBkrL3kUirZgKSbvrqCpJe5Ygj7D
         f18KmG/KYZxkumNjvAWS7sjF5W78j6y75IXZKG46wR7swOoeYfxxUOzCyfSt2VWJ/swJ
         RNu22fdKpcXD7q7Ze3RgP3rJrJqx1w3FUuRsHbjhPIBuTijKJr5N5JXmTbQK9s3KvBVC
         E72scLqVnKBqmfUTL1K+K8GDK6TSz6UVPG/mjeHPtHin02H9nrnDet7AHC1HEdeQAjtt
         GJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165392; x=1740770192;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVZmPLX9SKE4OV/m5m7MNKgR1nn72J93NrOuCk0UxAI=;
        b=avRM9jxuMIAQfpxk14ZShKbr24NrPEEnTukcZ0IISFyq70IpTxAQjXBfgZbHzXa59S
         TrHhKfxEQ5VMjalVCqQ6bMD5UY7M3KB3YSC9+KOBUqdqHTUtuf8icMAjN2zn6NWt/h2m
         oU51WUGMj54gbI34PwLKzRgUFDu53CRkBP4OTZJLTzK2qt5RHQNl/600h5BGzlAJQGVb
         UyB9sG8zDSYrb/dTpiwTfon1UfxOgVh7nq0PjWcS6ch4mC3d4atfTKgAqxq4zIPgl1do
         0PJmNkuggPD0eA0hFu2y7B2J4lSmKgYWnelzsU/mXcaDibq+fFHBNJjAKGijJkhE1Thz
         IyFA==
X-Forwarded-Encrypted: i=1; AJvYcCURPeoLSQSce1+iyD1LhiYsIwAeaQR3L2xMiVv/koeI7UXUOOlKTEsxZu0WmO75k/1Op2YSbUJUN3yf1nsi@vger.kernel.org
X-Gm-Message-State: AOJu0YzjbwkjFR3GGDCiRCnkWhGMEw8xKwFh6H7va1q02utKid5v/tuo
	MUy62vROW23r8KLPo3X/9RmkFLDWhqtVuyeMl1SCS0c/3QTJ4Ml65bxmNWjGdAo=
X-Gm-Gg: ASbGncsQ9EF8KuudlNdk+QZSDtlI7rSSreijv2k3rjSOXCDa9brro9wOsZiHsko153a
	E17SUhZjcMjjshRXAnM+GEXZh578WX2pLQeNrz4PPljP711NQtrmu7qpZO8anLaEWJGIG2++eOJ
	+D6Xgz2Mr7THj4oYqTt95Ug2IWxjs/asT3DfWfbb+lEeE2+9XR6hxAW1Nl9TJofJ3xbzlp+gs3A
	7Z+9KFTtgIqf0Cwz20D6sJD8kYhtUwbztC776HKp68VQkEZVP7HAlgeV6DalWPFO9CoBkauXrmG
	jhvkH5JoIEmBa58kfPaDgRZlFZ4Y
X-Google-Smtp-Source: AGHT+IEZIpW2AjGEyy2pSB737lSPq5c0PLgcm0gC9yalYRLXf6Zt62YGC6R9bY4VkJI99cTLRTXYvw==
X-Received: by 2002:a05:600c:4ed1:b0:439:8ada:e3b0 with SMTP id 5b1f17b1804b1-439ae21636emr38684615e9.19.1740165391631;
        Fri, 21 Feb 2025 11:16:31 -0800 (PST)
Received: from localhost ([2.124.154.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02e425esm25934415e9.17.2025.02.21.11.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 11:16:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Feb 2025 19:16:29 +0000
Message-Id: <D7YD5C0HCSZ1.2DOE3TAA7024Y@linaro.org>
Cc: <quic_mohamull@quicinc.com>, <quic_hbandi@quicinc.com>,
 <quic_anubhavg@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 1/1] arm64: dts: qcom: qcs6490-rb3gen: add and
 enable BT node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Janaki Ramaiah Thota" <quic_janathot@quicinc.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250221171014.120946-1-quic_janathot@quicinc.com>
 <20250221171014.120946-2-quic_janathot@quicinc.com>
In-Reply-To: <20250221171014.120946-2-quic_janathot@quicinc.com>

On Fri Feb 21, 2025 at 5:10 PM GMT, Janaki Ramaiah Thota wrote:
> Add the PMU node for WCN6750 present on the qcs6490-rb3gen

Is it rb3gen or rb3gen2? Also in the subject.

The file that you patch seems to be "rb3gen2".

> board and assign its power outputs to the Bluetooth module.
>
> In WCN6750 module sw_ctrl and wifi-enable pins are handled
> in the wifi controller firmware. Therefore, it is not required
> to have those pins' entries in the PMU node.
>
> Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 171 ++++++++++++++++++-
>  1 file changed, 170 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/bo=
ot/dts/qcom/qcs6490-rb3gen2.dts
> index 7a36c90ad4ec..de03770e0b90 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts

[..]

Best regards,
Alexey

