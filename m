Return-Path: <linux-arm-msm+bounces-33293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCF6992176
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4642F1F20EF9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CE7189B86;
	Sun,  6 Oct 2024 20:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nz/QpsOE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F71EAD8
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 20:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728248167; cv=none; b=DjAb8gGMLJoBn3HoPrCJB+eliQSQYb9jyECj7T1LdJVlhbHByMBQsH8eY3Xb7nKNqKUeXe8zD3DM3Yj3ym4r9miGDcE8fnOqqHEAR6UAwHL0MebhbPNoBmUlCLHuuNxjRgjaGFGiKq8Gz7xbPIsoEi3wuPQO4n7F6IMdIb2O/Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728248167; c=relaxed/simple;
	bh=jiFpyTdZ+o1J+cBAXzVZD4nkRrWgrG6mHlLauSbhxd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeICfPdZOYZZzqhaPvu/pb9cr9gHSomp8UfqQW+dbo3apXLDc6G5PvLnP9qdP0/Zp1pLvq5CSfdWEMxkjELkCfFsPq6/Tuk0NWLLmlHwu6hHYRmwxggkj6oqL6O7vLvbUxvXkG7HTSAMfAgd9kH2zAH27TFhPSRGTFzzrM/NpCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nz/QpsOE; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fad15b3eeeso38673601fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 13:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728248164; x=1728852964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SM7DgNpNIL7c0svz2U898QeDIrjZkM596M9Pbx8v2ZY=;
        b=Nz/QpsOEExZPDrG2kt1EcZq6n2Pp/PMhNjl5RB+/l+AgdQefCqAIlHQdhSY+9/rTnx
         L+VVLynsfVaH3NeiIRCHcwFPs0Lss7fCBRERdS2npSKEytqoZ3Nrcva0JmyToTTiCBGE
         bLsiOGjpb8Z/JlOb42MGnWYxo2pzyrwior08bDvqE1PlRDmOhMWBKAwBVJrJ93siHkEk
         BME9UCkHncNEk5DH402EtwfCfiDa/6NTiEGPmVGMDRXTtmcGydexsi8gi3T8CSBRQUVi
         WlyzBIIXtczvEs2/TI8I4IxczFC/pnqiFf8A0oow3tdS7OtP6uGAGDjLimrfhn4fOD/M
         FsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728248164; x=1728852964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SM7DgNpNIL7c0svz2U898QeDIrjZkM596M9Pbx8v2ZY=;
        b=dUuDQz3je/akI9OoDcBC+g4wKBCMWKJHA1Sna3mq6HTWQKj+l7W7nxc88skTG2qPIu
         aF9W/QgrhxScZX5cYhSBH6pTcoL5tariyhPr74ce+iXK5YtJJAnyKH6SrqMkYc4dx+xQ
         Jwk5sCPAzMP82m5nZW3UwvZK2jVq53wQMFy8f9AQtotalLmvJKJCK6T5wqRnXL6Z8Tn0
         Z+A8klaAD4CyjPVrP4dLRP64loAoGSZwVcaxVtvCUTgBDQW2CW6Oy7PnPy67WzB4SPnl
         ESLrBmxCOUvEYLFQexa/dtbcdFsxI7Pe7l00/hhAkY6bEASK/2kr+A6Hcn71K1aAMF6v
         GkTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuC0Yj1wWE4gN3aHsBoe0FJbn8oGdaHAbgHuM8vEXzVJNPsW0OJiJVr4JM+Q4mi/OxeWgKJyzkbD08S0Lh@vger.kernel.org
X-Gm-Message-State: AOJu0YyeDjOn0cVS7FdHMS6EdRZtROHLaP3j8TxWLKB65mF5dQAuVLSA
	WDPMfgHIW5dw3fV69NbRpr6SMg4Iml8wuGSZ8Zr4W8Sd2nXCk0adA+KdQhddxm1tVEukaf0Zc2A
	12OKmnwSh
X-Google-Smtp-Source: AGHT+IGzsqnMOSj1/ufudmrnnAIigKHHXKQOr+ikBVGert6uQzR5jB/vVWo0xMp7pxWXV0ud2NhqDg==
X-Received: by 2002:a2e:a58a:0:b0:2fa:cb44:7bd4 with SMTP id 38308e7fff4ca-2faf3c01131mr43192421fa.5.1728248164302;
        Sun, 06 Oct 2024 13:56:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9ab14f7sm6254161fa.17.2024.10.06.13.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:56:03 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:56:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_msavaliy@quicinc.com, 
	quic_anupkulk@quicinc.com
Subject: Re: [RESEND PATCH v2] arm64: dts: qcom: sa8775p: Populate additional
 UART DT nodes
Message-ID: <uk3zgyee62vrkcwtujkuw754wacvullmsjnimlqhmmbjit24rm@sqcrmbn7ngsg>
References: <20240930085533.17119-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930085533.17119-1-quic_vdadhani@quicinc.com>

On Mon, Sep 30, 2024 at 02:25:33PM GMT, Viken Dadhaniya wrote:
> Currently, UART configuration is populated for few
> SEs(Serial engine) only in sa8775p DTSI file.
> 
> Populate UART configurations of remaining SEs for sa8775p soc.

I think this is a long standing tradition of adding UART configuration
only to those nodes that actually will be used for UART on one or
another device. Is this the case for all these UART nodes?

> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
> v1 -> v2:
> 
> - Modifed commit log as requested by Krzysztof.
> - Added co-developed-by tag.
> 
> v1 Link: https://lore.kernel.org/linux-arm-msm/98e7dc28-4413-4247-bad1-98b529f6d62d@kernel.org/T/
> ---
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 231 ++++++++++++++++++++++++++
>  1 file changed, 231 insertions(+)
> 

-- 
With best wishes
Dmitry

