Return-Path: <linux-arm-msm+bounces-44740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9494A09283
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 14:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6039162EDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 13:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4A420E717;
	Fri, 10 Jan 2025 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/MHSryn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B213D20E6EA
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736517046; cv=none; b=XDQbFS3Qbe8nTaGzPU4f3ptdkU/4LXk0itGDd8BlSskXqqqYF6GUILBS+S8XSyLtLV7yETalLnQTdjtPJAO9MqnSOJy+rkDTTWs7HB1eRSd/sCe4wYw9Oa5bpj3rMiHWmbGXCxPZyCSXfnatkSFedgzIms2CXUUY5m6n7MwDQgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736517046; c=relaxed/simple;
	bh=ciJAEmo8xS1YodmCHYYwU3P0gYxHOe/kHbBoWXH+FFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+9dCaqXJxR4wNyk4XGUiFK1PTJUI6uhiyZMbAmlu4kS2rZM2u104qwBaEuob00luVFQ4+SGFb8HSTu/CiogmkluEckuJ60/iK4jN30XOStCZWhQ0WBqOjNZJpe+ME/EJY3aLtoQSHrDD9t1mv0sBpAlzb6injgXaJpK+BN36Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/MHSryn; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e87b25f0so2086331f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 05:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736517042; x=1737121842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+KDUqAsdGT0AfuSaRdiWzIkDzcUh2fPCqtIyZmpfwLg=;
        b=x/MHSrynt13XPwt5cR6U2vDjhnPDRvjhJU3njGCW0HypqxMCRAldIYAnC7Im9gv3dV
         ElqKmmPe76cCcAjmNxQwtQ9D2HfkH3vHoFQ5KPx68UdnCB7E0kvSh/7h68JgineZTIT/
         e3UKu9wpn/CWUXx+pejAeFFrZt6d+pYqLvDnGv4U+2aOmkWa+PHUukY9GVyBm0QfPN0/
         DNU9rjOf0DKp/0rIk1QWA6A+rM4VYAmPsXEd834rWyHJpwJCkt/pLwaTsEJEuxw0kad7
         avNTh+877+90GmCX/1Mbcb0V0WCWdrq6B1AWlkJY2hpt7ft3cP8RksbZG2OVMpysJ3V8
         CYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736517042; x=1737121842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+KDUqAsdGT0AfuSaRdiWzIkDzcUh2fPCqtIyZmpfwLg=;
        b=wbltCReuyWamAvs/G3WtsNBkYtjEHpxSUQIvvQADsau4C4u3i51J0yhRBCBR01azUH
         WiE69+CBy1DKRGt+YsDasBI4cW5biUIRFioM05XF/YtkUFf8pSYLFo2cCbpRv8fqyH6Y
         fjAdFlfo+/WQg3RWEYfhHfKlq//ppGZ3L2O7Slt6hmyDQbKjd3ZEDysd7htEsmRGbId9
         Fyhh5t/EBx3XQQCOT4yJLwDFJW0MJVGa2BVcCT+Pqwnc++PkA6E0T2xyQejPmucg9Crt
         Pj1BUBf2ql75tsaNFVEjMIL1aF1czSpnumVNWLvWZ3dgh7Vdp/mUWieJcGLQYfbQKeXv
         jHWw==
X-Forwarded-Encrypted: i=1; AJvYcCVRKyexcRnUxg+0R+ZL8ydUQIEY2wTu685fxCfNLCirmLLOXlH3X/4kUrsLYCbTO1Xkdjvses6ZiA2OSYq9@vger.kernel.org
X-Gm-Message-State: AOJu0YwRvnot3NprIP0aXH7A2mP5Gx7m/cdpChwqg5M2ySqCTg3ePL/n
	Dvn2z7T19teQg3YHgc7JUVEoeQdyTP0WfpDGz421aBs0tz+Psj6Ku6XS79mNRRs=
X-Gm-Gg: ASbGncsmk/oDUxQCxyFweAJcp4nEVNgF27fUg0kApBM9dLH2wwJkt5kmpvtc/NNk32o
	Qr+8vsU+qIOUqth4GD8DyCwc8cZxgnQTWWi1Lx5kQV9WvpRBhdS4oRlwo85yEdb06V5HwFa8U6Q
	uGOjKll7/YzNthu3rFcaZoo4WzC82wqmpwxAGWVpl5ED3Yz3ZOScV86lpG/NqrCE0U2g4QeWGma
	Aod8huAHNdTBds/5vKlTXfrKMzG7VyWVwu3NDQ8So+Dvpq6HqcogR9AgwtZI0w9oVVPVA==
