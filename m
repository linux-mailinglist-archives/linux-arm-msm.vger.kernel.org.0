Return-Path: <linux-arm-msm+bounces-30686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4BB96B951
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 12:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A6011C2111F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 10:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A939F1CF7AC;
	Wed,  4 Sep 2024 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvP4MRJG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1A11CF7A9;
	Wed,  4 Sep 2024 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725447200; cv=none; b=Q/Iosp5w12TP/r6Ar62HNsbyWllegDx8eiR9MizZuHj8ze7I0OWx1qbT+OlXHZ55315Y11ayyT1Zm1dPYqJHRTQ5EmMlZoky93SvwgdRHDWoiaVGIQxQQ1P17g0+LO03uENf7FjHzfOIZMwD91WMDRGQnFJZLvLV+09Ia9+6lus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725447200; c=relaxed/simple;
	bh=HcWwPq8bZqR9haUfO1gac5XO3+21YzyN+E77BIaUGWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukSgg+OgsJSJfZgG0Xp0TAo4qo8b0k0gWK1tmrP5Kr8dKBd8yi6VJC7epmfytgoP+/+B/htDrNHetFJ7gDJcLZMsKCqVqqHoX2y0AMmNYCl3Pp78/Njv8CL8AL5lRpk1u+mYY0mwIXnR0ZG8mEfr+xhtwa4wYaB0STLQlJuWPyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvP4MRJG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3604C4CEC2;
	Wed,  4 Sep 2024 10:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725447200;
	bh=HcWwPq8bZqR9haUfO1gac5XO3+21YzyN+E77BIaUGWA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LvP4MRJGp2CeFH7F0C594eFMF5FtRInh8+Wu9MqCSKYWWQkoD0Q8YDpLBuunWogFU
	 tIRJIwOWDTaFR0UvvW1BJt3/+36Eu9qDDoYEASYAJmZH/KB8NF2H4b/dNwInzpRzSr
	 CeBHH9GB5ZZ3UcCf6OXevjBSg2lua6rAPkz/O1U3zCtsf7UJyKut7pLIfjjYmkeX4k
	 R6BASYVjVTq42hZVkUvv8pBfK5Qz9dc8zFjuVsYK2+HvmXy8NTAC7aeCZcipJlwWV+
	 79SMAhW1jVC6vcAWUV95Gv5QxEZG6F7CRcCCvmVFDRJF/BngePN/OOf/tsDpsvFs2i
	 jy9yXIshholqQ==
Message-ID: <3b318d1b-04cd-4254-a0ce-743e55922cbb@kernel.org>
Date: Wed, 4 Sep 2024 12:53:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] firmware: qcom: scm: Allow QSEECOM on Microsoft
 Surface Pro 9 5G
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240903224252.6207-1-jerome.debretagne@gmail.com>
 <20240903224252.6207-3-jerome.debretagne@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240903224252.6207-3-jerome.debretagne@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4.09.2024 12:42 AM, Jérôme de Bretagne wrote:
> Add the SC8280XP-based Microsoft Surface Pro 9 5G to the allowlist.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad


