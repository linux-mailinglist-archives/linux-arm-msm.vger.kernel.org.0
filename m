Return-Path: <linux-arm-msm+bounces-7998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7538839593
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 17:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45F691F31D0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 16:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62954823B5;
	Tue, 23 Jan 2024 16:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="voqO2XvU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE13B81AD4
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706028840; cv=none; b=oYt7sRDMhL/K+QqYCkEw0q2nq/J+qUsOxo9APfmAsO5tCU/x+yDsw8sr5g5qYBDlO4O1ZCammEBxxNvgn9M6cSjaFIAtLePtFYHOavfRw3lJOhG5TemQgBc+MDfTCDdjhGjduxTlS7lx5KuAN29IQMUTqD/6lPDhOpIC2B/8Vn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706028840; c=relaxed/simple;
	bh=pooQ69oU2DoOocMMkeJ4cpqIQG2BPmnIao2wByNaHUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gj6B0qBA6zb4FdGpZA4/+p8DqxSEw2ogEZg6ndejFJgYJaqP4zX3MAwVzZXZ6jVvANpT7g+DKq0xdotCRODwJYHatLez8XEC+QzdiU07F1vQgpRPB8bo1QB68OFYwRjKCdsAU2QT3hVcx2iPmJITxeNCYYJSZ+LMm04WmJtny+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=voqO2XvU; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5ff7dd8d7ceso39692397b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 08:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706028838; x=1706633638; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w7Kpr4OnTCJukmd6IPUzA5zkXhmfPHzmd2uoemc3Jdk=;
        b=voqO2XvU0xmSWWfJt9LGbijZ1wC5J5sbxo+wF0ufNsI6va4x+SZ0YSCafc0yKkM73b
         3Er8Nab1E1+Igbph1iDoeybupfjE8hFfMVeJspfU8MuWSHlfTAfcbg1zph9VDQ2a4MWL
         Cac4jg9idfOBPU3IKvxVYxjIs9L1BZuxN7cIhYjtMtpgHXYydRXoB5U5i6HsGxfqKU/y
         m1tyM6b1E9YqzJQ2+VOu3Mup6U3Tao0AEeeqYurQXg+GOh+zCLMZWfWpYXM9H65XBzsv
         jSXoraQyghJcGktdl7lXRL1X/wzfA5cYlhz+32VlhD+6QnxgdZW3vk0vdYlg6wWkpDIH
         NqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706028838; x=1706633638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7Kpr4OnTCJukmd6IPUzA5zkXhmfPHzmd2uoemc3Jdk=;
        b=nNmxA4PUaC/zYpsOmAY8u2tCABKu6EISfsHvHG95MPine6CVV/CVku+XeBk6IHDUU4
         gH71PaTP39T1eTKRK8NAbzHgFDKtsB9NJ1PVv6smjkarbe/PL/28u0dLIVmQyH9iw81V
         fYFQ5g6r/o3imy6w/PUGbckXAFBWxuK+0b8eL2vqjwiDxeQYbKWvW6j4FuvTjhNd/m9u
         +zjYAC9Kb0vvtE0QM/7r46ey2/y7pE0+pKZ5o69Db0nAss62EVurxluYnD7w8ABc03Kc
         3MS3cpQyR3M0jJqYZ6PUgP35UHFoyBwvIBzLwJNbZQnlDE4gzSQgfcxn1urB0bLXABt/
         CrIw==
X-Gm-Message-State: AOJu0Yyj8uw7SF9tpg26a2GCv8753jdR807NFKEHgIgrk0HS0lrJEeEB
	PWoGHQOPeyKPFZVuHfo5SlIenHfmEnDlTQP1b78iYfS3rnrjsyskyDvDICZ68D0QtzPukHdQdQZ
	RUgtojiZ0XI59cuRqMiArSZbSgOLCjmiSCfV8vA==
X-Google-Smtp-Source: AGHT+IG6yH0HyJuDZxDw1e1dK7G/Xy5v2cIQbXYLFfwffB4lOyIXbr2o9XW/hXlmMP+niub/q0gByneRaxyxeM/Hosc=
X-Received: by 2002:a81:7c87:0:b0:5ff:9128:d314 with SMTP id
 x129-20020a817c87000000b005ff9128d314mr4701207ywc.105.1706028837907; Tue, 23
 Jan 2024 08:53:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
 <rq2dnfh6ctn5gbf3o3op5ywxx7zhx6r5sh5ykautye56o3p4dg@rjttk3rr65ld>
 <20240119191144.GR3013251@hu-bjorande-lv.qualcomm.com> <CAA8EJppLNFReZn1HK_radSkKkf5L584fx3FCuqG0FoUt4+H=nw@mail.gmail.com>
 <Za5xj8S3Gs7N-UUc@x1> <20240122200237.GB2936378@hu-bjorande-lv.qualcomm.com>
 <884f92ac-4d1a-9f0c-29ad-9d5833f10863@quicinc.com> <CAA8EJpq74G7Et=vuc-K0y_wKCEiM0=YVyb7TcosAnbvOFMWDMg@mail.gmail.com>
 <20240123160203.GF2936378@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20240123160203.GF2936378@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jan 2024 18:53:46 +0200
Message-ID: <CAA8EJprd3QibK=5JJEo=EKgRwXsveAhD+S0ZPJDoNCmgz-axAw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to SA8775P
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Trilok Soni <quic_tsoni@quicinc.com>, Brian Masney <bmasney@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>, Ninad Naik <quic_ninanaik@quicinc.com>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_psodagud@quicinc.com, quic_kprasan@quicinc.com, quic_ymg@quicinc.com, 
	kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jan 2024 at 18:02, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Tue, Jan 23, 2024 at 08:23:37AM +0200, Dmitry Baryshkov wrote:
> > On Tue, 23 Jan 2024 at 04:58, Trilok Soni <quic_tsoni@quicinc.com> wrote:
> > > On 1/22/2024 12:02 PM, Bjorn Andersson wrote:
> [..]
> > > As Brian M mentioned earlier, we want soc vendors to submit the support
> > > for their SOCs and platforms on top it as early as possible and it means
> > > such memory map changes will continue. Even memory map changes
> > > continue even few months after the commercial s/w release in certain cases
> > > due to critical bugs were found in some usecases which warrants the changes.
> >
> > So, can one handle such changes? Are we going to publish a list of
> > kernels to be used with the corresponding firmware images? Then what
> > if the developer wants to update just the kernel? Just to get this or
> > that non-platform-related feature. Or vice versa, what if the user is
> > stuck with an older kernel because some driver gets broken in the main
> > branch (which unfortunately happens sometimes)  Or what if the memory
> > map patch gets backported via the AUTOSEL process?
> > Unlike the Qualcomm binary distributions, the firmware and the kernel
> > version are no longer connected.
> >
> > That's why I keep on saying that memory map is an ABI. If it gets
> > changed, it is a completely new, incompatible platform.
>
> This is only a problem because we think the DeviceTree is a part of the
> kernel. If we actually tied the DeviceTree to the firmware - as it was
> intended - different firmware versions could come with different memory
> map.

Yes, up to some point. Because then DT gets incorporated into U-Boot...

> The one exception would be any remoteproc/pil firmware that is not
> relocatable, as these are distributed together with the OS (in some
> form) and not the boot/security/etc firmware.

-- 
With best wishes
Dmitry

