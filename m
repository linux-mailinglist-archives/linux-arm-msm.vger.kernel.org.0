Return-Path: <linux-arm-msm+bounces-14578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D45880295
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6630B284989
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90732FBF0;
	Tue, 19 Mar 2024 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YI04zE8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63696D29E;
	Tue, 19 Mar 2024 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710866601; cv=none; b=TEo6xCwpEotoaBObJDhftdgFvAR2g/HRjlamYbSNo4NpKkRwwakrNk/X5CB3gccckcUK9w7g6KzAbvCHt1HLfQZsJOwH7i13Xxy2veR3z1VG2XEoxXba+W7PaGA4AKBj740YmcB+u0uUxt3s0tVP/OzQ22yXpMfAQ0wJQzoeSP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710866601; c=relaxed/simple;
	bh=7q6K03v9Gajaxg7y54ygTX+ANkBwLzliWh+n0D7C7nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TptCiJTEN+n2XpOENpZYlWmUC996ex1AdI0aTenT1xZuPTssMFQFsa3eEr0567+ZM8mMPfCnfQw5FhRvrbzeQJJGyS2F29Ds2KELha1eIIpUEF1Uf13JXvQ70qYvG8BbJMHffY52YKTDm1fJi6NRURPJYxPS7hoAAuz+IGl//o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YI04zE8L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02A7C433C7;
	Tue, 19 Mar 2024 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710866600;
	bh=7q6K03v9Gajaxg7y54ygTX+ANkBwLzliWh+n0D7C7nY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YI04zE8LVliNzxYztt5R88IbNw4YFt2AxA+0Swc/ydZsmpym7x7i09cyRN2qVc0Kt
	 6qLHX5IBr9bMgLB+/uBWsA+DjENIzFxy95IDdLKASyTihj70Wc931pSW+GAHyCgBov
	 TBECJWTpaBnW1LoNZ3euYwTAf/xkRpMo7fJBJZYhTV4mzvLBqQZd/gE5CNJaAZKD+V
	 K7NmBBheWFRtdlXFWWlN3XRZ1ZGynqoUgtoQOYD1BqbuFXNLDaTZv9tsZKrCl+Ajoe
	 PQsoMv+VZxYBs/ZDBseBhN0316CX7YMVNFN/RMf78vZprsXc73eNQqoqHJ+DuOFzvP
	 1JYSA1iocAO4Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rmcYi-000000000vo-0EDB;
	Tue, 19 Mar 2024 17:43:28 +0100
Date: Tue, 19 Mar 2024 17:43:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/31] Clean up thermal zone polling-delay
Message-ID: <ZfnAsGlV9Wowkh9z@hovoldconsulting.com>
References: <20240319-topic-msm-polling-cleanup-v1-0-e0aee1dbcd78@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319-topic-msm-polling-cleanup-v1-0-e0aee1dbcd78@linaro.org>

On Tue, Mar 19, 2024 at 05:13:30PM +0100, Konrad Dybcio wrote:
> A trivial follow-up on the changes introduced in Commit 488164006a28
> ("thermal/of: Assume polling-delay(-passive) 0 when absent").
> 
> Should probably wait until v6.9-rc1 so that the patch in question is
> in the base tree, otherwise TZs will fail to register.
> 
> FWIW, Compile-tested only (except 8280).

Please provide some more details on how you verified these patches (or
that patch).

Last time you said you just checked that the interrupt counters were
incremented, which is not sufficient.

Johan

