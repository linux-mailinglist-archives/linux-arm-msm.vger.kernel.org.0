Return-Path: <linux-arm-msm+bounces-112115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yBwLChXmJ2pn4QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:08:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C224E65EBBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:08:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=cwoSlbi6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112115-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112115-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0CD631143D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65ACF3AF668;
	Tue,  9 Jun 2026 10:02:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04793AFB19
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:02:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780999360; cv=none; b=H5Qu4ZNNeFzOJP0/k6uZR6mnQHJSO5fEFVwW7NkIbGOKozksMy7SNJfQL3bobwRkarsEATDvLXn95Ko6cJt0tKdvDMsudS8Rui5QYRT56+MJo2qXOUHQsMYvQ/8Rxtc8OQs6txq8q6sZOp7Ptabk6ckN7c48IdzoDsU6yO+JC0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780999360; c=relaxed/simple;
	bh=gdAUuZofKnrle2BTgBTbnsod5CATJdUinz3qgrlBraY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUSygga9ZGrha9dHjnEB0RWTbL9k/m3B7AtN75aId2r2LDIBHCFQ0CeVsW7vzm2UEjdfeQRBl8frKKPnG97gByTRoPStr3vuVQ+uu9+62CH7W2XYjQ+Om0H29+bxU10KGbFZg38Vl9WPMsJgeWrTr7E82JiMsj25m9+KUnoW/6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cwoSlbi6; arc=none smtp.client-ip=209.85.208.41
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68c5eecdd56so7934542a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780999357; x=1781604157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6z/t2eDlRmRAKpgcgdbz/fpbtWYE2knoiu/ZUm5WZLo=;
        b=cwoSlbi6O1TAQue0nVfqqpsulcyQFaoA2Z9nHkkiDFG222n9xTangDpOsGtOEOKdQk
         0TrZT8uB++lWdeFw3AVxpimAVcXxtbSgjGdAo3eLcrIVr7cSkV0ArFFmUD4CC9YVRuhQ
         ocMtpDgHg1GsVpK9V3nCuhOo8J7pSrbRgtLfHJ3ai4a9fMpX2a/CESNz2CQ578jYFoen
         l1GToe3gvNycu/aD1ykqYgP118xiiqCzN7zK95Nj8lL8m963b863mRrlqcplY++2+Rek
         Amjyiij3PT1/QoKJXKzEIuQupWDORuNAdbeULZ0K0rpbcM4I5zxe4bWWjlEf4yk1IQi6
         gNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999357; x=1781604157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6z/t2eDlRmRAKpgcgdbz/fpbtWYE2knoiu/ZUm5WZLo=;
        b=VxGQuQSQtHCUq/7aEUEA5421gRFJ7cGI1w4+w2UZrVqJUG45eV8iVI9DvKsbYq54ie
         zam7bRaUPDIhqzKSesh9HquB5VOP+MOzSrIrti3Cw4sYK9ZxNF80zRuMm01eYO930a83
         Gq9KF0f0OTCtPF/7BFVKaZeTXD/zc0wGyGS634gzXFt2z7spgoR31a9hlhex9HwYodSo
         bIxqNsvOOYefq69Pjt2y9jF+bRCfVMHaaNoAqVMwKoNxVFwCvHamlrPcx3J2HyUu++km
         +mrt+su+RBQwVNCjeU8QVgOPTptGAO+ULha4femGKotAgfPXOpwa5skOlAlGSyP4BnGR
         L5yA==
X-Forwarded-Encrypted: i=1; AFNElJ+V3Kz4lJZ3lFmVg0PFj5ymLvYmwUezNud03Hp2ddHDhibtqOEp5EeNIZxtOzpSX4EdUu1D/7CdGiC6NGrv@vger.kernel.org
X-Gm-Message-State: AOJu0YxW0lnhY8/mrfyRZOKJk2zIGZ6TWG228jBpa/vvG8hev7Ve8+G5
	0UmwZ6kqspcGKRBvrRjhwSZOiFIs44JyeSuzlPi/MyM0RmgwsNOXzIq9ChTm4vVp5qc=
X-Gm-Gg: Acq92OGHfeUByexBpN+Ypyt1IxYJoiZxBdDR227tQTEPy0F6lkftNuwnlji7oRzPI6B
	XVaDZLZT6QvrBfp82Pq1RfnPevrV5VFhXAzHX+R+UqPu4jxpdIwrD7UFHG5UF+tFSGUuEwiz62/
	k+GCxwYJ4gls5xuz9e1fSztmtOgfjign2eawQbBTGbtgJpD0Hm087sgi8+b45q2pwiadehp+Dlg
	Q/dq0pfXecE2R6o8J8VMbrwfEpu7eQHfy55xhy2+nAwu6p9PA2RjAoRloujIG8y3LF27wxYyS6J
	Cie1n37WdACH6TcOjbni/OGBajaWWm28enaBg1xHfRksPlKL7/2PAUfFzSt6hyFmt/IyIYa1k6u
	/DGVmLb1tIunwp6m52GC+Y9N1ZHq8SjbGD5VQfg7+VsitRnI281JbGoIpy/UBD6/n9vk58uiluo
	yhZMseBtHP4SdxDO+r4AwYY3Dh5Lg3dIC+sLGFydthgCwhDw==
