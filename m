Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82CC3561FC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 17:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236234AbiF3Pzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 11:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235985AbiF3Pzo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 11:55:44 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1EF393F0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 08:55:43 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id s1so27953877wra.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 08:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=3jgSr09lfZGa1mgqC4UCVhARExSS7BFwyn5rqXh2zdA=;
        b=B5nhBdRvt+hirdvNT9tk/EiZbjecCXLzHcbp+acbo8+b+gsbKqgL/iLYlccTKpipB3
         MROA+4aI3aWy9QD/WKKl0DOz8YPjq9kygA5qGqZ5yIW5JjBmF3Q+w7UzPHTvOHu2enV9
         9fL7UkMLnCfwqaN8wLWVgQ7MJYZ1rE749cNrINbH7+pMqchKSB6+SzbE/Ufc0LI15pH7
         KOJY7GXO4391cA7doQ1g1YNFamRY4l180fvHGHYmrKaW/04WKo06+pqw8dteD5JO2M85
         UgL+dWdDVqyo8HOVrypCgX83qOxRVvFkPj6ETAfO8kpZX4ay/hz1HbZqe9fYx3065kvH
         p7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=3jgSr09lfZGa1mgqC4UCVhARExSS7BFwyn5rqXh2zdA=;
        b=R46Q9a+/z1rngr/AovhPASGpO/0TIX/O1+pAK66EVh7B/E6jyJI8zj6Chju1eqAqgd
         E6zNBW1DcwlyrQh48S/eRsDw/huzYOps1AIyx7BwJrR4lhstD4xGVGrqx6S07qnp4B0g
         8/BqDmfHoo3NTWOIoAGFksZhYUaib4ENUM35J1hzmYZkq1JPhnjuov0BgDrpKPETclRW
         TuSHma/e/fPkpzQgAtM4gq34fpEHpD08sqf6Nucu8XX53nI8ZNVFaEGmgmuK0RDQb8DS
         cZx79p+XqK6mlazR2shEVNyqzJDCX6XQxnFH4cBHQ22LbEs4ISqcT8Cl644FqCYPB9Lp
         nJ4g==
X-Gm-Message-State: AJIora8MpOTl6wnJre5hGPYaV9VgqUs6/pGIQtlzQ3XzFxHoZBLlJAyZ
        YDuV2slwrr8powtW+dkgMracPREOG8c=
X-Google-Smtp-Source: AGRyM1shziY0CaxiZJBWlh+cPz6TxwNqyL8AI+sOYxIp49ZmBpkpOMc3q+D8jg9iIswKRItaeU/fuQ==
X-Received: by 2002:adf:f581:0:b0:21d:1e01:e9b7 with SMTP id f1-20020adff581000000b0021d1e01e9b7mr8791624wro.529.1656604541715;
        Thu, 30 Jun 2022 08:55:41 -0700 (PDT)
Received: from DESKTOP-L1U6HLH ([39.53.244.205])
        by smtp.gmail.com with ESMTPSA id i30-20020a1c541e000000b003a032c88877sm3026424wmb.15.2022.06.30.08.55.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 30 Jun 2022 08:55:41 -0700 (PDT)
Message-ID: <62bdc77d.1c69fb81.21d38.6a95@mx.google.com>
Date:   Thu, 30 Jun 2022 08:55:41 -0700 (PDT)
X-Google-Original-Date: 30 Jun 2022 11:55:42 -0400
MIME-Version: 1.0
From:   ariel.dreamlandestimation@gmail.com
To:     linux-arm-msm@vger.kernel.org
Subject: Estimating Services
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0AAriel Goldman=0D=0ADreamland Estimation, LLC

