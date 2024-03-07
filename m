Return-Path: <linux-arm-msm+bounces-13588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F408874982
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 09:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B31A51C2163D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 08:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26166340A;
	Thu,  7 Mar 2024 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yabwS6aa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1B62A1D
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709799870; cv=none; b=UXMi96lnCNWefKzS1XHhqa5APqm+oy9Ctf8C5UwAgvqay1ZhG58QttoyOqxjhDu4Gpa83IbsluEu4Oh+AEsecKNkSdKImSdPJvPOYXDja+wV4ZUAKvjM/HLEniR+Q3hq1SWfPnezO6kgIchzzlKnKszdHL8U0DtFFbGnUaG5enA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709799870; c=relaxed/simple;
	bh=HwIOtDxBs12zJ1pvutYk5Ifex95KRtN8D3N43+ZcAH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BvjJNMPLGPa7f4p47dknRtGLBtEI0JrUHJieacTK8IS7vU0cFvYGGyCEWS4fprgg0S/VSNTDAc5LuIlcpFLEbXmV7JCRaPxA8QSiNYtSekl9YQjzl2HZ+9fWOUCTh+2cAGU2t88qXJjOpIPqwZrZMfclBXqcyth6nS067eET2VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yabwS6aa; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so596357276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 00:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709799868; x=1710404668; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HrWzrMUBdT94HiU9dUcTPoeH7WMZ5J8gNIFhjinA3XM=;
        b=yabwS6aaXCzgGvFibIinRm8ZSwvAXOfLiefILhrE84G1GObiyJyukOfnwE+z911cHk
         t4zrC+KFZu1EGcn8gE31PLQpt0Li2WToMHv0joeWB2CGdSmkWNIZUuC409nIA1l+OlpN
         ldQfWsQbHl9p9UzrEz0gjphgZZxKDrgb8fh0NwJBkWxSp6v4Tn4J02Rltt3M3zJ8AR51
         Ll9fO6vhKwvxFzivk7IEkiaHCa4MWBx56DamQ/1PcnOnYBjcpROMhN7CxIMrK2dOCFBy
         97XXU8JU5aPN4luq4dXqrl/ZtwC+yelVyVPcvwQecB6eAX6SysAMx7sJpnrjQHkZpdkr
         ruWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709799868; x=1710404668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrWzrMUBdT94HiU9dUcTPoeH7WMZ5J8gNIFhjinA3XM=;
        b=sauzVdUKKrLR14NrQGAyBDSP0g1EFnUVBny/+fAIsdLtP6gdXaYDbK6UVJQ3M4M7ta
         kpl2QMW+4aoUn4e9ys1gJz7TGyMRIPvIWJIWmcneE3ExhahVT2sAvH6AILNmBZidU/9A
         M88ggruXwJ82ft6hCH2a6VKSEglBi8HU0WE92GgcL/nxJugso37lvR5kKn/M2PIzkLzN
         f+lbEwWTbVvd+4PhCEiqb5UefwSfj5E2uJm3Ck2k2cxO/qHfeFgL5iks0egHWx/w+cMS
         t6fDwmkJhZx1+7UB15F7q+86G84EQpv1QlGXtCqaceJHn8N5UrBSozVXCyZLm+oUdU4W
         MhFg==
X-Forwarded-Encrypted: i=1; AJvYcCWFgBejYqG7J91tt6P4kakgYTCz4u7TAP4zTDmXPVZBL2Bdud6WPhxzCIV+tkO81Bn22mcBs5DeHiDwpEFK5oPJKb0tuYcIAqAHdVZpBg==
X-Gm-Message-State: AOJu0YwMAno5FF6fHPBeg0AZYYfjuQWfKMbPPFR/BLKskooEiK81O8F7
	IY71w7q8VRToa3ci2jdZm07Ih4mQBJp+gpseeGAfUnnAy4jpyqS7qQq6K3NELVpycZA79FbL8BD
	PMpnlrHEY8SDXlm+UV7C0DTcYC3byOb091nOkwA==
X-Google-Smtp-Source: AGHT+IGo9lHi+LEb+DS8+PgVMTubJMqAp8Nr0DkwjG6EMkEJSTxocKlvC0xiwUrwFMIXHE/XWrup2AjbpmgQzZTgH3U=
X-Received: by 2002:a25:8a08:0:b0:dbe:4f15:b5cf with SMTP id
 g8-20020a258a08000000b00dbe4f15b5cfmr14221787ybl.15.1709799868120; Thu, 07
 Mar 2024 00:24:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215103929.19357-1-quic_riteshk@quicinc.com> <5271ebb4-68e7-468f-b1e0-b35a77f53902@quicinc.com>
In-Reply-To: <5271ebb4-68e7-468f-b1e0-b35a77f53902@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 10:24:17 +0200
Message-ID: <CAA8EJpridDoMFRTo46n6dqvm1Lu8Bxka2S5AD97JjXM_6WhCLg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] add display and panel on qcm6490 idp
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
	geert+renesas@glider.be, arnd@arndb.de, neil.armstrong@linaro.org, 
	nfraprado@collabora.com, m.szyprowski@samsung.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, 
	quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 10:20, Ritesh Kumar <quic_riteshk@quicinc.com> wrote:
>
>
> On 2/15/2024 4:09 PM, Ritesh Kumar wrote:
> > Build the Novatek NT36672E DSI Panel driver as module and enable
> > display subsystem on Qualcomm qcm6490 idp board.
> >
> > Ritesh Kumar (2):
> >    arm64: defconfig: enable Novatek NT36672E DSI Panel driver
> >    arm64: dts: qcom: qcm6490-idp: add display and panel
>
> Can you please review and apply these two patches.

Can you please read docs regarding the kernel development process?


-- 
With best wishes
Dmitry