X-Received: by 2002:a05:6402:1914:b0:68f:c62d:b36e with SMTP id 4fb4d7f45d1cf-68fc62db44emr8021823a12.28.1780999356589;
        Tue, 09 Jun 2026 03:02:36 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:919a:5e38:ea48:32e9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm8461678a12.27.2026.06.09.03.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:02:36 -0700 (PDT)
Date: Tue, 9 Jun 2026 12:02:30 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Message-ID: <aifktn_s2qmg7MzI@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll>
 <87mrx4b164.fsf@bootlin.com>
 <aifKejyF7n6QsI9h@linaro.org>
 <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
 <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
 <aifX80IHM8TLQiV7@linaro.org>
 <87o6hk9i29.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6hk9i29.fsf@bootlin.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112115-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:mani@kernel.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C224E65EBBF

On Tue, Jun 09, 2026 at 11:30:54AM +0200, Miquel Raynal wrote:
> On 09/06/2026 at 11:08:03 +02, Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> 
> > On Tue, Jun 09, 2026 at 11:01:18AM +0200, Konrad Dybcio wrote:
> >> On 6/9/26 10:55 AM, Konrad Dybcio wrote:
> >> > On 6/9/26 10:10 AM, Stephan Gerhold wrote:
> >> >> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
> >> >>>>> On MDM9607, there is only a single controllable clock for the NAND
> >> >>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
> >> >>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
> >> >>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
> >> >>>>> clock ("aon") that is required by the dt-bindings. This is not really
> >> >>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
> >> >>>>> clock entry in the dt-bindings.
> >> >>>>
> >> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >> >>>
> >> >>> What is the problem in giving twice the same clock? If this is what is
> >> >>> done in the hardware routing, I do not see the reason for more
> >> >>> complexity in the binding?
> >> >>>
> >> >>
> >> >> I had that in my first draft for this series, but this would be wrong
> >> >> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
> >> >> this platform at all. I'm not sure about MDM9607 in particular (maybe
> >> >> someone from Qualcomm can confirm), but a similar platform I was looking
> >> >> into at some point actually had *3* separate clocks for QPIC in the
> >> >> hardware and none of them were called "aon" ...
> >> > 
> >> > gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
> >> > gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
> >> > from GPLLs)
> >> > gcc_qpic_system_clk (32 KHz)
> >> > 
> >> > No clock containing the substring 'aon' in its name on this platform
> >> 
> >> Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all..
> >> The NAND documentation says
> >> 
> >> CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)
> >> 
> >
> > Thanks for looking this up.
> >
> > IMO, if we want to describe the actual hardware routing, we should
> > describe all 3 clocks and assign all of them to RPM_SMD_QPIC_CLK for
> > MDM9607).
> 
> Sounds more accurate to me.
> 
> > The resulting diff would be basically the same as this patch just
> > inversed (3 clocks for MDM9607+SDX(?) and 2 clocks for the IPQ* SoCs.
> 
> Diff would not be simpler but more accurate. So if we go for a
> modification of the bindings, I would prefer that path.
> 

IMO the result wouldn't be much more accurate from the perspective of
the kernel. If we assign RPM_SMD_QPIC_CLK to all 3 clocks we would be
effectively saying "there is a single clock with a single rate that is
sourcing 'core', 'ahb' and 'system'(/'aon')". But in reality, these are
3 separate clock domains with separate rates, as shown by Konrad above.

We could try defining dummy clocks like the &nand_clk_dummy in
qcom-sdx55.dtsi, but this isn't very accurate either. Presumably, all of
these clocks are toggled by RPM_SMD_QPIC_CLK. So if we define a dummy
clock for 'ahb', then enabling that clock without also enabling the
non-dummy 'core' (RPM_SMD_QPIC_CLK) will do nothing.

At the end, the truth for the OS/kernel running on this hardware is that
it can only see the 'core' clock (with the option to change its rate).
All others are invisible, with no way to influence or check the status,
so pretending that we have separate resources for them doesn't really
make things more accurate in my opinion.

But yeah, let's leave the decision up to Krzysztof. I'm happy to change
this patch as needed as long it works at the end. :-)

Thanks,
Stephan

