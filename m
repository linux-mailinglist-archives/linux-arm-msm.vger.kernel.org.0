Return-Path: <linux-arm-msm+bounces-75339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E59A7BA4EE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 20:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 870F0386758
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 18:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F7030CDB5;
	Fri, 26 Sep 2025 18:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="hYv9sEvs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD434C81;
	Fri, 26 Sep 2025 18:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758912934; cv=none; b=lU0h2+s7HRpB5hVNWXXVLzogNH9ru2r2sjT8QBrLqRMucqIVk4qXa0+uYKIS3hpPE5zyomqnT33rwsy93oukQSk3RM8iMwj6Du1Y+cq6AjEW97JafFradk4dducSqT4u8R4/+WCkt/6yIz8CKgeEFshet/qGI0lJ1nbJII2pWbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758912934; c=relaxed/simple;
	bh=XwSnQpi2ylPWKXCjiSnMWXDwprpL3+irBEMLfWkHX18=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=O3Dhljp8s2Hxa+kUpa7Ek9wDOjA2embesCLB2xf+alDNE6uIy+yMAgVlHu+vCcottfSZgWXYFABRenX3Dq9xPIEF13dsVdG5PWHtrgN7NEkHuHhd0IwOtrRWiROk+MHNAywsDMbyLs/fl3d/3bE4F2l9RWLiMJJWu/6Ynf2HjMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=hYv9sEvs; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758912930; x=1759517730; i=markus.elfring@web.de;
	bh=XwSnQpi2ylPWKXCjiSnMWXDwprpL3+irBEMLfWkHX18=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hYv9sEvsMLw6Gkt2hSv1QzLgANFO3CKzAOKKfJCUe39IHXq33FTusZL8mKFDhd+f
	 N5FH+OosBhJH6wCRBzeaQFZJNrtMVR0zBRAF9coSISB6fK0SpsNS5zUOc+2g2mgGo
	 /nrHaOjFKXREBhnfA3Cwa+90LtOhfMgxhss/OUWNLWvr+8Q+E8pYmPlM1MTtbq7rQ
	 CuST7vYPnUQQA/c8h8G2vpVPAwGwzuQZSkYYUxk/8roderAccmNBppXMAx0yElCYU
	 ilnpET/clRnX2Ea5rtbXiIlpxMhHfT+iWWEJ4cnCjKzqNqOi/fXnryGtWDwGRerVf
	 rBdjUtVxK9T0z8Y8CA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.192]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M604f-1uzlpi4C0B-00CB4M; Fri, 26
 Sep 2025 20:55:30 +0200
Message-ID: <7a601c2e-7627-42ea-8d28-eeaf7c527404@web.de>
Date: Fri, 26 Sep 2025 20:55:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org,
 Anjelique Melendez <quic_amelende@quicinc.com>
References: <20250926143511.6715-3-johan@kernel.org>
Subject: Re: [PATCH 2/2] soc: qcom: pbs: fix device leak on lookup
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250926143511.6715-3-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gN8HqBFDsZ1s8f/LbMmsrU53uTeFQI+7Oiv6IOsNnC9Zolw1oqa
 ujN8RS1hask4GCHRcPKZsWgaSAsSrFOuysqp7TiJAKOauaBxSb8J+D6KJcz2otRgjfySSU6
 oI28b6DAARFw5TDA4DGexs2qTx2RGp/1rosgOW3xxTTGdUdMZsFW8OcRQ7ofkGdGQoJY4c+
 4HnaoHkOvixSiMGY1ls6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mK8RJvQPlR4=;pRH1VrxNAsH2dEv7IMAwH2Wr0AP
 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

> Make sure to drop the reference taken to the pbs platform device when
> looking up its driver data.
=E2=80=A6

How do you think about to increase the application of scope-based resource=
 management?

Is there a need to improve the API description for platform_device_put()?
https://elixir.bootlin.com/linux/v6.17-rc7/source/drivers/base/platform.c#=
L543-L547

Regards,
Markus

