Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88EDE57C8D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 12:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbiGUKWD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 06:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbiGUKWB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 06:22:01 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB3831DE4
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 03:22:00 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id x91so1585352ede.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 03:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=coS9yaiFpBby2OfoSNqf9gzdn43j/VET3bvDzCGocjQ=;
        b=Mp9N6VNKLnN8XmfgQiRv9rTuCj42SfzQ2c8sm+Q4zjul0ZnDivBU+18O0OtxC6Jt0s
         zU0N0zdwI9gFuTa7L4UV9kRcXRKowCkUWZ6OzqrXaAe/FgcCWB66v9ffLDXcqOsIZKw6
         1WdIEqYiVhPj/+p8ZlrXwPQbZj80TJWfEGEz/GePz5xPimw1eF2KFR9TkIYfct9BDr3T
         6OImENbCB2AIdSzEdDCXRiiMVJHX+LeFsr2TQSf1EJ8jCKiwW8luqh02FoSC5lPNYOlb
         b9jnQn8aO7jvemtkeBJAYTcQGiPdHo5/5yVhiGN9auedKnRBIY943a0C/yteO+MmdnsG
         uHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=coS9yaiFpBby2OfoSNqf9gzdn43j/VET3bvDzCGocjQ=;
        b=6dPnW63KFMd0ZlI0D+He289Ks3ZcCJ7nncqITSAWNXwLJ8OGYcZuLuqK/PncUSmXZ7
         hBv0/qgCu3KOHn0EWnc1oDpD24PTLTWuJqzPhO0gC3ouRGowT4sDQezoJ5qLuwrCCSaQ
         6fXB2V1TC4en7fvPE3USVY8uDsL2Pijg4Um9gezEAok1lo3eASs+xpu0g/8baOz5bXdY
         kfweIqMdgL3TzDJEfE7rFpiZXkjUnp3bA4m2ihsYIVYcOEF0d7w2D0aUwOqhW3lrA0Ap
         FOfytmAdvdAMQpQOMg6LEhL43lTk4YY03KdDlam3tjE3tDZOeZpHglrhfXcfPJTSfPpb
         eixA==
X-Gm-Message-State: AJIora8C3AoEw2+Oq17894ywX1/DsAAqET/fyos0DRN3OS2qgh3PEAQd
        2ZfVtoQZ1DbLtc3szFT2nAXdZDk52cBOuyYxHug=
X-Google-Smtp-Source: AGRyM1sEvIoGaleZ0I52UXafLlxTEwTkuYih/lWd0T125/PHxr4qeJe72V+MS07UNoptZgxQhg1wvWeO0sdco/fifnU=
X-Received: by 2002:a05:6402:5415:b0:43b:a888:fefe with SMTP id
 ev21-20020a056402541500b0043ba888fefemr11736690edb.302.1658398919275; Thu, 21
 Jul 2022 03:21:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:f1d4:b0:72b:2fd6:a7db with HTTP; Thu, 21 Jul 2022
 03:21:58 -0700 (PDT)
Reply-To: cynthiawilliams777@hotmail.com
From:   Cynthia William <cw14445@gmail.com>
Date:   Thu, 21 Jul 2022 12:21:58 +0200
Message-ID: <CAD=7fZjM115kfhU30L18TFJGie4n5oeUyiqKiv7+ZDUWph+SfQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:534 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4998]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [cw14445[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [cw14445[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [cynthiawilliams777[at]hotmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello, please I need to communicate with you,
Can I share words with you?

Cynthia
