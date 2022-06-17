Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4363054F63D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 13:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240028AbiFQLF1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 07:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234993AbiFQLFW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 07:05:22 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40916C0FF
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 04:05:20 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id d18so4363597ljc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 04:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Jh3M8LDovYWs/mBJiVJoI/DS8xun0EDDqspVSX/swmY=;
        b=ROHIKr0gNV0WC7apLWhcODm7zYSh3/6QUaqKgcbqbXOFI/uMh4hBQ6upcXGxwiJ/ea
         hPqiLPa2R9eebMHPFiGqh717Dccn4ka2s0/KvMCi/TOwQO3a/c3sY5KkVJ2eYk4YrHGB
         042fDvxCKFqQTFh8tJLxUistHAqWAj3uWRZfbehzk0ha/KNmgulrGBoEBI1W4xOE/df/
         7+/OdWN+jIy3DDYtc7mfY7HfgP2rdLdgE8cXdNjGGwBXQ9Rl7wjy2agUMEbsuzP8u/gu
         rysIOmQ/OIRWs3aV+f3ZvobniLdzuqcAB1J0lawu7yzgxXysY3Rnqgubj2t/PUtc71Iz
         JTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Jh3M8LDovYWs/mBJiVJoI/DS8xun0EDDqspVSX/swmY=;
        b=2rYTHaD/mpCM+N28rAl8ivJp1gYDa1CoS24voY+WWlNDHNyo7gNT1iQCCJfbLfrRmV
         SpTmSlsXOuwez6fIO4kxUV8OLkyN3I9j4777tcM3qrFKPMpAQix6sOiDNnxT6jxRdN5z
         iM3c5wHUCxDrVMRVRrN7Y+0cDT+lt7yQ1EVACqXpH+P8UiH6NlTDVUcNL+8z9b6kCD7f
         zrrbZQ2SpZo1MjimLladSsV2fxfO3pRvyIbs0TW5rqEhEOgFStUvKvZBiMKA+E3KpfjY
         zLvo5JJeKV6/D6LlsY+aan8IR6vxBFsiMIQCEjHIhYDniv51A6Pn9O4zdkeWprVImEjW
         BV7Q==
X-Gm-Message-State: AJIora/BH5vgnoUFbMewNrYrkgH5iU8ZqZ/uyvuKcDsfFOJqS91nfQtG
        UevmR0/X4TM5hAlbf4JozXhDcGzKIwo3TkLRVZU=
X-Google-Smtp-Source: AGRyM1ueVXADqwQwX8wE6PBVnerb12awQRHEPMxhUZjdWtzw6oZXVUlciqHvp862TZcd+uRdXPJg8PFxtv7H1ZnQkLw=
X-Received: by 2002:a05:651c:1549:b0:258:4386:f6a2 with SMTP id
 y9-20020a05651c154900b002584386f6a2mr4641118ljp.527.1655463919194; Fri, 17
 Jun 2022 04:05:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:680f:0:0:0:0:0 with HTTP; Fri, 17 Jun 2022 04:05:18
 -0700 (PDT)
Reply-To: sj7209917@gmail.com
From:   Joseph smith <maelyskpeta@gmail.com>
Date:   Fri, 17 Jun 2022 04:05:18 -0700
Message-ID: <CACKGxpzUX=q9UbG9foKmEBftVUzUrBi0ih16YJngNh+fZyW+dA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi   are you available to  speak now
Thanks
