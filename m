Return-Path: <linux-arm-msm+bounces-40451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD079E4F78
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3241167D1F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 08:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1731CF7A1;
	Thu,  5 Dec 2024 08:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/uGT4iW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0D6EC0;
	Thu,  5 Dec 2024 08:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733386489; cv=none; b=DoN4eo+VRqTGdA6AoaI6dHC+maXmWy/HFc36XZmJI4v3pAhAkph7DVYwvyucMz8EMr4YQQnZjA/OmIcNOcNhaZtR8lYuKMOE5f8tIXv9KCWWA71qBe62yb//9NmKodpxz+sX1Qm0tQzUH+uU9Y7pNEavfVhquruj8Pp4eQTNyMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733386489; c=relaxed/simple;
	bh=9X/aD4pGIV+/vcIq+d1mvHuyyzWzoMkOv/nQxabgb3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lexTR+YxEbP6yV7q5XN7bqXTqrcNDFM3Dvh+iCFN5bZVu8qAXL0JzcINPnjACKu+aLtPVkTh2JKtksgs8Hwb5/ypDZYHTI/mHGQclUp+SR08Z5qpCrod3FUTbjfkCScZcGMMbZSP2XrI2NvMEGHpy4GhPYhWovk08ryQB04Yb/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/uGT4iW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDFBC4CED1;
	Thu,  5 Dec 2024 08:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733386488;
	bh=9X/aD4pGIV+/vcIq+d1mvHuyyzWzoMkOv/nQxabgb3Y=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=B/uGT4iWS1yLra8zmrdmfM8yUajCKQl/59T2fdZDiknqmCTvxVF+wLlxVYSdMih7y
	 ZKsXUH/B9vbpq12pfTpRbPEvGmER+BVPTO2KP+2Iu6ERzlg/TdoLAjHlKqM5CjXQPG
	 eGu4qCHdDZ1FPACqK2E3JgSyiI7ehng+lxhFQ2zo6pj6r+QWalJN5W306PNM/8qnIw
	 EA+UwIHYt8u3I5SLpiYkA+UG5oV/0w4t5vpC5xJLpHCyx7ZA/SaXzy+cVq97TQZwCI
	 328kPv3USgqbnQy0eCyk9N07DzQRbb2kF+UGnwjp4niue18cKhl+hWTjTlU6BBZ8bo
	 CvjjfX2Rl7J6w==
Message-ID: <06b48a7f-de53-4b53-b3ac-be9efcee5558@kernel.org>
Date: Thu, 5 Dec 2024 09:14:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] mailbox: tmelite-qmp: Introduce QCOM TMEL QMP
 mailbox driver
To: Sricharan R <quic_srichara@quicinc.com>, jassisinghbrar@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241205080633.2623142-1-quic_srichara@quicinc.com>
 <20241205080633.2623142-3-quic_srichara@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241205080633.2623142-3-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/12/2024 09:06, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> The QMP mailbox is the primary means of communication between TME-L SS
> and other subsystem on the SoC. A dedicated pair of inbound and outbound
> mailboxes is implemented for each subsystem/external execution environment
> which needs to communicate with TME-L for security services. The inbound
> mailboxes are used to send IPC requests to TME-L, which are then processed
> by TME-L firmware and accordingly the responses are sent to the requestor
> via outbound mailboxes.
> 
> It is an IPC transport protocol which is light weight and supports
> a subset of API's. It handles link initialization, negotiation,
> establishment and communication across client(APPSS/BTSS/AUDIOSS)
> and server(TME-L SS).
> 
>    -----------------------------------------------       ---------------------------------------------------
>   |                                              |       |                                                 |
>   |                 SOC  CLIENT                  | SOC   |                TME-L  SS                        |
>   |                                              | AHB   |                                                 |
>   |     ----------    ---------   ---------      |       | ------    -------     --------    ------------  |
>   |     |        |    |       |   |       |      | WO    | |     | R |     |     |      |    |SERVICES   | |
>   |     | APPS   |<-->| TMEL  |<->|       |------------->| | IN  |-->|     |     | TMEL |    |--------   | |
>   |     |        |    | COM   |   | QMP   |      | RO    | |     | W | QMP |<--->| COM  |<-->| a) ATTEST | |
>   |     |        |    |       |   |       |<-------------| | OUT |<--|     |     |      |    | b) CRYPTO | |
>   |     |        |    |       |   |       |      |       | |     |   |     |     |      |    | .. more   | |
>   |     ---------     ---------   ---------      |       | ------    -------     -------     ------------  |
>   |                                              |       |                                                 |
>    -----------------------------------------------       --------------------------------------------------


Hardware description is much more suitable for the binding, not to the
driver. You wrote the same in cover letter and here... but not in actual
hardware description - binding.

> 
> TME-L SS provides different kinds of services like secureboot, remote image authentication,
> key management, crypto, OEM provisioning etc. This patch adds support for remote image
> authentication. Support for rest of the services can be added.


Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Remote proc driver subscribes to this mailbox and uses the mbox_send_message to use
> TME-L to securely authenticate/teardown the images.
> 
> The intention of posting this is to get the design reviewed/corrected since there are also
> other possible ways of having this SS support.


If you do not Cc maintainers, don't expect much answer. Missing Qcom amd
remoteproc maintainers.



Best regards,
Krzysztof

