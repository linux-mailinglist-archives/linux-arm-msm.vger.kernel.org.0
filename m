Return-Path: <linux-arm-msm+bounces-58287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DF6ABAC9A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 23:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E87F917BF73
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 21:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49093266B6A;
	Sat, 17 May 2025 21:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gsdATuH8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1958F242D90
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747518100; cv=none; b=EUFSBlEEDPUXhBULvGBVce2yVexCul+Ur1l0NYFaNO4abARASuydJBesub3weRtuwIMN6fLVPCaJFPDXxfmT5DMp5YhEA6dn4ac6MGQ/hGB7L3MxVS9y5oYrXSNaeiarBrYBwc1jYpf3tbiz85kjZgG7j1RYh3qR7nffpNj9QTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747518100; c=relaxed/simple;
	bh=rgf3AmO0KzSB0QITDvORX+Y0fa0RiFi81JHdrxxkzEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kaQQhNWKRw//Rh9JFrmdNXLUV7Wuju7pTd4a20ajj2EhPhBnfDsh3W1UEQXaVcHMpEo3auKU2P0VSFf4ODSNDQ51ltl/Fk6RTRNfoVCSmz9/lkSK5wP8LOjA0CH21+MisA69eGcEGd5NcTX10ST4RNp5MfNTvgFjpqicEdvVjQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gsdATuH8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso30912715e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 14:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747518095; x=1748122895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bY76AEEcyf1ZaP0Q4E8CqeVAvvQqjzY+efsftGL0QMU=;
        b=gsdATuH8YVlgoetNJoOdL4qdoHuo7aeQzZcjQfwhholFOFSiT48g+ir1YOpkAd2Gix
         laCenLPlpn7Dq7jnLcpBijYIZVbricScxpaAqyBm3DkmFtfiwlO5azXswn0AYQpz8S2G
         tW8LKo9CyKvMnBswbMtgI/I3i1Q6cUiuS7d967NGSUETHQ4LseNd5NrQCChl0sgijZk2
         euw+D4YX11O3FiGGN1YC3Y1FQAMeQB0WomsSpHz9O4h2QaUsA+d8mBOojDBR16rgU5JD
         m8hVU1l72cUq/3ubTfQ+AfSTjC/psj2iz2xunUX42qPEGKzLkV9Fxi8NbHspDWtVVnaL
         MsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747518095; x=1748122895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bY76AEEcyf1ZaP0Q4E8CqeVAvvQqjzY+efsftGL0QMU=;
        b=ooam0Qp/QqZmU5NlZpDoCeEODm/3vrJhZ1WtBDag2UU6x3O09eDxXynyJjRVq1vYKO
         bQ/bo2hm4mKOjojWqx8kqY8C1XxLf1QDUJicic77P3NK+AOP8AFGUw7I6zZ7lfTueuKv
         W5DeT//C5HU5OrXv1xs0ia0iq2FUgRCJlrOyoGj6ZiFhhiGYv/dg5YgtCabX5JqBG19A
         Nx6mDYllENgtSGTptZehQIOZb62Gg39cN3r0PD8ux2cswU0rbLPRqpBJW8ARhKdeyTMh
         v4tG3AtjWVElcR5GewsC9v5aXxLxl2RcAY2q2pCHDNf/rWAszc5uc+wiVctfEtiVOeMF
         mziw==
X-Forwarded-Encrypted: i=1; AJvYcCVcLR/vtZzuexZjdkro89gNXO2J/o/vXVtWub8A//i+6TnDy2NHm76Pkk8/N7jEceDtngO3DS6vFbiDPKeq@vger.kernel.org
X-Gm-Message-State: AOJu0YzyzwP/L6mlCXWJ+p7YjPDojAE5/7HHqEdJFYN0Npc4TvNTVx96
	uHG5K8jURNKYy6hG9MgEX6JgYaEHiqLovQbIuhJbCLtDKe7l2Zd6mNYA+PXDLK+ZcE0=
X-Gm-Gg: ASbGncutpM4xEAgXHGSH74McA0tHs2PgYutpxaoIbiuyTIn49BdMuiKy30z1K81Vmhr
	APQBTDyjqHlwLA08lzaXNAkS5gJ0ayXOKm+tJuDGgH1sre5LwsfnCPfsbe+Bw4APOaJHJjwgExS
	8CqvrvpwBJ12BJWo4W8CvZNl2b9Ap7oJAAv4nh7cM0l5/PmupeseLZrYwYT7WLff1rAh64XOxmR
	TNth5jsnnQTVNGcks7ur35/1WOMZaIlCwauNG/Cbzr6RtFrov1Dhrss6+wrEN863RDf+FH5URVy
	I8JaQhViEN0/kP8pCmSs6zmQrm2bjsrCNkp6Sbm46WdUluhz59sZOscvbsHt7ARhKzeRbdM5Sog
	91zHJ5Vep2mAHUpXi
X-Google-Smtp-Source: AGHT+IEfLRMthem1h4Iqf+AVyw92a10FVG/gJvB+jnvXapWRtPRHbKjdboZGt4Z0ylILdnQ8uegkeg==
X-Received: by 2002:a05:600c:a105:b0:441:ac58:eb31 with SMTP id 5b1f17b1804b1-442fda3038amr54007955e9.20.1747518095254;
        Sat, 17 May 2025 14:41:35 -0700 (PDT)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e852fsm163281875e9.27.2025.05.17.14.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 14:41:34 -0700 (PDT)
Message-ID: <f39310ec-ff30-45b4-ae80-768f252b7ed5@linaro.org>
Date: Sat, 17 May 2025 22:41:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: venus: Fix OOB read due to missing payload
 bound check
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
 <20250514-venus-fixes-v3-2-32298566011f@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250514-venus-fixes-v3-2-32298566011f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 14:38, Dikshita Agarwal wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> Currently, The event_seq_changed() handler processes a variable number
> of properties sent by the firmware. The number of properties is indicated
> by the firmware and used to iterate over the payload. However, the
> payload size is not being validated against the actual message length.
> 
> This can lead to out-of-bounds memory access if the firmware provides a
> property count that exceeds the data available in the payload. Such a
> condition can result in kernel crashes or potential information leaks if
> memory beyond the buffer is accessed.
> 
> Fix this by properly validating the remaining size of the payload before
> each property access and updating bounds accordingly as properties are
> parsed.
> 
> This ensures that property parsing is safely bounded within the received
> message buffer and protects against malformed or malicious firmware
> behavior.
> 
> Fixes: 09c2845e8fe4 ("[media] media: venus: hfi: add Host Firmware Interface (HFI)")
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

