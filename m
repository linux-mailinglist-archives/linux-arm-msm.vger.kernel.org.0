Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F93A7E2CC8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 20:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbjKFT1P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 14:27:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbjKFT1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 14:27:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263B1C6
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 11:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699298783;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OIP6vggn2DnPJmy8gX03Vxyq+SOYKT5t63iiMA0QskI=;
        b=ZCzY6FOsNQvBbgAxjiZDTuQdY4nC2FtRqnEF5QQ1KfGHLpx6z5/uPNef8UP96Z4PskzGjH
        oKj/nLMPvAn2r0OPH6bcJhcWZbV3Dtblw+M9L1wIkMe3lNwPuLz8DgKd74L9PpxgPH1m3L
        KDm1dQ83HCdFSV0oD2M8wa8Akp1lhIU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-wggZYOYAOlmd1RujLNlgGg-1; Mon, 06 Nov 2023 14:26:17 -0500
X-MC-Unique: wggZYOYAOlmd1RujLNlgGg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-66d159f725cso59953126d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 11:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699298776; x=1699903576;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIP6vggn2DnPJmy8gX03Vxyq+SOYKT5t63iiMA0QskI=;
        b=DFdfoWV+QtpwFh8a6Tmrh9uTtc0lyv+83ODOm+Bp8jbLa3FAj/xmr7U+DggHY/O6aB
         wbIU4lbzbBtJBxLTg6/xWHJ1HAXjSKnNKijWWwEbvg45vE+L60voFkV+qfKgd31sIEP7
         tph9/fXCtNyIFZxPrTLX+ZaGz76UY1spdedB2yELOXijhQFnRfF4OLFOabx3hLhkQ3OR
         hoWz6uJ74q8A6noMkedzcpxrs192ooOlGTNvWWpfXmad6mX6hF4lfXyiDmLRQUaCs1B+
         N0ueOA2qGix99It3e9QSEov3nSzur8qqS6RFdCD/4AapdFw4xrP31ae/jyIWaeNhrYYE
         LM+Q==
X-Gm-Message-State: AOJu0Yyoq4z5MYSMqjSHmAm0FVI+vLnNP1c7QQGAsJr5OAjUUGyJlNoO
        CBSfJyoarUiJEQ9XTFn5d+sWk4SDWyI3+ZD+tjFZZiibGzt0Qm6XPFl+7xWibNLpIkUB4NWYBwN
        dJLYA8cPRIN1WeQ/5u3p15HU6s0jTRm7YVQ==
X-Received: by 2002:ac8:7f83:0:b0:41c:da69:e917 with SMTP id z3-20020ac87f83000000b0041cda69e917mr39903059qtj.53.1699298775884;
        Mon, 06 Nov 2023 11:26:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRjIzpe5tpvIenRjLPCfo7wRuQvjiz+zay6BMGzwrNA4z0gjdXYAIvq+/hDYVyT02AfmK8vw==
X-Received: by 2002:ac8:7f83:0:b0:41c:da69:e917 with SMTP id z3-20020ac87f83000000b0041cda69e917mr39903043qtj.53.1699298775547;
        Mon, 06 Nov 2023 11:26:15 -0800 (PST)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id l9-20020ac84a89000000b0040399fb5ef3sm3664898qtq.0.2023.11.06.11.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:26:14 -0800 (PST)
Date:   Mon, 6 Nov 2023 14:26:13 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: External display on the x13s?
Message-ID: <ZUk91e/9Fo5Kdzvc@brian-x1>
References: <ZUUrMm1Q/PI5xv6a@brian-x1>
 <181bdfdc-01ef-4e60-ad62-623884cb3d6a@linaro.org>
 <20231103185309.GW3553829@hu-bjorande-lv.qualcomm.com>
 <a3c7b627-ca22-43ce-89f8-48a26c5df34f@linaro.org>
 <ZUidVUomjf8GMzrG@hovoldconsulting.com>
 <ee3f92c1-afb9-482a-9d37-d86a05f8eb8b@linaro.org>
 <ZUkQxMlb7fy0kNRE@brian-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUkQxMlb7fy0kNRE@brian-x1>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 06, 2023 at 11:13:56AM -0500, Brian Masney wrote:
> On Mon, Nov 06, 2023 at 11:27:55AM +0000, Bryan O'Donoghue wrote:
> The VT consoles work for me and mirror the screen as expected.
> 
> I did some more digging and this appears to be GNOME shell related and
> is likely different than the issue that I originally linked to [1].
> When I run with GNOME under Wayland, I see this error come through from
> the XWayland:
> 
>     Received an X Window System error.
>     This probably reflects a bug in the program.
>     The error was 'BadValue (integer parameter out of range for
>         operation)'.
>     (Details: serial 315 error_code 2 request_code 140 (RANDR)
>         minor_code 7)
> 
> I have MUTTER_SYNC=1 set in my environment variables, and gdb shows that
> gnome-shell crashes at [2] since plane_assignment is NULL. I don't have
> anymore time to dig deeper into this today unfortunately.
> 
> [1] https://gitlab.gnome.org/GNOME/mutter/-/issues/2398
> [2] https://github.com/GNOME/mutter/blob/main/src/backends/native/meta-kms-crtc.c#L365

After digging more through the coredump, it is the same issue mentioned
above [1] with mutter. I'm just seeing it happen somewhere else.

Brian

