Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F7A21E37E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 01:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgGMXHD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 19:07:03 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:35925 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgGMXHD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 19:07:03 -0400
Received: by mail-il1-f196.google.com with SMTP id x9so12704627ila.3;
        Mon, 13 Jul 2020 16:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XD8Qp7XrZb1VlWk0cHyUPuVRZvA6jvJnslf6vnJBG5I=;
        b=GDLNLKypHpZo3NH123Ar91smvS6G8Z/ee9XuG/0t3oCRmCqZ8a1gJawnSdoIv1su1S
         tYMcjkCG1vUROMQYkqnkh7VkG8ptJO5PMQDe1+n3G3GJqGW9Fh8qYGyGO08cvnhs4B+7
         IjFgZeyFVKMiBF5HFOq1VIArFPbN2ujVuvXB/q0jfo5fXT/3Dj3w7Rhkws4udZfdtrv3
         DjS1AelVNgHdH9Zk/U5tiUNqp/xKy6V6fkedDcS1kgijGbQKXwcO5KLnorNkX4eRpKlB
         8bpp7kWxavGczHPpY7sQ4lfNkEAqWd/bqlQzLEmuWo0aU1gzxxuc4l+nd2H+Zo1TI32x
         uqdQ==
X-Gm-Message-State: AOAM531VmVbiNKAQlt7VSwAjf1i2rw9mCtk5/28xhV6ZzhemuXSGzb+J
        K9d34yvMVc/E8R7b+9a1kcexsLF8yQ==
X-Google-Smtp-Source: ABdhPJzqLgZpj9nW/yRrEuIMFvgtNzMnjI9a5YOoaOTvNrguxrtDXhLyEpT+Zk4svd21mNHtX8oylw==
X-Received: by 2002:a92:a196:: with SMTP id b22mr2025429ill.303.1594681622795;
        Mon, 13 Jul 2020 16:07:02 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id i12sm3919709ioi.48.2020.07.13.16.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 16:07:02 -0700 (PDT)
Received: (nullmailer pid 891297 invoked by uid 1000);
        Mon, 13 Jul 2020 23:07:01 -0000
Date:   Mon, 13 Jul 2020 17:07:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 12/14] dt-bindings: power: Add missing rpmpd rpmh
 regulator level
Message-ID: <20200713230701.GA891266@bogus>
References: <20200709135251.643-1-jonathan@marek.ca>
 <20200709135251.643-13-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709135251.643-13-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 09 Jul 2020 09:52:43 -0400, Jonathan Marek wrote:
> Add RPMH_REGULATOR_LEVEL_SVS_L0, used by sm8250.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  include/dt-bindings/power/qcom-rpmpd.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
