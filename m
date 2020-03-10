Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE7F4180592
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 18:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgCJRyW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 13:54:22 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43845 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgCJRyW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 13:54:22 -0400
Received: by mail-pl1-f195.google.com with SMTP id f8so5723698plt.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 10:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=9xrGyjBP9/lId96bp3b0igZ5Fq6/ehIsq8nZJf92rko=;
        b=jayoZwrFjKOylGI+0rtBXlSDlY2LI3eMJQ9vUgbiaT7A5gbExcoxXs6kZ4H0rfpPKq
         emu0SkdUMUaPDPNQMHeWDYB5I7e2BNz7Vx864brt4kmIZ/CYXCyKWi+0B9mD50fRESM8
         4MSd6RAwPRlxig/I7ixHdKlIzWUOmq0/OuEeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=9xrGyjBP9/lId96bp3b0igZ5Fq6/ehIsq8nZJf92rko=;
        b=sM/yzOtf1oA/y0EhQ5QeGFPOQT6DseWR3iAAvVEzvIEMmfza/AgM5qQ+1MJxPkg95l
         /9yq49cnwf0FNG0EhL+eARS4QRH44dayFvZiICtzB8J1TzT1gJTGoIiXZxjNocKxx3tG
         AV5duQ14zZFHOTul5j5H6/94f4VqyebvY/Npo43uH4Sfe0w0dOWeZG062A8lsU3TphUn
         z77GG/LDVfzT89nXHRXSiX9YlXQ3D/edxN/WfnRQUf9arpDllDyXtfOMLxwquKRqpHFz
         GWUpAVAog+s0Ag1hPuXqNgVXfXWz4WqqKbMGDjPOG/mx0U5udYe23QiXK3j3GjmInhrY
         03xg==
X-Gm-Message-State: ANhLgQ1EN9JgwrYKBPG5nPdqToBTRF0mC950Ea7C4INeZMzfRkIkREwI
        S0lA2UaWrI7Wz3Jbh8wKzTPgKP3p7jA=
X-Google-Smtp-Source: ADFU+vsELhgfsIXkY//Egix35HBOFMo21WrTy/dWY0Dm1iIST3gawKKEcusOZCNKpBkodKXdPRL59Q==
X-Received: by 2002:a17:902:8b89:: with SMTP id ay9mr21466796plb.309.1583862860685;
        Tue, 10 Mar 2020 10:54:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h6sm2792595pjk.33.2020.03.10.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 10:54:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310063338.3344582-2-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-2-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: remoteproc: Add Qualcomm PIL info binding
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 10 Mar 2020 10:54:19 -0700
Message-ID: <158386285904.149997.9749528768955800249@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-03-09 23:33:34)
> Add a devicetree binding for the Qualcomm peripheral image loader
> relocation information region found in the IMEM.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
