Return-Path: <linux-arm-msm+bounces-19477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E968BF82B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 10:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F3B61F214AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 08:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7613FBAE;
	Wed,  8 May 2024 08:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bTkOMCKY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9533DB97
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 08:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715155832; cv=none; b=FeV/fFhmCX0zJBjUD5YHDlP4aheoTo+IDV0yC7xuEMzGZHt2ltuI8MJbL2unUAIIlyHUofHzCw7GDseZVneVCELTkuACVtciRRS8WtudAL2MrEjdwihIoAdsWHpdBpjl5H1Rb5f+RRXJlXHCeaB/5ewWNnV+zOULavOZzB3agPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715155832; c=relaxed/simple;
	bh=yDdWDsmhU8mOYZ99K64v5ZtUCmcCbDJ3z/nVF/28VME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=leV+AXUsoJ7k3tkO64+1RU3u9/uIAvYVnLnaG+3v6VcfCzsUFyWhkpasU4uPe8r2OR5GHDfXM3msVa7OShwlsPBnD2sV6stAVzrsa17YTxFUEXN0x7oPYaihYDUHX84qIu9koTek2814Eu2wj/SA58gVNPCLyfs3G6Gp3nW4AwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bTkOMCKY; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de607ab52f4so4237330276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 01:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715155830; x=1715760630; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hDil2ZnVWcb5vp45cry1hHQo0ylQ9Dttur8ChmQtHdc=;
        b=bTkOMCKYsk+gYYnKHVYMEdKUHaTSk9qPwcT5Bkxtwq5LQ2rSO0QOmoRfHdqVwXfgAx
         KPUz49rNSHNXz4Og1SCb/eDaH6n47DrdHIGoPYsTP860Gb4ArLfT5C2TM/ZvQbm2s1Y9
         bTO/nhXOJYTwT3FmB4DV1o6wX+PzuirJ33jdrb1x0dFZXSURYPapbahQSD/Oy6saZfD+
         I6DxLOYvXeOoRyudYWMIH5iF9uytiCYyb/gCvZeF0pfA27UGh6TwAYoljgEvLHcsZxJm
         IP5Wo6Zh+YodvFpamtqJR2zI6mO2QBOmPOvLxHE7mNeV0A0GKbgX0sHA2Sg4kN8G9iRM
         8ENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715155830; x=1715760630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDil2ZnVWcb5vp45cry1hHQo0ylQ9Dttur8ChmQtHdc=;
        b=Egdy1SSLeTDXWABhER6pnRKSQbQL/ocy5mSOl3N5/461zjCpJaKXQPm65UglBKMJZE
         WSivXdtC2vLntH3fnvcmYWHbelzaW+761f0cJgA1zE627WoLhroQqn1BfB6CBxNjv9fH
         MXMtBIbZr0mXyKzKuBWp3WvzJOb3jcN/ArwO1+4TwmoGbn/XpgBd6JJuHdG4QJZ8Cxp1
         qtiPbuzfbfeQ+y9IOp5tgoSHrfW2P74WfTJ4oLthjeJxdVscJ1oFbef9tmW458unA9+S
         Zf2wqo5Xs+9VG8pt9LhVgZLTryRsevjmSdptR/T7bFU1OW4sE4brYtyND8T3H0vrDLtv
         BXQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1vQwWEJIh5X7zDvsIJdn0X5ULZxyWSHwzb/WCWqqaBKRcXoKyZejfSx+Y3mvW1iTANV8qsFvCkCpLUPH8zBWgSVsKiKftbt5eAlRd1g==
X-Gm-Message-State: AOJu0Ywn80SvtiYXd2+yhrUsEuvllwuYDKB8RTu46FuAewRlCs1WvLkQ
	7ZgsRugvKYMiFuKh+G7ZpczxwfS9HGYIz/qepTaiWC9c0ppP3/Pg0EHFg1hUCXb8SqCTE+MQRCx
	V7vlEa3Tcl9yQM7bMhatZ/pA4JyaocNLKe8j6XQ==
X-Google-Smtp-Source: AGHT+IHCYOkOb4GRkecIOgxE4jNRIrOhLbYw42i8TBkgZ/yh1zPVDtP2VZreSBEEiDOF5QRtA2ZAv967VqXp6nKpg5A=
X-Received: by 2002:a05:6902:46:b0:de5:a2de:9453 with SMTP id
 3f1490d57ef6-debb9d4ac68mr2095872276.17.1715155830352; Wed, 08 May 2024
 01:10:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418092305.2337429-1-quic_varada@quicinc.com>
 <20240418092305.2337429-7-quic_varada@quicinc.com> <a7194edd-a2c8-46fc-bea1-f26b0960e535@linaro.org>
 <Ziov6bWBXYXJ4Zp8@hu-varada-blr.qualcomm.com> <27f4f3dd-9375-40cf-8c8f-1c4edf66e31b@linaro.org>
 <ZjNdTmmXucjtRxJt@hu-varada-blr.qualcomm.com> <c015b3a5-2213-4ebd-b960-d97ed1fe7062@kernel.org>
 <ZjshR0ekcn0gxwOa@hu-varada-blr.qualcomm.com>
