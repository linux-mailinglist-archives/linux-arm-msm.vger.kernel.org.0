Return-Path: <linux-arm-msm+bounces-52154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8E5A6B7D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 10:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6489A7A4477
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 09:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549FE1F152D;
	Fri, 21 Mar 2025 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6uW0czV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267951F150A;
	Fri, 21 Mar 2025 09:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742550139; cv=none; b=GWaMEXGikoWb3yR9dYWV+wgUQusoKiCBKUn6pN337jkEYz+lcgilHiA/4gaUULmhAXHmu/NzmrBrbHYScVj4Y/arPNCveUCXB5KxPUbm1X7LHisKbibW6sMwNjB3/gHj0ztHcNCzMrliMKblgQacWbgfmUkV8ZB/41LTL9vbd90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742550139; c=relaxed/simple;
	bh=LsGqQfLW4xmvHqOWZQoTZqI23HLjYTqmgqYypkSYSEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bf2Ikx3v509lSR2u9/dbOVBAp39vCM4tbZo4clDoicIBKC8GaOcdHq15xkyNFxcPBIjHPQAIfghZE/QYoLxJBqB7txe9pVEqSztmrzLsnUtP6dRzmeOKQJuomQZS4cMPWmrKzfWFcdNMUbUxPnyqdgrkHw7jsHCT0+ehiZ0c3N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6uW0czV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E4FC4CEE3;
	Fri, 21 Mar 2025 09:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742550138;
	bh=LsGqQfLW4xmvHqOWZQoTZqI23HLjYTqmgqYypkSYSEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6uW0czVMc8Z64eLHZNEzJPzGZMlVTv7d/9qCs5ibzDcRxSCAJ6KlwPyCprIRYwUJ
	 eXHqUWYoWtT7Y7Ba/9pUHoC/T7r/i/kJPSyYVbGK+zjOs4UEWcXDgH746/o+VlNzsW
	 k1jO9zPzgohzGzD8V9XG09LiGSXJrSYsuRvpR0Sj3OeZd3Bt8Mzs9SI8IDECa+kY93
	 PhtJfEFiJHCMyOLIPzTHfohXAtd1YWsIehQ7Mf10nm9+PT+e0rJDZFyc6/Iymhd6dj
	 fUQdw0zdM+yB+zEC+6Q5vR/EsFuaRKQjuM+qVA5AzoNGxVAm3axRMYgZfk8FMpVldn
	 FOTynhNcsJ3rw==
Date: Fri, 21 Mar 2025 10:42:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, srinivas.kandagatla@linaro.org, 
	amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com, 
	quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 3/3] dt-bindings: misc: qcom,fastrpc: Add GPDSPs label
Message-ID: <20250321-anteater-of-immense-flowers-53b2c2@krzk-bin>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-4-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250320091446.3647918-4-quic_lxu5@quicinc.com>

On Thu, Mar 20, 2025 at 02:44:46PM +0530, Ling Xu wrote:
> Add "gdsp0" and "gdsp1" as the new supported labels for GPDSPs fastrpc
> domains.

Why? What problem is this solving? What is GPDSP and GDSP? Why they
differ? So many questions, so little explained in commit msg.

Also, bindings are before users.

Best regards,
Krzysztof


