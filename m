Return-Path: <linux-arm-msm+bounces-17502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAB68A5B73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 076ABB25C71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B24015698B;
	Mon, 15 Apr 2024 19:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHcm5IRa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2414156985
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713210169; cv=none; b=iRqzGcj6AqMlrVxsqZ5Z/59KPogN6FFJcMYM/Y0sDncnct4yutaLCT0Ec7KuJJLoLwoIIxoGSLIwJ7xHwG/uhobYdJ/1nVpNJfrSb+wmcNIwq+Imw52sL6g6N5blqNjBgoCySI1kTjxz3bLVRkLbMG9z869Rm1w0b5xpy2KAKR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713210169; c=relaxed/simple;
	bh=axLQ6Vb2y+fBkXSAxVnB3Ffwdojty5NQbps9GG6vRfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRqMSQVRCsaQPkIGElbTMmVpBNagwIAxq4XxI1WXEi8BiJJupfcoDlD0onLg2NDGhhCTQE0qw7Op2jHqaL5zXPhxF2d8+DJnKo6Z0DnZGjjGkRCQJcXkTfOaXeutPyV/TVI7HMXC9Z8M6cFj1pT6wBzuiZTcR2QDUkSmOzfl8P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHcm5IRa; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2dac77cdf43so1367241fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713210166; x=1713814966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pel4IuSMXhoiMO3e3jJODv6FFXqtNPQdDIe5/vhiNjE=;
        b=HHcm5IRaaK/ftAilAH5XGNzsTAs9K6vsr2r8g4ukWrRTNo6PdmBFDRL2WL8OGQv1+u
         bozQe6mWyYF+ZooTPKGUrCZuEx9e5/wXBv9K8kXasdQzYO28RFvmxOl95CYNycd3hetq
         lTlQBffZZffu7SCBQo8qGJfv4Q4BQkt7LTGS8rOjX0qzIZc0aPKPMXd97SvaOzxpNba+
         jC0/icpYTyeWhBYzjwa52sSn9V+6deI3F15Psz+6Zf58VpfNIy8ogMB9yLzx3Hbp/lNL
         lcTYdrFvnj36Bp6Fi4L76U1ghJMiQl5G/THy3/NDVT3/vhp0zUXTu4iu9OIm8UaG77No
         MGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713210166; x=1713814966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pel4IuSMXhoiMO3e3jJODv6FFXqtNPQdDIe5/vhiNjE=;
        b=sb+da2QebWn6I5XvbIUuBl8pQ+WAgCgl3N7YRGB6Pum4CPe8JidXVd9SD/fhrieciC
         ARMEY/T8wu9DmYyJEvxg2pZVKU/7fiK5zOnlnQhN0kOTDlJRSfzOGbhNzQIqHMP4HJxP
         VdttPfF9BKmlS0tfXxAz2OMP9Jr78CxQJA5BEbM0NaFfmWAau23mCuujKfrCiuR1hd0C
         5hQCHLamA9EzLmCfBlSAssjkOH/GoAU+REfeA7QFVTYt9owNvS2SDEEHxXyAwSWFfUUX
         sAYsCVwMwbfIhZ/Sul5xFdeBWSoQO3Fgn/AN5XNfzqn4yYMmR2F1ZFjn7EI/hKRNCJP9
         YaQg==
X-Forwarded-Encrypted: i=1; AJvYcCWpzDvzt6eN8aMTd9TMwvp75Xuy7Xc4VzdSdgR6NQjCKGUTv0AilDJfJ+VsnYvyHjMl9lcsKrvtDNY87YYWGYcRw3CTsLLL18WChSCrCQ==
X-Gm-Message-State: AOJu0YwV7+32zI8sHyvyGr5C+IxRxFgmq3DSw2K4t/wrCoPT4gyo0OSd
	ksCDit8FzNFPj9x1nLPHFk2DD9J0waq77gRPyfQwmZDA06UBZiYU83ExpLvD7QI=
X-Google-Smtp-Source: AGHT+IGjEnRycaBaSeP36Mt4IjxeEF3ElKi4vzIgUYlEGvDUqVdK0yPDppZzA2T8o+u/CJIaTfH0/g==
X-Received: by 2002:ac2:4144:0:b0:519:231:e4c0 with SMTP id c4-20020ac24144000000b005190231e4c0mr1585142lfi.43.1713210165791;
        Mon, 15 Apr 2024 12:42:45 -0700 (PDT)
Received: from [172.30.205.18] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id o21-20020ac24355000000b00516cba5b4cesm1334507lfl.46.2024.04.15.12.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 12:42:45 -0700 (PDT)
Message-ID: <be5bd196-a782-41a7-a1a8-8aea6b4b2365@linaro.org>
Date: Mon, 15 Apr 2024 21:42:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add PSCI SYSTEM_RESET2 types for
 qcm6490-idp
To: Elliot Berman <quic_eberman@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Yan <andy.yan@rock-chips.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 Melody Olvera <quic_molvera@quicinc.com>,
 Shivendra Pratap <quic_spratap@quicinc.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240414-arm-psci-system_reset2-vendor-reboots-v2-0-da9a055a648f@quicinc.com>
 <20240414-arm-psci-system_reset2-vendor-reboots-v2-4-da9a055a648f@quicinc.com>
 <CAA8EJpoXrbdD5xVmuo-2b4-WwpSachcJ-abDtu4BS_qa-2A+OA@mail.gmail.com>
 <20240414173158942-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240414173158942-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/15/24 02:32, Elliot Berman wrote:
> On Mon, Apr 15, 2024 at 02:13:29AM +0300, Dmitry Baryshkov wrote:
>> On Sun, 14 Apr 2024 at 22:32, Elliot Berman <quic_eberman@quicinc.com> wrote:
>>>
>>> Add nodes for the vendor-defined system resets. "bootloader" will cause
>>> device to reboot and stop in the bootloader's fastboot mode. "edl" will
>>> cause device to reboot into "emergency download mode", which permits
>>> loading images via the Firehose protocol.
>>>
>>> Co-developed-by: Shivendra Pratap <quic_spratap@quicinc.com>
>>> Signed-off-by: Shivendra Pratap <quic_spratap@quicinc.com>
>>> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>> index e4bfad50a669..a966f6c8dd7c 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>> @@ -126,6 +126,11 @@ debug_vm_mem: debug-vm@d0600000 {
>>>                  };
>>>          };
>>>
>>> +       psci {
>>
>> Please use a label instead. Otherwise it looks as if you are adding
>> new device node.
>>
> 
> Right. Fixed for the next revision.

Are you guys planning to make this sorta ABI-like?

If so (which would be greatly appreciated by the way..), perhaps you
could stick these magic values in dt-bindings and give them cool names

FWIW DEN0022 (my second-favorite book) suggests these values are almost
totally vendor-defined, so if I were Qualcomm, I'd take the creative
liberty to come up with a set of numbers and never ever ever change
them

Konrad

