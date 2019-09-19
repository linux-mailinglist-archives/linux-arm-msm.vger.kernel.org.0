Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85835B7037
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2019 02:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387605AbfISAx3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 20:53:29 -0400
Received: from mail-pl1-f174.google.com ([209.85.214.174]:34737 "EHLO
        mail-pl1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387547AbfISAx3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 20:53:29 -0400
Received: by mail-pl1-f174.google.com with SMTP id d3so777907plr.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 17:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=ex9rUQL+OJKYYhbhN5KToiVk5tqfEncnCZ8PLvYAyAI=;
        b=I6EwWMaeMxFk/HXli6epcKdtu117wdLEGInSTM3MEx7jZ6dJlhg6TYmHn1OlIrmLnX
         9oZU2+9V4nFkpeziVNZHFtY8oWsbjRmV2KuIz3W9EWl9W+EvhGv1fs780DWXH/I0cr2x
         ziG68200CsfjNI8oWzbp/YNKJbwf+92TYpFLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=ex9rUQL+OJKYYhbhN5KToiVk5tqfEncnCZ8PLvYAyAI=;
        b=t/qHSR2LWmkgMVIlI4jOQNCge1l/ISJjp9UJ5D7og/NnT00sAduOaiop70aYv5s3Zy
         RFPyXgNUAPfmb4C0s0HVDduxEHhTBhO1UU2tWgrjAU5ejc+coDGgujoLHLfvttw0mzsV
         +xDSA1/ZRvtP777LlcoTgxrFGzWr66FgLyxe4AwlgPg2b52WgUgvOtxUcD2WXm7P9HlV
         INK48GFwe6kt1rDlNevS7MqFFzpungqr7WbfUKwYmucexddZT7pSgrLIb1rYE+igwSHn
         ohoD6Zn9ahgtyadXhMz5YZBYFyhRBJEAzNV9zHryWYKX+yr90np+5OauvpKBvXPznUWI
         WEFA==
X-Gm-Message-State: APjAAAXHKpVLWE4dVpR97eXFB40io5g2D/j0tQqf9wLdDiTSPZAaMk6G
        SHh66G4A8o5vlPkaZFTcMyHO1q6F+8c=
X-Google-Smtp-Source: APXvYqxem6DCTC1eMDn7xjXLkC5brOjq3FB50tq/9uO3+hR3/3TGD9xLISDWzo39z92diQKZvV74dQ==
X-Received: by 2002:a17:902:bc46:: with SMTP id t6mr7191923plz.307.1568854406970;
        Wed, 18 Sep 2019 17:53:26 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q2sm10846812pfg.144.2019.09.18.17.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 17:53:26 -0700 (PDT)
Message-ID: <5d82d186.1c69fb81.23c8c.8bf8@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <01e14fb78bb1e13c235645281b462a548a1de304.1568712606.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1568712606.git.saiprakash.ranjan@codeaurora.org> <01e14fb78bb1e13c235645281b462a548a1de304.1568712606.git.saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Will Deacon <will@kernel.org>, bjorn.andersson@linaro.org,
        iommu@lists.linux-foundation.org
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv6 2/3] firmware/qcom_scm: Add scm call to handle smmu errata
User-Agent: alot/0.8.1
Date:   Wed, 18 Sep 2019 17:53:25 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-09-17 02:45:03)
> From: Vivek Gautam <vivek.gautam@codeaurora.org>
>=20
> Qcom's smmu-500 needs to toggle wait-for-safe sequence to
> handle TLB invalidation sync's.
> Few firmwares allow doing that through SCM interface.
> Add API to toggle wait for safe from firmware through a
> SCM call.
>=20
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

