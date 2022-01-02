Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5048C482AC5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jan 2022 11:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbiABKnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jan 2022 05:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbiABKnJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jan 2022 05:43:09 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB493C061574
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jan 2022 02:43:08 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id s1so64430091wra.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jan 2022 02:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=g8Z10qgIS0EarfPNyU/0T6kl3UEk/EndXdl7judHSI4=;
        b=mjzYsM7Bfon4hWir7+HENqeqm4FX/bC0Z6wXmD2Cc5pmBNfhD3uVuoaMrW73kyHo5J
         chcfMxSRaM5BUkI+ImFNJwtXBdG2z9r8oJZcfd/CtUaSepAj3KZ5l43yxpC211NcSjIf
         2GagrO7ZSZ0v+LG4dPEKQzdjfQUygaCbHpgR3gfQEpAm6G6A6qvqkDzNHJgyz61tJn09
         KxhrQ4Y4AStETtH5kWGJN7s/G5hagtW03R1hjByq4013guGgQKVkMK6p4Dsws+bL3yBt
         oIL+Bx3Vh3mGKXGUQwkfDa9dVzdCyxyI1tD6sAMm4HTIZF3mtpPQI2IPa7LWW/IjYd/O
         q1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=g8Z10qgIS0EarfPNyU/0T6kl3UEk/EndXdl7judHSI4=;
        b=DD1R2De45yfL//eFKbinG5LLsr5jLxGklEZu7iaEtWlpqUgwO9leLbuLGAoc7FVknH
         vRyY217i/Dzw4xpi1TRRvia6ldd6DFycQO/Q/7RfuJoZdC17NTAa2ondWSx4EWJIdVxx
         NpS9kUEq4GnTsiJGSwxy/ENahNzVHJQBffpL8KORkhBhGJThLw27Y2tFLJY+6gpSHOMJ
         3FeswSHyZ/i5o3gnZCGgpyKKILdo21Chut7VitlSg/hegBdiJn9TVaGy9WzQZmFr1ac2
         kx6MZnRlOljSq9kw7k2ftVPsWWAxUon+7D5oNWYfPvOkR2+hRQr50pSXdwkDX6AlbHwO
         f3UQ==
X-Gm-Message-State: AOAM531KFNKHVTHvw1C6sygucYu+ecDnzaFK+ZsBz5UCY8l0hiNXPKKb
        x1iX8LKCY1aVMeUinpWPAVRXsGfter3TxA==
X-Google-Smtp-Source: ABdhPJywtfsz2LYcQqg4ZgkptummJ/3NdhqNF+VK1zZIDwhDzalgHC1+6pyFFh5LgNbKDWM48GhPrw==
X-Received: by 2002:a5d:448f:: with SMTP id j15mr36323472wrq.603.1641120187257;
        Sun, 02 Jan 2022 02:43:07 -0800 (PST)
Received: from [192.168.9.102] ([197.211.59.105])
        by smtp.gmail.com with ESMTPSA id n41sm35585017wms.32.2022.01.02.02.43.03
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Jan 2022 02:43:06 -0800 (PST)
Message-ID: <61d181ba.1c69fb81.7eb5a.738a@mx.google.com>
From:   Margaret Leung KO May-yee <abdulrahmantukurargungu@gmail.com>
X-Google-Original-From: Margaret Leung KO May-yee
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?q?Gesch=C3=A4ftsvorschlag?=
To:     Recipients <Margaret@vger.kernel.org>
Date:   Sun, 02 Jan 2022 11:42:59 +0100
Reply-To: la67737777@gmail.com
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Am Mrs. Margaret Leung I have a business proposal for you reach at: la67737=
777@gmail.com

Margaret Leung
Managing Director of Chong Hing Bank
