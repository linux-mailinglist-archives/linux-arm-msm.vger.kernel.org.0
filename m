Return-Path: <linux-arm-msm+bounces-7779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE908364A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 14:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DEB3285E9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 13:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32EA3D0B4;
	Mon, 22 Jan 2024 13:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HflLQ8Wt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FE93D0A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705931158; cv=none; b=bBSxSMtOOORKsVx412E12zZI9RnuTiJkEnhHBWnT7hzRQJz/HwRSmqIxuTm+Ych5DGr6V6d3qfmadWV4cxNly3i7Ve1ON8VrTHpN7f/tl5aIiWY/iSVj7yuvNBvj/VNpfv3gFKmRb0DRi0CDiCfzM//BdI0W3+lfL+R9zmMqqBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705931158; c=relaxed/simple;
	bh=OyJ1bxHA59iy5wXiAvSt/tACh10vEIfuDoG3PJNT2Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9EsuK7OLOLkesydPxnjXtR3bDRgq2Vw7FdTYiqDj3pWt2XwB4qHZg+5+VSc36Feg88J/1Ons/jksMtkL2BkMx+ZW9BKV4n6/OCW3wUnY9rd4AwKG+ykcmQOU3yuFPT1xBrX9FaDAxdn+lYfj4pBsnRs35A8ffjoOwCb/7fywCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HflLQ8Wt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705931156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=plv/ArYH8njxp72HX9LenLJ5/vF2h2cX135s3bxKJy4=;
	b=HflLQ8Wt772QVjBh5fxaRvLUIrQrDupEAqW3LXHf2PY448EukfZaelCUnE4eco1LPHw9CN
	Pm5ZL0PnV7RUBhcMBAt1H9eDdQtEwIj/L2PMaca8makoVVZ+T9vtyprSLTvFYuxwea6Pts
	9CNH/pWnO2qqxW/ltIM8mTU7c8RCbII=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-nrcpqhQdMkCu-vx7kZopkw-1; Mon, 22 Jan 2024 08:45:54 -0500
X-MC-Unique: nrcpqhQdMkCu-vx7kZopkw-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7831be985c0so520880285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 05:45:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931154; x=1706535954;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plv/ArYH8njxp72HX9LenLJ5/vF2h2cX135s3bxKJy4=;
        b=D5dmAThehzRubdFy8lU47qSKpxOpBZAKmReyYoxolX1rhKf0QsVY5999by/meiLfxv
         c01ZuDHKFbeiea53kUflRNu2rMYm5VVXXYdMAyeBvCAcYAlCMHV2MMaCtzQ4xKolIVV8
         xGjLgbziy8p2gChsAbOzXCFhRMZf+g1hap2lrWWoR5TLCu2e4H7JE5uGM6pprptYhKfL
         lJKyp/LjqHYpgN6RLQ9kOBmniVeEn1OUgnz5nX0fmp97oS4SEV3JokdOAZQnGEmDVaxh
         Qtahxwt4LlnaO9nPa+T7is9esXBzlH8okOfBQlOnNGep0mg4ltWmCSxLgx9LdQj9eMXJ
         it5A==
X-Gm-Message-State: AOJu0YxzKt4GEg7g2TiPx97UCES95At2gCaFdyH5+/P13ycfL9cpdujV
	xJJ7JI78dxmSRsSiVRCgVVGyQrVWHEy+jrhhqvZ5+cJ5rV56eRW54geyTS6nf2e3+/hKSQNWBpf
	90xyEnG3Wi5NE5st0ot7WY+Gtz7a056Aarv7z5iZhu81GVi5eNlabhJhQ4k8fDPI=
X-Received: by 2002:a05:620a:7ea:b0:781:2c00:c89d with SMTP id k10-20020a05620a07ea00b007812c00c89dmr4283020qkk.42.1705931154115;
        Mon, 22 Jan 2024 05:45:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPeJ09NoZuiWW65L8NTiarhjnXk7pv73Ms+8RbqNyNkF97fXE1zOXmVKQRxwN4jqy2upvwMQ==
X-Received: by 2002:a05:620a:7ea:b0:781:2c00:c89d with SMTP id k10-20020a05620a07ea00b007812c00c89dmr4283004qkk.42.1705931153859;
        Mon, 22 Jan 2024 05:45:53 -0800 (PST)
Received: from x1 (c-24-2-114-156.hsd1.pa.comcast.net. [24.2.114.156])
        by smtp.gmail.com with ESMTPSA id c14-20020a05620a134e00b007839e9ef1d7sm825174qkl.122.2024.01.22.05.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:45:53 -0800 (PST)
Date: Mon, 22 Jan 2024 08:45:51 -0500
From: Brian Masney <bmasney@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ninad Naik <quic_ninanaik@quicinc.com>, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	quic_psodagud@quicinc.com, quic_kprasan@quicinc.com,
	quic_ymg@quicinc.com, kernel@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to
 SA8775P
Message-ID: <Za5xj8S3Gs7N-UUc@x1>
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
 <rq2dnfh6ctn5gbf3o3op5ywxx7zhx6r5sh5ykautye56o3p4dg@rjttk3rr65ld>
 <20240119191144.GR3013251@hu-bjorande-lv.qualcomm.com>
 <CAA8EJppLNFReZn1HK_radSkKkf5L584fx3FCuqG0FoUt4+H=nw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppLNFReZn1HK_radSkKkf5L584fx3FCuqG0FoUt4+H=nw@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)

Hi Dmitry,

On Fri, Jan 19, 2024 at 10:35:43PM +0200, Dmitry Baryshkov wrote:
> This kind of change sets a very bad precedent. This way old kernels
> become incompatible with the updated firmware. For me it looks like
> Linux kernel suddenly being unable to boot after the BIOS upgrade.
> Generally memory map updates should be disallowed after the board hits
> the production and the DT is published and merged. There can be other
> users of DT. BSD systems, U-Boot. We spend sensible efforts in making
> sure that DT is an ABI: newer kernel remain compatible with older DT
> files. We expect the same kind of efforts from device manufacturers.
> 
> I think unless there is a good reason, the memory map update should be
> reverted on the Qualcomm side as a breaking change.
> If this kind of update is absolutely necessary, it might be better to
> define a new set of board files utilising the new memory map, marking
> existing DT files as legacy.

This is on a development board that's not in production yet, so
personally I think this change is fine. It's in all of our best
interests to have SoC vendors push their code upstream early, even if
it means that later on we need to make memory map changes like this.

Once this is in production, then I agree with you that changes like
this should be avoided if possible.

Brian


