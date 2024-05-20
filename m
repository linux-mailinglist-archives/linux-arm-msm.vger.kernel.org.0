Return-Path: <linux-arm-msm+bounces-20072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCF58C9F65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 17:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53106B219D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 15:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D896E136E3C;
	Mon, 20 May 2024 15:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="iG0uswZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C255A136E21;
	Mon, 20 May 2024 15:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716217931; cv=none; b=j6TjjyBeSyK9nW0uo3+aTbfWfaLNyuL46Ac3dizsPX3c8/6WG4MJEreyECh3rWtBcYHPtarjCgweTevHHOgglJWDPYEH4T5+3tmE+gs9pR/EfoqzCtJzU6BKWhCZV9uaqrUBmkhxcptoCJGz1FSzXorkqEWlAwfRnGOLrByDxUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716217931; c=relaxed/simple;
	bh=l4YKr8q4hSlSYnlmC8is7kKyo1psXqGg1nzwO8qkXlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gAgz7XRGza/827sOaMKyoSsE4vSJ8P2j0LPET9S7SufeD9TNlu1U5Q/yJ5PDMJZsdPM+ozq+jcp48W9dNZ+QNxoSYvruHVadx6O2sxIepTP05HG0BMUXNVddc8hHTglSH3j5tnE0YZfaX9LiHDqd+wf3t/ocnoGq1bWNIJZl0zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz; spf=pass smtp.mailfrom=z3ntu.xyz; dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b=iG0uswZ8; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1716217922; bh=l4YKr8q4hSlSYnlmC8is7kKyo1psXqGg1nzwO8qkXlE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iG0uswZ88y5tt8RR8Ak5aackUNDyrnZ25F5WfiBekmPKoJem+rMN4eLLQfnwcRz15
	 DZDAKMBRaYH08cm32uki5G5LIx2r2UNnI7utFn9a9zKML5Hp2DqVRRnZG+cMWs/WE1
	 aKV0IBzQ8gTcR2Y6rhwj2nQXmsL0lFC3+EC34kH4=
From: Luca Weiss <luca@z3ntu.xyz>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH RFC 1/2] dt-bindings: soc: qcom,smsm: Allow specifying mboxes
 instead of qcom,ipc
Date: Mon, 20 May 2024 17:11:59 +0200
Message-ID: <12437992.O9o76ZdvQC@g550jk>
In-Reply-To: <1ab150cd-68f0-4153-8d4e-5bd30bb01dfe@linaro.org>
References:
 <20240424-smsm-mbox-v1-0-555f3f442841@z3ntu.xyz> <2729475.mvXUDI8C0e@g550jk>
 <1ab150cd-68f0-4153-8d4e-5bd30bb01dfe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Montag, 20. Mai 2024 08:46:39 MESZ Krzysztof Kozlowski wrote:
> On 15/05/2024 17:06, Luca Weiss wrote:
> > Hi Rob,
> > 
> > Any feedback on the below topic?
> 
> Can be explained in description, like
> mboxes:
>   description: Each entry corresponds to one remote processor
>   maxItems: 5

Hi Krzysztof

Ack, sounds good.

Maybe also from you, any opinion between these two binding styles?

So first using index of mboxes for the numbering, where for the known
usages the first element (and sometimes the 3rd - ipc-2) are empty <>.

The second variant is using mbox-names to get the correct channel-mbox
mapping.

-               qcom,ipc-1 = <&apcs 8 13>;
-               qcom,ipc-2 = <&apcs 8 9>;
-               qcom,ipc-3 = <&apcs 8 19>;
+               mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;

vs.

-               qcom,ipc-1 = <&apcs 8 13>;
-               qcom,ipc-2 = <&apcs 8 9>;
-               qcom,ipc-3 = <&apcs 8 19>;
+               mboxes = <&apcs 13>, <&apcs 9>, <&apcs 19>;
+               mbox-names = "ipc-1", "ipc-2", "ipc-3";

Regards
Luca

> 
> Best regards,
> Krzysztof
> 
> 





