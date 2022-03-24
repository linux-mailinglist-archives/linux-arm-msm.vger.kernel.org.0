Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54A284E65EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 16:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351287AbiCXPWE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 11:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350724AbiCXPWD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 11:22:03 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA33EA6E27
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 08:20:31 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id bi13-20020a05600c3d8d00b0038c2c33d8f3so7423992wmb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 08:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=itDDekp01FWCYTqv9B9sRgCZ/AJJvKux6+ciPK10fNuLAWG4M8VPiDWXyKDarpM3eA
         IozWcJajl44BBvTAYQCi/992tmYDr2U9QAV2Qx3sngKKUMp2a6V5RSAhaW4O8id5xLWT
         aRB2Xxa0v5bIKYh4QMKtrez/lkrss5zMAx/enFl+273TxoOlUeIHGkShpb0o1dmQ19fh
         tBlFQ3XWXlnf+kX9enfSKLryyMkXypSIJdA9Pdf2Ni14G/x6uYRPnpl1Ddq0fm7FBLq6
         HJaXI5ASN49FBYLU8uict92uJrAsywbSgLrUWWXiTqeVLlDAWeFh8uZhcIXLMaTUfSHn
         gltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=fDk1WlkxcYaeAC8hRmb/v+dl/J+LNFPwmyRfofwcWUvHUxKAscjUxTamZgbB4gFPTT
         TLZIO7/OIV66eCqCN+ihOB0FjWp6GcBRhoO3KJjyW8CTvh+DiaM+rDKx2UgPhbfklsI7
         mKKZhNzTU8zf2FEcQirJymC7iUwY5ViFYClkf+0hXHpA2yhLFw9l6LqwBsJr5yyf29DG
         BC2yrckZ2Zpo5+Yi3Q6cJqNmXI2JrqFmVcxhmy2jf5iXT9s0zSFioCSZV+sS7WNpsVk4
         xIfkt06cOnumMqIN1DiewWrKmaUQdbIWjiK4NEUi7t+AnZlAV+aGDBNODxq17yc4JFKt
         o3Yw==
X-Gm-Message-State: AOAM530Z6T8bZs3pCw6eswtWZyE556Dh6Zhtr/RDR9hTcwequQTQVJH0
        cuaX9WnPK6+LatWkv+45MHI7skq5hyW1vKLt
X-Google-Smtp-Source: ABdhPJw+i3Rp1XzrijBmmilI02aU2zmvmms15mYmVBqoa4zWgSXPvBN/AqilmQtXjmMCAmx3JX7U6g==
X-Received: by 2002:a7b:ce83:0:b0:37b:f1f1:3a0c with SMTP id q3-20020a7bce83000000b0037bf1f13a0cmr5211986wmj.10.1648135230587;
        Thu, 24 Mar 2022 08:20:30 -0700 (PDT)
Received: from [192.168.0.102] ([105.112.209.229])
        by smtp.gmail.com with ESMTPSA id n8-20020adf8b08000000b001f046cc8891sm2956037wra.24.2022.03.24.08.20.26
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2022 08:20:30 -0700 (PDT)
Message-ID: <623c8c3e.1c69fb81.416b3.c621@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: meine Spende
To:     ariblessingogande@gmail.com
From:   ariblessingogande@gmail.com
Date:   Thu, 24 Mar 2022 08:20:21 -0700
Reply-To: mariaelisabethschaeffler70@gmail.com
X-Spam-Status: No, score=1.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

 Hallo,

 =


Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Gesch=E4ftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, den Rest von 25% in diesem J=
ahr 2021 an Einzelpersonen zu verschenken. Ich habe beschlossen, Ihnen 1.50=
0.000,00 Euro zu spenden. Wenn Sie an meiner Spende interessiert sind, kont=
aktieren Sie mich f=FCr weitere Informationen.


Sie k=F6nnen auch mehr =FCber mich =FCber den unten stehenden Link lesen

https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Sch=F6ne Gr=FC=DFe

Gesch=E4ftsf=FChrer Wipro Limited

Maria Elisabeth Schaeffler

E-Mail: mariaelisabethschaeffler70@gmail.com
