Return-Path: <linux-arm-msm+bounces-22861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB14690B1C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9410D1F2A654
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEDB1AB535;
	Mon, 17 Jun 2024 13:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="2hRTfSKm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBA51A2FCF
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718631371; cv=none; b=MiKV28GAxlPzYS3yNTksERsLTDbPer5VvZ+LoxWTzo71Kyp61ddzOtwXuPat/I6IgXzb4Y8J2ntLnUhKa4tx3tnRkZpzYDVGavBbpo6dVu8zeIuTsIpFOMkmrobgAHZt0caIvXh2s/rNZTVrg3KQcWG8xHNPF5W4OzmtkzE+TXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718631371; c=relaxed/simple;
	bh=51VpGQU9TQb2BYNIV1hunBeJWs//aAYMlaVemJqOiis=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=duftaQddBlCAOzmJrVK5w0DxobS6hcgiBkeTaA+Y1Ws9qtl+9Y84hPk5NFivgKn6rJW38zMr5E92Req+UXleKOMP+/GcOErzL9h9EYMKhKxsWwPhHozWT9S15vdIVktF0syJ741sHA+pBtMD38DZHfqZLUaaIq7IDzHGT86l0oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=2hRTfSKm; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52c32d934c2so4830245e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1718631366; x=1719236166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SGE8udosehPs8x6k5Jqshd1Fc55L9dYXXaHceJtRoDQ=;
        b=2hRTfSKmUU/ixcKn11+aAwmG8RjwkcDCQr/k6V2edWZcgjdO5hCPPRZ2chwQXqf0xg
         KudUQRr+H4WRG8wVnwxAV75ibwwQl8z1QFa3kcNG4PkLURdwCBfN8TCb3H8p9RDEckb1
         XLMmwr/+eKqd1Zkq05gQi+RU6hXoV/uoMOe1+RxV/GwP+QpMUvpCNR2C5nE869eUkYMk
         Lgd4UDI5DWVSinSXk1VU9nSs9YB8nYV6334V4AJ37IC2Z1WiIz4UAmjM34mmVTlKlPiU
         HqfOYMIbthlGA05fA4p1cvWHY2eP2vJ2iz7jAgFs4zPF8HadngZJyQCoChL+gFhXlV6Z
         7kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718631366; x=1719236166;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGE8udosehPs8x6k5Jqshd1Fc55L9dYXXaHceJtRoDQ=;
        b=v2FEQflWUyIeHmS5zNceHiZjJP5d3nH/ONrshzKohBS977sFA+o0vVW1vis/xkzWzD
         7kXdwGcmcZz+DYWaEIkTQ3sM+w4XG8sfxfq99po4e2W/ZkCpFBBOxBPJD3IlzVIGhMOm
         8oujjxCZm2frAekNlg9Ar737VXKIA0HeXoGkcIJZ0S/Yr0istc8eiBheppp9c6glsjjX
         hztruVcgGELJPhNmt2j5dzzl82Thd14T5x3dfUh40DpvAWxgy6sTLuQ0kCvu3xHibq5P
         BSrlfy8S4/qOQkPXDCRlKjQkwv0J8wCKtN3wPg6LrxayC2E/pqc3rTLCdAdLzFPxrnib
         L0FA==
X-Gm-Message-State: AOJu0YzqseeytjdueE9V+RNqefVRLr23uSFl/Qi8k9SmXByqfQe8pxGq
	ZUJOTHV2BjvH+zCwYcLQKPjxVynmljH2vo/qhN+nXlBk8mt5MKJVMSIMtGChzCk=
X-Google-Smtp-Source: AGHT+IG6y8wrPBA0o1vryGKYpHdpkvwU9Q1FxHSYaxn555rEKLWnrGWdeHs2ikwmLBI+IVbg85jeHA==
X-Received: by 2002:a19:6448:0:b0:52c:a64e:83fa with SMTP id 2adb3069b0e04-52ca6e9097dmr5228997e87.45.1718631365754;
        Mon, 17 Jun 2024 06:36:05 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750f22absm12108635f8f.79.2024.06.17.06.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 06:36:05 -0700 (PDT)
Message-ID: <abfedc39-43d6-4ab0-b7b2-de68371d5d28@freebox.fr>
Date: Mon, 17 Jun 2024 15:36:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Add support for qcom msm8998-venus (HW vdec /
 venc)
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
References: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Content-Language: en-US
In-Reply-To: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Mauro,

Can you merge patches 1 & 2 in time for 6.11 ?

Regards


On 04/06/2024 18:41, Marc Gonzalez wrote:

> Changes in v5
> - Collect latest Acks (from Vikash)
> - Resend to Mauro
> 
> Marc Gonzalez (1):
>   dt-bindings: media: add qcom,msm8998-venus
> 
> Pierre-Hugues Husson (2):
>   arm64: dts: qcom: msm8998: add venus node
>   media: venus: add msm8998 support
> 
>  Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml |  4 ++-
>  arch/arm64/boot/dts/qcom/msm8998.dtsi                           | 48 +++++++++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.c                        | 39 +++++++++++++++++++++++
>  3 files changed, 90 insertions(+), 1 deletion(-)


