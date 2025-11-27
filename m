Return-Path: <linux-arm-msm+bounces-83563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0413EC8DBCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B82CF3A94BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 10:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A244F327C0C;
	Thu, 27 Nov 2025 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="leBycSJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECB2307AC6;
	Thu, 27 Nov 2025 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764239129; cv=none; b=a0U0s+fnS2bV0zAGp983Q65Ai9JytpeOO9GSjzSY3b/j+gdSWyr+7AIshQrl0t5G+bxGiGT72PLji6Uesl/2cdRA2Ehdl4DR4M2xjrhW1JMH1om2/8n7+hIIoRyagqcTgGmf2EyDrSBmG/aqyZsUQ8BnaDHajJTMpSEwBFWutKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764239129; c=relaxed/simple;
	bh=GlcY95kqZfJ+m0WcGoO7tr5ws1ZGqDQtKqbeJxby3d8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riOtnJ5GxcCa9aCQzOywz9zDtLR8aaSEpjlVcsr2O2k+B7NI1njQg3I2Zr9yhnYF2vt6L68z6nFN5/THGlLCnfN3NagzqUNOzX+1lrR0rXQjGb7Av53CzOUJBEwmeCGPK+P66ZZ7PtXNWVw1fM5Qsn2Wz9R9OhPHbJwPQ93ol7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=leBycSJt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B0CC4CEF8;
	Thu, 27 Nov 2025 10:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764239128;
	bh=GlcY95kqZfJ+m0WcGoO7tr5ws1ZGqDQtKqbeJxby3d8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=leBycSJtQPXTuX82mylYpc5srD/76nliCrMvWQoq7N0KYgz1AUGRQMSzA9PHIZefb
	 7Q0C/9E+Nitmzr0UMvWoFOqZGGg8qf0ftcVNFquJsp7LOhKh8B3MJMkrD41VYMk9SO
	 1xiZLjvIoVJcf9Qk+ZPmk7om69LiEmzuY65DWTBMylAsG+aASP9WhZmj0Xt1pxfOo/
	 sDFDtoxzbABDufc2Gdw7yfYR0iCzOlc+ZqwaiayR38dcXYc6N9Rf4FjSzsDfsEUR0j
	 cBRrVzXSQLcU4dYuMNgBmBFBZJKaO9pggA/QbrMESF+GKbSDp0MdI5chk/7BkYATIr
	 yJA5jD14FBBfA==
Message-ID: <9dfe5343-824d-42c2-aab8-8389602601e9@kernel.org>
Date: Thu, 27 Nov 2025 10:25:23 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <Ux4KioDAyhqgZYleT-eeeFKzuT_qadCIpP3RgyB40apZPX4I9_JwcfY9mebop4gmFcyh4LPw0KQvFzL4zzysJQ==@protonmail.internalid>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2025 11:37, Mukesh Ojha wrote:
>> Sorry.
>>
>> Did we actually come up with a cogent reason to omit the video firmware
>> loading here ?
>>
>> AFAIU it is required for Lemans and Glymur - leaving it out is blocking
>> getting video stuff done and storing up trouble.
>>
>> What exactly is the blockage - is it something you want help with ?
> I replied to you here[1] and given my reason..till something concluded on
> "multi-cell IOMMU[2]", I can not add video and block what is working
> already.
> 
> [1]
> https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha- 
> hyd.qualcomm.com/

Why though ?

You are mixing together the issue of multiple SIDs and the original 
loading of firmware which could easily reuse the venus method of

&iris {
	video-firmware {
		iommus = <&apss_smmu hex>;
	};
};

That binding got dropped because it was unused in Iris.

https://lore.kernel.org/lkml/05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com/

I still fail to see why we are waiting for multi-cell IOMMU to land, 
when it is expected to and what the VPU enablement story is upstream in 
the meantime.

Blocked it seems.

---
bod

