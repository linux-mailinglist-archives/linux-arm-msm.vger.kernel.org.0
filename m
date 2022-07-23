Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 368C557EF14
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Jul 2022 13:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235971AbiGWLoh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Jul 2022 07:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234335AbiGWLog (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Jul 2022 07:44:36 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AEB41BE8E
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 04:44:35 -0700 (PDT)
Received: from [192.168.1.101] (abxj77.neoplus.adsl.tpnet.pl [83.9.3.77])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8EE661FFC6;
        Sat, 23 Jul 2022 13:44:33 +0200 (CEST)
Message-ID: <833fa178-22fc-c47c-a7b8-2444de3bf9cc@somainline.org>
Date:   Sat, 23 Jul 2022 13:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Increasing the maximum message size
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

when sending new clock drivers for Qualcomm SoCs I've been repeatedly
getting a bounce with a reason of "too long (>100000 characters)". The
drivers are pretty big for one email, for example gcc-sc8280xp.c has
201071 chars, but it only makes sense to add them big-as-they-are,
because there are simply so many clocks, each of which needs to be
defined as a struct with its properties set correctly.

Would it be possible to increase the limit for linux-arm-msm and
linux-clk to something like 250000 so that they get to appear on
there?

Konrad
