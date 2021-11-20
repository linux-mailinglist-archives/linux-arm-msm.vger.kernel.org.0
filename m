Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1383458123
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 00:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237646AbhKTX7N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 18:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237813AbhKTX67 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 18:58:59 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5300C061748
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:55 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id n66so29517940oia.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q4VZXS1JYipWdfxz7aBEgnldhWEOliokBInzVaauV2U=;
        b=LWpMNnWLtF07m+hV2foqC5ZByUH8SHjFDkaKiTkVZlpkLkFE9zuNQa5UGTtRGrGKne
         FgNamNJ6S7DuHSS6rOIZl+3MSVaeVFTUB1CQZcciKwF2aAgvVjN5eCSuJ7C6mUqTTEZ2
         WKSLjfgwOYOlDe74eceED+oPIqm7dzrcUDKDMWS7Gh6JcERUwf5Gs2NZgl6iWOHscLPt
         xIcibSRSd2RvUAcVYpfOUJi4XFLLEk7nt2jdeJJoqECsTDOfGThIsUAr0L7Hz2OYJJ1h
         tHky4tH+SGjMsWez2Qj5/Fod3mK4g8CDk7MxpTGjQIbO9La0q4iDu746yAp3QhWwicHV
         42MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q4VZXS1JYipWdfxz7aBEgnldhWEOliokBInzVaauV2U=;
        b=owoiaP69mryzMV1pE9cSjlFoFWAQQ0O18j1YKXClUmKlot7+C0hAgehNzsJTl9vUJW
         EvcZVy2drGd8rcUxbwDDhJ3hrowO6zziwMmaQ8CL44GQFmrro/16ubzMdol/bhu9o2m5
         g9Pe43t/ubcMRIX8GDiJYo4Tt3F+wbrp1i95OsiOoQCnOfB6cjWduTCojXZF6iwTacoR
         sRVY8G1XRzCVexqne1VVtjAWiv2lkTUP1h5qk+67HxisNzQMau6XrsGRyuGTnb+sv8mA
         cywMFsHU1VfDka/+mXYUA4Kf5QP+i7usaVG6fORR3IwTomJzAUHCVYtPOP9kR7fK0qMR
         WGrQ==
X-Gm-Message-State: AOAM5327lHfosnfoedFqJLuX+l/vIRylUD4aoSORvtolbxOgFX1G69P5
        YYXrwpwK2Bt22+ZElE7987nf5g==
X-Google-Smtp-Source: ABdhPJxG/kDX9vOXIRxtHJC9OE1KrowBcQv2/edAhyq/2tjfHzmquX3exqFx2ji9hCg7JEuIkC/RKg==
X-Received: by 2002:aca:1b08:: with SMTP id b8mr10100307oib.148.1637452555104;
        Sat, 20 Nov 2021 15:55:55 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm828474otj.14.2021.11.20.15.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 15:55:54 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: (subset) [PATCH 1/3] soc: qcom: rpmpd: Drop unused res_name from struct rpmpd
Date:   Sat, 20 Nov 2021 17:55:30 -0600
Message-Id: <163745250542.1078332.12998070951734324678.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211108134442.30051-2-shawn.guo@linaro.org>
References: <20211108134442.30051-1-shawn.guo@linaro.org> <20211108134442.30051-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 8 Nov 2021 21:44:40 +0800, Shawn Guo wrote:
> The res_name field in struct rpmpd is unused.  Drop it.
> 
> 

Applied, thanks!

[1/3] soc: qcom: rpmpd: Drop unused res_name from struct rpmpd
      commit: 7ba9dd0d04a8af868bc0785d79bde4ac0240328f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
