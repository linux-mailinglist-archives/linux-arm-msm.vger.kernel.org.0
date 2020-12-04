Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6741A2CE598
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 03:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgLDCSH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 21:18:07 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:56265 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725847AbgLDCSH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 21:18:07 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 5F650C7F
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 21:17:21 -0500 (EST)
Received: from imap21 ([10.202.2.71])
  by compute4.internal (MEProxy); Thu, 03 Dec 2020 21:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm3; bh=W09PF/0cW5wRW93tNEWYv3EOFJipXRsOc6smuwcLVs0=; b=MG0seYMA
        m8JdQUU1mro42sygGwYr625ricjqolha3oNI2SAyAIrqFP048j9dps3kz5x/eYcI
        phfvyGZqrUeihNVCX8mnRfBV+5zEYoRYLq1gRZA4i2Smdqx5dIZuVPqvb8b8bm+R
        T5Ty5W4dGsPf3xgVhqxn12y38dJzKL4gY2v7G3OUJptV3AWdfL1vSYHxl7xwndcL
        bG6pfeW3jmcuV7MUz/cBbZ7fJ4vawUfEEOBg5jmzhgaNkbRBa5g/nzzkFvQJgedf
        4Mhcd2RDYLbIwtkXSupNLN3TaYjJcLlwS5lXUN7nwnPXpdvpKHmO71JuaRWmSqUI
        Wy24qF+K3HYXyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=W09PF/0cW5wRW93tNEWYv3EOFJipX
        RsOc6smuwcLVs0=; b=cHmDGk2fS+cTAYQUaujHG+xPTaxYBuwdOrMoQ5VfazE3H
        CwsOYG0eyGLLAmtBTekbyjOkqnGWxVYVVs1rSowOmU7pYNRJN4Axolj4Iv/s3vvb
        gc/gODw8MSJ8kGssjXIccBdIfW6w+7dNi+mtmvlAp3ionAI4D55Nr3CPZQl+9Shi
        LDBmSj25Om/IPdzE5p6X/cgckFUHzVBEhAaJE1w4ktxZZqt5HdnVbmtaHrt+Pcf5
        oRLph0/glFm7Tz00NnkCv23yI6YAhAeQx+Lbkq4WLy1FqR5hnz+R8bAup6il6p/2
        VMuz9YIv3Ag0+u1uZFNZY0bkh2Q1Txe8HdkJezygA==
X-ME-Sender: <xms:MJzJX5WUI67mZa14kUZ2Ukv_AOxSeMTLy7K0y_cbsUoB3C1pqyOB1A>
    <xme:MJzJX5k99pPDMEO8qMnxhiNfxkFe6HT31cM8WrIKBnHm4UiRQJbzG6Hy4LfS_qNxQ
    d8P_R0Zb_DxFpGVTsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeijedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpedfufhiugcuufhprhihfdcuoehsihgusegrvggrmhdruhhsqeen
    ucggtffrrghtthgvrhhnpeeukeehieeuueegvedvjefhieeugfdvkedvuddvgedugfehfe
    evtdegtedvheduteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:MJzJX1YInKlWyXm_tG-WFFWrcuPGJcMgXvZKws3D2hFOYmvD4WuAMw>
    <xmx:MJzJX8U8GO-iGuPT4v90CmMPVTOslNiJrzgDIcY5Tank8aWAuOAm3w>
    <xmx:MJzJXzmiyqtz15NoelrV5gEKgZTTE9IseYUcNXkaOn6ymGF9KcBL7g>
    <xmx:MZzJX_wcuBx4OJpENU_n6bbQJFQd5HDUIG4RcldDxCjf4OCuIvHjng>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B420A6F6005E; Thu,  3 Dec 2020 21:17:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-622-g4a97c0b-fm-20201115.001-g4a97c0b3
Mime-Version: 1.0
Message-Id: <d973795a-cfeb-49d1-bb22-228a174d125e@www.fastmail.com>
Date:   Thu, 03 Dec 2020 20:17:00 -0600
From:   "Sid Spry" <sid@aeam.us>
To:     linux-arm-msm@vger.kernel.org
Subject: Read from msm_fb
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Copied to this list due to earlier bounce.

Hello, how do I read out the data currently on a display?  My device is
a msm-based Android phone, the device nodes are at /dev/graphics/fb{0,1} using
msm_fb. The fb1 device is a "writeback panel" which in my understanding
maintains a readable buffer meant for things like screen capture.

I can't find any information on getting data from the buffer, and was informed
there may be compression getting in the way. I found reference to the flag to
turn it off, but would prefer to make use of it. Can anyone help?

Thanks in advance!
