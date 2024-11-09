Return-Path: <linux-arm-msm+bounces-37381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE6B9C2C14
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 12:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0771A281C7F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 11:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBAB1494B0;
	Sat,  9 Nov 2024 11:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1Qayx0t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFD913D886;
	Sat,  9 Nov 2024 11:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731150301; cv=none; b=m5zcBEfIvaBFSQc2YmCr8T29r/5YT0zdO5xa+286iCOpItPulUWbj8C01YUfAMMml7xa+FJ1KTl9PcwVcsNs10TLwhJ8pO1zsON3bq+UaOrsAZ7opLsSboogctHMW3ZIXSdoCHs9yIqv1YQHN/y1AMIa2UPE8MhuCdem9KtXwCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731150301; c=relaxed/simple;
	bh=euqJK0ntVjQw+QOGivI7fOl8DgX26ZTRRMEWEMAcpIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgNoXT1NrarfilqHYp10XI7M9+9gbcx3mnmn7A1684mMtWFf8RjyzhOOQlJuxlPd4sa+6Gi1VtqCCeVdBsGOy6SFS/9kgwM2iI5UxphZNTLVDvFzau0bo3xQ9uH6Ii0uxIpigbA64FtcUz03QT9j/V9InNwGFteQq3fCUAvyl3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1Qayx0t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E826C4CECE;
	Sat,  9 Nov 2024 11:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731150300;
	bh=euqJK0ntVjQw+QOGivI7fOl8DgX26ZTRRMEWEMAcpIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1Qayx0tdzHz3ogJQWZ7gcb117WFpIxOt92gsgRdNiHUDLqlF9kC6OvZAKris6b4B
	 S2QCoDB6S/xtxpdH/yGV3Rhl/8FTdAAxjD+4ccDxbb1IkHgJlHrPYKf+nq1Vgnyvto
	 mciowh+BpR9k0CIbcemuKV7Wc7/lGJQC0+tD8GRE2ENH9NoIDLUmJ7oh1riWjw9Mvl
	 Nt8wwVfeS9o0m+RV7P9pNyRy6oKCQFiwpZ7LghKycDEcyem8IAdR2TWmE2Nv8htPSe
	 Zo8QrDDcoPlT82RjCa69oVHB9iZ9xbS+8EYUCe/wMBLj8D1t6G2fpKHErt1HJUoAXB
	 Ix3HLRQgokqHw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t9jH5-000000001KK-1JVj;
	Sat, 09 Nov 2024 12:05:03 +0100
Date: Sat, 9 Nov 2024 12:05:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable+noautosel@kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: x1e80100: Fix missing address/size
 cells warnings
Message-ID: <Zy9B3wjv_ODlKBxW@hovoldconsulting.com>
References: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-0-c1e173369657@linaro.org>
 <CAA8EJprX=2i335rm5JovkBYAYd=ku=yaNgFJVXh03BYEantGAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprX=2i335rm5JovkBYAYd=ku=yaNgFJVXh03BYEantGAw@mail.gmail.com>

On Sat, Nov 09, 2024 at 12:49:16AM +0200, Dmitry Baryshkov wrote:
> On Sat, 9 Nov 2024 at 00:05, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > The commit 4b28a0dec185 ("of: WARN on deprecated #address-cells/#size-cells
> > handling") now forces all parent nodes to describe the #adress-cells
> > and #size-cells, otherwise it will throw a warning.
> >
> > Note that this patch is currently only in -next.
> >
> > Fix all warnings on the X Elite by adding these two properties to all
> > parent nodes that don't have them.
> 
> The individual patches are incorrect per my understanding. None of
> those child nodes use addressing, so adding #address-cells = <1> is
> incorrect. Maybe it should be #address-cells = <0>, but that looks a
> bit ridiculous to me.

Yeah, the warnings are bogus. Rob merged a fix last night:

	https://lore.kernel.org/lkml/20241108193547.2647986-2-robh@kernel.org/

so this should be resolved in linux-next on Monday or so.

Johan

