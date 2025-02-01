Return-Path: <linux-arm-msm+bounces-46636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7924AA248E8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 13:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F0893A5EA9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 12:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BCA15B0EC;
	Sat,  1 Feb 2025 12:16:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEF910E0;
	Sat,  1 Feb 2025 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738412165; cv=none; b=i1UR9qVvnNpnam+GprcVyDkjx2SyeB6HWdOYSa9DP1uSWFaNHEclA/ajWFCxaK4zi/3ggbYhZGicWuoI62bN91A26pqKn87r+q3p+SBzXx6UQv6XXtZdvq2qG5PYMJSbfp/7dzlU+ciN45D4HeZZv/2PMGS3DQXUT1HS2L5Iydo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738412165; c=relaxed/simple;
	bh=b8U7QmhWk7y+Hx06WSqrwTDfcKEo/BG8sdQWG27SdjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDc/ZoAXif8rcSdOBRuVoynewLueUbNYzxdzMhMV4o6WV78lkIPGrlFJTROQdrfiaCyh3QcKcMQA2fj4kH+rckfPSBuB1aRv+hBbi3nyRFWYz4XXLbxbEgDaYnWAv+jsbxxjKUK0BXzAzb/taUiNMIFdPiYoK7GOiSwNFcTv6Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.10.14] (dynamic-176-000-016-040.176.0.pool.telefonica.de [176.0.16.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A9CD161E647B8;
	Sat, 01 Feb 2025 13:15:33 +0100 (CET)
Message-ID: <13d5026c-3274-4b90-b941-22f08a8ebdc4@molgen.mpg.de>
Date: Sat, 1 Feb 2025 13:15:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] Bluetooth: qca: add WCN3950 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
 Rocky Liao <quic_rjliao@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
 <20250201-rb1-bt-v1-2-ae896c4923d8@linaro.org>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250201-rb1-bt-v1-2-ae896c4923d8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Dmitry,


Thank you for the patch.

Am 01.02.25 um 10:18 schrieb Dmitry Baryshkov:
> WCN3950 is another example of the WCN39xx BT/WiFI family of chips. It
> requires different firmware files and has different current
> requirements, so add it as a separate SoC type.

Is the firmware publicly available already? (In patch 4/4 you write, it 
is, and I found it [1].) I find such information helpful in commit 
messages, and also the firmware names:

•   qca/cmbtfw12.tlv
•   qca/cmbtfw13.tlv
•   qca/cmnv12.bin
•   qca/cmnv13.bin

Do you also have a datasheet name to review the vregs?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/bluetooth/btqca.c   |  9 +++++++++
>   drivers/bluetooth/btqca.h   |  1 +
>   drivers/bluetooth/hci_qca.c | 25 +++++++++++++++++++++++++
>   3 files changed, 35 insertions(+)

[…]

The rest looks good.


Kind regards,

Paul


[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=421017641e6a6ef389190ac3edf67885183f3de0

