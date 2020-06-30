Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182F721008C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 01:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgF3Xnv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 19:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgF3Xnu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 19:43:50 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9918DC03E979
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2020 16:43:50 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k5so635868pjg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2020 16:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KvgIA8jCnR4C6DD9ZJKn5SWEFGMBdmtthc8Oij6QT8I=;
        b=RA6swQmr+S0tysXaQfAHbsokJUg4uLp3g3DLvlvKvo/qX6DdU3SR9RH5I7TKhcYfKC
         ItKCRXpYW3dwc4QDXaGfOYs3+2jB3ntNUIE0Y1Zxrv7Dob7l6+Okrlr313JiDEqdyuco
         Ky53pudV1K74p8kFH6RXb4bdH7vKcXMO4q2R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KvgIA8jCnR4C6DD9ZJKn5SWEFGMBdmtthc8Oij6QT8I=;
        b=CBrKVOe4LpebWNA6NOnsGeWEvVkTGo0ifYEw+pn98zXj2Um+v20uhQHNqo2aUYi/ut
         LlPClVUHxNVYO0FYClwcKFj8zkCbA6i67K2UAuqhhzV3H9EoDSidoLErYIW5ie7Q7tfW
         MZ4MOq7epHvkANHJnewHafvZwHM7oWnnxPKeL+C/Yz6pdQ/lZCtRE9do3/4++VGlhbw1
         q6eUOebD60NvPBi/SvuOeMMTJArNEDyFl5+uimDswnpjrOwddlGD0RwP6/3OAtoD0Ffi
         vvrqnSRtziT7jyqfOBxhJVdS6LEdhz4gfmbGRi/pU2ZPgGoz2X3jzqO77bh9Pb06mBbW
         j8gA==
X-Gm-Message-State: AOAM531WEPmer2O+vVs+TRoeqXc/0PWROFPDF98hMWOVsJiVbvjuxuEy
        IFYKpsalSUwUkVm26SqAuJg0sw==
X-Google-Smtp-Source: ABdhPJzeWPD1R+nRwY8/J4yLghDQ06DrA4LcyaRFaFiu4UuLTQRflMy0ZlcOLlrct4GUqFnZQRJ++w==
X-Received: by 2002:a17:902:d203:: with SMTP id t3mr20512091ply.168.1593560630171;
        Tue, 30 Jun 2020 16:43:50 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id n137sm3811575pfd.194.2020.06.30.16.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 16:43:49 -0700 (PDT)
Date:   Tue, 30 Jun 2020 16:43:48 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: sdm845: Add sdhc opps and power-domains
Message-ID: <20200630234348.GK39073@google.com>
References: <1593506712-24557-1-git-send-email-rnayak@codeaurora.org>
 <1593506712-24557-4-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1593506712-24557-4-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 30, 2020 at 02:15:11PM +0530, Rajendra Nayak wrote:
> Add the power domain supporting performance state and the corresponding
> OPP tables for the sdhc device on sdm845.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
