Return-Path: <linux-arm-msm+bounces-76732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B82BBCAA03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 20:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F60A4E69A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 18:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8242505AF;
	Thu,  9 Oct 2025 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="V6pGM0mx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715C0A31;
	Thu,  9 Oct 2025 18:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760036308; cv=none; b=pSNjP9c+AHkDtDfSuBEN7c9biDWGqGQttHvmce7BC59DxweNiPzXZq4HZtGa9pkOoy4U61zVEjrO8wi4vPXX316VGQlttfcv3LvbIUoZOqxwcRLXfBZPDfhsPcmTcoH3kijshKvEVb+Ss9Q1W8pXHYXTVNuCxcH0Hf6CCCjq3ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760036308; c=relaxed/simple;
	bh=53IsFJzxWMMzkLYYiPkY/Tnkn8LYqqQNK+5NClvvDsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HqKEwe8sWLzOdDeQOFSwDX57DrE90+BOZ9lpBu+zQ9nw4DIgHNfCSCzCQVHhDn4PcoHQFyXz1OORfYZHQNWzJtT0LjSn1hcTFrMZejPVFVRnuDoTJR0+HHi15BYk6CH4LuI1+dP35EvW1qkPdoZxNftljf2dFFOvug+KUnX7puQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=V6pGM0mx; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sx163Q/gDcDwLx9ge5Ng5N0+91L1RQp4JmKODFf4mnM=; b=V6pGM0mx5cjSI85VCugECNBUyB
	xFJ2h7e6mZnw7ETMED0qJvFAJjwWnbLNXNuPM4WXa6+2j6fg14ioNDj46godWlzTL379AMr2ee8bb
	wG+wR9AepAIbMhJDAMjD7hYROpOBw404Ay/ngu6A2EnuRUne7rbXhWcHBQrCkog7ist0=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1v6uy5-000000003N5-2qya;
	Thu, 09 Oct 2025 21:02:21 +0300
Message-ID: <6bc54f43-63c4-4523-9dfd-d74cdaceef58@minlexx.ru>
Date: Thu, 9 Oct 2025 21:02:19 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] arm64: dts: qcom: sdm845-lg-judyln: Add fb_panel
 dimensions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Paul Sajna <sajattack@postmarketos.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 Amir Dahan <system64fumo@protonmail.com>,
 Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-9-5e16e60263af@postmarketos.org>
 <de1a7ecb-924d-4ed2-8034-721b8dce69d4@oss.qualcomm.com>
 <ac2d419d-a1b4-4b3f-a07a-4f5d047901aa@minlexx.ru>
 <e58978d6-dc6a-468f-91d5-29d7b0755e79@oss.qualcomm.com>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <e58978d6-dc6a-468f-91d5-29d7b0755e79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.10.2025 16:55, Konrad Dybcio wrote:

> Would adding post-init-providers = <&real_panel> help?
> 
> Konrad


I suppose it should, as means to break devlink dependency, but I
personally haven't tried it yet.

It's easier to just have "msm" and "panel-*" modules in initramfs and
leave simpledrm node be with invalid scaling, because it doesn't live
long enough to display anything (maybe a fraction of a second) due to
being quickly replaced by msm drm framebuffer emulation.

Framebuffer-only display with proper scaling is only needed for devices
without display/panel drivers, perhaps temporarily during early porting
stage, so this all is minor issue.

Still would be nice to have a proper solution for this of course.

-- 
Regards,
Alexey Minnekhanov

