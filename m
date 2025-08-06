Return-Path: <linux-arm-msm+bounces-67890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FD7B1C481
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 12:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 398A8163712
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 10:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFD3238C33;
	Wed,  6 Aug 2025 10:45:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89720209F2E;
	Wed,  6 Aug 2025 10:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754477155; cv=none; b=FuRGGfFr/PdGoNzuH6SeaRUd0XJq24aTHt3emKTX9geVJQgpeZ7cx7k4M0HRinvBGifPrFUEaziFHSwvHfk2Sse/0EEv1OqLbHweNk5JwkDox37gpg+ANAqdQgwgj49yxh/jjKvaLTLED6tPfK73XxAL7j3WITPiMeAitR6nhr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754477155; c=relaxed/simple;
	bh=+W4cUhjFcmhZAGlCJ9yvwP79Ht1+Cn3EZA4uPRmdUjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xk+9XvAepJzl//i8qYHgDbcygYZKyjDonDIpqneDIAnqSmQwxFuv2gm5cWLc8Oswm1UTJTbtjTIAHZE+G56rLgSU0WGX45/PkRbKXukkSwZgRa1xkcT/FWEN8nKFkkzmf3MFsc6Q8Pwsl27/68mHksrmbfOxargvYfbbWGlzIQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBC431E8D;
	Wed,  6 Aug 2025 03:45:44 -0700 (PDT)
Received: from [10.57.2.47] (unknown [10.57.2.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DEAD53F738;
	Wed,  6 Aug 2025 03:45:50 -0700 (PDT)
Message-ID: <6b4380a1-02c0-4f80-a11a-8af1c99d8b17@arm.com>
Date: Wed, 6 Aug 2025 11:45:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/2] coresight: Add label sysfs node support
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250806102658.536683-1-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250806102658.536683-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2025 11:26, Mao Jinlong wrote:
> Change since V9:
> 1. Replace scnprintf with sysfs_emit.
> 2. Update date in ABI files.

Please note, this is not going into v6.17. This would
rather be v6.18 material

I would recommend, resending the series at -rc1, with
fixed dates

Suzuki



