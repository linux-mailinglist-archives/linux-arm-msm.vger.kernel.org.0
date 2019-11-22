Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0158510771A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 19:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbfKVSPP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 13:15:15 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:34157 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbfKVSPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 13:15:15 -0500
Received: by mail-pj1-f66.google.com with SMTP id bo14so3367153pjb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2019 10:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=TMr7GM6MiQaib+flq0fyGTNSa401iDEo8QOovoR9iUg=;
        b=Wya+AjkvGgSjdqFJh39IOuaWu4VELsZa1JC7H55xfBmwAneF+Bya5rj0w8VM9jqaTi
         AncOf6IQ5HbmHmxaAKZjoWPa1Zy7VInS2wnQD1HZOk0GEBW2s8Z9ISREJJKw9O6hA2aj
         WCsq6LsEiJh5DOPzXmLk5XOfbdZOUWVj73lXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=TMr7GM6MiQaib+flq0fyGTNSa401iDEo8QOovoR9iUg=;
        b=NAMuNKWopqIQQPLsIh0GKhN0QK09v235+p3QD+gIG/OFVoAqNFRtBxhAX/2jBf+5o/
         43YrWZy7M9jDaFusaNrNiLniERRpw1f1+pw0X5zV6RO35pDlKL0JetNY7jWMhP5B2Jtb
         vov6lkvhNE/OlQr8VjxQguSA+Jvw1fjL8C6fZMUf2RZvEuUJzTmgncFZ33lfyuiQ4JL9
         ZbbJHxfBHBNWoF1c7KS0wH6EqrhzFTsD6dUNJM3yEGVoSbUvTw9Ec4WTNbTZ2BjnS9dW
         M6TEqxYc16f6qYva89pH6A63GE31JThu3Xr7X6AYfxuKpEQh8fULxUpiqmN/vRxY2mDb
         1v4A==
X-Gm-Message-State: APjAAAXG/k6aGIurDmXSv/6+JpcOj39CfMT9fdN12x6HahK5gSCoOLJG
        5r7D6PQ94Uz24/6057kxBt5Xsw==
X-Google-Smtp-Source: APXvYqxkrkIDAnLzjLnMbBshTx2QjwEEdW7rVvguaPV9+kE9H5LoHtm3gqFd/7tORsAelZ6jEzwloA==
X-Received: by 2002:a17:902:758e:: with SMTP id j14mr15843556pll.254.1574446514188;
        Fri, 22 Nov 2019 10:15:14 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z6sm3940792pjd.9.2019.11.22.10.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 10:15:13 -0800 (PST)
Message-ID: <5dd825b1.1c69fb81.95fd6.9bc6@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016e937a3f78-11fa1469-8c73-4f56-a3de-3221dcf6f0e3-000000@us-west-2.amazonses.com>
References: <1574432266-20732-1-git-send-email-akashast@codeaurora.org> <0101016e937a3f78-11fa1469-8c73-4f56-a3de-3221dcf6f0e3-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH v6 3/5] tty: serial: qcom_geni_serial: IRQ cleanup
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>, gregkh@linuxfoundation.org
User-Agent: alot/0.8.1
Date:   Fri, 22 Nov 2019 10:15:12 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2019-11-22 06:18:12)
> Move ISR registration from startup to probe function to avoid registering
> it everytime when the port open is called for driver.
>=20
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

