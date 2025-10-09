Return-Path: <linux-arm-msm+bounces-76668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB4BBC95F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 15:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 583F43C77D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 13:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7132E8E1F;
	Thu,  9 Oct 2025 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="dfEf2bOt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender3-pp-o95.zoho.com (sender3-pp-o95.zoho.com [136.143.184.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783753D76;
	Thu,  9 Oct 2025 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760017797; cv=pass; b=VglZsEmv29NaTbhQSkAzvWOm6mAtDIVttDUPoC2FMWd/JWF4j+n73t5Xl8q+N0vmkowy6fK6dn1/VbOQBStfXvDHotIs66duchV2IOahc+O124b6z+PU61CTtSJiJ4TBvZbY0CeXCuRwId6xnzWK5jLH8v0FGPHLfNEhXpDW/58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760017797; c=relaxed/simple;
	bh=K/SrHatdpdvr0imPXa38AmzHHhk6udhFQfpRhaGjMT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EeuleM73D8DHxRy3cdxGo8d3onUF4z4zzeKvDCNLkYB8pCxyH6DlvrnfNBMk2daZix7X0gby1n62ildOVrK4FceH+411b9gGNUhkB8dpoay/9mR3tHYMKP1VyF7OcLVHrvHr8kLezDyHEV66onmoX4nkVlhm6lmo76FXxBggDRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=dfEf2bOt; arc=pass smtp.client-ip=136.143.184.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1760017787; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CPuBcNBSp2d3uw2hxueeUG1aAIcH0OZH45dFBUWkc3/9ACQm7gZiTWYOL15jTelBhQchagL5MbgOlihqPih9CEcMVyEpOcRTMJYpZxkNoWH/hL1c/1MozxMH227xGAiwFFGkPML+eO3Dwq3kv9dgU9pKbXTTGisKRACSOprPTvg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760017787; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LsLNtMoXCJzHmr2rcFqKpgKPyQBXHMlpxJ3f2vaAJMI=; 
	b=WcITxFhcA9Unf5bNqSBoXF3LYwbUhPCYltvzRmV+f+neWBGcuXTpI3AEKQX9VsHgMNHsqZQm0JQnSptPI6JpFwBOiAkbkv47vBmdc8eaKkO8A0X5FAaqiOumC93Y4usHdfCbYvf6qaNVOUZONSV9LA9rEwilvsKAibP+jlyreQc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760017787;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Feedback-ID:Message-Id:Reply-To;
	bh=LsLNtMoXCJzHmr2rcFqKpgKPyQBXHMlpxJ3f2vaAJMI=;
	b=dfEf2bOtbwal10hYeCpzmEzxl8rO4ZD0sU8eFQjukbxtHLWuSMPtAlfmwmBXiduO
	s3PbPCmpXOlOeAhf+B5roGIauPzzwuXXQMfRystccS8XIgrBpfC+88VWMAjnePgGPmb
	s63hrW9jA5detcEZkYPSxFYpUckzMbZznzIwo3Rg=
Received: by mx.zohomail.com with SMTPS id 1760017785121400.7847926888377;
	Thu, 9 Oct 2025 06:49:45 -0700 (PDT)
From: Jingzhou Zhu <newwheatzjz@zohomail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v6 2/2] arm64: dts: qcom: Add support for Huawei MateBook E 2019
Date: Thu, 09 Oct 2025 21:49:40 +0800
Message-ID: <6199698.lOV4Wx5bFT@debian-vmware>
In-Reply-To: <6ede6425-6b99-4505-a231-de819bab9ada@oss.qualcomm.com>
References:
 <20251008130052.11427-1-newwheatzjz@zohomail.com>
 <20251008130052.11427-3-newwheatzjz@zohomail.com>
 <6ede6425-6b99-4505-a231-de819bab9ada@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Feedback-ID: rr08011227f6d877a33ac25c642fb119be00005d61e3e978284a0855443ea8fd09f6d25bae9d680cc8053b76:zu080112271d4cee7ee2a137f3cbb7f21400002b527bdc77d8591c64fc4d89981a46d45c4a43cb6a95e43c1e:rf0801122698e9057350a62460dcc3f71c0000b0bcd3005fbf5e6162c333e5c3b4da055407d5e9b70b6fd4:ZohoMail
X-ZohoMailClient: External

On Thursday, 9 October 2025 20:41:19 CST, Konrad Dybcio wrote:
> On 10/8/25 3:00 PM, Jingzhou Zhu wrote:
> > Add device tree for Huawei MateBook E 2019, which is a 2-in-1 tablet based
> > on Qualcomm's sdm850 platform.
> > 
> > Supported features:
> >  - ADSP, CDSP and SLPI
> >  - Volume Key
> >  - Power Key
> >  - Tablet Mode Switching
> >  - Display
> >  - Touchscreen
> >  - Stylus
> >  - WiFi [1]
> >  - Bluetooth [2]
> >  - GPU
> >  - USB
> >  - Keyboard
> >  - Touchpad
> >  - UFS
> >  - SD Card
> >  - Audio (right internal mic and headphone mic not working)
> >  - Mobile Network
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

Thanks! will add Reviewed-by tag in v7.

Jingzhou Zhu




