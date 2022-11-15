Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D33C062AD8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 23:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbiKOWDM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 17:03:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbiKOWCw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 17:02:52 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5923D2F668
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 14:02:51 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id a5so23892781edb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 14:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GcIrTj8VztBeFoy4k6qhtUBsqi2dQ47UyYJpB5EaTPo=;
        b=nftL9VuGbqz2wS8aoSGn3u7lKhkqTIh6Qw3ut+/2+mk6iuDylkuO4fKqsTWNWzmabb
         1+uO4j7fYObWyKAiKEKmBE6gzehSG2tyufgvwVYrmRAYLhOssRGJ9oA3QBbh9RyOLzlD
         D5fcH2cI5+DXyeI+BcwcFUebEsI1vJt1W0bEQaW9X71inPhHZi6DXA+kWLv8R2nH9LVA
         yCJcUwuUooshd1gvooIvbPMh2/lQOVvj9ve3fZmdH63tyY2mitEUq1BLVqJRK6kOV6ox
         eeo5WJFrUM+yQ2HFSuYk0Ulo2z+7GNylpGJhI/w5XIqx8FYdEGgPziqKHptGoWU+3dLY
         VcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcIrTj8VztBeFoy4k6qhtUBsqi2dQ47UyYJpB5EaTPo=;
        b=yPE9EItgwKK9HM5rj7RqJtHRyMG3QLR/VQlqy2xySNJ7hrMGl1e5YRY46PObqRS2no
         qfbFrCTqestXcoKUPBACYbaADAjf+vzT8VGsgi5Wh1ppMJiRxXc+o4BwmD+w+nobpoWz
         j62tXk5BuH56ZnmerhRoeMYCjZL/4UIvb5U9W42Dtfvqn4yToetoFIlc+O9Jp2oFV1NC
         /k1LDhqbV5B20922jOvEwKPK0JiCikXS4tRL0qxf0KRkZJG7lIMjC9udY9gtP1U91Gld
         ivKEnFv3OnZdpAojYxwnvyTWblqaTjcr1B4xOcTfVZ4imLZaWB8DYKMP0bKq4UpP0Sp7
         6EKw==
X-Gm-Message-State: ANoB5pndNhczOXeZwp01C1m9vf5eR7dgARmjNERm/EaHJOSoL96hc5Zc
        zAarPQdfyR3Iu11OksQIQsraBFqk9yuswCexNuP01Q==
X-Google-Smtp-Source: AA0mqf5SXfBI6T37ANtaU6IquIxC4j46qTnsreujvs83VOL05kbVxIsQj9U6F2D9Uv3/ulToJeZmoQ1bjTwySKzYq/0=
X-Received: by 2002:a50:fd8f:0:b0:461:46c7:310b with SMTP id
 o15-20020a50fd8f000000b0046146c7310bmr17315493edt.307.1668549769960; Tue, 15
 Nov 2022 14:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20221114202943.2389489-1-bmasney@redhat.com> <7420da17-d6d6-10e6-c87e-d3dc37d17ffb@linaro.org>
In-Reply-To: <7420da17-d6d6-10e6-c87e-d3dc37d17ffb@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Date:   Tue, 15 Nov 2022 16:02:38 -0600
Message-ID: <CAKXuJqgckbmikXwFi0g3P3Db5jvyst+xhQBcPoV7mA2XStVVzA@mail.gmail.com>
Subject: Re: [PATCH RFC] gpiolib: ensure that fwnode is properly set
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     Brian Masney <bmasney@redhat.com>, linus.walleij@linaro.org,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        psodagud@quicinc.com, quic_shazhuss@quicinc.com,
        quic_ppareek@quicinc.com, ahalaney@redhat.com, echanude@redhat.com,
        nicolas.dechesne@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Others in the thread pointed to Thierry's patch, but on the Lenovo
Thinkpad X13s, that patch did *not* fix the issue, and with it
applied, the X13s still immediately reboots as soon as exiting EFI
services.  With this patch applied, the X13s does *not* reboot after
exiting EFI services, so thank you for this patch.

Tested-by: Steev Klimaszewski <steev@kali.org> #Lenovo Thinkpad X13s
