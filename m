Return-Path: <linux-arm-msm+bounces-43485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A8F9FD26C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 10:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CFE9163715
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 09:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C31155726;
	Fri, 27 Dec 2024 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqLMzbiB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43201155330;
	Fri, 27 Dec 2024 09:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735290603; cv=none; b=sU+1pxzRvwc27YQl4K9zhMv2OKhtPhi0/vRaFAOGTM1H82LiX59arI6mrWXqmcxGF0IbtkscXuKechoHPTDPt9sgPbpUTm6Gpr7q6cS9wLO2TQcoA9PS8qTKXsQryt8NP30HvHdD7m9l96R0NUEJTl6qdJOOxNbCWSVrRZJxH48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735290603; c=relaxed/simple;
	bh=XpFjgBNVHQjdp9qaw76SEKy0qKalGuoo4yDayZIghgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHxlfe9dfmUNzootyPXqqiFIYBU5LPRzt3XJ/p6p6FTYJBlUq0DOySrc/2B5kIVcoMxcfIyIsyJ2HZMyWc8FdCff8uynN+iCdXY+oL+P1intvGCvZ0majAZ0qgO1/7HDGX3FrAFQzE5LlMGYtIWWsrh50E4AhMJgfwdm/UxyE40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqLMzbiB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F15C4CED0;
	Fri, 27 Dec 2024 09:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735290602;
	bh=XpFjgBNVHQjdp9qaw76SEKy0qKalGuoo4yDayZIghgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cqLMzbiB94CeDC1gW0fOyxRdG53LrJN3vz05sXcZOMFZKMAhGvrYFYduuPfMoBqep
	 YLhbRPaF3Tb7QPWakJMHC0dY2VoavTvzEOoJfNFbPaEodRdYjH2NaGDmZpU7kQsmlG
	 oLWMi2YFPMy9m5CGSYWo6hEulsU5efhYYi6yZqhckNeJidLZksTVcd6cJudMo8b/VK
	 Eq41sBS6R2Z3rcmMVFb6T010ccxJCaZs87/7a3P5ID5TcSu3GwZqLgdz7tQMWETroy
	 QNkfCdLRu0IchWUA08E4B1HDvX+Xs2OLKC6KxTazvX1vPfJesOrs8LTxjL+iC+fy+w
	 R+O4+P3xLCSFw==
Date: Fri, 27 Dec 2024 10:10:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Depeng Shao <quic_depengs@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	vladimir.zapolskiy@linaro.org, quic_eberman@quicinc.com, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
Subject: Re: [PATCH 12/16] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
Message-ID: <ql3sufugcdpoxqgvs2f4clmbnx75t4jh6ts2ryneu2u5oeuwzn@yizcouuzfj2s>
References: <20241225133523.4034820-1-quic_depengs@quicinc.com>
 <20241225133523.4034820-13-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241225133523.4034820-13-quic_depengs@quicinc.com>

On Wed, Dec 25, 2024 at 07:05:19PM +0530, Depeng Shao wrote:
> Add bindings for qcom,sm8550-camss in order to support the camera
> subsystem for sm8550.
> 
> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---

Is this v7 or v1? Same issue was all the time in the past, so why can't
you finally fix it?

Look:

$ b4 diff 20241225133523.4034820-13-quic_depengs@quicinc.com
Breaking thread to remove parents of 20241225133523.4034820-1-quic_depengs@quicinc.com
Checking for older revisions
Grabbing search results from lore.kernel.org
  Added from v6: 1 patches
---
Analyzing 217 messages in the thread
Could not find lower series to compare against.

I am not going to perform review, maybe other maintaners have spare
time to deal with this submission process.

Best regards,
Krzysztof


