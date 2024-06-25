Return-Path: <linux-arm-msm+bounces-24099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 227399167B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 14:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD0F428979B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 12:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB081662E7;
	Tue, 25 Jun 2024 12:24:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BDB158A23;
	Tue, 25 Jun 2024 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719318259; cv=none; b=bex+yw++H1p7su9DIjOiTEXk8J+e5zxQ3D2sjOFsU52XbcAK0Ug2kzhvYdDxiH/QLnBOU05SnDB1AQlm3qc5lU2dogPG2ciQtdctFOYOb3HB0ODoqFwdQet0CGxHh4jcGMoei2J4kJPnJp44nb1hMEMNkrcagxBjZjffam6bIW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719318259; c=relaxed/simple;
	bh=giefgP2BDi2t9Tlx2H690cP72Am6QSuiC2MbqOp4STs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LH/psTgs/fpfDoOq3NKFrjUFFRh67k2BnxNCVZznPNc4zkF7ONChMV0b19ZtLNuB2olbOLTK7VBxHmzj93BeIuiEdB+AdaWaVLASoIYst2udke6FlbAGFeAeDjNS/+/joAPjAYySBXov64iimjZt9xAmmX/7jXYSvGMDYI6REPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB724DA7;
	Tue, 25 Jun 2024 05:24:41 -0700 (PDT)
Received: from [10.1.37.50] (FVFF763DQ05P.cambridge.arm.com [10.1.37.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D620F3F766;
	Tue, 25 Jun 2024 05:24:12 -0700 (PDT)
Message-ID: <2e78b732-aed7-4de5-b5ac-0da5b78af342@arm.com>
Date: Tue, 25 Jun 2024 13:24:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Coresight: Set correct cs_mode for TPDM to fix disable
 issue
Content-Language: en-GB
To: Jie Gan <quic_jiegan@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Konrad Dybcio <konradybcio@gmail.com>, Mike Leach <mike.leach@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>,
 Song Chai <quic_songchai@quicinc.com>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, quic_yijiyang@quicinc.com, quic_yuanjiey@quicinc.com,
 quic_liuxin@quicinc.com, quic_yanzl@quicinc.com, quic_xinlon@quicinc.com,
 quic_xueqnie@quicinc.com, quic_sijiwu@quicinc.com
References: <20240625021212.1443304-1-quic_jiegan@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240625021212.1443304-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2024 03:12, Jie Gan wrote:
> The coresight_disable_source_sysfs function should verify the
> mode of the coresight device before disabling the source.
> However, the mode for the TPDM device is always set to
> CS_MODE_DISABLED, resulting in the check consistently failing.
> As a result, TPDM cannot be properly disabled.
> 
> To fix the issue:
> Configure CS_MODE_SYSFS/CS_MODE_PERF during the enablement of TPDM.
> Configure CS_MODE_DISABLED during the disablement of TPDM.
> 
> Fixes: 1f5149c7751c("coresight: Move all sysfs code to sysfs file")

That looks like the wrong commit. This was a problem since the original
TPDM driver. I would say :

Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")

> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>

Otherwise, the patch looks good to me.

Please could you also fixup "dummy" source driver in a separate patch.

Suzuki


