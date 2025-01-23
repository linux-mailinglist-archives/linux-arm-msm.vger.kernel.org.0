Return-Path: <linux-arm-msm+bounces-45895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA3EA19ED2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CDB21684EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 07:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F06520B20C;
	Thu, 23 Jan 2025 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KgDJOBH1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B341BD01F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 07:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617011; cv=none; b=enXp/D1NhUTyT2KGAAQDu21ilvqvvnjSShWEhP6ZvVPSQbk+qXwx1o8++layDgNE9iiG2GQwl6qL8ctboPNPMTwv/LgKcnuawm8ehoTTVrQPPTVItMJuSSaKx/Iw9l+j8bxHqnJA6pv9CdxrWfQzLxIH2cPSd/vcYASqIwT+1eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617011; c=relaxed/simple;
	bh=omO2hS07qAD8xiU8v/q/u3UyDzXS1eWRQdpNfYYgZKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NeTQr80FGCdNIkRIxZzeyRGcVpSGJHZrBtZZJhuQQ/rwp2rBvqRV+M16DkxzEAiJq/ociphcpqk8P2u0+au3bUIARWh6oN4pVjkhRaxrMFxUOxhFDjpPIrhcchKk4BKDoaEtKbW0iBFT26ICU99AAqliEZqZpJVId8l0seAibAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KgDJOBH1; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e580d6211c8so975200276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 23:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737617008; x=1738221808; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hOXcA9vaOQYRNKut7rDICRe3STKLWf1DDnQmgXfB78A=;
        b=KgDJOBH1CKunO+1ina8aO6tZdx3XYGDeyVjeS0TOWxQAYWyW1cNMhqVR5UVXraJGyT
         yuQFuANpA6uON9o8/ItcI6dMDl9NeFDJOfVd/4qgXIVi7BxikV2YtOJ+o81hW+uvX842
         sz5ZtgfgEYkJWYai9e1XnYaSjWwYEF9zvNQLAtdpsoRfvOOKWDr1IXK23Oy4/J64fx7V
         lYitSdroXBAxjNm1BlM2yUbfl2qqzUW1/dnbCONzPgy5F3gFlqL26xsW7tycRP3KwBKb
         EkKkLHIuysOn4hgIrWlC2RUo0RaFn15Vw9IiNJ0rMcFRDuBGDQZm0kVNbm6OiRJIreG7
         McoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737617008; x=1738221808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOXcA9vaOQYRNKut7rDICRe3STKLWf1DDnQmgXfB78A=;
        b=ArM24qYkeckFjJVlbbwVhjQEofoxZG0cR9nSOtpdsMIB8qwkfrtXB26yjjB1vwKdJr
         49ie4Aic8/TN9A8lF0u4Afh6N7VBeczw8V7pBRAnjbeFdIhhq3k9pStg54XRcc8DCnQf
         toL4iYFgm4Xcei9w9jNJFtORkWF7KTu8f+Y0nb16AMRKdnH1JZGXeQ1d9oyZApADpP9c
         fo9afX8Bg//NbEG4vNHTqsW95gOJwI7kITSRLOXWUUyFqeaNobCecMM9cvr/uCi4L0vG
         f+UYYhJPNYzohSd/K1UXiFnGYZmk+GxFIsnz4GNcGGxHV4EwIE61G1O/VMXHYK/79m+k
         Uh/w==
X-Forwarded-Encrypted: i=1; AJvYcCUJksDM/ieBsiHCzfAzNZvapueeE/WyQtoDJ6XCYnczUSHoaBTeI1sZF+uPLZ63ApsxKpY6sjfyxmvrZdWQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv+diPhI6iv6KIYDCJ6JX4/BDel3NxNzlIy4ZQ8K47JyO1VWHP
	IFbuwdgJVfTSsNGHDqC3j+w/QAchQlTQSHa/zIhlOWZlLjo7ioaHpPrV5tWxI6+UfjaBCVxr6H7
	NVYsr/YVmMvkS3sw/oKOisk5ro8KlarfYEpZIJHHdsJhaqdHgSM4=
X-Gm-Gg: ASbGncsvHADoMVCt94MjzdKWKF5fQGJuPqFOcwr8uqFeRXHqe9uRPQlAUt1BGnAfV5H
	E2mui5CVreggzXj3Wt3viMGIiMPnct0eh6uPbgO2q3YemieLtcrH9BkSET6HkdavH7CU4WsY/or
	Ux
