Return-Path: <linux-arm-msm+bounces-61777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F38ADF8A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 23:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE5D93BBCA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 21:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B064B27A448;
	Wed, 18 Jun 2025 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jc9IT0dE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8449D261362;
	Wed, 18 Jun 2025 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750281695; cv=none; b=JB2zG/BYDJDpmXiE38+I0eXOzb3wUFTgksZA2UT44Bb3WoMul+tAQRhnTUxzzVPpfdhse3it60w69FS++gzp9DAtIdoXzrzZybT6SGUPnxoT0LlaTfT3vQd8ZSW54CzAXTir55CqXSLWzm48eN3DqDqCXgp78W6dh5Z/3GkJ/eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750281695; c=relaxed/simple;
	bh=ufXQDSr9MnX2+btwgWqQf8A2kdcoLllh90W3HsZ6bm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8NHhMFjcMBJ8B4bHD8OquU+WHqJfAoTickqQd6YMg3l/PZcPcHZsuuJgC0a3gGqImGGCuWugIUcLw53ioiVynJG6mQHXPQ6VLtG7+xGzlq4nUBgFENFMQqMd3qzijHPqYwgcL8U/XE8khBNo2u3hb5gZv2JLr1oXM5Qpfz6KrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jc9IT0dE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302B9C4CEE7;
	Wed, 18 Jun 2025 21:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750281695;
	bh=ufXQDSr9MnX2+btwgWqQf8A2kdcoLllh90W3HsZ6bm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jc9IT0dE4F/ABrqCHtTwlHht2/wYIgHxarLH57oGpl3w3sKZbdhn8/alQfNZfjqZq
	 mXgTSZUOa3c00wduHYVXNFk4GDqbiPsWb2YM3wWMKb/fJLnq+es4Gsf0Pv3F1Q6e+3
	 kI04kj0miB5JIkmg4H1xy3zEEkpBph2BbeW7USziXJAsUhAhwwtiizlvSE32CXVmgO
	 +hihDRlbkt1ifcjWpJsiyPhEjYWvLa6qVIcpGwtRTmxbcwsv9no/Q/jKROMEO6uDjs
	 MC3jZ46R7ZzTdbdvPhWhwPmimYAWFqL3AaETSxA+0pgKdsgKqj4EUfVpGgpGHq5iZJ
	 TX6vXr81XTVMQ==
Date: Wed, 18 Jun 2025 16:21:31 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Add support for clock controllers and CPU scaling
 for QCS615
Message-ID: <jtirzyxqdffbqwlhuepgspyepimn7tx3btcovutfhzveynlk33@3xnoc4awrbma>
References: <20250612-qcs615-mm-cpu-dt-v3-v3-0-721d5db70342@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-qcs615-mm-cpu-dt-v3-v3-0-721d5db70342@quicinc.com>

On Thu, Jun 12, 2025 at 03:47:19PM +0530, Taniya Das wrote:
> Add the video, camera, display and gpu clock controller nodes and the
> cpufreq-hw node to support cpu scaling.
> 
> Clock Dependency:
> https://lore.kernel.org/all/20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com/
> 

This was rejected 6 months ago.

Regards,
Bjorn

