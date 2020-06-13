Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580BA1F8109
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2020 06:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725771AbgFME7a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Jun 2020 00:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbgFME73 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Jun 2020 00:59:29 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1096DC03E96F
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2020 21:59:28 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id v25so3924564uau.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2020 21:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=lLAtJtUEGZb0UOdLx5mNHVNklFirZdw+F8ghhLhyP5E=;
        b=KQgDTMVvyQcSUwjrwjMsDtw7DHAqUaFU2F+MLMXunai3dlUIg2m/NX5RjA8xWgjkc+
         MCr+5YWc03B9PS4kvZSOCs3nN4Mhr7ZgMxvqjXEC+Y72/6mj3pV2L3VPMqjvHMQgJd3L
         I+0vbiEDs4uezcmhDKvsK+jzwfVimKhmS3ERfz2pz/8QiTY8flaMJ2GxEgqaFLRN5wFp
         lvescJJ8WQWuk59tQyAtC5OdH5p6JW/m+iVotatedFOcr3sCfiJcim8hwQrVD+jPNgBN
         6vllYq6XAypaOuzNBRRlZZY1dvIWC+MIMg5AcZOPuGEuNbNYn1lSo6lI0MHjR0L1vMg3
         H0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=lLAtJtUEGZb0UOdLx5mNHVNklFirZdw+F8ghhLhyP5E=;
        b=nXfU35o64/TygmTo6alD28W9LsM3eMZTZkH3feNEJmzeRhATpbRTz3SIFiD9eHHs7A
         9tnETXW/5DJuif6fZ/b0Gt5CyKJA2VLBeJ3Z0n2YkFbxffrap5RAFSaJImUsXztSPTI9
         RiU8B1LGmjf+H+qwj1HjcaEbsFLycSXmez/ygmKsrTND0jrPWhhTqL4NrpGTtePQqAoS
         Frhg/NkFyCCNSEKBLOuH9hnv4FO4J3NRWi/0GNERcxBtim+X1bjo5wpwkBuavHfH5/0B
         sal0WOhlfkYRaIwNCXtKWNkDNd4GCmID+ehdJk62Akr3lwIgJIJd98og+iAbSKMQQr5K
         Mo/A==
X-Gm-Message-State: AOAM531YYSJBGV2HuaSeKoim6+Yw9nn5gWM1PWA7gjdHWHChwUmwG8Mu
        bDeawlnxBcLa9RKZHCYfz7kpmMvWFPgey0sOUIo=
X-Google-Smtp-Source: ABdhPJwkqxNL1eYRh6X7Ke+sBoQRP8cGo9tTQmmZomEOxzU8lT9OQ1hogqGEY5td3XGajdYLVyXMwjZKedS9aZsLc5w=
X-Received: by 2002:ab0:72ca:: with SMTP id g10mr12700908uap.16.1592024367191;
 Fri, 12 Jun 2020 21:59:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:260c:0:0:0:0:0 with HTTP; Fri, 12 Jun 2020 21:59:26
 -0700 (PDT)
Reply-To: pessinastefa@gmail.com
From:   Stefano Pessina <linelink006@gmail.com>
Date:   Fri, 12 Jun 2020 21:59:26 -0700
Message-ID: <CAG4TvbTgB_JvwgSYbmOdByZ3f8Qfvh60hWvGoa0MdQGB9yVfKA@mail.gmail.com>
Subject: =?UTF-8?Q?HERZLICHEN_GL=C3=9CCKWUNSCH_=E2=82=AC_1=2C000=2E000=2C00_wurde_an_Si?=
        =?UTF-8?Q?e_gespendet?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hallo,

Ich bin Stefano Pessina, ein italienischer Wirtschaftsmagnat, Investor und
Philanthrop der stellvertretende Vorsitzende Chief Executive Officer (CEO) =
und
der gr=C3=B6=C3=9Fte Einzelaktion=C3=A4r der Walgreens Boots Alliance, den =
ich gegeben habe
25 Prozent meines pers=C3=B6nlichen Verm=C3=B6gens f=C3=BCr wohlt=C3=A4tige=
 Zwecke
weggeben Und ich habe mich auch verpflichtet
den Rest von 25% in diesem Jahr 2020 an Personen zu verschenken, die ich ha=
be
beschlossen, Ihnen =E2=82=AC1.000.000,00 (eine Million Euro) zu spenden Wen=
n
Sie an meiner Spende interessiert sind, kontaktieren Sie mich bitte
f=C3=BCr mehr Informationen

Sie k=C3=B6nnen auch mehr =C3=BCber mich =C3=BCber den unten stehenden Link=
 lesen

https://en.wikipedia.org/wiki/Stefano_Pessina

Herzlicher Gruss
CEO Walgreens Boots Alliance
Stefano Pessina
