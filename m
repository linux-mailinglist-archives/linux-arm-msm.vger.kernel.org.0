Return-Path: <linux-arm-msm+bounces-21968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8128FF251
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 18:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1E23B237F9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 16:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59924196DB0;
	Thu,  6 Jun 2024 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JYuTk84F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75CD1953A0
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 16:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689668; cv=none; b=E5nRRpPfiKi4lPmPD+o4DMfbrNbepV2H9ox7SnHKNuxA98kAdAyGmvhHcxcQHWklKMPY942sKoMApQ9rRHyXVsW1a2gaLPKcRilkOW5dnSeDwIWibdg3hU9atcCzkE99oTC5bjoDBUdJ6Cr6AgXzSOvoa3QgRzDBpTU4dNM6Bsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689668; c=relaxed/simple;
	bh=sqVHQEDwVAxjqpqFdMyKgszMsUmj5y9aSsv6Guy/rJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/tfYyu84PAnXUVCN/FBxl4ORHBavFnFLFrG5vp2T6V0OrdF2lnuepIyIHS2qbd6T80lyreJhUYMu9HLhYe66mpeGlAXZ+P/7iwQxk5sYYJ2R3N+dZJCrtS/frkDoRZzSBbj4xpGxWBB7zHDip9WxRAXwQRM1bA5enVCGUPTufQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JYuTk84F; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ae1b32752fso6131006d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 09:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717689666; x=1718294466; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sqVHQEDwVAxjqpqFdMyKgszMsUmj5y9aSsv6Guy/rJ4=;
        b=JYuTk84FY4wVZ61V1rkIolMSSdhpuqsB5A0wznMf/x8TOHU1E7z1NMzXQrDA24zmwJ
         rJUfGF6zSNIPKRUUC/NqyvsZLE4eTlvv8CjeWW3I2JG0FpaoVtvWxh6UeAUGDXUK+B+U
         jVTnXoy7A8Cyf/8dHQMRPrMBEEhIe9t5K0Ho4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717689666; x=1718294466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqVHQEDwVAxjqpqFdMyKgszMsUmj5y9aSsv6Guy/rJ4=;
        b=igNzvVSk4fw0mUjNSDX6XVdd4oHAalzyAimiYhF3l+kB5FOylkMHFKr+ijzRyVEQGg
         Vl1xJh23xXH8ivGVAAFLVzbgm67x6xwzhovBfCgRn8Nd7eAM0zEUEUPfdo/Av1CUcG1Q
         cQSNF4O9VwzZgrR16Vm3M7ar/NTIC2Sbdu7MfPHvLLx6x1j+xToH4RZyKOAk5DXQENGY
         dBp+VaqYbyrgv7TH190sGQSaRxo8zIAL/PU5+8ATWNKiO+V1mdXW6H1tYJB0gB+lBx1T
         gvqcW8VR7yyhzd7W4QEf0iC2JK8BUSNozeb3utBMddks9Vvep8rGP01w3R/HglG3vF6T
         bSCg==
X-Forwarded-Encrypted: i=1; AJvYcCU84/v77HwyLGmM6gNPJf3SCeb3NPJWprL2UIHWlCXMR2wlxo7wvBMLTLKBmn7/P3zr7PlJoLWrsxVxA/AkKd17+bcqCuKgQK9UcXFQLg==
X-Gm-Message-State: AOJu0YzLDVoEkLKG9B75xrtiNjoBA9DZRVhoFMkUtFM0VSNEUeuZdeyO
	0R+/RFXodW4sZII2R1GYjEDf00mz7ZVlkr+kX1KxHPF1Jq/rj4dsH5cQ58Z6Ge1uMfOfd/CVdxo
	lkSDtz0B8QQxLureIKj4TI92ilFPx5dmFiO6o
X-Google-Smtp-Source: AGHT+IFzj8RlanPuIZnlqigaZ47DrvMcpPjFdw9hKo3mN//pDXqRuiPsikMN3AUdLkN/Awqlt/3fx9d96fwFEYXKBKs=
X-Received: by 2002:a05:6214:2c0d:b0:6ad:63c3:12fe with SMTP id
 6a1803df08f44-6b02266d4cfmr71924706d6.3.1717689665559; Thu, 06 Jun 2024
 09:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <CAFLszTjexpNEjo1sGVs67L0CAgGZLNkyn9RGfHRD7iHak_mtmg@mail.gmail.com> <20240605100246481-0700.eberman@hu-eberman-lv.qualcomm.com>
In-Reply-To: <20240605100246481-0700.eberman@hu-eberman-lv.qualcomm.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 6 Jun 2024 10:00:54 -0600
Message-ID: <CAFLszThbe_aUAq_5rCCiPV-bj60oq9UCc=vdDHwM3i6t44ohLw@mail.gmail.com>
Subject: Re: [PATCH RFC v3 0/9] dt-bindings: hwinfo: Introduce board-id
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Amrit Anand <quic_amrianan@quicinc.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Andy Gross <agross@kernel.org>, 
	Doug Anderson <dianders@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, "Humphreys, Jonathan" <j-humphreys@ti.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Jon Hunter <jonathanh@nvidia.org>, 
	Michal Simek <michal.simek@amd.com>, boot-architecture@lists.linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Elliot,

On Wed, 5 Jun 2024 at 11:17, Elliot Berman <quic_eberman@quicinc.com> wrote:
>
> On Wed, Jun 05, 2024 at 07:17:35AM -0600, Simon Glass wrote:
> > Hi Elliot,
> >
> > I am just picking up the discussion here, which was started on another thread.
> >
> > I can't see why this new feature is needed. We should be able to use
> > compatible strings, as we do now. I added a 'usage' section to the FIT
> > spec [1] which might help. I also incorporated the board revision and
> > variant information and some notes on how to add to the available
> > suffixes.
> >
> > Does that handle your use case?
>
> -rev and -sku don't fit the versioning scheme for QTI devices, so this
> isn't a generic enough approach. Patch 5 in this series describes the
> versioning scheme for us.
>
> In the other thread, we had talked about using some regex based approach
> for matching the root node compatible. I haven't had chance to work on
> that proposal and will try to get to it in the next couple weeks.

OK, I look forward to it. Please do check the FIT best match approach
and see how it might be extended to handle your requirements. So far I
have not seen a need for regexes, but it is certainly a possibility.

Regards,
Simon

