Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11986ACE6A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 20:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjCFTqg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 14:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbjCFTq0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 14:46:26 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 359783D0A4
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 11:46:25 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id cw28so43423165edb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 11:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678131983;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lFWa+J9lb3QzPstZ+WG1iEbKDAsFF951hqtnsw1vXi8=;
        b=OZPJFta7nDvyOGnqQGpSQ+ajdVtR2SxoOPq682woVcreqBjKDjhcbtghd1wceW164u
         8xRVomo5e791QyTWb/nurexrWLdIXFOMVBuNnBcuwQfb/cIx9s1SrT3hSEx2xLks3XrB
         PCoBJ90VsVVv709NazzEHBqG5W+3w5+bLTMkD0kmKwdlUk+FJsnOMsjvlYfYarzoO/DX
         3jw1GHu62NqbwCGSsMy0YaYF0PfJZ968VfOPtbRTwwfFWkEoH9avydSOzL81UpiQwaUh
         zMBy5wiydhVzt3yv+6M16jSmjjOpTzxW405EvoaF/XGE9MfhZmWLzmXZtJz6aUpi6oDl
         u+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678131983;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFWa+J9lb3QzPstZ+WG1iEbKDAsFF951hqtnsw1vXi8=;
        b=omDhHccgmrsahalGKHHOZSSgYhBMea/8Imq7aCdtaGVsQCoCDdH9jpy+W7lx723bYt
         1jNLIWPx8u9MUpFuLxnl/d1TN+clkIHcU+IZ2eQkx7jR2ohUBDfLW5UXsp6y2c/ZnDmn
         5tWhxr8wD5dfUf3HbQHzjdl7goWNT/Nz7eWwuxl415lQMT4KU0vKN03c54NquADtiBK4
         vnYPcQ0vH5yppankJJgzbT1vvNQvvl0CXpZl1bBbD+M24S1hHrNZkKAjQrLK7jYX4Ubh
         6kgV22F4wmuLfnQXvltXwxZVUNAtuTGwr7wwkhrv0QB+WFcOmCti28QC4fxX/Jm9qxkn
         K6wQ==
X-Gm-Message-State: AO0yUKXwUgQBc6V4tI0DHm1/IRc/ymaUgxX38jm/EhB1zFoHKyY6HLcD
        mgbZHemZGrfRbSN5NvF3Bry7nTBGhU03PL4jvK8=
X-Google-Smtp-Source: AK7set8EGjk4E3Esdl0oWzOLFtQX6AQzLEG5bEi8ZSA/ojuPuxj6WSCVb/Jg4OsuGBjqE0/JWfekSOKmPrIGLuGlaTs=
X-Received: by 2002:a17:906:3a0f:b0:90e:a4e:1bc4 with SMTP id
 z15-20020a1709063a0f00b0090e0a4e1bc4mr3935082eje.8.1678131983383; Mon, 06 Mar
 2023 11:46:23 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:907:160d:b0:8e3:bdb8:463d with HTTP; Mon, 6 Mar 2023
 11:46:22 -0800 (PST)
Reply-To: Lindacullbert@gmail.com
From:   Mrs Linda Culbert <juliusaugust62@gmail.com>
Date:   Mon, 6 Mar 2023 19:46:22 +0000
Message-ID: <CAOJFhMX6+A_307c8eG4-8fkev7bzxr-NQqW=CPFnfXOcOCscuw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.0 required=5.0 tests=BAYES_95,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:532 listed in]
        [list.dnswl.org]
        *  3.0 BAYES_95 BODY: Bayes spam probability is 95 to 99%
        *      [score: 0.9565]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [juliusaugust62[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [juliusaugust62[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hola,

Por favor como est=C3=A1s.

Necesitar=C3=A9 su respuesta urgente.

Saludos
