Return-Path: <linux-arm-msm+bounces-112674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0f4jFMp9KmpKrAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:20:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A703670575
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:20:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=dBxSmj7C;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112674-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112674-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABC593239223
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA792E737F;
	Thu, 11 Jun 2026 09:14:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F2D374E7D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:14:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169254; cv=none; b=YToyzDuhwDnzcnPZZ0vOgfZjY5ZrUgDyWLXpw7CJxuwVO3Bjlufg+On04Exe2V74cz48WMHZtXV8KB0Kbm/bHVZOa4h8USmEdvzxRT2znK2X8b8iwjIUYH/K4tb5baZkHGLjZcqldgRhXwGp4W7vHSZGQ6JmgScRgARekmEpgCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169254; c=relaxed/simple;
	bh=4CqiEOKp7G7+G9FT5Fh+bQy6KqYzvJWqGt8d9d7QZFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIDH2T7SCaceN3l4XPX+BVuh1G6rA7fdDSeXIW4FQVKSVo8vdkqS2w/YsOrBBfPqL39+DT+1gU3T2Jw0UiooM3yP0TmUkR7sic19x4YyyE+uEUVGe6W+/N/QKQ4buwc/rn1bCtYDsaHFkYMoq1r+ntUVrdXZHZaa83XQg15BKwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dBxSmj7C; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so67195625e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781169251; x=1781774051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M3d4LMOrRVe9Dpt71iC63qNlgFeEkSybcIKSVZrkmmg=;
        b=dBxSmj7CXI3Ht3IxAZVlELaMcu1PiEN98SwB7gMz2blQqTs2Rn+CTsVRy86A7Hnv1m
         rF+dJYkWvla6LkuQxSkXgMC9EoW5h8Vu6BXgtIa+SLAyR2EyXNn6KbMj3cJMyy3lPbLG
         iaKxxSl7ZdmqlB/e1iTfiUuhqGS59eymwvq1tIrM8iU6LhaUxMFZab1fQwaNo8rIKTZV
         mfdGrcRzWQFVRRpli/5tcZlTH7mlncfEVoW/XEe+P95ovpq72rdPjhi4Tp6SYdAQQl0X
         wJMkdbOBdiOI+kwWa9QbIV092VqZcCCcoJMDOBcMNJdfmQN7k9qnUN0+Aq0VV6/FemKF
         Y/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169251; x=1781774051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3d4LMOrRVe9Dpt71iC63qNlgFeEkSybcIKSVZrkmmg=;
        b=f0dDRkwc/uUAap2Rv580o6Ii/jM6PMDiWq79bJI1dntKUKcwH0iKvUEaZl9p0GSCR/
         PJOsm1gozT9eLTBUOzMgTWV64uQkA+oJunYTM3Ne1VdrwpAY1AlcKTwBh7VCmXn92W3S
         fW1BNMt7srfurcxh1/ePjcjG8RRFfUexfon5uNPl86oH0tAFJB+99mZCzgkrGNKSn4jZ
         ZsgHEU3UNVoq+CA89rzWxa/BxtYj9JwkUSireGdY2L7ohkSlcHnBersn5kB6qjFv/zwC
         m9PflSgX6Uej9CnL5INqHnIBwdTJIzuLs+ie17uO74LALy4nbp9K9f/7G/9e4+1wqWZH
         ztyg==
X-Forwarded-Encrypted: i=1; AFNElJ8Y5UxHNXiTbCZ6IxtzSkZL7ljN/ENuL3d72viV+NOA620Psz2qSiGBeRVQ5bPY3SfxVdKTaaIywXsM6L+f@vger.kernel.org
X-Gm-Message-State: AOJu0Yws2yblCk/7hM+TYt2Nhr83HLCzw3BI6pFTrRc3yIG+WFv+rVzB
	JUK+acYxGVCS1OUOJwCpYAuH/lYeoxzL7OXK+GD47syS1dG9FD0e4UgK+m1z2pdNfn8=
X-Gm-Gg: Acq92OFdKuJlxXqJPEPkZ9MD47ho/M9X7PtSZeeTCehen4a4BA8/3vplyg8TV1T9HcG
	0mBa4ukmyoiO6axTZiHMQgbhDyIXhIoyFS19YYAbRa9XijlgV+Tyy612Rgme3yGbue/X0OU3Ts4
	iGPDuhoBRdZYp2lark6z2PRwdO0dmJpgeEYO4TxD/uAR8tz6WUNBCPpSxX63FXFXLB5JqlbWzZB
	2OgD5vd6N1N/+LBKwg+IidG/HZpRU2MrhY3YTGgi8Mx/3QnBGTWmK3C7UMKpyRKzhhIxL3LINTd
	BVmChhOr5HoPLOpObS6xypHHkE0vJAnNykjmpkCWSCrDGxhL4sP28YpoT1wHLMH/jozuB4EjxsH
	PFT3tl0ZdKU3Ctx3IbqZZMURNzWZ4TWRRnhe2WY1Oay49ud+fUrRzt6F2v2tN81LwwTNxm1UyK5
	afaiLaklc0jGyqNgGU7cW19K0J4ltMxTMU5jf6CrySRuyqzg==
X-Received: by 2002:a05:600c:3550:b0:490:e5c1:b897 with SMTP id 5b1f17b1804b1-490e5d0fe68mr19389845e9.20.1781169251573;
        Thu, 11 Jun 2026 02:14:11 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:7bb1:6476:9114:cf39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2cf5537sm59201665e9.9.2026.06.11.02.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:14:11 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:14:06 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
Message-ID: <aip8XtKoS2xTYv4L@linaro.org>
References: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
 <aip3_fyE8tMtJZIW@linaro.org>
 <61fea0fa-d7af-47f4-a3c7-21d881090008@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61fea0fa-d7af-47f4-a3c7-21d881090008@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112674-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A703670575

On Thu, Jun 11, 2026 at 11:10:51AM +0200, Konrad Dybcio wrote:
> On 6/11/26 10:55 AM, Stephan Gerhold wrote:
> > On Thu, Jun 11, 2026 at 02:11:59PM +0530, Vishnu Santhosh wrote:
> >> Add required nodes to enable the upstream BAM-DMUX WWAN driver on
> >> Qualcomm Shikra SoC.
> >>
> >> The SMSM (Shared Memory State Machine) node provides the power
> >> control signaling between the AP and modem for BAM-DMUX. The
> >> BAM DMA controller node describes the A2 modem BAM hardware as a
> >> standard DMA controller. The BAM-DMUX node references the DMA
> >> channels and the pc/pc-ack interrupt lines from the modem SMSM
> >> entry for power control signaling.
> >>
> >> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > 
> > I'm quite surprised to see this 15+ years(?) old hardware block being
> > brought back to a new SoC. Is Shikra not using IPA?
> 
> That's correct.
> 

Ok, thanks for the confirmation. It's nice to see my driver running on
some new SoCs 6 years later. :-)

Thanks,
Stephan

