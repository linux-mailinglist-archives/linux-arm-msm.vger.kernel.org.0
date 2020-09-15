Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159A226A990
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 18:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbgIOQTR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 12:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727633AbgIOQSX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 12:18:23 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A2EC061A28
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 09:11:34 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id z19so2202535pfn.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 09:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=iQzX7pHdm1qmojr7/SWJT2sN2D1kQylu+CeW1R2tNYE=;
        b=PL4Er6LGojDEprWyVD9lxCt6Me61crXlbfigmM3gc/1WLspK/FH1KY0GWk0ks33Dz0
         /j/mSxXUxEbsOoxcwYCJIe9b5onyMLJY+DhcbHyScNanSIQLBv8IxZ5z+N0ZsxE0wbn8
         gY0jNplI2u6yaq6neZKhBk2erTJRoQi189j5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=iQzX7pHdm1qmojr7/SWJT2sN2D1kQylu+CeW1R2tNYE=;
        b=m8Ptkd04tVZXkiVsVdRqVWq6hA8ie/V+7mUXj3ew5xIR6dfpewwFHkDpYSUT5OGM0R
         hb8hV+QspSWybczcTbAWTG1jYVcXL33cuozvoMzRGf4YGJdYT0wKYvYuUOmsivLSUrUl
         xW/9Dp57GfHvebrsBxCaEqMyzXoyU/DbXBFeFhim1VybrjNJoQ/wrhL5yifnYhm9alwZ
         I9s8ow0ofVpeD6oe1i3qvbCRhDp07oM4Uuc5Veve07VV3INS29JL0PikSm+Nab4b76DW
         k5w6+1n1TY6ND8li673UOjkFnjAcQhjbZyaLHfzwbWCiivTTD1i5fmIluyUU1GnUziZX
         wZJw==
X-Gm-Message-State: AOAM533z0k+AZD7SfKSRKYN+pXkGxEXad036/nLlA8lvFgB5Yj9eXQ6e
        ivpNm6N9FoI4fkVUZmoWG448Cw==
X-Google-Smtp-Source: ABdhPJx2GaqfW9giUQnTs+1jNTEgL4HHZxJq8X79PX+FOVxj3N8AYhsu2PfgVx3oYEnRyuwO2liPUg==
X-Received: by 2002:a63:2f02:: with SMTP id v2mr14969865pgv.369.1600186291210;
        Tue, 15 Sep 2020 09:11:31 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id t24sm12130990pgo.51.2020.09.15.09.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 09:11:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dac7e11cf654fc6d75a6b5ca062ab87b01547810.1600151951.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1600151951.git.saiprakash.ranjan@codeaurora.org> <dac7e11cf654fc6d75a6b5ca062ab87b01547810.1600151951.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv5 2/2] soc: qcom: llcc: Support chipsets that can write to llcc
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, <isaacm@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Date:   Tue, 15 Sep 2020 09:11:29 -0700
Message-ID: <160018628926.4188128.10673029331415872831@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-09-14 23:55:26)
> From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
>=20
> Older chipsets may not be allowed to configure certain LLCC registers
> as that is handled by the secure side software. However, this is not
> the case for newer chipsets and they must configure these registers
> according to the contents of the SCT table, while keeping in mind that
> older targets may not have these capabilities. So add support to allow
> such configuration of registers to enable capacity based allocation
> and power collapse retention for capable chipsets.
>=20
> Reason for choosing capacity based allocation rather than the default
> way based allocation is because capacity based allocation allows more
> finer grain partition and provides more flexibility in configuration.
> As for the retention through power collapse, it has an advantage where
> the cache hits are more when we wake up from power collapse although
> it does burn more power but the exact power numbers are not known at
> the moment.
>=20
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> [saiprakash.ranjan@codeaurora.org: use existing config and reword commit =
msg]
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
