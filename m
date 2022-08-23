Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB9359D251
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 09:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240694AbiHWHeX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 03:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240718AbiHWHeW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 03:34:22 -0400
X-Greylist: delayed 506 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 23 Aug 2022 00:34:15 PDT
Received: from smtp.boun.edu.tr (smtp.boun.edu.tr [193.140.192.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945EF62A9A
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 00:34:15 -0700 (PDT)
Received: from roundcube.boun.edu.tr (fiyu.cc.boun.edu.tr [193.140.192.13])
        by smtp.boun.edu.tr (Postfix) with ESMTPA id E45069185B;
        Tue, 23 Aug 2022 10:25:36 +0300 (+03)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.boun.edu.tr E45069185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=boun.edu.tr;
        s=boun.edu.tr; t=1661239537;
        bh=9nywsXEINe3dGwpmAki3eyyXmGT2kgrI1tQltthbuuM=;
        h=Date:From:To:Cc:Subject:From;
        b=S2I/Xyp8jY4yPsAZ4DT8wMWNz0qGT4/7fdtOTn3ai/oPdR2v7peVLJ9Nd8vkf4k7w
         mNqW2nu/i69m0iQROAWUssp2zGGWgZwsfldRZTZlTfwkaJIq7Z4/dJYaxC0SFXzsJi
         8MKXxXDf0hLjyoVIw9l3ubNGhfSYYv3Her7PRLBmPENrweZ3Td/JRk0jXlwTv9rRD3
         OsbqMQNUx6uvf++ffE2YKJloKpc7TV4mjKKB/PVtkLOAFogL3Q6e7xwobtHCtIdDs+
         5ojViJ/u+0ze+unLzKvXQ8Qr2LZX2MxWxLT+66m19AieNKEqWLL+lyKrX53BLgiwU2
         G2AX7xyU5kbWw==
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 23 Aug 2022 10:25:36 +0300
From:   "halil.karabacak" <halil.karabacak@boun.edu.tr>
To:     linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: Using CCI_I2C Driver for OV9282 on Qualcomm RB5 Vision Kit
Message-ID: <e4bf306f4c275655f3fbe577f48fb616@boun.edu.tr>
X-Sender: halil.karabacak@boun.edu.tr
User-Agent: Roundcube Webmail/1.3.3
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello everyone,

I have been trying to use CCI_I2C driver instead of I2C on my OV9282 
with video4linux2(I want to see as /dev/videoX). However, I was not able 
find much, but yesterday I found out 
https://patchwork.kernel.org/project/linux-media/list/?series=647614 
this kernel patchwork focusing on camss & camera drivers. I believe that 
this patch also requires some other patches to work as intended on 
kernel. Is there a way that I can use these drivers on my 
5.15.0(5.15.0-qcomlt-arm64) kernel?


Regards,
Halil Karabacak
