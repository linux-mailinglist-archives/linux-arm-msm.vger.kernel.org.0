Return-Path: <linux-arm-msm+bounces-45532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AACA16419
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 22:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61D123A3695
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 21:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820F11DFD87;
	Sun, 19 Jan 2025 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="SrbauH6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F9C1DF747
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 21:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737323877; cv=none; b=b0MU64VRb7aFhSLCp7Gl5rX2MMfSXC6/D3zIjkywc3JMVAFSVokQYX/sa4d+H8LhgPZhkEiwf7CZCfEXDYnJD0ql5AvOw52u8xhhk8PCHFfIuYCXaaGoXdwt9XrGZQGFok9z1CUGru6Y8ok82q1hAeicxcsX+j4P1TAxL0EBfXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737323877; c=relaxed/simple;
	bh=8CrqmHp9ZitaUcBzPNF2s2mdIUtbOtRtoJkREQT35vY=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=nrQOcrFISJ//h7qdhwmrP1Tv/nvRywT2MrjkNT86ttGIR4TLaZhKa+jIlbhgLawiUoh+y2UVRnmyw429Ci5RelSamZiAp2ft0ukOwci9/UkyH+ddjD9i1kpZCbpI0AFrKLSvV9+xmckv56DlnSDk2I7gb/Wad/VFseCLL2LVvN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=SrbauH6d; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 45fab0b8-d6b0-11ef-9de4-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 45fab0b8-d6b0-11ef-9de4-00505699b430;
	Sun, 19 Jan 2025 22:56:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=pI+4rilAlykesgVdG12gxUCHCpLQUgfynPoizmarMIs=;
	b=SrbauH6d/w7gjjjfrMG3lzm7CvMV8iCzFgp0uMr+YcD6X8wadALUSSBaXqllkVmFB3xJZ2lJBvniq
	 X+o58Y7hvc+VHiaf4Q68OhQohZsT7QWb++ZzEibhnW82HZUDiiKV9/uDSK3108r9icb1nm3lBgpUsp
	 EgpEh3vZRhpywC9rVWIUnI9kZoFmBkpUlhSLV9wMtmdU7ggWhFiddiGBTWBtUVwjRMyw2QVswcBJsm
	 VvVBu31enwzIuJUkK0ywKmE4BCOccRHqWrhwerUhbL25ci/ivZLsU4TL5nG8wcIpvKQKPCDg/sphk6
	 XQxjnL3PltsZLXoP5LzuSN+zEIIZnHw==
X-KPN-MID: 33|/Cc+3C40UJVWwfHeO9CsmBKbzgaglW/oQkn2XtYfQajX6BSbR0XfjImW2OegOjC
 HKT+vxd39isJpPItQD/8bAGgpCzBsZWFrGFIXE6V2bBQ=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|8+jds7L8PXQZHjyBBE0YYDpz319HbmuOrri/JD8RTNi/Mj2wukKqBfGZG2C4owh
 u32L0bz24EP8nT7PX+CdTfA==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 46f9b42a-d6b0-11ef-b69d-00505699b758;
	Sun, 19 Jan 2025 22:56:47 +0100 (CET)
Date: Sun, 19 Jan 2025 22:56:46 +0100
Message-Id: <87a5bmtqld.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, johan@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
	maud_spierings@hotmail.com
In-Reply-To: <20241204-asus_qcom_display-v6-2-91079cd8234e@hotmail.com>
	(message from Maud Spierings on Wed, 04 Dec 2024 13:26:38 +0100)
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: x1e80100-vivobook-s15: Add lid
 switch
References: <20241204-asus_qcom_display-v6-0-91079cd8234e@hotmail.com> <20241204-asus_qcom_display-v6-2-91079cd8234e@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

> From: Maud Spierings <maud_spierings@hotmail.com>
> Date: Wed, 04 Dec 2024 13:26:38 +0100
> 
> Add the lid switch for the Asus vivobook s15
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts    | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Also makes the lid switch work with OpenBSD.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

