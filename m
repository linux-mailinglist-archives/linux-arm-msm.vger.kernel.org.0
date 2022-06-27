Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3648155E17D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240763AbiF0UCw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237819AbiF0UCv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:02:51 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCF21C923
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:02:50 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id s13-20020a0568301e0d00b00616ad12fee7so7272947otr.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=32+pYyBzsUADZK/USZZWRdjG4+AC0lABRMoHRP/yr1M=;
        b=nxV1pazrE3xVmh1LX/HlRMYNTdOjbKwW0RRCRVu9T6jkSNo72sz01NuioSXN637++Z
         b2AmAuDtTrrhStoYWSiOXtpgTrLKdZeEkbwlHG4tCtrt1pXbnIQ8Sc3i5QhU0GyPpZW2
         zh5xzrpaq2r4OY2ESHBGrWRJGNUk8oZYa/f3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=32+pYyBzsUADZK/USZZWRdjG4+AC0lABRMoHRP/yr1M=;
        b=ZGOjOFguDZgQez6/IOalR/ge0iKRxAT2Cm8ro4j2CS39lJdSKDCGJQ2zWC8asG+TG5
         hqNtbBfbnYyhbqACOLN+cw/1K7sZExgxxGh7dYijbvszer43LnPHlSfLsV1kaz2hROvj
         eMVG9E6N0HHknsFruOPaTlGxoz55LmdGFxqoQHM9ozyACokAvu0XlFSk9nj3si3Ne9xc
         7KtR2TS3+UzUHNSCAqQqBazpsLlRIUjZ3GhQgC7H3Yk1vkI2ElGvPCskKQ8S/twFm2LB
         sdszI3bRyhUi+aM0agI7bWzVur0eDfCUQd0yqoB4+ZTD0T0sEiTOvu5Ph5JhsE+TXM/W
         edxQ==
X-Gm-Message-State: AJIora+vIjbBBf6GDMG5az3F02ZaI4OB8UMeY4hQyLDNnlXWHdA8hMId
        cQLMX28PkWuaAOB1CALa7WfZ6j9jhV4zdULAvUFp8Q==
X-Google-Smtp-Source: AGRyM1sUw3aUn8cs+jsZnRLI9HEdw7aGdjxn3slIwtFmzZUccOZBZrgs+CFrxV/GByzKlfqxHxRNuOwt68VgnVijZA8=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr6754340otl.159.1656360170138; Mon, 27
 Jun 2022 13:02:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Jun 2022 13:02:49 -0700
MIME-Version: 1.0
In-Reply-To: <20220620085415.GA13744@hu-pkondeti-hyd.qualcomm.com>
References: <1654158277-12921-1-git-send-email-quic_kriskura@quicinc.com>
 <1654158277-12921-3-git-send-email-quic_kriskura@quicinc.com>
 <YpkRDi2m7cLaKYEf@google.com> <Yp5nf2w8uVZ38/XZ@google.com>
 <Yqd9IHQEj3Ex+FcF@google.com> <YqjLHyUVEjf7I3MI@google.com>
 <20220616091110.GA24114@hu-pkondeti-hyd.qualcomm.com> <YqtlRQOwb3t6Xtd0@google.com>
 <20220620085415.GA13744@hu-pkondeti-hyd.qualcomm.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 27 Jun 2022 13:02:49 -0700
Message-ID: <CAE-0n52bq9feA6BVdAp791SWQtT1Yj4M2ppg3o_KOaRFO8r+0Q@mail.gmail.com>
Subject: Re: [PATCH v20 2/5] usb: dwc3: core: Host wake up support from system suspend
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_vpulyala@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Pavan Kondeti (2022-06-20 01:54:15)
> +Felipe, Bjorn
>
> On Thu, Jun 16, 2022 at 10:15:49AM -0700, Matthias Kaehlcke wrote:
> > On Thu, Jun 16, 2022 at 02:41:10PM +0530, Pavan Kondeti wrote:
> >
> > Good point! It doesn't really ensure that the child is probed (actually it
> > won't be probed and DL_FLAG_AUTOPROBE_CONSUMER doesn't make sense here), it
> > could happen that dwc3_qcom_probe() is deferred multiple times, but eventually
> > the PHYs should be ready and dwc3_probe() be invoked through
> > of_platform_populate().
>
> This is a generic problem i.e if a parent can only proceed after the child
> devices are bounded (i.e probed successfully), how to ensure this behavior
> from the parent's probe? Since we can't block the parent probe (async probe is
> not the default behavior), we have to identify the condition that the children
> are deferring probe, so that parent also can do that.
>
> Can we add a API in drivers core to tell if a device probe is deferred or
> not? This can be done by testing list_empty(&dev->p->deferred_probe) under
> deferred_probe_mutex mutex. The parent can return EPROBE_DEFER based on this
> API return value.
>
> Another alternative would be explicitly checking if the child device suppliers
> are ready or not before adding child device. That would require decoupling
> of_platform_populate() to creating devices and adding devices.
>
> Note that this problem is not just limited to suppliers not ready. if the
> dwc3-qcom is made asynchronous probe, then its child also probed
> asynchronously and there is no guarantee that child would be probed by the
> time of_platform_populate() is returned.  The bus notifier might come handy
> in this case. The parent can register for this notifier and waiting for
> the children device's BUS_NOTIFY_BOUND_DRIVER/BUS_NOTIFY_DRIVER_NOT_BOUND
> notifications. This would also work in our case, if we move to
> of_platform_populate() outside the probe().
>
> Would like to hear other people thoughts on this.
>

I'm not following very closely but it sounds like a problem that may be
solved by using the component driver code (see
include/linux/component.h). That would let you move anything that needs
to be done once the child devices probe to the aggregate driver 'bind'
function (see struct component_master_ops::bind).
