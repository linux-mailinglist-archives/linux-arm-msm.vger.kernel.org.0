Return-Path: <linux-arm-msm+bounces-20166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4418CB4C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 22:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4E962823E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 20:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9630F53816;
	Tue, 21 May 2024 20:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="B12jAF1u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B59D208D0;
	Tue, 21 May 2024 20:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716323734; cv=none; b=GKP/TM5uD4KERMyBXswY3Dx0f8rffmXFgoTqSjZyiaq2Iv+jpJHn00O9a0Szp8IupgL4AZa3aVLFc9xgeo2wSRy/tXAo7vLm3m3jX3PKzFjEFK+zwOYoNPBivd+3tMftuGGntPRxmojWEKiWtSsFUeYvgxeakJLmMl8aKl8v5is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716323734; c=relaxed/simple;
	bh=VD0WPH4YtO8joXqpqEu3C3HFCEbCEhDdVQcK/6wzdIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GVX5f8Ub35AL5rbgNVwM24YRvo+pCeOifjl2fNVreoIg6lHSz2bRoy7irjDrZgoBa9ii3QCsimuZ45buWhKbJVjfaGn6tNR1/tzY/6Lq6TrBpczK1TceJ5zOCQd7OqWFlAuKj/b/9idQ5IWkQthdEbNDpbUuWFVhQkUp4ZR+mJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz; spf=pass smtp.mailfrom=z3ntu.xyz; dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b=B12jAF1u; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1716323725; bh=VD0WPH4YtO8joXqpqEu3C3HFCEbCEhDdVQcK/6wzdIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B12jAF1udb/kmzGgJ0dTaa5Ev3EAM6BJ3vy/kgHmqQrHRP0KU74Z0MeQakzQNvu8L
	 lsjUzX5MV2KvuJQhLcl52TA2D68ncTsb7iB8rk0SqQ5nZSWdLaxUUxr1gchQZtGkVA
	 J5CiVF/G/2wWGETx1CEm0wsgdYNEBjFPH1KBU95Q=
From: Luca Weiss <luca@z3ntu.xyz>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH RFC 1/2] dt-bindings: soc: qcom,smsm: Allow specifying mboxes
 instead of qcom,ipc
Date: Tue, 21 May 2024 22:35:22 +0200
Message-ID: <5780452.DvuYhMxLoT@g550jk>
In-Reply-To: <06565532-987a-465a-b2ab-a03fce7279e1@kernel.org>
References:
 <20240424-smsm-mbox-v1-0-555f3f442841@z3ntu.xyz> <12437992.O9o76ZdvQC@g550jk>
 <06565532-987a-465a-b2ab-a03fce7279e1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Dienstag, 21. Mai 2024 10:58:07 MESZ Krzysztof Kozlowski wrote:
> On 20/05/2024 17:11, Luca Weiss wrote:
> > Hi Krzysztof
> > 
> > Ack, sounds good.
> > 
> > Maybe also from you, any opinion between these two binding styles?
> > 
> > So first using index of mboxes for the numbering, where for the known
> > usages the first element (and sometimes the 3rd - ipc-2) are empty <>.
> > 
> > The second variant is using mbox-names to get the correct channel-mbox
> > mapping.
> > 
> > -               qcom,ipc-1 = <&apcs 8 13>;
> > -               qcom,ipc-2 = <&apcs 8 9>;
> > -               qcom,ipc-3 = <&apcs 8 19>;
> > +               mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
> > 
> > vs.
> > 
> > -               qcom,ipc-1 = <&apcs 8 13>;
> > -               qcom,ipc-2 = <&apcs 8 9>;
> > -               qcom,ipc-3 = <&apcs 8 19>;
> > +               mboxes = <&apcs 13>, <&apcs 9>, <&apcs 19>;
> > +               mbox-names = "ipc-1", "ipc-2", "ipc-3";
> 
> Sorry, don't get, ipc-1 is the first mailbox, so why would there be <0>
> in first case?

Actually not, ipc-0 would be permissible by the driver, used for the 0th host

e.g. from:

	/* Iterate over all hosts to check whom wants a kick */
	for (host = 0; host < smsm->num_hosts; host++) {
		hostp = &smsm->hosts[host];

Even though no mailbox is specified in any upstream dts for this 0th host I
didn't want the bindings to restrict that, that's why in the first example
there's an empty element (<0>) for the 0th smsm host

> Anyway, the question is if you need to know that some
> mailbox is missing. But then it is weird to name them "ipc-1" etc.

In either case we'd just query the mbox (either by name or index) and then
see if it's there? Not quite sure I understand the sentence..
Pretty sure either binding would work the same way.

Regards
Luca

> 
> Best regards,
> Krzysztof
> 
> 





