Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2304765E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 23:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbhLOW25 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 17:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbhLOW2A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 17:28:00 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E6FC061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:27:59 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso26774804otf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3PYTO04yQIC5YHNsBdFiqJUl+9id4U4H8FrV8FcVb1s=;
        b=Qkpa/dE0mKT5t3tDewd6aK1v41zyUpItLMlOMolU5eHcrSMGLEHMdnrqBTKTpEcoBA
         o+Y6GUicC9bbm2fDgkXn/lHT8gwkDTWgWEJtV+5yFZTcwpbAho8I5vLAFWFBficrIOyF
         IBmNPpnc+rHvqoCA1bF6trvd8hWzr2OktNQ1bWr5AszpvsdtXvm7s5RXR4WTe/HAeMbG
         OzvLAueK7BBmrjlJrgMH3+Xn0Ix4+pBRo6DB4kmKKRWojMMmcKpMOX++BwilKZD1MZJ+
         oemihI9gfArtQeriu7kUeZIJPqBlzcMPtnIjQBPbprSvSuOiExb97BQJcsnO9gWx6Obq
         UDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3PYTO04yQIC5YHNsBdFiqJUl+9id4U4H8FrV8FcVb1s=;
        b=cjlKx/INEsg18J0QmA/LsZOF4MuoW3PBog0p+4C7mRw0NzKnMA9oMRLhhIsc++RLV0
         frODGfiePOOMYmRYZiez7Ob2uT1Rzc1ViDOBZAoXP9h6sjAe7/yksvReXpohER3doVDh
         3lLJq075fIL7fDNzaOMWp2SMkEbEyiDhgSLde7usNtjvq0pw+rMF3vDOdjq0c2ihhTC6
         X02MiTl2n6Nu9ozGQsrpNjwmmRdAmtKmOKYMXXImo5vvkTu9pRlfPC0E4e6ebgdMzG/H
         4PsVxsw6c4Vc07+eDDwApBL92JfBs0R71o4b3P4ATpx40Vg7hj8cnvqW2CwgYqAHaVu9
         jJNQ==
X-Gm-Message-State: AOAM531Zv8gTB/ZQid4BBwlJBwISStWHwJTIeAMM0eJOOM7UFplWc/de
        0Db4MIxPgSVCBTu8BrfkHaLrQEqPaok8nQ==
X-Google-Smtp-Source: ABdhPJyi8LqcG5NjC/2TfkgkVRbU7qZ4bL1AJTM+U2fmATuLdjVml1mNA65VdaPN9gXRvuzjXCL56g==
X-Received: by 2002:a05:6830:1dab:: with SMTP id z11mr10025416oti.103.1639607279151;
        Wed, 15 Dec 2021 14:27:59 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:27:58 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <quic_rjendra@quicinc.com>, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH v3 0/4] soc: qcom: rpmhpd: Cleanups and fixups for sc7280/sm8450
Date:   Wed, 15 Dec 2021 16:27:31 -0600
Message-Id: <163960723734.3062250.5469053671377208589.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1639063917-9011-1-git-send-email-quic_rjendra@quicinc.com>
References: <1639063917-9011-1-git-send-email-quic_rjendra@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 9 Dec 2021 21:01:53 +0530, Rajendra Nayak wrote:
> v3:
> * used the _w_<parent-name>_parent suffix instead of _no_parent
> * Added a minor fix for sm8450 while rebasing
> 
> v2:
> * Fixed the wrong assumption in v1 that only sdm845 needed mx to be
> parent of cx, turned out all existing upstream SoCs need it except sc7280
> * Added another cleanup patch to sort power-domain defines and lists in
> alphabetical order as suggested by Matthias
> 
> [...]

Applied, thanks!

[1/4] soc: qcom: rpmhpd: sm8450: Add the missing .peer for sm8450_cx_ao
      commit: 7e1377712ba2da42edd354dc8da363f0fd68d33e
[2/4] soc: qcom: rpmhpd: Rename rpmhpd struct names
      commit: 8f3d4dd65abd03a5edcf7b5d5a7a3e2a4866db15
[3/4] soc: qcom: rpmhpd: Remove mx/cx relationship on sc7280
      commit: 65e7b31cc48581e32bee4546b59cea404252a138
[4/4] soc: qcom: rpmhpd: Sort power-domain definitions and lists
      commit: 8beb290d17f280f690857897af11dc90ac2e1f3d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
