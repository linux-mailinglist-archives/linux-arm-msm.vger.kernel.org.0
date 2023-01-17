Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46BF66DFB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 14:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbjAQN51 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 08:57:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbjAQN4w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 08:56:52 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF073D09B
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 05:56:14 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id k16so1667529wms.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 05:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qnONv6ljq41Tulih2wNiX8/3YbIpOSq+P5AfGvqItI4=;
        b=T6FjdRHtqP/9CsjIXx4TuTzHdpvYrOj+sStD4WgdppkvNvWW+0lRIECADV3X2YvDXU
         wnDcFKHPFb6pXvDuPL7YIMqJwWnwRaxN7d6tARfQ8QqdHYrvc2e9dSkZrLzPEZAiQC8Z
         NKaS30auQlFGUFoebn4oUVHdojMHRzhlwCnxv1ZxNGeI5W/cqvhklYXSoTcLqxfCHhs/
         ykc0y1xV/dScDk1ZrgLxcPjnmDoa2d+HiWeSQNnWYHR3Ze5huYTZR0QhFmzNAaf+6bjv
         3GreX/u8otHjW2qVLltzgXiRmUyHVnr5eI/zzeV3g+nPWOftcigIabuUcoWg6Nfyz3RY
         1DuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnONv6ljq41Tulih2wNiX8/3YbIpOSq+P5AfGvqItI4=;
        b=YELRMSUaaIeugA0twpqhu0QjZNXs/3z+dtFwvVgrF850/fQpuCvTe73wFjKcCp/SGp
         Ree6Gqnp59rPCbYoCULmb4kBSKIjYIhGeErja1sNuLjJM89fiRHpOoDIjbdO9zkWz0pc
         OVT6xZZV9sJjsuH9dKjvONzTNM9ffFyMn4WOGTsMmtjwPUvPMP5R6jtrFgt2ZTlCO0+l
         V9cK/V5ee2YNpgRYO7iDTbrFaHWdzGIctErWlB81ZGLZSPeiMCDFh7QxEpbpQ3HNol52
         PYLdNVayyekrWkMFCgOlp3TqqzhUiD4k91Lzc9ZKXDkRHeEn519f9dIJRFHpqCBBRPcW
         WAVA==
X-Gm-Message-State: AFqh2koyW87DHDn/XxhMVw5p8MMEBUhXWMdSWTIiOlVSQuguEU4wdawQ
        Rb2VusUv8Rti6PMUld505zNdm9e1CFA=
X-Google-Smtp-Source: AMrXdXvfWOqdSvnvhwpCYCLLvLzb6+pJZXyYDfTr8+b3yT/HBbp7YB8jsXZroDRKNetG8k0m0PRqhQ==
X-Received: by 2002:a7b:c309:0:b0:3d9:f801:bb6 with SMTP id k9-20020a7bc309000000b003d9f8010bb6mr3115004wmj.10.1673963771074;
        Tue, 17 Jan 2023 05:56:11 -0800 (PST)
Received: from DESKTOP-53HLT22 ([39.42.178.198])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c1d8d00b003d9fb04f658sm10737975wms.4.2023.01.17.05.56.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 17 Jan 2023 05:56:10 -0800 (PST)
Message-ID: <63c6a8fa.050a0220.ec2b1.3f58@mx.google.com>
Date:   Tue, 17 Jan 2023 05:56:10 -0800 (PST)
X-Google-Original-Date: 17 Jan 2023 08:57:45 -0500
MIME-Version: 1.0
From:   felixjosiah47@gmail.com
To:     linux-arm-msm@vger.kernel.org
Subject: TakeOff
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

=0D=0AHi,=0D=0A=0D=0ADo you have any estimating projects for us=0D=0A=
=0D=0AIf you are holding a project, please send over the plans in=
 PDF format for getting a firm quote on your project.=0D=0A=0D=0A=
Let me know if you have any questions or if you would like to see=
 some samples.=0D=0A=0D=0AWe will be happy to answer any question=
s you have. Thank you=0D=0A=0D=0ARegards,=0D=0AFelix Josiah=0D=0A=
Crossland Estimation, INC

