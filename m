Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49AFD7E1B94
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 09:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbjKFIAp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 03:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjKFIAn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 03:00:43 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4DC4BF
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 00:00:40 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E20BC433C8;
        Mon,  6 Nov 2023 08:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699257640;
        bh=FVXbHm1CS8h8sb7fuSLb/6BArzS/JMC6zd1lj0hQJAs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RjfJqJybxDUMQYdMb3uh+DO/VGZFbBlymScD9RtIlWrQvwGbtYWpFfP1quFA243r8
         x7CQt2DOo+/5cR+Ex3iq68GJo4NRDhFeQSB+q2kL0eXjc5m6n8Tfvyk4CVDarojrsW
         d8hCEhMHKNUQlKzsi+XNqY3uB4tny9naw3l2tHynCrLh5KpYg+oQIY3MDGUuQCa0tJ
         c57khSHlRRzyjSIoD+hjQqRuYRbwvoirElkjYIPFQ9sh266jrwff8YkiuTX8dPwD7Q
         i5jgt4TSNXd6iCdqjjHCd3YBnGRcbeTOzGwLciAHRqz9id1t44gp1e5JiuF1YvNo9G
         G1O3v9HfN7lkA==
Received: from johan by xi.lan with local (Exim 4.96)
        (envelope-from <johan@kernel.org>)
        id 1qzuY1-0006V7-09;
        Mon, 06 Nov 2023 09:01:25 +0100
Date:   Mon, 6 Nov 2023 09:01:25 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: External display on the x13s?
Message-ID: <ZUidVUomjf8GMzrG@hovoldconsulting.com>
References: <ZUUrMm1Q/PI5xv6a@brian-x1>
 <181bdfdc-01ef-4e60-ad62-623884cb3d6a@linaro.org>
 <20231103185309.GW3553829@hu-bjorande-lv.qualcomm.com>
 <a3c7b627-ca22-43ce-89f8-48a26c5df34f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3c7b627-ca22-43ce-89f8-48a26c5df34f@linaro.org>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 04, 2023 at 02:54:45PM +0000, Bryan O'Donoghue wrote:
> On 03/11/2023 18:53, Bjorn Andersson wrote:
> > On Fri, Nov 03, 2023 at 05:37:36PM +0000, Bryan O'Donoghue wrote:
> >> On 03/11/2023 17:17, Brian Masney wrote:
> >>> I have Fedora 39 running on my x13s (with some minor tweaks to the grub
> >>> BLS boot entry) and it has working GPU, sound, battery status, etc. I
> >>> see the external display port in the DTS, however it's not working for
> >>> me. I have pd-mapper and qrtr installed. Does anyone have any
> >>> suggestions for enabling that? dmesg doesn't give any useful
> >>> information.

> >> Run gnome and run the display @ < 2k

> > Brian's question makes it seem like he doesn't have any display, your
> > <=2k only relates to the display artifacts that you have, right?

> I had an idea Gnome was working but lxqt was not, testing this a bit I 
> get the second display up if the display port is connected to the port 
> furthest away from the screen, not the port closest to the screen.

Works fine on both ports here so that could also indicate a
(configuration) problem with your user space.

The port closes to the screen is the second port ("Unknown20-2", "USB-2"
or soon "DP-2"), which may or may not be relevant.

> Plugging the cable in and out at the gdm prompt seems to crash gdm.

I don't use Gnome, but that sounds like it could be related to the
mutter issue Brian mentioned. Have your verified that you have that fix?

Try booting to a VT console (stop whatever display server you are using)
and then plug in the USB connector in order to confirm that the issue is
in user space. You should see the console mirrored on your external
display.

Johan
