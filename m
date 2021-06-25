Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C51B23B4697
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 17:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbhFYP3T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 11:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbhFYP3S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 11:29:18 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704CEC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 08:26:57 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id bb20so5644056pjb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 08:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EBU3GLAC+a45xt1yxWQOeqLDSsSmayxggpNRfZ40lAk=;
        b=S0wxwt84pNgekCQbFSoavTEgRtyZ6KZkDtvugyJNNmYSg/QGUSbKsoeMKSAC071Rzu
         3OlPOyjt22AcDFzEypkvtzSriXD9cRGUdgwVzPe1EacwxDZsSd/7w0saOKVzblZNWMEK
         mFTGe7qSS/LA16E+SVeSa97hDRLU5a7JvW0r8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EBU3GLAC+a45xt1yxWQOeqLDSsSmayxggpNRfZ40lAk=;
        b=N+Plbw/sViKlLv04+OIorIFhHfackzZ1NzngATXhgT4VA0UvtryTN+1YxiW0ee7FL1
         cwvOjMwhwIUn1i5jtobDR/Kqxphb+iw6+1SA89v6RqAxHfkWKze3F/PQRw4Ewx15niX0
         ZXDjyZK5lE3mB9MNvF58V6CQhGIegcReCUfIAgV2PDJwol+xtEQpckBIKd0SN58vYq07
         vibT7c/r88z5rtXH4XSmGyoCiI+HRD0JbXkvlMB74bZL4E8hLji0/NrubSTfFJyjgvsa
         yz4vYbsVqEeb6hUu0TnyDLe1RXxRKMwUbdSgDxILwvfnc4WWR5qEep3J1ly+Dft0OPiw
         K/jA==
X-Gm-Message-State: AOAM533u0eFXntMN2SY+h6ZMTrGgUPzwkCVF1MDaOX/SuxRqf0lyI0hq
        Q/y1rs8kZgjpv21dWdUVP5p8pw==
X-Google-Smtp-Source: ABdhPJyW6iBUqYLEGCxq+VaEpd8j8/5xQuB+q1+7bPRZWeCnpkKIMs2kPLymnkrotgdqg3SR7s2Sjw==
X-Received: by 2002:a17:90b:4b07:: with SMTP id lx7mr12131737pjb.158.1624634817024;
        Fri, 25 Jun 2021 08:26:57 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id g8sm6031069pja.14.2021.06.25.08.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 08:26:56 -0700 (PDT)
Date:   Fri, 25 Jun 2021 08:26:54 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, dgreid@chromium.org, cychiang@google.com,
        judyhsiao@google.com, tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: trogdor: Update audio codec to
 Max98360A
Message-ID: <YNX1vvwHfCkZHyaY@google.com>
References: <20210625045010.2914289-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210625045010.2914289-1-judyhsiao@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 25, 2021 at 12:50:10PM +0800, Judy Hsiao wrote:
> Use max98360a dts node to correctly describe the hardware.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>

Confirmed that this matches the schematics. Apparently 'max98357a' was
used initially because 'max98360a' wasn't supported yet in the kernel
that was used for development and ships on trogdor devices (v5.4).

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
