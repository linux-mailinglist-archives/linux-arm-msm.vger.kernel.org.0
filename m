Return-Path: <linux-arm-msm+bounces-41439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B719EC7A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D7031690F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469F51E9B11;
	Wed, 11 Dec 2024 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnjETjGA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180C71C1F21;
	Wed, 11 Dec 2024 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733906875; cv=none; b=X1TdrkGnO00Jox9ladKroDa+kNMDTD1sJm54QlUWQCkxXgHWyqnA0AWxegnTjnTFmQ4FtcMwqUfeqC/HiwH93BbLHUybhF3TYc63kzEC/jl7sXYY0QQ0TX0MVp0iDA+hIopkgCdXY8RFUcs8pt1OR9ZAvtlPJlGUeo2SU7ciyEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733906875; c=relaxed/simple;
	bh=KVhmteNEHcOPz5cljjEj4xcA3NrjZZYzaVqrSUqxelc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWua7bel9P7WvyzRohcHCrHr84+x6RvSZaSvbBMBqbcXqdpGFBWNsu0VQ4VW/vI3/5xReIxa2UJPYn/Q92U3rqf6ocUuYBApJmyIpzToklE+dihLW43RQIGsvxyOwQnKMLnIRWi2f4BTfssRyrOB1TaSrKFbM+zNyGyJmy9iRpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnjETjGA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CF0C4CED2;
	Wed, 11 Dec 2024 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733906874;
	bh=KVhmteNEHcOPz5cljjEj4xcA3NrjZZYzaVqrSUqxelc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mnjETjGAk1VuEJZ9wePQ6s9JAtCq0q8SMrZkTWH+BYdJegNKLPcodnvnVyBZuNgt6
	 T0HNa4hYQgVyjFYRqfRkF7FszeC/y0r4evDD16peovgTNp6TUSXLFdo+wSwoO963Rj
	 CrrMEiwvodShjHOPwL6bqVFcmv5oRvH2hgkboNLf9DDfq4j6Jb5sisO0tJXEfKgJxn
	 sTFm7u5LS5HZR/8flFdsIH4Eo+v6TOTzxedqEZersA2BmF5IHxmtW/n+7N/21ObKJD
	 kyg0aBMmxye7nILu6Xm7WgjHC/1BwJd+8iYYmeXR8XJzZ/ED9YHn4a5Ty2M/iv0wA+
	 +MSd5n5vTXQag==
Date: Wed, 11 Dec 2024 09:47:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: Add label in the coresight
 components
Message-ID: <ee5g6cy3kpwwyhlop7ex7zm5fombbmqbvp34exhm6dv22v5fwh@5o4xxwam3mnk>
References: <20241210122253.31926-1-quic_jinlmao@quicinc.com>
 <20241210122253.31926-2-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210122253.31926-2-quic_jinlmao@quicinc.com>

On Tue, Dec 10, 2024 at 08:22:52PM +0800, Mao Jinlong wrote:
> Current name of coresight component's folder consists of prefix of
> the device and the id in the device list. When run 'ls' command,
> we can get the register address of the device. Take CTI for example,
> if we want to set the config for modem CTI, but we can't know which
> CTI is modem CTI from all current information.
> 
> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
> 
> Add label to show hardware context information of each coresight
> device. There will be a sysfs node label in each device folder.
> 
> cat /sys/bus/coresight/devices/cti_sys0/label
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>

It is impossible to figure out what changed here comparing to previous
version (see details in cover letter). I will skip the review.

Best regards,
Krzysztof


