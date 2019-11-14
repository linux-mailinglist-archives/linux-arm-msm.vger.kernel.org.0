Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59AF0FCBAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 18:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfKNRTV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 12:19:21 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38844 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbfKNRTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 12:19:21 -0500
Received: by mail-pl1-f195.google.com with SMTP id w8so2903209plq.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2019 09:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=VROg+K4TnY3eAbuPo8JrWf/C2byY5+4xNeCDIHGsCeg=;
        b=heWxqfCmZNzfTeb32+KsxAmK9QmT+BSvtUhbQQds6N/0EWs8x30JKwk7l7OeGKpP+k
         Rn6qNv/aPihZZWzCsHOPMyQlqKmLOcE78qR9y5B05Zj9xou0l6VhRE3DGx+wxhPPkfd2
         SpMVcrep/VY8e9SeRZ72CgKFH9R+1+lu4c3z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=VROg+K4TnY3eAbuPo8JrWf/C2byY5+4xNeCDIHGsCeg=;
        b=Y6p6L0m2ti0HLKu5vtpUO5fSI5NXllAGzuSJ1nKZqEy73kjGBulFLVJgK6KBu/SDyO
         TisQ4ndU4nGfk/yEhw12Czyn5ShXFg1K+9YSxBkvfjxQToD3GXwnl9Xh33KT+GWbw7HF
         VEGi3CDU9z1IFD9b5liQALKy89+PfnGW7CJTVdNDwvglYJ0XkX0oErbxGzNTZEpTxDCG
         yma5Xcg+thBggO/H3fYl/WvDa8W4Osq2VBdnmoPmWqzlQVAIXgq6T0sttM1vIIrOtZOZ
         2q76Ed/mBxO9f0xkqCds0J5C4QYxdlXewgFqmLTagaCLlCJnifbpZVvJhL49kp6u67k3
         EtBg==
X-Gm-Message-State: APjAAAXcQzBtl73+EL+rXNWCPeA3Omv1+1pV9yrs00599rnqASMQdxAi
        T8tPis6sewejQarBdvv7p7+ElQ==
X-Google-Smtp-Source: APXvYqw7or5Ucfv1vVWnxkJ7A//hqXzGl+dzF4j9Z+0zPBFHLT+WmTtkRBWBQm90pp4DCyaFAV6vIg==
X-Received: by 2002:a17:902:6508:: with SMTP id b8mr10286509plk.69.1573751960472;
        Thu, 14 Nov 2019 09:19:20 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id n12sm7356081pgb.32.2019.11.14.09.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 09:19:20 -0800 (PST)
Message-ID: <5dcd8c98.1c69fb81.4690b.49fe@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191114081430.25427-1-bgodavar@codeaurora.org>
References: <20191114081430.25427-1-bgodavar@codeaurora.org>
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        johan.hedberg@gmail.com, marcel@holtmann.org
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Enable clocks required for BT SOC
User-Agent: alot/0.8.1
Date:   Thu, 14 Nov 2019 09:19:19 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Balakrishna Godavarthi (2019-11-14 00:14:30)
> @@ -1423,6 +1427,20 @@ static int qca_power_off(struct hci_dev *hdev)
>         return 0;
>  }
> =20
> +static int qca_power_on(struct qca_serdev *qcadev)
> +{
> +       int err;
> +
> +       if (qcadev->susclk) {

clk_prepare_enable() shouldn't return anything besides 0 when passed a
NULL pointer. Please drop this if condition in addition to the one on
the clk_disable_unprepare().

> +               err =3D clk_prepare_enable(qcadev->susclk);
> +               if (err)
> +                       return err;
> +       }
