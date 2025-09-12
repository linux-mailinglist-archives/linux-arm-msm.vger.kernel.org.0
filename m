Return-Path: <linux-arm-msm+bounces-73275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D5CB547A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8FC81C27549
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 09:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFC828DF36;
	Fri, 12 Sep 2025 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m7dEpU53"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCAA28CF4A
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669255; cv=none; b=KL7BLBc4gpQ+5k6UULetzsOYygXpYVlpPpEkFOLLRYnCiDExirl1M1pT+fg4S6Utg7WdM0g5MhGHC29/tWUpuObbhL8pt0ND9tIBg0+YjQFSnbiUaZUDhMWHf3opoaFY91/6uQDumagxz1cLQXdb3l7PshP646qaFh4zuNtPB4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669255; c=relaxed/simple;
	bh=gfb3JWg2h2wLQhK4UM6/FHhhzCI5uALXsimWBNV6NQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UT7lx/7TEi+GBaXLPwYl9xTGpLrC9JDWoKa8EmHRtkmKqd45D7srAn122mMsP095RR9mXEw85F0lz3L5XBNpqS5U0qlLw9K+njM5ZL22pFzeveaJhMTj0Aaq2M7rVfuRxvnrDGW/rAM6ogKx0eYqSRImYuizLRkI9gedd02Vujk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m7dEpU53; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3e75fb6b2e2so1808261f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 02:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669252; x=1758274052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kXTEITSzQJNG4FjEV+hS6a+GXTf9khmRm1tSXLrtGVY=;
        b=m7dEpU539YkuMk+HjGAlAb2g9NHmyecjpnoR1tGRljWMsSvfcURCKp6bS6eEvh16jf
         IEo0JpqDwLhKNlY1KrZO2yyu/3GbPKKrwioFjogbcnrgWa32jbswKy2llxEnaHpbLsXC
         3ctMFzst0L+btHshvkQ19p0L9aRU5F46X/MaTZ39AmRHl8Ow8p5edj/XFNCqzql5yOUY
         4OS6xCfAeg53yoil07rl5yk15vdoX/c1kO7Ri8JCmzfb0S+ZUeDcYZ5OiJlx1nggZEx0
         EhLaj4yNq3xO2YRrws2isUwKxUXw0Hu06BiejtC5OHp0uknlggiCZkywg0hNb0/CUPkF
         0AMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669252; x=1758274052;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kXTEITSzQJNG4FjEV+hS6a+GXTf9khmRm1tSXLrtGVY=;
        b=FzaufGdDQBz3AGzraiWbZV+0Pt+6MWCfbox/N5I2ev75JV6XqxEbL8GSNrgjllLiPJ
         U9/wRmkd7PBKxiO8zlf0PGCd97yTaZJmMHq1TOXHs0BtJtSGkqo6Vj2OSJ6AnEzPFDme
         H41ODpJCJk7dhGO5jm20GcnpHBg1WRxD4lOMhYyuyeV/GhoC+0P5Q6o9pVMQIa/IyScW
         QMTwZzQQ88V/x59OImtvNA4C8bZpMk/oQlGuhbnLGP0qolx7wkAGyGxsY358GsOpNWDT
         iy+HcQaRcm6+deKYNKnLAOtxuu1oLxwmGEorjtmqLYsE5cLia+9JusJ4x0mexigqsMEy
         bWUw==
X-Forwarded-Encrypted: i=1; AJvYcCWE1fLTYcgfOFUmOP5KMPMjsfI+w+aTNYfuaAZBJmIjDr+0bHdRy8bIEePG+L9NY1bf9xaiFFCFT3NOUOEK@vger.kernel.org
X-Gm-Message-State: AOJu0YwCTNVjt6GJxHRC3KmM6AxTGH/BOz4BZtIdfeOvVdlO5Ur+1H+9
	FpnhzENNVTtVNFaSdn5e3KTGogcDzu1KMjOmdBU1SnbB+HB4vtY7akLrvA0jIiZ6Css=
X-Gm-Gg: ASbGncuO/w0TnhIr5d5ILw9PEQsoNmyS8THtqYaV8TaM9p9cbrEKfozj8SBOromMo6s
	/DjxMyt6Br3njuQ7zCpIM/ouQ4Elm7YTxD2BZVITlYT+GJLmP3pLpYPLDo14ijYz5p/2jop6hNG
	9qtWJwl1am1UbOAOD0xPt0uLEHx7MP1h2OP5Ao5IcdmpiIdTnFCckzN04ZNhdSo3Hjf4I5ykS1y
	yxbtFYFSyNdoEPvV9WNj5KpCDuU1g3sBPtIv0gK5AkdZ+39uP1gv/uzfMfWZwkn9G8hmwFni942
	VgEzKSoRnHVtdHPHr18/OmerbGcZgonGQXrJsu9NExP1bF+CNW5J456UzdYJ54LrwL+KxVBhIIw
	e7siff8DObsEZJ78fK5jBiQbev55FpsPod//FkMMV8xiJRJNbmV+qCrDPc+3EIiVkblrF4rscqY
	W0o2nvi1I+I9MGx4NWQNNa7w+uV0hrLg==
X-Google-Smtp-Source: AGHT+IHRwP5h9u64faaN9sgkAgvq6Wk5wiLsJZGVMHzOBMSe2Z0sqeUItiFW4+Kj3CxqqJN1+tBQMQ==
X-Received: by 2002:a05:6000:1846:b0:3da:37de:a3c2 with SMTP id ffacd0b85a97d-3e765796575mr2314314f8f.24.1757669251882;
        Fri, 12 Sep 2025 02:27:31 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760775868sm5886336f8f.1.2025.09.12.02.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:27:31 -0700 (PDT)
Message-ID: <2a96dfd9-a5d3-479a-a60d-698e0c235d2a@linaro.org>
Date: Fri, 12 Sep 2025 10:27:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
To: Wenmeng Liu <quic_wenmliu@qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, vladimir.zapolskiy@linaro.org,
 todor.too@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250911-camss_rb8-v5-0-c078e4e22d91@oss.qualcomm.com>
 <20250911-camss_rb8-v5-3-c078e4e22d91@oss.qualcomm.com>
 <ex5oojf6lqti45joyjxpyi2ev4mjcitw4lz6cszu6lustrby4j@zzigwnu4pbxo>
 <39cb76ef-3f51-438d-b740-827a4c70035a@qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <39cb76ef-3f51-438d-b740-827a4c70035a@qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/2025 03:23, Wenmeng Liu wrote:
> 
> Would lemans-evk-camera-csi1-imx577.dtso be a more appropriate name?
> It more precisely describes the content of the dtso.

I think that's a good idea.

For example if you added another sensor to the mezzanine board on csi4 
an ov9282 say

lemans-evk-camera-csi4-ov9282.dtso

The only problem with that is you can only enable the camera in one dtso

But that feels like a problem to be solved only when someone upstreams 
more than one sensor for this mezzanine.

---
bod


