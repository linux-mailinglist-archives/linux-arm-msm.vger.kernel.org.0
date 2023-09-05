Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8277927FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 18:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239113AbjIEQHV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353796AbjIEISz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 04:18:55 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED0F1AE
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 01:18:51 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-64a8826dde2so13752126d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 01:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693901931; x=1694506731; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CvUmRYKO5rN5JiKdYLn9/Xxm/soJiVGtQm650JnL3Yc=;
        b=sj/l/Z1bq7199Mz3KgVaLeIzVkzd10Jh7anTmLv8heNWD9o3zRo2i2actpWbiKaA0J
         QiLGgFUR7VwqdQN0lN7BBJCE9Dy44neAaM/VR0PRzafISlyQS5b3cuH4e9rkr4pyrgYX
         FiTW2/dkac6MXZ8VTjMyblF0i5Ngzhm+zJ8ZqeVjF+CuAa8dAf3kk3dBC9Cw8H9MRGnK
         qj4oWDzV8UkUuq2qQ6flbEr2HpO4utrKvJLYu1yQ23Q4TPZeJYSvs4gH86YFGAEdTVMW
         wC4697GL3LOts53vUBl0fGqnpq+33I3fNZTPjHl18pmzGCvxpSfiKVUf24hHHbR0gDIp
         15yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693901931; x=1694506731;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvUmRYKO5rN5JiKdYLn9/Xxm/soJiVGtQm650JnL3Yc=;
        b=QCcdPuyHr/J0aPSGQI1vSJ4mIXWW4ktUl3R1Cp4gwU7njSdWlDV3sqKW0bKQ9w4+An
         XqKQFRO6qEVfefA9qywtYmwME2jSF5LAxuam9vB10GrHKIpa9FVhKTVUYFXTKT+0W9Hb
         Ej4viOjQJs68I+aGgUYJxOsfRODU5ezvQUiFL33pApbMGzU3Ii71jqlYSYfCmm0kn41C
         8JUETKQ6E+quaWqWsdVUxArHi3DLVFB7ltbP1Jlo8raGnnj2BZU/fVqIbZ4XsBlMTy9Z
         jxywt5mK83cggZawlbxNNNRMNvjYC/IvtdrJ5XLIl7ZGOZivJkVZ+3UKJmOrkXWDFnk1
         LQFQ==
X-Gm-Message-State: AOJu0YzKlneKJZsg0eihTMBvRu+6s6WIrBJ9aroY5/CeflX0KjGR0+1L
        818y5AXJ+f1/2yw8XrxlU8emiaoOxJ7kqzqJQSI=
X-Google-Smtp-Source: AGHT+IHWTz0xCjKqdMduvJDpOce7vONB4WLiap87SwXMlRNPZnkmBwJr9YQdL4srzjzlfFbcnuftyB6dwjX4OqeRFHQ=
X-Received: by 2002:a0c:e18e:0:b0:653:5a81:4ac2 with SMTP id
 p14-20020a0ce18e000000b006535a814ac2mr10671668qvl.35.1693901930407; Tue, 05
 Sep 2023 01:18:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:de0e:0:b0:634:8588:8dcb with HTTP; Tue, 5 Sep 2023
 01:18:49 -0700 (PDT)
Reply-To: wuwumoneytransfer5000@hotmail.com
From:   "(IMF) SCAM VICTIMS" <smmab4668@gmail.com>
Date:   Tue, 5 Sep 2023 01:18:49 -0700
Message-ID: <CAPvhgiHDq2_vUVF=9phb4-H2be0OFi6pi9kwpHov4PtYO9AJZg@mail.gmail.com>
Subject: Betrugsopfer
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sehr geehrter E-Mail-Besitzer,



Der Internationale W=C3=A4hrungsfonds (IWF) entsch=C3=A4digt alle Betrugsop=
fer
und Ihre E-Mail-Adresse wurde auf der Liste der Betrugsopfer gefunden.

Dieses Western Union-B=C3=BCro wurde vom IWF beauftragt Ihnen Ihre
Verg=C3=BCtung per Western Union Money Transfer zu =C3=BCberweisen.

Wir haben uns jedoch entschieden Ihre eigene Zahlung =C3=BCber Geldtransfer
der Westunion in H=C3=B6he von =E2=82=AC5,000, pro Tag vorzunehmen bis die
Gesamtsumme von =E2=82=AC1,500.000.00, vollst=C3=A4ndig an Sie =C3=BCberwie=
sen wurde.

Wir k=C3=B6nnen die Zahlung m=C3=B6glicherweise nicht nur mit Ihrer
E-Mail-Adresse senden daher ben=C3=B6tigen wir Ihre Informationen dar=C3=BC=
ber
wohin wir das Geld an Sie senden wie z. B.:


Name des Adressaten ________________

Adresse________________

Land__________________

Telefonnummer________________

Angeh=C3=A4ngte Kopie Ihres Ausweises______________

Das Alter ________________________


Wir beginnen mit der =C3=9Cbertragung sobald wir Ihre Informationen
erhalten haben: Kontakt E-Mail: ( wuwumoneytransfer5000@hotmail.com)


Getreu,


Herr Anthony Duru,

Direktor von Geldtransfer der Westunion
