Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBB81A8C85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 22:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731390AbgDNUcS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 16:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633184AbgDNUcK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 16:32:10 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5E5C061A10
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:32:08 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b7so5802056pju.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=RoKpcxr6K9VGzAmsqGBuph/1FoGQ9qjjJ0YxDqJJHHg=;
        b=QiJ9ArI4RGUZhtyAjahBG207F3DQ0dZvDNZYdWFyHhMRRRSlzyFzC4sGGOg/4ROOBT
         Xy2fb6wp6NXZaEWLhn5Se6/JkcAwSQHiPsbE2laZg4hG5k9JNR5qDpZhNpdGdanByfFJ
         77diWG+Xdzc7JkfsQfJq2MY9esr8dS5CXo9Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=RoKpcxr6K9VGzAmsqGBuph/1FoGQ9qjjJ0YxDqJJHHg=;
        b=iyWcynODYhZ7UHbhM8K8rZLbS0103du4oDSOr4vTzy+hEb9HDGDj3InpaqndRyuUiF
         bihXLOiBec7pyzyFviJ+J4Shl94XVKVJHoJ4VVAPinqFkdGoJk9eJYZCGYHMdTENOKcw
         bw3g75N6gNcuVH7tEyjDW3dZ1++8RJ/Ihj7m3wTixFW0TkPHHSqrVxJryOvXvhDdvI9A
         BMSf4GxQnppiN3nfbmfGZYRU1EWJ/0xziC342oEA0FwC7hbQ6zjkL33ZUW04s+vaHFW6
         tp14DSd5eorZukqGWks5ZiPrnP4QaxP+myfZJAs8ijft0a/ZYmcnMUk5dc365OQBGKVL
         K8Eg==
X-Gm-Message-State: AGi0PuaN35O9LLRq5GGHB8gLTRJbA2Dulx2sqtIvACV6x6RP6iAE0DFK
        iEz/YCBT+fRsrwSNTrz7xqIn4nX5Zvk=
X-Google-Smtp-Source: APiQypJmomzVcaErIMWufXBh4DLq/VWKaXXky2Q+jgmXEF61n7QDVFPgCA0LLJzRIGPeVmppodfzCA==
X-Received: by 2002:a17:902:8305:: with SMTP id bd5mr1602962plb.114.1586896327676;
        Tue, 14 Apr 2020 13:32:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i124sm11791303pfg.14.2020.04.14.13.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:32:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585718145-29537-5-git-send-email-sanm@codeaurora.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org> <1585718145-29537-5-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v7 4/4] arm64: dts: qcom: sc7180: Add interconnect properties for USB
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Tue, 14 Apr 2020 13:32:06 -0700
Message-ID: <158689632638.105027.4250669142733413538@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-03-31 22:15:45)
> Populate USB DT nodes with interconnect properties.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
