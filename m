Return-Path: <linux-arm-msm+bounces-70835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AADB356B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 10:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92B833AF33A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 08:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35102F8BFC;
	Tue, 26 Aug 2025 08:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r/V9QG96"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F14C27AC45
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756196669; cv=none; b=YKmhwTRMzg8PtVKYu/dhefCwr8VXze/dUzoq/MhhcRJWDML1Jo5hB7QmO7kz/vCbgg4WS+cOBLUAxru+G2jJXAIT6wmUXN655W84FZgqaOcL6sjHzFgFBdiZMaMslrGs0l6Hcu5O8/rJFd5JETP3vhh8hc+0k1sXQCoLVanxDqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756196669; c=relaxed/simple;
	bh=zkOhKSUhdYkMOEaqDdeq+hV7jrlqNbHyofVtEE1X+74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfT3P9Axje6mIvqw7J6xAfbI4FhnI1XP4+dDGU1SQ/uaQ/eqMxxvNWpVRRIDndKVp3eYCHQGPHiXrKTaBsuDI+6H6ZYKO/+3K8taR1JqhIjzhlOOPdQO/bV4Mk3WIqHLt4w0qh5uATiEwiDczAcX1NZt133lFvwCBLIkDlox4Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r/V9QG96; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b49b56a3f27so2845090a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 01:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756196667; x=1756801467; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BVPH5Gl2Q97fpNbb5mZdeF+VpN5uCzs/BvvvIML5Rqo=;
        b=r/V9QG96KuMwkTogBTFK5on7rVRDUxUw8QoaJRTEl6NrRRstK+V7p7/y7xt/blbIOD
         RhfxRyhSJBD8De9hpMat3ZOmBSQzGJsrLuWiAzoAZVJqLMMIPIWl1KFCjqlOHEUP8x0a
         zAOWud0+IT9cfKLxX3KbuNyd8Ygtrf5EEdi5N12ASVGMfWFCj7lBpvg3Yq3S2bJAfluh
         3xAXDy0pCD9DDSuelt57b5bQLoJ6SOoJ/Qmb3uyQptxIadtu2PTr+a6iHxj1fGBK51KA
         MHMAylBB8ZiLzg3JTcJittD3+JJRIg7cUN3aCnlVgV7r5wSuM8bk3Xsjq63pb8V2oj5c
         /avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756196667; x=1756801467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVPH5Gl2Q97fpNbb5mZdeF+VpN5uCzs/BvvvIML5Rqo=;
        b=mYL0vlOxFWGIlDe1ypMxXUC5fth8cCiQ+o+hlPxzyyAlhABOjJ01s3PMWTiP9DwjWx
         9eVF4nvgtuwo8wfciSw/lkdH7ZRE2ub3frhJkH5ZSCtjJZdHZGdJ9Hp8PG5V6r/tWQzR
         w0zrQ3uFvoTgN2mCgkFe4GjSMJayV+krR8Ox4YalkHEZNOmWrU/a+5PJF99a3oFMbz6S
         849QbmDnU44Pdz2TL1HquGQPvbirFh5Wzi9C4SyA4uGqjgzDXr8GFxKaZSqfCU90XRiT
         eYHpzreHrxCXrY5ib23Xl3vNzOi81Qp0TL6EVHX+aXBriZ6NaimOHH+gmOEtj8Kiz6Dj
         IUPA==
X-Forwarded-Encrypted: i=1; AJvYcCUDIZVNBbSp5mNRqrr88/Ya+vfP0v7sZAVGKYVNT8Z9q5kz4menctVIuvaZnLtqPVMYCXRLuiY2Z6p9VfUt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoc/PuvFcV0wJJlJ8uHxl0GUaxeQdz1yEa2DytJRcijtFa8Xpm
	tYKrrbhKIXH7CsRiLLurABemX+j6pUMpjce462DfPqIaYEQCeum2Hg6/tamoV4Fk8YU=
X-Gm-Gg: ASbGncvJUvCzz5q51aoLpSLpbwLMXjxjybXmVYm2db9JdktL0fZvejGJOEWziV5BvTF
	NfXzb7KHKoTz8+7pxCvVPrx6PwOH0u8bfFqzG2x1lSXgZi68RRnZCtHWePs7BFU4uwza/jQJ00Q
	dHk6vAl2+T+Lwp+BkrjGXirSFOo9TpfCY/avtcGeRxZcctVbAWYzHK34NmsvMvZNX9fCPC4gTv4
	B8JdIJqjTyW3wdwHDUXL8CvJonz7oAhJgpF2IXrt13UEOz5qb5k4c9/fe5KQz4eAbCh5ZWcXoxb
	gt4XorF+2tir/oMs1yrWRIb6V0zS+BL8SL8qXA94/BJX2SvRYUTVV+ZKkziJc0G7pBY90PW+Q+s
	xgKLfBLEjt/mLme0MYlNamJet
X-Google-Smtp-Source: AGHT+IEZHD4aC/mODzgvmtEKSdmKP/ZP99JsYLoYV/vczHAIOiPdaxjm/pWCet0LfwP2k78AerheMQ==
X-Received: by 2002:a17:903:24f:b0:242:9bc6:6bc0 with SMTP id d9443c01a7336-2462ef8e7c5mr179683875ad.55.1756196667512;
        Tue, 26 Aug 2025 01:24:27 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466885ed51sm88411645ad.85.2025.08.26.01.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 01:24:26 -0700 (PDT)
Date: Tue, 26 Aug 2025 13:54:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/7] OPP: Move refcount and key update for readability
 in _opp_table_find_key()
Message-ID: <20250826082424.nnma5oafc7axhep6@vireshk-i7>
References: <20250820-opp_pcie-v4-0-273b8944eed0@oss.qualcomm.com>
 <20250820-opp_pcie-v4-2-273b8944eed0@oss.qualcomm.com>
 <CGME20250825135939eucas1p206b6e2b5ba115f51618c773a1f37939c@eucas1p2.samsung.com>
 <4066c0b4-807f-401e-baaa-25f4891f10ac@samsung.com>
 <20250826060647.7eerg5blx3xho27p@vireshk-i7>
 <d8599b11-66dd-486b-89e4-52b82d90f04e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8599b11-66dd-486b-89e4-52b82d90f04e@samsung.com>

On 26-08-25, 09:26, Marek Szyprowski wrote:
> This doesn't help. I've stared a bit at that code and did some tests 
> and it looks that the issue is caused by _opp_table_find_key() returning 
> the last opp from opp_list without updating the *key and calling 
> opp_get() for it (happens when compare() returns false).

Ahh, right. So `compare()` may never return `true` and in that case we
returned the last OPP of the table earlier.

Thanks.

-- 
viresh

