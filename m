Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E192BC9A1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Nov 2020 22:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgKVVrw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Nov 2020 16:47:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgKVVrw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Nov 2020 16:47:52 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53952C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2020 13:47:52 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id t9so15125493edq.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2020 13:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:sender:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=holMzMixu6L4mPkY4KLX0AXrH3B7KLU6Q1+gVZ1hbDo=;
        b=tfsgLn4lcQLMBbvMHIaNmbzYjLUDOSK2CKuS2cyC5wwDOEEhwPXDcslfUXjcEeUTea
         P0PULGMRlj3RaVL4Ye9+BEqUEabHHVLAGWghzaLI0WHkBo11dS28yluOdpBI11vEX7QD
         AdvKRVEduwFfoFbSKqm/fu2LOX3kUH642EiWxeUb3wwe0d7lQ7Fuioa4GGH9I/shc6jw
         hGdXa/WXCUHqHimniFhGttw1IZ8Zm1xaQKPZUQAlu16FA5qOt5x5xwc8BynvZWcOXgnB
         jsa/9nf30W0nWvlCTwilsz+uDpv8fSKaAFghqwwT3sX4skM1o0RB4YsmpK56lqyGmSXf
         Jvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:sender:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=holMzMixu6L4mPkY4KLX0AXrH3B7KLU6Q1+gVZ1hbDo=;
        b=KDjCEVNLP/lsaS4B+R7Bzu0Z5IM3ZUsN5M0O+xFTHC+4TgijDAin1kN4iDli02qG9B
         urVOj+P0kJCZVDGprWXXrMHYOSyLQC51W+Aenr626D/YXkFZV1/8zXKWR/ZV0ChsyQvC
         rkbhLCMJatKXA2XvWE4AD1YYmO2JghesKjG771ZvDZ3NxdRy7csVvnI/ncVEYPs0PTkg
         sOO86fyyvS1BXhc5j8uOo7utySW+i6VrVkgU+esksdMg98LHvBEz5As5Vju0C6gZSKDs
         mLrLdBPvdSuDaaMPsvwLbDDTM8BrLCgep8PUWILQbYrWFc4Ph3DVj8M/4dGRsypXFkvT
         c5VA==
X-Gm-Message-State: AOAM532mFJI6fpWfhGPriUssYh9CeR4CTcndNRRBrc9b6473f6pmdE3R
        27BjDKn/trk1emG0uvmtwGM=
X-Google-Smtp-Source: ABdhPJyN7hqJ3glNAaiYXy6qJd/bjhrsc/z6QNjlQDRaEAFJgVV5Fv1Th9CGFYX8cjjkatY0EP94UA==
X-Received: by 2002:aa7:d514:: with SMTP id y20mr43090831edq.384.1606081671152;
        Sun, 22 Nov 2020 13:47:51 -0800 (PST)
Received: from [192.168.43.48] ([197.210.35.67])
        by smtp.gmail.com with ESMTPSA id e17sm4016232edc.45.2020.11.22.13.47.46
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Nov 2020 13:47:50 -0800 (PST)
Message-ID: <5fbadc86.1c69fb81.8dfc7.119a@mx.google.com>
Sender: Baniko Diallo <banidiallo23@gmail.com>
From:   Adelina Zeuki <adelinazeuki@gmail.com>
X-Google-Original-From: "Adelina Zeuki" <  adelinazeuki@gmail.comm >
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Hello !!
To:     Recipients <adelinazeuki@gmail.comm>
Date:   Sun, 22 Nov 2020 21:47:39 +0000
Reply-To: adelinazeuki@gmail.com
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi dear,

Can i talk with you ?
