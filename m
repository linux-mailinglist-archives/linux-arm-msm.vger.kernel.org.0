Return-Path: <linux-arm-msm+bounces-19527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 886F28C0492
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 20:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC7391C212B3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 18:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8F112EBFA;
	Wed,  8 May 2024 18:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZlaLWT4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E88212D75D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 18:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715193921; cv=none; b=sVjEZIinZtSBm4bpx1UD5nhczxsWGdZ2P7f3f47qEevdx4eEvhROuyZJ+csaIJwcwE+YNZTp5s/uGg4xOTf5KNIHxX7O/UOZS0jRkYy0yOo893T922d8Jr0LT94NZkKWeF+ofgALP939v6qHgnnKWhjIHwgUQkZWoGBnzV/CJPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715193921; c=relaxed/simple;
	bh=ajK8fwDEWGgksD0g4NneQiANiInlFvagm8QWZ2BtHyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHXexw6CZ5cfqdo9XNHCh8gMSPXHpVCEnSvebSynpm7Yb9ks0G91kcBFCf4Kmaby3OFS2HcROtMtUYIolUccOTSl+uyV0ydD/a33azp1oenh4yT4oTNnmC+dS/y9M0IM9C0EphlbUzjI4u5t+e8zLkzUN7zRt3C7MOFsU4gFj08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZlaLWT4; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5206a5854adso30868e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 11:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715193917; x=1715798717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L/sl7CVm2REW89uZuY8Yv8EOqxKrMx/lL2HpHKt7Na8=;
        b=NZlaLWT4pEpb9XTMJcYOeHXVLrbh9jOm+RKF3VTPqekoLY7XKJAbPA1wygNYNzcZgW
         Et8RhIXp6+Xb7kLKs2VP+DqUod1qYUjr6EwX+9W47kscuyezYqtt+XzW3fRpFVuFDSN8
         vJUwqbUHYL3ERHrC21Gbv6IyREbSBhIQSbFBZuVllzYDOKUgfH/ipbPDx79u+MhNyxpj
         sn+6qliFjb6GwATw8uvOF7Z22lwAHL7KtwcL047XPQUIdOopdgJ5ajgH0whZvG2xgcEa
         wTX50xviAzaGZ+dWb5DWitLykFPEQabcqdEsQeujCtrwuAUygvi54KB4vvIjTjEH0UJg
         AZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715193917; x=1715798717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/sl7CVm2REW89uZuY8Yv8EOqxKrMx/lL2HpHKt7Na8=;
        b=M40EDpxa+G9Q23HilTvoe/j8Pt5kPUNhaK3p5I+EzgVaETQWLO/LOPzkunFsGEF8/U
         dyUPCySR05nrPFLdOKCUy3cEOL9Y0bF4JDkjBSaIqICZdiJbWTrlhE4jSRu936imoHcw
         H0T3tYrizD+jBlDviWl/OuxQOWV0JLMEqrqZ/vSQWnlaciLL91A4uVQLkFMyonyZ+rP1
         qxX8x/M/92JGJ8A11/ZvvClfGoV0WzxK50bh9sD9iA6cikPHsQCwhTNDvvj7po4yUHul
         NOtMa7SIyuaG4r2jw9yR3WRuGZeIoqfeDT+MeL9SIMsvGmyv+SxlaqyMOPL8RlF2s3HG
         6zoA==
X-Forwarded-Encrypted: i=1; AJvYcCWcaB0pxYoxy9ga0jAyYZC6nHk+AlMNkZgCFy8eryqPtiOI9uCZYIAw6AQwHM93FkGMy6Em51ZN9/vlLF0VyNjFh190GbWl7QV0qgvyDw==
X-Gm-Message-State: AOJu0YxY+wUEqyzLh2EPwi3Yj6kJxBzS5UW55XbGFSRtSoLlPH3GVqMM
	8lPgxaDRi+iNbMcwUgTuKxzIOwts7EedqdkHQs1i8ULYwSKCG/nsY6t2rt/xjsI=
X-Google-Smtp-Source: AGHT+IE10Er1A/mCrosxAFnAYPReP2NcUb3AzPgcOh2RiJkJ3CG8BZvnwb4a8smEsiNSsK0a2O5UYQ==
X-Received: by 2002:ac2:522e:0:b0:51b:de39:3826 with SMTP id 2adb3069b0e04-5217ce46c24mr1930208e87.65.1715193903577;
        Wed, 08 May 2024 11:45:03 -0700 (PDT)
Received: from [172.30.204.208] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id g4-20020a056512118400b00516dc765e00sm2605299lfr.7.2024.05.08.11.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 11:45:03 -0700 (PDT)
Message-ID: <1a28f062-89d6-48bc-b74f-2ad480f58ff9@linaro.org>
Date: Wed, 8 May 2024 20:45:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Mark Ethernet devices on sa8775p as DMA-coherent
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andrew Halaney <ahalaney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20240507-mark_ethernet_devices_dma_coherent-v3-0-dbe70d0fa971@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240507-mark_ethernet_devices_dma_coherent-v3-0-dbe70d0fa971@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/8/24 03:30, Sagar Cheluvegowda wrote:
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> To: Andrew Halaney <ahalaney@redhat.com>
> To: Vinod Koul <vkoul@kernel.org>
> To: David S. Miller <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> Cc: kernel@quicinc.com
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: netdev@vger.kernel.org
> 
> Patch 1 :- This patch marks Ethernet devices on Sa8775p as DMA-coherent
> as both the devices are cache coherent.
> 
> Patch 2 :- Update the schema of qcom,ethqos to allow specifying Ethernet
> devices as "dma-coherent".
Per-patch descriptions like this are usually redundant, unless you're
reworking something complex and non-obvious. These things above, we
can infer from the commit titles alone.

Generally, when there's not much to say in the cover letter, you can just
give a very brief summary like "This series fixes X on Y".

Not a huge deal though.

Konrad

