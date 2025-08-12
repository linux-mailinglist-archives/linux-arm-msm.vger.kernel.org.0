Return-Path: <linux-arm-msm+bounces-68767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8D2B22634
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 030A31635E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55372D3725;
	Tue, 12 Aug 2025 11:54:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E915C2E6137;
	Tue, 12 Aug 2025 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754999643; cv=none; b=jYPPY4uLdqAnHj9etYKU7nQInxnc+ipToVMq/ZVengoAPgPHW+bRXxJB6fALbBUApetmtZ7SEqhTT6QhjR6Xryn+ncT9Dv5RF2DJis1imGfu1NsVMbeQ3wVmSVkW74Qa69+/ikEgZL2UhoWiFGzZOiJsF6Qbx3rcYxnJ8QfYi14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754999643; c=relaxed/simple;
	bh=tqK24q9RBg6PIIYPSFRxa08WllbBq0EcpzM/lGTdH44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pRxrKgPns89+RMr2Tvse35nK4obVWWWt2Pb8HpiMGtColnPQJUEFWBUaMbQnHJo4DI+NyWM54bi0Ut9wxFRnHvmh8dSkPXWBPnHPbM1p+MImoRdNOBqzq5d0ngmV1ios1/bGqrWK6tWj/SCaklFGIZdGrhGLAPSQVVPrPH/pb94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2E4BF61E647BB;
	Tue, 12 Aug 2025 13:53:53 +0200 (CEST)
Message-ID: <c7bf8c0f-ebf1-409a-9985-bf76474f039d@molgen.mpg.de>
Date: Tue, 12 Aug 2025 13:53:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fix SSR(Sub-System Restart) issues caused by BT_EN
 being pulled up by hardware
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_bt@quicinc.com
References: <20250812113620.3135226-1-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250812113620.3135226-1-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Shuai,


Thank you for your patch. In the subject, I’d use the official spelling 
and put a space in *SSR (SubSystem Restart)*, or *SubSystem Restart 
(SSR)* [1].


Kind regards,

Paul


[1]: 
https://docs.qualcomm.com/bundle/publicresource/topics/80-63442-50/htp_ssr.html

