Return-Path: <linux-arm-msm+bounces-52036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D743CA69E47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 03:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53338426CD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 02:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051191E9B1A;
	Thu, 20 Mar 2025 02:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNpjixUT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905301C173C;
	Thu, 20 Mar 2025 02:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742437636; cv=none; b=VA/B9SKjTN/IyOW8h/TdW3AQRf5PnpPvHfuJKOU54vzMj0US+Kqs6HnxPCxgKkmm/cByFog3okfS+LWqqX745Zi9QTnxiAtbolPdEdEVYiar/crt+E+6l0/hpAdKh36fZTXfnisbdmuU+gxwz7hAvoHCDImDdxNRcZ3EO1mTmk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742437636; c=relaxed/simple;
	bh=ftZxa1dID9VQQ8QQr4Gbeq3eUXUjNxycvZxw67LA/KE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1wzk+qoY0gDP+y+qCNyYgoi0ZYi7DondKgcfdYQDFHZ4ZMEjCB810/zZ7zesmFtw81q0rcQ9/0ueXTQIUu+SOYwSzTrc7w+A3xrp5y8+6BShv8OfRh1nJ/x1Hokrqd5ov6ggXb9sgy3S87FNtdHL1EX/Rqs0EKL9DZOcOOTsDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNpjixUT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224019ad9edso4660385ad.1;
        Wed, 19 Mar 2025 19:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742437635; x=1743042435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=obtvXdREprS1x+XbI74b3jA/I/XY9gDFGfe4Js0/jWw=;
        b=nNpjixUTVTSpQEvzS3efIVsjWai38yBFzS6LHZ5vYi9Mq+H3KElYwoOX4SD8jEOxt9
         aiqfmaEVYgN+lLWbVV2szJXgXkjgCiVSdMQcC9egN8nufB273Ttq+BQcNF+pc3xXyd6l
         bingQ77HKjamWgM1dT8n0rL2R76UlTNDL6yJsoc/P0Q8kQm4lOayrA4MEiUHci7YHWSY
         cJEdkvy2UEcXDlYeHlfxVoNkFnaCbMams6mwOlCt1n0LFrjv+CGjFLxdnMbyw6hRcXkV
         inenoJX8I+C9ifgadnJtBB4ZnbFcVNLZcGlX0NJZBoKVrjn1OsX4mkC+6NYfQ4X96jiL
         OEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742437635; x=1743042435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=obtvXdREprS1x+XbI74b3jA/I/XY9gDFGfe4Js0/jWw=;
        b=U7WkRupP9bcvokgUkLRzn4rWy0dAz5gACC5V878ZwOyOY6dY/b0XR6LdmAZkTAIUtL
         Ea1Y1zj8xMqevb2x8rwroFeDp8SstcaV3OVe44QmLAtWl1N67N3ASiaW9CKNe219rZXT
         tUG3qCE4xXjJ2X6SMIdPlMRZ+lGlu1jIvmYakM1xAdiUZn24kvFhMgjwMF0Gw9sZwrru
         RmRuBnl3rLxR+U3ROxJtVxZbT+8MrDsIS+2DYe+e2MFblcEl8PKfbpn9seI0Eb+2BN/3
         qsjizVMqN9mdh2uXIctX260RAYWO0BHdgkitETqtPzaan/pylpyRksX0xB+HHGDP0L9N
         YXkA==
X-Forwarded-Encrypted: i=1; AJvYcCUAAPWx7OmG/qFnyzH90CfC05Xx+sgwaYnK82M3BWNQ4ruIDSnttCzQpmzPSBHJOrbNmMvZjhjW8Gn3AZrn@vger.kernel.org, AJvYcCUfGFtxNFkKzoTDakkhgpEzUq6NesVBZjHMy94DDoDNYhvO0LWMB+IS+FkUTC8Sg+vkqoeCaLQ2wT0p@vger.kernel.org
X-Gm-Message-State: AOJu0YxFimgCyp1iK376IW6GdloT0r+M3VNEH47fEh1OWXeOnd8MhS0R
	kXOMbRrngt2AA0g4vWhx6yn5dDBHHKgrx0G3JKUBVi2DV/+42a0Ni9yDxF8P
X-Gm-Gg: ASbGncv+xdLoZaHBqDlbEt/a/sfA14tNugXWns12AEh28UwdZ0jHCMDEg+7Os9VATx7
	qN2JFVtm8QHLQLgLY0TAnDv/hDVigd5WTAevWxDeBipGqiTa4Oye7w3GY210CBZiswGd5M1iDKG
	XBj+QzkHGiLKdf7QcVIZAyQVXn6GdsEeC7PAqpWMAw57G6k1Pjtc47UO6sGu22f0L8VKOX64Qae
	ZmPPSbfb7k9dFQt8YLS3fHtK0/Cgn20uC+NnkRuaNyGac2T4HZfoAPVCjww0+XNH/cRr0AQxz0Y
	OENHHIby1yd3pJj3kraBoedBG/LdGv0MxHBxmEoOid3+QCvSXNSZWsz5P9xS8fD3qm92bklxcVT
	NbxflO7nGcgCW+vk=
X-Google-Smtp-Source: AGHT+IFII+NZV3VS/1Jyz0OmmXroXsE+BRvWpUr/0ZWhMJ84TyKPj5n6P0ljJ4iSoKLb4JPBntOyvw==
X-Received: by 2002:a17:903:41d0:b0:224:24d3:6103 with SMTP id d9443c01a7336-22649a80c3fmr86014375ad.35.1742437634651;
        Wed, 19 Mar 2025 19:27:14 -0700 (PDT)
Received: from ?IPV6:2601:644:8501:1640:864b:f5ff:fe5c:59a5? ([2601:644:8501:1640:864b:f5ff:fe5c:59a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d0asm123150695ad.130.2025.03.19.19.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 19:27:14 -0700 (PDT)
Message-ID: <b6750fd4-ed69-440c-9352-61930c790992@gmail.com>
Date: Wed, 19 Mar 2025 19:27:12 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom-msm8960: add missing clocks to the timer
 node
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20250318-expressatt-solve-dts-errors-v1-1-f103da6476ba@gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20250318-expressatt-solve-dts-errors-v1-1-f103da6476ba@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> ---
> Running the following no longer returns any errors:
> make ARCH=arm CHECK_DTBS=y qcom/qcom-msm8960-cdp.dtb
> make ARCH=arm CHECK_DTBS=y qcom/qcom-msm8960-samsung-expressatt.dtb
> ---


Hello Rob,


Why does running the above two commands always returns 0, even if there 
is an error within the dt? Is there a historical reason, or has it just 
not been implemented?

Now that these no longer return errors, I would like to use it within my 
development process.


Thanks,

Rudraksha


