Return-Path: <linux-arm-msm+bounces-9919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE0484B044
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 09:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C15C282222
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 08:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACE812AAD6;
	Tue,  6 Feb 2024 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R4kJVydV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B008D745EE
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707209264; cv=none; b=lqdqijWqqfs+jEfWvnbOgKwusg/LgfMJYwpA/BpVfQ5pfKvByix/bvhLbtS9xwONcBtlajRpNZLgRh6pkkU3t+oirplS+ANABCbgeMj+tRp412GklCbKxpF+LRkWYAfDWlWIr/ykzYf44h/D4cGREwh5jvFOVQ/VGX80K5jsx2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707209264; c=relaxed/simple;
	bh=W87wlg3gwwpyRy4uv6ZN7M5kYoBBVg65k9Z3ZO0TPFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVDd0XBByKt8ONm5MXeBGpxzIpDt56/ByuvOvNUU2v5FGLP+a0FcN4+BK30fYKpZCsmy5PIv6/9hwx4x6DexhWJjuAsiAH+x/ESaa/n5FT/07xtLlnQuYI+t7NANq9Tgfbb7q3o9bRhOzXApuPGebPA4Lv3iRVlCkb5F7suuP1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R4kJVydV; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6047c55f021so3827327b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 00:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707209261; x=1707814061; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=241goNC704SoeMyhz35IEUwYkPmqIvo84PGH7+k+HH0=;
        b=R4kJVydVxPjfwktu5Wo6FgCYBFvK7raq2p881caHm9ho4upL3RVSw/nHNYKG8f+aLV
         ufaiQMbs/kAF+WSP2BgDJbBVIIi2Npvl6h1lLJiwcHpqnIlSNs3GXx1z+24qaXp8A6BI
         QoXxwjy7cBSnHvXwbxznz/kU/YGphWGnZ5PKRg2q9VqIZu7GIUEUFa8YWDuhn5ywk5/4
         p+qlzBKk6dnGD2DJ5mp7/jlJrJWFST9GtEreb2ObKXQJ8MH+AYUK9YLXSEqW8u8djfFA
         ZIkQKkHpyVIWDW/6btB89fIRPpMO5+rapnemnzMXj5ysa349PKz3hj8jsoBMcpGs4IJT
         HyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707209261; x=1707814061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=241goNC704SoeMyhz35IEUwYkPmqIvo84PGH7+k+HH0=;
        b=WZqL13QSB4d0vPP8zbOEetj6lilOJ63uoNUHO9SBKYTKklWe1+gV5TWqwIh70le6lA
         OcttgMF+xxY60WuP9ox/EsRNwx03KRqq2qerl6iD09s0NaM1FCeUw5DfVGkuUzysS1vj
         pkVPEgDN4HRR9g/dxxZtDnarpZmbQS5XKWN5P4ebDFqwvnTDn0xlpFjyXxrT5jtG3x2x
         7aKmRm2tTaK4PNnr+yZtSfrb55+M4PqZdviKQLGBKPuhJCqjYx8MflARuqCgu2YnEImL
         S5dtQLf8J18aYuoKd+peDsPLFALh32xjNW9PH9npg5qncNfer0dMmLYiWMHrAoHxVBOk
         Qlrw==
X-Gm-Message-State: AOJu0YyEnOBTTPxmCj3ZzxOi2V7gBDoAxfnV792G5d3dm03U6ypkyfkD
	C3ewhw8iQl9dM2yNmLusm0+n5BZIFKHPsVbTReqQaCZSbQJbSCE80TmyKcnhjdxpM9SigQ2H4bJ
	2uR30kSdI6jFmssUUfaFAzkd1Mn7rxFUULzK+cA==
X-Google-Smtp-Source: AGHT+IGEm1H8S0/08HYCMlACutXN8frfcWMJeOBKYu3SXbsJF7IMPZz4glacZAzfedeDykPIx9QwOsvpz2mMaQlAgk8=
X-Received: by 2002:a0d:ead3:0:b0:604:7055:98a2 with SMTP id
 t202-20020a0dead3000000b00604705598a2mr1057489ywe.3.1707209261642; Tue, 06
 Feb 2024 00:47:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206051825.1038685-1-quic_kriskura@quicinc.com>
 <CAA8EJpopE91TSCkworWts82tcD_6PLgLmes_FhVhnUovmQWz_w@mail.gmail.com>
 <f86cb527-3f91-4961-bbd5-4dc0e9a42df7@quicinc.com> <CAA8EJpqWt6a5mHcSyYKkEGu_nZ7vn5gjok07kSNe7mVzDE7gRA@mail.gmail.com>
 <cc4ff2c9-4c1e-49f1-9297-2662d8ae4ae9@quicinc.com>
In-Reply-To: <cc4ff2c9-4c1e-49f1-9297-2662d8ae4ae9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 6 Feb 2024 10:47:30 +0200
Message-ID: <CAA8EJpoTTba0_bnR+4Jqd_kiALWGZU=20StPCoLj9a4BNQT5vg@mail.gmail.com>
Subject: Re: [PATCH v14 0/9] Add multiport support for DWC3 controllers
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 10:45, Krishna Kurapati PSSNV
<quic_kriskura@quicinc.com> wrote:
>
>
>
> On 2/6/2024 2:13 PM, Dmitry Baryshkov wrote:
> > On Tue, 6 Feb 2024 at 10:15, Krishna Kurapati PSSNV
> > <quic_kriskura@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/6/2024 1:30 PM, Dmitry Baryshkov wrote:
> >>> Hi Krishna,
> >>>
> >>> On Tue, 6 Feb 2024 at 07:18, Krishna Kurapati <quic_kriskura@quicinc.com> wrote:
> >>>>
> >>>> Currently the DWC3 driver supports only single port controller which
> >>>> requires at most two PHYs ie HS and SS PHYs. There are SoCs that has
> >>>> DWC3 controller with multiple ports that can operate in host mode.
> >>>> Some of the port supports both SS+HS and other port supports only HS
> >>>> mode.
> >>>>
> >>>> This change primarily refactors the Phy logic in core driver to allow
> >>>> multiport support with Generic Phy's.
> >>>>
> >>>> Changes have been tested on  QCOM SoC SA8295P which has 4 ports (2
> >>>> are HS+SS capable and 2 are HS only capable).
> >>>
> >>> Thank you for your patches! Have you tested how this patchset
> >>> interacts with the USB role-switching?
> >>>
> >>> I'm asking because it might be easier to define DT nodes for each of
> >>> USB ports, which can carry the PHY properties (and also other DT
> >>> properties if that's required, e.g. the ports / endpoints and
> >>> usb-role-switch) rather than pushing all USB PHY links to the root DT
> >>> node.
> >>>
> >>
> >> Hi Dmitry,
> >>
> >>    Role switching doesn't work for Multiport controller as it is host
> >> only capable. I don't think it will cause any issues for OTG capable
> >> controllers because they only have one HS and SS phy present. So there
> >> is no possibility or requirement for having endpoints per port in this case.
> >
> > Is it going to remain host-only in future?
> >
> >
> Yes. I believe these are designed that way. I don't know of any
> controllers that have multiple ports and device mode works. Device mode
> can work only on one port AFAIK.

Ack, thanks for the explanation.

-- 
With best wishes
Dmitry

