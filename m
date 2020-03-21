Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A412718E502
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2020 23:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgCUWIl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Mar 2020 18:08:41 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40574 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727700AbgCUWIl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Mar 2020 18:08:41 -0400
Received: by mail-pl1-f194.google.com with SMTP id h11so4118521plk.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2020 15:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=nIofFguDr7Ltn+f6bBe8LL67edLfSLV7lBXX5mVoxYg=;
        b=Zzk/6hitFPzGvWafKvotJLpoasNwk069kZidVNohZ71zksbQLbe4cAILxBO3nRIAIC
         gs3gPgrz+RzyHaiJjVVkTJ+33p6jcju5vyRJqFEAbZBZVXMS//IPHojORjKWRfhoqdVa
         ChpyHQPH/FBGjmuy3gTGmmGZIEITADWUFsuzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=nIofFguDr7Ltn+f6bBe8LL67edLfSLV7lBXX5mVoxYg=;
        b=qKVa+5HrQ6EellWbtxLu8S+3eULPj0ous83+PW3MLD7biYoNnb4TjQ+uuMndGRQ7mP
         lQGxQmzejEeEjYS9v//2NJEG09PGsk27vpqGFMQiU+FMrD1LmUKCtlQc6eDuKHIP3xWi
         GWEbG2ux7sDj4Yuiyz8VzRHB06Dc8UHPAn7ENsSY1mvN8vcc03/CX6C4ilr3F7JThqyb
         7/qRc099tIhKupl7SsvjJ38IgPbXUBGJc50p7b6eeuusCGLmbIVb4DfGEXy25x/u8ozU
         W7NOCTyFQja5/Mt5Fw9phtEhCgtPXNzpBuOKwTR0+KTBzqViCUdhnOvKdIHUYF7YB5Ya
         w60Q==
X-Gm-Message-State: ANhLgQ1bPSXNtrLHxNW77FN+EzhASbu1dLKDsUIsPfUyDN2kLj0BgeEr
        Po/SN0TFNMk/+SUnj/7yzPZtIg==
X-Google-Smtp-Source: ADFU+vuyjvfGK9PKW/a1GeddzdjEG6fKAd4IDpxdIIXvp2pktn1wD0MxRMPSQoRKiCy62a2RMchHVA==
X-Received: by 2002:a17:902:8f8a:: with SMTP id z10mr15252641plo.169.1584828518566;
        Sat, 21 Mar 2020 15:08:38 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f8sm9086672pfn.2.2020.03.21.15.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 15:08:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <07a6b272c6e71e0e480f0dd0bffaf3138c0ab4c2.1584689229.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1584689229.git.saiprakash.ranjan@codeaurora.org> <07a6b272c6e71e0e480f0dd0bffaf3138c0ab4c2.1584689229.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 1/2] coresight: etm4x: Add support for Qualcomm SC7180 SoC
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        devicetree@vger.kernel.org
Date:   Sat, 21 Mar 2020 15:08:36 -0700
Message-ID: <158482851650.125146.5830908665934727745@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-03-20 00:44:28)
> Add ETM Peripheral IDs for Qualcomm SC7180 SoC. It has
> 2 big CPU cores based on Cortex-A76 and 6 LITTLE CPU
> cores based on Cortex-A55.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
