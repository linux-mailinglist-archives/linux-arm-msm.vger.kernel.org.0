Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3963FDDFF5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2019 20:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbfJTSUf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Oct 2019 14:20:35 -0400
Received: from mail-pl1-f180.google.com ([209.85.214.180]:45534 "EHLO
        mail-pl1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbfJTSUf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Oct 2019 14:20:35 -0400
Received: by mail-pl1-f180.google.com with SMTP id y24so1467228plr.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2019 11:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=2MtOrLGldIQir4DqPUZct2Uqjg6gZZx4ZsJhImJZB/Y=;
        b=CvmnNqfUInvhCEAUH5m7TYVs8zeQG954/MU4KQLjxoxKlHwc4RYLdCNn/3GuR1zwo+
         Y9K5Cn8wnI5/K2YljAw4ouj9kvwAWa2FAkaagO+6t35xljSNocBz2iceDF25a0PwOHlb
         Jp1LUZTSqJX07ddu2n449lNElnhmPgdJBV1xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=2MtOrLGldIQir4DqPUZct2Uqjg6gZZx4ZsJhImJZB/Y=;
        b=Ysa2wbpT4JwvqoNjc2Si8mTfnP94rPqH5l0RfpiaO9GYcLqvyPeb1iz5ZSpGMnxIGL
         Yjm4M5kbX3nO2iXT2H/x8n5A/rkn3VqdAl0QDtMw3P92gC0OIfigPsPCWpWupt2jqssJ
         lichYVl4e+nTNKpgBr+GCA0CzweKZG7Z9JQ/tBsdzpUdU2d/yGaO54LDsctzNRbYyec5
         SjGnn8XkAnwj3Q+8nzDtLKt6VmgVhNTYmrXqwsVSyJEW/ocukls3Tht4vdAWUGE62gla
         46pT43PI3sTCSX4sfp8shLPYGUuKTb3joua3t1NbpPrI912Afy0z++NxqbTKDDqngZjs
         WUmA==
X-Gm-Message-State: APjAAAXofRYl+UjnyRa3aorg+1+4YYJfQFeFSQul1KsJ0xO/uyYd6LtJ
        E6qGeKDM6QOPSNsvcLdlynDMhQ==
X-Google-Smtp-Source: APXvYqyDPBZyE4SebG+Ea7Ud6L1w8H8RdR89Dwzy6WlI0msmIT9RKOQk+hL8Js9Nwxi4tSZC4vU3CQ==
X-Received: by 2002:a17:902:be17:: with SMTP id r23mr11921775pls.97.1571595634953;
        Sun, 20 Oct 2019 11:20:34 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z18sm13510136pgv.90.2019.10.20.11.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 11:20:34 -0700 (PDT)
Message-ID: <5daca572.1c69fb81.68ee2.1f85@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b5d9e61c4a68ef3290958a891c9361523e0073c0.1571484439.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org> <b5d9e61c4a68ef3290958a891c9361523e0073c0.1571484439.git.saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv2 2/3] dt-bindings: msm: Convert LLCC bindings to YAML
User-Agent: alot/0.8.1
Date:   Sun, 20 Oct 2019 11:20:33 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-10-19 04:37:12)
> Convert LLCC bindings to DT schema format using json-schema.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

