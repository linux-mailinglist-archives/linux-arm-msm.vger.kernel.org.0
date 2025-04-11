Return-Path: <linux-arm-msm+bounces-53989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 602EEA85B07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 13:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26A257B60D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5FF20AF66;
	Fri, 11 Apr 2025 11:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRN0Dvm3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFB82A1BA;
	Fri, 11 Apr 2025 11:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369507; cv=none; b=fInrrByyanvx9GQpsg0KGr5hglTKDdszMnB12N6KvSullFmh/Po2fmFzsUm6jfSWnl60tdmBzCqT/O3CuopoVXyOhpucAbyGfSxnwxz/CIVxHMSIje+5oV5ctQ9WMfGdBmxoMCVGWkUQ/Bya1h61fRUZ2Y6BUutiT4JIxaAgBnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369507; c=relaxed/simple;
	bh=H44p8gRHelU9byn5fJeWl2n/DCnS2gWjjtXzYL/NVSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilDc7Nx3yBU1MfTICZ+aE+uT3pktqsq2//xb6Ew2oLiJIHRKJNC3zZ4fwe0ZfCUeCNdEIUYCai7EGlLNwkIi/MatU50XNBseSl5/CVOZxfc8tSJ5w29haHkZnjfPco3VsI5SuQbmO3pmgBWiYsRNjV8BUiovJRwlZ9IApDgp1YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRN0Dvm3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E51C4CEE2;
	Fri, 11 Apr 2025 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744369506;
	bh=H44p8gRHelU9byn5fJeWl2n/DCnS2gWjjtXzYL/NVSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRN0Dvm3TPO8h4c8ozWXBkg4KkvkGM3sR8OHYHSm0KnxkuVg+bS7OsYSRxVrfoKVJ
	 5q3mDgwa469TPi7zcTuWvvE/0Ocm2BEFfoHykW0FtFo7+MA1sPtMCkY/J82BjdS/3O
	 By+ZW9PEycuibs/CWEJPuiy9hVz1MmggM/rxrtaqW7A7WFI7Ot5MIkIRyjecuAtZ9h
	 gangZxWai4/87eh95XzZHuNvo1YFBh0HOyghhPSoOwsQQyjwGRaq92xG9UC0P1UiT7
	 4tcI0KJsy7OSpu74dQo7dMxkzlOFvfqYpS1H4IfHNFCjdy7zQVZb6V+xLOUwndMwsv
	 ahOWtFqunBKUw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u3CC6-000000007wN-0863;
	Fri, 11 Apr 2025 13:05:10 +0200
Date: Fri, 11 Apr 2025 13:05:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maud Spierings <maud_spierings@hotmail.com>,
	juerg.haefliger@canonical.com, andersson@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	konradybcio@kernel.org, krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom:
 x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook Ultra G1q
Message-ID: <Z_j3Zq52WZFjTgWc@hovoldconsulting.com>
References: <20250408145252.581060-4-juerg.haefliger@canonical.com>
 <AM7P189MB100977CCFD602396E8F01FCBE3B72@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
 <9db38911-4bb3-42c9-90be-51cbd6e523fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9db38911-4bb3-42c9-90be-51cbd6e523fc@oss.qualcomm.com>

On Thu, Apr 10, 2025 at 06:41:17PM +0200, Konrad Dybcio wrote:
> On 4/10/25 7:34 AM, Maud Spierings wrote:
> > Sorry I messed up and replied to the wrong patch somehow, this comment was meant for this patch.
> > 
> >> Introduce a device tree for the HP EliteBook Ultra G1q 14" AI laptop. It
> >> seems to be using the same baseboard as the HP OmniBook X 14 so just use
> >> that for now.
> 
> https://lore.kernel.org/lkml/20230510183423.never.877-kees@kernel.org/

It seems you missed Maud's inline comments:

	https://lore.kernel.org/lkml/AM7P189MB100977CCFD602396E8F01FCBE3B72@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM/

Johan

