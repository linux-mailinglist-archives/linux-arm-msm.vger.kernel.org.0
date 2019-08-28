Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46C0C9F756
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 02:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbfH1Abr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 20:31:47 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45609 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbfH1Abr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 20:31:47 -0400
Received: by mail-pf1-f196.google.com with SMTP id w26so454578pfq.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2019 17:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=6DZabq8OOFr7SZFMrBCsezS6Py1mMQ+cwU1PePGAkIE=;
        b=ngcmAUYZXtJo08EKY/VBWkbR9Y6m5d18wyRsXJer8ur7SxM9k+agOqehuEdH+Ycfdy
         Pi+EmEsEwOnOxG36KNKWz8e3uqLo+w3XInaErt/dXflVRpust3rsqo3sHIA5aMTfgf1p
         +Mc9OLlWFa+tmIaaicyodHEeYt7jVea8ulCTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=6DZabq8OOFr7SZFMrBCsezS6Py1mMQ+cwU1PePGAkIE=;
        b=iiXkDfFTUWkcypGBCDh6+LWQegnDE9vT/VWe/TbY5vHcOONywg8WrxEfFM/n4Jk/Ns
         gFsZ/ESCaN9bgQwaN/sc2KdvnjF4ajxoAfzmgwU6K+puFSwOVZ+MDlVGOlUZ+81M5rv1
         1kmb2B+RRVvzVBysOq/A+eg3a1/G+a5LjHhiXaUNs2bbULNrWmCqt6krvpq035P+8e7R
         eGclM866Gje74nHalWhJfJhghT2irErhKNUHR566zwXX0yRl2xyogmFUkpMRmC44+isE
         0wSiCU6JExNM4mwG/p16bmA1OxA5ArKKYumgnihzlY/Xm0BIIIBIYn1MYaXTj8YOTY9B
         jlFQ==
X-Gm-Message-State: APjAAAUTka8GAH+9BeGOUUoTLi1c872NQFZy4vCRFVpXzrJqcEa2C6In
        77VWWPKyO+EId8cKY0KngUnkpw==
X-Google-Smtp-Source: APXvYqyTAY2DIrm/6oafpYk02AMmWsUOJ5l6X62U+poE3/LzEAZrdfqAN9ZcibbeX1gFo/FrO0+5rQ==
X-Received: by 2002:a17:90b:f12:: with SMTP id br18mr1374786pjb.127.1566952306919;
        Tue, 27 Aug 2019 17:31:46 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a6sm508542pfa.162.2019.08.27.17.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 17:31:46 -0700 (PDT)
Message-ID: <5d65cb72.1c69fb81.5472a.24f4@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f41f53a77406c782042c0a27c180c99859b0673f.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org> <f41f53a77406c782042c0a27c180c99859b0673f.1566907161.git.amit.kucheria@linaro.org>
Cc:     linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 04/15] drivers: thermal: tsens: Add debugfs support
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        marc.w.gonzalez@free.fr, masneyb@onstation.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 27 Aug 2019 17:31:45 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-08-27 05:14:00)
> Dump some basic version info and sensor details into debugfs. Example
> from qcs404 below:
>=20
> --(/sys/kernel/debug) $ ls tsens/
> 4a9000.thermal-sensor  version
> --(/sys/kernel/debug) $ cat tsens/version
> 1.4.0
> --(/sys/kernel/debug) $ cat tsens/4a9000.thermal-sensor/sensors
> max: 11
> num: 10
>=20
>       id    slope   offset
> ------------------------

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

