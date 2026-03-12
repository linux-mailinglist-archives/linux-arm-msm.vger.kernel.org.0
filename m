Return-Path: <linux-arm-msm+bounces-97173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOZFCduUsmnONgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:26:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B85A270541
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 314EA300CC2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 10:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85463B2FD2;
	Thu, 12 Mar 2026 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDHz+AbK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9277A2874E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 10:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773311192; cv=pass; b=e3hGL5+Vv2bY6O8GFm6hMzdMYH2pMDMyZgpDH3V/9xWHwptZ46qCuUKTfVgl6DkoKwsmuZqDlB4N3PQJNNibnZrcwONVlmteuPCOjuYGNXhR1pjYgwy+ZIhAeQB/KaZlB9tM510xOF44x3ernFQuadVi1ai9LRq5ErxltsjYtSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773311192; c=relaxed/simple;
	bh=onUyqjAeWtKE04zpYtf2TaSahgLypTHr/h6Z3vzMRDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RjoW2yj1C7EYzcnDtmV8VLHVaG4uojUGDdgD9hh/f9u6EEqTDs7P37HAxcG4VlYjN9vnvP5rR8nVB4EjTK7GBusZi60jsikrBa7/Ji6AHYn/8PnldFCDbU8ZbRMnIp040kXdgqjc7KgqcuSrxmC7gJX4itepp8Y0USJa4jTGTb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDHz+AbK; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b4520f6b32so1355935eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773311191; cv=none;
        d=google.com; s=arc-20240605;
        b=l1WeGq6EVeCrtIY+ZgtltOWQzOdUg/a2IoHi1QNFS17fv+tVZNyYCRx1qjBySSS6GG
         ZIHfy0WPVyuDhYN4gu2JRYQovlEP6Vl9Pf2/E2yxVILKtMOIs7iQ5A3W1sYCTH5iFEQz
         +/R455lZsqXlOF4EFtI+XLSzlM1Cf76mfCbMDgDFMza4LxJBT/dnztHhr3T32SV0TrYi
         LB+b+CteeDl/c2Zn9Emtbs2U+fbpFpcdEgcD9Oj/jTkJY5e/kdaRhSFzDZEOwYXB8PFx
         gsZiGO6s/sdvuwOsZ0hI8wlIcgDlrA6EzZV8mvM0mFTEuWret7iScoNoc92TKLt4UUgw
         NWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Bk5tZTjrRA2ZrqLpNqMezzl6eniAJ6xLWn49o+Fftms=;
        fh=17+VjFa0rZVJs/2G1+AcGxeR/5FRa/LOXigBBpp9NbY=;
        b=ahWasFadghHtWHxcm7fAcA4pr8lnJT1EJTTvgUnsIuTpUtTQgiBoB/7xIiMHfZxuvm
         ioX7zROA/pNwauThRr+gdbS79ZhusQbeZWwmkXm6ALSYdigXdbrw2OqAflfE0n5BxNGt
         0/shuHL8TzKU49Gs86nbfhrIl0cHZcRXL0JwutJi4UrS3TJHIyikWK4DQWS9aezWtOhJ
         ZwU11qVjCqt/8Cab7/x0T/YGEhrVRjIsHWem1nI4SCHw1OOinFy502+AnLpiDJ5xu6JT
         O05M9u/+FuSNaSqXCf5HyVGJCW/QbUQ6GRSeXyOw9+a7/YrH4ClJzaGYlbvdqYVZWYXz
         ACzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773311191; x=1773915991; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk5tZTjrRA2ZrqLpNqMezzl6eniAJ6xLWn49o+Fftms=;
        b=jDHz+AbKiRAOdC4whCQm2jODHuo7cmk2z32sk/vrTlELL4bCo20NYzxQnTuasKbtO8
         uw3Q+8AURQCRyG3aC0rCo/G3QnemZjNup/MFv8qvbAWmbUU1PoeTQe7Cx1eiCeRlfrMz
         tfSCHVU811kOSeO7AdOvnxMbtWSjzZCpARS4nXxl7WPF2UqphFqlYhEUT/gVd1RckUiD
         J8xo3yNI5brxcD2gDzySPgbDrRDFh9SY19KrMfYRjKAmJ5anX9UHX9OaB9aY51EDbb1r
         yMaEdXM953pJkuIBbNiU+9JnodhXXjJvURwF5PCZuIdTgZ7LFcEpQz6gcKor8/Q+V/n+
         goHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773311191; x=1773915991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bk5tZTjrRA2ZrqLpNqMezzl6eniAJ6xLWn49o+Fftms=;
        b=GMp0hglx1Ym8i9wig1SPHmBtMxsg0XKZKv0wf42iAI+EoZGzReJJP+9RgM2AnO3ePK
         35dQ3jwmHABZPvv70xUsLyS/Rbp/9nuJdomhHWUj70bvMYGufgEyB8VeMJDeZjVlNijq
         CrDesfunV9jIIWmz7s6UcM8MXo9EFso+jx25Aw4hOYJHxJshcNPXyIi4sCwPOMpcVyGU
         z8yiwjwLuORy8D+9O+gBwjQJzXHq/48B6HePqQf2G5e4Wa90TmO9cuh6d8M/E8xjdL9R
         TysHrJAOLhb1PisSif6mSqCg7WCNobmCtx6ccJuBBXovLLgqPMTY810n6gsphL78JFbg
         WWJg==
