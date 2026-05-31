Return-Path: <linux-arm-msm+bounces-110475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ZVlBZxVHGrIMwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 17:37:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F830616ED5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 17:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 71027300533B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 15:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C821C391828;
	Sun, 31 May 2026 15:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjpBGxy2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jaTAsEuU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBB13914F5
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 15:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241805; cv=none; b=c/GEdyL9VZE9bBKmvEJN+DnFcr52qajiDqS6/q/eFCOS2xvwjIaD0yqq+rd4+V3HbeDPYvsOnXeo7RdXdppkPpWfKPz807RVELJSOaY6660z7Ip5QlZqTFq3fdrFmdJ6JiuPbjzxo7CzuKylImBlqB6aauY6oQu3KH6FyCB15Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241805; c=relaxed/simple;
	bh=Vm870xPJE8qvzXWEDH5XaelUxRUQX1IJ86/QGb5EVwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cfj8eZSBniqLH2RV+DR3vkqpjxhTu3hgW4ZSwo/7/MrCe1tiTybVXGfQGql+35AiLh0ejaI1AkIbD9+TBJVAbvKWqCMLVAAVIKluSnjY6NnX0/OMdPMCudLDq5dIEYSlCMg/S6oKnSR0t+tly5waZf9HccmWU0uYkA7bfSRT2D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjpBGxy2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jaTAsEuU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UKRB19985603
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 15:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+hMrtd+FJbHgB6523Eb735Z1
	cc+qiHlvfKDZVpjYavk=; b=WjpBGxy2Xj73dHbVnbKFVeKPMq5ZBvQ72iJN0o3e
	DI4l6f15fi56O+F9VAeIeP+E0l3cyJNfIpY6CNg/JWIjnXsMkBM/K+63FzTmyeH4
	PxH2oCXf+JrTd+YzKM7TSd8sXQvfZvGnPq1Sxt6nI094NG0Tx5woebj4JZol5NW2
	W8GV8iKXAu4dU800w9K4OHDobqvcgXlTppIfKgMgPk3mSgEktSUbLP5RwztQ5vyt
	tAJ+oVMVr8qcA3iYK71JD8HOWtR+QTfCPn02FGtuGNxYSISZHz18bFAbqXeYv4Of
	hZxWy5D3sSaT/G7WuOs+jd3MAZMi+qTmns6YWXu8yvkhpQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux53et4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 15:36:41 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfc719d238so176383137.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 08:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780241800; x=1780846600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+hMrtd+FJbHgB6523Eb735Z1cc+qiHlvfKDZVpjYavk=;
        b=jaTAsEuUIDP8R04x00Fw0H+iv16jI0D0eDuCLdSr0P9GC6kvfOyBY52a3EEnOrxEVZ
         N4da/HfSqFYYL1iSKVFDEEuhUJiPAWqawQvNogSc009B2ZIvHFhJxyA9I+9kZQ0Dm26s
         ioUdgPy0W/LhlBxR9kv/pUAFxkI1J9GvgyNYlr2h27as+ojiIv7WJK4CxaMHBJpDW58D
         MvYfbdMiUkE9q0UdvemeVQEFRYCY4C4X+wzBrQEdf9dJrYTMbrfAKBUVxa6Br4902Lai
         3kfzAUFI4CwWxFSSoBjPhVsJV+TUQjVvjDlplmqQGwCsQ1qpMqRdQTITHSUF95mo65F5
         xa9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241800; x=1780846600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hMrtd+FJbHgB6523Eb735Z1cc+qiHlvfKDZVpjYavk=;
        b=Xs0apVDTpv3AUA6HhvDJ2tIE8BJi8myq9+HAPJ5HdYN7svoYA+4GwQV+ODbMQGwEb4
         ynZOkNTX8Qu7DVKm/mnTZTm9kw/kstryADm3EUmDHGIWauyjrJ9tB+KrbO943/pS2wN+
         P1tZsqrMk+6SrXbmdn0Mi6liiJsto69PCLav1U6AIpgsbUNRj/9Ufzed5UAAC/1WyUlC
         6/t4zcG2hNlGqUeXCtqywzGDgFIjLKnHHtNjG8qEs+DYWOXwj4jr1V9ZjbdsTQabgIMi
         Eu9h2GZUuJ95r1horTg0z/tvnSlm8bt4JrEeBAZFhWJdc9RvIbmUpSzZtg3Rpsi2J08g
         EZyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5726/BeBNtMGudFj+jVhz+xxpqVYXWjdDdaGdkBVjH201L08xEXCdG+rXEl7p/FQrqBWHz3vD7lV84aPs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz/oaEkydEmmfspAqeIJxXwprwMgTD3GWbY2bUBrNLUNXHKzPB
	2bTcWgkvnDnWb7or3HR3oZU4oXpxJ2wCoKvWlnonhFoeCSjhmtheiwVj7sQ3XVnzmEx+gM3TvGZ
	Bo9vXq/qUj52ugp0ny1vSq5Gsr7/ALYlPCVSYBpkqFnJjcJ0d01+02MSHhvLprQjnPJkN
