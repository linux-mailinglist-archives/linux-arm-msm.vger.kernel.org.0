Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6CB165516
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 03:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbgBTCaw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 21:30:52 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39031 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727476AbgBTCaw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 21:30:52 -0500
Received: by mail-pg1-f195.google.com with SMTP id j15so1129933pgm.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2020 18:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=2xhrwQviTomzj/0fU6jHXjC8RaazAr+9nr9rIvva37U=;
        b=Hp///StSFNDmabhiBJZofs78699fSOAHSNe6zLrXA7M2hyLOxa3a0Ygi6HVn5lETmu
         /HoY2FjCYrlBjYcn9uvUP+uC43wI9zgb67Hknh2mVyjfTr5GGw3llqw8UNeOQhQhOMKS
         3//sWtboNU2F5iAQLTkzRMmiRTvJ3k/F9YU3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=2xhrwQviTomzj/0fU6jHXjC8RaazAr+9nr9rIvva37U=;
        b=FBr26q8rC4AAyxxaG2nMxIl+oG7tjyLns54Sy7ZooKUOA/OPFxzokVIrfmEej7bFyH
         WXO8G3ZTNXx7Q0941VR+xehFZonmEh9WBEtvUPCnWaUtHntd7wzqX1ObyFpGatfDdkmE
         n41RGrNGVRfBMKnRed8Nuuk3eufjW1M7gc9ZwiOXuGrvHTQDw+hRZUGApeFWzSG4Wyd+
         3DslvhUpvgvCIWSmhd+Z3xuFRqg95xRQaOKx2K16OkWxsN0Y64gcfHlQoO3vZyiJhBs4
         gQiPidS+2M1yJ3fVl6WLatKvULanJXhTg7+FRV/YTVBOG04Rr2fTth/0V1hD6Oqu73em
         KTLg==
X-Gm-Message-State: APjAAAVz1wrvYUoGuxADyCBinPD8TaKrekl9lThQyoqY5c2jJrVZtv6s
        7Pcb1XmnCDtyn4UVdamMgO62Yra+WgU=
X-Google-Smtp-Source: APXvYqyqR/j5YTlyk7mPPllz5VnOKlmRZem93IGnshNp2h/Zrxs8wbPD10c413ZLvO8K7rxkd709fg==
X-Received: by 2002:a63:e218:: with SMTP id q24mr4515412pgh.244.1582165851831;
        Wed, 19 Feb 2020 18:30:51 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b186sm389624pgc.46.2020.02.19.18.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 18:30:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581932974-21654-3-git-send-email-akashast@codeaurora.org>
References: <1581932974-21654-1-git-send-email-akashast@codeaurora.org> <1581932974-21654-3-git-send-email-akashast@codeaurora.org>
Subject: Re: [PATCH 2/2] dt-bindings: spi: Add interconnect binding for QSPI
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org,
        Akash Asthana <akashast@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>, agross@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org
Date:   Wed, 19 Feb 2020 18:30:50 -0800
Message-ID: <158216585051.184098.12834695664812457422@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2020-02-17 01:49:34)
> Add documentation for the interconnect and interconnect-names
> properties for QSPI.
>=20
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
