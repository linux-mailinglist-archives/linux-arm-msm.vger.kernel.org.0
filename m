Return-Path: <linux-arm-msm+bounces-32704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CABF9890A5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Sep 2024 19:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07FDE281D8D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Sep 2024 17:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5211755C;
	Sat, 28 Sep 2024 17:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="cxPRrNkm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE17247F53;
	Sat, 28 Sep 2024 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727543149; cv=none; b=mvFsEK8fTljBfDdV6I/OlWp02a1jAWbjP99gWjhTDkWDmd1I5v4G1jWpB1QqzY0Z8zjRkeLVKG8ww7e6/6dhlSs4McXdUaDBXYn1NLuvnH9thf1zcEUhgH7/QxDpgZMwSXHAL+JYo51OKZMNnrFyoXKvavgesLB54s2cH0hjwaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727543149; c=relaxed/simple;
	bh=mrDTHczBUVO+Z+O9DHZF2u+esRrZbDGTvRKGSvgL9V8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Nk18fUu8lPZRVhy5xKAOrbF1P3zLyOELqfl9dSW9Kmv+Zx0yx1OVYU4kwmIZ8835tIrsw5EgmwuB7bPUmar4Tm40gq9CFnVTW+qARXAibCWPq8qN5TvTDM68YJtI7+Sg51i2nNtELY5SxMNo7cQ6uxMH0G+D7Kp27KhvvhaORlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=cxPRrNkm; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id 11555E450F;
	Sat, 28 Sep 2024 17:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1727543139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gkoPnL/JI7TcgMmtYbbDPdhapIy7UatsrJTwk4iLhDY=;
	b=cxPRrNkmzjqxekB3QWby8HcPXZL3NinvckYxhld3JzRgXpWz1KsYPz22A9Ejw0HLfkXzYc
	Ax6NzVbuiJddC+58VORiqW7UP89ZbC/zy7Q7pthwNkygSaQ0UW9amqREgOxkP+js43vyon
	PoQbAy2JVumfJStDmuwM0w8BaggBsPZ599rmf4mDk07klHqCjeKIK5bxj3Z+LM1yInK8X8
	mDp4I4RxKgQcyz8pK9pdfoXoN6QSEX4S9lGDfJYm8IM2ETpOOUOt12ZjEehojcfSuPJ1gE
	wYI6TzHblpSXHEoTL5cN9b4Kr7D2xm/aidKFFAr0FhhylAn5UaarwKAixksixw==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 28 Sep 2024 19:05:39 +0200
From: barnabas.czeman@mainlining.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Satya Priya
 Kakitapalli <quic_skakitap@quicinc.com>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] clk: qcom: clk-alpha-pll: Fix pll post div mask when
 width is not set
In-Reply-To: <jlmnxzkferigmhh5akcr5uumrdychjxyy2flftx5u2sg2w62aa@566u2lqj5od2>
References: <20240925-fix-postdiv-mask-v2-1-b825048b828b@mainlining.org>
 <jlmnxzkferigmhh5akcr5uumrdychjxyy2flftx5u2sg2w62aa@566u2lqj5od2>
Message-ID: <b9369ebfeae8bc1aad3f9da4a6453c3d@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-09-25 23:28, Dmitry Baryshkov wrote:
> On Wed, Sep 25, 2024 at 08:33:20PM GMT, Barnabás Czémán wrote:
>> Many qcom clock drivers do not have .width set. In that case value of
>> (p)->width - 1 will be negative which breaks clock tree. Fix this
>> by checking if width is zero, and pass 3 to GENMASK if that's the 
>> case.
>> 
>> Fixes: 1c3541145cbf ("clk: qcom: support for 2 bit PLL post divider")
>> Fixes: 2c4553e6c485 ("clk: qcom: clk-alpha-pll: Fix the pll post div 
>> mask")
> 
> I think one Fixes tag should be enough.
Should I send a v3 remove one of them or not needed?
> 
> Nevertheless,
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>> Changes in v2:
>> - Pass 3 to GENMASK instead of 0.
>> - Add more Fixes tag for reference root cause.
>> - Link to v1: 
>> https://lore.kernel.org/r/20240925-fix-postdiv-mask-v1-1-f70ba55f415e@mainlining.org
>> ---
>>  drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)

