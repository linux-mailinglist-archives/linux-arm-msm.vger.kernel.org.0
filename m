Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3355569E302
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 16:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234123AbjBUPEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 10:04:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbjBUPEb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 10:04:31 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C86840C8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 07:04:16 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id o38-20020a05600c512600b003e8320d1c11so509980wms.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 07:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bAq207T94jtZhbpF3lRvOqHj2pHQuyZzVY6gA66JNkE=;
        b=q0eVCbQXIk9t1X1GrLGWms73J569cIe7ZmehOayvIlQ7hWqA2q3gTyPGRyvHm0kov+
         emjJVckUO1fwnOwNy/qWDqwH8bQALCcHsfGb5uDs3GnbAttX6Mxe+bDvpoobEXk+vrEv
         CL0xG01pkr5oCbavuJI+zjTC6j696+43CKjPltOo1VRaW4aTWFPwxihWdK2ZhsNCcyBx
         +6O7OQ2R/2qVvttHq0I9HdhQRB9dOIrBT5jwpVpMskhvQG8feMvzRQVABaRHHc+JKKHd
         IZgcEcMBMnV2ryIiLcrbt+EuewniFE91f+nSsPpqenTypPX/LrFpwtFsoZ+WA8JOkpCy
         MFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAq207T94jtZhbpF3lRvOqHj2pHQuyZzVY6gA66JNkE=;
        b=3O15M4mT0PNjVKgc7gp46xbxNSr5T+5wvgSvTuuSjMGbl770gtE+pCGhI+pWtZAQmg
         Xyg6wPV6QCk8F7wzNiFjEzyxjCGjEhSyseL5K2CDI5DXUc3Q2aSUgTquPxZJdQmyDE/o
         yU7aFM92Ba1u5UqV+zP36kMoo54dK0vVptS/776ce9AEygAZaiK9LgJ1dW3ltUZYmYCc
         vQkmT4AwcuyyOCsuisUMrt2+mdJgBY1FRKO3Qhjb8cQqQS/Gb9mwZYZTD9LOYIIgmXq+
         +lJ5WknImpfNEdO4q6ZrU0LDwy12Oga80WJC2SCkmLb44f8CfkEi+jBSPg2CJWOT5/0k
         bjoA==
X-Gm-Message-State: AO0yUKXdlsRx//wMvpovUO8iUSerFnvUFqG4bkc02f1JZNsTryWKaBPC
        qhyviKHY6axhLAOxNZp22RThSanAYig=
X-Google-Smtp-Source: AK7set+hjqcF8UJox49KaqvKClclsJX+wta3t//cXD4XVNZab2uGitOY567g/j/k+RCzmSp90f0Baw==
X-Received: by 2002:a05:600c:74a:b0:3db:262a:8ef with SMTP id j10-20020a05600c074a00b003db262a08efmr9449939wmn.38.1676991854939;
        Tue, 21 Feb 2023 07:04:14 -0800 (PST)
Received: from DESKTOP-L1U6HLH ([39.42.138.70])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003e7c89b3514sm1970976wmc.23.2023.02.21.07.04.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 21 Feb 2023 07:04:14 -0800 (PST)
Message-ID: <63f4dd6e.1c0a0220.7793c.5bdf@mx.google.com>
Date:   Tue, 21 Feb 2023 07:04:14 -0800 (PST)
X-Google-Original-Date: 21 Feb 2023 10:04:15 -0500
MIME-Version: 1.0
From:   leo.dreamlandestimation@gmail.com
To:     linux-arm-msm@vger.kernel.org
Subject: Building Estimates
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,=0D=0A=0D=0AIn case you really want take-offs for a developmen=
t project, we ought to be your consultancy of decision. Reach out=
 to us assuming that you have any undertakings for departure whic=
h could utilize our administrations.=0D=0A=0D=0ASend over the pla=
ns and notice the exact extent of work you need us to assess.=0D=0A=
We will hit you up with a statement on our administration charges=
 and turnaround time.=0D=0AIn case you endorse that individual st=
atement then we will continue further with the gauge.=0D=0A=0D=0A=
For a superior comprehension of our work, go ahead and ask us que=
stions .=0D=0A=0D=0AKind Regards=0D=0ALeo Burgess	=0D=0ADreamland=
 Estimation, LLC

