Return-Path: <linux-arm-msm+bounces-75966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD2CBB8D07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Oct 2025 13:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DCF52346A1B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Oct 2025 11:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA422741B6;
	Sat,  4 Oct 2025 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="W+cpZnVq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B01E27280C;
	Sat,  4 Oct 2025 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759578810; cv=pass; b=hQiocB5gQ5+uNGxt9qNtZuEaWvYt/GaJFg89BnvFO7XxAhoBtMIFTQ2p8VerovohMDGlVv1XHOkC2KBlBecjNwhrDDuk8b141HspInMYOio2cF6VRDjjzsLNnciK2Zz73qlhEZsHacdjK0MELaPJiF4DkK6oJUd7sSKxOo92MnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759578810; c=relaxed/simple;
	bh=Z3Ucqtb6yiUywJ2FZjbTm4BcJf69/s8VbGcfX4BXXxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dxxwf1Iu1kplJGKfNvIwo3MEhZpLfldsABvHFwKMjA6G4z6qdQKjBQP/ubWNrxAxxKya7AooNuG7FpdlcoDjZZ3DsdvH2+FJGKzTmK36hu+gqQebGWkOQT138uq63XwdvVEucmNFVN5mMvbalpQXLBpWS8zMUgoR+ToI2bLWOYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=W+cpZnVq; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1759578802; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EoIjcM2w+PIWSKB8XOVVVRDip1Zke3oLCXw6kTuUHlcdygSBAlHC0yyt+OH1fLLErbRHtFV+XD/pKTptbEc6U4aWbAGDDc6cZG3hyHJJ9Dt6JxSAjlzku0o3XrORCV2rgvDXGYShkG8icgyvUATRWatm3qKa9XDOM29SGI5yFOc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759578802; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wrq2lOtdqbwJ7ta2wwdj/d+1AwKQIj9e8R412RuF410=; 
	b=XfL3zLExALeof1RthoDXbd63HvquO4/0XucILJ746Hgy8RFwiWAYqiYCWyxjqXcz6fH7ZrLeg1vDz5tarJ3UxDWlea7Nb9wNf/2tn+6PKq20JPLk8n6dn2F3urfly6ObAJtm9XewG97zvVbBG/h/XHnpwPwX3/eU447EIeJXXZU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759578802;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Feedback-ID:Message-Id:Reply-To;
	bh=wrq2lOtdqbwJ7ta2wwdj/d+1AwKQIj9e8R412RuF410=;
	b=W+cpZnVqSk1WT28by0OI/+AwBT2Bm6UoCMnOHfcPQioVto82ihftlx9o79Ps1qF2
	xUCLI0m99XyTHDAgRc6rOYBu1thsyCjaO75qy2C3iiE3N5koDgDSLHHbDUrlyLIxSDV
	y48Rp8GYheMMxfY3nbP5GCZtGNerJsz+fY2mSeoU=
Received: by mx.zohomail.com with SMTPS id 1759578800071281.9834190319543;
	Sat, 4 Oct 2025 04:53:20 -0700 (PDT)
From: Jingzhou Zhu <newwheatzjz@zohomail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for Huawei MateBook E 2019
Date: Sat, 04 Oct 2025 19:53:13 +0800
Message-ID: <5021717.GXAFRqVoOG@debian-vmware>
In-Reply-To: <pbrrkfjrqoyj4qspdrordksfueyqejxcsz2oxqctczeoll6ywn@ixpaa6v4mwlv>
References:
 <20251001142107.21860-1-newwheatzjz@zohomail.com>
 <20251003131925.15933-3-newwheatzjz@zohomail.com>
 <pbrrkfjrqoyj4qspdrordksfueyqejxcsz2oxqctczeoll6ywn@ixpaa6v4mwlv>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Feedback-ID: rr080112277809047624dddbce711d99340000e4d01baf6e0684840fd66f709051e8cd74807357e4e48d3416:zu08011227004d2fe889e0681786dbf4730000eca0c2b041db7694461b23f4ea263a0c6bd948b6e91c708ea5:rf0801122644ac2804228ed9274f0b80ea00001450c67b5cb216574cf2160d168b81c4ebd0d7363f6b2a93:ZohoMail
X-ZohoMailClient: External

On Saturday, 4 October 2025 06:33:27 CST, Dmitry Baryshkov wrote:
> Did you post the board data to the ath10k@ mailing list?
> 
> See https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html

Hi, I submitted the board file several days ago (see [1]), but there's no reply from the reviewers.
Is there anything wrong with my post? It's my first time to send patches, plz let me know if I did
anything wrong, thanks!

[1] https://lists.infradead.org/pipermail/ath10k/2025-September/016495.html



