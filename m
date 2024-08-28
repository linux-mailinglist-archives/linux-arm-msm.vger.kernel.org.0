Return-Path: <linux-arm-msm+bounces-29834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACE4963180
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 22:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 970AF1F26102
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 20:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF781A7ADD;
	Wed, 28 Aug 2024 20:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndPtr8Vl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C3E1A4F28;
	Wed, 28 Aug 2024 20:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724876001; cv=none; b=NrN1Q6W8UUC9uQl4O3qq0UScoW6iIIfUDP4fnndQkgQqq2wbxsybr6ReiDwBYVGHRGfiPe5rbvyyIk3EbpekM0HRh7sAGxTd9f1pZ9EfUQ9K7ef8PpfDQ7jfk6O/Y09m6x1SmK5CUiyq5Lb4PipJL36TIfJHWAhyIH1hzBX8pok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724876001; c=relaxed/simple;
	bh=L8Fnmfdj7n7aQJAnTAYBZKRz1fHvl8Ier08c/7ESv/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSHURItuo3IRYUsxXeGjrvgzt37pZzrP6ekzN5SdxjgzUx2ng1TSOWLpqXKNO3C+UhfJKaHwGHKGqb+ZyW7vo4VX3NawihrlIhavL7DIt0tAhCsQDIZ2QXZaISAXpj1WatM0D3atQ3zCKu5dwtAcMuJ240gRgUoL7adFMaxNKzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndPtr8Vl; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-714287e4083so6365892b3a.2;
        Wed, 28 Aug 2024 13:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724875999; x=1725480799; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TV260ekv76Z44NQHwCNV9UcEwOB3aiUGPeS63SwTwQw=;
        b=ndPtr8VlZr61hjK8w96s1Dgd3gC/EGKuLnyzYNr9yrLgSiFouQ5Tq/l6vabfVz39sM
         bRvfVH25x7fhggF9QgluuBSmWGvgEhbzziv+X9x40d9v/oJbs3MwgIoDlBqd2BLkM6Ei
         mZwVP049wGzKh2R6lBoNm+5SToFDyehg4UaFi55aDwRHqLZJ1A37pkTJgS1w8ZBALxi0
         05ftEBlMFupi0zSfI2S/ZM9C2BKsHwy7VzTtqz5QWhttsUabUVYZrTJHWOz+5MKqna5i
         cKO8AHus1AgWB0lPZ3l5GUTNs7fay+64GgrFIAHJHZuTVzDsNm1mf4WVTFJLMWPwjvxg
         aa8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724875999; x=1725480799;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TV260ekv76Z44NQHwCNV9UcEwOB3aiUGPeS63SwTwQw=;
        b=LxLnsBfHynpkDqUmjyVZyG/YNXlS4JNLKtrMYez6ElyXq8RjXUoECLg0dqcvWcrXdN
         KQRwDnWezXcJ/Py95ywUXjR85DTbXbrhpwlr/nMM3nYuCTWb1BjFiFtdwZyXbTET/7JB
         hMvhUVg9YSFf7l5NRjikwI8lvGeCrBhcj2hVksiX25jbfZFYAUIf+xF4CV/a6a4XeDRT
         0bivGW7fH9u5petS5IOXH+31oPHJYK7/bIxHmk678gOybqmEXCiZcaRuMXjEaQKjepOD
         V9bpcvLIl3o8F3AocO622QwTl/ef4zZtiNBxtLab7UvS5oeuo6/lABtRlTgamLrQryXW
         PRPg==
X-Forwarded-Encrypted: i=1; AJvYcCUxTOrnwFAeDjQ+5mAKB2pNfCvR8E78jk7uKuKJX/Vw9l1j/rWHlbvHZPCFVi4i+mDi0mghVhh6aN6CLEXF@vger.kernel.org
X-Gm-Message-State: AOJu0YziMhaoDJS0nI0Pw9rbv8xchMBTVnptBKMQH3phw+6Dz8daGdfL
	zsojlQ0gpU1EMUgylr9WM9ivlyjpVlToTupr1FtIbDUmlhhkv2i4
X-Google-Smtp-Source: AGHT+IGntRMGRYmgcIIG9mehjQBu1/G2gfoPy7SuG7O5ha/wqT1t+DLsE6Ual9USMvlVYuwH00Xpeg==
X-Received: by 2002:a05:6a21:9206:b0:1c6:fa4b:3648 with SMTP id adf61e73a8af0-1cce10274a7mr628560637.22.1724875999130;
        Wed, 28 Aug 2024 13:13:19 -0700 (PDT)
Received: from eaf ([2800:40:39:2b6:f705:4703:24a7:564])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143422f6b8sm10886950b3a.15.2024.08.28.13.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:13:18 -0700 (PDT)
Date: Wed, 28 Aug 2024 17:13:13 -0300
From: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
To: Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-msm@vger.kernel.org,
	Om Prakash Singh <quic_omprsing@quicinc.com>
Subject: Re: qcom-rng is broken for acpi
Message-ID: <20240828201313.GA26138@eaf>
References: <20240828184019.GA21181@eaf>
 <a8914563-d158-4141-b022-340081062440@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8914563-d158-4141-b022-340081062440@quicinc.com>

On Wed, Aug 28, 2024 at 12:03:57PM -0700, Trilok Soni wrote:
> On 8/28/2024 11:40 AM, Ernesto A. Fernández wrote:
> > Hi, I have a bug to report.
> > 
> > I'm getting a null pointer dereference inside qcom_rng_probe() when this
> > driver gets loaded. The problem comes from here:
> > 
> >   rng->of_data = (struct qcom_rng_of_data *)of_device_get_match_data(&pdev->dev);
> > 
> > because of_device_get_match_data() will just return null for acpi. It seems
> > that acpi was left behind by the changes in commit f29cd5bb64c2 ("crypto:
> > qcom-rng - Add hw_random interface support").
> 
> Which Qualcomm platform you are testing w/ the ACPI? Most of our platforms
> uses the devicetree. 

Amberwing.

