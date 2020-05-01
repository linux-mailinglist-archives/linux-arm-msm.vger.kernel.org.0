Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14EF01C17D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 16:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbgEAOer (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 10:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgEAOeq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 10:34:46 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28BE5C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2020 07:34:46 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id g35so3816869uad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2020 07:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OafIZu0wl5yq5qjn+apPMv+CXZqAeKvj/lS9W7KUmfg=;
        b=bSkRbiyeyKlAUXC/Tij0LYdPA/GCDrTqy+eOsvg+0HMnmGzomgcFgIZwMrkFKKVTFx
         rY8tpU0oqwWB6Dgr1WBXsWo+XG8OHxSQyZFNutZh6UJLWPxJ5JTiiUQc32rVT9J+WYwK
         FlXoxI2nbxZJsuVKCqKMo1d+Br/kZKZFVpkOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OafIZu0wl5yq5qjn+apPMv+CXZqAeKvj/lS9W7KUmfg=;
        b=uUlgL+gIZhewPdUxfctpRudqLdsJ8kWxpix153JSE3PNqc96oNxVmPTIs9xI4Jl5js
         V6yI1nbgg2FDSdpWmKs3/wZiF83ltWjV65WS7OEDgvespf6js0eLCo8ZEaO0JYzCXAE/
         GJWsZ/kzrzXCY+0sRe5NqW1G8xobynGsdCR6cmJBHkK6lxPbv85ZwwQfJaNboMo8U7de
         an1jOlrdw6Q+hErmY9JwA02bxM4D9vqLkBIPTutdb2xtS/3snCl5CI9nsskmzgoknjnn
         k3v3cDfnYNUC3SlAt2QVGxEVcGzhIukgg6KwbzIaCLO1TeySd8SnElBbEBoLd1l/5cuO
         vYLQ==
X-Gm-Message-State: AGi0PuY++/t23OMvu0q8leKfWizJXTJttXvP/Lw6lVZVTLefqrVCl/q5
        pfu2PMcsLAitPBmBjbJTQZSEkbKbCHM=
X-Google-Smtp-Source: APiQypIfGHZs9yDVEBH8K5Xv2VA9WYVF2KpLk/w0/vWva9Yd81uSykO0a86fJW2YtkZt1sD5SRmKbQ==
X-Received: by 2002:a9f:372e:: with SMTP id z43mr3030783uad.54.1588343685053;
        Fri, 01 May 2020 07:34:45 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id n193sm825248vkf.43.2020.05.01.07.34.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 07:34:44 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a7so3806714uak.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2020 07:34:44 -0700 (PDT)
X-Received: by 2002:ab0:b13:: with SMTP id b19mr3050483uak.91.1588343683637;
 Fri, 01 May 2020 07:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org> <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 1 May 2020 07:34:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X76J9FAwtx4-8pjEkEqSo=2rz4Wv2ZR6c1Zps21b1E7w@mail.gmail.com>
Message-ID: <CAD=FV=X76J9FAwtx4-8pjEkEqSo=2rz4Wv2ZR6c1Zps21b1E7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm-smmu: Add sc7180 compatible string
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 1, 2020 at 3:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch simply adds a new compatible string for SC7180 platform.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
