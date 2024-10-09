Return-Path: <linux-arm-msm+bounces-33678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3B0996653
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 12:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5B5C1C23A34
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDCB18A94D;
	Wed,  9 Oct 2024 10:00:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076D8185949;
	Wed,  9 Oct 2024 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728468035; cv=none; b=pWDorhMYSBgNvjzp+vDzJAajTrkdR9WeyiJAMwH6/lPdXdD6KTjY6wilY1HH0sRePcPysBEsmMR5ukAdo5X9MncnlmBUbSgwVk7xfU2dOlSUeIQcXnx5y7nHqShfij0jrhdQzqLh/wc4JLCgGTt9ms8iMvBQq+vEQkVF2P885AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728468035; c=relaxed/simple;
	bh=9VMAKb/Kw/v4RiD4FG1omcECkrrKZnPeLNYV55fkUUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBdB9/5i6qArM9WS9VTE8TCga/FNnwXtYxCZfeHRhwIfsXa0/EDU078PDdPBEfYnT8xzr8pORCoxAuk7Mvc1HjHPW+GQLO8rPGsI+COSkS6w4gmOUGvvyyorTW3P52I7H/Ajw4uhGhTDkJZuybTzzOw9K5oxyYObwXJIzsRHBWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82D88FEC;
	Wed,  9 Oct 2024 03:01:02 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 716C93F64C;
	Wed,  9 Oct 2024 03:00:30 -0700 (PDT)
Message-ID: <dc93578d-0ef6-4446-ae40-ad9f4ba6af15@arm.com>
Date: Wed, 9 Oct 2024 11:00:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 0/5] Coresight: Add Coresight TMC Control Unit
 driver
To: Jie Gan <quic_jiegan@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Song Chai <quic_songchai@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20241009095556.1754876-1-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241009095556.1754876-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2024 10:55, Jie Gan wrote:
> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous configuration
> registers to control various features related to TMC ETR device.
> 

Please rebase this on the v6.12-rc1, which has the sink specific trace
id allocation changes and drop the "Depends-on" tags on the patches
which don't make any sense at all.


Suzuki



