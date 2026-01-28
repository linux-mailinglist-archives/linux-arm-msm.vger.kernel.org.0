Return-Path: <linux-arm-msm+bounces-91040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ1gOaUZemlS2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:13:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF87A2925
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 084CA3004D15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDF0264A86;
	Wed, 28 Jan 2026 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntjdGRx6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0E126159E;
	Wed, 28 Jan 2026 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609631; cv=none; b=EcpVlmWC5DORI+q8j75aObPSgOCJKcl20gYgBGl5TJcEEFiAg96heShvuy+mUpgrkI5cBaqF4kq5ExerBAROoNU3E2Xl6T2VOMVBBQqpELPv7WX01vIVNr6ZjoJhSAJ/ra6J2emNHNhMl48QIEZnW9imvMP93jegih9j/y2Tbig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609631; c=relaxed/simple;
	bh=ZYIApr/1t12Jf+zZIBauWrjD+latXbmKbRdXPnfR8yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ah6Uigi9F90TAXWxeLLaxTS8xGCIfvouiMVfSgGbaEqLS4lRMJJdlFyHVS7Vrq9h+bTuz5kH8qnHt/aeh+usnz1kdJH9CGUHu2A1ZJH3XwQR2WmNcvUj+w46OUDqtBxr57JcUxV02Bq0VDVlhOuKWxLyDJ/IQvFlfJclofq3/WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntjdGRx6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F49C4CEF1;
	Wed, 28 Jan 2026 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769609631;
	bh=ZYIApr/1t12Jf+zZIBauWrjD+latXbmKbRdXPnfR8yI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ntjdGRx6SjSzVR46unp/bcPDMPhcuZljUiwOpLQw1frMIs8ZRWJKgLkvsdOlDWttT
	 MwUrwJmYP9gGFHmwrKWksHM2mJ4AYg6FA0V5dHRJVxdnHLd99NG/vKXvs2Uoa8DBzx
	 rRpbe+/ZB6DJ7YurQwQ+mJpw428gEvpHZrol2QcuCakoWK3simd5awS3UceUTUW5A9
	 UVbVt1q/B5nXVfSCZBhgYklYC7EWsgw1iHl76BJu1/d0fW1bP3r2zQhIDcOdr6KYMK
	 kFLu04yWKu5AvpAU+f9ZdOscMNko2PxxgwC2fP6f07A9mpKnd9mEd5i/B2LRw0MXlQ
	 OiItHUUkcAZEA==
Date: Wed, 28 Jan 2026 08:13:48 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Stanimir Varbanov <svarbanov@mm-sol.com>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Prevent GDSC power down on suspend
Message-ID: <zfs6krk2whthgdjl2s2w4o5pjwimzw37afoiyrqllykrk6jugt@4ijk5iqplohr>
References: <20260128-genpd_fix-v1-1-cd45a249d12f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-genpd_fix-v1-1-cd45a249d12f@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91040-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 8CF87A2925
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 05:52:42PM +0530, Krishna Chaitanya Chundru wrote:
> Currently, the driver expects the devices to remain in D0 across system
> suspend, but the genpd framework may still power down the associated
> GDSC during suspend. When that happens, the PCIe link goes down and
> cannot be recovered on resume.
> 

The GDSC is a child of CX, so by keeping it always-on, you effectively
put an always-on vote on CX, forever preventing CXPC.

In fact, this is one of the reasons why the PCIe GDSCs on most targets
is marked PWRSTS_RET_ON (in the clock driver) so that the "off state"
doesn't actually turn off the GDSC, but it relinquishes the inherited
vote on CX.

> Prevent genpd from turning off the PCIe GDSC by using
> dev_pm_genpd_rpm_always_on() so that the power domain stays on while
> the controller is suspended. This preserves the link state across
> suspend/resume and avoids unrecoverable link failures.
> 

We are able to suspend/resume a whole bunch of platforms today, which
one are you on?

That said, while we can suspend/resume, we're not allowing CXPC today.
On many systems the main culprit is the icc_set_bw() vote in
qcom_pcie_suspend_noirq().

Regards,
Bjorn

> Fixes: 82a823833f4e ("PCI: qcom: Add Qualcomm PCIe controller driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 5a318487b2b3f6c61d8f5b1fd5cdf2738a1f1dcd..314cf334a313dff35efaf0c023597e6eef483925 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -25,6 +25,7 @@
>  #include <linux/pci.h>
>  #include <linux/pci-ecam.h>
>  #include <linux/pm_opp.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/pcie.h>
> @@ -2052,6 +2053,11 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
>  		pcie->suspended = true;
>  	}
>  
> +	if (pcie->suspended)
> +		dev_pm_genpd_rpm_always_on(dev, false);
> +	else
> +		dev_pm_genpd_rpm_always_on(dev, true);
> +
>  	/*
>  	 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
>  	 * Because on some platforms, DBI access can happen very late during the
> 
> ---
> base-commit: 1f97d9dcf53649c41c33227b345a36902cbb08ad
> change-id: 20260128-genpd_fix-3aa413d9a383
> 
> Best regards,
> -- 
> Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> 

