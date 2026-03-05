Return-Path: <linux-arm-msm+bounces-95608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENoBKKJhqWnj6QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:57:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E86E2102C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 962D6302850D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC62A37D13F;
	Thu,  5 Mar 2026 10:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tcxiqda9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214D037A4BC
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708254; cv=none; b=ZJmorIU/0H5Y1s+Cc+4ZjrfZAYhVOGiYq/8+hmis9kghn8soqDLKu5rr7/OOAalqQ36DUINVDT7+Xnvs8kqBYNkomAunqv2FhdfAQ99zAKqHbRRX3xBNtuUS0BGuZJeQtkVIFOBODTQyghnLstF8e/JcV4N4ob2/YoGoZyc4nlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708254; c=relaxed/simple;
	bh=1Ktb/Jff8BLCel01h0p0OQSTINwpH6PnbLqfpOtxfac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUnwCIClAYjZhQh9lRM0VB2aL80dItotkvJEOXcHNdID5yjD4aXag3JaZlnuLcMjW/OO64h3Y6wpfsDviPofrb9qZA54lLtWh/i9Kp6SclDDQMic+iaUGotdhSHRVtN0L9LOZ1dnIYeNXm5LAL/hA2AmySo5ywG+QJWl+BbS5UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tcxiqda9; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439c944bb62so1323610f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 02:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772708250; x=1773313050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ybS3rwt9ZBPkb5XhaXrNdEx79jjiYwB5ABJ0Z/J4tY0=;
        b=tcxiqda94m8IeI3mIYmdCl0SktyounSSGThPcLXH6myQQoxAlS5sIZFkdeClLaxBTe
         qR+oHGB4OaoSCxbIMD5RmhYCu2XYrxOU+if+xYt2qy2WBd4/cfpkOnRDMuyb7ZHmKsIx
         a7v7ayyI9msMUwm0j/6n5F9AaQ4WDxUsEdKuPGDamUIRQJQkchBg/2h+lQFcQh1tRJ1A
         VUz/SpLgq0x5MF6fLRj8a9cpqluwE8ZQ7kcnTdiana2HB+cqdGJptBFsu3VqVMJh8JQP
         iNEZM80Jzh7aMyEaiEq+UgxiUQEZsMkxPGNfI1NsxpU4VuQITB1fmBOZlJXbjRG+TnhU
         RGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772708250; x=1773313050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybS3rwt9ZBPkb5XhaXrNdEx79jjiYwB5ABJ0Z/J4tY0=;
        b=euvgbL4mruXm7aQDVHAm0o5gBK3ct+GACweOqnJggHI6ToYGZG4kwOcat0+ks/HXJZ
         kvpVQjmNsQYBC48US6FVxexgrxx/OV51Sf4Fp4XXsAHgSb1XW9TqqAXZJA4i/+zcLqjU
         i9uKmZ7oVMjhMV0G/4OL7GoyyG2akxSPF5CIiE6EcQOpSjbf6oOYenSI1Tl64hY/dz7D
         95PlEmxHYJFPmKJ6YKQNhZ+/M3vg5Cj4rhFFj4HIP9qrZyNrleBofpw27Ei7T5gi3SBo
         d9pylo3AlM0CfvdGXIEVzulS2M6ivTvbbNqoG4FCGs7TiOIVmEWaCkyWtNcbTJderOHn
         6x5A==
X-Forwarded-Encrypted: i=1; AJvYcCWGEko0YJsRWMGMdhQjge4jkKFG2w0i7brwLouokQdoJcOpoZjcq8EcDwIrpEG08YWwdVcH6HUxj+eDKCce@vger.kernel.org
X-Gm-Message-State: AOJu0YxdEghtNnAUEbnpr0Wgxhs/HtnQfvuMZj037QpzQ7Q/hKMve3p7
	Zgz19+UOc6NMGz8v5DQvIxfErV8f4PlDVNCa/6A+UG3J7l3HDbdc+WRCOQ2ZXmHU27E=
X-Gm-Gg: ATEYQzx9Cr6KzVS6UdSFg+pUsiiZLxvmmZfciYCeD6G+0cB5GvrvwYk+39mtdDzz34s
	ddo+Y/w4py7pvM637q+iOer4/VP6J/tx0A/4shqG7eq5dx8mGUwmx50uy7sue9K3RTcyVYjmAVQ
	86sw9xIhJd2X7etkVZPjt1tE313DkwYfVGErPSu+h6yFUbNuzEbxtRksCkgftq0+axgPGm2B0Hm
	B+iJBdwrV5Wu/tWrGnEtyDd8+TcJoVCRPm7RKwit3j7sZ07Pk2A1vEvPSMyD3RythEEnqB6DNOD
	r/WgPSAjnRV1lY2tLsHOwLtpFthBn12E9cFCocyX48V/1tJv9VmCt/cb7q7/mQyxSc7yGin/+N9
	B8qnohKSOsWw+Xlwg5PP4SPEGYkivlgakq4DFKbyC/6zuzi3VP15B4d3d2Kq1xIuWmlhL4qtBXc
	j4Ni0ODNv5qV6wcdyk1UUH0j6C0C0x
