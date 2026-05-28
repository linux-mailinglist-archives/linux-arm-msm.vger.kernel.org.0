Return-Path: <linux-arm-msm+bounces-110148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPwAC6V4GGo8kQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 19:17:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A8C5F580E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 19:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 606CF301874E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4543FB077;
	Thu, 28 May 2026 17:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bwW14eWz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E058D2FB632;
	Thu, 28 May 2026 17:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779988273; cv=none; b=ig2+Zg/mL1Swjx7+Kd3+b2sDOhahKMOcRfumnFMtqR8U1cCEX7I6UbbCU/lNJjbg8qSdc07zgXEE8NFkbMZjkVWZHL2q3yXyVcKwKlot4XOWpB/Cu3+FjauD+ZOrFCBZHC0y76XW7EspjxmX1iIJKzYyYOw3wFItEWKikiL62MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779988273; c=relaxed/simple;
	bh=n4tNgwyatQTQbGW3S3TfLyFi3VbFJIQEFLRlL5eOTs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWKt3kz4tcobuOpD2yEWVSC451CVpT5fkGRfVSeDac9azVeJmI64z7sza6c5ImNp4aG42dSc96abGuWTeeAPPG49WASpf/tzIoOg+IB+ISbhgxMmmPWoxet3JFQJbMbFJzgbRftjhLKL05kvDACHeuW2DfeJong/7sIblsBVOuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bwW14eWz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46A3A4617;
	Thu, 28 May 2026 10:11:06 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE2213F632;
	Thu, 28 May 2026 10:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779988271; bh=n4tNgwyatQTQbGW3S3TfLyFi3VbFJIQEFLRlL5eOTs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwW14eWzh64FMcKAN7Zcl33EPwg88MkcPsfGUleJH935xNACX1Jt4r6KKr4FrYh7Q
	 nIbaDIIRw1khb+iL5/lLvAMA4+GkHiVpHc5wmNJk+ZzxXLclFYnHZPG+b0+M/hhFBa
	 okv3UQ9AmmrlgWuJEAN7vNWeyGcimtShxMeQDM5w=
Date: Thu, 28 May 2026 18:11:08 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
	tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 3/4] coresight: cti: add Qualcomm extended CTI
 identification and quirks
Message-ID: <20260528171108.GI101133@e132581.arm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-3-d21f4f92c51e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-extended_cti-v9-3-d21f4f92c51e@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110148-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 63A8C5F580E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 08:16:29PM +0800, Yingchao Deng wrote:

[...]

> Qualcomm implements an extended variant of the ARM CoreSight CTI with a
> different register layout and vendor-specific behavior. While the
> programming model remains largely compatible, the register offsets differ
> from the standard ARM CTI and require explicit handling.

I cannot apply this patch successfuly. Please rebase on the latest
coresight-next branch.

> @@ -726,6 +734,22 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  	raw_spin_lock_init(&drvdata->spinlock);
>  
> +	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
> +	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
> +		drvdata->is_qcom_cti = true;
> +		/*
> +		 * QCOM CTI does not implement Claimtag functionality as
> +		 * per CoreSight specification, but its CLAIMSET register
> +		 * is incorrectly initialized to 0xF. This can mislead
> +		 * tools or drivers into thinking the component is claimed.
> +		 *
> +		 * Reset CLAIMSET to 0 to reflect that no claims are active.
> +		 */
> +		CS_UNLOCK(drvdata->base);
> +		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
> +		CS_LOCK(drvdata->base);

Sorry I missed this piece before.

Can you move this quirk into firmware? I don't think the CTI driver
should clear the external claim bit as this totally break the protocol
defined in PSCI. A clean way would clear the bits in firmware and then
CTI driver can use the CLAIM registers.

Or, another option is to create several helpers to bypass claim
operations for Qcom CTI:

  static void cti_clear_self_claim_tag(cti_drvdata *drvdata,
                                      struct csdev_access *csa)
  {
      if (drvdata->is_qcom_cti)
          return;

      coresight_clear_self_claim_tag(csa);
  }

  static int cti_claim_device(cti_drvdata *drvdata)
  {
      if (drvdata->is_qcom_cti)
          return 0;

      return coresight_claim_device(drvdata->csdev);
  }

  static void cti_unclaim_device_unlocked(cti_drvdata *drvdata)
  {
      if (drvdata->is_qcom_cti)
          return;

      return coresight_disclaim_device_unlocked(drvdata->csdev);
  }

Otherwise, this patch is fine for me.

Thanks,
Leo

