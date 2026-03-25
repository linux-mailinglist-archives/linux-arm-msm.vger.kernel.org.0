Return-Path: <linux-arm-msm+bounces-99889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKpxO98CxGm0vQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:44:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B2D3284C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32C5E335B546
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 15:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB903DD537;
	Wed, 25 Mar 2026 15:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xtl9lsug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058C4396D0C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451770; cv=none; b=G/5YfQnO/0D1KusSCUG6joo5RQLogWLYp+WPB2CXNWZs3utDMPTFfYMhtitr1uHubxtsrkYwkVUhYSt37TlEmRHM+O1Zpp/veAM1jaNZazzaYSdYvJ7qRQklGYVKhnyPz+BXMzaBb0Nv9T0obPy4UL7XjVAiLs4Ud00Q1Jvw9S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451770; c=relaxed/simple;
	bh=/vywv4hZ4+kE2TvgFYQ3L9kVw42zFJldnDoEQi5wZGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bVC0Y67DuuTFU+v1TrcvEXqRycjUcsIx2rKpoyN2OJWLWMR+M7wzyFqYCaWRMr0pg5IkDkiJkAAtSduSusrOdPx5P1bEMxFwruluMMf44BY3z/Pa9pIw8WM3+rBBlWBVHQq7MK9mjDdCPaIwrFwwPhgJUD5vpAjqLUmydiDukrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xtl9lsug; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b886fc047d5so1129932766b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774451767; x=1775056567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jeZDmS4QXWBXj1GSyJBXJGYP+hGJySEXWFfrbydgUbc=;
        b=Xtl9lsugTjkG1zZ3ws5CkNNW0aOB1buzoShWTUH9GO8vsOmYQ8EAdjqMrPBnZa24uJ
         5Oj4ABMUHI00QYCSOUD6my+zhaz9e7UFsphPqhbvaxMEMRrcyxLmWlsJQABR9VSTSv6K
         MysRVPFd5hXAOgErCJkqUQP42uxmbycD828DD1TJSpa2RqQvITZs9+gupw9snXR9kwcH
         wqqITJdDFcGkvCgAGz8EsfSTpSee4lXNkI87HVUETqllVPy3L0FGqOrq4MqxursLHngD
         UleQ6BtlB58AK/5VCf7FUsm+bY0dvRFJHXnNB+KqGy46rgBSyiJNm8UY55kJ2JfRNG0W
         MH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451767; x=1775056567;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeZDmS4QXWBXj1GSyJBXJGYP+hGJySEXWFfrbydgUbc=;
        b=mVqXAN/c5P41hTJttlAQyMUPc+aaNIhjdmdFbi6+o1HAWnnVrMs2Dy1zmDSRkUr6mV
         lDSGR19DkbhGa42eilPRXaA30hl6aY4DsnlSzMvvPeIT9CtYn1ohAo9Q5pyFhpCj027v
         SG9H+lA6JFZPB9GyBWTwjBr5ggDIBNVoQ/q7Cg/IxQKDYBsNUj99fvYNqKMrE3v3cGKC
         2nS2KPg+5joP22J7SMeUzlD3BMzlr/3L0Gg2xLLnYCICBAhdaRP/Q2wv1tIRZIRlnuBx
         CK1ycDgfJtwZLzlg7dCFkJci3VdnB0Qy/Jx4JKVqf1V9e3wpPR4rPM/H3v6uT9cORqTY
         LvpQ==
X-Gm-Message-State: AOJu0YylpRG4KHCeCOg2dlOi2o0BJz90DSmNqdIcFzoSYz/zHnNgse73
	BZsDOhplgfFQbN3l+ux82vvGasHnRDiHATrHTys8wXomIkgggCyATwSExuZ/rth5V/M=
X-Gm-Gg: ATEYQzz5GX7a1ksbeAM3NJXBFB2CD7CVgUgNbwAs4W6ZJ6ZlU4+ZS2kB2td3b4uKyTr
	905rxN1o9WDU9IAGXyIOVBAQFOax+h1N7pKBZ2h0YzsGPTHLZJdhDWZFOHM90HkSdTFP1iNDXGs
	2/Vk0tNFbWznuoPcmYfKyKMec0kZqrCY508AbWjtpzN+DfVHWRds3oX7T7f3ZSP9qLFa0nZudY2
	Smkh2zDU2zUpknPilRW0gH5Oqg+kR0m2OWf1X4zRO4VOniapogq5xEYd73ICavJq0nZ7phnjsC3
	pm+xU3pLFXRE9tJq+hI+IuGx4TlhsGWzrzjZaYBL3tuXUpUTYEPBdSRN9CWQN8x1xWSVucQYItl
	MHWpYK0SazLT2Yq1/2F7Qro+QXiqQARs8QhKPaX/pte4kbU6YC/+lZakK448iJz7v+3UYEvhksu
	ORMvvX01HcKnUxqStn0pKwypSQST3cd2IzibiN
X-Received: by 2002:a17:907:619b:b0:b98:1129:51 with SMTP id a640c23a62f3a-b9a3f1abe69mr195370666b.17.1774451767271;
        Wed, 25 Mar 2026 08:16:07 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f440e7sm800025966b.3.2026.03.25.08.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:16:06 -0700 (PDT)
Message-ID: <2c5b8402-6036-43b9-bda3-aeee0c6a9d7d@linaro.org>
Date: Wed, 25 Mar 2026 15:16:03 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: iris: switch to hardware mode after
 firmware boot
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
 <7dbf7a23-7a02-4e9e-99c8-6716e3dcf7d9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <7dbf7a23-7a02-4e9e-99c8-6716e3dcf7d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99889-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 71B2D3284C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25/03/2026 15:14, Vikash Garodia wrote:
> 
> On 3/13/2026 6:49 PM, Vikash Garodia wrote:
>> Currently the driver switches the vcodec GDSC to hardware (HW) mode
>> before firmware load and boot sequence. GDSC can be powered off, keeping
>> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
>> carry default (reset) values.
>> Move the transition to HW mode after firmware load and boot sequence.
>>
>> The bug was exposed with driver configuring different stream ids to
>> different devices via iommu-map. With registers carrying reset values,
>> VPU would not generate desired stream-id, thereby leading to SMMU fault.
>>
>> For vpu4, when GDSC is switched to HW mode, there is a need to perform
>> the reset operation. Without reset, there are occassional issues of
>> register corruption observed. Hence the vpu GDSC switch also involves
>> the reset.
>>
>> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with 
>> necessary hooks")
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
> 
> Hi Bryan,
> 
> Please pull this fix patch, let me know if you need me to resend this 
> separately.
> 
> Regards,
> Vikash

np

---
bod

