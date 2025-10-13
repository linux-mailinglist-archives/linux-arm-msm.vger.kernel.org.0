Return-Path: <linux-arm-msm+bounces-76905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A56BD0F9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CC021893240
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE212A1BF;
	Mon, 13 Oct 2025 00:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="NOMei8n+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender3-pp-o95.zoho.com (sender3-pp-o95.zoho.com [136.143.184.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F781CA6B;
	Mon, 13 Oct 2025 00:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760314121; cv=pass; b=J/MSWL92o56vZgoeuXH5LPO3ZLOMAL1PjjA1pSVy+fUSBHuRAkcYoLZIFwmbnTOoRZjQ9bH66zTf4weCBMacoNNs3YobitjiFSCq9GaJxuYpohMxfbaQeoq73ySeUR+5Ridveeo0fCeX7iXVfXFu0CyY+vWMRFPvoWUObJIbXmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760314121; c=relaxed/simple;
	bh=Wi06P/Bn9/+iBpoHURGKN1pAxCoLMMdUIXdqzysP1m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JCz3/ARb5EtZkZuATNz4aRUxLrJpykEvSxXdNguIOnysyUgSqp0/jKHnx3gBZgHK6nP/RzojQJdud/V0aXgf5x+fbAIl8UKt1lP/M2W6e2nsOIrGm7mxHDbbHEjQ7sEj8ua3YfZTOuxmRNtUouOiAfTFR0E3KNOh2NK9XdgaXF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=NOMei8n+; arc=pass smtp.client-ip=136.143.184.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1760314106; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dzv3HwyObv7YfyMM/FmFOkH57jqOMdj6YvfFekN9iO1YEOWrfZuUeArYheYK/TkuWdfzpRT2a1xrfp4PASYgeY4XFSgAntjdamXpqrLQFYETHWgsCY0+B8tL3EAGLnGfwtItpiRRU6tffoLfwp0g5pP0JCjIyluP08YCyGoBtNo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760314106; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hYU9KcNrMdpNFTyRqO6zPkVaxFkO0N2b43UVwx48zNI=; 
	b=Wm4Kk/ZhKSfq2TArRpspN00IvK8GFvKCWWYPJbP0aP43Z7U0SoWT1/sZiFYgmSG+gTJB+JACRBJ2ax0+WW+QeG1C8OYKCB3QU1oCG9IsFAMVRjXreXb8uVheba68JpwlfvBtQWCP+jLORYPx2YZHyqxD2DAHXardJRoxFvKb+p8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760314106;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Feedback-ID:Message-Id:Reply-To;
	bh=hYU9KcNrMdpNFTyRqO6zPkVaxFkO0N2b43UVwx48zNI=;
	b=NOMei8n+4GD2djXmG69iNZEFHrMVzKSXccmXO4KeD1EpsXkYPxx8qVbZFa/MZ4qv
	r3id3J9VKzDb70yViEbMqj9ZKlnoge++FElqgmcF8iVLPPSXgrj5sufyzIpQXBi2KEP
	UHJ3vHLPGXAPJHhGwYt32ZIHjqnzp1zWmIRibpB8=
Received: by mx.zohomail.com with SMTPS id 1760314103093943.2840806200604;
	Sun, 12 Oct 2025 17:08:23 -0700 (PDT)
From: Jingzhou Zhu <newwheatzjz@zohomail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v6 2/2] arm64: dts: qcom: Add support for Huawei MateBook E 2019
Date: Mon, 13 Oct 2025 08:08:09 +0800
Message-ID: <12758617.O9o76ZdvQC@debian-vmware>
In-Reply-To: <f03e0223-2722-4d5f-897b-91209b6c12fe@oss.qualcomm.com>
References:
 <20251008130052.11427-1-newwheatzjz@zohomail.com>
 <2386127.ElGaqSPkdT@debian-vmware>
 <f03e0223-2722-4d5f-897b-91209b6c12fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Feedback-ID: rr080112271c41d7473c613256de7263510000f514c26e18f414dadc8eb2fb3d860cf22eececcec16c9df3f0:zu08011227855cb91ca7b4db25dbfa089f0000e6fe65a7eeb535e139b1c5828b982f25d988c7edde31d6659a:rf08011226b8fed11e45d501d83094eaa80000df759f7e0182369704fd03cfd19338e3d56e651c37ab58b1:ZohoMail
X-ZohoMailClient: External

On Saturday, 11 October 2025 01:29:08 CST, Konrad Dybcio wrote:
> On 10/10/25 4:52 PM, Jingzhou Zhu wrote:
> > On Thursday, 9 October 2025 21:58:29 CST, Konrad Dybcio wrote:
> >> Please refrain from resending if it's just to apply tags, maintainer
> >> tools do it for you
> >>
> >> Konrad
> > 
> > Understood. This is my first time to send patches, so I'm not very familiar
> > with the tools. Should I wait for the maintainer to pick it up, or is there
> > anything else I should do?
> 
> I suppose I didn't answer your question fully in the other email.
> 
> TLDR: you're good to go, it should be merged in a week or so
> 
> Konrad
> 

Fully understood now. Thank you for the information!

Jingzhou Zhu




