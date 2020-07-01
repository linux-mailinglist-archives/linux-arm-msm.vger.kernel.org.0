Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63411210EA9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 17:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731931AbgGAPI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 11:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731845AbgGAPI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 11:08:56 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B84DC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2020 08:08:56 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x3so5593666pfo.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=r//RURoO3TnB3wTz8mwe3gfHxqmQYWwVK9iwzBO1A80=;
        b=UO8tTv46sKsUUVWPDwHcDgy4ubT579oFxF+ACPnaKkPTqHrHqlrIIsdao1sYMGriZ2
         IyR0/1tFThmpImSrIF0wLRAHLfL0ADbk5GXoyYXl5tml6omd9DrB6qbEBmOvltPHmqlV
         OrcuwgBj3IcMBg2pIX/SCjhXT7cklFQpHIV2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r//RURoO3TnB3wTz8mwe3gfHxqmQYWwVK9iwzBO1A80=;
        b=pLsjUjTl0Ur7AmCuyQ83dJhBQ6GZ4O4ILUaNldnDV2SIWSBk/xxiVgiRm6ydCj9vW6
         acU92y7Bymv38TAJmP7THjXNiAmWbsekSRtzteTbNgYqADMukTF4J9CNE/ugVHryiSNr
         gGJzSbpogoXJCCJ4cZPYhCUklQYhZBRoj3GkL1v03jkVJIWBJjIPuH7JFMMq0vbm9bTi
         iI7+HUBvIgqfnAab7W/6RUt1DhN3ixWPTQYyt8cYgUwfCk+C3PU5rlkpmZQaXd+zjF3Y
         Jl/uBhRXWjtkBYZtnfH1IH2lBrdKif32GQ44E+B6LIvAPhyETgCuadnAvIjDodhpCUQ2
         vi3g==
X-Gm-Message-State: AOAM532EZ99u8MY82dZZWYyJM65pmgFSLy/FbtVx1IwvuGpGMP+Kt4ss
        lDFoWka8ulLIO1qKsoMWZe41mw==
X-Google-Smtp-Source: ABdhPJyUHWfSn4p4nAusnO2St4+eWaSv2zhKgithl7JoGjHXORjuhCmtCWuk9nCPfc66aRvEn++/ww==
X-Received: by 2002:a63:7c51:: with SMTP id l17mr20058757pgn.303.1593616135540;
        Wed, 01 Jul 2020 08:08:55 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id g12sm5965952pfb.190.2020.07.01.08.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 08:08:55 -0700 (PDT)
Date:   Wed, 1 Jul 2020 08:08:54 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     robdclark@gmail.com, sean@poorly.run, agross@kernel.org,
        bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: sc7180: Add DSI and MDP OPP tables and
 power-domains
Message-ID: <20200701150854.GN39073@google.com>
References: <1593518176-24450-1-git-send-email-rnayak@codeaurora.org>
 <1593518176-24450-5-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1593518176-24450-5-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 30, 2020 at 05:26:16PM +0530, Rajendra Nayak wrote:
> Add the OPP tables for DSI and MDP based on the perf state/clk
> requirements, and add the power-domains property to specify the
> scalable power domain.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
