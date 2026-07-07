Return-Path: <linux-arm-msm+bounces-117354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b/EfKOcaTWq5vAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 17:27:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ABD71D424
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 17:27:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jpIgJeaw;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117354-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117354-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC965308FBD8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 15:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D043783B1;
	Tue,  7 Jul 2026 15:04:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8423074B1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 15:04:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436692; cv=none; b=iYgYcuR2Mk3gy+g7EvwE1nFWuqo3aQmTiksEtmMVqdMMCbq+6pKVJTZeZVykq8IyvGkJ23WxWtElX69djrjSRDFDmnxh2CMMbqgKkNQ3LiI9QDLgHRfCpW+6VosCNIx6tyV2OdAb+rDlo303qbOQzPo/ilKy7B5McVlTgD9RiEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436692; c=relaxed/simple;
	bh=JW6561mML8m0Es0w6oBxup+aCmHVJh9Hrl4KT/dgDAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B7GnrDqGNVZ+K8QLEwvpsaQHsUaHMIFzEpZeoQtFQ8gs6XhYYffR+S5wGpgoLLZn3L+asCwvu7Ip46hE7+m7MlDJGMAZ0k5W45lNCmHrd4oddZBSi5LKJYCRSF53UdGvJlH3GAfPUX4+/sHZr+qBpgfRHU1TaQtTOFho0NhDwUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpIgJeaw; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4758bd3731bso673538f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783436689; x=1784041489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yjaKNQDIB8x3lV2bAr2D5lvHBXFHHvfoE6oAh2cW/Bg=;
        b=jpIgJeawSvqhMQ3AZXAGdsTz77Zm0UArKxI/tM3/K2buybJaaz3Qsq/yOB39/WJhEP
         3uJWdKfdg+hC/Mr+W18dKHpRcyz/+4AMu31ePiNEAvjRPOjGolY1yia8P6A0NjA9ltPU
         u6i8DRn7jhj2rrgV4Vj8UKfwXBc0kX6gAqqsSAVGX2yLfnupKjTLnY0lVxjmXYApc4kv
         IrO8kYjFDHDgOMVTPpKwUs074kWhTrsaXQnCiH0XtNrYjK7Y9fOD1yKbEffhR4wSm4GL
         mpeV3JNqg1CswPjQt0UgBmC2PB3+Z5ehGtKI56gyfK0fJKiyRZSuhMaBgbCT9LW2mvEh
         9jKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436689; x=1784041489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjaKNQDIB8x3lV2bAr2D5lvHBXFHHvfoE6oAh2cW/Bg=;
        b=bye/Ll69Lrelq5tcUMMQhH5jg7z4+xkE1cPGhvbJGXClGPZBsBs+kSThSZQqeWW4ch
         IhkyTLBk5J7eASDyL7KNNTlIC5AjRDRVSt1qcNh8ofLPABZdzIZEFkK3a8xNoRWfHEe0
         rccFKf+VHb2/lk/STomi1Etanp0KjZLAG69twD2m4rr0tuDTLOahGmE8YJNbVaEs1HUN
         062WW0d7EB9qs5DZ8YZYOgYNvSDxTSzdgMZZt0jzVF96niTtD0HWRygSP13noQ9c24n5
         8YgzxotsKpUoEe+WBjShnvcoln+sxdlit3b08G3oB03YBkAj1nNAOA2Y1CNhG9qdL9nK
         vYgg==
X-Forwarded-Encrypted: i=1; AHgh+RphfMR7ZhWgxN4nbKU+mEyCaaWV9pEnwDgA3GiHWvAnmUGmZ5jGVjFSmYAnNcEX0bZfQLLdwJy0oXZlY+G0@vger.kernel.org
X-Gm-Message-State: AOJu0YxhwNRDBlYSuGNS8JjAdGl3e4JXR+4Da3N8aTkfWlFLeK4g84pd
	44WUzPLriQKY67iyfKnzJssOofAN6BhXM45gvXcaIKyerS7NKVysJ6U=
X-Gm-Gg: AfdE7cm7M3DqXmQuUAimag7kvMnSY6Sv25N4YvUN94IUjryIDCqSLgqwg4lu0p3Undr
	DP+4zeJDP2KXFuZCxoCN1UV0UxhHZ1t6Lq0D2FyKAdObQwgUQffHywA+h8UXLdsSaciodSSsRgC
	oVUUhmYgdh/KKfQUBp7DE2xERQDqEUk+7yThtoYBqcxU4U2hkafljLP85ODmWfMgILMHvPHGSkv
	N0MDo0zpVyrML1rE/3XibxNBo0mTr5QTFsIt0sPiTrLA5kLVKoXjjieXnV6rqLI8Swizd95y8pt
	+ntt1E5gw/URicGOw1fYF95cOBL3yRYDv0/9hhu1VWgYRLPoywXVIf4AT0ixxP75bx6GyjdscS2
	9QCV1FrM4r3yYOofrNKrPcfFosw2K94/FaIXpxE53V9/Fbr1zBMHn7CvNYNbizjmHjtEFMfua9k
	9rvv7wrVHzxgdWH0HxBQyW50yEIqazFCde94J3wVcx2ImS/RsvU9uuMYuCZgqhadNNc4da1g==
X-Received: by 2002:a05:6000:2584:b0:473:6590:c42a with SMTP id ffacd0b85a97d-47de97ea689mr3990217f8f.9.1783436688978;
        Tue, 07 Jul 2026 08:04:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21328sm35142014f8f.32.2026.07.07.08.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 08:04:48 -0700 (PDT)
Message-ID: <6acf86dc-0df0-492a-b3dc-224a666214b9@gmail.com>
Date: Tue, 7 Jul 2026 17:04:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/13] iommu: arm-smmu-qcom: Configure lpac device
 with split address space
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-1-01d50c3e0c99@gmail.com>
 <5vfdbrk4bu77e7wgutp4h3ilbpjhcxxnwemqiufmtiwoffp4sl@oaonwwouw4qm>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <5vfdbrk4bu77e7wgutp4h3ilbpjhcxxnwemqiufmtiwoffp4sl@oaonwwouw4qm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117354-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,lists.linux.dev,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91ABD71D424

On 7/6/26 5:00 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 05, 2026 at 09:13:35PM +0200, Anna Maniscalco wrote:
>> We want the context bank used by LPAC to use split address space just
>> like GFX.
> Why?

I'll update the commit message in the next revision.

The reason is the same as GFX, we want split kernel and user address 
spaces so we can use per context page tables for userspace submissions.

>
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


