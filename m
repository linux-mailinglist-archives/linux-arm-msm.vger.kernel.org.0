Return-Path: <linux-arm-msm+bounces-80643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E04C3C982
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 17:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BEB1D4E893B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 16:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F353319608;
	Thu,  6 Nov 2025 16:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="tocVgbdm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEA41E570D;
	Thu,  6 Nov 2025 16:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762447855; cv=none; b=DQp50IIO2//gYQ0L7kKnYnX8K9oSL+W1Wjfd2aiWpMhJ2hRFm5AyekCuAp2UbkRB8psaq11Z7m03BusRPAGMpYKw+ptNkDyFO8kmXo0DUii+dpBgzK6Emxsp41m3I1nPbxVSvkHhfWqBrFdjBztFlw7Lk336LNtIItvtizwCG58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762447855; c=relaxed/simple;
	bh=jIUv/teTMHKPgGe3jJDoJLF8nJ7SPFL9u6ghr5Y0j/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2k7RdwNV4oC8UGxTpcR7E8C+iqcizTH2uTvOkzuf9u2KnkvPRzGvUxCiZKrkST9WmLK2pWUVv6adWuPqnejrS/gOSEm1WJ1PTjm4qTSEX4y6nzCBSwoMr2cHHv2J+njyjcq2zW349JTzEwnqQRiY95g/PMxgVXrNO2UshnUbyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=tocVgbdm; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.76] (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id A77E62FC0061;
	Thu,  6 Nov 2025 17:50:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1762447849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8SG07jz7LMWOW6RQ/agxUifP6Wy/O8r2e75TQY61X14=;
	b=tocVgbdmWC7zKZXF7VebKKOWbwPOD65uZWtdIUOGzjcltr4bJI6KcUb4RmPdZTguRxrT8v
	fZpS8ITr6v10Yv8YeXBTvlP81RS5ZJgOSz/GelNKPo9KnQs81J1Y02Oo4THs2CnbHg5g3H
	8+ZvksxzuMJY4r58MM04rAcNsfrdk38=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=g.gottleuber@tuxedocomputers.com
Message-ID: <80b25a98-5335-48d8-ab82-54400194f3e5@tuxedocomputers.com>
Date: Thu, 6 Nov 2025 17:50:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] dt-bindings: arm: qcom: Add TUXEDO Computers
 device
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ettore Chimenti <ettore.chimenti@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
 stephan.gerhold@linaro.org, wse@tuxedocomputers.com, cs@tuxedo.de
References: <20251105154107.148187-1-ggo@tuxedocomputers.com>
 <20251105154107.148187-6-ggo@tuxedocomputers.com>
 <20251106-prophetic-flat-panda-6f2b54@kuoka>
Content-Language: en-US
From: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>
Autocrypt: addr=g.gottleuber@tuxedocomputers.com; keydata=
 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
 bsxTTcOuRnk=
In-Reply-To: <20251106-prophetic-flat-panda-6f2b54@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



Am 06.11.25 um 09:06 schrieb Krzysztof Kozlowski:
> On Wed, Nov 05, 2025 at 04:41:05PM +0100, Georg Gottleuber wrote:
>> Document the X1E80100-based TUXEDO laptop
> 
> Which one? Please use full product names and full sentences ending with
> full stop.

TUXEDO Elite 14 Gen1, will add this in v3.

> Best regards,
> Krzysztof
> 


