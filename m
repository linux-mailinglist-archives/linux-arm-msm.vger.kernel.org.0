Return-Path: <linux-arm-msm+bounces-74216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C72A5B8A283
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 17:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBD6E5A7403
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 15:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5877B229B16;
	Fri, 19 Sep 2025 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lqH5Vu/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167291C862E
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758294182; cv=none; b=hE1FyiSNXzT5zgZulKOOFw0QrqE4z6i+lwO/xU0geIAzNxQS+biwvmhuERQcAkjQahvXDTbHQ4OgfSLmpG/imD2rtc1xwP0OdICct80Vq6usP7FGjxj8VKCYNGzPpz1HB642RQ4BQAWuf9UuxqAqW+fsGDAxz1eVUQGYBU+n4+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758294182; c=relaxed/simple;
	bh=yJDbiEVUS07mmti0ILNgyNrCuuyjwpOfHFogMMEzfLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBxv0d1bjdXmZ5IWv2xfJm/A/KussdX91lnzUxddASejYxb/ZUmjCbYH2WHaF2YsnmaXaZ1v2i4zw/Pv60aEss41uQXLXhI6ZTQVyoRt0B0QRkbWTsFEB+YDZ19Bh/bVYtmcMEz/44nSD+BEh0mDTxBhTfxN5qbgIGArEs+Gv1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lqH5Vu/g; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so326430266b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758294177; x=1758898977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RuhmeiLRDOZblDBgAns4hX7zt5ydWj4wdgPVrc0nj58=;
        b=lqH5Vu/gBEodaaOyTpEOiAf9pJ9krRfuophAPcgH6n1USEDzWicu0lItL5tKLv/KI0
         Eb/TRCI2oFGip88b5OXQVSGauGZwmHDsIlRy14e8FyOfsbZ9R8Qwt+ALchD23uhvjFyg
         pZfI3m8pX1kVOFXHsjWcbUJd5n94a5aTDEfGZrT5M96US8Va/mT64Ij+ywevp1SHALbA
         C9g02KUKHzVL8KEfnvpvLmKoufb6Y7r5l9eUrZOjHd4tOcwe8txh9tyrVFLIOsEpM5Qt
         DsTNJPGukqghCcI4Tb8dfIPJvLcvkkW5yXACppDfsBDEY2Zr1PS+7AyJbcA3kX00RLn2
         TMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758294177; x=1758898977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuhmeiLRDOZblDBgAns4hX7zt5ydWj4wdgPVrc0nj58=;
        b=Mfuj7fu68myRkoIfvkGpvWRzBfceJYWnV/MrgZdXLcUdE9RZ1T6uIt2QfSvG4XQMWH
         Q9zZgkMv6QI6zDHZg8Xf3BPER93p2iJE8IaP1qs3pkebguAEoi+wvVPaBe4NTrX6DB4Y
         e1HxlR6aTYTA2tb+uE1vHqluj6p50/QzkyWSwTsuVG9rKHX4zrnJNEQJ4ZVcX7HdJuxD
         rlIktm3yrtuFjyzzSTKqAgC3UJlqg/mvruLYn6xAzE4Ca/ErBeE72mmLS2q+Zch0Pmf8
         wZ8Of6iemcfTkAyEJ8lTvTF4+OX5KAod1Oo4ouj7kY7jSUfB73m9AtptR634gW/21v2f
         JVng==
X-Forwarded-Encrypted: i=1; AJvYcCW1F5fnk0f3u8im208y8UKl3sa0lHp4ns2rwNr99Rk9e2gUWQs5VlvS+e1cjKRqhb3vLC0NDypGz8WJONcq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2lXT3TrkaXVtKHC5+GiwF8aVUQa/Ey4S53BuRRIBmx6H4kLKU
	e77WFfuiJgfogED5a2tq4+uB2Ub6Mu4va/9w4I3nObkupmA7FUl0+bhWlJk/IkzEBps=
