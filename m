Return-Path: <linux-arm-msm+bounces-3430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5191A804FC2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 11:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 862DF1F214AE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 10:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194984C3A2;
	Tue,  5 Dec 2023 10:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfnNa7j+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD930A9;
	Tue,  5 Dec 2023 02:05:05 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50bf37fd2bbso2860167e87.0;
        Tue, 05 Dec 2023 02:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701770704; x=1702375504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ceYdxCZagZpSeCFLYFzxnNcJXtK8XBSjVUScbGg+gCE=;
        b=FfnNa7j+Hi+IrtzzWGx30iOIYfWkNX4fRH54pN43lVnf2QEeHZNGdj1am6tBXhZhSa
         rC5I99g7pi8mCmMM7bAIP1KcU4cwwp1KTUhWyGZUfQJd0KeTbSEMUa0V1gtlyQW0WM7+
         VU1zrk5OYIUjKFgTZkVZplRIz5zMxk3SzJf0t+MypoKCdGd6FknQV9uZuqGALuwYyC0t
         pzvTGxm/krO03MTwluR/sf30pihXME3/VPPY4SykDev5vKsQRPy+VIteNm7XJNC0BTYV
         b7H23/3TbDurjS97GLbi+qZkXm4uteLLAE9V5L1+WeGQdlpheomeUdteraTEiD54Tdqk
         ZCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701770704; x=1702375504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceYdxCZagZpSeCFLYFzxnNcJXtK8XBSjVUScbGg+gCE=;
        b=dUSJRC+rB6ibXjTDVlLKrVfDRrnIf5BlzVQ33+E9B3kjPxLUFhW2HceaFfKapXczDE
         IJ50SJF86pWuVlKEg+iOTvadvc1u8QGSpiRD3jzmYG6u1EZ1Tz6r+YkLaZBvyrnKK2Z4
         YF9AkLcneovxPFeoJShCK7EMMOWatpBuwiB1kN+J6afEdYeoP62h61x75cwer6MfmflX
         CXjLrlne/xR5ukKJDNj7+FuZFGBha6g944AfK8tzkh4Te8d20z49vDQgjVuO+J8A5lGJ
         70YwXWPNkd0Vk/WPeeSGzB7+hvtjJ2N2FgANKMovDAUJ+7maubGfUOy98LC6rbxwTnyx
         1WTw==
X-Gm-Message-State: AOJu0Yy4CLY0aZs2cd2ShTHwCE+T8B8VonwTJ++487IMMcJ3nF3vzR8V
	EvzJ3BZlLqe0P5wAYxMOHy8=
X-Google-Smtp-Source: AGHT+IFsxWxor1w8WHtWV1o0i+23KJ3Nkjh3BSrlVrP0/buct3ZAchb106gkjeHNqo3qrVKMznHGsQ==
X-Received: by 2002:a05:6512:3189:b0:50b:e6f4:666c with SMTP id i9-20020a056512318900b0050be6f4666cmr2752238lfe.123.1701770703549;
        Tue, 05 Dec 2023 02:05:03 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id o12-20020ac2494c000000b0050bf0320718sm781130lfi.95.2023.12.05.02.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:05:03 -0800 (PST)
Date: Tue, 5 Dec 2023 13:05:00 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Halaney <ahalaney@redhat.com>, 
	Suraj Jaiswal <quic_jsuraj@quicinc.com>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Prasad Sodagudi <psodagud@quicinc.com>, kernel@quicinc.com
Subject: Re: [PATCH net-next v3 0/3] Ethernet DWMAC5 fault IRQ support
Message-ID: <zzkw5obc3z5fndowmrycy77gtjf6wscvkj7klnn34f3ycs3her@hmh5aebpbi3s>
References: <cover.1701695218.git.quic_jsuraj@quicinc.com>
 <rw5vfdvre5rt4rwytfsp3qy6sgsdr3dm6oefr4sap2aqbvpw42@c2dxz42tucby>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rw5vfdvre5rt4rwytfsp3qy6sgsdr3dm6oefr4sap2aqbvpw42@c2dxz42tucby>

Hi Suraj

On Mon, Dec 04, 2023 at 02:16:12PM -0600, Andrew Halaney wrote:
> On Mon, Dec 04, 2023 at 06:56:14PM +0530, Suraj Jaiswal wrote:
> > Add support to listen Ethernet HW safery IRQ. The safety IRQ will be
> 
> s/safery/safety/
> 
> > triggered for ECC, DPP, FSM error.
> > 
> > Changes since v3:
> 
> This is listed as v3 in the subject, but it should now be v4 since the
> last version was v3.

There are several style-type problems I would like to share. But as
Andrew correctly noted the series version was incorrectly left
unchanged. Please resubmit the series with the version incremented.
I'll send my comments to that new thread so the discussion history and
the lore archive would look cleaner. Thanks.

-Serge(y)

> 
> > - Fix DT_CHECKER warning
> > - use name safety for the IRQ.
> >  
> > 
> > Suraj Jaiswal (3):
> >   dt-bindings: net: qcom,ethqos: add binding doc for safety IRQ for
> >     sa8775p
> >   arm64: dts: qcom: sa8775p: enable safety IRQ
> >   net: stmmac: Add driver support for DWMAC5 safety IRQ Support
> > 
> >  .../devicetree/bindings/net/qcom,ethqos.yaml   |  9 ++++++---
> >  .../devicetree/bindings/net/snps,dwmac.yaml    |  5 +++--
> >  arch/arm64/boot/dts/qcom/sa8775p.dtsi          | 10 ++++++----
> >  drivers/net/ethernet/stmicro/stmmac/common.h   |  1 +
> >  drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  2 ++
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++++++
> >  .../ethernet/stmicro/stmmac/stmmac_platform.c  |  9 +++++++++
> >  7 files changed, 45 insertions(+), 9 deletions(-)
> > 
> > -- 
> > 2.25.1
> > 
> 
> 

