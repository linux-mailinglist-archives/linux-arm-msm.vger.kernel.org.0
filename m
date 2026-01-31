Return-Path: <linux-arm-msm+bounces-91345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHyzCkCofWlDTAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 07:59:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C669C1065
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 07:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADA40300C910
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 06:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014BB318ED1;
	Sat, 31 Jan 2026 06:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVIWM4tE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NuqGSclw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7CA78C9C
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 06:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769842748; cv=none; b=f3us4T+XokSb8t+bPiGGDzXcsVS3QnY1QbdGBdWFWRabtirxpgm0pmVm/unhi5X9PV/2ijE8c4160/2BzJoF+MpBRnephYVX6zDtP4bI7cXTNnb83E9qemLEHAyGa5jqtW1JJePGEk5l3JrbLfTQ+gjNOlAnRuuljZHrcLe7LkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769842748; c=relaxed/simple;
	bh=/0+T+cFkdki/dh01i28H9jbcBtphAMy5PzjX7GklI6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRF/Vp9p5PMMhNBxOzJeEGYbml9VISViyVO0jNubbCFRxpF6Oosg790WSKLk435rONuDDKWxcMn94yaCyOWL103FNmzWu4tt/BnQU63e8+Wt1qB6qWZ9KdFohwwccRQE/NxEMtvaEPIOMmU0g106ANRRw0DDG06epvaLIPGTxlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVIWM4tE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NuqGSclw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4dM3Q1942152
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 06:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QP+gMghqHEAGfNEaofiyayNE
	TjTnaMIGARKkwi6pRcU=; b=VVIWM4tEIys5/eEU4ZhiHvTYxD4hHdaW+6PtZJXh
	LBNR6quW2YcZUkz/cL/Bu8b0qX+sELNn87aTG3QS7oXO4u7RyMXDp3ht/mSIAIfV
	QrZ398/MBL1jaUTA53cKr2fW9UOVwuD2peSFX46biK2iaX1uAdoP43fVlWhkZ2UE
	auxWJBAu6kesmH3swkSqW0WXVrVDMAlNnb5vZJDoM56Io6X+jOtsRgrX/5hD7ddD
	xCWJt4muiyEgayDE5RGSA0fwi/Y0OIXZS/jqZ5qtNJU8LrUjf4xPlnRBRS04WB65
	mjdbcIBZEUAQmr+p+oh3+xwJGHE5UBT5UrH4DW1o8h708g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awd89tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 06:59:06 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-948474e04b4so2488178241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 22:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769842746; x=1770447546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QP+gMghqHEAGfNEaofiyayNETjTnaMIGARKkwi6pRcU=;
        b=NuqGSclw3uzbdVMEN9cjPcutiYnBOPIwiHij7AQm0J9KNA8dN6lec3/AZG0foUCGNn
         FNyU4/0jJF+H7E7texG1Q60NqM/K+XpjmJ4oYJROBTYUNKpaQ6MDZd1IfDXMFiMenmpS
         VjSbPBhRJiL31e/uFT2+vAu4SYbHXol8SMu6555WAPN+M6jSkkdpFwUuPmMNSbyavg1M
         OtWZZx9lEi3xKTEroeizlFBIEM5otO8PZQH9anq7R3LOABN37EsN8S0rkxXFTcS5RJxF
         p7KETytrGEAc+QOchtjK+Ns3PyTnu8rc/OPDPHWlyw5073F7XpipBhiVUsIFwAOLEmyR
         YUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769842746; x=1770447546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QP+gMghqHEAGfNEaofiyayNETjTnaMIGARKkwi6pRcU=;
        b=LRgI+bm3nEvhlyDmCiRUIPb7fnoGZT7YxDAD89aAUN5dGREo7P1mAntL7VzVogMYJU
         5HdOxgUdy/RNm0BS9GyV5Kyh1SV6sj5xzwVw6S1EcwIG3uPo3ZoEWAVYU5LlkCFuRvdX
         TCztwRs0NlNV6kx/Ws23cFo1vcOX/MmYQHZJcWVzCAHhocL+hQ2rYYO1dJIEVcvXUpGR
         LivdaUx3Al3hdtkKHlmma/FwMF6COdTqiep9dB4qPG+4gXqL1MriBwXtbHEjUUAU2pDq
         Rr/r1DhVBXcx5PsMc7+7RcEUcGg+eQKR2NyBQZLzJ24bO8rrENbIQaHCKQf6xwMpAqnc
         dxsw==
X-Forwarded-Encrypted: i=1; AJvYcCUBY6LnpVv3MewVMazQ2c7gU/L7Z1O/VypjM5+UnPl6HwuEXBcbG0kDysZ1RdHmN8zFpWmBVm+DcW1vHxFL@vger.kernel.org
X-Gm-Message-State: AOJu0YyaEVsQEjxo+HVrFPFU1lNcG8D5SJFyU22cfGSc3RVReAWzJKDP
	fc7i7Umdfm1EEY04JgIQT/edRZJgINXKAxuyiJ0GPwXtFqMXJHmHXmrtnBRDTkeR1+wlAM/j9eD
	zE5WHh/VO+eVmOtqjSWr8IwcEpn0unpDcZJPC0eM7nZMvFwsVq0riYEt1vyKytEOhxRie
