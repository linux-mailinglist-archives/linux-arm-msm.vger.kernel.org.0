Return-Path: <linux-arm-msm+bounces-76592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19160BC84E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08A373E8336
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC232D73A5;
	Thu,  9 Oct 2025 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fLp90TnJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A872D46BB
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002108; cv=none; b=D4auDnM1bUC05TRxNtD9t4lqrUzAwwMZmeDz4wR2Edi1KNs5GNoJLdo6vy/7e2QF/VwISroG6c5Xl9eXOJf59d/urWTkQ3Y0kt2W/pyHar21UngBMgmNb3csnvSrFSMxp256HAC1yeOPbbQeSKFh8OBHN+xi/IE2jnStQNvOw0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002108; c=relaxed/simple;
	bh=BQczyE5Zdk5A2N+2sEJ3+Qj9fhfLVuv1k6SDtzvhgwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVaTkt5bDlWVXPnkCRtKgNa22dDji9tVttTCmBnOXMBmSFbOvYoUjd98h2HSNI8/TV1llm5k1f76Lma6oUa2ylWPv719szD3xQOeg/SEwZdLFu3cuSUscq7Ml3p/QNvLhLe2xj5WjqRQQgO7/wpkslgMO8qouMk9nPaX7dwH9E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fLp90TnJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760002106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXHkdfv5tUm0CpyurnPpmySUCFcyGseszzZdpVNrQUA=;
	b=fLp90TnJSr6/ejQ7Br84aAUvDY6VNZv/L90CsE7moODzzmZ4+fft613zgS80JJO/T8upBu
	HVqbqXbJKCFut32hyABTt8EtnNxfcx6RwHgTTklK/X/DOZz1SyPe9EHpC+NZ/yabD6Jl4E
	Rj0Yzg11I5q2mSSZHV3tMKPUOl8fk7I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-2mATiVP4MXKHKGLrvvVA-Q-1; Thu, 09 Oct 2025 05:28:23 -0400
X-MC-Unique: 2mATiVP4MXKHKGLrvvVA-Q-1
X-Mimecast-MFC-AGG-ID: 2mATiVP4MXKHKGLrvvVA-Q_1760002102
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46e46486972so5644335e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002102; x=1760606902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXHkdfv5tUm0CpyurnPpmySUCFcyGseszzZdpVNrQUA=;
        b=Vkru6WSl0g+pQ6wcesfjSg4SCUwIYED3G9KlkfcaO82mYRUfl1gEgZK63pr9Y95VGA
         8t4toM+4uj2Hr+TNbnq5AyNm0WS3uNdYcCL2yy5GtXhL975muZCUKRLQC9oV9vLHTPYl
         IrIBhIy1hbfg8a3yECaklQS33kcVu2Zztn6dNWhv7VAlx7UWjtypBHCy8vqgqSGfTEz0
         YlGf94GrGGDdqNEmQnkubruyah1q3m1HehCtBZox0gaXMgiO2YLSrYvJP8CiKmXq8l7e
         1z84bS81G77zMGNWO1OpQm6mF7nI0O9o4+OrfDPKiilwSxWq601aKZhXvWejGEd5ru1Z
         kM/A==
X-Gm-Message-State: AOJu0YwgDmOwPz1mMeWCPaqrcaEbVjFX6NFqcsu3hx/9c12rbgvR/9F8
	lBeOOIaTBPV4d7UsmeVFAMlYVRmJc9wd0KtZavt8MLJgVT+T0ljQ2iH62rtijFav5ytaQXZqz4K
	6zOOIJOkUvcgYF4GXpZgDqsRNdWLu+p1W230AciIcN8db1YW0EKFcNquKYpze8Ik5Sf0=
X-Gm-Gg: ASbGncvuXLnAShXhvFOI+m19RTCma3skGj0i+nsTbBbxSb1qgSmhzbtaaQ+mU8h7KFi
	Ki3KxdUit0RLjZs/9xEZ2VhGbaXVLzFa0phRfoHCfFhITSHOy/8lUMzTXV+4dfTzybR8Cbak2t9
	BJiUQXRonma52ChnKCQiCa1FDis9PYAweQdNrlpxi5Ga9Rik6RxSTztaeQ6sxsznpzHmfSBAGfq
	h3yQPLGDSIshzKEy9l2k4CClq6ZgZlvP1Zl7IDb4OcFk6GsBRr5ofgqehGBAOzg4LKNS4I9GClo
	Ydxhnfk/Ne4YqHEWbSKfNDXXVHx0Afs3nn0CUn5cCl0ShIxUk0gqlyNIdqjf0ACQQhu75Lmlkqd
	URLUDkPdx7shaSZxghw==
X-Received: by 2002:a05:600c:4e01:b0:46e:6a6a:5cec with SMTP id 5b1f17b1804b1-46fa9a8e5e9mr45746455e9.2.1760002101725;
        Thu, 09 Oct 2025 02:28:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY3/Xon/8eow6YV6te1PVIUeQNsTPhTN4xL/Kc6c75ZTtzIKnnqNPMPgFzo3E/3FgK5+ApKg==
X-Received: by 2002:a05:600c:4e01:b0:46e:6a6a:5cec with SMTP id 5b1f17b1804b1-46fa9a8e5e9mr45746105e9.2.1760002101274;
        Thu, 09 Oct 2025 02:28:21 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9d7f91esm75339585e9.20.2025.10.09.02.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:28:20 -0700 (PDT)
Message-ID: <3184d938-5100-43f8-93e8-f88549ea4b72@redhat.com>
Date: Thu, 9 Oct 2025 11:28:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/25 10:17 AM, Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
> 
> The DTS changes will go in separately.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - Fix the power-domains property in DT bindings
> - Rework the DT bindings example
> - Drop the DTS patch, it will go upstream separately
> - Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

## Form letter - net-next-closed

The merge window for v6.18 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are
currently accepting bug fixes only.

Please repost when net-next reopens after October 12th.

RFC patches sent for review only are obviously welcome at any time.
---
Also please specify the target tree in the subj prefix ('net-next') when
re-posting and possibly additionally CC Russell King for awareness,
since he is doing a lot of work on stmmac.

Thanks,

Paolo


