Return-Path: <linux-arm-msm+bounces-43763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1778F9FF17C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 20:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4873162571
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 19:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D611B0421;
	Tue, 31 Dec 2024 19:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMwhzSod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E7D188734
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 19:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735672703; cv=none; b=TPy0tQY5CJt6B3u7RYKXB066AovRqGXec02RvMRPbTABcs7wR9AUelqIyjcGcvIEY5RmrnxXRxNEZy6K08AXMbPmZzAt9Ma7eS18jW7CQcmrUJ+j28VpWoFdKyyCupQ8hvIOcO3bNfwSSjkLMAK7BfaeL4nT9LurdPLw93EoRtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735672703; c=relaxed/simple;
	bh=aPqMbBfY5fW3rzgHnVZF/pigaC9qgH43CdSFzjjmBVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oq1bWYbe/ljoD1g+30ghNPrShmiHQZRB6TXccJcLV1F1XFrOzIUcoSALooINAJtxJXx0W5MjH069vE4cw6P6mnwD+xuayfQRZ0dUPvOClsRp/lK0vpObJ/nH7bD0WGZCbsAM0sW5IxWE7wsiomWjnfzI8K4nk6GH+BBl5LtsEMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RMwhzSod; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2166360285dso137437625ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 11:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735672701; x=1736277501; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l0+QRsi4faohpdpoddCuIVJui/FEljbG64vvaRPyGpg=;
        b=RMwhzSodMd6jVWVJxAFDSNNrvI7LKWJKYIZKvTr4W5JWeR19bXb16FtPccG8etuSRy
         J+xOCrfZwu7nCDEEawlKMijqrEHmHBcnNOytJybWjRdsINJdHJm24o0Ow5pJCHkV+32f
         e/X0ztQKXOG8pNPIsHrubpgdN8bHBkO01Vs/aTqKlqr7IQhF117WXXJqttdR0W9dBxqh
         2VtjEZf1ww2MDNnWyvyo/L5NGdyhN6VTSSqfyhLmESti5NTa7Vkkn8u/EEcopOXJ7f2s
         YEO2VkQjEcECTgVi5zwcvaqNV9CS9fETclLFrwldLr5ZzQM+XusyFfwtiRqRscr5//d2
         bhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735672701; x=1736277501;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0+QRsi4faohpdpoddCuIVJui/FEljbG64vvaRPyGpg=;
        b=kT4sFUijfZ+B2BOA1uihJPuZ3RDvfXkZNSOwLD0vvbu8hFcOXOmxFN2xbY7POKfr9I
         Wtx1Qi6qy3+H4qcZqeTosYfsb0HsaU8ZREIbwmF9a7ZF59C7QeiDo2rnwxW2dklVIVS+
         Xn0ClGhL7MYAymn8W+TXkRT3Uxso0Dvt66HjM1aGCA59Umr3Wpba42bQ3id1mPYQ0yiX
         9bnSX7qfeIAmdCvz0BV1wiPePEvtZEJZ6MrYThPBDAp27bVJq0BLmXwCS2mMD2x2eBDZ
         8DYIgWodJr0d7AyTD5nU+MA3VVX51QeC3ZbWQ1SXOIb7S0EkVQ532XLeq6EmI+7zlRJP
         KzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpmIixv8504Rbc7/91g2MXGv34BpID5gdsUYqd+3FFePv/DTodAoE8oMakdh5SOn5qWBKg98zJTQTrq/mu@vger.kernel.org
X-Gm-Message-State: AOJu0YzPjih6GKbqwKzE5vIi8QjaahwuPTekeCyih9gdMFIFduJfDT1e
	ZG7oaKAZnpl6leGD0pFLS/BWmFV2madT9ggbRaQO9vnZq1VdCIkJ77oYDOdiCQ==
X-Gm-Gg: ASbGncud+WPDhYCSbsKbba1g2KT32JfZCmhtFQZb42DqjgleXj/u+lURn/3Nvc71uGv
	5mohEMDGxZ2yzotTHv8ER8Ziiw5LXjG7RPOyaURuIwZuT5i3/GKYcrQiud78lMffzK3PnjiQ/eQ
	dCbv3YY9gpVX8TggDz+Mab7EbWEkegHVqzcTf/7tCSMQ+HUZ1QUFoLv2W8w9EoPhKxPneqoWvPV
	geW6WeEFQQY3QR0HOfytxcLOq8Rd1ws+wymdv/D/vCjKI/+QxFT0jiRmd/yrz+j+TpwPQ==
X-Google-Smtp-Source: AGHT+IEUm1zUGZXxP9GXcESaLWkUc3wfuK/rGyZ/6Rx+afzKAVZtsXe72MP0qLBLskFosFkPCEeHgw==
X-Received: by 2002:a05:6a21:2d07:b0:1e2:5cf:c8d6 with SMTP id adf61e73a8af0-1e5e080ba76mr54796220637.36.1735672700798;
        Tue, 31 Dec 2024 11:18:20 -0800 (PST)
