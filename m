Return-Path: <linux-arm-msm+bounces-75485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E50BBA8712
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 10:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 176BD3B5296
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 08:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC05F26529A;
	Mon, 29 Sep 2025 08:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CmkQYJ9U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A5823D7E3
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759135584; cv=none; b=oas10FOdntbz4s7zE+UiDB6KPC1G8v/clcWGXHXMMRSwtbbDN4oGluts5wRCzQJsJikutRRUXKncsbzCd0ExNaV5D8C05bG9JBBewjhyR4aeEnO6j3Gde/CWYFr2pMo874dfHzYK0R1WtQZxoZGy5NdSuuyEaequiAEVSsdcb3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759135584; c=relaxed/simple;
	bh=elHCX2J+mUL+jknpKGeN90bcu2WaP/CHNiOnbcSUmQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKFc5wU2JcP1BD1tInbUQufL5KgH17GOSQ9IwySk0qaTBQ5+4VMgmDl1Rqh4lrQSSkts80H1fZgJPDMGQWQpV9GQTKygMirLhgpDN0FMUmidAtFVueT8Dd7f5h2eNAYGIA3OXBlaMuRo6JisvdY7g3pI2XZuXtTJtNu6MxHmm0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CmkQYJ9U; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57e3cad25e8so876805e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 01:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759135580; x=1759740380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kxq9PcJJJz0spR6MwcPMvKvnViO9P8tXOB0T4VWVPBQ=;
        b=CmkQYJ9U+GliEz7nRk6vJ/DwAIKRba08MCUMyI5GDxnWaS1mUyUUhRi0VCbXQmk0Cf
         YZKPcnTOb/sNct1CqPhjAGVYakSSDo0Gyp5TdH1wafm/F/D5H/VvIJALB1YqH251ho4+
         duwqQEZwUirV4fpYY0KOwTDqG3JnJHkxvrcVC3FUoxBFJoxEEX3jKj2g2aKUGUwRMZAI
         VxoBMD7Rb6C8XjyzBK+MvQnC4QkG1NGvSgNCGGwBrVin5XgR2hZxUHr1Kac0t7TgupDM
         JRanGLiULD7C5b8YXYoSlIfZyKn2czhrep1aDq+LA3huJlttvrCmRYW8SwLeaen7n9NJ
         W1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759135580; x=1759740380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kxq9PcJJJz0spR6MwcPMvKvnViO9P8tXOB0T4VWVPBQ=;
        b=pL4VsLy/WwFmQg1qB+3kFfN4NF7VmLxW4FyN0nRtHsFIHlvHD6gVio+/bTRcCWBEIN
         om2uWMS1JaXin/VvL1btD7eOIFFuH8UNRN2BcIrK54Sq550ExqlcrErhq3KssZcIcond
         mlEYapfFBvVjJdiOm5xQYdpHOGDw//0d8wUBh9CY7tq0YSwOEy+zJCzyd8AemvugH1DW
         RlfG69zlFA+XJydAbaOe2AVg5gZxvjlLcpDfDdniwBS/XKxFHS9bODdbkhDwBj7Hqr5A
         HtLwouKcOWh+Sr0pYSEJp1bmQxl8r0GE/XyBhpjU7i3hoPYLCOSEoJqZYcvaqrqLBcrQ
         ux5A==
X-Gm-Message-State: AOJu0YzPHkK0o1/QY+2A16AaE1nBXdqLS4zf+thtRNMSH4v0upP+pGsl
	jkOyIJThknb8snweFBjFBX5Hgd95trfBAOmybhNQcNJphCtRnUNqdLQmsp2kM3LbZ2U=
X-Gm-Gg: ASbGncsIcbst1fI1tkW+17Ir5U3oG1ekO1b7SEkHrvqwdbgCe8nP0Yf0uYeczIY0JPm
	HfCu2NqE4Q9iD/BKqTsTfQ5uqcfyNU68sF3gG7XBwiwJevbVOIk0fo1GQJYNLjNparnVByRj7RS
	CL21+s4wSRlCSMX8YNCLu0Zryu6JZ4IuoiP5UALgLJz1FM4ftFD0wqOQCca22CuJJoJr+d1pKbu
	EJmArvXrzHBFBdO2sLG7/b8pZOKEMcMam3m/0DAUm9XsQ1jqonZ18cEJitA+p+5ZmG6JxuKeUbG
	CgPx/pMFLkmq1Px3+EraMqqepDo5pXwuV4ln2NerfKirgc0KHoVJMnd0eTiPXxVUwFcA6bjCdic
	XMly85v9cQEHdkubwG/d8w6igmtSS/2P3jpiD3CVs4LR4D0orbDC8fY/9t6OFFJKeib5Mle14GT
	Vpyw==
X-Google-Smtp-Source: AGHT+IFIjTl+y8eSPvSavTSLzI1Q8jLm3uTQFD+1kwjOwgznMH7R9DOWq1dsckUO7nJaFttB2+hYNw==
X-Received: by 2002:a2e:bc0c:0:b0:36b:93b0:2a8a with SMTP id 38308e7fff4ca-36f7ec73bb1mr25499411fa.5.1759135579722;
        Mon, 29 Sep 2025 01:46:19 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb770fdb2sm26762571fa.43.2025.09.29.01.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 01:46:19 -0700 (PDT)
Message-ID: <0bfc50c3-2df7-4e7c-a6b7-99b8e56a65ea@linaro.org>
Date: Mon, 29 Sep 2025 11:46:18 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: i2c: ov9282: Fix reset-gpio logical state
Content-Language: ru-RU
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org, dave.stevenson@raspberrypi.com,
 sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
 robh@kernel.org
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <20250926073421.17408-2-loic.poulain@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250926073421.17408-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/25 10:34, Loic Poulain wrote:
> Ensure reset state is low in the power-on state and high in the
> power-off state (assert reset). Note that the polarity is abstracted
> by the GPIO subsystem, so the logic level reflects the intended reset
> behavior.
> 
> This breaks backward compatibility for any downstream dts using the
> wrong polarity.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

I kindly ask you to specify the intended behaviour in the documentation
Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml

-- 
Best wishes,
Vladimir

