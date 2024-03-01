Return-Path: <linux-arm-msm+bounces-13093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D38586E5BA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 17:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 142B11F26F9E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 16:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBB516FF35;
	Fri,  1 Mar 2024 16:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLfuyKAU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0951366
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Mar 2024 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709311037; cv=none; b=MuTgKIqTLZsbapiT6CJEd4Zf7oCLIT1+Lz4jYqfVbCCZnBA7PbkyQDrC7C2p4EG8XeQOlhm+0tLeDVPYIrn3PzmOZvj9GTEtDFwUpDhhHG52QL2xpo2Jz5WXko20OdRR8ZB+KbVjEBNvO0kN8iVa9WrFCxFhZs1qWT8zx9fwviE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709311037; c=relaxed/simple;
	bh=W8ekqyFDNdERMviLQlmLPvASDFIuRXeZIKAz6X0wpqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpCGDlITlYP7pKWc3PfCbioBjsXB+Dgm6G2Z1WDoTeY8CXMhYqZK4FGZ+kCh30zdkOsj7CiuOmNUjhYDyKMs/jYUVHbMobfXBSwldgWvg3PVndoqtzz4bRaUDk9gsJzpP71ekMXhR8L8B1u8F6c9O+GHRnhI3g8KFJyx6vQQUuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eLfuyKAU; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c19b79535aso1399072b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Mar 2024 08:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709311035; x=1709915835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0S1pjMIEbQhahvKt9V4WgWqNibwCApPjl+YvM8irZw=;
        b=eLfuyKAUbffS/v/1thMq1zcsFshSGOAusKjCOTeSBvM+LNqqRpeC12IF7Z3bpJ5lge
         7I4OMes0RnWOBSRuVMJYfGn+5vFd5SVpnF25hXTEOk2jc+UOLZYBgUnDFTk3GxTGuTvO
         yuipT3DZVvOKftLZe0myhbCwyVPzXAj8hcB16QYTPpNkSgT59xRwBGDvs+tq6zIpBfLR
         LCvlqNnMoSyaIDOIE6HA8/XTkPvLw07NVCjyotq2D8gQKo9x5i9oqijSWg7Uw0GJXvzp
         lbjU2JBjClRe5U1815i+Jk+xEF3DZo4VHrD7J5po1kF3ENLhbMn8JYJ9SE1BMQolhmNp
         6cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709311035; x=1709915835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F0S1pjMIEbQhahvKt9V4WgWqNibwCApPjl+YvM8irZw=;
        b=WstxKCNELshcwUg76idQgd7y2RA3yrUPyTJLimZk997np2ULZeATrNNWmgMr8RzxKD
         yzzTVcxr4bV/nl6/MqG48CIu/GI/P8E7G30TUx8t89waFagmKe8TtL7g9fiiUvPYOre2
         pQnVbPn7+/0GWjyqQkljT6ROrhAtI1J9DF7T6xFUVY9nww6AqwM1NTjrKvIbwj00XY0s
         cBP4fmaNoR2X69agvUUGllEQ5Bqr72Mw2EqURsCN6hbaSPIo6TzeAwWs8U3uXHFT/iKS
         5/Va1g6dVSiqgoGA6yBQhTkMDK8YjBJ/R8aL6Gh/0YMRPqbjziPAhdzh+6y+YtLAfBnY
         a7sg==
X-Forwarded-Encrypted: i=1; AJvYcCXn04y75sWV/7OPICikv+aNxvpGCFnuhCNgG42cz2ipXbB82m00OgZny8+GzCq+EAVAOT49utKZ3fJbu4Gers6nBFiEfS2q9Gq1hxdYWA==
X-Gm-Message-State: AOJu0YwfLV5da5Vhiy0YobvKMCk1cHaTGtOkh+XIy/xD/R0VOy3jCNl5
	41pcK/u1XMGPFBzHt9Ec9SDxObUfaWtW6AH/KKiBcpP8ZBzKLpnlxIms4TjXfCk=
X-Google-Smtp-Source: AGHT+IFj0GoRPprx2GuYPkyopZPppe0fMe+bFr3Nqv8uhWiYNQXQ99+Hhzb/IA0zdNSDj3aIomVZgA==
X-Received: by 2002:a05:6808:13d3:b0:3c1:7c55:373f with SMTP id d19-20020a05680813d300b003c17c55373fmr2061160oiw.6.1709311035461;
        Fri, 01 Mar 2024 08:37:15 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id bq16-20020a05622a1c1000b0042e8f150417sm1857674qtb.45.2024.03.01.08.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 08:37:15 -0800 (PST)
Message-ID: <30604225-dec5-4ba7-9e7d-4c845c8ee9d6@linaro.org>
Date: Fri, 1 Mar 2024 10:37:13 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/7] net: ipa: change ipa_interrupt_config()
 prototype
Content-Language: en-US
To: Simon Horman <horms@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mka@chromium.org, andersson@kernel.org,
 quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
 quic_jponduru@quicinc.com, quic_subashab@quicinc.com, elder@kernel.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240229205554.86762-1-elder@linaro.org>
 <20240229205554.86762-2-elder@linaro.org>
 <20240301162628.GF403078@kernel.org>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <20240301162628.GF403078@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/1/24 10:26 AM, Simon Horman wrote:
> There are two cases where this function still returns a pointer.

Yeah I saw that.  I'm in the middle of testing v2 right now.

I'm very sorry about that.  My process includes testing
every patch but somehow I missed these errors on patches 1
and 2 this time.  (The netdev CI doesn't report all the
problems with patch 2; I'm not sure why.)

Anyway, a new version is coming.  Thanks for the note.

					-Alex

