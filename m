Return-Path: <linux-arm-msm+bounces-20469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC318CF0FB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 842831F21443
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 18:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F7E126F16;
	Sat, 25 May 2024 18:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="d6Qhb33m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668B31CF8F;
	Sat, 25 May 2024 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716661227; cv=none; b=ZYGqvqlomzGsHzeMBIlIpYjy25NKjr8KgQpfrxfq+HjWOO6TJql9VpRiEiKZRydw254cEgJQSz7kg3iqdkcvXKQXcbUiUyW0QyJrGVEz/qe71aj+vGqb9BOX3sRkbETqEzgOZos22ll5tgD2gm+xvKNlzMMgFFQBpUoTrzln4IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716661227; c=relaxed/simple;
	bh=frYNqj8bLyBV24XE+B8L2uQXn++Kl/zNdYU7wxv28Jw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=kIDVmtDdNEVpc1ienA1YxvyCNZnEQZgN4AWoL85x4huSIYffDxkrnOGeKeKLMw6qpcBSgW9pgLPg5bCacZfxwTqtQn6TOxhTxLmYBopArBCdGaMhQ2rVJ1ghpmFHB9T8HSbkFSi7+ioB1u3/nV7sZSEpSk116cDZ3sUokEpuSf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=d6Qhb33m; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716661217; x=1717266017; i=markus.elfring@web.de;
	bh=ylDCKNwB+uExXDGAm68CO6JDJtc9Fbkz8M9YBROBEBQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=d6Qhb33m3fUi27fwH48NbTDdVwIfuRd3UrnCMZEF9Ld1fJNZOZwr6wrUnrGKfQBN
	 YbQ7T2xTKDvbVsWre9nhLk5WAotWUycY2rE/VjOXTnzc3iuWK+DMT2STJWRUcGUBm
	 bXYbAwON291ga26XnA5u4V27B3NYJ6CIkRtEnbfLV8sAbB39P72iKUbTNBIrmdU4a
	 e04KvoH2dHrqF9nazuLtkk42uOTlxSEmuZ7nEoAWd1Zh3ryDoILyspnopNhuWbZb7
	 PuUJuu+YQPopDdYlGIeShwib6Bj0pSnuGPRQh4jNzhdfc/eEmyaNJAIO+57LqT3bL
	 ybpXy6dfpCKeXLLHpA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MK52w-1rw9D50YeM-00SgSC; Sat, 25
 May 2024 20:20:17 +0200
Message-ID: <0a362e81-1e4a-4c4b-823e-e84c6f408630@web.de>
Date: Sat, 25 May 2024 20:20:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240525-mdss-reset-v1-1-c0489e8be0d0@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: add reset for display
 subsystem
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240525-mdss-reset-v1-1-c0489e8be0d0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u5iv6GIczXOJlRb+JNjI53MKRSNQ9Ww+aJMAc/yNUauEqBvtVTy
 9ClrXkpMNjJ9pFnVG4yY+Dx63T6lIdXdwV17bu9EJHpp62FUIxdapr6mHeyahcvPXMQsa/D
 +JO63/O3NMUVohlKmKS8tj4Sz+jxdjl0qteihV+oKrw8UCV3PSTJxUJq+FbRFL7kWPuR8w+
 LhJy8r9oQr5RpQ0yHvuVw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x8jl3ITeGf4=;VLGHTn9XQxgy5Tp1Y7wyZd3pm9X
 wHY8tjLQKH0KHDo0Y6a3bEpfxRC8uI/ASFm9TQrZYplCeOhJMiOgi5b5vPiVTvPV2bC3Ti5VS
 6trBEhfKTXxqRl5JCUcyMM5zzILHlx3ld9eCKDURst054bic+hHPgPLVqPfIWVylLTFbscdPO
 AoN1g2gObW6bXADDCuzWZ/L5DUA7uimmjC0JYA7lK+emf2P0c0SRth86jbZ/gui8v753H58qi
 uAaUihPISiaXdmtJPk0hzgE/3eDP/shObJZbaVwuZWKX3d02a0WYX6YtAAXCfK9wwt/8/WOhe
 Js+x6alRW223M6bcRp/hHLRoB3vdkwPLR+yF0cQYW86WH9SZafqST5d2FE3CODk7AAyoxygc9
 aUeRsaVlMjHvufhr8E5xtXWcPROMKTAiiAeGgcGLhw30g6Zeif83P1SVaJCqo0Ckiym3qSXm+
 JqmDS2MRTuSqNlS4NEfADZkFYmreNmtZJBqG3jyidPrY2YXI4k6wu9q/SSFGZ6/gXFXgvJ4Am
 XYYYS0mSxaN425Gji4lmTWk2sJtXZWtLFTtLNh0IDkXeeZt9GL2L8gR8VyCt+40JZ/Z+SRVdt
 Iu+ucSmSSC21kbaaf6Y56cTeRagW0gU+r5t4WnQJ4H4NXFJaID3u5qPkaCgsFxUeeFKAww/Ce
 gSKqIYKY4k4QpWUGAXQn+5k3ts/oq7hLa9nGlyC+G+0wFlgMDaHGzjp2e1nmB6XcPphGb7bjJ
 n3regGLE2QgSViNXWkJ7+lOteCGga/94Di06uW3BXRreIfv0Fb/dHou3pfodPDN1Q0darUHmU
 yUN0a8yvaGKsluuNimYCs7D/HbvZO5JQNJW2PHlX6nnYY=

> Add reset for display subsystem, make sure it gets
> properly reset.

* I suggest to use occasionally more than 50 characters in lines of
  such change descriptions.

* Please reconsider word wrapping accordingly.

* Can such information be relevant for the tag =E2=80=9CFixes=E2=80=9D?

Regards,
Markus

