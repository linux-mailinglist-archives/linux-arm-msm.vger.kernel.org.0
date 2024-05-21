Return-Path: <linux-arm-msm+bounces-20149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CDC8CB3F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 21:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C07B7283773
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 19:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB6814901F;
	Tue, 21 May 2024 19:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s4ji7tJl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F85E14901C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 19:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716318018; cv=none; b=gaqj3N+CpqJGBgucLm9JR06MjItjvY18liw4NqM0DlpI/G7RjgAT2/754AHmAXLjy3Y/XZYb45BUZ+bebFGF+9FCvrNtV3FmDGVc5jx0+M89zzYeVA/n8TLDwU39QjymI1nuo5PM3EN5Qws2yir6WFPo62TXXg5CI63EAi5iVL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716318018; c=relaxed/simple;
	bh=Y4kAtq2u27/QT2c8cc/6K07/xzsH3x5mStJNRe+bsuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JrPAVy2D7p1jzTZb6pVKVCt17lTdBOGiv1OlK9h4/d8XXThC8tqQRJ6qq1CnUfTwBzyylbxZCjLhXuwO00PCWqCq/358WzvyGbQVl0goRDqNiLtK/NPweyF80sQMdpIZWNf+oaV2fs/nDB/5LaOI5ZWsAq44Pam6toLibNwD3uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s4ji7tJl; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-61bed5ce32fso41682757b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 12:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716318012; x=1716922812; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j2dJjZszZabWmG8eK2HsvGgJ24f0l3khGbuW2IX85+M=;
        b=s4ji7tJlWsBErxZeYCRwjlB3Yy3Zr5QJ4Szh/wABWXAd6SXldYAMdjwQEJ3T7t/Vhe
         MCJkIZB3d4hwZthWdwKQkFqb2WsGrBG/GqBfWumO3v/6HV9x0LphdQN+mTC3EzzN1een
         BchVlQ7JazH//iMi3lv0hDZtEy54ZT7Epdeaccp/8ZPwxWwHsZSdgiZ2L36a8oXYC6j5
         kimjUpeCR6c8uyJ6CkEoNbkdE+Vp0M/tnJ0W+1NVnVxZDX84INlKJ/w+B/XA3zcKYPJZ
         T+E/Ks0r1Byodo21owCGqQgSo5UXul/mLaKF8iPNmauCIWieTiZfSSkcZVN09myjc4i2
         NqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716318012; x=1716922812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2dJjZszZabWmG8eK2HsvGgJ24f0l3khGbuW2IX85+M=;
        b=cF+jGo1jVLgAnSwOlEj/OpY5PKvgu0JSkbDRfZ3L1SGk3QN6gRKKdD0ofW1lK2HgfT
         iBXsFFkJb9pzMPCThPMDkBIutH1Ri90WP+UC22V4cE7h3x7j6ZIe/AhrclCVprTWQArM
         KXlBssKmj5r53PM3TFhzHXHP9KlMPevpC8X/NAF4CInicvNyEWwhQ6fC+xalZUrezF1J
         wGpHzyG9aT0c1Va3/bCIF45MtrtNpIuMRYZ5kYZT87phQI1qaHmNBHtEokkEFMAHIN8P
         +Zv/IMEsbV4wp1jgquUvy6JTXVwbhAXMg+tv8+Q/7RNVJ7Hpqqn5+99ildDORBQzQGo0
         pnPw==
X-Forwarded-Encrypted: i=1; AJvYcCU0UnmnfZOvUCAwP/0SN66uIk1c4b8uGTpK7UCn/YuW1QE1WbWJRU1JiP53/ZDDt+uoEkLS/k9vWBZEHg3pCqsggAZEZIYb/6qhcIu/Gg==
X-Gm-Message-State: AOJu0Yyuev4eCYzLuAmNMJjYsBS3IpScI+85CXDW6QLk+qt4oqN0Xc2U
	ABXsSROSaDpoRAnuDLam5JiTchDSjdtmwi9K83R9PmMX7suSNwYidIprUmT4qmHantJL3cFwEqI
	30c61v4J7hvxfXLSV/u58k9da8EgR2NK/ko2SXw==
X-Google-Smtp-Source: AGHT+IHps+GRz537VGqn9WNMddSpdygBCzdOT0qoyGTzMRpEmepGJPUIo/0kWhUJl0kN5U1agql0O+39Wkicam0iijY=
X-Received: by 2002:a0d:d78d:0:b0:61a:d2a0:5497 with SMTP id
 00721157ae682-627e46aa110mr79027b3.8.1716318011734; Tue, 21 May 2024 12:00:11
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
In-Reply-To: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 May 2024 22:00:00 +0300
Message-ID: <CAA8EJppYmVMmhgLSiSEGA_r4hFbQYriOLjNK9b6VXUYEYiZ6Zg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 0/9] dt-bindings: hwinfo: Introduce board-id
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Amrit Anand <quic_amrianan@quicinc.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Andy Gross <agross@kernel.org>, 
	Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	"Humphreys, Jonathan" <j-humphreys@ti.com>, Sumit Garg <sumit.garg@linaro.org>, 
	Jon Hunter <jonathanh@nvidia.org>, Michal Simek <michal.simek@amd.com>, 
	boot-architecture@lists.linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Elliot,

On Tue, 21 May 2024 at 21:41, Elliot Berman <quic_eberman@quicinc.com> wrote:
>
> Device manufacturers frequently ship multiple boards or SKUs under a
> single software package. These software packages will ship multiple
> devicetree blobs and require some mechanism to pick the correct DTB for
> the board the software package was deployed. Introduce a common
> definition for adding board identifiers to device trees. board-id
> provides a mechanism for bootloaders to select the appropriate DTB which
> is vendor/OEM-agnostic.

This is a v3 of the RFC, however it is still a qcom-only series. Might
I suggest gaining an actual interest from any other hardware vendor
(in the form of the patches) before posting v4? Otherwise it might
still end up being a Qualcomm solution which is not supported and/or
used by other hardware vendors.

>
> This series is based off a talk I gave at EOSS NA 2024 [1]. There is
> some further discussion about how to do devicetree selection in the
> boot-architecture mailing list [2].
>
> [1]: https://sched.co/1aBFy
> [2]: https://lists.linaro.org/archives/list/boot-architecture@lists.linaro.org/thread/DZCZSOCRH5BN7YOXEL2OQKSDIY7DCW2M/
>

-- 
With best wishes
Dmitry

