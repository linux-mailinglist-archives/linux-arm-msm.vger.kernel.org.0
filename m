Return-Path: <linux-arm-msm+bounces-37149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D24D9BF3FB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 18:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DA601C23775
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 17:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5F4206515;
	Wed,  6 Nov 2024 17:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N/DgUSiY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688722064E4
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Nov 2024 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730912942; cv=none; b=mhhEAKxWqrPT6ZQ1PPzIu22TsDY7ZUtiWMKHmHBhRmU/9vaY8Grn9mQuf1dDlx8ABX3bcL//bjfAUy2aPBCLO+uPvFL9A0LSQ/KBpB3OO80XzQ8SOoZdreBL92DxH622tyfvvJ073n1O+ECIV4/Pccljl72jq178USCCMcq4u4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730912942; c=relaxed/simple;
	bh=lUtU6exFV/0t2K0nFD83dUTyPPvOKmzMlR2+lgOJ6QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jF9dKoI9kxDnrYYmRH8E/zLv+rMLLkC67yBiSHfs35IZIlIpwUnpCmEThxJJhqUmyMW9WFdxW0IviR4t34qnECg1utk2uY5ZeXir+DhJDgnsImPJ3Pq5sHOc4s85xsJftvFJ6ACTydzswavvFODSvywxeewcusDNbsadfxwNOxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N/DgUSiY; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso1101680866b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2024 09:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730912939; x=1731517739; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J6eDnsApgHXXX2eNqrPT459Y8vwvHutnUiY5z69lIwY=;
        b=N/DgUSiYMBtMsnL5i8eVB2h80AVSJN8YVrvFJ6hlbM7bTXRyFZ6mRy34idwiM6e38r
         qGyaYmyVk7AXZcP5/MSztof2avfE8zMptzoyw1c7pWk1Su10jnFHvo0gwDln3plN6HnS
         T8leGnJGsU0DuZ+xszb0tprfC3ms0FLrJ02fdjPK0ybj4kC81B4yJT5+bvzENa3dfAMi
         eO4SzIA+1iZTDtkbT1c891hZgxJI9i7qNB13dJuFv6qVfeqBPD3MdTCce/b4KTkpNlyp
         cnCoHAL9x6YFYuj5oySeRQvpdC9bmkqfrY2iyTUWODRBAy5p5A8XtlZ5FhTxMKa+zQmy
         4sIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730912939; x=1731517739;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6eDnsApgHXXX2eNqrPT459Y8vwvHutnUiY5z69lIwY=;
        b=GeNbaF/q8U4Ktuvk5J8qq0X+/hNTVpml5xGmkhqbz+lr4+HTabqiZq2xLYL4szsXxv
         ejAgpqSItDehWH4j/X6SHd5Ef/jFKXpe74TXYvgphZgnb0w/HuzxKPZtgq1ZJGMVaP2j
         /lDL4z3Z9Ty+e01GqwsQIsHmX0nQQ4uXSZZHOl9FcbbKPboxhy3gJ3To/ps5jX6owsIF
         99WkcgZCvSF8voIpck7iF2FBRoHCl25i0MgtAsY2Um7TzcByG4kfTnh5zE4lmac8cPbR
         UBLn6Xe/9BuFnjLWmRe/PX8GbXcUTIeddk+AG/pgTQe+hthFvyDW7JYbzVI2m6zO5jB/
         B+vA==
X-Forwarded-Encrypted: i=1; AJvYcCX7p0yf+a1ibA42VLfaDgsSgLdobexza0+1GR82ouGHBbHBP3NAfufA+KwWPMYRoRM1hS2jimw/RJXILywL@vger.kernel.org
X-Gm-Message-State: AOJu0YxJIr5rkqvrMPj0aWnZntdHdhmHXeeyiCB6yFRZs13vAmu3MMnO
	EqFnPt205FWTFPj/jut/T41/4KVDxryr6Z0r1RbmXTPbu3PUJQRdTgIOzICd9A==
X-Google-Smtp-Source: AGHT+IFuDYP4MNuKTvCz+cqkpbEel3mPAHGXPas8WurjLlxHRsA6YcT5W5N/fyHtAoT/QJOJ2VQgxw==
X-Received: by 2002:a17:906:7305:b0:a9e:c267:2040 with SMTP id a640c23a62f3a-a9ec2672423mr402543566b.51.1730912938575;
        Wed, 06 Nov 2024 09:08:58 -0800 (PST)
Received: from thinkpad ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2ec7sm311191266b.22.2024.11.06.09.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 09:08:57 -0800 (PST)
Date: Wed, 6 Nov 2024 17:08:56 +0000
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Sricharan R <quic_srichara@quicinc.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V7 4/4] PCI: qcom: Add support for IPQ9574
Message-ID: <20241106170856.7iv2sjmjwyhnurps@thinkpad>
References: <20241106145615.25tc7n4zcdkp47jr@thinkpad>
 <20241106165312.GA1528877@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106165312.GA1528877@bhelgaas>

On Wed, Nov 06, 2024 at 10:53:12AM -0600, Bjorn Helgaas wrote:
> On Wed, Nov 06, 2024 at 02:56:15PM +0000, Manivannan Sadhasivam wrote:
> > On Tue, Nov 05, 2024 at 07:40:24PM -0600, Bjorn Helgaas wrote:
> > > On Thu, Aug 01, 2024 at 11:18:03AM +0530, Sricharan R wrote:
> > > > From: devi priya <quic_devipriy@quicinc.com>
> > > > 
> > > > The IPQ9574 platform has four Gen3 PCIe controllers:
> > > > two single-lane and two dual-lane based on SNPS core 5.70a.
> > > > 
> > > > QCOM IP rev is 1.27.0 and Synopsys IP rev is 5.80a.
> > > > Reuse all the members of 'ops_2_9_0'.
> > > 
> > > Wow, this is confusing.
> > > 
> > > "Based on SNPS core 5.70a", but "Synopsys IP rev is 5.80a."
> > > Are those supposed to match?  Or is it 5.70a of one thing but 5.80a of
> > > a different thing?
> > 
> > Hmm, I'm not sure why 5.70a is mentioned here. It seems irrelevant
> > (even if it is the base).
> > 
> > > And where does ops_2_9_0 come in?  The code comment says:
> > > 
> > >   /* Qcom IP rev.: 2.9.0  Synopsys IP rev.: 5.00a */
> > >   static const struct qcom_pcie_ops ops_2_9_0 = {
> > > 
> > > which doesn't match 1.27.0 or 5.70a or 5.80a.  In fact there's nothing
> > > in the file that matches 1.*27.*0
> > > 
> > > Honestly, I don't really care if you have all the versions here in the
> > > commit log.  But if the versions *are* here, can we make them make
> > > sense?
> > 
> > We name the 'ops' structure based on Qcom IP revision. And we reuse
> > it across the SoCs which are compatible. That's why ops_2_9_0 is
> > used for this SoC which has Qcom IP rev 1.27.0.
> 
> Got it.  So a family of compatible Qcom IP starts with 2.9.0 and newer
> members are 1.27.0 etc.  With no hint in the source about what the
> members of the family are.  Perfect sEnSe.
> 

You can get that information by mapping the ops structure with compatibles. I
feel less incentive in documenting the SoC names deriving the same IP.

And the reason why 2.9.0 ops is used by 1.27 is because, we ended up adding
support for 2.9.0 IP first and the lower version followed later.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