X-Gm-Gg: AZuq6aKOlUMSwz55kUL22prqu4ccddxzEb1seTghMLUuaUxyGn/ZV9PsQU417rXGpEG
	2TwrLPVFoTRppjE28cymu0W+KQQ4fnW+LPp8dzd7teRkK4UMy3h8jZrRLveE9hHUuv5RSqDQhPv
	jxk6LO7z1gO7sqwpGzI9rFnSg1/98tm8t5hpB9zhr5HUyysrlz+R7UPTduBRWD4ojMlbYaqOWg8
	NLEYaEx7NeQMU5zjmQu6kTqsj/gtuTbynRY6kTQZxYMXJQPZSi0COYLrbNc+U9tBzym4rYJdq3R
	61mWntGhNYIeEenUqPE6uL9iZ+arxK8IXHQSky6KFEyQcMf6ZePG3XP8ZBZMJrVvrpnFsEv3FwM
	j9MqYJxbvnXk1pN/h7SEVtUBeHdmuHSYV/e41qfmgAxgC9ePKXnNb5LSxCuK8dntO4suNoBysAb
	pAWELLkG+s93wVW/FLE1WQOTM=
X-Received: by 2002:a05:6102:3913:b0:5f1:b9bd:ab9f with SMTP id ada2fe7eead31-5f8e260255dmr1680063137.21.1769842745863;
        Fri, 30 Jan 2026 22:59:05 -0800 (PST)
X-Received: by 2002:a05:6102:3913:b0:5f1:b9bd:ab9f with SMTP id ada2fe7eead31-5f8e260255dmr1680058137.21.1769842745462;
        Fri, 30 Jan 2026 22:59:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074c0143sm2132669e87.101.2026.01.30.22.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 22:59:04 -0800 (PST)
Date: Sat, 31 Jan 2026 08:59:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Aishwarya TCV <Aiswarya.TCV@arm.com>
Subject: Re: [PATCH] thermal/drivers/qcom/lmh: Remove spurious IRQF_ONESHOT
Message-ID: <md3ohsrso7hldhhlqwsky4rc7yf4uvpugyctvpge3emfc5xgsl@flei5hr3fxw5>
References: <20260130-thermal-lmh-oneshot-v1-1-9b132204ef1b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-thermal-lmh-oneshot-v1-1-9b132204ef1b@kernel.org>
X-Proofpoint-GUID: YxcJDMVUgVR6MuXrFBt609hwyhPioFcC
X-Proofpoint-ORIG-GUID: YxcJDMVUgVR6MuXrFBt609hwyhPioFcC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA1NiBTYWx0ZWRfX6fPHmtm5d7yr
 adcY7E22tbzmATQeDJTBw5kLI/jakougHyQob4p56yMlwX8t5EgFFJC+OgU0exCxLI47K1uzHX4
 5sykMcAg7soYIL4bfGC7lU8sfx8C5ij3mIr2CtkeZC9UjBPEhvVHz75Uqq1ETRBXz9l5xwj8D0t
 0MYdIzUpJXt9APaDqRp9p9fD7VPOeAHoRlzeDGmLpdkzJZioFUxJOT6l3MAi3Hudvn1WYPG5EDV
 wEUwlgUNAVj1ikiKfPtedeFt4UWLfaTMp6IOBP5fxqIB/PRDikjnXgc174mRNOZ4pXVBNIve/OL
 hTo4Qc3ABvMZ25sNqP36e2b3iSKij7fBgSVvdNqspRZpVl+/AppwTwe1MjjN69iLVay+pR/Srqh
 7ANO8lw6b1lGJNeuCar7llN1B8Cny5kOPr2UP8WHcxXHvkv+gQZNh+AjVU+rqh408V3/8rKTAlR
 1oOl4KmGBCc6Bjvp5GQ==
X-Authority-Analysis: v=2.4 cv=T8OBjvKQ c=1 sm=1 tr=0 ts=697da83a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=OmOFX718bP5z8D8vryoA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310056
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,arm.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91345-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C669C1065
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 04:54:45PM +0000, Mark Brown wrote:
> The lmh driver triggers a WARN_ON() due to requesting an interrupt with
> IRQF_ONESHOT without a threaded handler:
> 
> [   17.414825] WARNING: kernel/irq/manage.c:1502 at __setup_irq+0xd0/0x7a0, CPU#7: (udev-worker)/154
> 
> ...
> 
>  2361 18:49:55.941384  <4>[   17.415074]  __setup_irq+0xd0/0x7a0 (P)
>  2362 18:49:55.981820  <4>[   17.415085]  request_threaded_irq+0xec/0x1a4
>  2363 18:49:55.982122  <4>[   17.415095]  devm_request_threaded_irq+0x80/0x134
>  2364 18:49:55.982365  <4>[   17.415103]  lmh_probe+0x31c/0x4c8 [lmh]
>  2365 18:49:55.982594  <4>[   17.415118]  platform_probe+0x5c/0x98
> 
> This warning is there because IRQF_ONESHOT is only meaningful when there is
> a threaded interrupt handler and this driver does not register one. Just
> remove IRQF_ONESHOT, it wasn't doing anything.

I think it might be not that easy. The IRQ is level-triggered, with the
IRQ source (if I'm not mistaken) cointinuing to be high level while CPU
is overheated. By removing this IRQF_ONESHOT we might get an IRQ storm.

At least it needs to be validated on SDM845 and SM8150 before merging.
I will try doing that once I have time.

> 
> Reported-by: Aishwarya TCV <Aiswarya.TCV@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/thermal/qcom/lmh.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

-- 
With best wishes
Dmitry

