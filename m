Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1293649574
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Dec 2022 18:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbiLKRzS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Dec 2022 12:55:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiLKRzQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Dec 2022 12:55:16 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D894DDF38;
        Sun, 11 Dec 2022 09:55:14 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id fc4so22684505ejc.12;
        Sun, 11 Dec 2022 09:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MAddJwHgewPsnld86N0dxc/Wppl/CL1frgmKU+R46B4=;
        b=EpEpD/JsFEF5dXYwIb6iq2aS/hPKXAjDuTHUsvGhFumW7hbNDQbmBfPsX1AmVf4r9l
         Zzz8O6rXPavAcrFx2B0VJ8NK8A+C1050iEKdnzND5tDr3AJACjWhoUxxxAG24odKD1yf
         FJz/gqCw4OxZ/LQb5hRsuTnEdKLMl+cqDIPURjo5i4Pp4MNjufFhddXg9APtDo//e/vD
         B8taftBjx3mJG1ponvDIfvQCsd+f4u2Io8o02szp/n29NZ4JK/gHjUqtg/i1AlClLvbj
         4FvJzQem1AC5U3FN0F7jPuxP5JUfu76iGr+/MWsCvsKXhdvxQZwi/mBht1dWboVnrgpL
         6whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MAddJwHgewPsnld86N0dxc/Wppl/CL1frgmKU+R46B4=;
        b=3UbZQqRXhT+WQ6dcd+ZO8+Q4dVn1dgqZ5BFQdIF1O5vYIzb+r+bU7Pe7wTsJnHaF3Y
         l1U6rFC5irAtAvGd7Esl+hcBxfDL4niETeOhvv0X1wFmCOxibsKkNw0pXirPgFqYcyi/
         78o88/HsYplB5N+S7AzLNF/OzayxqtFAK5McPUoaVWSeY+09TmrAxRQTGUeUuhZ96dfZ
         wvXHzDzCQM7RmoiiEo1xLF12NDyWRXCOyczWwGkIFa3y2Qrx10rNLjzqN3lGgCrblyEl
         LcQf966uznWYWAxAYLodD/n+k46b/9LsCfqk+XTlkLMdhaMiWo+N7ER5OiInW6+wfEq7
         ZD1g==
X-Gm-Message-State: ANoB5pnNQCEV+YdzN7pTqo+UPL+LsNXAqn2uAKwa7MXRvcIabdf/4dqU
        xKuVelh4UBIQlLX66crN2toFraUoaToXovYsJw4=
X-Google-Smtp-Source: AA0mqf40eVxkao/JBHEgZam23E3uixw9KD+TzzIF+nAqJUVk8cK/AvNSTNet7+fsGe9fZ6GCriBCqP+5QZ2M7cuXxPs=
X-Received: by 2002:a17:907:2bf3:b0:7c0:ebbb:8e8b with SMTP id
 gv51-20020a1709072bf300b007c0ebbb8e8bmr15730602ejc.683.1670781313389; Sun, 11
 Dec 2022 09:55:13 -0800 (PST)
MIME-Version: 1.0
References: <20221211100501.82323-1-dominikkobinski314@gmail.com>
In-Reply-To: <20221211100501.82323-1-dominikkobinski314@gmail.com>
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Sun, 11 Dec 2022 18:55:01 +0100
Message-ID: <CAB1t1CzXzt4idK2wkvF7hqXdOF=obkb7oG0Tu4PGwKYAX5nwNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: msm8992-bullhead: add memory hole region
To:     Dominik Kobinski <dominikkobinski314@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, pevik@seznam.cz, agross@kernel.org,
        alexeymin@postmarketos.org, quic_bjorande@quicinc.com,
        bribbers@disroot.org, devicetree@vger.kernel.org,
        konrad.dybcio@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thanks for this fix!

Kind regards,
Petr
