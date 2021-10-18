Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93DE8430D03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 02:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344825AbhJRAQH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 20:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344827AbhJRAQH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 20:16:07 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24EACC061768
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 17:13:57 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id o204so22034610oih.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 17:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=by+ieTTmuyDSriuTe138Ihlo/MV2ONswmXg6TUAPeOI=;
        b=Xk38DdpFgMJxeifcBOeyXsSCv2v4EYFe5zZ7TIy+SRYzc82FReD9CDoVcxg9OfAZse
         J1WBRD1pmDPg6dKMAOd6gO2d/KDauWHBek9iXFLAUsrRHgoOZ1wAjp6Bsi4IwNTAgApO
         69pzrq2hvUJVTNBwHyhIUfkWePJxXFQASRFGp5MJSbeOvPCXX736Ob3LozQ0sHa30bgU
         Czm57Oxk+ViEYhJWXHF/V3aVO/jITn4NW1hapBG8LOqGKGzFu5LStIoz9FDG1Py2kMoN
         IMN0uYHF5c8my7IRzEtxu4rAaRDKtlbjQm1d0VZ2x605vLyvSxeXKhVIXa48Eev21IfK
         9nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=by+ieTTmuyDSriuTe138Ihlo/MV2ONswmXg6TUAPeOI=;
        b=Gi2nMF5dIGOUv4KetI2CBJFjE55Fa3qOw0HtXznLC/gqNoOZiNrCWRq8xCdTJ8fE3Q
         1E3SdTlY1H6S0HhQ+4cwDFLL+bxegwT0Af5SHKgGWlIwSlsneXsNc2UrmIWd6W4bdgH+
         uNfNboyb/9fusI+06HzEX99/CPPukH7lduO4r4jUEWFwXuL2dh7l/o7pVuTdozbdj2cL
         ysFI0IPLeT85YlM9l6JbFOt8rVxXiBO9Y1dDkOiKvemFbjeoXGG55sLRuUrvJc64+qa7
         /4IOg6XzFpdaKUyufHd6a/Y6Y9XCoPFYvQn6CxazPxtKurb9apo2TPTEM82Gu737dITl
         UWQA==
X-Gm-Message-State: AOAM530LES0m8jvWm+KXrjjEf0B8d6lXUzPnDrJ532TsbYlZN5nf+imv
        f88ibi5J3loMT3/pyAefiGc1cw==
X-Google-Smtp-Source: ABdhPJwFcIikHfk/i4pYlpa1QTYFDGW9zMwyoLnJ2/Jjhw98ZeGn2zA+Gb5OkwrqTkGEjCDCj28tNw==
X-Received: by 2002:aca:be54:: with SMTP id o81mr17661659oif.64.1634516036239;
        Sun, 17 Oct 2021 17:13:56 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id l10sm2670189otj.9.2021.10.17.17.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 17:13:55 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     clew@codeaurora.org, Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: (subset) [PATCH V2 1/1] soc: qcom: smp2p: add feature negotiation and ssr ack feature support
Date:   Sun, 17 Oct 2021 19:13:54 -0500
Message-Id: <163451593812.443375.14432148732623995552.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1633450403-21281-1-git-send-email-deesin@codeaurora.org>
References: <1633450403-21281-1-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 5 Oct 2021 21:43:23 +0530, Deepak Kumar Singh wrote:
> From: Chris Lew <clew@codeaurora.org>
> 
> This patch adds feature negotiation and ssr ack feature between
> local host and remote processor. Local host can negotiate on common
> features supported with remote processor.
> 
> When ssr ack feature bit is set, the remote processor will tell local
> host when it is reinitialized. All clients registered for falling edge
> interrupts will be notified when the smp2p entries are cleared for ssr.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: smp2p: add feature negotiation and ssr ack feature support
      commit: 85f755083b23b1ee59c96df80f148e6203bb078f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