X-Google-Smtp-Source: AGHT+IEgRpwnL9+2BYjn1UjqK+ab40fSxMxuHo8PKVl2h8lrY3ULkx3M7dtkhojEPsThVIBzRXZZGg==
X-Received: by 2002:a05:6000:2a9:b0:38a:88bc:aea6 with SMTP id ffacd0b85a97d-38a8b0b816dmr6511542f8f.6.1736517042032;
        Fri, 10 Jan 2025 05:50:42 -0800 (PST)
Received: from [192.168.0.43] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e03f62sm52506215e9.22.2025.01.10.05.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 05:50:41 -0800 (PST)
Message-ID: <cc1f4718-2553-4c49-b1c8-6f6f3bbeeb56@linaro.org>
Date: Fri, 10 Jan 2025 13:50:40 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/16] media: qcom: camss: Add sm8550 support
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
 hverkuil@xs4all.nl
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250108143733.2761200-1-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/01/2025 14:37, Depeng Shao wrote:
> v8:
> - Add correct version number for each patch - Krzysztof, Hans, Bryan
> - Correct the copyright in patches [15/16] and [16/16]
> - Link to v7: https://lore.kernel.org/all/20241225133523.4034820-1-quic_depengs@quicinc.com/
Patch #9 doesn't apply to media.git/next

git remote add media git://linuxtv.org/media.git
git fetch media

git checkout -b media-next-25-10-01-camss-8550 media/next

b4 shazam 20250108143733.2761200-1-quic_depengs@quicinc.com 

Grabbing thread from 
lore.kernel.org/all/20250108143733.2761200-1-quic_depengs@quicinc.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 17 messages in the thread
Analyzing 260 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v8 1/16] media: qcom: camss: csiphy-3ph: Fix trivial 
indentation fault in defines
   ✓ [PATCH v8 2/16] media: qcom: camss: csiphy-3ph: Remove redundant 
PHY init sequence control loop
   ✓ [PATCH v8 3/16] media: qcom: camss: csiphy-3ph: Rename struct
   ✓ [PATCH v8 4/16] media: qcom: camss: csiphy: Add an init callback to 
CSI PHY devices
   ✓ [PATCH v8 5/16] media: qcom: camss: csiphy-3ph: Move CSIPHY 
variables to data field inside csiphy struct
   ✓ [PATCH v8 6/16] media: qcom: camss: csiphy-3ph: Use an offset 
variable to find common control regs
   ✓ [PATCH v8 7/16] media: qcom: camss: csid: Move common code into 
csid core
   ✓ [PATCH v8 8/16] media: qcom: camss: vfe: Move common code into vfe core
   ✓ [PATCH v8 9/16] media: qcom: camss: Add callback API for RUP update 
and buf done
   ✓ [PATCH v8 10/16] media: qcom: camss: Add default case in 
vfe_src_pad_code
   ✓ [PATCH v8 11/16] media: qcom: camss: csid: Only add TPG v4l2 ctrl 
if TPG hardware is available
   ✓ [PATCH v8 12/16] dt-bindings: media: camss: Add qcom,sm8550-camss 
binding
   ✓ [PATCH v8 13/16] media: qcom: camss: Add sm8550 compatible
   ✓ [PATCH v8 14/16] media: qcom: camss: csiphy-3ph: Add Gen2 v2.1.2 
two-phase MIPI CSI-2 DPHY support
   ✓ [PATCH v8 15/16] media: qcom: camss: Add CSID 780 support
   ✓ [PATCH v8 16/16] media: qcom: camss: Add support for VFE 780
   ---
   ✓ Signed: DKIM/quicinc.com
---
Total patches: 16
---
  Base: using specified base-commit 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
Applying: media: qcom: camss: csiphy-3ph: Fix trivial indentation fault 
in defines
Applying: media: qcom: camss: csiphy-3ph: Remove redundant PHY init 
sequence control loop
Applying: media: qcom: camss: csiphy-3ph: Rename struct
Applying: media: qcom: camss: csiphy: Add an init callback to CSI PHY 
devices
Applying: media: qcom: camss: csiphy-3ph: Move CSIPHY variables to data 
field inside csiphy struct
Applying: media: qcom: camss: csiphy-3ph: Use an offset variable to find 
common control regs
Applying: media: qcom: camss: csid: Move common code into csid core
Applying: media: qcom: camss: vfe: Move common code into vfe core
Applying: media: qcom: camss: Add callback API for RUP update and buf done
Patch failed at 0009 media: qcom: camss: Add callback API for RUP update 
and buf done
error: patch failed: drivers/media/platform/qcom/camss/camss.c:2454