X-Received: by 2002:a05:6000:2012:b0:439:b057:cb05 with SMTP id ffacd0b85a97d-439c8013c38mr9722813f8f.49.1772708250418;
        Thu, 05 Mar 2026 02:57:30 -0800 (PST)
Received: from linaro.org ([77.64.146.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b1116698sm36669170f8f.16.2026.03.05.02.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:57:29 -0800 (PST)
Date: Thu, 5 Mar 2026 11:57:14 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Xin Liu <xin.liu@oss.qualcomm.com>, konradybcio@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Add remoteproc in EL2 device
 trees
Message-ID: <aalhik53l4ioxiLx@linaro.org>
References: <20260202055436.818098-1-xin.liu@oss.qualcomm.com>
 <ao4jf5guszon6iuyyvzmkuaf2iaa56y3b33srx2w3whtyo2u3r@k74fxy3ktsyo>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao4jf5guszon6iuyyvzmkuaf2iaa56y3b33srx2w3whtyo2u3r@k74fxy3ktsyo>
X-Rspamd-Queue-Id: 3E86E2102C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95608-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,qualcomm.com:url,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:16:55PM -0600, Bjorn Andersson wrote:
> On Sun, Feb 01, 2026 at 09:54:36PM -0800, Xin Liu wrote:
> > All the existing variants Hamoa boards are using Gunyah hypervisor
> > which means that, so far, Linux-based OS could only boot in EL1 on
> > those devices. However, it is possible for us to boot Linux at EL2
> > on these devices [1].
> > 
> 
> Lots of people are running Linux at EL2 on their Hamoa laptops, but
> then there's no PAS. I presume adding iommu properties won't "hurt" in
> that case, but can you confirm that with this change remoteproc is fully
> working somewhere (i.e. [1] refers to a firmware for which the Glymur
> PAS/PIL changes has been backported?)
> 

On the contrary, I would expect that this will break the existing EL2
setup people have on their Hamoa laptops. I have last tested this half a
year ago (and I don't have a suitable device for testing this anymore),
but I don't think much has changed in this area:

Since we can't start/stop remoteprocs without PAS, everyone using EL2
with the old (non-PAS) firmware currently relies on remoteprocs that are
already started by the boot firmware before Linux is started. This can
be just the "lite" ADSP that is started by UEFI for initial charging and
USB-C detection, or even the full ADSP/CDSP via a custom UEFI driver
(qebspil [1]). All of these will stay running even if we fail to
stop/start them via PAS. Without extra kernel patches, we can't make use
of the remoteprocs, but the lite ADSP firmware will probably continue
doing its work in the background, i.e. it will start/stop charging as
needed, you just won't be able to observe the status from Linux.

We manage the full IOMMU even when there is no PAS. The reason why
people are not running into issues is that the bootloader handover code
inside arm-smmu-qcom.c qcom_smmu_cfg_probe() configures bypass for all
SIDs used by the boot firmware, which includes the SIDs for all the
remoteprocs. Adding these SIDs in the "iommus" property of an actual
device will replace the bypass with a translated context, which
currently won't be set up anywhere for the non-PAS use case.

In addition, even on newer firmware with PAS support I would expect that
special care is required to "atomically" handover the IOMMU
configuration from the bootloader. If the lite ADSP remains running on
these firmware versions as well, the bypass or suitable mappings must be
maintained until the lite ADSP firmware is stopped.

Glymur does not have this problem because the same functionality is
implemented in the SoCCP, which does not have any "iommus" defined
(managed as secure context banks by TZ?).

[1]: https://github.com/stephan-gh/qebspil

> 
> > When running under Gunyah, the remote processor firmware IOMMU streams
> > are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
> > by the consumer of this DeviceTree. Therefore, describe the firmware
> > streams for each remote processor.
> > 
> > Add remoteproc to the EL2 device trees to generate the corresponding
> > -el2.dtb files.
> > 
> > [1]
> > https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> > 
> > Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Fix the adsp iommus mask
> > - Link to v1 : https://lore.kernel.org/all/20260130073113.3091884-1-xin.liu@oss.qualcomm.com/
> > 
> >  arch/arm64/boot/dts/qcom/x1-el2.dtso | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
> > index 175679be01eb..ee006742d6f3 100644
> > --- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
> > +++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
> > @@ -52,6 +52,14 @@ &pcie_smmu {
> >  	status = "okay";
> >  };
> >  
> > +&remoteproc_adsp {
> > +	iommus = <&apps_smmu 0x1000 0x80>;
> > +};

I have seen the ADSP trigger some faults with SID 0x100c as well.
I don't know what exactly that represents, but do we need to handle
that somewhere?

Thanks,
Stephan

