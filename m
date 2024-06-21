Return-Path: <linux-arm-msm+bounces-23606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A229128E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 17:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22E2828B71F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 15:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D3D482FA;
	Fri, 21 Jun 2024 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OTMVMmOc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7D36F31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 15:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982331; cv=none; b=XApBTCkh8jiQyWBn9lhtDaDGPXanrZ4Rz3WtBkzdDHPtEqHn29htK5xYJe73xlqH2dQl9t+MXZzZKJdM68KbYUThucpcksUZVZ3dSSLfk1i5doUPs03ecg8fc9y5/AVj0tiOMPvMvTqjFSmxGJvykQeiHAk+6VXRrYtBkUNSpig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982331; c=relaxed/simple;
	bh=bOj5UPR7uGvTDSm6/Hm6MKK5DkaF+lLU+lIDaS+NiC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzlcUazRdoAh7BpSxLZDGKZGJWQUDGjM1JvHCh3UFxUB7Q1aabpoM0fkdNuKMd345oj1nEfc1grbKODUPHBbdrDBRDPj+DB/TV5uJpmozI9ronYftXmIS3fXbqSRBOKHk9F+dKyIwi84KeLo5N79w4R3F826nhmyUWPsPNs75bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OTMVMmOc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso23759975e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 08:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982328; x=1719587128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1TYwLT66lKYhmjjBA7z8foIE3VtS5NpDYz2xtS89X0=;
        b=OTMVMmOcyuEeocbc8harq73664lDEbi+41F6KUd764rJRc7rB3JHIpfXI+aMRmytT+
         OgfZD8TqS6d0LJ5t8wi0ZcOEYA3dBaSmOwuRRMxqy7J+lwNJQ1TylLDBN/r0Ldg1s2nU
         WYYYQ6JgGSgSPL4OIYMobHwAuDKJJAHI3iT7mJPpLsKbScsgL3289ZnJZCLH8hAtQDYI
         1svmqvoB7+OkDzOwrDN1mgCWKXrTyOapbSBw47Xj8iZpuiCevJt8W/q8/X9Id/j6TYZY
         L/iRsIPjvO6nCBavc3CCALok4GI2q9MTUh/T64o4AnAfwOk0cJYCTcdP0xLQua3ruD72
         SsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982328; x=1719587128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1TYwLT66lKYhmjjBA7z8foIE3VtS5NpDYz2xtS89X0=;
        b=bygq2JRhcyPKwoGje7EPoiaISZI3Oj/OP57TiGQET/cFyPgQHGn3W8OvqtMEcsKD+f
         rCWp3WRCRXm0bObd3iDZ2mdsyuOTduUhk3kY4tJaDS3YWVIJNLsUmewPphF61WyOK4St
         ILlRKnm++WkGmmA/KcpNY9bQEEu42PpFG4pHqurLNw7tU/RIvHyzckcFAHpoccy66/YO
         d0haUVbrpwfIQ5LRHVkWVtWnWqY8wWuQO5pqwogR9nP5N+Vj/eh6sZjj8c5qHrYx7kXY
         3/AZOfCVXObr6iZ9NB02BiiGnJRqO9FDgwFEAFNUjxEFxXtGl6migB6xuMuexZT1WU+2
         2N6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4NCgXXqYtDIk9wrGAKlGekfSOuR/Sw3+Gq9WkTCQ/BA5gli90C5a29z26+qIFxj3fzmPG8voKptdCJtgfjItbv1yhYaVPWzKEcXUx+w==
X-Gm-Message-State: AOJu0YwFS7lxZaBEuHH80Ql1g1osDktA9ZADVPgTzLytwZFkF6TNDjz8
	kJKVMWkqq8/gAxCQ3NLdpJs5+F0tjATHbttksLkTwoZMwWgvtJrrPDBSfqL7mRo=
X-Google-Smtp-Source: AGHT+IHfKTUiCaM7HKKv7iAXRlbY3zu76w3GE8NRButuhgfAq0oxqmhJDKjpLPzj9LYuhqapyu5QRg==
X-Received: by 2002:a05:600c:4853:b0:421:7bb1:eb9b with SMTP id 5b1f17b1804b1-42475296a7amr78559795e9.28.1718982328689;
        Fri, 21 Jun 2024 08:05:28 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481910fc9sm30774605e9.33.2024.06.21.08.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:05:28 -0700 (PDT)
Message-ID: <0b1223fd-220d-44e9-b010-bb535d481dd0@linaro.org>
Date: Fri, 21 Jun 2024 16:05:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] media: qcom: camss: Move format related functions
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
 <20240522154659.510-6-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240522154659.510-6-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2024 16:46, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Move out the format related helper functions from vfe and video in a
> separate file. The goal here is to create a format API.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


