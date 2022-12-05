Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC4C8642D86
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 17:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232480AbiLEQtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 11:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232169AbiLEQti (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 11:49:38 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE9620F7C
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 08:48:54 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id m6-20020a9d7e86000000b0066ec505ae93so2057857otp.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 08:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=EvWmzEra/azIE+dhpMGnktmqmSoesb8PSCiM/05QKkVO5anMKEbRHSG7nojCSOyYWk
         9IDI1UgS5rC+uB5j5uOW4no2X6seMos8u1Uby8q6RKzl1vCALcAn7vpiT6rpclAi8Jt0
         gPKoEl0xikkT9S+7dg4LTBa5X4VHIsnKU2e6OrEO/j4h9xN1NPllzu29Dg0k3gFH+bOt
         HMDW+rYw/YqhqvZ6y4oXgIeqTNVodnF9zHtiwgFo2Y0tEc6ReoK23o3+Epe6dWg/8ai1
         Z4r7fWQ42rAk0Fys+lVH3VBvE+2FTvVvceopyfVxKS8DxJV3KaRTE9M5zTY24mYt1gIO
         /rEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=63vCzX+QObSiEsAJFipKL52MGNs27yFt+Krlhz92sMUMH/OtH3Uev7I3DS/bYPiMAI
         nOP96ybJ3pdWkGuAhqp+Ja7VLB17PNYne4N0fe5JVpH7JqGyP7/tOOHBvpEoPuBzttQ5
         A5EGhauDSx2lIKfR2b5VbJ4HOI+tP2+6VmqDIuzCZcbH1f1Vjm4nPda6TZOA4IQdNXZ4
         yExOsi3qbkS3Rp7lLEzXXCr/QWkaT/EuwDFCTLnSQXlACGWm0QL6sPzJXh+xP/aTNp1a
         nbVjOVBJFjYcEodWaE2LFh5p/3X54b0uVXH0Mhi8/ZifSI64OX+rUKWIphNMAzh1HsgY
         EJhw==
X-Gm-Message-State: ANoB5pnt/6p91AFXV3BWuOOowqa697KKzLRT4SGnrqYcerknRguuyoIF
        THI8VRwo05zILXIq3lDipzY+lM5HW57fQztSR74=
X-Google-Smtp-Source: AA0mqf6rJpockmAlPLGWb5IdXxyZXi5oeB/VlA7nQtTh5mH5GBjbP93nFRUHbmrw3A3v2AKvxeLYo6EVgAyGoUC2980=
X-Received: by 2002:a05:6830:61ce:b0:66b:e4e2:8d25 with SMTP id
 cc14-20020a05683061ce00b0066be4e28d25mr41635604otb.152.1670258933537; Mon, 05
 Dec 2022 08:48:53 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6358:7211:b0:dd:1fa2:ef73 with HTTP; Mon, 5 Dec 2022
 08:48:53 -0800 (PST)
Reply-To: plml47@hotmail.com
From:   Philip Manul <lometogo1999@gmail.com>
Date:   Mon, 5 Dec 2022 08:48:53 -0800
Message-ID: <CAFtqZGFXDNDSmyfAW1goTwuOjaKBWi=RMxR7avPMnWxdOUFKOg@mail.gmail.com>
Subject: REP:
To:     in <in@proposal.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=20
Guten tag,
Mein Name ist Philip Manul. Ich bin von Beruf Rechtsanwalt. Ich habe
einen verstorbenen Kunden, der zuf=C3=A4llig denselben Namen mit Ihnen
teilt. Ich habe alle Papierdokumente in meinem Besitz. Ihr Verwandter,
mein verstorbener Kunde, hat hier in meinem Land einen nicht
beanspruchten Fonds zur=C3=BCckgelassen. Ich warte auf Ihre Antwort zum
Verfahren.
Philip Manul.
