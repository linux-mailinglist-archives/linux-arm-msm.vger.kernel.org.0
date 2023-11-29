Return-Path: <linux-arm-msm+bounces-2396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 082CD7FD33C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 10:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3951F1C20980
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 09:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7370114267;
	Wed, 29 Nov 2023 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWytgJWZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E29D6C;
	Wed, 29 Nov 2023 01:51:23 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40838915cecso46789325e9.2;
        Wed, 29 Nov 2023 01:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701251481; x=1701856281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6s49NkgqWAb2LnIjZ7sm9fhr+G6maRXMhGbQfVxBFQk=;
        b=jWytgJWZ6bwNN1KtDsbLW0NRKkBBB1E1FQmHSw24Q7G0l5tkRwvFSmPki8ZYZvea1c
         R4vlK8SP/3p8+a/jb73CiQijvUVcfKZF+EI3SPAM4y6mXSw2fLtOnxxbLYDDtKIyglnT
         kn0z2cF8JU38OnSDVdmywa/4pKbaYerU4oc/7eY5I3+0g/4q0z6fQ6eVBD8ecOO4F3RD
         DFfW1pALvTd3htGkwVnnlVClCYBk/ymOOjGguNKeL30wZKD1Wso6OkghtzLRO2h8phwk
         f4xTlURSn9SgD/nFNh+kGw+G68fiHsL6X4dVYkMIWxfnk4SZo+yvPTN14i0lfP1sGXkk
         UO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701251481; x=1701856281;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6s49NkgqWAb2LnIjZ7sm9fhr+G6maRXMhGbQfVxBFQk=;
        b=qkyB92ez9o05jPWSIzuDgrP5w/g7s+05HcFIlm2bM9HJ+ztZNLEtlDALnPj7qwn+pk
         8o/sKthhRN8sdek0Kb7otT408ltw6C2qnfPxmDtxL53GlUJGUpv88auelC5tkBhLLSIl
         IqNz+mbKv6f1yIU+ueKTixw4c1h8n8EtKuUMxBeBb7q3qsRC7d7XzOaIn9pZeGp5c+o2
         weHVLp89O5i8wFoRW4RlJMWhzQLGplbZVSiv1F/5VUglv0TsWlgLQwkZZyJC8Y+XObXk
         DaSC9RPAKhF8dTQNoag2I5x0X5wCm/WwbB4ilWEUoR3T4Z5/yPeX4JZlpk/E+e1ttVoa
         rzLg==
X-Gm-Message-State: AOJu0YwKxCe+gckcP0qj3xtzZEi3Lh4nAWMBhyCiNaGy5LtN+a1RKA1O
	bS3RSEIttRv6BSwJumGn0ns=
X-Google-Smtp-Source: AGHT+IEDBtku78XiW3LUgqwyucltQA7Rb1AhKKKDLz5hBamwHeAYpgOr4gHWNEC5NHnvJZj9HkhHvA==
X-Received: by 2002:a05:600c:3592:b0:40b:4523:693a with SMTP id p18-20020a05600c359200b0040b4523693amr7528147wmq.24.1701251481109;
        Wed, 29 Nov 2023 01:51:21 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b0040839fcb217sm1599796wmg.8.2023.11.29.01.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 01:51:20 -0800 (PST)
Message-ID: <65670998.050a0220.212d3.3fb2@mx.google.com>
X-Google-Original-Message-ID: <ZWcJluKs2hvNzNy6@Ansuel-xps.>
Date: Wed, 29 Nov 2023 10:51:18 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [net-next PATCH 10/14] net: phy: at803x: drop usless probe for
 qca8081 PHY
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-11-ansuelsmth@gmail.com>
 <ZWcICtVc0dBDi3pA@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWcICtVc0dBDi3pA@shell.armlinux.org.uk>

On Wed, Nov 29, 2023 at 09:44:42AM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 29, 2023 at 03:12:15AM +0100, Christian Marangi wrote:
> > Drop useless probe for qca8081 PHY. The specific functions and the
> > generic ones doesn't use any of allocated variables of the at803x_priv
> > struct and doesn't support any of the properties used for at803x PHYs.
> 
> So now we have two different structures in ->priv _and_ ->priv can be
> NULL all in the same driver.
> 
> This is getting rediculous.
>

Saddly this is the state of this PHY driver... Imagine me noticing that
qca808x actually don't use any of the priv struct and doen't support any
of the proprerty parsed in the OF function...

Guess I have to move also this change where I split the driver.
(again trying to keep change as little as possible)

-- 
	Ansuel

