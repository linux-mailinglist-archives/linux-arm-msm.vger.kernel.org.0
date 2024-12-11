Return-Path: <linux-arm-msm+bounces-41450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 786F09EC8D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 10:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3BF01881E4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3AFF233682;
	Wed, 11 Dec 2024 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cVhqyONZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EBB233696
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 09:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733908790; cv=none; b=qAi0dqlez9BOEwqpADTE0nesBKDIDVVkUMKJnWVpN51uxsm/foDdVaC8eglWSmZPwUR3Lr5y+yU60oE2rjQ0de+eiGPPXzA8B8O9qr1WbXrPVAvO4N9Bmnovx3YBKCVbXd4O5cI56sgb/uWc6deSI3UefBFloGbljhP7wcyL+3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733908790; c=relaxed/simple;
	bh=Nrd4w96G4OwnKl7wub21+upzt6feQDyoodkaW5oT8e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3VV2yMWICpYwPggLe4ItLNuOagWyKm13a3d7X/6gGH8uo9uOWvOIOo1QG+RG46HtOyrAWYCPw6AbcnD0gnokILrhEKi2rutH9UOzeswye1T7bCbX6VeP4Gl8V+93Svsd1SrzZ64di8nGSpFGYfu755hRh32tM2YRtlmszVzatw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cVhqyONZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2165cb60719so23696495ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 01:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733908788; x=1734513588; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jISlUnIukU8aqEXKm4JlMEvLu3G/mv0ZsNNCoy+yQUY=;
        b=cVhqyONZMIs7MveC57Vq+ecu0QDs8ITWCS7ZO3z46R0leRmPZWQrWvVLWUtAE0l6PA
         lHlz0ysTsONEgYVGYXtKiS48s3P7dgB4YfAB6qNx9L2uHdiaVc9zqp/tOaB61Qf7GcWP
         uxyee5l2XtVrvgkY5fjalPSugXKVR1AqtKj7yW7A8w4LW1ckMjrEoZgM+ZEUw2tYQUBp
         7/47/YjViodQDNCVsiVRRgwzLV5tcMluaLyWq7vmN4IJWAmjnS+0B5ue7EBtsfU7XGgf
         uszvODrdvsZh+PETmcreSTZlbzum1rDIx714nuitpcEIz4n6HmqwtQJI90rnonhrGUvO
         Z0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733908788; x=1734513588;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jISlUnIukU8aqEXKm4JlMEvLu3G/mv0ZsNNCoy+yQUY=;
        b=P7oMPcVKn0/PeGrlxAvHteGedaTiYeGcURUFECCXHBYqjqxeGEASxEIPlTn/5Prd1w
         Mj07ZKYkj5Na+gj/xrimPs+3WroKNTplcYqwLl0++TetXac4nSsgCNmGqHOdbRDp6ShL
         O50JpSmlY6795YtrrAfB8BPj/GabjLfjmCOwFyu4P4azP+zl0fnvjjLiUUUAfl5+1ULh
         ex7l2HSKcCTFIdhyVzHm10VfUX5ExGdosM8zN+y8aSq7ug2XP0DBOXmqgMB6YD5vAfgU
         /r4ExsAuCCDVgmYEIcWAF5K86+cY8qjiGE7F3/+wExynJBZlG7W0WBVuOec+pRS/up08
         Z5Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVH/V5d44oZF0Y4SSGS3WW0bxjWo9IsK7Tkw7sF7KsfK6PeRAHQc5lzcDLE+oHE2n/TBCP53EJo+6AnYPkv@vger.kernel.org
X-Gm-Message-State: AOJu0YxqOP6KKZg5hnejSX1gdlGDrY4K8C2l7zr3D8HKc59Pqw+5r8Zm
	EP7WlDEyn1ND7GXk+9E1oIX2H0toPBQrwzSvxu9mjAJSD1XYyNj9A4/pmE/6fg==
X-Gm-Gg: ASbGncto9LWzVOkEKV86JKgqjcu7CWLcLQeipWyGtpoISyYXUIQylf143L5Z2YnfqIk
	FcKmmMSVkoF8BwK3KHALD1lTxjtdMrCiZQr4z89xrvifX7T62fVKP6DdUzT3/YkuuLcXW6+iCAs
	50+/tsiF/0v2f5+5qShueQq4Q7IK1Ocpagp4CnZrdV6WDW8idwXt4GuJ9VrKTt9QhNKq4/rWXcl
	WeXhaU/Xzjl8Ab9VVBr1FnFJFVZzVkeM1dc2nk7n5eIwOz6zzyzuIvkMStEt2o=
X-Google-Smtp-Source: AGHT+IHNQVHiF588qQyFZaDiwyTWpgFF8Tpa2WNPRhsYDfHuOLogBW5IXrutQHmldSb3jSTjxMVKhg==
X-Received: by 2002:a17:902:e848:b0:215:8809:b3b7 with SMTP id d9443c01a7336-21778397509mr29574975ad.7.1733908788591;
        Wed, 11 Dec 2024 01:19:48 -0800 (PST)
Received: from thinkpad ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216432f3809sm54411405ad.153.2024.12.11.01.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:19:48 -0800 (PST)
Date: Wed, 11 Dec 2024 14:49:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: kw@linux.com, gregkh@linuxfoundation.org, arnd@arndb.de,
	lpieralisi@kernel.org, shuah@kernel.org, kishon@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	bhelgaas@google.com, linux-arm-msm@vger.kernel.org, robh@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 2/4] misc: pci_endpoint_test: Fix the return value of
 IOCTL
Message-ID: <20241211091943.iwgv5etrod7mc5fy@thinkpad>
References: <20241211080105.11104-1-manivannan.sadhasivam@linaro.org>
 <20241211080105.11104-3-manivannan.sadhasivam@linaro.org>
 <1bd6ea1e-a5d7-400b-bed7-d9ff7163e960@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bd6ea1e-a5d7-400b-bed7-d9ff7163e960@kernel.org>

On Wed, Dec 11, 2024 at 05:37:27PM +0900, Damien Le Moal wrote:
> On 12/11/24 5:01 PM, Manivannan Sadhasivam wrote:
> >  struct pci_test {
> > @@ -52,63 +51,65 @@ static int run_test(struct pci_test *test)
> >  		ret = ioctl(fd, PCITEST_BAR, test->barnum);
> >  		fprintf(stdout, "BAR%d:\t\t", test->barnum);
> >  		if (ret < 0)
> > -			fprintf(stdout, "TEST FAILED\n");
> > +			fprintf(stdout, "NOT OKAY\n");
> >  		else
> > -			fprintf(stdout, "%s\n", result[ret]);
> > +			fprintf(stdout, "OKAY\n");
> 
> Why not simplify as I suggested to avoid all these repetitive (and ugly) "if ()
> else" ?
> 

I've replied to your suggestion in v2:
https://lore.kernel.org/linux-pci/20241211074757.byc5jqpgfe3otjh7@thinkpad/

Since the test is migrated to Kselftest right after this patch, I see no
incentive to simplify the code.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