X-Gm-Gg: Acq92OF1KNHQwV50modJYhziibDWzyX2KGAyqxePfHE3Cx65AwcbjilG0+5Oyq5gvUH
	XfiWTZCMB3J6bi0Hp5uspPwKGXhKzPL6opVF84jYrsMPe5u3u2AUzQ4YHf5fyozzok6D2CjKizk
	HgEy/ELFKRp64BjFDptVJUkdLg9Nziv4C9zHW4R54IUXsW+Nq4YwoZEzm36v1z0jK0j+CgCAOWq
	1wp+umRmYMxPEAgiGWzWBsUuPYewzY5ilsIvcQUHDyndnq4D+Ib/jpt2C17JFPtMAROf0BU++EU
	jyDvq1ElGeHjoRh4N0qGLtjfNqbRyd7cNnmBgpMXz879MHQjoXebpOsngn5WAnRcBCDyEVRbT2f
	LefQBYq6ftIOh2UvyelX3/i8jJK3eNvNGFM6T1QRAAjIoAMvs/tRn730Pd5utuA01CaJN9o3ffL
	DZnxlefe9Lb2HMB4+0cy6o6/UXE+MIF2v8RxPKgC82I8GmTw==
X-Received: by 2002:a05:6102:3ed4:b0:632:3bd5:d580 with SMTP id ada2fe7eead31-6c6a692c706mr2038892137.24.1780241800550;
        Sun, 31 May 2026 08:36:40 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed4:b0:632:3bd5:d580 with SMTP id ada2fe7eead31-6c6a692c706mr2038885137.24.1780241800047;
        Sun, 31 May 2026 08:36:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b06892fsm1579390e87.13.2026.05.31.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:36:38 -0700 (PDT)
Date: Sun, 31 May 2026 18:36:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/2] clk: qcom: add MSM8x60 LPASS Clock Controller
Message-ID: <qwqfndeyqbj2zg7q2wdqi2rmxomlrxr63rx6yck4dv3i2234rc@xfhu5jfftkzo>
References: <cover.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1780148149.git.github.com@herrie.org>
X-Proofpoint-GUID: 2O6TmqZaThYij-xMrBpGVUpGxUhNXgLs
X-Proofpoint-ORIG-GUID: 2O6TmqZaThYij-xMrBpGVUpGxUhNXgLs
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1c5589 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=O8aYC8MWdK4RqN8XWS0A:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDE2OSBTYWx0ZWRfX8/mH8Nt1iZyN
 fPpMzXk6ssStg7BwEFzznt7zbTcB0TZEa6ZHqbnI4zxL6IrS5fI3Ifvohe8v5/wdQc2aDECHq11
 k74m72tMrOAor64WRlSre+9VJz07rO/+fhCptAKqJFFVB0WTVt/ea79uqSSvhWUGV2A6+ajA+yu
 r+QRrAjehHl/dX6qiZk9970rtBZZJBBj9q+FlL0eoP0P1aUThsOCglj0RnEbUwK3YnKpCkZUTUy
 QFk/5Grk20qfw3xGVJYwE7ramqx8GgE0c7HysnI9CxLOgRryWujO6Z2QPpLWOHo7ZwP0YuDuV8R
 m6t5RHh/KL29CDOMBGWvprmpqUlJ6uXE3yYP7hQ36QnnTW2Dl/XpEdUox72JODFAzGXeaZllWp7
 EulUJyKfNzRlAfDzZMbpT4ReQjTus6VAyAVhga5M38wJU1djgRMH0nho71OPCkBzPCy47t27MX3
 EM5f/AvpTGT7aRXdO2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310169
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110475-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F830616ED5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 03:59:56PM +0200, Herman van Hazendonk wrote:
> Hi all,
> 
> This series adds the LPASS (Low Power Audio SubSystem) Clock Controller
> driver for the MSM8x60 family of SoCs (MSM8260/MSM8660/APQ8060) - the
> Scorpion-class generation that preceded MSM8960's Krait CPUs.
> 
> The register layout, parent muxing and divider topology of the LPASS
> PLL/clk fabric differ from MSM8960's LCC enough that a clean separate
> driver is simpler than parameterising lcc-msm8960.c. Both drivers can
> coexist (different Kconfig, match table and compatible).
> 
> Used on the HP TouchPad (Tenderloin) where the LPASS Q6 audio DSP needs
> functional MI2S / SLIMBus / PCM clocks before audio playback or capture
> works.
> 
> The new binding header is dual-licensed (GPL-2.0-only OR BSD-2-Clause)
> per current qcom-binding convention.
> 
> Companion to the MSM8x60 MMCC series.
> 
> Thanks,
> Herman
> 
> Herman van Hazendonk (2):
>   dt-bindings: clock: qcom: add lcc-msm8660 LPASS clock IDs
>   clk: qcom: add MSM8x60 LCC (LPASS) driver

ALl of your series got entangled and linked to the same thread. Please
make sure to send each patch series separately. Never send two series or
two versions as reply to each other (yes, new version should also start
a new thread).

> 
>  drivers/clk/qcom/Kconfig                     |   9 +
>  drivers/clk/qcom/Makefile                    |   1 +
>  drivers/clk/qcom/lcc-msm8660.c               | 517 +++++++++++++++++++
>  include/dt-bindings/clock/qcom,lcc-msm8660.h |  48 ++
>  4 files changed, 575 insertions(+)
>  create mode 100644 drivers/clk/qcom/lcc-msm8660.c
>  create mode 100644 include/dt-bindings/clock/qcom,lcc-msm8660.h
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

