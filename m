Return-Path: <linux-arm-msm+bounces-57821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0593EAB6912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 12:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 713C61B64976
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 10:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B75227057D;
	Wed, 14 May 2025 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ee+kKI1V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E562741A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219412; cv=none; b=NbIdxOdl7JFeVZtq1DNyXmd9z9f4gDLGxS7SGNZrZgPfwSFTNct+X92Dsnh1EezHvbxW77QonsiS4ge1GRTtnks8hAiA1lvPMl8ZtkAFRv7VfH/pQmK5tOLlEKv4jrnHul3372UbMA77iypSUSLbaU1K7SaSnvazOP2inPuLpPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219412; c=relaxed/simple;
	bh=icczPrIZYGv2B6Fk9mhsXabLOVp132e36d3tOVpTinM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pN2VKXPvBiX7GOR9tfJRnH4s5ZmWEcweFAAd/X7w6jdJ4/j+1L5QlZHuSDIXfic2rhsZmrjbe4zUIJegUx4ASF9eyqcjWxzo7WPAzufO0QluVfMKCKBz/hbajwAGCZy60t1qJuqAu83qtJP0XuC5Xv2fX+qaGo7XnBD05l1Ai80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ee+kKI1V; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so69319955e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 03:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747219408; x=1747824208; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0KB+309i4RxjvcykFikT0JnK/+6UeZWOdqeF0dxsBa8=;
        b=Ee+kKI1V8Ie7cwPlwgEgEXL8958RQNtMbuyDHfqDse4KK6A5TNQEdv9YRspPThzwbo
         2wyt+ExFSSHFlp26WXuB0daF/T5Td9Yat50Ut799M3HY0h4FblDxfDW/RAzbqZgF+59o
         uvWhYocUNrif9iGnUKlcYPHqkYfXLqmNQ8axGx+nRYUABgP4j2kLdD1bdbVdJELzM1cq
         lMKvbcPvLWzFGMyrf5pEV+HmpIoXhwJktNBSHmzyBxUoUX79D7vFJjc47VN2tfy6D6sM
         GTT/lJoUlvMbNPwMB2+F3jy4eXkNWxJisFLhyXOBYd37pEXHqwbYjsjUSUWyQM8DO45B
         zH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747219408; x=1747824208;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0KB+309i4RxjvcykFikT0JnK/+6UeZWOdqeF0dxsBa8=;
        b=jheiL9VQUuVX/gTa6KXdiOYO1GCjAsW049B1mM83prQrv1Do4q6uHiwAYZUe7Rl2ip
         CifIu6eMryhLA7TItbNra6roToI+MepPUuUwOg5a8Yx2WQenQvgEI5W5by3qTZEs7bGu
         9FwcEab5afihirsdc20LYQ6nc0Qhcby6RM2vNLOcNQERyQU8OBQO3Vw1xyklUfXEMvOs
         Jo4NvWhfIGMdMrxIDgRyhjJ65bwmnJjfTT3r+/P+/LiDJ9+W7zv+UEg8SCrexDNqND3r
         Z3PYczHGB3K53Nb1zNpIJt0wReVU0AHGlDvT7oqfNIUQHLzxcYK8pLwwGrkFF05SiIyk
         6fCA==
X-Gm-Message-State: AOJu0YzaG1iXFafrkXjxPqj9fj07BGIhCQRaTHn2jbIRn/hLmXiGorQo
	fQya1eyeZWH2VENWbXpgOMb583izM29qk/njsyeNCe5S3yaD4CSEpBF9G97qF68=
X-Gm-Gg: ASbGncvMaMH0ZpoX1A97nxyjSm87P+Zf67FgWSSSGy2cguU9c5gMpORMJiKNhKZnXHb
	FocqSnkw1N9NZ2w8yDGSbnjjXrcJa/iqHyS7j71yj9tYO7eqUEmJSxZTaLJbf6tBSZz01U1cAtp
	ufwxgYTYyXqioMQagH5GuoRt2zfZd/aG8FcLMUYVArOiCFTSQY+M7iwZIqhVv96ez8yJWH8AhLN
	4U8mmj1H/b3O2kzKeJnRBl5L+ClTKNI5qgX/vGNBGTIbr+9dUFGTeCPswW20tDN5sgrBMQNTJUI
	tndhCd8iioRRlpBebE84mUFT0BZPR2jONIArDklpTkkPWz/3LTcqSma/pcmyz9wF5UzMX0b0COk
	PAVXOacBWwosgAnZXAL0S2f4m
X-Google-Smtp-Source: AGHT+IGDzh2lHF9+tgixSkp4osRxuBf88vHe1okOKr+0ee4IX09GyQKbdwfBSUBsbvD4311dkhuxWg==
X-Received: by 2002:a05:600c:1553:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-442f2168bd3mr17922085e9.22.1747219408117;
        Wed, 14 May 2025 03:43:28 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f397b6fbsm24822375e9.39.2025.05.14.03.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:43:27 -0700 (PDT)
Date: Wed, 14 May 2025 12:43:25 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, rafael@kernel.org, amitk@kernel.org,
	thara.gopinath@gmail.com, dmitry.baryshkov@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH v9 0/6] Add support for IPQ5018 tsens
Message-ID: <aCRzzXkd_qWuN3Fo@mai.linaro.org>
References: <20250228051521.138214-1-george.moussalem@outlook.com>
 <DS7PR19MB88836DC6965515E12D70BB2C9DCC2@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS7PR19MB88836DC6965515E12D70BB2C9DCC2@DS7PR19MB8883.namprd19.prod.outlook.com>

On Fri, Feb 28, 2025 at 09:11:33AM +0400, George Moussalem wrote:
> IPQ5018 has tsens V1.0 IP with 5 sensors, of which 4 are in use,
> and 1 interrupt. There is no RPM present in the soc to do tsens early
> enable. Adding support for the same here.
> 
> Last patch series sent by Qualcomm dates back to Sep 22, 2023.
> Since I'm working on OpenWrt support for IPQ5018 based boards (routers)
> and Sricharan Ramabadhran <quic_srichara@quicinc.com> in below email
> confirmed this SoC is still active, I'm continuing the efforts to send
> patches upstream for Linux kernel support.
> https://lore.kernel.org/all/63dc4054-b1e2-4e7a-94e7-643beb26a6f3@quicinc.com/

Applied, patches 2,3,4,5

Thanks!

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