X-Gm-Gg: ASbGncvT2QBfjFo7yKj8ABQ6NBSBpvD2iwC6L3W8Whn+P0KQZ92ruqZpOVMjMgE9OkB
	0qNPeRZhoJbxqiEYs0/pU/zsyNG5hHhDPH8ZwIqW3YpsvZRhVtQXtQ0+R/mGGsv8bw5BVZXaKJq
	ezVn9KaoS+jbgNCcgHjxfNOmZQueIK+8NQ3o2xFUKXEL1FohUs+/ZSAWIt2rCCUzMw899cDlHlY
	YJtcwczPTgsGPsSm1kH5EMlWhvBVVKOlOmnzjMIpVneFQPF26vNRDe9BA5Ysyp7QR5GzQK9qqkg
	q8SSLvN95JSx3tY56/C9oUPFwGNtF2G4jNc/kheHthB9JknI9LpvdxzrJp5szXg2WL3C0fZVy1q
	LB26HWZGkNtAPdOGD3oyvbs1R32asJRLf
X-Google-Smtp-Source: AGHT+IFfO0W8JQzVl/Y/fMJyVo1TEp0T/8tQQYw78b9ni5HcTOJsYbcXUUCxll2lkB3I4VDq0l24kg==
X-Received: by 2002:a17:906:bc94:b0:b04:7232:3ea9 with SMTP id a640c23a62f3a-b24f56858a3mr307356066b.50.1758294177283;
        Fri, 19 Sep 2025 08:02:57 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:b511:37d7:e73a:6aaa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd1102093sm458529066b.83.2025.09.19.08.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:02:56 -0700 (PDT)
Date: Fri, 19 Sep 2025 17:02:52 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Xilin Wu <sophon@radxa.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 0/3] phy: qcom: edp: Add missing ref clock to x1e80100
Message-ID: <aM1wnAw0mA-iNgJy@linaro.org>
References: <20250909-phy-qcom-edp-add-missing-refclk-v3-0-4ec55a0512ab@linaro.org>
 <6A43111ED3D39760+a88e4a65-5da8-4d3b-b27e-fa19037462c8@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6A43111ED3D39760+a88e4a65-5da8-4d3b-b27e-fa19037462c8@radxa.com>

