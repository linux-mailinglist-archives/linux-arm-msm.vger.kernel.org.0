Return-Path: <linux-arm-msm+bounces-34820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB31B9A2F8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 23:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E59D28672B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 21:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C961D5ABD;
	Thu, 17 Oct 2024 21:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZpLgUXGT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EB61D5AAD;
	Thu, 17 Oct 2024 21:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199712; cv=none; b=CfSmloRYsg7GOJJMK2MuWMfEGGDqZtq6KN9vpSK5Db7t9Dy9jSSzrZ+ynpOfoET2VaDCqCO5Y2Ag3PiqUWbwyBKWlipIMYTwIC/aCLmFfq+mjwOrb8YVt6+1wfQuldffhRoTAwdlrsk30t9+3+2+Yx9qjoiq/AGPOYUpmqsN/dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199712; c=relaxed/simple;
	bh=NIcBkU8/YL8oaq+wg1zMh3PtO1BGEysd5C1aHIbEFKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gjdVihU+scz6WfYmQcN13epu0WfPmcL8EnBovZgLpUZOekqpJyYbt3o5GTbUMWihtfUd7VItkpF/X4rBzM9OHq/OICEUO/wIhCdbIP5O1a0t6yEzSdLTNvRrx5mt4GdDYJC6A+RU9PXvdvAeavberXrYYAPChF4D1+Q61phFZIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZpLgUXGT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88EECC4CECE;
	Thu, 17 Oct 2024 21:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729199711;
	bh=NIcBkU8/YL8oaq+wg1zMh3PtO1BGEysd5C1aHIbEFKM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZpLgUXGT1QeFW4P426zg1TT2lH+AMBwwGlDPKJVgnVsvZfB/S+8eXRwbKGnfFLQb8
	 QpXQ+4vxPvLtWVgmO4Jt+phTBbcosQNKOrGY22BAG+4iqmRjReYrIpcIoOMqQbvwjp
	 B1HcfvWZ6GnY6NGFqatFqAXZyGRyH1wRePwIlgvXn4xJ1KxZR9nhc/gpTRTAeju10n
	 LbizHtnxWqQrpkIwfbOSGJMeAC4VcywkwHGYI+NPYu3ahB/7qH42pM7vBM/iqOGinr
	 GNtgGHKpt8MVuekqJ2h2eaHaycqX12viJvnG+Nh4mP4u/sUPNYd7rs3lN+raTWFCFg
	 xmZvqRCPqh5QQ==
Message-ID: <4abcb390-b9fe-4823-8fad-a79754037c5d@kernel.org>
Date: Thu, 17 Oct 2024 23:15:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mailbox: qcom-cpucp-mbox: Add support for SC7280
 CPUCP mailbox controller
To: Shivnandan Kumar <quic_kshivnan@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
References: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
 <20240924050941.1251485-3-quic_kshivnan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240924050941.1251485-3-quic_kshivnan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2024 7:09 AM, Shivnandan Kumar wrote:
> The SC7280 CPUCP mailbox controller is compatible with legacy mailbox
> hardware.
> Implement support for this functionality which enable HLOS to
> CPUCP communication.
> 
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> ---

If you need to if-out everything that isn't Linux boilerplate, I don't
think this driver is the correct plate to describe the 7280 mailbox

Konrad


