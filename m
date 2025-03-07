Return-Path: <linux-arm-msm+bounces-50653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD03A57495
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 23:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60B207A60F6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 22:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CB025DAFB;
	Fri,  7 Mar 2025 22:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoSjkAPa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38AA25C6E9;
	Fri,  7 Mar 2025 22:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741384993; cv=none; b=iTBVbx11Xb1F87sVjfPD9KSrQPAqrOCflAe8b9AnPAvq/wEzm2C3LEShmaQi+kNgIQ1DHHU4oemA7GTKZXCZNHqXkgVzM6hfpOjjpV1rWfD3IygKaXE1FXuS5Mvy8zSI9PfZ0GL9HwKg+uJbBsUZuS9HPW98V5JvvrMX096SGCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741384993; c=relaxed/simple;
	bh=HfT7YBUuQun9peA6NSdWFSnBB00x6zpOkOT1q8ZQG8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBGA1HOS0BcDPh04wfl5qu+4dwbxD1HaniI7Lx/hCZSc1i8taP+/GqoeBIN1iX+s0uOfVMHDmqYKQlA79tAEjxtKsreZOoXgdBY26UJ03J4TqUktnSyuny4y4uAT3ZEFDwylrZddN7N5/oXQ1aKGmM09I3uh6/M3x+B4o8M44L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoSjkAPa; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22185cddbffso65830425ad.1;
        Fri, 07 Mar 2025 14:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741384991; x=1741989791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QrD4lSciRyJzuMr7aOD0QN72ptV5sVvOJnuSmvbS6g=;
        b=RoSjkAPaPM6eSHOl8IEF2LSxVhHBZmeMYAvIMP7l0kcIpbR2T4vBh61HVstm7lfhxJ
         7Z04iB1leTeWhGzRXV5tpVqLrGCkRdQQhjs8Rpc/Jk6JZevd4EhykV/x0NVvzQnPZkOc
         NVV1sBXR+Nwa6PYxpD7RCDaqkeZEi9tzFMQnfcat2yna/ZH4699SmwakOnw9rwXmoLZh
         znVpCPqzK0pPzV8tn3uBZaaxIq1IyT5bBQeSq1Fiw9SwS8YAI6bsb7hJflkzEWu6Tfh+
         9/H69uSE8++tULrhvy5lpPyIixR1oRg19EE/+PLJI+ATM4+qhDyqChEgn+g36wKzXqDx
         6tTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741384991; x=1741989791;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QrD4lSciRyJzuMr7aOD0QN72ptV5sVvOJnuSmvbS6g=;
        b=GSML3UJh3qprWWoRk89NHkvFe8HWlzx7JqAuuK0qm6lM6JgMm4q9sGUB7BSyxbpnB6
         pAaSc6ptLnAMwd2B4x6dR5qoRuGBlOiZ4uMZRPM7WLuX+htDVdGxb4JOQ2QWmnCumvo5
         yp0CTqywKy8jDby2OhPGlLIXIUqJVVMYhZIo9fiZe0IKKTIpyDDtr5IylCc/+OM1ClZj
         AkwlHY/cmu+S/ezVGXSX68EZdN0N6u12Tn/RfAl0qWIhfJv57vmapgNe30ettz6z04kK
         IOwX9qALd7jtyHBjUSv8mRxoHdnx53wrvDZ+Gafjn4KH3j7BRj8ZrAvsQBgOUKRlsLPu
         W/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvHF14bSMRmPkJ9wqyYLhGipAEspT36KIzM3mUN3xCtYYY0RkcCHIk6KpVeAVVZvch2WYJ7yCuzGCs@vger.kernel.org, AJvYcCVvhYSBapU05At/Ipqh9SqTTmYX0a11yH2H8hs7ULtSbN46IZ/Pv3q797JNZrAjcqRg5P5c7mVlxOJc0rt3sg==@vger.kernel.org, AJvYcCWPEHVY40Uuk6KDrporNI9TJ3FELgeWnQaygWdNxZIM/O5sR6tAvdIwflJIvQ9O4VSV880bvXDuWCb1AJ1x@vger.kernel.org
