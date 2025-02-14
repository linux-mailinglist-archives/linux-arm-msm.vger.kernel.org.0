Return-Path: <linux-arm-msm+bounces-48023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 137F5A35DAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 13:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC21916AF0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 12:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE181261567;
	Fri, 14 Feb 2025 12:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgPgNxAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9175C22B8CF;
	Fri, 14 Feb 2025 12:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739536265; cv=none; b=GfNSxyInkQR7lTOAxCyjPJjJK4NtnpDOJz5uvt8JWjg9KOA7qoX8Nvs0fm08xGh9l/dDUMpmOcK9pDOfaZ3EptfZPGdZ4YdBwcE4n9IaZPxYOanUWG785NjSBAE14b/b4XjyLPonIw19Ulboz7BQN9p14ZdYDgJ4NiIaCrsUgts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739536265; c=relaxed/simple;
	bh=XVvR1UZVOeAsb4IoS3qSYew0K2L8dYRU8cdhlHhTJ84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcscHRuDkW5S9oCxGrP6oJZZ7ra9K18+2kYgSlY/1sUKtJZybAcOV4zKnaU2JF0HzeojeN301FA2XjrQVCbzNGjZYd02ZRGSrGdAJ9loyPHD29yjvkBrkY2h5FjcdA8rUvXq9i7I7z8JXifkhOD+Rr2N5+3yMS5+sWz/OatPU9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgPgNxAd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BFCC4CED1;
	Fri, 14 Feb 2025 12:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739536264;
	bh=XVvR1UZVOeAsb4IoS3qSYew0K2L8dYRU8cdhlHhTJ84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgPgNxAd6of1YhhLPS5KYtQRFixV9ttF5g0h8lktuoa7Y42fUiPwPMqLOduemYIf+
	 08sgUtNsqlIMrFtZs//FCFBwma+6LIvZqQ8SZmfZBbHi84LDnz/L6a/He9M9HgP4aT
	 +dclcxn3686f5UUUzkeTA2ZUgHrn3DBpp9vSk88jFsrPEMYMDg3M+1a292rI+qDAJy
	 twIwGEH5JFPiTZVMRfktjzRXGUUagiiIy+gvqf/J9z+gmjZBljJRlwq0Og2Y3Rd7G/
	 Gz+8pnnPkbFTwvDX1kM5cWZTpj6TcLsObIUe0/izxhsRdKl3eyvUCX9wtu61J7r4+k
	 hLdsCd5yBglLQ==
Date: Fri, 14 Feb 2025 18:00:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH v3 0/3] Add support for USB controllers on QCS615
Message-ID: <Z683g5yuSu1Pi0pM@vaman>
References: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
 <173505391861.950293.11120368190852109172.b4-ty@kernel.org>
 <anfqf3jvh7timbvbfqfidylb4iro47cdinbb2y64fdalbiszum@2s3n7axnxixb>
 <Z2sJK9g7hiHnPwYA@vaman>
 <i7gptvn2fitpqypycjhsyjnp63s2w5omx4jtpubylfc3hx3m5l@jbuin5uvxuoc>
 <Z2sOl9ltv0ug4d82@vaman>
 <318620fc-e174-4ef3-808a-69fe1d4e1df5@oss.qualcomm.com>
 <f607aa9b-018c-4df6-9921-725693353f65@oss.qualcomm.com>
 <CAA8EJpr48k_tHKk-uVpAH7TMcp0-V97x6ztdFrbv0Go0a6kD2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpr48k_tHKk-uVpAH7TMcp0-V97x6ztdFrbv0Go0a6kD2g@mail.gmail.com>

On 23-01-25, 09:23, Dmitry Baryshkov wrote:
> On Thu, 23 Jan 2025 at 09:00, Krishna Kurapati
> <krishna.kurapati@oss.qualcomm.com> wrote:

> > > As mentioned in the cover letter, the bindings of phy have been merged
> > > from v1.
> >
> > Hi Vinod,
> >
> >   Can you help in taking in the patch-3. As mentioned in previous mail,
> > the bindings are merged and present in linux-next.

Can you pls post it after rebasing

-- 
~Vinod