X-Google-Smtp-Source: AGHT+IGIaMIn2pQwsBFaA4hpvX0jt/kyYUmEG6SfZJJHYi929Kh469Ft/+4k9WcxFqZ0bD0d+2tokXdY4wY7ycbYj2c=
X-Received: by 2002:a05:690c:46c2:b0:6ef:8c41:defc with SMTP id
 00721157ae682-6f6eb677355mr210279217b3.11.1737617008587; Wed, 22 Jan 2025
 23:23:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
 <173505391861.950293.11120368190852109172.b4-ty@kernel.org>
 <anfqf3jvh7timbvbfqfidylb4iro47cdinbb2y64fdalbiszum@2s3n7axnxixb>
 <Z2sJK9g7hiHnPwYA@vaman> <i7gptvn2fitpqypycjhsyjnp63s2w5omx4jtpubylfc3hx3m5l@jbuin5uvxuoc>
 <Z2sOl9ltv0ug4d82@vaman> <318620fc-e174-4ef3-808a-69fe1d4e1df5@oss.qualcomm.com>
 <f607aa9b-018c-4df6-9921-725693353f65@oss.qualcomm.com>
In-Reply-To: <f607aa9b-018c-4df6-9921-725693353f65@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Jan 2025 09:23:17 +0200
X-Gm-Features: AWEUYZlpAmBcFSsEoI37wecQuSj3RtKjsFyMGuS8EW1UWMEQXy5olgefUpEc6Ms
Message-ID: <CAA8EJpr48k_tHKk-uVpAH7TMcp0-V97x6ztdFrbv0Go0a6kD2g@mail.gmail.com>
Subject: Re: (subset) [PATCH v3 0/3] Add support for USB controllers on QCS615
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Jan 2025 at 09:00, Krishna Kurapati
<krishna.kurapati@oss.qualcomm.com> wrote:
>
>
>
> On 12/25/2024 2:01 PM, Krishna Kurapati wrote:
> >
> >
> > On 12/25/2024 1:12 AM, Vinod Koul wrote:
> >> On 24-12-24, 21:33, Dmitry Baryshkov wrote:
> >>> On Wed, Dec 25, 2024 at 12:49:07AM +0530, Vinod Koul wrote:
> >>>> On 24-12-24, 17:38, Dmitry Baryshkov wrote:
> >>>>> On Tue, Dec 24, 2024 at 08:55:18PM +0530, Vinod Koul wrote:
> >>>>>>
> >>>>>> On Tue, 24 Dec 2024 14:16:18 +0530, Krishna Kurapati wrote:
> >>>>>>> This series aims at enabling USB on QCS615 which has 2 USB
> >>>>>>> controllers.
> >>>>>>> The primary controller is SuperSpeed capable and secondary one is
> >>>>>>> High Speed only capable. The High Speed Phy is a QUSB2 phy and the
> >>>>>>> SuperSpeed Phy is a QMP Uni Phy which supports non-concurrent DP.
> >>>>>>>
> >>>>>>> Link to v1:
> >>>>>>> https://lore.kernel.org/all/20241014084432.3310114-1-quic_kriskura@quicinc.com/
> >>>>>>>
> >>>>>>> [...]
> >>>>>>
> >>>>>> Applied, thanks!
> >>>>>>
> >>>>>> [2/3] phy: qcom-qusb2: Add support for QCS615
> >>>>>>        commit: 8adbf20e05025f588d68fb5b0fbbdab4e9a6f97ecommit
> >>>>>> e1b2772ea957c91694aa91b90e4c0a1d7b0fb144
> > Author: Krishna Kurapati <quic_kriskura@quicinc.com>
> > Date:   Mon Oct 14 14:14:30 2024 +0530
> >
> >      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for QCS615
> >
> >
> >>>>>
> >>>>> Is there any issue with the two remaining patches?
> >>>>
> >>>> Something wrong with b4... I have applied 2 & 3
> >>>> Patch 1 should go thru USB tree
> >>>
> >>> Hmm, strange. But then, please excuse my ignorance, do we have bindings
> >>> for these two patches?
> >>
> >> I see to have missed one!
> >>
> >> This one is documented see:
> >> d146d384222e dt-bindings: phy: qcom,qusb2: Add bindings for QCS615
> >>
> >> but, the third patch is sadly not... I am dropping the third patch
> >>
> >
> > Hi Dmitry, Vinod,
> >
> >   I see the bindings for QMP PHY in linux next as follows:
> >
> > commit e1b2772ea957c91694aa91b90e4c0a1d7b0fb144
> > Author: Krishna Kurapati <quic_kriskura@quicinc.com>
> > Date:   Mon Oct 14 14:14:30 2024 +0530
> >
> >      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for QCS615
> >
> > As mentioned in the cover letter, the bindings of phy have been merged
> > from v1.
>
> Hi Vinod,
>
>   Can you help in taking in the patch-3. As mentioned in previous mail,
> the bindings are merged and present in linux-next.

We are currently in the merge window, no new patches can be accepted.

-- 
With best wishes
Dmitry

