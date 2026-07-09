Return-Path: <linux-arm-msm+bounces-117890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qmv7CzFUT2pCegIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:56:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B843572DFC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:56:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Zfj+Ek1g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PB2f2j86;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117890-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117890-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2DCF8300C00D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899C43DE44C;
	Thu,  9 Jul 2026 07:56:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B97C34CFB4
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:56:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583791; cv=none; b=ZnJMdEc4d1YSDWt8D2Z541O0DvjzKeB6TDX3DFY/NGPDQm2Rs+IMzLQ4XmyBV3cH8QGUgbB+KDhXZUreHms4MMIZSJwFvig8Ob+xKI62+hdm9dEWaw/8sezseuwV6JNRrRKr9T5myH1hTkcn8pUnWwTmFKmPkSKCsRqYw/xqnXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583791; c=relaxed/simple;
	bh=DrsO9+/TcsBnB6GcVVjgzMY7RlrO4vA2zjm03UqMC6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HABee43+3QVXxI3KzpadvJFYKPiTmW7+QrHD8PWvBWgg00IZToyf6EKqoRJ5EK6oG0FZ1pxMw1D8kYKZWShr02kQGntbaMEDQbzBFKNLJ3fdWmkLAzi0fuAItTmsMft+jqwm7rnU3B35zwbYCGS/n2f/9MWUBGgLjQrMPYvxlM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zfj+Ek1g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PB2f2j86; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960FQA931903
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tZzhSBXFUjefGXREmfHjGo5T
	SfL/nszPC7B8+7oKefo=; b=Zfj+Ek1gABNN/Gh5yAb3fIBha4HsGYuVpu2u51z7
	pXo8lOWhtZq9/pC+S95fWzlR0Sz1VSCLi+bS9GGHGz95//ISs3FRncWdIRjxkONn
	zC8T07vLI70Hkfq4pH7abbk/H6R+M6wWQsP8J8uODjvrBpJFEBD30Wnf776E7/dH
	wDG5Lxn1+f+ez/t5RWob2F0MGXMwW9f+85kyAIgxoYncPmsBDYPkwn1qSyx6VKWF
	WU+3GiLFVHCc4Adn8xMtSGyno/TD+4fGxLW1haKfQekyf0GJvH+qtb3E8x9aUn7g
	4o8U+XQAblrlXsU+VID/1QsyROrxyQtTtRBFHdz4gXT/Vg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsb23s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:56:28 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738e5b5ef68so219250137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783583788; x=1784188588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tZzhSBXFUjefGXREmfHjGo5TSfL/nszPC7B8+7oKefo=;
        b=PB2f2j86pOtBR33s+m8eFyFY20aiueKoxbk97p8Xs2Kd44X6RRNKuuBFIAxnf3yGPU
         FJCTNJIRtb9jOD8hCnRQQK3bxt2P5X1Om/lvsNS1Psdlazitv4CQnZQlvP+zZIbl1Yxl
         Zkoqq7xkXI/tufdvLd49/D8llqvVJwMCevjbGl0KCtJrRlxcSTUct9XvV9vSDbtEQHjd
         VJJXg6Rd30EqSQTXeWbKvF6ugvrlFnwUHcPIPdKBPuEACzmR37azcETlmmxTy3hUMpYm
         g3zYO5VJiHZB1YS1rXFAGxJ2e+neV1uu1sRSXRuBsQc+9u5bSjndrJTUGhGuFHNBJpm8
         BGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583788; x=1784188588;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZzhSBXFUjefGXREmfHjGo5TSfL/nszPC7B8+7oKefo=;
        b=sYER7A95aHZ8MRrXD5xZneiT183jUfjwyxoeIMXAdkpD4ihLzkjPoP73ZT13ZiXmRI
         rxEqNt7E5vp1oiZutyYi0kYBN/RdR+TF0WPCxh5I3hqt2MAJAQpgTCtUfk33MTIDe3il
         TIIL0biqmA3PAZ2zbKHRBcVlwQoKrremYaYwF8YzzM1Dw+KgmCyJHlkflmTpEOmS0W3Q
         skK1mQZGIzhJLMry8vGOYe5+48MMWnqUdKPewbhcnvDyCfc0YoI5hR8l6+Rgtgwu2B6N
         gZP09TuzcSnv33z4fGUhtMH9Pnn+eT1IYWR7RvDTOg4e2rfgZXuMJ5U6W7NufA4+2Kgj
         LjSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrZ0k6WoDDS/U1PP0tFHxDR1bof0tiPFF09oY+p001qjWvsoAk57WnOiFETk6nC/8Bwp3irLI06Vm+IvaU@vger.kernel.org
X-Gm-Message-State: AOJu0YyXCSUuHnYar70+On9DsE/renCbo9a3iviVhcuoEO/gshYyMdir
	AlPohuxV83nGLQQH3fwV6KY7yQ6QFmLGgDGEKcuJ9t0ZMrq3mLonSVwY+c+smlZBUJvHTQqHuvK
	FFOlAKXOEc1Hfb+XqwRkCQjYJSr95r+jsA/GAGmTDwxUYa/NzBGiX/fSK9ogxRmdxOQHQ
