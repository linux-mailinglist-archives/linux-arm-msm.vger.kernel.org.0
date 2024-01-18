Return-Path: <linux-arm-msm+bounces-7575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5FD83207E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 21:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1928E1F28956
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 20:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8612E655;
	Thu, 18 Jan 2024 20:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EY0atT07"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5FF2E823
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 20:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705609694; cv=none; b=UntjgOe2uCztTz+I7zHahEBQCaep/LA2h7bCjh0eE/+l66jTmDmUi/+yd9o766GRHwSUocoMivtCDROatZ7hk3Kdeid2yEVS4yP5Q8N4g6KV0hXpLrFZ92zfBqDEbscfQwAiE6Fj6DE3RZADJJKJk/WFdogS42AY5cxAqtrYNmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705609694; c=relaxed/simple;
	bh=+ihZ3ptOctQ5m1rlil5tsOHnfk0f8/Q4JkX+8RY4A5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDx/68S1YZeXeUng/8ogH4pAHphzjDHd0A8Org+J6sQ38PPGRr3tIMcvCjmnCSWU+OjIKLDzXpCrvuIMsoY9QzBFAI0/HoSV+Rg7q2UcwJa76EJypZxqkQ7QFgxODfO0uQa2curHnHTW4l8va5tkVw7eOFjJ2vhbG8zo2SItuXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EY0atT07; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705609691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+slQrL96GqENiDjqUtTjudE87lRXCqszoznm1iN3Xcs=;
	b=EY0atT07La4PPelWcAMiR9My2C/xswtXbTY1XXsYBmyVcJ/1RUYGGhYYeRo0y38cPhss9N
	xfIgR1TjsSynCOhtlqrU0LwgaR5H8y8oExm/UPTIr/QqVuOTRA/PdU0/nA9OpFxDBnva0N
	R+gLHY3rPbWQwIHyKi1GK5P8O98glvI=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-6kRlalopPRaOdwiZAkBM0Q-1; Thu, 18 Jan 2024 15:28:09 -0500
X-MC-Unique: 6kRlalopPRaOdwiZAkBM0Q-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-598e30e7e8cso39912eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 12:28:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705609689; x=1706214489;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+slQrL96GqENiDjqUtTjudE87lRXCqszoznm1iN3Xcs=;
        b=Y7ui5mZRsoxwSzyvYztLs3Bsb7HwjCvaJxuVRVuhFiMx8cuRmsttNRiutWEJ9VE1JB
         qY9nVe7y7UAnyp3Em88HWLWPA3HzTSDUuDgSapaFxRfPiWRONrHoKIdZWU5TX1j9t1eY
         2cI9E3SCvagGvkHJ2ZvewQ57gjjBdmpOqxVbo+0DP02KbTHypK8/N9R1BjzHenIDd4XS
         PuY6KwCEowT+mri1e4w6rIFTD1H03uUtOBdBDkXpCq8Zld7CPpDcB5PhddwpoNZ0Vkv4
         ve+NcgbrUMV8C6kIzWHsaqV6wD60h8xtkDZXA2GDc5tYwyKNzdLRMX+GOQdRxYIgbsQN
         8X6w==
X-Gm-Message-State: AOJu0Ywp9/g7ydul6eiXGUJG8TSQACS81jON5MOwTf9HVT8LXcPu2SvZ
	mwDvmwvPkUWy08URGPwxKYS64hdaI+442d1jFuPQI8dP9akzmIeO1DoX/wSGEUek0W2WBAgxcME
	BPV1sOSXn+M6zRchsK52zX0j56oRaFVj4blHnt5qOASr9zs7GxTXeVkRQicZS5qc=
X-Received: by 2002:a05:6870:af4a:b0:210:a6c2:b106 with SMTP id uy10-20020a056870af4a00b00210a6c2b106mr1340507oab.76.1705609689107;
        Thu, 18 Jan 2024 12:28:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBYj3pP0HSSRWzxrDFz46mWY4ulenAUBplrdo+1T9oQL22wODQrmD82jcrKdLqfAwriXtmKg==
X-Received: by 2002:a05:6870:af4a:b0:210:a6c2:b106 with SMTP id uy10-20020a056870af4a00b00210a6c2b106mr1340489oab.76.1705609688903;
        Thu, 18 Jan 2024 12:28:08 -0800 (PST)
Received: from x1 (c-24-2-114-156.hsd1.pa.comcast.net. [24.2.114.156])
        by smtp.gmail.com with ESMTPSA id du30-20020a05620a47de00b007825f50eac6sm5530364qkb.122.2024.01.18.12.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 12:28:08 -0800 (PST)
Date: Thu, 18 Jan 2024 15:28:07 -0500
From: Brian Masney <bmasney@redhat.com>
To: Ninad Naik <quic_ninanaik@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	quic_psodagud@quicinc.com, quic_kprasan@quicinc.com,
	quic_ymg@quicinc.com, kernel@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to
 SA8775P
Message-ID: <ZamJ1wSXzJSyzqck@x1>
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
User-Agent: Mutt/2.2.10 (2023-03-25)

On Thu, Jan 18, 2024 at 09:27:11PM +0530, Ninad Naik wrote:
> New memory map layout changes (by Qualcomm firmware) have brought
> in updates to base addresses and/or size for different memory regions
> like cpcucp_fw, tz-stat, and also introduces new memory regions for
> resource manager firmware. This change brings in these corresponding
> memory map updates to the SA8775P SoC device tree.
> 
> Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

Krzysztof: It'd be nice if you could submit this patch for inclusion
to the stable trees since the system can crash without the updated
memory regions.