X-Forwarded-Encrypted: i=1; AJvYcCUp4yXbx+oP0jP9gge1P1K2BKto5zO77j3bz69fK6Wm6sicUGBUz9Uemg8egzgD/cGVES7w2/B0iIwz3LIj@vger.kernel.org
X-Gm-Message-State: AOJu0YxeDTSO4Jbv0L90/1GV1mrXggDlvSsEF46Tg8M5mZH50WuMnt8F
	S8HW0RoxEMRQ63RcD3ZjDY3iuRdObeYJMT6xkQp5KRTJNNTGfWBm5j6reLMork96SpWyGOddB/h
	6LzaK7bOuXwJY+FDcJkGak/eFVyev+zE=
X-Gm-Gg: ATEYQzxsgu2PA5YdMrQLXqHomV/Hg9SB9QI2IELkDLzwG5RFNSog+cywUHPotiPqcfi
	yTj9HXdwujurZ/myGBzbq6VmTUxwfBTywDQh/XYG689+/M6ll4HN00fQGfqrd5qUUfW6EafEeQi
	l+8yWitm2Py4JogY+jM0R7UiR6iGxQkL94/FYns2SvFr9T3XQd+gZFdtjwwvLXL5kSog0MQ+ojQ
	NXyeCwLWdYbz9fBy/r3KMdTKuMnMVCNyk4YpBptC4UAePMgbU0FG0rjpoh47IHaB6pAcuESo1Wi
	5eCHXgU=
X-Received: by 2002:a05:7300:6422:b0:2b8:6ae5:79c3 with SMTP id
 5a478bee46e88-2be8a52a95fmr2351442eec.38.1773311190657; Thu, 12 Mar 2026
 03:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
 <20260223-panel-patches-v1-3-7756209477f9@gmail.com> <dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme>
 <CAHuF_Zpa+cr6aq89kCon1dC3Q0PEV17VfyAbqF0Ojgmgn32yTQ@mail.gmail.com> <CAO9ioeWCLeF5rD8=WVbyKBD=azFZ5=Ee=BH9209Rw6kd5EOJug@mail.gmail.com>
In-Reply-To: <CAO9ioeWCLeF5rD8=WVbyKBD=azFZ5=Ee=BH9209Rw6kd5EOJug@mail.gmail.com>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Thu, 12 Mar 2026 12:26:19 +0200
X-Gm-Features: AaiRm51Tymilxfe1MAFpuMpMWrq5Qkjj9ZaHoDLJphKIh4mTuOSzDvUoz2G54q8
Message-ID: <CAHuF_ZoaPd=wPmQM+RATKARSRz9NbrkewWRtOyuQAKXetmxfgg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable
 MDSS and add panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97173-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7B85A270541
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 5 Mar 2026 at 00:35, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, 4 Mar 2026 at 20:04, Yedaya Katsman <yedaya.ka@gmail.com> wrote:
> >
> > On Tue, 24 Feb 2026 at 04:46, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > <snip>
> > > > +
>
> > > > +&mdss_dsi0_phy {
> > > > +     status = "okay";
> > >
> > > Missing vdds-supply.
> > >
> > Can you expand on that? The `dsi-phy-14nm` schema doesn't have the
> > vdds-supply property. Do you think it needs it?
>
> 14nm PHYs have vcca-supply. Anyway, the PHY needs to be supplied by something.

vcca is VDDMX, the power-domain is set in s6125.dtsi
> --
> With best wishes
> Dmitry

Regards, Yedaya

