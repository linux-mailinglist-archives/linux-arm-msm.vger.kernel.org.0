Return-Path: <linux-arm-msm+bounces-7573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AD0831ED9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 19:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53B9C1C23236
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 18:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158C12D609;
	Thu, 18 Jan 2024 18:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2MabtqU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D732D786
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 18:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705600816; cv=none; b=IXX+H+xpP5ivbBvJ5nO/z9VDgsR8zR6s6Z14KYZwh7BUE4nm85IaAgPJQ6s1Wq/erUI9pN70KkvUL1eAhdqekbv08wi724k8mY949Gozv1p0uHY9XqF+TpOg5yZOADJN21RJeybKIgVAzrenQjfocBYgcj6QR6z17Ge0kKGRNS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705600816; c=relaxed/simple;
	bh=inWCW/gcYthgDfo3ImMH23/upt5Xs0yCpW0uDqinTJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yew1x37VX0g0FzsG7U+ddDEAx1j0S7VrmcyzuMtPj0YNzcs1RQyxyz3uxO2QXgxYLnwTRebk0/l9y7BZcSl4uHDeeU2393WqJKl4FpaRBp8c1/gnDFlVVm6T+XalnazTHtcaJNBMi0mBMJWSt0wqHc0dTgekm07Zhn1WT/X0QnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2MabtqU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so15581954e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 10:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705600812; x=1706205612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iBqwoxlx4gnnWqnFvaKADZ4JLIY+I21s4gGLYsTualc=;
        b=C2MabtqUiyrKXhnnhDaHqjeFkq0PteaiMQqtPCh/Aww4OI7vtiLl9KYf3KmEZRr43b
         QygKIgkg02ZvYJ1IVUdhJZcQZsQc/3cPhh2J50szBG2npVHJMQC9c6PiTKVRXUxMGvgQ
         1sDirf/uMOl0wGRZgFLEMWlyveHJoEbcbKT6ta2DRnG0W/aT7QnJAwb2j3KkNGMqqwT2
         ShRwHqscEEU6QY88MIsjLw/4GixywR1eJKgywqyCFi/V2Tr3ipFCQXx3u50r9+Xw7tgV
         r75xJHymkelcuF8dSYsCHoG9p5r9ANc66cQr/+t3bPSGrgkF1mMV/pKSa4OHyrSi/HGW
         W1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705600812; x=1706205612;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iBqwoxlx4gnnWqnFvaKADZ4JLIY+I21s4gGLYsTualc=;
        b=OvxjkYTlz+Ugbmos6ohXfUdzaHJ23jqqhzJoWkNxirWLu2k17IrMfTbm6qX1//bAl7
         NFPNlJkDMYvELeCaOFMNlA87+MjwQDaSmLaOeUJ7sClQmu01pVcuM2xeinRRwwaDqssu
         OiBLN/G0b5CaljaCem6clxyxAtwUnfZWQrrvaAIGo7VxhASCrv+WIq3STib9Ea+AszDS
         c2IIXsjEKAqC5l4iALwehFgpgOO44yxGj8+ZCFAUXPiLOqklwr9uNU9dp820AS/FH9eM
         257/D1vMVp0FH2iAL3f+kCzh9pOuhYCaAvkUN1L+Rwb9/BXwhRyZvMt9vYZBWkaeBF/k
         21zQ==
X-Gm-Message-State: AOJu0YzS0fCqpyAXZw1aVACPk8jBIeUoZ0HSuA7zKAclDwED05GLEOG6
	VLAS0T7p7lWZbCKPmBsVCQkMD7To447TTvh+AdqN4NS1LvoTt5q8FZibCYs3SP6GF4LRtCgc0a+
	t
X-Google-Smtp-Source: AGHT+IEGPOjGHD9Ar9cWEdm17o6nO+I+JA4OZLTIl8Z2GO2P+L5AcbMBNN/pBByZ4phpxTWIBwA2mQ==
X-Received: by 2002:a05:6512:11c9:b0:50e:6b45:c915 with SMTP id h9-20020a05651211c900b0050e6b45c915mr16575lfr.7.1705600812396;
        Thu, 18 Jan 2024 10:00:12 -0800 (PST)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n6-20020ac242c6000000b0050f0d944b3esm656797lfl.140.2024.01.18.10.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 10:00:11 -0800 (PST)
Message-ID: <e1c6053e-d26d-4eb4-84ba-b16403fd0ad1@linaro.org>
Date: Thu, 18 Jan 2024 19:00:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: add USB QMP PHY support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20240116-sdm660-usb3-support-v1-0-2fbd683aea77@linaro.org>
 <20240116-sdm660-usb3-support-v1-3-2fbd683aea77@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240116-sdm660-usb3-support-v1-3-2fbd683aea77@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/24 02:10, Dmitry Baryshkov wrote:
> Define USB3 QMP PHY presend on the SDM630 / SDM660 platforms. Enable it by
> default in the USB3 host, but (for compatibility), force USB 2.0 mode
> for all defined boards. The boards should opt-in to enable USB 3.0
> support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

wonder if we can make this dynamic, somehow..

Konrad

