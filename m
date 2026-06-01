Return-Path: <linux-arm-msm+bounces-110678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKqjHITbHWpsfQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 21:20:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEB46248E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 21:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65D5F304699A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 19:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82AFF37BE6F;
	Mon,  1 Jun 2026 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="myfmX6/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED652D0617
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 19:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341385; cv=none; b=pO7oEmNx5mzAsFap9Bt62zJWa8vJt2zgoe/n9gzGKhr1AMs2ODE3MEX05Op8jUfSKknOkTTC/tjsrDSXfdAvDDHq8b0HGKlxbAObKUdrq5hmho+Lv08FRPhL2ro+KUcVm+opWsX+Rb+Zfx8wEGNI9R/qwqGZYJ1H7FtfDCU6rV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341385; c=relaxed/simple;
	bh=pfzOzaqWA/AH3npRNvlp0MxpAD4DF0Z7Hw40WYdOvag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1VNyvd7m5xQZTIcbKj4mOGaehxfX5OqN4Ukc24L3fVMPeNlaB+5sO555M1JVzrZfGQBKku+u4n1jh3UeR6j15qghLAeJw5wTBcyflgrnvEj0GAH10OFcGNOSQZUJn9iCbJ5t7bIejNv28r3gbAUlkrbdmudTa4Tvi9nV1bvlFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=myfmX6/d; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304cf518c9dso6728497eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 12:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780341382; x=1780946182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5YY0AKjuRmhN5jXS67K9oBDfInraYXWkuQQvtFh6y0A=;
        b=myfmX6/dok18af1IkfDaIQnFS4k6cfp0IZpwppNQTbz2Z63pDdrnH9ZyaTJ7Yj5udk
         hxaCijVoQBFOiVgfLKLhxKMWMtdAM1mKoT3ibWlEXa2/Z65EC74baiSCI/GB0ZlnCcwg
         UPiGVTOlda3krVqKEUqHlDgrgipPhmNZUQ2Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780341382; x=1780946182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YY0AKjuRmhN5jXS67K9oBDfInraYXWkuQQvtFh6y0A=;
        b=LUtkkNcxgJLd2fQK5fOr7G5VYmkSvm6JoNI4hheH9NPGv55plm7Z8/dEK72WAoAU8z
         Q7IraC6ty2XQkxNYekaUantoz80+zgA2wkwaUEPNB15XjOZCvw/cDEI/vu33WnqoJJQs
         64sA3tGlXjkV/vIcXRLt5Dbcd+icofZ9+vSr1NIhNVu1uRBAmbSFrZvmotCr8ktCtLXH
         CYeYvkb89GvoM/CCvkgKrCogXLWRX7NiRKtRBIz0Y89oB5v1D5O0xuiJc3RF6swLx1qE
         5N11x7WZcCF62vMfGdYaWzOy7cq7YCEKH01hWJ0/1MhFln8UFbq45YCAl02JZ6qviWxu
         ohlA==
X-Forwarded-Encrypted: i=1; AFNElJ+RY1U7aKkHOxCT7BlwfpbIZPmSDXdwPxoaqW3amZfOdsaOv31DYGxMsNgTYoSVDPnsXr1oIPjMLepgil+0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsls7aY2xou1pY7N2BlLiHYKNnMsv1Akmjv7V8QxZQ1XuuNhkX
	SOWjucpFOl1thfsCS5aF8cU/MWxfgbtdhMvmQKORDQaMcrrnAjqwSsoEA3AvstV8Gg==
