Return-Path: <linux-arm-msm+bounces-57849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 377B7AB6E3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 16:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A4957A6B12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 14:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8BB17A2ED;
	Wed, 14 May 2025 14:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Xq6TwNBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FAA149C4D;
	Wed, 14 May 2025 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747233538; cv=none; b=B6rG5K3E9AjgaLoqIehnimLdqpn/xmFl4VD37agi1sxUhToUzoiktH9XYh3F+mji2aApGyeAX7jk6Vz4YUxPxN7Cs/PXcZptssMg42rJYVQZui9+7mGKBX+OC6rDvevxDAp4h1JaJDTvGc9PCdFWfQGi8oXMYy5RfHkKNfcdBuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747233538; c=relaxed/simple;
	bh=Gcj5nd9FKHE5cWwXkk4NEvyBItenXrqDWNZrSF1XmE8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=cLJ7jIFi3Lo5qZTR7V6bAKMj4h03rJTATVfw0Mj8kghMe1+NRSYdsr35B/aMOT50wgcEPilWhFp9VvkrcE5gnwvqVQ6ADxXoxzEefr5nmmEDFeztrOjoXh+LzZXMmmALjXYe6v4Oh+EBdgFeHVZLaDIrCWx8jzF1QFE8XXcxJBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Xq6TwNBa; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1747233085; bh=Gcj5nd9FKHE5cWwXkk4NEvyBItenXrqDWNZrSF1XmE8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Xq6TwNBabd44lFs7H9hpcoAP3rrASWp5S/QzAT8JaEA+NYJMgDo3zyHOG63vfh1ZP
	 rUxXUn75tginS46bGlHBNU3fe6Bp45qnObhDeqn/2pUOOfSJy18R371QoZ9Ukrk+cM
	 jS+T/0Q5LbUaJrDIg3l51w9FMnYz4mCZ/IsP4ezk=
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 14 May 2025 15:31:25 +0100
From: Luca Weiss <luca@lucaweiss.eu>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, Neil
 Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: display: panel: Add Himax HX83112B
In-Reply-To: <20250226-speedy-dark-mushroom-5d7c4b@krzk-bin>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
 <20250225-fp3-display-v2-2-0b1f05915fae@lucaweiss.eu>
 <20250226-speedy-dark-mushroom-5d7c4b@krzk-bin>
Message-ID: <932d5cc223f8d1ff1bb09c68990e4a82@lucaweiss.eu>
X-Sender: luca@lucaweiss.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 2025-02-26 07:46, Krzysztof Kozlowski wrote:
> On Tue, Feb 25, 2025 at 10:14:30PM +0100, Luca Weiss wrote:
>> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
>> Describe it and the Fairphone 3 panel (98-03057-6598B-I) from DJN 
>> using
>> it.
>> 
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>  .../bindings/display/panel/himax,hx83112b.yaml     | 75 
>> ++++++++++++++++++++++
>>  1 file changed, 75 insertions(+)
>> 
> 
> Discussion is still going. Sending v2 after two days is hiding that
> previous talk, so that makes me sad.
> 
> I am still at v1 and I am not going to review this one here.

Apart from [0] there was also no other activity in v1, could you take 
another look now?

[0] 
https://lore.kernel.org/linux-arm-msm/emwpl2e7zpzkm4uea22g4hayz66nk7nxylinsd2stuwlatwdc3@ixkbc2bxbz4p/

Regards
Luca

> 
> Best regards,
> Krzysztof

