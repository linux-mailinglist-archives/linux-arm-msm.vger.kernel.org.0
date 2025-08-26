Return-Path: <linux-arm-msm+bounces-70915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC5AB36DE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 17:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3032D1BA7C83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 15:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804692C15AA;
	Tue, 26 Aug 2025 15:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="IkWF9ixR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C912D2836F;
	Tue, 26 Aug 2025 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222548; cv=none; b=KCN0rFdxA3+5uNTE/ZWi3iELViMbYQfQMiCPhvdw101Spf6JvIoEgalcHXsXGn+PJYphNMHqJhShAm/2CzXiHpbn1LBjF/y/bMuotmYHBx1mzq54xU0IMqsNfS80RLTUcKrBwOpzh1KdhSTdJFZEaUdaUEBYSSrOipiQ4AhDrXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222548; c=relaxed/simple;
	bh=f88hYMbOPO9YSyz9JVbL/p//nYytGhwJ7ItIbvmi6/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ee/CZBh8fEdgIh96B3Xv0oVcKHakNXOxPG4JThRH8UHbYOSOGgDwPwOZwf9LwwaX6YoJ8G9B2mK5D61j4bKTyB1FAsVnnlZ/Dy5rU1iLuv+xdtR1+YJ91dPvD9jkGqo1J+xCo2DbJE3/JiQVGQn5ikiJ53WlOX0t1UvKkrT6gkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=IkWF9ixR; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cBBZN2xH4zm0yQ3;
	Tue, 26 Aug 2025 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1756222538; x=1758814539; bh=KhWu8WPAL8IZTbRc/JYSRPN8
	bpRcq5ZXKJ91VWU88Nc=; b=IkWF9ixRxAURcNRFU7ToaO6QTrCrF31SChHvwphS
	SOJYoKpdBhi2mkmuNeKNaPpoCTeetzIdwf8tOHmccEe/j9z9z5IaRBdy+BfSx3Ef
	qGilbufWyqvifPKaGo8sHaHx8A7vgeGiP2iq3eXiohjsPoLfyIqlMj3dU7V2WmN4
	O7AgG/TNBVI8ldc/qaaGsCmjcXBnTuCzHY/F5Kpfqzi2UkzMo3jU6+Dd1lc8+Imh
	eFf8UvG+BTpvLG02uvpjGOCneGzs0LNggOR/wkLKD2XHG+gKpPBUbwV8sYHRjqDF
	sYxLeEfgU+M6AgSqPSoEhV+r+gQaaabIjDW8I5mp5zMeGQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id GUQJ2cEdHezR; Tue, 26 Aug 2025 15:35:38 +0000 (UTC)
Received: from [172.20.6.188] (unknown [208.98.210.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cBBZ32gYrzm174H;
	Tue, 26 Aug 2025 15:35:22 +0000 (UTC)
Message-ID: <9944c595-da68-43c0-8364-6a8665a0fc3f@acm.org>
Date: Tue, 26 Aug 2025 08:35:15 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/4] ufs: dt-bindings: Document gear and rate limit
 properties
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mani@kernel.org, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
 <20250826150855.7725-2-quic_rdwivedi@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250826150855.7725-2-quic_rdwivedi@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/25 8:08 AM, Ram Kumar Dwivedi wrote:
> +  limit-hs-gear:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 5
> +    default: 5
> +    description:
> +      Restricts the maximum HS gear used in both TX and RX directions,
> +      typically for hardware or power constraints in automotive use cases.

The UFSHCI 5.0 spec will add gear 6 soon. So why to restrict the maximum
gear to 5?

> +  limit-rate:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2]
> +    default: 2
> +    description:
> +      Restricts the UFS controller to Rate A (1) or Rate B (2) for both
> +      TX and RX directions, often required in automotive environments due
> +      to hardware limitations.

As far as I know no numeric values are associated with these rates in
the UFSHCI 4.1 standard nor in any of the previous versions of this
standard. Does the .yaml syntax support something like "enum: [A, B]"?

Thanks,

Bart.

