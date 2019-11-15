Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0335FE5C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 20:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfKOTif (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 14:38:35 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33150 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbfKOTif (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 14:38:35 -0500
Received: by mail-pf1-f195.google.com with SMTP id c184so7168575pfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 11:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=rpIokldTgdr5Exrhz1mWV7HaLCSuNS/NOSl6iO2Uvg8=;
        b=UXpz2/GGf6m28T8JsRJL22/FmaujD4Zkm42D4hqF1gSN9xyzIKBP3jZPikdFoLutN0
         1QwHjpjumV9GiZEurjnQujKejh1y/BRNClPVP3v+DWWoMqXo/U/+jfny1z67SpJ8Aedd
         x6F5L4BYk9ZEUUHmuomaBUpqdhxgthCmLWzwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=rpIokldTgdr5Exrhz1mWV7HaLCSuNS/NOSl6iO2Uvg8=;
        b=nkMno4i/f1pf9uzp6S+D2E3vccdcrm4a6UVa1hDjoKvwGc3GoWn+42MqPEuXIRNFhv
         +DK46RsqMRLBRzKbswYefbJNm4uBC14qDyZPpA2Yf2lgTeho1NuadV/FSumV6TohR+ut
         w2d4sNAeoSd1jer0lNi30Jf6Ld2TaIJUnygwzf697exRLbhCmUadE4JpAlBQ4zMz0DC3
         KxzCMTuAiDykdIez1Td2nZbzBCAx4RuKW5wOO0JjOvcbs41OpbtXtzz5twrY9knvt3MQ
         so3jajy+NAn3R1twobZSlqT8Rs8SN7CHiaoI/U6VR1lQo8BOQaMuKQ8x4JCqxJB7ohzt
         x0Ag==
X-Gm-Message-State: APjAAAUyNYEmM88zY2WrODGjl26UYGA/Mlu0zOo0uvyY4nKjkN6RFeaW
        Lo+5TJc0Qcx/LVVqZ/1OJdY0ew==
X-Google-Smtp-Source: APXvYqykqc5dyf2YeTH9F9RX5Ivj9h24yWKDFvAQmQ98bDBv24JthZfMkfiBfpD1ahLZlS9AfiPdcg==
X-Received: by 2002:a65:6145:: with SMTP id o5mr17611208pgv.38.1573846714978;
        Fri, 15 Nov 2019 11:38:34 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h23sm10528899pgg.58.2019.11.15.11.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:38:34 -0800 (PST)
Message-ID: <5dcefeba.1c69fb81.258f2.f70e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a2bb92de65e90768bf1d6b8c0b7fbd43cba704d2.1573814758.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1573814758.git.saiprakash.ranjan@codeaurora.org> <a2bb92de65e90768bf1d6b8c0b7fbd43cba704d2.1573814758.git.saiprakash.ranjan@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: sdm845: Update the device tree node for LLCC
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:38:33 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-11-15 02:59:12)
> LLCC cache-controller was renamed to system-cache-controller
> to make schema pass the dt binding check. Update the device
> tree node to reflect this change.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

