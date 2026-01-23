Return-Path: <linux-arm-msm+bounces-90372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FQ8ODG6c2kmyQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:13:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEF5796C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0945130824EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 18:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C1F27B32B;
	Fri, 23 Jan 2026 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPbR0rmM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125EF27A465
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 18:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191863; cv=none; b=Q1IJW+KS+nLUdCbDQlSDGVy8b5Ws0EVmOlnOzlURJkrXDGRay//iupNCva7pW449dbUl2QwD9J2wBxUsO7js75GwCXk6BgfQuadpVY8u3dRcbYGOYFPIC4mWiqFJzsBZitIVn3MVJxFxGTBAgToxAwiLjo9BquWYh8Ha/E8NaCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191863; c=relaxed/simple;
	bh=z6+4XFmAM+9E9nMdkW7Ivutg05qfOcI/VIcnBRViQZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9sy8UaspGyJga5SSF4yMwk6gkQbYpuXUtNJwfezpmXqf7dszOlmnOTXMYVMwFTaDhA2dqSXzaIkn1aZWjsbSVNDMcSxsgL/2W3VMo3I3XmZlLSQmiuXgISdepJgYW2CCWVb+CiDiKteQj1cIZCBnnVQmR7L73mFIYzkyFNd/wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPbR0rmM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-432d256c2e6so2483506f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769191860; x=1769796660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0KMpHNofunhigiSe2e7em+jTqmhfyGJoueS1EQ8l48=;
        b=PPbR0rmMEbt+M1i+koiovA1z8EsoQbhyp/PSj17YlQZFcAtfPrf0hMUyPWXaaqqLya
         7CjHXhlGCK5v29eRqgkC2p0/sYoHifyVnW5ZK0xagAzpqM/OVUyITCbOm353wdX4ItC4
         oeWzF0wUfx7/mqQKQFxOcEcFN+S0EMjFAXmX2qTdEQGFzgL9G0QBIIfBb+20bULaIRDT
         0qrlJcAgAMc13ByZ+0d4ULYvknQ89mIugSJTzs+KN0zKudpE4oC/4hBVJYsqGF5/NzDL
         aX44fNx5pgsKQKfvm/XiV0v3K279yWWF91xq69Pz4kImcTuiUqSV94x2N36/UWvsFI/K
         ooKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769191860; x=1769796660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0KMpHNofunhigiSe2e7em+jTqmhfyGJoueS1EQ8l48=;
        b=OM76Y0QnGpJDyU8NhKX3YI34wfo5HGm/1q3Co69OA0CWlk/fLP2Wa2mfRxdYK4JVRy
         MgHgQ2i3X5JzuRUNQ9OjQR9I+2rG1W2SrXQ6BhSxtXZS0TQmT2aMNiNsoODo2NADtZKR
         ZN070rxIedJoP0Aw3pgxU4fpeGAhlI2nlCgwfsB3PXwoxYRkduA98gZwDjtALZuWWis7
         RwRXYBulWW+oS+JAhhwTvyJawatYechscdwgyq6G9F8fSRn73LBuHylPyKJjUAbr4J0Z
         J/sfoawjJ96FgxDchninmyhys2x/bUMzGSeHIGRxoRYVFzkzWzS8haHwAK13tFozR/87
         khuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj1E31bdCDg3HGV/Hm0laei7Vqx13rFlza+VNSv35hwIlRdusTKoc6D6wfZTxDPc0NV6NSCpWuSwr1UeGO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2PDbvcZHDebfjksnI7d/7gWhPus2XTMgcAQ+tPBxEXomJC80e
	611XpAaAvP4PLeHDCd+j+lug/X/xGbkVZZ5NI4b8tG4G2Cx6WYrTeYq+
X-Gm-Gg: AZuq6aLcwz/IrDdSmITRmbKoUIa4uXBQ2cX44dhM5u1Sid3efvsu37zwHkkYhLx2Bew
	FTdHuccI9Vjm5m7DI8D+Qw8rvidTqENVhztuwkXsUG4I8x+IOiT+gldNfUktSNjIpddvVyoNRjP
	TzlrHrCbAgXdZOeHYARLdWy6G5aEFfcO8OaentpeMj4KqioWsW1EMVQV0NAhCrhUThFTUZPGeQA
	xiMclk/02PbR3DbyBsa2+Es7JYS7GeOnylV3caQ/iGY0yk7Q2qvZafj7ODd7ibjzuAUT4Lc6nkJ
	rpi4gnOPcTl6aU4h03Eghh9bjoZl+z+vwBA3mSdudQg392K/4nX3rZ21rTCmNCmn8uSLPL0aw12
	qI5zb46jheiKQl2G8TFgzxqk9Tmrnvgfwp1r1MsXBpeu+jUzdKznLMwXSi3FYbKbgj4nvUkW3p7
	jCG4LyG502j6Y88h8vTvI5WvztLw==
X-Received: by 2002:a05:6000:200f:b0:435:ae10:cf84 with SMTP id ffacd0b85a97d-435b15887fcmr7722618f8f.5.1769191860167;
        Fri, 23 Jan 2026 10:11:00 -0800 (PST)
Received: from ?IPV6:2001:871:22a:cfb5::18a2? ([2001:871:22a:cfb5::18a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7b4d8sm8059422f8f.38.2026.01.23.10.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 10:10:59 -0800 (PST)
Message-ID: <ab9103dd-c1c6-473b-9dd7-87a3d5e203c9@gmail.com>
Date: Fri, 23 Jan 2026 19:10:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] qcom: iommu: nullpointer dereference on boot on
 apq8064
To: Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
References: <569d7de2-cfcd-4d28-8bbf-14a0179f665e@gmail.com>
 <20260105180213.GG125261@ziepe.ca>
 <9a86120e-c0be-4ed5-a3de-cc7f164da154@arm.com>
 <5cab0953-c2a3-4baa-af91-e9519afef092@gmail.com>
 <da3fcb7f-4ac4-41c0-b3ad-055c6766fd5c@arm.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <da3fcb7f-4ac4-41c0-b3ad-055c6766fd5c@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-90372-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chrisischrefl@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0EEF5796C9
X-Rspamd-Action: no action

Hi Robin

On 1/23/26 7:02 PM, Robin Murphy wrote:
> On 2026-01-15 7:02 pm, Christian Schrefl wrote:
>> Hi Robin,
>>
>> Sorry for taking so long until I got to trying it out.
>> The patch fixes the crash!
> 
> Bah, in the process of writing this up properly I've realised that although it fixes the crash, I think it breaks the multi-IOMMU functionality, as .add_device will only be called for the first IOMMU instance, whereas the current code is cheekily abusing .of_xlate to link the device to both instances. And in fact that implies the existing code is yet more buggy, as it seems it will leak and reallocate dev_iommu_priv the first time it looks up the second instance (whose ctx_list will be empty), thus it's only working at all because in all cases the DT happens to list all the IDs for one instance before all for the other, and both use an identical set of ID values. Oh dear...

Thanks for looking into this! I'm not familiar with the IOMMU subsystem so it would probably take me a long
time to figure out anything useful about this.

> Are you using the GPU and/or display device(s) enough to be able to tell whether their IOMMUs are working as expected?
No I currently only have a serial console, though at least the display used to work on earlier versions,
but maybe that's just a configuration issue. Its on my list to investigate when I've got the time for it.

Cheers,
Christian


