Return-Path: <linux-arm-msm+bounces-77119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B006BD8563
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0764B3B0D43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587242DAFC8;
	Tue, 14 Oct 2025 09:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="wttrXz25"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724F62D8790
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760432478; cv=none; b=nzKzEvxCZMyHVH8aBbA5xXA2+gMayP5XMYXwQ1seLYAVPA4waAyvB5TgMP0upiakf6Q43GAwQ8Sn+7WWbtLW8PwBc+WiDZahYZPH2X/uIorrY9wazzyucWW/IFhdmHlR15jJgfJ3I9C7Y5zl+aSZs2s6JGCCqdaICqH4QIw935U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760432478; c=relaxed/simple;
	bh=laZ/iYdLxs8q83G9OHZW+7QdWWSFr9QgqSvPuu262yA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bDv0Uqqj1b8ETktfj+3WksgP1UILIEiyO7Y8hwp5j1IhV7DdShMmypXdp4Gj/oaCyiB4haEwRKoz+LGK0/i5Bnc8ysYvbMuPagKpEqKZ2GoCrXy1MWuD3nA5NWSwlks0LwM4J0AVLRdjDj+29k76PDNnswq06/h9h70DZtFjzwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=wttrXz25; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <d0c18094-7234-450d-bd9c-e9f545de31e2@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1760432464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hWC+ywjfpW2/H9UyZOdICuDSOHgVfc4S6b742pjDjcc=;
	b=wttrXz25P0zv5ADfsj1qwkkG+G4Io+JTmWeoRR7Zl920wOS/2nQ+LlLIg8cQ1HLQxuYZPx
	W4NPY6EuUTXDLNh0LL7IlLfeuwwwits3U8gfJ1nL+UTR5hSJZaxUWNq0nA8KZwWPvGfFcm
	HwL8FbDrAYSMjy+S/mL4PhNyxF+iBCaRH9AosEVpWBvYrbGSOVvoT8PCp/AGEoz16bUEBH
	NX/5GfpOretCgzlaU+7ezB7nQBemG+/0rTYfV27lqtyP1gS+d66I5njgSrkfICRfz30mqp
	iinHh002Porc/pUH5nXxskilyXRmMSqvQ8eNXfnT2xacaVzlHdSzKkRiu8GriQ==
Date: Tue, 14 Oct 2025 06:00:54 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
Subject: Re: [PATCH 0/2] Modify USB controller nodes for USB on X1E80100
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251014022121.1850871-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251014022121.1850871-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 10/13/25 11:21 PM, Krishna Kurapati wrote:
> This series aims to flatten usb dt nodes and use latest bindings.
> While at it, fix a compile time warning on the HS only controller node.
>
> Tests done:
> 1. On CRD, verified host mode operation of the 3 exposed Type-C ports
> and enumeration of the Goodix fingerprint sensor on the multiport
> usb controller.
>
> 2. Modified the dr_mode to otg for the first 3 controllers and
> verified role switching and device mode operation on the 3 exposed
> Type-C ports.
>
> HS only controller was not tested on any platform.

have you tested suspend-resume?

The flattened dwc driver seems to break it for me on Latitude 7455, upon 
trying to resume the screen never comes back up and the system just 
reboots from zero in a couple seconds instead.

I've looked at the code and I couldn't find the cause so far, but it is 
fine with the legacy driver and not fine with this one :(


Thanks,
~val


