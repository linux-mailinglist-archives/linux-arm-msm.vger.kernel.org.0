Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96A844EDE83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 18:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233778AbiCaQRc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Mar 2022 12:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239761AbiCaQRa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Mar 2022 12:17:30 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59FE71F2DF6
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 09:15:36 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id h4so420220wrc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 09:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=qDFXeseIWz4WE0y1VPEOmqGdx0ALYL+wGCY86n8+eYY=;
        b=Z1Uy8Is6FTC/m1oKuS7tjC3Jicl6KESylonN/FqTAlbRkLLlgLEqycwMycW0UEBPBG
         6sav0GfS/L3jlgePLXwxW+E7t03x6VruNp0n4AefBn3tJJ7upQsUNhwVXgJkoy+jd63u
         wGMuCKy/Gk3cM69yv/4DC2UJjHAxpCLYy4whb6iDagcoJ4/1lcMTTxjdQhOkNdaUju89
         f6msAahp9Ew+8iqOLSIDiiNT3yCD7lxXAeQ2NstkJPjeQOrAGhxU0piGQkw48h5EXnJa
         xYKqa7KSmkEy4gMmHoW2xtbUraUJvv+rsYuP9f0cgR2Ib3vSwiEVDinbJFTrdBhAGNby
         44Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=qDFXeseIWz4WE0y1VPEOmqGdx0ALYL+wGCY86n8+eYY=;
        b=6oer7QSAJIZqKuu9z18ZUFcHiCTSvC8Faz1CGypMWDQJe8Azc6Y4hpupkMJ/yQoR5L
         +G9EsLgQjlcAtvBvo2I1SLNbqFE/OKPK8MborzpeLM9SRtSEzjhmXKRMDKS33i3QOLfT
         XlYKwfGOcYpO+nHMRsuNB9nOIOkYbLYl9mU55QggLaS3gf7aNQZxNd1o9BTO+OUvAaqq
         WbpTaA4H/5hhyXvKn7Ahrad+wOq5uvXBllntbxgC4AIY+9U0iZpOLAKw4Brj26mgYXUg
         t2cdPqQrOfXkzpwkZIPrv3WFfBv09Zbg7+3j9DLmIKEk25jIVT6uQ1Co1NzqfGq3aDya
         AcEA==
X-Gm-Message-State: AOAM530C5lLxkcNuzW6wFc0+ko0ODUhwjMn4++zPl9onIjmYugUC38Fo
        boiNaGkiNoiEgF9NyuRCYM5Tg5HkaCfbNg==
X-Google-Smtp-Source: ABdhPJz9OQfM6z9f4x3Nma2ArsXsvM5vW9lz3YMgg/s+SWaF16zpph0QbeOWi5kJJQhLsc2l+AJFRQ==
X-Received: by 2002:a05:6000:18a3:b0:204:1f84:287e with SMTP id b3-20020a05600018a300b002041f84287emr4781520wri.184.1648743334726;
        Thu, 31 Mar 2022 09:15:34 -0700 (PDT)
Received: from DESKTOP-R5VBAL5 ([39.53.224.185])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c26cb00b0037ff53511f2sm7413239wmv.31.2022.03.31.09.15.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 31 Mar 2022 09:15:34 -0700 (PDT)
Message-ID: <6245d3a6.1c69fb81.888c1.00f1@mx.google.com>
Date:   Thu, 31 Mar 2022 09:15:34 -0700 (PDT)
X-Google-Original-Date: 31 Mar 2022 12:15:33 -0400
MIME-Version: 1.0
From:   silasdreamlandestimation@gmail.com
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
Kind Regards=0D=0ASilas Prosser=0D=0ADreamland Estimation, LLC

