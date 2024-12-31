Return-Path: <linux-arm-msm+bounces-43761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 626B29FF160
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 19:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13D9A161F43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 18:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE431ACECA;
	Tue, 31 Dec 2024 18:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KF6hU9H2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935F5188734
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 18:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735671252; cv=none; b=PJTUAkWvO50u1cHoY5+PugMBpFFr9BXI986TerPnNsykno8jzDkDWWjaCdrXJg/BDEe2evP/yRVpvKT4ZWt2w0bRkvMbC40mQ8gg89vAuCKbPVRZUo/PaDTYFATODNOGH1GNAAxiPp74SQF3Gl9osnNoiUm4vCvvlLrFimq5Saw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735671252; c=relaxed/simple;
	bh=AJEFAVzL/HbqcoiQ8tXYXqgWMHWVQ06bY4THGwNBmyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dl5RycB/MBJ9wS3BjfGgg0wCIVVrl0sGIkjN1orGn5MlS74DZeshC2QoIjFmUjaA5DkV4SFKd3IimEDWx14DEBTmQFW+SeAs+1ZXPtx7rJ1aLVMyVoHJgyb5LlDcu7dERVd0dR3kjzWZ07DkI1fPEAOGvSAr8hUvpzrBNVULDlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KF6hU9H2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2166651f752so156565655ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 10:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735671250; x=1736276050; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ua/yw6V8Q4CSnKq963SOOaPsasHaAarnVdaMbju8qdY=;
        b=KF6hU9H2j7UInyfm027e4ksqRwb3iVaihqDixEBrVB0CNsmHi6zJS8mM0bOc3YAOnm
         hOubhihEW2N/2q0ebv5LYf9PvUsjZhWG15QRvjHJ6kZ9j5xwWBL/YXP2HU3IOB+NEpX2
         1Z67ND/kDG96HrqIsKeALn8H7E4LDoon5XjXOUD+KS1PUlANw/SFryrXhiS2vA50/8AJ
         oio1WLoaVMvP3Nj9H7f2xAsI9hjCaf486nxMalzEf0cICNr4SkymcjDyo2f91JzS5HIc
         gQPChRNWpOJ8xSxKxg67Wa1ntS/LbvsFrfku5yXJGrXUYJdmlTecwsS3UKLVj5VRuYic
         q0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735671250; x=1736276050;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ua/yw6V8Q4CSnKq963SOOaPsasHaAarnVdaMbju8qdY=;
        b=HUZ9GYBXDnfjQ35zbtMcrtchLKzIdz98KXtIycfoSohbMjxoyhtoDEJh3MzreLOL7Q
         JBVQQ6uKFq9LsTufuht0pt6J9GzCt4sdodz8q1NFo1MUqD8t76YgONG0QME94oI+tDuB
         ajpstAQutxXzRh1RI3JhSHiEcM6E+Q9N5EelkxICK2Q5PjrAHMsMNspQ+BT+jsAcbHOU
         TUgrygMUAuRmB/bhmrUE2GWwMvw9VBY4XMjBh1h366nuh2RG9H/U3xbWyujnNt53dewM
         sGkP0RH+7BNPzeQxUk2QnTJpMz6P49mb19oaxJFy0ajfAeETALG+sgWgFpAR79UMV5nE
         EhDg==
X-Forwarded-Encrypted: i=1; AJvYcCW3c9Gong29LQ0LUIJ1PxwpM17Mm7eDQgk/DTxJl4IRajqRxqoAhDLn/eT7frddskWxXcmH+pPeWWnQrICH@vger.kernel.org
X-Gm-Message-State: AOJu0YxaBpTebX0LhVGPR3ffFNdJiVzHxOwlog9Pp1TbWO9SE091F7zy
	qDIGX/0h+IhVEyi89DBbazU8UPx5bOGdONaXoLqRzBrSWlrJaq0IT5dx1glRlA==
X-Gm-Gg: ASbGncvzmnqNaCRuPgP3fTlAGRloJ/4vComqViDaLkZWkwtJF8C+xWKkqayOUN574KA
	xDC8ECVa9iFCNZT5vyqqdfd9HVFUWGdg8rXs0To4Otb3lRQ/UA55P8YHxJgVa2VdCxkSMqO6iCN
	2YhpZ07ztRib38PlfEVLbXv6F/BNiIOLZZNasDVFEayEbZUIQwEkuliCuZScKYnnSoNVUYlRJjY
	LxvmYRgdQxqNNUAo+1hHAuWUA9ZeWwtFhV1u3xiDr2s6d7c576L06Mnl6wVkcfmXrgDCg==
X-Google-Smtp-Source: AGHT+IHii1qezFhDHOKljpGsqj4ki15dTKkn+b3lPak25MTzh3DjlarAmgatBnyU5d76VwQJDJheiA==
X-Received: by 2002:a05:6a00:23ca:b0:725:df1a:282 with SMTP id d2e1a72fcca58-72abdd7f65fmr50539277b3a.10.1735671249856;
        Tue, 31 Dec 2024 10:54:09 -0800 (PST)
Received: from thinkpad ([117.193.213.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8157d7sm21926176b3a.21.2024.12.31.10.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 10:54:09 -0800 (PST)
Date: Wed, 1 Jan 2025 00:23:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: kw@linux.com, gregkh@linuxfoundation.org, arnd@arndb.de,
	lpieralisi@kernel.org, shuah@kernel.org, kishon@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	bhelgaas@google.com, linux-arm-msm@vger.kernel.org, robh@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 2/3] selftests: Move PCI Endpoint tests from tools/pci
 to Kselftests
Message-ID: <20241231185359.7dqhzxlmrdkcscug@thinkpad>
References: <20241231131341.39292-1-manivannan.sadhasivam@linaro.org>
 <20241231131341.39292-3-manivannan.sadhasivam@linaro.org>
 <Z3QnESese3Le9FP0@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z3QnESese3Le9FP0@ryzen>

On Tue, Dec 31, 2024 at 06:17:05PM +0100, Niklas Cassel wrote:
> On Tue, Dec 31, 2024 at 06:43:40PM +0530, Manivannan Sadhasivam wrote:
> > This just moves the existing tests under tools/pci to
> > tools/testing/selftests/pci_endpoint and adjusts the paths in Makefile
> > accordingly. Migration to Kselftest framework will be done in subsequent
> > commits.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Why not squash this patch with the subsequent patch that actually
> converts the tests to kselftests?
> 
> If you just apply this patch, then we have moved the code to
> testing/selftests/ but the tests are not actually kselftests,
> which doesn't really make sense IMO.
> 

As I mentioned in the cover letter, this was suggested by both Shuah and Bjorn
to preserve the history:

https://lore.kernel.org/linux-pci/b2a5db97-dc59-33ab-71cd-f591e0b1b34d@linuxfoundation.org/
https://lore.kernel.org/linux-pci/20230117195903.GA142672@bhelgaas/

- Mani

-- 
மணிவண்ணன் சதாசிவம்