On Fri, Sep 19, 2025 at 07:06:36PM +0800, Xilin Wu wrote:
> On 9/9/2025 3:33 PM, Abel Vesa wrote:
> > According to documentation, the DP PHY on x1e80100 has another clock
> > called ref.
> > 
> > The current X Elite devices supported upstream work fine without this
> > clock, because the boot firmware leaves this clock enabled. But we should
> > not rely on that. Also, when it comes to power management, this clock
> > needs to be also disabled on suspend. So even though this change breaks
> > the ABI, it is needed in order to make we disable this clock on runtime
> > PM, when that is going to be enabled in the driver.
> > 
> > So rework the driver to allow different number of clocks, fix the
> > dt-bindings schema and add the clock to the DT node as well.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v3:
> > - Use dev_err_probe() on clocks parsing failure.
> > - Explain why the ABI break is necessary.
> > - Drop the extra 'clk' suffix from the clock name. So ref instead of
> >    refclk.
> > - Link to v2: https://lore.kernel.org/r/20250903-phy-qcom-edp-add-missing-refclk-v2-0-d88c1b0cdc1b@linaro.org
> > 
> > Changes in v2:
> > - Fix schema by adding the minItems, as suggested by Krzysztof.
> > - Use devm_clk_bulk_get_all, as suggested by Konrad.
> > - Rephrase the commit messages to reflect the flexible number of clocks.
> > - Link to v1: https://lore.kernel.org/r/20250730-phy-qcom-edp-add-missing-refclk-v1-0-6f78afeadbcf@linaro.org
> > 
> > ---
> > Abel Vesa (3):
> >        dt-bindings: phy: qcom-edp: Add missing clock for X Elite
> >        phy: qcom: edp: Make the number of clocks flexible
> >        arm64: dts: qcom: Add missing TCSR ref clock to the DP PHYs
> > 
> >   .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 28 +++++++++++++++++++++-
> >   arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 12 ++++++----
> >   drivers/phy/qualcomm/phy-qcom-edp.c                | 16 ++++++-------
> >   3 files changed, 43 insertions(+), 13 deletions(-)
> > ---
> > base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
> > change-id: 20250730-phy-qcom-edp-add-missing-refclk-5ab82828f8e7
> > 
> > Best regards,
> 
> Hi,
> 
> I'm observing what looks like a related clock failure on sc8280xp when
> booting without a monitor connected to a DP-to-HDMI bridge on mdss0_dp2.
> 
> Do you think sc8280xp might require a similar fix, or could this be a
> different issue?
> 
> 
> [    0.390390] ------------[ cut here ]------------
> [    0.390398] disp0_cc_mdss_dptx2_link_clk_src: rcg didn't update its
> configuration.
> [    0.390419] WARNING: CPU: 0 PID: 63 at drivers/clk/qcom/clk-rcg2.c:136
> update_config+0xa4/0xb0
> [    0.390439] Modules linked in:
> [    0.390448] CPU: 0 UID: 0 PID: 63 Comm: kworker/u32:1 Not tainted 6.16.3+
> #45 PREEMPT(lazy)
> [    0.390455] Hardware name: Qualcomm QRD, BIOS
> 6.0.250905.BOOT.MXF.1.1.c1-00167-MAKENA-1 09/ 5/2025
> [    0.390460] Workqueue: events_unbound deferred_probe_work_func
> [    0.390476] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS
> BTYPE=--)
> [    0.390482] pc : update_config+0xa4/0xb0
> [    0.390492] lr : update_config+0xa4/0xb0
> [    0.390500] sp : ffff80008351b9e0
> [    0.390504] x29: ffff80008351b9e0 x28: 0000000000000000 x27:
> ffff0000850ec3c0
> [    0.390515] x26: ffff800081205320 x25: 0000000000000002 x24:
> 0000000000000000
> [    0.390523] x23: ffff8000812052a0 x22: ffff000080467800 x21:
> ffff800081207ef0
> [    0.390531] x20: ffff8000822ad6f0 x19: 0000000000000000 x18:
> ffffffffffc06b68
> [    0.390539] x17: 616c707369642e30 x16: 3030313065613a6d x15:
> ffff800081474230
> [    0.390547] x14: ffffffffff806b67 x13: 2e6e6f6974617275 x12:
> 6769666e6f632073
> [    0.390556] x11: 0000000000000058 x10: 0000000000000018 x9 :
> ffff8000814742b8
> [    0.390565] x8 : 0000000000afffa8 x7 : 0000000000000179 x6 :
> ffff800081f742b8
> [    0.390574] x5 : ffff800081f742b8 x4 : 0000000000000178 x3 :
> 00000000fffdffff
> [    0.390582] x2 : ffff8000814741f8 x1 : ffff00008091cec0 x0 :
> 0000000100000000
> [    0.390591] Call trace:
> [    0.390595]  update_config+0xa4/0xb0 (P)
> [    0.390606]  clk_rcg2_set_parent+0x58/0x68
> [    0.390617]  clk_core_set_parent_nolock+0xc4/0x1e0
> [    0.390630]  clk_set_parent+0x40/0x144
> [    0.390638]  of_clk_set_defaults+0x12c/0x520
> [    0.390645]  platform_probe+0x38/0xdc
> [    0.390652]  really_probe+0xc0/0x390
> [    0.390657]  __driver_probe_device+0x7c/0x150
> [    0.390663]  driver_probe_device+0x40/0x120
> [    0.390667]  __device_attach_driver+0xbc/0x168
> [    0.390673]  bus_for_each_drv+0x74/0xc0
> [    0.390684]  __device_attach+0x9c/0x1ac
> [    0.390688]  device_initial_probe+0x14/0x20
> [    0.390694]  bus_probe_device+0x9c/0xa0
> [    0.390703]  deferred_probe_work_func+0xa8/0xf8
> [    0.390713]  process_one_work+0x150/0x2b0
> [    0.390725]  worker_thread+0x2d0/0x3ec
> [    0.390731]  kthread+0x118/0x1e0
> [    0.390738]  ret_from_fork+0x10/0x20
> [    0.390751] ---[ end trace 0000000000000000 ]---
> [    0.390760] clk: failed to reparent disp0_cc_mdss_dptx2_link_clk_src to
> aec2a00.phy::link_clk: -16
> [    0.401093] ------------[ cut here ]------------
> [    0.401096] disp0_cc_mdss_dptx2_pixel0_clk_src: rcg didn't update its
> configuration.
> [    0.401112] WARNING: CPU: 0 PID: 63 at drivers/clk/qcom/clk-rcg2.c:136
> update_config+0xa4/0xb0
> [    0.401126] Modules linked in:
> [    0.401132] CPU: 0 UID: 0 PID: 63 Comm: kworker/u32:1 Tainted: G   W
> 6.16.3+ #45 PREEMPT(lazy)
> [    0.401141] Tainted: [W]=WARN
> [    0.401144] Hardware name: Qualcomm QRD, BIOS
> 6.0.250905.BOOT.MXF.1.1.c1-00167-MAKENA-1 09/ 5/2025
> [    0.401147] Workqueue: events_unbound deferred_probe_work_func
> [    0.401159] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS
> BTYPE=--)
> [    0.401164] pc : update_config+0xa4/0xb0
> [    0.401174] lr : update_config+0xa4/0xb0
> [    0.401182] sp : ffff80008351b9e0
> [    0.401185] x29: ffff80008351b9e0 x28: 00000000fffffff0 x27:
> ffff0000850ec3c0
> [    0.401194] x26: ffff800081205320 x25: 0000000000000002 x24:
> 0000000000000000
> [    0.401203] x23: ffff8000812052a0 x22: ffff000080467800 x21:
> ffff800081207ea0
> [    0.401211] x20: ffff8000822ad640 x19: 0000000000000000 x18:
> ffffffffffc07528
> [    0.401219] x17: 32636561206f7420 x16: 0001020ef3c08cb3 x15:
> ffff800081474230
> [    0.401227] x14: ffffffffff807527 x13: 2e6e6f6974617275 x12:
> 6769666e6f632073
> [    0.401235] x11: 0000000000000058 x10: 0000000000000018 x9 :
> ffff8000814742b8
> [    0.401243] x8 : 0000000000afffa8 x7 : 00000000000001a4 x6 :
> ffff800081f742b8
> [    0.401252] x5 : ffff800081f742b8 x4 : 00000000000001a3 x3 :
> 00000000fffdffff
> [    0.401260] x2 : ffff8000814741f8 x1 : ffff00008091cec0 x0 :
> 0000000100000000
> [    0.401268] Call trace:
> [    0.401271]  update_config+0xa4/0xb0 (P)
> [    0.401281]  clk_rcg2_set_parent+0x58/0x68
> [    0.401291]  clk_core_set_parent_nolock+0xc4/0x1e0
> [    0.401299]  clk_set_parent+0x40/0x144
> [    0.401308]  of_clk_set_defaults+0x12c/0x520
> [    0.401314]  platform_probe+0x38/0xdc
> [    0.401321]  really_probe+0xc0/0x390
> [    0.401325]  __driver_probe_device+0x7c/0x150
> [    0.401330]  driver_probe_device+0x40/0x120
> [    0.401335]  __device_attach_driver+0xbc/0x168
> [    0.401340]  bus_for_each_drv+0x74/0xc0
> [    0.401349]  __device_attach+0x9c/0x1ac
> [    0.401353]  device_initial_probe+0x14/0x20
> [    0.401358]  bus_probe_device+0x9c/0xa0
> [    0.401367]  deferred_probe_work_func+0xa8/0xf8
> [    0.401377]  process_one_work+0x150/0x2b0
> [    0.401384]  worker_thread+0x2d0/0x3ec
> [    0.401390]  kthread+0x118/0x1e0
> [    0.401395]  ret_from_fork+0x10/0x20
> [    0.401405] ---[ end trace 0000000000000000 ]---
> [    0.401412] clk: failed to reparent disp0_cc_mdss_dptx2_pixel0_clk_src to
> aec2a00.phy::vco_div_clk: -16
> 

The same happens on the X1E Devkit if there is nothing connected to the
HDMI port. I believe you are looking for my patch series instead. :-)

https://lore.kernel.org/r/20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org/T/

If it works for you, replying with a Tested-by there would be much
appreciated. I'm still trying to convince folks that the approach of the
series is the best way to move forward with this issue. :-)

Thanks,
Stephan

