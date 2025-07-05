Return-Path: <linux-arm-msm+bounces-63840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E99AFA1EC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 23:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42F7D3B9A4F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 21:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BC2218596;
	Sat,  5 Jul 2025 21:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLXxPCXW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FC31BF58;
	Sat,  5 Jul 2025 21:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751749668; cv=none; b=dTa+da2YMFTxsYhL42MiyzcdtR0Md8gp8jbsQKriJCKPIM/K3BMcLVzS75bO+4qBIij2/m0KRbcEoqdNVV3ifGx048T0wdoWDPY0MbPrTG7yRniPR04XqOpdpbFVvbreeeSwFXe63xRskrEz0e7CyJD6ejjYUGUvaBFWYXXu7To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751749668; c=relaxed/simple;
	bh=av661HLHeLpl9E43D0/bBRcMZa2comXBBsWoJmDD+b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwYxViwTF7lHTJU8qd7PcJ27+bDnzkyGKjGMSdN+b4t8PuHOB/D+p22YFotVIB6cMQUaNA/sgRyCtcHgoaF9sgXBeML/+SRkW9iUsBzfkbq3Yok3QQs4GZiYXE+SCznehbx6P2uUJtYsP1knETf/+3wosg4UPq4t/BpnBF+lvoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLXxPCXW; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so4858971a12.0;
        Sat, 05 Jul 2025 14:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751749665; x=1752354465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0OfBp7ErnlCrO+RdLaJwYOfHNWrwDo8W1tXRttUHFk=;
        b=JLXxPCXWFnZ/upTZ9j5eijUPYcBb8CYTDIT3xcI1PObhiH0U7WCSjN8k0pyZzz54E0
         VA3PF/HSi/QzYBP7coC72h66otkUizREt8X/GJVAj8YbGo6lUIcsDLdrOU7ss9mXuXLs
         o+Hy2oyhKJqtoCPAfUCIU4r9o3qW2QDTOkeufb6H22oVnCZ5PVCUWLUVU92qHplKEE4y
         lXdQ58ZQfa+nhfXLILaeSDxvI9+wU3DJ9MCu230IDWldHybbNZrTGk6k7DtL+XyjZqPr
         6jtNYYLxD97xJ9GNcPcusQB1AbOptGUnlDU75KTXFos882wyK+TtiiKkjoOn+rpwuCig
         Ix5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751749665; x=1752354465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0OfBp7ErnlCrO+RdLaJwYOfHNWrwDo8W1tXRttUHFk=;
        b=geGYMcXOe39+we2loFwFF6QtQn7QC7Hucae1epkq+H/GutVLtU022GOtL4Jzo31weA
         cNCZZN4B7W/qPhrdIgXaYv+vJ9Yglw06G0wrI7nGWHEm+w0gtFYxBvZzFHHqRKCdBtbs
         adkfpj9TGcipPNKB47rLz/w/xsnQ0E5lBU56Dm3c7umnKcYNKBYpZMCmctmg0vKhz7cQ
         9IYX+bGExtFQSExZvBV25fr66aGJhqJqF5JtVaKB5jDyqjUutsKYsSxUyqb9sXkD9cLY
         LecmvmeALV4oAvutxRZTdlq5+fg1FQarbTNcpB0s0lnLjt0jHghyheUWuVADxHFnfOV8
         3+0g==
X-Forwarded-Encrypted: i=1; AJvYcCVgL+fVYJq3Xi7nzMSW95BlXrk9VpGSAhgYLuxAfqXRPrTq7q3YqS8eBp3aaLwi+7hpkQJwnNJHJCLn@vger.kernel.org, AJvYcCVuF6AO4HLtHaI+seSYxlGczustYlqeCCjQtTY77TEAc8VSXx5ZrEzWgryshVgUNAyeLuWs5F96UWBv49oY@vger.kernel.org, AJvYcCXhjTrp7ZAZPDzWfjd2YnZCy+cc71azaRhJnr6sZCidyxzati+gOaD0D6JVK7zs8tkToR134Y0rWM79MJsOgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeAOi5WalIfbrY4A771bXGj8pZQY/Ebvks1F7n1hhTkE0+z12c
	yfead68Z8asOsnHU1SF0Sei9CQgkgH12Bv9Ef0NT1T8zStiZAy2Uk0w=
