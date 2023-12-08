Return-Path: <linux-arm-msm+bounces-4008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB6380A796
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DE6B1C20847
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A7832187;
	Fri,  8 Dec 2023 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0MPu8vV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D7B171D
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 07:39:04 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5d852ac9bb2so21003617b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 07:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702049943; x=1702654743; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7MZJu14fY+AvBnw0S0L7ez7N1p45/8AxvVrDnnGIeVw=;
        b=w0MPu8vVbDcl24ZCtZ5wAkvwfyDJV7PUhEs4B6bzxkKzSfo34Cn9gOgedM02RWUyVC
         gf4JZjLGj7wqNYAyHjpylP2QSqVlRCIYjJ/cLaUxUi5KCZL+2Ifr3ExbGT4ZqystxvyM
         TRSHSJDZ4o/7rw4RXUADsK7Sp8ozPgH3qa1uFDTFGr5eHvbGCtCOQxF0JsfEnVo3hcOY
         uUYnPgza+tH1k1BfBjqNI1KGJreT9NBx/4STDDKAKxfTFv+vL9qLW25kScx2YdwHAqao
         BUKyJwrv9CTY5Wj6GN4dFfTLceMN+rFzRyNQzWl+s4I+Z72J+4KVD0B+rjBXDLiD3sZy
         dGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702049943; x=1702654743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7MZJu14fY+AvBnw0S0L7ez7N1p45/8AxvVrDnnGIeVw=;
        b=Y/9wAEryCcGOrX+LaZTwa5NDDOz+Js+m56ltRz/nlbpw9Ga1dNQm41eKZu8/H3I/jF
         f9hqSTMwCSHGgRk11qI564eFyOuRY8lIf3bg8V7/smy/0TdpOdWvNOeEXbreVabk5pH9
         XoGJ5qMsIVbo11dP2TiFb2QmfgkZyyiYfJa8kISKRJzD3MaWYosIlfFoQOARkp3D0I2D
         yy0z4Elx7x6g0h3JVw2UhF6Sh/2MV/Wi15kLvzVTjptnwbUrWJf6J7X3G4UqMcmSZrcg
         psLpHNRSM7ha4VhUFsWk5Rn6uLibn0fbQNevyXDXmpuxHTGvZ3EHTn9YHnqMY+fx8c7M
         vocQ==
X-Gm-Message-State: AOJu0YyLJJsVsGsyY+zSewYC3TOzXV7vmXp63P4wPyIm4B5IU31hb7bX
	esUYebDfR8JcMvWmLKXQcL3o1axVXe6FgAHBz1EHnw==
X-Google-Smtp-Source: AGHT+IGbaNOptbzhuujTYMz8xjdNoT90V6iTzwabvFVckhGNiM9IC3bHsXvypEOAJ2pfx21kbyRVY1rhl4Vkl8cS1zk=
X-Received: by 2002:a81:520e:0:b0:5d7:8203:597a with SMTP id
 g14-20020a81520e000000b005d78203597amr131100ywb.51.1702049943395; Fri, 08 Dec
 2023 07:39:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEPPPKtEoiF-xiNm+LjCxb_Rt4c7rrUDRr7KkGE_8iJDuc+M1g@mail.gmail.com>
In-Reply-To: <CAEPPPKtEoiF-xiNm+LjCxb_Rt4c7rrUDRr7KkGE_8iJDuc+M1g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 17:38:52 +0200
Message-ID: <CAA8EJpqMEmORJYZKHKBwexBCjmA916d9_-Y+eAByFD_VFQiA=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
To: Xilin Wu <wuxilin123@gmail.com>
Cc: Andy Gross <agross@kernel.org>, andersson@kernel.org, gregkh@linuxfoundation.org, 
	heikki.krogerus@linux.intel.com, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	neil.armstrong@linaro.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 17:27, Xilin Wu <wuxilin123@gmail.com> wrote:
>
> Hi,
>
> On Wed, 25 Oct 2023 14:49, Dmitry Baryshkov wrote:
> > On sevral Qualcomm platforms (SC8180X, SM8350, SC8280XP) a call to
> > UCSI_GET_PDOS for non-PD partners will cause a firmware crash with no
> > easy way to recover from it. Since we have no easy way to determine
> > whether the partner really has PD support, shortcut UCSI_GET_PDOS on
> > such platforms. This allows us to enable UCSI support on such devices.
>
> This issue actually also exists on an SM8550 platform, specifically AYN Odin 2.
> I tested the patch on AYN Odin 2 and it also fixed the issue.

Do you have the latest firmware available? If it's true, please send a
patch adding sm8550 to the list of platforms requiring the workaround.




-- 
With best wishes
Dmitry

