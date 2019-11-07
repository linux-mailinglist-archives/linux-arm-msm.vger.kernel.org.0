Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8F6FF3618
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 18:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389829AbfKGRr7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 12:47:59 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34138 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389814AbfKGRr5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 12:47:57 -0500
Received: by mail-pl1-f196.google.com with SMTP id k7so2007943pll.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 09:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=O9s+SAq5glGTaucz+wt8Mpq0s74VjWVGvC8URwEo8g4=;
        b=JxzLMpoaS2nFxx3iWT8/Dh7Ey2jMqqAuy+T6Zcp3m+Nd4mBc8fRPJbnaB8hCDqiWEL
         bu/uQg+RBUq0cVcj6I/8xRBNuf3C4ae8yv+LhLRGET/zwuXnHLBJHEbpmAPE/cX/7toq
         0qBpoMaHwNI5dkasXxkCV9AlgiwX38p8g1XYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=O9s+SAq5glGTaucz+wt8Mpq0s74VjWVGvC8URwEo8g4=;
        b=LZ30ezeupXBPB1WlqN2Q+HsSgFZZ8IDtEPpjFFMGfLiz8wn3+2kFTOJ5Y3baMmYGp2
         chxqtnyZvXy9MqiRZ7/m7TxnG1ZVdXG2uiqjYcK8yNHJDuydO5/Y6kCGtNqhnaAS1s44
         xULpUJg0PztJROvNLm8ug/RB1uALtes+hSMCKJTSAUSN5lvTRgQnvYsJjR+zA6GGcWX0
         C3njDcEl6Eg7YTJVN/XWqjmbq5MUQIVxiNF09IJVXJjjxiuN5ZSybfZNSbe9WkoYf4a3
         mCcDgz8NW7f9xy5m3x663eG/ck4fLmn1ebkp2Hr8lh65qauQCVkiaMiU9J9vikx9vsOu
         obNQ==
X-Gm-Message-State: APjAAAWwd7fh4pULfJ6Ljaa/xrWmrhSALv+VuSwMpXNPCYd91t+xUsqv
        lwzgtI2lqPW/K99K0ejpamgjtkXO6JjFPw==
X-Google-Smtp-Source: APXvYqxqj6gmcahOY6voyb+TLBsVbjQF4GbBW30MFqILtCjPoiUjkTNOE1iVBtIvatrg1KcU1nzMNg==
X-Received: by 2002:a17:90a:c982:: with SMTP id w2mr6742744pjt.125.1573148876348;
        Thu, 07 Nov 2019 09:47:56 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z11sm4989778pfg.117.2019.11.07.09.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 09:47:55 -0800 (PST)
Message-ID: <5dc458cb.1c69fb81.c5a99.c3c3@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-6-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-6-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 05/14] arm64: dts: qcom: sc7180: Add cmd_db reserved area
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 09:47:55 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:08)
> From: Maulik Shah <mkshah@codeaurora.org>
>=20
> Command_db provides mapping for resource key and address managed
> by remote processor. Add cmd_db reserved memory area.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

