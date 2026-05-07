Return-Path: <linux-arm-msm+bounces-106352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKtPCM+J/GleRAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 14:47:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D21F4E8683
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 14:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D78F3016537
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 12:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429F73F076C;
	Thu,  7 May 2026 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khRdqhCB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464E53EF64C
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158019; cv=none; b=QE41nDvVKyQCnRsy02xqeI8wC1lfB832tXHhTmkMawd1ThfG8fCVKzRDMjuZSUmusnv7M+6F9um4+VNhFb40ufqZn8Lj68cHUX/wmD9PD8kW1deaYL35orGAJevSiwrW0dJe1FS/psZuKR4fMcrbuuuSiBYLMOmI5pK7G0CfxEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158019; c=relaxed/simple;
	bh=LsNPzTYb4vC/IRp9aPkuk17mGNMZ2iBsyvpkcKxGmAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8qm3wR24WnV/XnZ1de8Hy193VpzDfwwKDp9wrXZUeMHq5UKyeJFUbuSQlWzste4vxjpDIdlpQsSvUaGfzG1gXcaTM8aWdgP3hWVTn5W4oI2FMoHOi9Zhiw7jSmUrfIHx8ucOBeu6yA1C2T7eQhIt8Z9Ydvfw4Gb9qRUhoYM68o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khRdqhCB; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-65c7efdb7d8so791810d50.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 05:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778158015; x=1778762815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iqpck66QhRsxNb0AyaQYMFfCYd0FYECyWms2Js1iBwA=;
        b=khRdqhCBafqTwjkbsQBn9aig8F1i7BnjorBwmCPfuM/v7waJLlT8fzHFSn2AsXeYM/
         vo8m6B4r0/0EcIQUHxZp8kUnmhHuQyQ0qMw9SeVtQizMsHLZDfWluPXEuGFTs/0wAyvZ
         o/o5Ngw6g7XazWVgPSvU+sMSS21k/KDmsS0V3j1wpZXpM2MCMsD5arjgtak3D2FSiqXI
         77vJXPZtC/zbZr8OSrRRlKB6IjyxocUQRoI+hRYJ2zC/2XIbXMpdXRlFst9eZVA0VmCx
         dMJhtmK8Yb0B/9o+gmFEQTKIf5nbX3i6/0F9urKmQ1NY0HzjD6WR4PC8Yxr31Su7NaAP
         msWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158015; x=1778762815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqpck66QhRsxNb0AyaQYMFfCYd0FYECyWms2Js1iBwA=;
        b=A5EHrFycTYY1ha8sr4f+C/FBwGZatzOoe3doiEUdg7s/HmxZWfu2kKuysTzB0mrtwD
         HEka97axjLTYrlflcSLsGSlVZp2Zbn4Y9ABCbLRTBk+wUf9G83ZUXn7W8dT2OgGx/U//
         dOnmqdPrRz0xKD+W9GvmxS7qQMPyvw8SqB6NsOSRoxcbzBlxpEn0atlifRTjOAWZ4Gir
         Fv3RK1vN5HsYBzU2bihertdC+z/9uj8RRZ1TWRadFvNZYHgf+A5bLJ1QxhsM2wlZMtb9
         rrZOrHziqa4RS4pc5QrKl3P2uLJ4frQ8DpSAWgwHg7POctsQDtlEO/BQVb7hoIlYBqsL
         o+1A==
X-Forwarded-Encrypted: i=1; AFNElJ/QCuk0PQpmwrzN6TuR/CBvYD+SSqCaNU1/H3vsPOj5Af5TuxBfkpm0nzY/Rua1H/iavsU9NksuU1ubnvI8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh9Wm58WihoVxpMdGZ8LAYRZ2cSPXPjSLYM2Orjd3Ay++DR6qC
	z582cl/xq3VRodLsHGQrB697aMTttIJQCeWkLF1nLFjlo5+fYYSiYJUA
X-Gm-Gg: Acq92OEGVBWBDj5phvqeg9Nr/ZvDSrY4sESOY8iCKIqBYTU9hR/lFOi7zugJuFfIE2D
	l6pTGqI7HAhLW4eFGduHRVFq8nMEWAJ3UOlYMYNJrT6qLsoDoJUidBCXXNEpVZV0tnA5aoiLH7J
	o1xqAhxKkSvIOdR9HSvo7OVuOkzmshHQJl17xxIJ5Pn78CAnYji0DYsROR1tw3RKlaZz82zVQkM
	Df4AVs6zyYR36Qks+KRtMmSFl1k5VgAtiDBjILuaumM2eSiqSaHNir9PZiI2YSM7qPVogmMPOSe
	iBO+WnqevQyTJ3K86EQH/KQ/COGK3ZVKQE/KCkek5RiKy+PsqIP+Sl4ok6xQA+oJaIZMbijKcAp
	p8CHkxzGrig4qK9QNzX3nM/sNYO29uXiuhSQtpvR/MkUx+WJphrXfrtErVX0fHqTi8Og4VcNi9W
	/aq+gzth7A3+394Gm069LfR12G5PzNuQY/BYeE
X-Received: by 2002:a05:690e:d05:b0:64c:9f31:e33 with SMTP id 956f58d0204a3-65c79a23920mr7669550d50.65.1778158014778;
        Thu, 07 May 2026 05:46:54 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65c7abf5e11sm2468850d50.0.2026.05.07.05.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:46:54 -0700 (PDT)
Message-ID: <18998766-62fe-4a5e-95d8-1bfae712d8fb@gmail.com>
Date: Thu, 7 May 2026 15:46:48 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
 <f5TsKnC12rLsH63vAi01aN4oXUFLrfgIhn14IQFDb9gcac6anLzzhJdkGNdQ2dRs4vYbFKUptfEgWuKdgIgGsQ==@protonmail.internalid>
 <20260507-msm8939-venus-rfc-v5-5-d7b5ea2ce591@gmail.com>
 <17c4626e-8926-4cad-842d-a1b171d1e962@kernel.org>
 <CYaHtccGOWlaUtl3QIKva44ybJiRHsPOZmHEkl2KKGmnDxJ8vTH-SVNMGbL7bjkYjI692nplORzOhpfjs3XJfg==@protonmail.internalid>
 <4f1ab5b8-3bfe-43a6-8b91-317456188544@gmail.com>
 <7df3bff7-b872-4b20-8e7c-698157a41f33@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <7df3bff7-b872-4b20-8e7c-698157a41f33@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8D21F4E8683
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106352-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

> Try:
> 
> v4l2-ctl --verbose --set-fmt-video-
> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
> video=pixelformat=H264 --stream-mmap --stream-out-mmap --stream-from=/
> media/cyclists_1280x720_92frames.yuv --stream-to=/tmp/
> cyclists_1280x720_92frames.h264 -d /dev/video1
> 
> v4l2-ctl --verbose --set-fmt-video-
> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
> video=pixelformat=HEVC --stream-mmap --stream-out-mmap --stream-from=/
> media/cyclists_1280x720_92frames.yuv --stream-to=/tmp/
> cyclists_1280x720_92frames.hevc -d /dev/video1
> 
Sorry, but I couldn't find the file you were referring to. Do you happen
to have a link where I could download it? Thank you in advance.
> ---
> bod


