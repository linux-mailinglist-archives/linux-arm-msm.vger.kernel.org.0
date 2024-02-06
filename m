Return-Path: <linux-arm-msm+bounces-10022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C8C84C115
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 00:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 760D71F2148B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 23:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1A81CF98;
	Tue,  6 Feb 2024 23:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XJj13Rr1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3421CD39
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 23:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707263756; cv=none; b=uLb8qt7uiv9T4dFLXmIGhmlsOfXjT2/kKxHaBUB4g+oleOTwsbPCp0ON2TXX8dcHqc/RX80Vhm8J9xhavjAeqy0G+U6AhxBQlrvuemuNXLp7mWug8IJNm+5ewiXGn5vzXX4s4tIS4oQdVgV2PixoSPwgQGVnA+sPikSHUamDmDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707263756; c=relaxed/simple;
	bh=u0+U+SZx2w6pb8yMnsy3CSd5G/SWbrq5xPVhC79TTZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmZnPmNZCpMq68NuNCgY5Fk5zZfN9emBG5hSxHu+V3odGO86Fl1f96jmPd37nX7I0FWJUdwL6RjwayEU+K+P9H+JhRvEwkkPTM7Jv8/GkFLmNU5WGzUprY55Nvv2kZ2AWkXh9lULiIVix+zMm3vFTnkzM7idsC35ypts8XrLrDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XJj13Rr1; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6048313efb4so648167b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 15:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707263750; x=1707868550; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DtOrymEAdfT98LBNA0k140e2ceLpyomhr7hhmTPTgGQ=;
        b=XJj13Rr1oL5Rvei6RC06qnapIN1soQyz2XhKLC4l/XtthCUl9nnJD3PF4pDUPj6MyI
         2PpjeQ6ghTtJOWfPRA9Ro2I8+Iujp78zbCLLdFL2Ict2gdg8FzVI3paeA1fYkkUIBfwy
         S4elsTD3Fn2ziWSpr2ypLRK4l8vofCNORR1Z1k31rSKK+g5r8HMV/t+tUdJidW9E5Msx
         EvNKlELxNFWMhiv+m/8RQojbp6/C+IrxmYbQ9CaS16v1sdyl0a0Td7EiYWT6fA9k5oYu
         cUYhdGyMNNzIYPLcU8l+XV4wcGE2cvFu0kn8PLSRQoleHVtpZr7YKgpYLFlXWo0JAF39
         rt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707263750; x=1707868550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtOrymEAdfT98LBNA0k140e2ceLpyomhr7hhmTPTgGQ=;
        b=g/YqWXuWRTOqVLfrLQ/FelGbB/inzzlOrEVudZ6T7CYihg1Z38YkQzpmN26Kbtrkbo
         YFkuA+0vqbgzzXHagFocMFSR0Xh23TeAdVtZGsPmH8SAgVeXdKcF+QEznbICyMzH6nJC
         tFyjlyu5Ah6RT1BdKsjlCuiHHm5Ps/w041+/KxT3k4ExQZUyvtV4c87tobVGr0OM+znl
         SoLDh+emFqkYmfROOHBbE/XXwYUR5qpH9pKMT8J8jJ6nMZo1voPGasf43wZb9FUkNjf6
         XTXSi4L87E+etJs/koPajLeBqHRw0h7yhR5IP7nxBktugpwJysn8j4xOOeTbUwWNJBrr
         TFOw==
X-Gm-Message-State: AOJu0YzXVaF4gIEhjn4RYeNUZAkjhRHgBF7ZONbTJz2dnceM3T67mFPG
	5/zI5KAXkAOQjn6LGPxOIvyKSDmbcbFmod6RNfZImlRa81ZPRebc2/1dWrCe6VlCXo+v6F0SbuN
	NKdD5yNBcI9K+Tw0KYgb5K4anstdrRDpZ6OLw5Q==
X-Google-Smtp-Source: AGHT+IGISuFKG1k2BfAulBOJpI9EmvTpxTlFZrpNuJJtfFGYhSYF/J4K/1laI4Q+IHu9l22ZD8TtE9ZK7QeYlyatSnA=
X-Received: by 2002:a81:f10e:0:b0:5ff:828e:20a with SMTP id
 h14-20020a81f10e000000b005ff828e020amr3418024ywm.48.1707263750656; Tue, 06
 Feb 2024 15:55:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org> <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
In-Reply-To: <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 01:55:39 +0200
Message-ID: <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] spmi: Add support for multi-master
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Feb 2024 at 01:34, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Some newer SPMI controllers support multiple bus masters.
> Such a master can control multiple slave devices. The generic
> framework needs to be able to pass on the master id to the
> controller-specific driver. So do that. The framework will
> check if the devicetree child nodes are actually bus masters
> and will register the devices for each master. The legacy
> approach will still be supported for backwards compatibility.

Please remind me, are those two actual bus musters driving a single
bus in parallel or two SPMI buses being handled by a single device? In
the latter case this implementation is incorrect. There should be
multiple spmi_controller instances, one for each bus. Allocate them in
a loop and set ctrl->dev.of_node after allocating.

>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/spmi/spmi-mtk-pmif.c |  6 ++--
>  drivers/spmi/spmi-pmic-arb.c | 10 +++---
>  drivers/spmi/spmi.c          | 76 ++++++++++++++++++++++++++++++--------------
>  include/linux/spmi.h         | 10 +++---
>  4 files changed, 67 insertions(+), 35 deletions(-)

-- 
With best wishes
Dmitry

