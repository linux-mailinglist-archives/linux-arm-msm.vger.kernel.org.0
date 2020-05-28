Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD061E6CBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 22:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407298AbgE1Um4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 16:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407189AbgE1Umy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 16:42:54 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174B9C08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 13:42:54 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ci23so99866pjb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 13:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zdyzLimXPKb8loA9eaNOpZUzWfyNaM5PR6IwlYxpXo4=;
        b=Du8oCqtJwgbtosFY4o395cLSrMzX/msg37UKQjYvLS6QQ7YLGyN638DSsEQsaeeY2f
         bqbrcEjJlSpY6oGKOTay+04QHpGFV1ORhJ2E99xg625at5WwGQU/jk9eV7vTuwMOTN6p
         1mVDkyGnQ7Q/uF/evtjPW1Vaf4PbR95+GWbNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zdyzLimXPKb8loA9eaNOpZUzWfyNaM5PR6IwlYxpXo4=;
        b=IeZFyRSIkvS7J5avcdTAZdLf3Fxd1Cx/g/be5UCjnR4Xshh5ONuU7TRjDiq7SULgA+
         52PgBn1tgU37tzujm8TIaB+OZ7ACoI2J0QsLr6Ix2RrPfWnMbS0Fkzrzs/gskHVHHQti
         QtN6ZmtCoywNUHv617mR9PZNpYi9mduGKjn3LW5ImMHQQ1kfADaV3TE8ZJlh2LmLrcoY
         8oJbGuLDOdgJpfvxVC8JwfTzKYx5D/qPtk+KFLmAXcJBHCkEq3JpzCCeMTWDdE0NyXxD
         9LWG3dKjLr/aeUUu1x+bSxa//EgQJM3aQVj3TFo1Sdwj9KioInlOgnF32+XA6wstT5CO
         tflw==
X-Gm-Message-State: AOAM530CdYPsJLgLLMB9bZRSiiQJPVl0jzfKUVAnesx5yTLvTCSzbhxH
        u3Kdb79CAgduwuZ4cj3chnmgLw==
X-Google-Smtp-Source: ABdhPJyc5Y33yZEJNPHkyz6Y9xrbOnyBsYt39W75M0ByokE/SZClzan4j2p7o8JcmfA/bBrPWvSJPw==
X-Received: by 2002:a17:90a:23e7:: with SMTP id g94mr6003805pje.210.1590698573489;
        Thu, 28 May 2020 13:42:53 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id m12sm5860434pjf.44.2020.05.28.13.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 13:42:52 -0700 (PDT)
Date:   Thu, 28 May 2020 13:42:51 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org, stable@kernel.org, tientzu@chromium.org
Subject: Re: [PATCH v2] bluetooth: hci_qca: Fix suspend/resume functionality
 failure
Message-ID: <20200528204251.GM4525@google.com>
References: <1590697867-7618-1-git-send-email-zijuhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1590697867-7618-1-git-send-email-zijuhu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 29, 2020 at 04:31:07AM +0800, Zijun Hu wrote:
> @dev parameter of qca_suspend()/qca_resume() represents
> serdev_device, but it is mistook for hci_dev and causes
> succedent unexpected memory access.
> 
> Fix by taking @dev as serdev_device.
> 
> Fixes: 41d5b25fed0 ("Bluetooth: hci_qca: add PM support")
> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
