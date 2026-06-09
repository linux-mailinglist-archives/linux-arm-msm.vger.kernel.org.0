Return-Path: <linux-arm-msm+bounces-112239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sil0OEJFKGqHBQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:54:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA1D662A63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:54:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=imd-tec.com header.s=google header.b=Icy5pZrd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112239-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112239-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=imd-tec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CC933028355
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BCD23B0AC4;
	Tue,  9 Jun 2026 16:21:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DE23B6BFD
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:21:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022108; cv=none; b=txJ7Vixu8xE2H7XPlRn47610yXpTBOly9Hdy7SQU2iKrGA467j9t4AE+fHux2y3tq91tg/daSPLzrg1G2DX9SzY2eutC+3rFxDwZCWWt8Tkaec8j4/zaMcI/rOlY6ONxw7hMSV+jDBGf95M91WQYxtYusl+IOVzRNaJsL+OnqaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022108; c=relaxed/simple;
	bh=RnYQKTgC5c+dI+AGzkNnXBzaTBP8CgdPH0WnnTKMiA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNBGay4BKYzlhruyeKMCAHHjx+TH+8LTm48H9aZ/1pgSDImwk+IbqdJy4q4sXwWFngy5wv+8pONV6XUMHPpB0tt6oiNFnth9wy8g4bk5DbYhlORQ2oYrFMIrVOm+VEDhitEm3h0fltXjvMvaQkKcrcaKnfS2DA69WTz5fyXGA/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=Icy5pZrd; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b3637b90so49795745e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1781022105; x=1781626905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vaGdByy1y9YOgpYVm9cgbblxYGkAi93ghJNskc40SB4=;
        b=Icy5pZrdXPsbjeHSfsECszAJA32UjM4dgISKqf1hbvskOHszMtAIThKpYVc5mZgbI8
         lvRiUr1AP/2IvQw0Axqg+d9bhvg5GDrCqfKgjzHcJrnxa2r92hg32sslGnRrIDD2RvtI
         xfEg4H9pWIts/ETfLBMk+esQKzREMJLlCdmYugKlyZyMlh3OpwJcutxlzra1lNP0opQ+
         GchOcpMp08rz0+yGmNcaTYN8ZAVNg7q8cOA3jFNkYsaDg32H8rtMJ+pmvb1gb3wI4X8i
         +sOQYwLc4mcvICk3W7CgW/vuze9LjzpnvBMFAuDu9Djaa2QCYifrltJpei6Fms95aTFw
         42eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022105; x=1781626905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaGdByy1y9YOgpYVm9cgbblxYGkAi93ghJNskc40SB4=;
        b=iuQw6NYRoWPQcHMe96nwEdndYhlE0twkx5vwHhzCNrNnLupCd7m5X5fACypF8iQqb2
         8VmzRF5z/WoXy/w6GLjuN4l1R2vFlVsskdqLpJTD7EU50pJn0y46YCx2iqDigxYnpgoQ
         tzKCJkAm6xpseb65C2k/R4GxkX7gWhwN0TbtCd2nOCHqizO2iUqgfoBW+V2c0ywl/GqY
         rzYaVRYYD3zMNcTtFbPuwtN4Hu9jVkNFgSef9/o7hGp0BUJP0715DkUAGFC86n7ayED+
         x2O35984nAeJzZbo4MZklgaRIt7QmBrr11FJIOAi9iVm+yyUBd/A90g9wl05PtmcGv8f
         gvgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XR1/PtLukfVFpwdOVlmBRWsMnobiCIXWSjWDbEGT//3nn8ChwJHGS3U69gzItfRXFw1s0cGJCgcBkjTMV@vger.kernel.org
X-Gm-Message-State: AOJu0YxWD7x1R6aBstvTqCQSnHZxo2oIwDKFrNyZyTaHJYSbrDbNH+J2
	PwMo4wM75jCYvYkluTjpKFu7tiXr2JTph8AqBPsT0wqwxCiMBLWjbwlL0BRvk21STlQ=
