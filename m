Return-Path: <linux-arm-msm+bounces-7032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAC382B025
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 15:03:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B588B21C80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 14:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FFE3B1AC;
	Thu, 11 Jan 2024 14:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EdrK8Io6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C49C3AC10
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704981770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w2oiHnQxHwv2fW/BCjTbKgiDncxKv4ZkLpJzyQn0qCM=;
	b=EdrK8Io6lHaVmEobnMKR8AAtlAVWOFsSd3yOIPWWFchBZoIOCqyFN1AaRB1Ko7E5qtJ/qQ
	V5hjXUF+rpkyN+cZQtZBoe5YkdVZdT7S6zoI8r3B9GZkESsVNdXvoEO1EQgwR4IzwgoYlb
	Y03Gx9vWs+kVd36U6TeNEHbKlHsft2U=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-8oZ1XH2IN-e7RzqOzBaJ3Q-1; Thu, 11 Jan 2024 09:02:47 -0500
X-MC-Unique: 8oZ1XH2IN-e7RzqOzBaJ3Q-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-429a7149210so28484671cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 06:02:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704981764; x=1705586564;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2oiHnQxHwv2fW/BCjTbKgiDncxKv4ZkLpJzyQn0qCM=;
        b=ifx7EjLzgl45iM0vjoycnkQJoAMZnH+3vESDo/sJmVPbPfZJefpTeDqfwKaLcWYIgI
         cT6trCH9npVaGN/YLXl6Sc4R/42p2TkO7f0zmaJIZSEiF74rxEfQsSBhaGyuV5G85d3R
         4yV1dskh/Vmj35J/ggDYvMwrv4cdPe15U9rB+gvR2Rv76ePQ3EThSjViII7z4qOYm7x8
         GbOUfOtuSiQCPf1aYVdeKRaDeRik0Sfd/U/Ll4c9uaXgXK1trtpuV3RGbR+wrjydpwDt
         wvmVdv+4M6lGt0eXcDFyBbBvIADXaQ16+ucNhuXzkvp8YujY7CVawG43hdb8JTz5VHlT
         Xv3w==
X-Gm-Message-State: AOJu0YyAN92Y3IYeJYxY5XvldiQxsggOQn6VxAC4qwbNoz7IRH83RS5x
	UWyNCiAGtspueYB7EQ6NV3KVgXPX48hWcxcLdGV+BYiupB0JsAu8mzdn7O8HAt6hFdoRlqHW4DV
	GyW7r0MjLuDSXgXpyNVbxBxSOddOxyScMSA==
X-Received: by 2002:ac8:5841:0:b0:428:318f:e484 with SMTP id h1-20020ac85841000000b00428318fe484mr719671qth.108.1704981764093;
        Thu, 11 Jan 2024 06:02:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtflAELoemq0nV2Xk8B+wSndOSPvHCcElj4MrMOV9ESDLlKwYt2d36MOLJ5nZhJxTYASh33A==
X-Received: by 2002:ac8:5841:0:b0:428:318f:e484 with SMTP id h1-20020ac85841000000b00428318fe484mr719653qth.108.1704981763747;
        Thu, 11 Jan 2024 06:02:43 -0800 (PST)
Received: from x1 (c-24-2-114-156.hsd1.pa.comcast.net. [24.2.114.156])
        by smtp.gmail.com with ESMTPSA id cg5-20020a05622a408500b00429ab4df47csm451462qtb.17.2024.01.11.06.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 06:02:42 -0800 (PST)
Date: Thu, 11 Jan 2024 09:02:41 -0500
From: Brian Masney <bmasney@redhat.com>
To: Lucas Karpinski <lkarpins@redhat.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8540p-ride: disable pcie2a node
Message-ID: <ZZ_1ARhDxYNk7Gt2@x1>
References: <qcoqksikfvdqxk6stezbzc7l2br37ccgqswztzqejmhrkhbrwt@ta4npsm35mqk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qcoqksikfvdqxk6stezbzc7l2br37ccgqswztzqejmhrkhbrwt@ta4npsm35mqk>
User-Agent: Mutt/2.2.10 (2023-03-25)

On Tue, Jan 09, 2024 at 10:20:50AM -0500, Lucas Karpinski wrote:
> pcie2a and pcie3a both cause interrupt storms to occur. However, when
> both are enabled simultaneously, the two combined interrupt storms will
> lead to rcu stalls. Red Hat is the only company still using this board
> and since we still need pcie3a, just disable pcie2a.
> 
> Signed-off-by: Lucas Karpinski <lkarpins@redhat.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

To elaborate further: Leaving both pcie2a and pcie3a enabled will lead
to rcu stalls and the board fails to boot when both are enabled. We
have the latest firmware that we've been able to get from QC.
Disabling one of the pcie nodes works around the boot issue. There's
nothing interesting on pcie2a on the development board, and pcie3a is
enabled because it has 10GB ethernet that works upstream.

The interrupt storm on pcie3a can still occur on this platform, however
that's a separate issue.

Brian


