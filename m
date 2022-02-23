Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D95C4C1E84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 23:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbiBWWeW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 17:34:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbiBWWeV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 17:34:21 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 815181B7B8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 14:33:53 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id y189so223217ybe.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 14:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=JqRXyvWEgl/qokoBRkl7pHw1a8rBkUYShmzc66iZu6I=;
        b=bLueNVXCVomCNEKEHEWwHb3cGn2w9Oolc7QCU6dgtMuuWJwB28UFclR7r8bEefDIO4
         rgKx7wTxNHY9GHV/iPUsF5WQMxjbwRQ0JDtSFhF3Q8Ru2N0dA8c0Cpp6zyjaeL34LoAz
         mYqcboaoeR2cndh665JtERruqzDxSJbKHMx8+PO0K7QurcpJMYSbZ46jlGwrfSOoIjvn
         NjlcT7LTAJcoDLa7rCySZb3baDyKqJhzlYn5mnWNkmSht6v85hNHCSVfDaWr4PgZtOP8
         QBr74RFoYcJ4QH+DYgUKMh/pxkSKeisr3GSrqtTVzkOIK8HtkHlgdBJPEbVMeYnE5nwE
         kO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=JqRXyvWEgl/qokoBRkl7pHw1a8rBkUYShmzc66iZu6I=;
        b=JI2pvEXioashb+NgsRqsr+REsSTUf/3KooUw90UT23Xfgtx8udb9W641gmyIFp0DQw
         jBMtUf+ZLkzV2hJeYeAUwy7YQVaohG8/xLsXCPcXGNKb0SDvdBJ5Z48k4Bu2gGxfqoe8
         ekO1Zjj8HK7DgGf7azknfDxzukPPqapDW6HqTTl1lhab2Xo2sTshG1cme6B9xQdBWbOC
         CHdwj+BpmN/dCmUyWRP4Qwj7E/FMkxx4QGqdL98VRzDD3BZtlkVlD1nN8PGncScpXyCP
         UuaPILg8QUZ/twLBLfrXmr8CyqC0J1cHTWMTUMAm8AFf85yINvBXY7dwdkiHHHTTX7dW
         U/EA==
X-Gm-Message-State: AOAM532GMOkWhxMS1mBl2DARcp0+knK3Ly5PHEeLWWt643JJYRylqHyL
        Ad9CLTJKyBB0nKpoiAU7j6oKDgYeVlGKMdL1VEU=
X-Google-Smtp-Source: ABdhPJwSZfgzd98nPGdrGMOE2XAjLOhPwcJAg1/dI/svMp8YQ8Nd9kWiRCAwi1ruJMgml1MmPOB4tqxDtOnxIeBDY2o=
X-Received: by 2002:a25:552:0:b0:61d:b311:95ae with SMTP id
 79-20020a250552000000b0061db31195aemr1596705ybf.515.1645655632718; Wed, 23
 Feb 2022 14:33:52 -0800 (PST)
MIME-Version: 1.0
Sender: nonyeric777@gmail.com
Received: by 2002:a05:7010:17a3:b0:210:b67d:202e with HTTP; Wed, 23 Feb 2022
 14:33:52 -0800 (PST)
From:   "Mrs. Latifa Rassim Mohamad" <rassimlatifa400@gmail.com>
Date:   Wed, 23 Feb 2022 14:33:52 -0800
X-Google-Sender-Auth: GKQP0Nw0tfVBLVveyFWHN6mIKsA
Message-ID: <CAEx8jzoNwS4oPawdDTAJ6pXDg0ToaQFssZpqxhxO-peZA-k-4A@mail.gmail.com>
Subject: PLEASE CONFIRM IF THIS IS YOUR PRIVATE EMAIL FOR FURTHER INFORMATIONS.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello my dear Good evening from here this evening, how are you doing
today? My name is Mrs.  Latifa Rassim Mohamad from Saudi Arabia, I
have something very important and serious i will like to discuss with
you privately, so i hope this is your private email?

Mrs. Latifa Rassim Mohamad.
