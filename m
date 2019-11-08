Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 593EEF55F5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 21:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390646AbfKHTFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 14:05:55 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42512 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388679AbfKHTFy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 14:05:54 -0500
Received: by mail-pf1-f193.google.com with SMTP id s5so5216064pfh.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2019 11:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=CfxKEEZdYJDv+VwQMOnbdgS+o53AJxYEZMeJRl17oUY=;
        b=HRTONkgN2o1mfAw6Hd2hOJcORiFNbzX1IfUNiHyPBaQLBNgyFywtEECrakzInNnsEJ
         w/S14UjT2rKf1jH/m1+HPScmwLK39XdK6/ZwD3cvPs+G7wYQcIBx21toa5Kw4HRD1Ty/
         ZjR2GUIfXAJOPCBRYAS5VQXZ5oZCv514M1ltE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=CfxKEEZdYJDv+VwQMOnbdgS+o53AJxYEZMeJRl17oUY=;
        b=GHpYh4VeAI2+HOMxs/TwiyEeAGUzGGnY9O//dwzWhcMhmo8ED5XiEqEl8Q5Z5oRv/T
         I9gjYQkGQBWFVmEga5vwBMoH6Sfwyj8+N08J6caik4ZZd3DC5EzC1FIz/F0OQNs6APkD
         7uSwYvX5tg/9GcexCPecXfhULQ+jYtawPXdSPWZU4E6WApCoOkwKHLvCfN24d/n6NTBq
         jLSXmiNFRsLEsbKZuWrp7lB0fPJR50Cg1lbAHXbLRpxwJ+erDInNRxrp9N2DyvIk8/Kd
         45daTaSWWmq4zwtsfOoSEhsLd8H1CmsGyqgrH7Apt+L6ATnt6KBsgsipABNF7n5PwvMo
         J6wQ==
X-Gm-Message-State: APjAAAXxy9zyxIyUbI4myjgF81iFhE8LBTPX2ciwItxorYVVvkDHRGOU
        iStSSWYK6HfajP2DJo3ii1AiMqFjVmW0gQ==
X-Google-Smtp-Source: APXvYqx0+sp5wxq5arm4pH8fols7oNVG7M0CO0z5dS7yC/rfQPExsY8YMHVLfzaj1WlNNQ6pKAFebw==
X-Received: by 2002:a63:ec42:: with SMTP id r2mr13646860pgj.162.1573239952931;
        Fri, 08 Nov 2019 11:05:52 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i102sm6684441pje.17.2019.11.08.11.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 11:05:52 -0800 (PST)
Message-ID: <5dc5bc90.1c69fb81.90c1.10cb@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191108092824.9773-3-rnayak@codeaurora.org>
References: <20191108092824.9773-1-rnayak@codeaurora.org> <20191108092824.9773-3-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v5 02/13] arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 11:05:51 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-11-08 01:28:13)
> Add skeletal sc7180 SoC dtsi and idp board dts files.
>=20
> Co-developed-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

