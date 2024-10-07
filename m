Return-Path: <linux-arm-msm+bounces-33305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 578CD9922D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 04:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D010EB22182
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 02:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D41125BA;
	Mon,  7 Oct 2024 02:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYfNWiiz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB041E574;
	Mon,  7 Oct 2024 02:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728269823; cv=none; b=T9JIBBdAD5Y5liSyU7Qy6LDlw0noGjxwe4sU/s8j2nPX9u7sUx2z9wHdSe1d8P9qv7LJTyhU6wmuKskqwE89pqN+d26Glxvzp2BjT5I7QBA4cG9Ps397ipmyiZb7ufWKkMGIfmEcjg8ZIRhuPFHmN8N5imxnxn83EsM3Fn8evGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728269823; c=relaxed/simple;
	bh=fCvIs1nwp96x+JVT//3xLsH7McgWe0ybdKYlG2H/j9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tM2DsDaGCpyUrMEYG2zR9aVRy8lfSHlTd9Kjm/7JQSz4HND3/+knz/s/KIBb3O7/yAmsMpcQAx5/KxV/UbBdZgOJsoGHHxowiF7SiZef6MURIAM1/3xFFgu6l4yMqSLrrX/HFXnBUkSpPmTe1TIRj9p2OnAIkxKUjd4UYuO8tJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYfNWiiz; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71dfc250001so682698b3a.2;
        Sun, 06 Oct 2024 19:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728269821; x=1728874621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bo8yVY2LwYLpMiHODLXo99yxSx6R1pGfgpw5S+JeFJQ=;
        b=jYfNWiizuOXHKm/caQGC/VkxR3ZOLUgGsVjKyHjguAwh1e5NrtPIk/kureN+ZyfN45
         tWl41Ktw7IRFv6gay5naK1RtKNJTNbCnZX/Rybok5EIT9raOKG7WPxyTF/2PrCkRGNlL
         UL9rvN3kOtBQwnYm0iHyYTBTRXcnjgV6tW+E18K0E/zM0p+sbwfvQu9OjUA06Ar1ApF5
         oxT3Pepprgi4y8y1Udb6X8vvIoxmK9ps9AMSc4r79m8Hg5kfqE3o31SVdNmTpJRd7lop
         kpgq3TCe11I+fwRTRBRRk6EayAHFAY6L7/xOsRoRPfXBhHPbslu9q1TQ0vXvs1ubU02X
         b3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728269821; x=1728874621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo8yVY2LwYLpMiHODLXo99yxSx6R1pGfgpw5S+JeFJQ=;
        b=coKrFUco5QfD7H/gr/klh7XCkoUgLnXsAAJBJM73Vmz168qMTBxU+EPhZXAvtSe0XG
         b5J1GKBOBRLORIip1B6y2MI4lslObJZq9fXzrKEZ94kS/Fdmq+0KDedjgilTdY+aIHff
         fRmwiaVgt16pI+2IEeff9Y8gwYoGCUJLsEapVyGU4qFHcv3vLyPf9KkjwAEpV2cPt0ek
         sR8+hBwaJRqSdJUpWa451YWFEQu6cS/DfOrz5X/aAm+VQM12cRm66qj6zeu8TYqtf8uy
         +H8zv6tdJqzInOn+jtbbiLNez7cvq09JBE+ZKteNtnh3arKyYnl8WiTjuKjjnyb5Gsm8
         RKJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXn9Do66WbWzM617tkJW3R2mYOEFAhaeHjSlpUEz2Uml3LNjC2/pvt/hxJmlQQok1nSpWS5DGGIYCL@vger.kernel.org, AJvYcCUhNPpovc4aZjbqftki+La3M78jGNfX7CUvQz29g61zBSuKfynP1DLGJtRrC+fOlLNm+nv0pMLs6BdMn0QGcw==@vger.kernel.org, AJvYcCVs/ESIuhdtFo9zztO/+B4S1B06ucH+Nsa8x+Ik0ZqWUyK7ji0kFAL+67zxftmYvhKfExE9IXxLVC1qx8wI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdrrmt9dndxUYe9JMyFx2VfRTMvrk5IzoiA5TKxUir65X3kVWz
	hN2gAKUBUDMokU3vwW2zFUp5w5+gwuaKimGqOpgGortm8h/cpSQb
X-Google-Smtp-Source: AGHT+IGW9oMmDOsTCVG026ZXmF6CK6Q7T6eNTgbZHZYoi1OLJqrQ9a+OxM7yJ6iEqCkYoq0mfmBxXA==
X-Received: by 2002:a05:6a00:2302:b0:719:8f48:ff00 with SMTP id d2e1a72fcca58-71de23e8f6fmr15928243b3a.15.1728269820924;
        Sun, 06 Oct 2024 19:57:00 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cbccffsm3408998b3a.32.2024.10.06.19.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 19:57:00 -0700 (PDT)
Date: Mon, 7 Oct 2024 10:57:17 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3]  arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
Message-ID: <ZwNODSqKNJmkY-l2@localhost.localdomain>
References: <20240929112908.99612-1-lujianhua000@gmail.com>
 <20240929112908.99612-2-lujianhua000@gmail.com>
 <p75ivby5ajlmnvebqkn3mq7t5xh6awewjwkwpa5rjiqv2ijijl@aqemqgxveu55>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p75ivby5ajlmnvebqkn3mq7t5xh6awewjwkwpa5rjiqv2ijijl@aqemqgxveu55>

On Mon, Oct 07, 2024 at 12:02:34AM +0300, Dmitry Baryshkov wrote:
> On Sun, Sep 29, 2024 at 07:29:07PM GMT, Jianhua Lu wrote:
> > Add wifi node and this wifi module is connected to pice port.
> 
> Could you please add ath11k probe messages to the log? We might need to
> add an additional node with the calibration variant.
> 
Hi, Dmitry. Do you mean that I should add ath11k probe message to the commit message?
The following is ath11k probe message:
[   10.285469] ath11k_pci 0000:01:00.0: Adding to iommu group 12
[   10.285637] ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x604fffff 64bit]: assigned
[   10.285699] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[   10.286003] ath11k_pci 0000:01:00.0: MSI vectors: 32
[   10.286023] ath11k_pci 0000:01:00.0: qca6390 hw2.0
[   10.652407] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
[   10.652429] ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id

I'm not sure if it's necessary to add calibration variant because wifi
works normally on this board without adding calibration variant.

