Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD741373C73
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 15:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbhEENel (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 09:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhEENel (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 09:34:41 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC274C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 06:33:44 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id b21so1136292plz.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EEAwP2DTcDHFZQ8vrq3ZegmCl+DiPTDQ1Kerz5xxbXs=;
        b=kjwYrh+pW6qZGMIxZ0oVfQhnh73KD9oz4zhtbSpuGxQMJozmKEzk/jHx+9q71TRThB
         E1xDUFFCM2eU6e+N0loEobFeYpH1vsxPo3W69Q3TGs60eV5U+6aPLLOXaN8v8rqYfxKN
         mP7DPLIrgxHZSZ31SyMJBODqfL4z0x05sHdVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EEAwP2DTcDHFZQ8vrq3ZegmCl+DiPTDQ1Kerz5xxbXs=;
        b=pjPCdJSFDZt9JVj2MN6P3iVAHtjoRTgMSuu8JQ3MywFAj2oKGFengbyWz9kY2sZjBc
         eFA2RZuJ9JTWrHl2cY7Gd1ryI506diuzagB3e1DtZzSjbutzidXxH+XEM2hwx4no7FlH
         d88SFUJu9wIVck0pSeryirXK1j36qVlfneaVB9p1TGdCIFEwS60fkSTzlKwvxVCDFOe/
         sXmSH6bUxdJ76JuYicHUlkaIiSB/O+La1ZFn4xQoL4pQiLT+mgb/5AU9pUJjWUhPEPpP
         WB7DgXg/6j4QVkmrGYXOwBmnLWe4+xwC3fCUWq/nC8YbD2lpBxO9v43i5FqaLwjTdgW/
         ah2A==
X-Gm-Message-State: AOAM530zMDdTm6HdysuQf3lzU6AyZ94P7h+qmEt8OlInrspIGCLs3sVl
        qFbtVFdGZBagZEoMc6fYgvWhm5YvzboywA==
X-Google-Smtp-Source: ABdhPJz5t8isT58EhFTjSFQgkq1S2GMFXUTKHMXtwD1sB54Qj96vnAv1XYXxB+LEGz/4Y/N6GLN3Ww==
X-Received: by 2002:a17:90a:e645:: with SMTP id ep5mr11598953pjb.143.1620221624133;
        Wed, 05 May 2021 06:33:44 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:8770:f856:b2ff:e5e4])
        by smtp.gmail.com with UTF8SMTPSA id lx15sm7013890pjb.56.2021.05.05.06.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 06:33:43 -0700 (PDT)
Date:   Wed, 5 May 2021 06:33:41 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V4 1/8] arm64: dts: qcom: sm8350: Add label for
 thermal-zones node
Message-ID: <YJKetV0HRgyxL0ip@google.com>
References: <1620197726-23802-1-git-send-email-skakit@codeaurora.org>
 <1620197726-23802-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1620197726-23802-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 05, 2021 at 12:25:19PM +0530, satya priya wrote:
> Add label "thermal_zones" for thermal-zones node.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