X-Gm-Gg: ASbGncsIpSBvEndqno3SBp7bltx0Ah1QeIdltGc2uLai2TRg18U2UrJu/YBFBYc/keX
	/DYpmnZ0o6oiZe8OuQrO578MPRpZeKuvqsIbMbYMuKZdSvVn2q3573/xewn54lYhWeOwzco4iYL
	Cv1BI0m97upLF1nFFDknm0Jz/6Ml5VfmLwNhji1qlNhQbgHQxgKome4iZpRDs7cz8rzoPrfbh3r
	RYyS0zWA8tmZ++BweIoiWdrCFYKILIs38r0pOd3vF0HUm8JHrYLDJvWmmnxh0zaXWAmNOca8FdD
	FdhNd+9BqUNoqe+oQYiGpAgIrlfgVYb9A/2tnxVm8FOjZ7RVN6mIjcbrtnDzoZ6AsOlWirnhCA=
	=
X-Google-Smtp-Source: AGHT+IHfo8By6gTM4sQb/mWVes7SFV6BKHWMA92iQ1C2kjF7CVvXbGrhVTrqw1Y5EOO9GItPXBtyog==
X-Received: by 2002:a17:907:1b28:b0:ae3:6038:ad6f with SMTP id a640c23a62f3a-ae3f801ffffmr804598966b.3.1751749664350;
        Sat, 05 Jul 2025 14:07:44 -0700 (PDT)
Received: from [192.168.20.64] ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca66e566sm3044739a12.11.2025.07.05.14.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 14:07:44 -0700 (PDT)
Message-ID: <dfcb20e5-17ec-45b5-9cce-b23dfa5028e1@gmail.com>
Date: Sat, 5 Jul 2025 23:07:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Add Dell Inspiron 7441 / Latitude 7455
 (X1E-80-100)
To: Val Packett <val@packett.cool>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701231643.568854-1-val@packett.cool>
Content-Language: en-US
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <20250701231643.568854-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/2/25 00:53, Val Packett wrote:
> This is a series unifying the previous Inspiron[1] and Latitude[2] ones.
> The laptops turned out to be even more identical than previously thought,
> with a shared firmware update capsule[3] that refers to the shared codename
> "Thena", as well as being identical visually (other than the bottom label).
>
> Changes since v1:
>
> - Added audio (audioreach PR: [4], ALSA UCM: [5])
> - Removed the copy-pasted comment about WCN regulators being on a
>    "removable M.2 card" (the board has a *soldered* WiFi module, anyway)
> - Removed the useless pin comment
> - Fixed sort order for usb_ nodes
> - Added missing newlines before status
> - Changed zap shader node to use &gpu_zap_shader reference
> - Added raw EDID dump to the eDP panel patch
> - Changed the USB mux compatible to ps8833
> - Removed unused i2c busses
>
> (Should the dtsi be an 'x1-' one in anticipation of the x1p42100-based
> Inspiron 5441 / Latitude 5455 models?)

As Inspiron 5441 is already available for sale, and at first glance has 
only a few differences (different display, x2 instead of x4 speakers), I 
would say "x1-" makes more sense, unless maintainers disagree.

Regards,
Alex


>
> [1]: https://lore.kernel.org/all/20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org/
> [2]: https://lore.kernel.org/all/20250525095341.12462-2-val@packett.cool/
> [3]: https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=x2pvx&oscode=w11a6&productcode=latitude-14-7455-laptop
> [4]: https://github.com/linux-msm/audioreach-topology/pull/25
> [5]: https://github.com/alsa-project/alsa-ucm-conf/pull/589
>
> Thanks,
> ~val
>
> Bryan O'Donoghue (1):
>    dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
>
> Val Packett (4):
>    dt-bindings: arm: qcom: Add Dell Latitude 7455
>    arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455
>    firmware: qcom: scm: Allow QSEECOM on Dell Inspiron 7441 / Latitude
>      7455
>    drm/panel-edp: Add BOE NE14QDM panel for Dell Latitude 7455
>
>   .../devicetree/bindings/arm/qcom.yaml         |    2 +
>   arch/arm64/boot/dts/qcom/Makefile             |    4 +
>   .../x1e80100-dell-inspiron-14-plus-7441.dts   |   51 +
>   .../dts/qcom/x1e80100-dell-latitude-7455.dts  |   52 +
>   .../boot/dts/qcom/x1e80100-dell-thena.dtsi    | 1658 +++++++++++++++++
>   drivers/firmware/qcom/qcom_scm.c              |    2 +
>   drivers/gpu/drm/panel/panel-edp.c             |    1 +
>   7 files changed, 1770 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
>   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts
>   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-thena.dtsi
>

