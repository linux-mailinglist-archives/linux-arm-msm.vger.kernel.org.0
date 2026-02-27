Return-Path: <linux-arm-msm+bounces-94480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LlWFA68oWlhwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:45:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FE71BA2A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87949314EFCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126F343DA5C;
	Fri, 27 Feb 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o4zSXWb5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B8322B6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206943; cv=none; b=dnRfHz9iw0Z8BayMubJ+7CmnLF5kWcIn8vRvw5xe0P2pK/PjlwQEEA382nf1PWG1FI982+acSZegX3PjmGXZU4TlLkO0TQLWUNErdW6Uv8P3nNOKpLCqmbn60Qcp2CAX+Q0QW1GB9dDDNlsaAjEwLBiITApxMqNuvTKxlMcN0JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206943; c=relaxed/simple;
	bh=xHYW3p+5GVfDn8x6oFMyWCK6CrLKRkNsDbg87Yl2z8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aIKrzu2CgJW4MIzvkum40b2LXRRk8l5Y4La3daSh5NerDRdAOyO2ylpxKhOvEflEhKFbGikRcGBdIpYAL0sQUcpimXRIuzUpaHlVHv48ncrPQMHblkkh11KOqGcsdA2sw4SfZtaoLOLkMmgWlDILFrZX9lNWdtvqaV0O5Y5IlVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o4zSXWb5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48374014a77so25282115e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 07:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772206941; x=1772811741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wzqme1k+Wy+/3yspGSINYIH3f7UH5wA3CsIMcq2UIg=;
        b=o4zSXWb5oeEIvPb4mrMDF6IKH/xoKT74sKzJM0PTHy2wGFz3fFja40UDgCZtZf+ZTP
         lRSI79c0+6QQcEquu8o+F05cYoM/tAVGEQhAvvTMWHKos/fAjoxX7E+c7NQRKiapMS2/
         dc0X1cNUof8Voy9tbrrarcEKxx3+icaDKouZi8INrbOs3Oo6GqXmBq5DbSAqgFiNv8UB
         hMxQdi2aF93KtCfssdyfLyyIcE3O2XoyXrBEyJZAVH1xOOfr5lKb4RGo/xQzR+zLZYz9
         NU2j7rvyqRL3GJAiyBWfisiCZI9EyxHVTCtiTkMy2VaZ67sVC7ASHuT5ct5Ci39GaJ+v
         088Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206941; x=1772811741;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wzqme1k+Wy+/3yspGSINYIH3f7UH5wA3CsIMcq2UIg=;
        b=Uud+NTiDjwcY5b4Di7gZOpn66JvZyvNfxow+ROVoDW4jAcSCxa2xvGIvn2KHE+w2C/
         rSJPfPNohDRNtQHoXSCVaRl4/n2bhKGEP+7eHlzwCmqmcEXQy+eUaEBf7z8n7kT7Pddz
         IYxI3JvTZC/TF/iYMdQhivyKebzzYZbsAyDxE/e8A+a77Tp4uHwKEezL8YEy8sfJhY+9
         sVQR+9kQcUAa+tKjvdwz+7uzjHsVRxg3BU9WTlc9On1VHIm8Wu8AGwG2MveE+qtiZSdC
         MY11ZbylJC9hkrnxfG4ML0un19IHysD1ZrntABfCIuDERWigLsTdNPFHNXDAc6VpVvQd
         3xQQ==
X-Gm-Message-State: AOJu0YydIXs9vlve+SQOJU4rA9skUsqyGU/Mq3aYCia4nUhrPK/4qmOi
	yi2xKHNrmfvDCU49j4HixKiFwj9T4CLQRREOOOsK+tEXItnsjvvqenSWTFxPrwxpJQc=
X-Gm-Gg: ATEYQzyy38dMuJkvSTqgyXn2HRm474KQ4gl5vNK/Nw/80PxnlAZSvptZf1ytWufvWob
	a3T0Kva7SIQue0zpnAVJnbO6QFbUBskYtoW4x5i+UHGmzUc1lgcZMJTwMpgI4pdj5VOGteSyof2
	9E9RFO4RykGM1kr2/MZsJyuF6ZifC/KH+rV8vKcasGDqpMcCA6m2GY7avFYGHfRN+ZP99LZNqj3
	NBVpjQPLu0ASDhrGlct5sWLZekm//fyQqapj2iXzgZGYlX/X+aK6y4aGuOvxXtQdoSF/4sI6ZFv
	I0NxUpFDhcH6dVAFJ+0eTz7//zuDK4dQeioOXcTAM9HbXs3fRSbRr+L79hTvw1Lo5rBeJ4qNHzr
	jImC1UKdw+E6t56BqS7jFRbQgVIxC5UXi0IXTllSvuPcn9AyCobFCvtAhdmm1EdpulKDGW/gPph
	9DkY1gGUTdrra/h02F+DhtLDyjZ2M09Cu7oqdOYh/GTmfhOr2sOeB5HOfHBCPmmof0
X-Received: by 2002:a05:600c:c4a6:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-483c9bc0344mr52202975e9.12.1772206940611;
        Fri, 27 Feb 2026 07:42:20 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm83821705e9.5.2026.02.27.07.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 07:42:20 -0800 (PST)
Message-ID: <c84f0e40-50d9-4c99-92dd-00bcfc554d83@linaro.org>
Date: Fri, 27 Feb 2026 15:42:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] media: iris: add support for kaanapali platform
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94480-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0FE71BA2A8
X-Rspamd-Action: no action

On 27/02/2026 14:11, Vikash Garodia wrote:
> Qualcomm kaanapali platform have a newer generation of video IP iris4.
> The hardware have evolved mostly with respect to higher number of power
> domains as well as multiple clock sources.
> 
> Considering iris as a client driver, it adds the handling for multiple
> stream ids from VPU via iommu-map.
> 
> This series is depend on the below series:
> https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/
> 
> Following patches were dropped in v2, as per the comments, and would
> be posted separately. This series depends on these patches for
> functionality.
> - https://lore.kernel.org/all/20260126-kaanapali-iris-v1-2-e2646246bfc1@oss.qualcomm.com/
> - https://lore.kernel.org/all/20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com/
> 
> Patch #4 is also posted alongwith below series. If the other series is
> picked earlier, then this patch can be dropped from this series.
> https://lore.kernel.org/all/20260227-iris_sc7280_gen2_support-v2-1-7e5b13d26542@oss.qualcomm.com/

For the record this series is blocked on this:

https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/ 


---
bod

