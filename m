Return-Path: <linux-arm-msm+bounces-84772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9EECAFE9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 13:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 599A33091923
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 12:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB36D2F0661;
	Tue,  9 Dec 2025 12:19:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA8B22B5A3;
	Tue,  9 Dec 2025 12:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765282761; cv=none; b=TXPIP5uHBCDRpB7DQmTHxoiLcpLRVzK+Kl1WxMQw5XaM7aQ7C4FVBdFD9uYxh6h6Xdbx9/APzc5HKuQMC3tZIrvdCm4/N5GLoq5LFUOcUuk9KLrzjbPDvrzqqrLtquBgaZhFotwNe/FUNJGbjq8yTyV+PoHEfFWzryWTS3Ex0+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765282761; c=relaxed/simple;
	bh=evibsYVRuO9bfcuI3/Ro/ug24jtD6rhq9S6IXOUHTrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmYT5c53llZtI1SeJfaJD+GhQlY7LfKkfBE2Xx5APc9PJN95+BSkJpZdy6K/2gG+pIg/jwxo1Bjg+XiTNRBsFuqJuKPsVOK3SnMUpeDfplIWVl9PlEeSKJL10/C8sejmLolTwtfN7XDTdS/Zasw4RlVoGQuxJQwQ6iqcsD6e19o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D4AD1691;
	Tue,  9 Dec 2025 04:19:11 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1565C3F740;
	Tue,  9 Dec 2025 04:19:17 -0800 (PST)
Date: Tue, 9 Dec 2025 12:19:16 +0000
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: mike.leach@linaro.org, alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org, james.clark@linaro.org,
	jinlong.mao@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_jinlmao@quicinc.com, quic_yingdeng@quicinc.com,
	suzuki.poulose@arm.com, tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Message-ID: <20251209121916.GT724103@e132581.arm.com>
References: <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
 <20251209081649.105623-1-yingchao.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251209081649.105623-1-yingchao.deng@oss.qualcomm.com>

Hi Yingchao,

On Tue, Dec 09, 2025 at 04:16:28PM +0800, Yingchao Deng wrote:
> Hi Leo & Mike
> 
> Based on Leo’s suggestions, I created a new patch, but there are three points that do not fully align with his recommendations:
> 
>     1. The helper function for returning the register address now returns only the offset, because returning the full address would conflict with cti_write_single_reg.

No need to change each callsite for cti_write_single_reg().  You could
update cti_write_single_reg() instead:

  void cti_write_single_reg(struct cti_drvdata *drvdata,
                            int offset, u32 value)
  {
          CS_UNLOCK(drvdata->base);
          writel_relaxed(value, cti_reg_addr(drvdata, offset));
          CS_LOCK(drvdata->base);
  }

>     2. For registers such as triginstatus1...3, I defined additional macros CTITRIGINSTATUS1...3. This is because CTITRIGINSTATUS + 0x4 equals CTITRIGOUTSTATUS, and to avoid conflicts with existing macros, I chose numbers starting from 0x1000 for the new definitions.

To avoid the register naming pollution, please don't define the common
names but only used for Qcom registers.

AFAIK, you even don't need to define these registers.  These registers
are only used for sysfs knobs, we can define an extra "nr" field (e.g.,
bits[31..28] for indexing these registers, something like:

  #define CIT_REG_NR_SHIFT          28
  #define CIT_REG_NR_MASK           GENMASK(31, 28)
  #define CTI_REG_GET_NR(reg)       FIELD_GET(CIT_REG_NR_MASK, (reg))
  #define CTI_REG_SET_NR(reg, nr)   ((reg) | FIELD_PREP(CIT_REG_NR_MASK, (nr))

  static struct attribute *coresight_cti_regs_attrs[] = {
  ...
    coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
    coresight_cti_reg(triginstatus1, CTI_REG_SET_NR(CTITRIGINSTATUS, 1)),
    coresight_cti_reg(triginstatus2, CTI_REG_SET_NR(CTITRIGINSTATUS, 2)),
    coresight_cti_reg(triginstatus3, CTI_REG_SET_NR(CTITRIGINSTATUS, 3)),
  ...

Then, you just need to decode "nr" fields in cti_qcom_reg_off().

>     3. Regarding the visibility of attributes for triginstatus1...3, since coresight_cti_reg produces an anonymous variable that cannot be directly referenced, I used coresight_cti_regs_attrs[i] to obtain the attribute corresponding to triginstatus1.

Okay, I get the meaning for "an anonymous variable" - there have no
field naming when define attr with the macro coresight_cti_reg().

but you could comparing the attr string?

  if (!strcmp(attr->name, "triginstatus1") ||
      !strcmp(attr->name, "triginstatus2") ||
      !strcmp(attr->name, "triginstatus3"))
      ...

Thanks,
Leo