X-Gm-Gg: AfdE7cmjwaRzU/WGkzEFnrNTYdKDf4u2pzgbCWl2XQ10s9uAYEcZg1G1W0mcJWlWfRr
	NVaM+s5vGTFViMxIqQHSThPKE304nv4BIp4hY2A68/wF2rV3FTWj7CegTY7orFlHJZ0077iW9ex
	2PZWvTQLzJz10XGhvFhpNXoEpC9QBw2x8Z37HUhdBD/9WnBrgwbVQnWdLZaQi7VnpuZmmI68mKj
	o6P393Q1zEM4FTktmNnazHo54TWifrKy6lII1smHgslxoXedByObjLrFP6v8nhhUkpao7yquECU
	pSOJ6E3KwczeBA53A1VppELZp2ygaHEEFReRLVQs9oSd8lTDKUBY1DfxkLCB13EjHeFSP8H4WZj
	Vqa50eFDO4RE4wWcC0FDWF5ylY/v0myjhPnP/0QTe4amv4Y69+Yg+0BiJNvG8yKQoDggM2AZzoG
	8HDsERuNN4KSh5ISPTR9g1w/aW
X-Received: by 2002:a05:6102:418e:b0:728:68cf:c76 with SMTP id ada2fe7eead31-744dfed2a9fmr3555128137.23.1783583788124;
        Thu, 09 Jul 2026 00:56:28 -0700 (PDT)
X-Received: by 2002:a05:6102:418e:b0:728:68cf:c76 with SMTP id ada2fe7eead31-744dfed2a9fmr3555108137.23.1783583787538;
        Thu, 09 Jul 2026 00:56:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1370110sm5020603e87.9.2026.07.09.00.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:56:26 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:56:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH 3/3] power: sequencing: pcie-m2: Deassert W_DISABLE2#
 when no UART serdev is created
Message-ID: <gatls7n4xes7mrnhgxwsjof7owpocdmjrvuxazedznwa3zeb22@q3mtufc5dzkv>
References: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
 <20260709-fix-hamoa-m2-w-disable2-v1-3-5e725091266a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-fix-hamoa-m2-w-disable2-v1-3-5e725091266a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NCBTYWx0ZWRfX3ru7roLIjwLd
 pTQEpHb5Xk7mXX4dhuF9iYzI2RrjxMs/kjqieaQz56wIXMMYjsmwV7Vo4FtMPzinT0aKJb2Ws9J
 AXDn6jZMohxM7EQSmTDplb8NFOfewIs=
X-Proofpoint-GUID: c7i5yIcbnZt2qCN3eoLKryhgQ2Xq3oir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NCBTYWx0ZWRfX7sZRNREgCr0Y
 P7BqsIxM0XE2Pi3BnLP+jgzR72vTr2NyA6Z3J72h1KwcEWBjnt8/fuDbtJBVNTmZEYt9ggl29JC
 SWauuGqEL+BVQEMeSe3GBJlTz2wjsBRAP/dPrjp9oADF8+bXV4X61DQ/tmHbZLAHE8rARXuChAx
 qvUhrWuDERHbLV5II90bpnbpr2ag2g2YooHIFrnLPoVwL3LMcorP+KNPNsTX7Dzq4mTn8J+KPIR
 z1LPBCjUSvC5YceYcEq6/eGc/qoGjN9QKVu/cpWlEoWRZAO0qP/a5aaTlq+HLv4wXpjRdEOAU9T
 EcqA8IqgvAw5rqmk03AWHdQkCBD8A8j1c6e3scZad9bVKGQv+z1DChAvhAIK77uHrFrDbJac1Lz
 L/dYeV+hsP7yKMpOw9gN+l+H6KaBzhKx8ufCjtCmD4j7hTtpPtiovJzn6N556Rm0rq4mw9pn1kd
 BltiwZQWwjjSIrHYsMg==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f542c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lIAhulC54n7EYnaILX0A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: c7i5yIcbnZt2qCN3eoLKryhgQ2Xq3oir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117890-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:wei.deng@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B843572DFC7

On Thu, Jul 09, 2026 at 12:59:42PM +0530, Wei Deng wrote:
> The pwrseq_m2_pci_ids[] table lists PCIe BT devices that use UART as the
> BT transport and need a UART serdev created by the driver. When a PCIe
> device under the M.2 connector does not match any entry in this table,
> no UART serdev is created.
> 
> However, the BT subsystem of such a device may still require W_DISABLE2#
> to be deasserted to power up. Rather than adding every possible non-UART
> BT device ID to the table, add an else branch that deasserts W_DISABLE2#
> whenever a PCIe device is detected under the connector but does not match
> a UART BT entry. This allows any BT interface on the card (USB or other)
> to enumerate without requiring explicit knowledge of its device ID.
> 
> The primary use case is USB BT variants of combo chips that share the
> same PCIe device ID as their UART counterpart (e.g. WCN7851 NCM865 USB,
> sub 0x3378, vs NCM865A UART, sub 0x337c): no UART serdev is needed, but
> W_DISABLE2# must be deasserted so the USB BT device can enumerate.

Instead of forcibly toggling it, would it be more sensible to tie pwrseq
into the USB too? The onboard-usb-dev implements the same idea (of
powering up the USB device), but it predates pwrseq.

> Reassert W_DISABLE2# symmetrically when the PCIe device is removed.
> 
> Validated on Hamoa EVK (IQ-X7181-EVK) with WCN7851 NCM865 USB card
> (sub 0x3378): without this change GPIO116 (W_DISABLE2#) stays low and
> no BT interface appears; with this change GPIO116 is driven high and the
> USB BT device enumerates and comes up via btusb.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 33 +++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)
> 

-- 
With best wishes
Dmitry

