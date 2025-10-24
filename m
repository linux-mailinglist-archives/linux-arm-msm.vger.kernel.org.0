Return-Path: <linux-arm-msm+bounces-78711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D7AC055F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 11:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BCAE04FAD18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 09:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0A930AD11;
	Fri, 24 Oct 2025 09:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VlHyK+em"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F054530AD00
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761298547; cv=none; b=Iv//piVEFkKhGEZe8SRseKsc65pfALOE9vn/X2M46//1n4kNcRTY7HtUM2rcFf7l8EFkx6hhHOWoS/9D0DREkQrhdpz7TtJ8DHI1WqB6T41qBd+g+byMbuuaYayiudEHFxo2GkOGeg4cZ0HPrC1fU+hudxzm63rE8BKP2F9KyiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761298547; c=relaxed/simple;
	bh=YF/Tuce1/PBDE/RLif9qoc3I7KnbC+rz2XO3hZz7PWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YarPqyLSWjjO9iFbASD7m0y6YotJyVbXqU6vITAkxbt2CLypVF+ilE6lRjBvehAwYQ4ppNykzNYWzoipzOSzxQhLwgPTPU8JP2EkYsMqfnzUT62UlqiQqs4KVOC/HbzxYBjXEMIKZJzE6E52gDQvPJ+jO4g6+bvtpY/nQQMiACo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VlHyK+em; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-471131d6121so14290505e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 02:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761298544; x=1761903344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AB/k9qen5oHRYzxzAm46DDJjbnbfjworTJj23CLgdeo=;
        b=VlHyK+emmwMfvapuuSYMFXJVIs6lLgnzXet7DP0pcMYXKhEY1qILsP9XEQ+BWjy984
         nCDHPqF/vAaJxuMCAvuyRKKy829PTN71Hwuz5JKjz6zaLMqk5Cdshxb4rrUTbQ/1RGu4
         bZFCa5gNhHGW5iGvkd88lXsJbwkhnIDii9cE10hBk/DEb3CapDvWYFug4jQdWZbpCa2C
         t0GZnSc3LFhPFI+sesvjPXpUkjh8cr8inHd0bHt7UphV/IqOjBK6Qa0TGgoZOaI9mpYU
         Ng4BZ6kxfdTo1c+TDOidZsBol6XWXvF5JN6qaG616NrTK8b+d1cflFmG9NWeFztV28io
         nxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761298544; x=1761903344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AB/k9qen5oHRYzxzAm46DDJjbnbfjworTJj23CLgdeo=;
        b=o7y2SrW8hd6kUb6p18Hp7ey81XC3MPzFxCVHUGHROEiTgfeGmnD6kKBTV0FFypukWn
         W9kNykbPCCbjfc7DUrzjMrvLpIa39EzQ6+asVGNxB1JNx21jStRdy9vnEQqw9soNM0/y
         AldJhQWg8alLoFUuho+DQlEUYZ8kRTW3dctU5sv4E+llbT8Ubxo50IQ8q5kwt+++3uEw
         mpEiSILlEkY5/gB/aG9eg1Xs4W44IDmUKC1MmyS8mVBqYdZS1Wr++XYsL6cuTnUfOjdt
         LumKiO/9Bn4G9dyV7/vSHpbiRDYjB0vccr+Bp+ArzLYtEZLv0NdAnL4JXlXsp3wOlqjF
         JYHg==
X-Forwarded-Encrypted: i=1; AJvYcCWi2uTNfqZaCMMJGYdrV9uT9ei0fu7U0gOU7p/j5mUz+5CBIihcDr8MFIunjju24mOSNe7MHqfTEg93WqBZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzGxiMLaj7ivBr+C8+MdhV5vpUcfAG5ORzMlsSXfTI4Rgi1iNTG
	njAXecaMw/GywvqdtPabVobzTbSEb+eD8wsN/SRmycHAiGEn86u2QwQzXAuRQ/QuQ1A=
X-Gm-Gg: ASbGncvJIh55UoLR897A0J1bIlnfSyrunORzw4if7n7pL25BERAAMQFfHFHQ0Li+qud
	CqnuLW/89+a64Kk+abN564zZ0VkyxrBrTGkqbKJXGvGkCmzYoEEi6cR6jp1szOjJ7zrdPHLQQLl
	i3nGJ9gEpzJ/NWCJOVSEVfJJSETHXzAzsS27b99k5j02WYS+BwJT/kWj0afL0pM+Rs+yGVa3h2S
	47HQqNBRXaAJvwBn0lB2eQ2AzSPZaueRzQHGTblx7sp17ApZGfMrwYyI2ODRoRm5aJaMZ8qp0Gb
	qJ4J80GTxRLHK9sjcESxnZ3WYq9oFOfW5hLm1k+ohhTtSFFmh8CevBmDfRZlrgWBg4tZbw6e6zi
	/6DlFYJETUwgv0wk3o1nZEbE2Ivor0cd6pOnWhpE1zuqeaWDUT+tydcjbR6D+xW37njMlfrk+Pm
	PafBLThhc=
X-Google-Smtp-Source: AGHT+IHRT52qQLwpA4jCp3MR4MfEo1yVX3RPrxX/jF6DxckTinvzFxcrMGMBTx8wXfnTIC9O4HZnjA==
X-Received: by 2002:a05:600c:820f:b0:46f:b42e:e365 with SMTP id 5b1f17b1804b1-4711791dce8mr207186725e9.39.1761298544170;
        Fri, 24 Oct 2025 02:35:44 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm84581855e9.1.2025.10.24.02.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 02:35:42 -0700 (PDT)
Date: Fri, 24 Oct 2025 12:35:40 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
Message-ID: <urc62zk2xlr2rka2nyyjsovql734kuzzphyh3hjnssivgswgbh@sjt4u7wumwlo>
References: <20251013-topic-x1e80100-hdmi-v6-0-3a9c8f7506d6@linaro.org>
 <20251013-topic-x1e80100-hdmi-v6-2-3a9c8f7506d6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-topic-x1e80100-hdmi-v6-2-3a9c8f7506d6@linaro.org>

On 25-10-13 10:55:45, Neil Armstrong wrote:
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 2 DP + 2 USB3
> - 4 DP
> - 2 USB3
> 
> Get the lanes mapping from DT and stop registering the USB-C
> muxes in favor of a static mode and orientation detemined
> by the lanes mapping.
> 
> This allows supporting boards with direct connection of USB3 and
> DisplayPort lanes to the QMP Combo PHY lanes, not using the
> USB-C Altmode feature.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

