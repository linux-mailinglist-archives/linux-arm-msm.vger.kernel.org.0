Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56E4F7E2985
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 17:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbjKFQOx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 11:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbjKFQOw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 11:14:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E721BC
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 08:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699287243;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yPJHKqEFUKVnalICwN8MsQZa6/E9PJ2FebhT0bEQtfw=;
        b=Fq2OJw4e2+8R+Vcu19KrZCT8ID51DdO36fV4IS388b54VhdUqGYBm2WFLiaMYPC4AeEWLF
        FTfojqbJm1EgC70PcyGj/ZvNqOanwe4443Biui0y2beFmvVX/iqBwSC4afFS+zACWQnT/r
        jkIPITURDD+55tShtR0XiEyfccKEOYw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-W8srCpWGNHKvDabo5bddMA-1; Mon, 06 Nov 2023 11:14:00 -0500
X-MC-Unique: W8srCpWGNHKvDabo5bddMA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-66d08175882so54820406d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 08:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699287239; x=1699892039;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPJHKqEFUKVnalICwN8MsQZa6/E9PJ2FebhT0bEQtfw=;
        b=D6biv+3qEziGayYfbhf/XofbPyHSHuEPyfPP40GNONLSGIJPe5P9AXMuVqVsVdi2Xe
         h18C4y7VK4l8qLOuLV0fgsdq5IsbiWEOYSZLrJLfjloOIv8TcA8QzEW/n991arPbz8v9
         zNjN8k0Jt0nayrLxhLxJOFDS8YkZ7H8V2YerebxUDq8UiaRfJWxHHQPSR0zCB4x8BONF
         kJQUVJqHHPDWGl27A4WTR8rP9fkp7cXMJ1ScObBn5Gp7d9RKzad6WlwZIoWBBmLtqDwR
         1h3rNEB/ZW6pZr+xtM2cfMHLPKUgl2YqqKUP6dvQz/qLLuwOE1ND3vmVk6a/mQkz8+yT
         8Onw==
X-Gm-Message-State: AOJu0Yz35Xg7Sa6c6Q+MPOMiPvgy3UsHm6JVMV2a4yztG0+rlinrLwem
        QHjPfNgvL/6HHcUFyWYzOpOYU2UPyT90lvPRyjxZHMfY5goXKMG+MNuZLyfobl2TNsk4R/5EGjB
        UdYgN1lqrMNw5cOX4gQsaISTdHgJfh+dIJw==
X-Received: by 2002:a0c:cd0f:0:b0:66d:6544:8eae with SMTP id b15-20020a0ccd0f000000b0066d65448eaemr28129961qvm.34.1699287239347;
        Mon, 06 Nov 2023 08:13:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMXunA6xJxQocRzTNWGiaAV+55AniCYdWyCNaLtfV6kmgS9xOFjwUX2TapYqXLNmbhN2evpg==
X-Received: by 2002:a0c:cd0f:0:b0:66d:6544:8eae with SMTP id b15-20020a0ccd0f000000b0066d65448eaemr28129942qvm.34.1699287238965;
        Mon, 06 Nov 2023 08:13:58 -0800 (PST)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id v1-20020a0cc601000000b0066d05ed3778sm3556049qvi.56.2023.11.06.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 08:13:58 -0800 (PST)
Date:   Mon, 6 Nov 2023 11:13:56 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: External display on the x13s?
Message-ID: <ZUkQxMlb7fy0kNRE@brian-x1>
References: <ZUUrMm1Q/PI5xv6a@brian-x1>
 <181bdfdc-01ef-4e60-ad62-623884cb3d6a@linaro.org>
 <20231103185309.GW3553829@hu-bjorande-lv.qualcomm.com>
 <a3c7b627-ca22-43ce-89f8-48a26c5df34f@linaro.org>
 <ZUidVUomjf8GMzrG@hovoldconsulting.com>
 <ee3f92c1-afb9-482a-9d37-d86a05f8eb8b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee3f92c1-afb9-482a-9d37-d86a05f8eb8b@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 06, 2023 at 11:27:55AM +0000, Bryan O'Donoghue wrote:
> On 06/11/2023 08:01, Johan Hovold wrote:
> > Try booting to a VT console (stop whatever display server you are using)
> > and then plug in the USB connector in order to confirm that the issue is
> > in user space. You should see the console mirrored on your external
> > display.
> 
> Works.
> 
> Looks gnome shell specific to me.

The VT consoles work for me and mirror the screen as expected.

I did some more digging and this appears to be GNOME shell related and
is likely different than the issue that I originally linked to [1].
When I run with GNOME under Wayland, I see this error come through from
the XWayland:

    Received an X Window System error.
    This probably reflects a bug in the program.
    The error was 'BadValue (integer parameter out of range for
        operation)'.
    (Details: serial 315 error_code 2 request_code 140 (RANDR)
        minor_code 7)

I have MUTTER_SYNC=1 set in my environment variables, and gdb shows that
gnome-shell crashes at [2] since plane_assignment is NULL. I don't have
anymore time to dig deeper into this today unfortunately.

[1] https://gitlab.gnome.org/GNOME/mutter/-/issues/2398
[2] https://github.com/GNOME/mutter/blob/main/src/backends/native/meta-kms-crtc.c#L365

Brian

