Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58F394EE442
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Apr 2022 00:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242600AbiCaWkY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Mar 2022 18:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242610AbiCaWkW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Mar 2022 18:40:22 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F768424AA
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 15:38:32 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id yy13so2270828ejb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 15:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=VEVhs+wSSHcRMi62FXJ3N57y6NGI41fOZn0GcgnwBog=;
        b=WX8moALAHGO88vRTq8427h4yfvw27upsPE0oT9uAljiPzvrxhNe/UtkDlxOrVBzFIY
         7OEeVj9OeTHXJOD8AmInD/2PT5BjD7Tj1R6+8gD5ZlFey2OvG7KaklaTlLHfvkkpZQE7
         nLqjeIjpYrZtRE3XpKN8iF98NmGw1ChWCDkPYUGM0S5W0Yxaga+qWEyYNIQZZywXfdsv
         F66EBdDuX2ZUba6+K2w6h4my4HZDpGXv8YJe7Rc59rB4xV6HBB5N39g/wi0eSS37l2JT
         8DCMcaAhfjMgkbHLrCk7rdEGxoYgrnmI4DAfkckIBAPdxbRZ+4GpXrBaiAzqGD/Jx56q
         k8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=VEVhs+wSSHcRMi62FXJ3N57y6NGI41fOZn0GcgnwBog=;
        b=dBiC4HfvXig7W0SDeyT1VKsf01OJtFsPCoHhyxq9PBbv4WH7rbVfEcIKdn8P5bztTY
         gg4Uu6fpEKHcu3IQJsIbnXwgcgZdUkyuoGiInECqh1KaFQtImePmPDaB+IbE63ww0Ceq
         66jxFMw9k59tH4SKQcp2GIflRFqPfPcR1Rq7XfhmykcglaSdQMvEpm6jATVkBEEm/GGw
         DdcNQNJgRWFP6ERDHFOSmu6rgL9R63Qg4memuOQ0PUByn1Y7z1Z6fKD3IAZkSjfPqgcv
         q5k2Z1pdF30+N7TUx7KvujAOX167VYpDKlN8bOlV17JRImxTU/z0IoGCsMi846NBBgqu
         K7+Q==
X-Gm-Message-State: AOAM530acdzjk6/vlFQdYQ9qgTnRpt5EvWG6KE9nL8sMspu4eFVz0Kyq
        VjUI4oJkz/a0UqanlF3k4MxftY9jiH0bpHTXKyc=
X-Google-Smtp-Source: ABdhPJy9ZUmsXZY9eXbYH6O3Zdg1lbquD9JQsfdQXPMhlw5mXrAOiGwlhwctSdZcYdP1F75/cKxKz0DXRoDbLSKx/a4=
X-Received: by 2002:a17:906:99c4:b0:6df:f7c9:27f9 with SMTP id
 s4-20020a17090699c400b006dff7c927f9mr6765444ejn.465.1648766310204; Thu, 31
 Mar 2022 15:38:30 -0700 (PDT)
MIME-Version: 1.0
Sender: midonicolas84@gmail.com
Received: by 2002:a55:a6c9:0:b0:149:1a3e:e214 with HTTP; Thu, 31 Mar 2022
 15:38:29 -0700 (PDT)
From:   Tomani David <davidtomani24@gmail.com>
Date:   Thu, 31 Mar 2022 22:38:29 +0000
X-Google-Sender-Auth: jnNO4fjDZFNa67AeTjQPHrQ8I_8
Message-ID: <CAE_PYmrAFnYSbc55LEH-aB9+aQJ0auMPAtGrp_GpTrgXPOvXmQ@mail.gmail.com>
Subject: I have a message for you
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dear Good Friend,


I hope that you are still using this email address? because I have a
confidential message for you.


Regards,
Mr. David
