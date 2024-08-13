Return-Path: <linux-arm-msm+bounces-28350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B28A894FB3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 03:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE29F1C20B8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 01:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C01763A9;
	Tue, 13 Aug 2024 01:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEkKZWr4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B438524F;
	Tue, 13 Aug 2024 01:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723513568; cv=none; b=ZIk7hE5OuL1uvSQdHOzuF0Pr1Nybax55mJVQl+rK6Mc7ko5xHMNA9xUJ6AmRPJnB6WYWuZZoc/VnTGzSw5kYm3LURdMH9bKfnJG5sV1d09/56suTEMdSnWueW4CJiU1Dn9OosoNC9EEAhz/Zz5Jn8/KA4S+g2EjHFF0n61EL+bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723513568; c=relaxed/simple;
	bh=ptc+nAFS867Zez9/3rcNDuD0VFw4LBdJN6/N9F4TP7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CJYZga4XZXfAK4+Ds1ZzFhBedjiERuhf8RoQXVQRw+NpKedtK2+YKnc9F+gYKwwV4hq3m3qyr6oZriX8MhdtDYs+j3QoLZLVMmVgTo0TlrPVR+s75ZT7SN+6lBcyL0axmBMyhld7Que/3fvhIlaWbzP6uutRpW7MEmyqpat1UoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEkKZWr4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64532C4AF09;
	Tue, 13 Aug 2024 01:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513567;
	bh=ptc+nAFS867Zez9/3rcNDuD0VFw4LBdJN6/N9F4TP7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hEkKZWr4OHo/9pF8Q1/f4R0/pBaOYpRjrnJIXSj1FH3KuU9+1UOFTz8QqdoeZbIfT
	 JKB4Rm+B/7IsU71Rv5TvDy8usMWhpSNZZWkWBJBQJwQuJGIt8qwaqFHdSvRKxpmrSW
	 EquSvcwR9J5DFY84rX9musiC+bCtLtyHoCrhoK0aXvA8GwQvcUSGaytYFnULUzCUq9
	 BeIhFJ+BluGWAIusxLxicL7jw0FJwaPIDvh4CGJ9JlDLLbra4FiWwEVoOZZG41Owuq
	 fxn7Fz/HWhh/jYt10AFvJPYeCpueFMDNhyP4zIaSF3yx8YE38zq/TZv8wj5kZ5mFlV
	 IWQ3pimbU/G9w==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] rpmsg: glink: Introduce tracepoints
Date: Mon, 12 Aug 2024 18:50:25 -0700
Message-ID: <172351382248.3412490.1120963697730022000.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805-glink-tracepoints-v1-0-a5f3293fb09e@quicinc.com>
References: <20240805-glink-tracepoints-v1-0-a5f3293fb09e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 05 Aug 2024 20:56:24 -0700, Bjorn Andersson wrote:
> When debugging interaction with remoteproc, do performance measurments
> and fix client bugs, it turns out to be very useful to have tracepoints
> throughout GLINK, so introduce this.
> 
> 

Applied, thanks!

[1/3] rpmsg: glink: Tidy up RX advance handling
      commit: 159c79764f37f081b79d577e71b62f0b1b2b1062
[2/3] rpmsg: glink: Pass channel to qcom_glink_send_close_ack()
      commit: 91adb340d1b8fed6507d0143da1f0d8ccb8aeca4
[3/3] rpmsg: glink: Introduce packet tracepoints
      commit: 34f79c11fb2f31ba05f13e42b936b3eae1783d40

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