X-Gm-Gg: Acq92OFx+vDgSOBh1JTNVVi65O+UndWjbacNL/PqFKFurXqMJkgYOowPyW878TNxXzL
	4GqCUU3bMHrebqGndaaLdNjW5Cv8YjQaRYLCAfxJQPpWePrcomBdC9Jn/7H+hLm1ZZ60f65qZhh
	EhAnb3N/kx5QCgJlqNKo/1/22QoTb3Uj9bwMenmAmysO43aDk5LgeIdL5n527Iyg/a65eL/cRKa
	Euzo/3r44jSc3m2XwCIB08E6/otf7vZT2eKxK2TI9AXOMDuZHrarllutghdsi6n13dm+U6BXMPW
	mNb2BYMwcMDUA8rzc2je1eG0R1r++niwdk8XpRlMLpAdk1VKO60/JvXmkSw9IOjneMXuvgngTTp
	7pZt4/BVU5JQNxGqgVaTe+68iLa063HwMf5I5VxWUFzaOeOkPa9APLNZH/407QGAgKnX4ZAOOkK
	gBlXKEsCrpnFD0H/4m0XxUUMn2NPWaKoZSnJxu+7EInZZG0K8KzxfF3yGi/ztoC3PXqbcuZd6Q
X-Received: by 2002:a05:7300:ef83:b0:304:9b48:53da with SMTP id 5a478bee46e88-304fa6438afmr5420329eec.26.1780341381977;
        Mon, 01 Jun 2026 12:16:21 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:d53d:3040:2c80:7717])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-304ee0dd8e1sm13033848eec.21.2026.06.01.12.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 12:16:21 -0700 (PDT)
Date: Mon, 1 Jun 2026 12:16:18 -0700
From: Brian Norris <briannorris@chromium.org>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH v2 0/4] PCI: Introduce pci_suspend_retains_context() API
Message-ID: <ah3agpwmcDfn9plX@google.com>
References: <20260519-l1ss-fix-v2-0-b2c3a4bdeb15@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-l1ss-fix-v2-0-b2c3a4bdeb15@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110678-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,qualcomm.com:server fail,chromium.org:server fail];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briannorris@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,chromium.org:email,chromium.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CDEB46248E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 01:41:19PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> Hi all,
> 
> This series introduces a new PCI API, pci_suspend_retains_context() to
> let the client drivers know whether they can expect context retention across
> suspend/resume or not and uses it in the NVMe PCI host driver.
> 
> This new API is targeted to abstract the PCI power management details away from
> the client drivers. This is needed because client drivers like NVMe make use of
> APIs such as pm_suspend_via_firmware() and decide to keep the device in low
> power mode if this API returns 'false'. But some platforms may have other
> limitations like in the case of Qcom, where if the RC driver removes the PCIe RC
> resource vote to allow the SoC to enter low power mode, it cannot reliably exit
> the L1ss state when the endpoint asserts CLKREQ#. So in this case also, the
> client drivers cannot keep the device in low power state during suspend and
> expect context retention.
> 
> And these limitations may just keep adding in the future. Without a unified
> API, the client drivers have to implement their own logic which may cause code
> duplication and may also lead to drivers missing some of the platform
> limitations.
> 
> Once this series gets merged, we can extend this API usage to other client
> drivers as well.
> 
> Testing
> =======
> 
> This series is tested on Qualcomm Hamoa based Lenovo Thinkpad T14s latop with
> NVMe drive.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

FWIW, this was already applied to pci/next for v7.2, but I'll add that
it seems this resolves what appeared as a regression in v7.0 for me when
using a Qualcomm SC7280-based laptop
(arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts):

report: https://lore.kernel.org/linux-pci/ahC8Pyuatu_AvnZp@google.com/
test notes: https://lore.kernel.org/linux-pci/ah3XLfI7E39B1UPh@google.com/

In short, my NVMe failed to resume from suspend-to-mem:

[   58.384442] nvme 0001:01:00.0: Unable to change power state from unknown to D0, device inaccessible
...
[   68.875606] nvme 0001:01:00.0: PM: **** DPM device timeout ****

Notably, this regression bisected to commit eaf290c404f7 ("PCI: dwc:
Enable MSI affinity support"), though I'm still not quite sure why.

Anyway, for $subject series, I'll provide my late tags:

Closes: https://lore.kernel.org/linux-pci/ahC8Pyuatu_AvnZp@google.com/
Tested-by: Brian Norris <briannorris@chromium.org>

