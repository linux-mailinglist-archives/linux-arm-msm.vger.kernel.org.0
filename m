Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76C064C04A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 23:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbiBVWdQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 17:33:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236063AbiBVWdP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 17:33:15 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5F6C6277
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 14:32:48 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id s13so7630192wrb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 14:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=eaaB5Fi4OIw8X99OdVt3/5VwsoSH3pqqZ03p7mumtcE=;
        b=Ji76bk0r8Cnr9nUxpSSOGV+UUkcEZVOB+euzpBsEQqG5MolANYIlU9D2OyGAkuUgnN
         fb2A9uj8C04EOGGpJrJjkEZRGUCvZ4d3G1OU2I+TzcVk71Qy4NZDtTV4lqIY2NqJGHq+
         BIV98+2ezXXU8Ro9z9j82q9BMV2KS56zoFEe3jKUVEoiuO1oNVqonnia+AiaDoK7UQqw
         PNIK3/YP3/owjc0Ry2y3WQ8XbKgUU2MbKZklL1VYkbgeKe/ojkJ28gq1DhvLjWWg+npX
         3GQOCvFwT/sA+NpZZmN+esjAop1dY4FJoyuW091wdNJuvMW1pxhfojjjc/KuaQFo/BHR
         mS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=eaaB5Fi4OIw8X99OdVt3/5VwsoSH3pqqZ03p7mumtcE=;
        b=GVd3rnGXafUxJxsfHKFEDttg78YBWR4BmEPZsuOm2fpbPxPasebxUkE8lKymkbcag8
         p/XEJY6+W3kBLC2AaXLa2G8jDbCcCgt2H+ujkraVcmsLQ1RGco93XtcycO+aW6OZ2IMf
         HXd/W+1JwGseFpdtJO7E/2oKFDR/lxcIfQABV/pHeiytoes/L/Mm0sq3rQOG/EwHU5ur
         Use6oD/oLKgGnHbWrei2Oy5gWO30yzFtSLj0LeqaKHMv1ZTbsFdtonU5NU0wulmIbTG/
         ix3FhTlE/HeImNusp2k4G04qw5p/XvEDw1DQn13gOVpwlgKGXqxpVYzKdoxBNeAKIlW/
         95WQ==
X-Gm-Message-State: AOAM5316z61MJSnrUefMPjXxiKNCMt7FcwS6SrWlPZtHIBzd0iPR4ske
        vcyIJL1i8aUCAM10dQX2D+Q=
X-Google-Smtp-Source: ABdhPJw2uyb92aludExkhk7nqEG29dlcGdIccNBS+jWOXzQuUT9ewbnoSmBIgcm+cWdoDJcLTUBc/A==
X-Received: by 2002:a05:6000:1103:b0:1e6:2787:cdf4 with SMTP id z3-20020a056000110300b001e62787cdf4mr21146939wrw.31.1645569166950;
        Tue, 22 Feb 2022 14:32:46 -0800 (PST)
Received: from [192.168.0.133] ([5.193.8.34])
        by smtp.gmail.com with ESMTPSA id n2sm4550904wmq.6.2022.02.22.14.32.43
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Feb 2022 14:32:46 -0800 (PST)
Message-ID: <6215648e.1c69fb81.fc252.0995@mx.google.com>
From:   Mrs Maria Elisabeth Schaeffler <chairtydonation5@gmail.com>
X-Google-Original-From: Mrs Maria Elisabeth Schaeffler
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Spende
To:     Recipients <Mrs@vger.kernel.org>
Date:   Wed, 23 Feb 2022 02:32:38 +0400
Reply-To: elisabethschaeffler01@gmail.com
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,TO_MALFORMED,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hallo,

Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Wirtschaftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen zu geben
der Rest von 25% geht dieses Jahr 2021 an Einzelpersonen. Ich habe mich ent=
schlossen, Ihnen 1.500.000,00 Euro zu spenden. Wenn Sie an meiner Spende in=
teressiert sind, kontaktieren Sie mich f=FCr weitere Informationen.

Sie k=F6nnen auch =FCber den untenstehenden Link mehr =FCber mich lesen


https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Sch=F6ne Gr=FC=DFe
Gesch=E4ftsf=FChrer Wipro Limited
Maria-Elisabeth_Schaeffler
Email: elisabethschaeffler01@gmail.com