X-Gm-Message-State: AOJu0YyTsubFDuBv92XBDIbocQnVuZoy0XEZNnfJKhygnt3roRbkQVrF
	WfADp+gILlTs8Hcmct3oXr71CxFf2q8nERe4tn0ICpl5+GsgaDk=
X-Gm-Gg: ASbGnct27wYOozaYQDhwx738shtXCeUoeSud0Xw5ZQmsntA7/w9c86gzF48qmsc7RxQ
	u4JVaHYVHvG9S3Fvhcw4tldel5pol5CBgVAY1UF4hUrXAqPnc0taC95VrB1jpad0RfiJurSOPH7
	71NspAJEkhaJQOq12+756zemx++N4FuAB1Fme0kDP/YGiNa2zfBhbhlB4afvsTM3BhO4HyGHvj2
	HayXPRU/Hu9xegPH9Ks/eIZ1ezTJvSbFFc7tMHOJpEJOTi2S2B/HocdH2ShaQVbcqet6mTLWSCI
	qofAK7zsuvakXL6s3JpoLev0i85fGo9nrb+Aa9kT9iW28wzD5gM9+6WsMXd1DDfCoUbbFZjWMEz
	bURhOUiSl/Wg=
X-Google-Smtp-Source: AGHT+IF38hSMmdQu7eK/4ry/q0bQbaliG6ifbVXwZ+xnP5shZveIjg6P+7bLSB3++j5ldSNYjgrjbg==
X-Received: by 2002:a05:6a00:816:b0:736:aea8:c9b7 with SMTP id d2e1a72fcca58-736bbf4af5dmr2240165b3a.2.1741384990903;
        Fri, 07 Mar 2025 14:03:10 -0800 (PST)
Received: from [192.168.20.171] (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698244180sm3909287b3a.63.2025.03.07.14.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 14:03:10 -0800 (PST)
Message-ID: <ea9344b7-6646-4329-b8f6-45d2b51f183b@gmail.com>
Date: Fri, 7 Mar 2025 23:03:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 0/4] arm64: dts: qcom: x1e80100: crd/t14s:
 Enable Parade Type-C retimers
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Content-Language: en-US
In-Reply-To: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/20/25 18:42, Abel Vesa wrote:
> Since the driver and dt-bindings have been alread merged, it has been
> agreed offline that there is no point of holding on to these DT patches
> even though there are some issues with plug/unplug during suspend in
> both pmic-glink-altmode and ucsi-glink. These issues are being worked on
> meanwhile. Merging these means that even though this will provide external DP
> and USB orientation, plug/unplug during suspend will give some splats
> and render both the USB orientation and DP broken. But then, other
> X Elite boards already have these nodes described, so lets bring the crd
> and t14s to the same level.
> 
> These patches are just a resend of the ones found in v5 and dropped in the v6
> patchset of the driver and dt-bindings.
> 
> Link to v5: https://lore.kernel.org/all/20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org/
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

If you will be respinning, could you please add link-frequencies to
enable HBR3 speeds, similarly to [1]? Alternatively, I can also send
fixups once this series lands.

[1] 
https://lore.kernel.org/all/20250226231436.16138-1-alex.vinarskis@gmail.com/

Thanks,
Alex

> ---
> Abel Vesa (4):
>        arm64: dts: qcom: x1e80100-crd: Describe the Parade PS8830 retimers
>        arm64: dts: qcom: x1e80100-crd: Enable external DisplayPort support
>        arm64: dts: qcom: x1e80100-t14s: Describe the Parade PS8830 retimers
>        arm64: dts: qcom: x1e80100-t14s: Enable external DisplayPort support
> 
>   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 321 +++++++++++++-
>   arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 474 ++++++++++++++++++++-
>   2 files changed, 785 insertions(+), 10 deletions(-)
> ---
> base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
> change-id: 20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-325cdb7b097d
> 
> Best regards,


