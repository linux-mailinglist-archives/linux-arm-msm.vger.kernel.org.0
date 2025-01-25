Return-Path: <linux-arm-msm+bounces-46134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C20CA1C457
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 17:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94E80166C5D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 16:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0C235973;
	Sat, 25 Jan 2025 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COhqfYvT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2488018E2A;
	Sat, 25 Jan 2025 16:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737822740; cv=none; b=MhmGFSOwow757W/YJXR1+yTHzU7wNHWZcF2Us0pWFogRFm11vskbT6b5SjLhDwVjJSAsmZFzhQw3zDOV0DJky5qSiXc6LNIhRo85Eq03BQ0jnoSbkBg3NU273L3SJ0R1V8yg7yNwT98gMBtw8am8CwXSrNcEo3qdRC/PIobJxTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737822740; c=relaxed/simple;
	bh=agl+h4mfWoesS+L4jbjlZohaO7qzQP48q9807FlKlWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R62MGcHZ88pN+2YBqyL5oomEmElB0y2sC6931fr3abDq0o+azRpeN59/x+yKv8IuLEoGKHfoyUpvwsBpHgyLmp/DR1y3lt5Tc3LkhiNZBWWUPBx2NUH1/QXcklbyu7NuimAw5hRtLgErDPwk/dEK0pcQtWcydRZPgviJxNmDzw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COhqfYvT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so533359266b.3;
        Sat, 25 Jan 2025 08:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737822737; x=1738427537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ugy2QSb0uIyKELP1ousTbxuIfCCnVKUEMqsw6Hi8uGA=;
        b=COhqfYvT8Rj2YB4yuRXWgyj0uYmgrZ3BsLsueDguZNGUZQeXkbNvHlKqY64R8w8akf
         7O6e+ySIV7s+Xk9WVLokRwR1utrZ8iScatWIcVQzEMSw/xS9itKw+pVKq9Y0ED8mY13y
         zlokpZS5YXuOlIxia2X61NBi3DFJan6NfLpQt2BX96cbo1MdMn/OO/BWSxm2ObqYo3BK
         4owhIyh5YE+riJnt/7n3+Bay/SBqRzybc5jRm8R0K9gPEsZC+QZjMao5hpIPqj8Pl+eE
         A576Sg4oy8vd7+SDmiGPXcKWxRFXBcVoH1qTwk3WvzQWTgEMVQsjW6/LPibGm2QrSIhz
         FZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737822737; x=1738427537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ugy2QSb0uIyKELP1ousTbxuIfCCnVKUEMqsw6Hi8uGA=;
        b=CL9Hc4vlra7Zm7yWO+xC5oIdbQzlwp8rSeOWBCk8oPFA1ZQTu/JMMLrE3gEPebdn61
         SouOAh6IUZ1hB/IEn4O9fFWEoUMR0Yyvjlu1ePTY93PkrMCC22JNnIYj3Wz0TYoDiJyM
         82HDSxMzIN51wQ5UPhF7OQTmKU/LU/kal4n88xfRdP9scr+npo2k3mNX2f5FiQsi/Bl/
         YOe47kr2xAtM1oxuEc0bLvy2m9UrC6x+o9rmc7uS9TNKke0emLbyFwtYjDFiRu5hRunw
         gpkBrWaVe7T8iQCWqW/C2NJi+Ur1A26du/uWuq6J3fw9M+w+kEjjPsvREJ1hJMdLzAXJ
         ROiw==
X-Forwarded-Encrypted: i=1; AJvYcCVomFmN6FJykB7Zq7BKPluPkjelucTLm0HjjSjmQgwArERTi62iHKWIO0ROAQRenvf4XOm/tLQa2CJkDSVu@vger.kernel.org, AJvYcCXOPZtCiviwqtuaJCK+vC98C6Ez4z3Z59xhBgNA9Dlap5IfanplCagBZ7zoSk6b/hkLgGEUWCd3@vger.kernel.org, AJvYcCXP0qo1WDZ8DwWjyVw8vn35z4Ub5k8Gq9Jsx8DlYekA63ZOMWBUx/lMDttbT5XDp5ODO+tW015HYj0OErux@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ETQvZVo1ngZSS+eD24FAsVLG2hgByD7sZVrHTodSN1NsluMB
	6CVGynoulXhKWcGDTQEtesbEmMexHw90aFyMOFPhxy4QTYYZlIm+
X-Gm-Gg: ASbGncuzIdon8wVVw2gIHCqoP2D6QuXnZkA8QH8QNVwImmf+/jI0PkDs7IR2e7ytmgO
	PQdwx9GyIjgBoWvdohs+o2ZmC5gqTGNAdPm2z4hptb3irHKALZ7VBnvrCCJqeDLcbBOwwaoZLXe
	B/cO+FvFFLjflGAIRETKs4hK3oUnH6KTMFV0SMcdzg/iY45IfIN/j3Ie4VQqqcYXJ5Lhae3vGUE
	ETRp2y4Y8NLwCoDRnye8LXqhBtC9Hf6u0HMMEY8XFhOU0luZ0mDhjEjHDgtKpbCafPzgnKpRcPC
	ugVlya85lJOuocCDlXeVNUgB03AymaNfoqP9FfsL4qqwmOVBnQxwMT4ykw==
X-Google-Smtp-Source: AGHT+IEBCc+S+yKbpQ1xLe36qobhxtaaWs5E8H3claBAHtwwCMI0d8ZKQPtEi/imxO0V5ykzK8ZACQ==
X-Received: by 2002:a17:907:d1b:b0:aa6:6fa5:65b3 with SMTP id a640c23a62f3a-ab38b3c495bmr3111650766b.47.1737822737091;
        Sat, 25 Jan 2025 08:32:17 -0800 (PST)
Received: from ?IPV6:2a02:8071:b783:140:927c:82ba:d32d:99c1? ([2a02:8071:b783:140:927c:82ba:d32d:99c1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e8a72csm308683566b.79.2025.01.25.08.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 08:32:16 -0800 (PST)
Message-ID: <f838ff5d-a80c-413b-b32b-766ec4667892@gmail.com>
Date: Sat, 25 Jan 2025 17:32:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: uefisecapp: fix efivars registration race
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250120151000.13870-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20250120151000.13870-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/20/25 4:10 PM, Johan Hovold wrote:
> Since the conversion to using the TZ allocator, the efivars service is
> registered before the memory pool has been allocated, something which
> can lead to a NULL-pointer dereference in case of a racing EFI variable
> access.
> 
> Make sure that all resources have been set up before registering the
> efivars.
> 
> Fixes: 6612103ec35a ("firmware: qcom: qseecom: convert to using the TZ allocator")
> Cc: stable@vger.kernel.org	# 6.11
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Looks good to me.

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

