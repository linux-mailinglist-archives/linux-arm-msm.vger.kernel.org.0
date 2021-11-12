Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC01144EC0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 18:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235122AbhKLRkx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 12:40:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233404AbhKLRkw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 12:40:52 -0500
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2080AC061766
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 09:38:02 -0800 (PST)
Received: by mail-yb1-xb41.google.com with SMTP id q74so25561298ybq.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 09:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ykoKKo/B7+tiQQGwKZBbg7ceaAQ6WJVO/joUuONUNFk=;
        b=kKqfxieItLWPRZXlDjJTAzngJrG/1XL83y5JruT6P8r9AzWuVoUoN+aopBCmCYjer8
         XYvjr5NJd2wBOMDuAronKxalUS3bpl+0SOMAdWX4AEJYARwuol9Hltm2UzAkB0DbqGDz
         QJk1QfOaD+JR4mwHpW5WzSvTq8q8KZqK3hsrqaZ4eb21r50CT/BMvzkId+cX0oAQxhDs
         ZTbVi0acKIjeZc01CVLH5ZE4z9QDts3bxNX0BprUuuwEIVRMIsQxTB2AtjmY6j6PbZWg
         hr3ceq95fMAPQU1T910WMmUamrAElrr/kgLtw7FgHSapxL4fd5etChTqz4N7r20e8Zlm
         pstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=ykoKKo/B7+tiQQGwKZBbg7ceaAQ6WJVO/joUuONUNFk=;
        b=TGvERHPNIwqO2ZR5pV3M5cQasK8aHqKgm92U2kSYK84VYfAvCrsEQ+CloMUO8ovI/y
         xL30S+WXVKIAxmMDfBtoUKy9Vep8sSS3DgLKtmxOHx1SK/SEu44f/y9eaAPxTSRAiALN
         ZCR+JoMrzJHBLO2LEMl89TX3vn+/9pch8579i1BxyCiAEodu1muc6JAwQg28bhT5U/Vp
         60JJ+RZMBcXf7ihfIngG4FrfgodiN4A0qlDIprW6T+K3CS0KpMHiZZaDCPuFcqJ4vzF2
         lSX+RqkYqSnC3ZdmyFLf8Iw4cg3aMpFpSt4okctgPEqSKt+n8FWfNeG7KAPRWA1S6Ypq
         HJvA==
X-Gm-Message-State: AOAM533JJAQkRfnTD4mdNNtwKw7ibqeq+0eFeNcnxVz5A3zI8wp5w3iJ
        syBZBSwXyrT1BCfxaj0eL/8KUFMjn/EeTrLx8D0=
X-Google-Smtp-Source: ABdhPJynA64ltxq7BYzF+h9911JbzOfKh3UAr8TyaAd6O50+qVtNnbqxQagEyNtLaQrALjh9FpEtxYW6U/226WEXGkA=
X-Received: by 2002:a25:38c3:: with SMTP id f186mr18787835yba.28.1636738680308;
 Fri, 12 Nov 2021 09:38:00 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:5a0e:b0:1e1:487f:4953 with HTTP; Fri, 12 Nov 2021
 09:38:00 -0800 (PST)
Reply-To: greogebrown@gmail.com
From:   george brown <bbruce539@gmail.com>
Date:   Fri, 12 Nov 2021 18:38:00 +0100
Message-ID: <CADiB6YkASudDDjSTR6g0nm36ioQC2P4XZ8TZNSCBaHJtcd-mvQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hallo

Mein Name ist George Brown. Ich bin von Beruf Rechtsanwalt. Ich m=C3=B6chte
dir anbieten
der n=C3=A4chste Angeh=C3=B6rige meines Klienten. Sie erben die Summe von (=
8,5
Millionen US-Dollar)
Dollar, die mein Mandant vor seinem Tod auf der Bank hinterlie=C3=9F.

Mein Mandant ist ein B=C3=BCrger Ihres Landes, der mit seiner Frau bei
einem Autounfall gestorben ist
und einziger Sohn. Ich habe Anspruch auf 50% des Gesamtfonds, w=C3=A4hrend
50% dies tun werden
sein f=C3=BCr dich.
Bitte kontaktieren Sie meine private E-Mail hier f=C3=BCr weitere
Details:gb528796@gmail.com

Vielen Dank im Voraus,
Herr George Brown,
