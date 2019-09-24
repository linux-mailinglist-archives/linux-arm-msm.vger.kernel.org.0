Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61613BC592
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2019 12:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392543AbfIXKPz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Sep 2019 06:15:55 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35943 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388966AbfIXKPy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Sep 2019 06:15:54 -0400
Received: by mail-lj1-f194.google.com with SMTP id v24so1292596ljj.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2019 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bFNBIwYGXh3W3xec04ohuzNopNX9928SWLsxV+VA2GE=;
        b=L6WIgkbCsuUuThECVuZlkY64LJnAunfugsoz8XjeyZLcCEggai5GSV5u0g1G9xxXwU
         yNniVkBV54dfXNIZP3kjw/iqd2cfTdhQkZgI+C9DT6L7dk37d7Upx8ibD4EounfcCYG5
         l+//3FX1bm28oeQrtj8lwlkN7eEzJ4E2lLaKVKTUb9oDvMXHlc/u3XDsR3aWk22h7Ijt
         CuSgzhBoHWZ3iikAnxZYW1fPyKUbOOR2NMeyaCd3m9BbS1UkQb147OBXuJYeYgLjRfXf
         IA+kQTYXcMRIHpg93pcMBZeFnHxRPiGDKfkBHYaE7qeZe4EuWaAqkCOp0m9/Zp0RNrz5
         4CKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bFNBIwYGXh3W3xec04ohuzNopNX9928SWLsxV+VA2GE=;
        b=ZMY69xAsTuZRDso8FI5n+AJhXxa0qOsHhFLtCvzvEwMFD++mW6FwzzS0u2OQUb1yV9
         UIknopXv5o4GPP8ROV7yldmRS8FBhYsnapt8HuKqu3icRu4o8BT+q7tqD5we2EwOIypv
         WzERtqv0kWzDuiNw6h/+3XSRcQ7YhNt15FiuqQwuv2QnnaxG9ps9gQC7Hl5x2sL9+OyX
         yRGB7ghOS5cl+Ls8V33K/V6/lnd6zjED2YsludBrnfMVK9ajZUr39DndOtqYVn4qzl61
         3X9c1tBop+R8OCkW1tr65dTqCojjnO26IN5mRdbNZFan2mmWB6ru3Vg81uYwj0lfsNUt
         BHSA==
X-Gm-Message-State: APjAAAW+7Op5uWlQiHdAp6ervl+5LrArymmtKHwy+bAI423szltJHZqU
        L7ab+GWahNGr7WVczBiC8/eO9w==
X-Google-Smtp-Source: APXvYqwKDNgngzgmWt1lYRBKRHdrylqVvc3sFKBkxNaGdFkIqDe+rxcoE8Gx4AB/uhCYNKqeRKNB2Q==
X-Received: by 2002:a2e:9854:: with SMTP id e20mr1489432ljj.72.1569320151290;
        Tue, 24 Sep 2019 03:15:51 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:4446:e9d8:3187:5029:b7d6:f734])
        by smtp.gmail.com with ESMTPSA id b21sm357198lff.96.2019.09.24.03.15.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 03:15:50 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8996: Update simple-pm-bus
 node name to 'bus'
To:     Simon Horman <horms+renesas@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190924093609.22895-1-horms+renesas@verge.net.au>
 <20190924093609.22895-4-horms+renesas@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <3d9dcd04-b34d-957e-6269-cf39a15b4b27@cogentembedded.com>
Date:   Tue, 24 Sep 2019 13:15:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190924093609.22895-4-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello!

On 09/24/2019 12:36 PM, Simon Horman wrote:

> Update simple-pm-bus node name from 'agnoc' to 'bus' reflecting the
> proposed binding description in json-schema which in turn reflects the ePAR

   It's ePAPR. BTW, you can now refer to DT spec itself instead -- it was based
on ePAPR...

> standard - "the name of a node should be somewhat generic, reflecting the
> function of the device and not its precise programming model."
> 
> Also drop the unit address as there is neither a reg property nor
> non-empty ranges.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

MBR, Sergei