X-Gm-Gg: Acq92OFGz5FZnTtoeC3MkAeDYI0j3+brU3U5MQ1+o25eRwPkBq5fwRjZPZ8wWbcPtRj
	l9buHWsU4dV06waCiD/gLql3hvZ9hbrQ4dgV5frpua9TxI00CxcpW5lFiqvOEfhdY5Jtzeu1SZ6
	/vrA2iJZUyBVhuWo3ZfdF3blOEZCGFjqHoVcMXKgoBIYRsjzox+1TfAn471bxqwwkKFxqBzVDnd
	iLQAxGO4S1ONKqaO90hVD5864EmHc6Ie6ksmRCUyB2D/iFkyIjk65L2T9dE/QM2Y/iMgnFZQ62s
	1O0u3Dbxo2th7Hiygg5yGxchjtVpW8dzwUQKgHo6UTv1oXeqEnqxaseCO6Ff3fazh/HB6Z+QdEq
	udtHvPTWVDeaPuf7yKPSvl9hiSIECFMN5bPJoKlI0adUuIxFNMQWXWJx9MW6gI9zz0CkQKabCGY
	kT5PoNbZwljYxvOhmaeoUjuEtQpUsf3UkKXy5tSkdJY7JFI2nbWFkG2q7Hgn5uu7QKVm5R/ZIeJ
	vu/Iv8WCRCqwPRe/G38WH6iT7TtZsrmJo8Z1CkoWZBmjhwfJOB0Nm0wte95QuCg
X-Received: by 2002:a05:600c:314b:b0:490:bfae:55cb with SMTP id 5b1f17b1804b1-490c25f5df4mr318368755e9.21.1781022104869;
        Tue, 09 Jun 2026 09:21:44 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([2a00:23c6:2736:8e01:f35a:3fa0:85d5:c620])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcde3sm65162418f8f.1.2026.06.09.09.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:21:44 -0700 (PDT)
Date: Tue, 9 Jun 2026 17:21:42 +0100
From: William Bright <william.bright@imd-tec.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ram Boukobza <ram@imd-tec.com>,
	Tendai Makumire <tendai.makumire@imd-tec.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
Message-ID: <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112239-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ram@imd-tec.com,m:tendai.makumire@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,will-Legion-Slim-5-16APH8:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FA1D662A63

On Thu, Jun 04, 2026 at 07:01:22PM +0300, Vladimir Zapolskiy wrote:
> 
> How do you know that these modes are broken in hardware and not
> caused by something else?
> 
> It was stated before, but it was proven to be invalid as the statement.
> 
Thanks Vladimir for your feedback.

I copied this statement from when these modes were also masked out on
sdhc_2. I see that there was progress since then and the caps mask has
been dropped so I agree that I shouldn't have this comment that these
modes are broken due to hardware.

I have tested this patch after rebasing onto the latest tree with the
recent changes that allowed for the caps mask to be dropped for sdhc_2
and I still see dll tuning failing. To progress, I need some guidance
from qcom as to what dll-config value should be used as I am uncertain
about this. I noticed that ftbl_gcc_sdcc4_apps_clk_src only goes up to
75MHz so perhaps this needs modifying for DLL-tuning to pass and maybe
there needs to be schematic/routing guidance that needs to be strictly
followed as-well besides the usual 50 ohm impedance rules?
> > - Forbid SDR104/SDR50 via sdhci-caps-mask, matching the previously
> >    existing sdhc_2 workaround in the same file.
> >    The SDHCI capabilities register on this SoC advertises SDR50/SDR104
> >    modes that are broken on sdhc_4; without masking them the MMC
> >    core selects SDR50 and fails DLL tuning with
> >    -ETIMEDOUT during SDIO card initialisation.
> 
> Which one SDIO card do you test?
> 
My apologies, I made a mistake in the cover letter, I wasn't testing with
an SDIO card, I was testing with an NXP IW416 which is hard-wired to
sdhc_4. 

Best regards,

Will