Received: from thinkpad ([117.193.213.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbba0sm21955590b3a.107.2024.12.31.11.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 11:18:20 -0800 (PST)
Date: Wed, 1 Jan 2025 00:48:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: kw@linux.com, gregkh@linuxfoundation.org, arnd@arndb.de,
	lpieralisi@kernel.org, shuah@kernel.org, kishon@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	bhelgaas@google.com, linux-arm-msm@vger.kernel.org, robh@kernel.org,
	linux-kselftest@vger.kernel.org,
	Aman Gupta <aman1.gupta@samsung.com>,
	Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
Subject: Re: [PATCH v4 3/3] selftests: pci_endpoint: Migrate to Kselftest
 framework
Message-ID: <20241231191812.ymyss2dh7naz4oda@thinkpad>
References: <20241231131341.39292-1-manivannan.sadhasivam@linaro.org>
 <20241231131341.39292-4-manivannan.sadhasivam@linaro.org>
 <Z3QtEihbiKIGogWA@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z3QtEihbiKIGogWA@ryzen>

On Tue, Dec 31, 2024 at 06:42:42PM +0100, Niklas Cassel wrote:
> On Tue, Dec 31, 2024 at 06:43:41PM +0530, Manivannan Sadhasivam wrote:
> 
> (...)
> 
> > +	#  RUN           pci_ep_data_transfer.dma.COPY_TEST ...
> > +	#            OK  pci_ep_data_transfer.dma.COPY_TEST
> > +	ok 11 pci_ep_data_transfer.dma.COPY_TEST
> > +	# PASSED: 11 / 11 tests passed.
> > +	# Totals: pass:11 fail:0 xfail:0 xpass:0 skip:0 error:0
> > +
> > +
> > +Testcase 11 (pci_ep_data_transfer.dma.COPY_TEST) will fail for most of the DMA
> > +capable endpoint controllers due to the absence of the MEMCPY over DMA. For such
> > +controllers, it is advisable to skip the forementioned testcase using below
> > +command::
> 
> Hm.. this is strictly not correct. If will currently fail because pci-epf-test.c
> does:
> if ((reg->flags & FLAG_USE_DMA) && epf_test->dma_private)
> 	return -EINVAL;
> 
> So even if a DMA driver has support for the DMA_MEMCPY cap, if the DMA driver
> also has the DMA_PRIVATE cap, this test will fail because of the code in
> pci-epf-test.c.
> 

Right. But I think the condition should be changed to test for the MEMCPY
capability instead. Like,

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index ef6677f34116..0b211d60a85b 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -328,7 +328,7 @@ static void pci_epf_test_copy(struct pci_epf_test *epf_test,
        void *copy_buf = NULL, *buf;
 
        if (reg->flags & FLAG_USE_DMA) {
-               if (epf_test->dma_private) {
+               if (!dma_has_cap(DMA_MEMCPY, epf_test->dma_chan_tx->device->cap_mask)) {
                        dev_err(dev, "Cannot transfer data using DMA\n");
                        ret = -EINVAL;
                        goto set_status;

> Not sure how to formulate this properly... Perhaps:
> Testcase 11 (pci_ep_data_transfer.dma.COPY_TEST) will fail for DMA drivers that
> have the DMA_PRIVATE cap set. For DMA drivers which have the DMA_PRIVATE cap
> set, it is advisable to skip the forementioned testcase using below command::
> 
> > +
> > +	# pci_endpoint_test -f pci_ep_basic -v memcpy -T COPY_TEST -v dma
> 
> Is this really correct? I would guess that it should be
> pci_endpoint_test -f pci_ep_data_transfer -v memcpy -T COPY_TEST -v dma
> 

ah, typo. Thanks for catching!

> 
> (...)
> 
> > +TEST_F(pci_ep_basic, BAR_TEST)
> > +{
> > +	int ret, i;
> > +
> > +	for (i = 0; i <= 5; i++) {
> > +		pci_ep_ioctl(PCITEST_BAR, i);
> > +		EXPECT_FALSE(ret) TH_LOG("Test failed for BAR%d", i);
> > +	}
> > +}
> 
> From looking at this function, will we still be able to test a single BAR?
> Previous pcitest.c allowed us to do pcitest -b <barno> to only test a
> specific BAR. I think that is a useful feature that we shouldn't remove.
> 
> It would be nice if we could do something like:
> # pci_endpoint_test -f pci_ep_basic -T BAR_TEST -v <barno>
> 

I'll try to add it.

> 
> (...)
> 
> > +
> > +TEST_F(pci_ep_data_transfer, COPY_TEST)
> > +{
> > +	struct pci_endpoint_test_xfer_param param = {0};
> 
> This (also other places in this file) can be written as:
> struct pci_endpoint_test_xfer_param param = {};
> 

Ack.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