In-Reply-To: <ZjshR0ekcn0gxwOa@hu-varada-blr.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 8 May 2024 11:10:18 +0300
Message-ID: <CAA8EJpqENsojPQmCbma_nQLEZq8nK1fz1K0JdtvLd=kPrH_DBw@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] arm64: dts: qcom: ipq9574: Add icc provider
 ability to gcc
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, andersson@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 May 2024 at 09:53, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> On Fri, May 03, 2024 at 04:51:04PM +0300, Georgi Djakov wrote:
> > Hi Varada,
> >
> > Thank you for your work on this!
> >
> > On 2.05.24 12:30, Varadarajan Narayanan wrote:
> > > On Tue, Apr 30, 2024 at 12:05:29PM +0200, Konrad Dybcio wrote:
> > > > On 25.04.2024 12:26 PM, Varadarajan Narayanan wrote:
> > > > > On Tue, Apr 23, 2024 at 02:58:41PM +0200, Konrad Dybcio wrote:
> > > > > >
> > > > > >
> > > > > > On 4/18/24 11:23, Varadarajan Narayanan wrote:
> > > > > > > IPQ SoCs dont involve RPM in managing NoC related clocks and
> > > > > > > there is no NoC scaling. Linux itself handles these clocks.
> > > > > > > However, these should not be exposed as just clocks and align
> > > > > > > with other Qualcomm SoCs that handle these clocks from a
> > > > > > > interconnect provider.
> > > > > > >
> > > > > > > Hence include icc provider capability to the gcc node so that
> > > > > > > peripherals can use the interconnect facility to enable these
> > > > > > > clocks.
> > > > > > >
> > > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > > > > > ---
> > > > > >
> > > > > > If this is all you do to enable interconnect (which is not the case,
> > > > > > as this patch only satisfies the bindings checker, the meaningful
> > > > > > change happens in the previous patch) and nothing explodes, this is
> > > > > > an apparent sign of your driver doing nothing.
> > > > >
> > > > > It appears to do nothing because, we are just enabling the clock
> > > > > provider to also act as interconnect provider. Only when the
> > > > > consumers are enabled with interconnect usage, this will create
> > > > > paths and turn on the relevant NOC clocks.
> > > >
> > > > No, with sync_state it actually does "something" (sets the interconnect
> > > > path bandwidths to zero). And *this* patch does nothing functionally,
> > > > it only makes the dt checker happy.
> > >
> > > I understand.
> > >
> > > > > This interconnect will be used by the PCIe and NSS blocks. When
> > > > > those patches were posted earlier, they were put on hold until
> > > > > interconnect driver is available.
> > > > >
> > > > > Once this patch gets in, PCIe for example will make use of icc.
> > > > > Please refer to https://lore.kernel.org/linux-arm-msm/20230519090219.15925-5-quic_devipriy@quicinc.com/.
> > > > >
> > > > > The 'pcieX' nodes will include the following entries.
> > > > >
> > > > >         interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
> > > > >                         <&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
> > > > >         interconnect-names = "pcie-mem", "cpu-pcie";
> > > >
> > > > Okay. What about USB that's already enabled? And BIMC/MEMNOC?
> > >
> > > For USB, the GCC_ANOC_USB_AXI_CLK is enabled as part of the iface
> > > clock. Hence, interconnect is not specified there.
> > >
> > > MEMNOC to System NOC interfaces seem to be enabled automatically.
> > > Software doesn't have to turn on or program specific clocks.
> > >
> > > > > > The expected reaction to "enabling interconnect" without defining the
> > > > > > required paths for your hardware would be a crash-on-sync_state, as all
> > > > > > unused (from Linux's POV) resources ought to be shut down.
> > > > > >
> > > > > > Because you lack sync_state, the interconnects silently retain the state
> > > > > > that they were left in (which is not deterministic), and that's precisely
> > > > > > what we want to avoid.
> > > > >
> > > > > I tried to set 'sync_state' to icc_sync_state to be invoked and
> > > > > didn't see any crash.
> > > >
> > > > Have you confirmed that the registers are actually written to, and with
> > > > correct values?
> > >
> > > I tried the following combinations:-
> > >
> > > 1. Top of tree linux-next + This patch set
> > >
> > >     * icc_sync_state called
> > >     * No crash or hang observed
> > >     * From /sys/kernel/debug/clk/clk_summary can see the
> > >       relevant clocks are set to the expected rates (compared
> > >       with downstream kernel)
> > >
> > > 2. Top of tree linux-next + This patch set + PCIe enablement
> > >
> > >     * icc_sync_state NOT called
> >
> > If sync_state() is not being called, that usually means that there
> > are interconnect consumers that haven't probed successfully (PCIe?)
> > or their dependencies. That can be checked in /sys/class/devlink/.../status
> > But i am not sure how this works for PCI devices however.
> >
> > You can also manually force a call to sync_state by writing "1" to
> > the interconnect provider's /sys/devices/.../state_synced
> >
> > Anyway, the question is if PCIe and NSS work without this driver?
>
> No.
>
> > If they work, is this because the clocks are turned on by default
> > or by the boot loader?
>
> Initially, the PCIe/NSS driver enabled these clocks directly
> by having them in their DT nodes itself. Based on community
> feedback this was removed and after that PCIe/NSS did not work.
>
> > Then if an interconnect path (clock) gets disabled either when we
> > reach a sync_state (with no bandwidth requests) or we explicitly
> > call icc_set_bw() with 0 bandwidth values, i would expect that
> > these PCIe and NSS devices would not function anymore (it might
> > save some power etc) and if this is unexpected we should see a
> > a crash or hang...
> >
> > Can you confirm this?
>
> With ICC enabled, icc_set_bw (with non-zero values) is called by
> PCIe and NSS drivers. Haven't checked with icc_set_bw with zero
> values.
>
> PCIe:   qcom_pcie_probe -> qcom_pcie_icc_init -> icc_set_bw
> NSS:    ppe_icc_init -> icc_set_bw
>
> I believe sync_state is not getting called since there is a
> non-zero set bandwidth request. Which seems to be aligned with
> your explanation.

This doesn't look correct. sync_state is being called once all
consumers are probed. It doesn't matter whether those consumers have
non-zero bandwidth requests or no.


-- 
With best wishes
Dmitry

