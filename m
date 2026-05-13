Return-Path: <linux-arm-msm+bounces-107364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLD2M4SQBGoVLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:53:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9354535860
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 493703001FAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4CA44CF2C;
	Wed, 13 May 2026 14:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YET3eFyc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AwBrdh6u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCC638E5DC
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683477; cv=none; b=Gi29IdGXb/E5dv6T9MDsOk8+4Y3qZAKdLXhxAsgrwpxzMREbv3lF8jFq46aZyZ2ACq9gVt0QAeMERFYqLdcQP302yc4hUHm5IfuP+dABNJy/QRcs3eF1K2JgLKiE6Wh4+uO1PSHUL8wceS9hnQxqHzi5Q1Z0KMDA7QMNB9Ac/3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683477; c=relaxed/simple;
	bh=5/o3fOjA925+2aR0LfY+xcd4wMWyZg4/UestgLqRho4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJ/m5zqrenYHcLBC2n2KNibFlxvNq8Dq+0jiApPg5zMc7mGlvlR6pRL74RNUrciVWWuX7ZGBlIG46ZJsw/07wXdD0JVwHseTJIMDIoe2yd+IgZhVovtwzUfccUo6L1jvnxMU/UQ3BRQGh1Qv3XEpEOMypSgxDZIapvX8tQs87/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YET3eFyc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AwBrdh6u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8n8ct2887818
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4RrmG07hzLVuJFz0XsuE9L/j
	GG6n2U+1RQiGpla++ko=; b=YET3eFyc9L9J+iBmLq0wtWQs9NyTP+jQi2cMCuoN
	OvdLsmAQ7NNFbJ55L9FZD1wkSV4QQZv3TdvqCXaCB4NO45owBFDkWDWk3g1e8H+W
	zvzrLZA9Iy9UQt25VQHYdXMMdwdgPTes1oZAob6Z2xHRnTTgfiKFsPiIy5goVeXj
	iJJHoEsYpKHaQzMDUFinqR5AlPE5NagYJYxAtiOSHCA2XGjK2nVojqBd9+mwTk+J
	0/qfqphVsPmY2Y2UicXi6am+UViKo0y4D5vg84BX8dnNLwgoUfGUCdKevP0tk+Gh
	pCmbe0K+uYwmkZmwA/vmdao61tb8tO6wQUd5pUO9a+4IUw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ghchg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:44:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-634ce585b41so1887631137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778683469; x=1779288269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4RrmG07hzLVuJFz0XsuE9L/jGG6n2U+1RQiGpla++ko=;
        b=AwBrdh6ugoatLqYmoAQ11C3WLGqL1Gsc7khk8apB6mjLpq7ffDC9Dsr26Z835gvfi0
         QNk1GqB8qjrrzTvOSrSqb3sBqylEpyCJGZTYPMJWf1BXD1o8UuKo7eokL0CY6UpiBk+Z
         l9/eGAjSLck+X29fVQYyXYZ2JPOMowDtza5kglC7RDPGUUEUJVRULsMLGoR0gRxc4e/n
         3qSiiOOBONKi86jvV3WUw6+IZ+UCJLVIvO+Kep0MAG4gi9wxzRwTG82zIIxjJ/4HSxN9
         8eEsTBdRzX1GAOcFnxFHvNf2Om2LHIPMbz2HnSzkjJEQpJLvkmfnLIR/j+YflKqHWIVl
         fDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683469; x=1779288269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RrmG07hzLVuJFz0XsuE9L/jGG6n2U+1RQiGpla++ko=;
        b=Wxgs5IQ7HI84ix/iqZg7Z5IIgbHmXLf7VX8pwgSH6EdQLiYe5cV4RPOsCqp3PxU2bx
         ijYEx84LaCcEjIWG+CTv68R6Jl4Jl69ktARCipk++dIkuAGuKyCKy9EE9WoJtg2YI+6V
         8qXXLefxQiPuzBREH4W6Yiqltv8pCYrMOP5PALFJhDbD9ARQMAt+SQMV7rOoxiLh63cg
         x2ON2lrdvwZxO/gB/vNjtZOM56h3WuSaYjQbAmrTGADBLgwSlndy+0zosHYpwZOuQcvB
         QIVKecMsAo3zi8VOnbbR682vmqjSJeh0pr4+73gK3uMw6inkEFLts6j6cZOymJToncMK
         YGUw==
X-Forwarded-Encrypted: i=1; AFNElJ9jthXTfU9x+jkekwSIW/WMWss9izNFKakN9CoBZRBN17nDA3QjG/mW+hw1uPXBI2CbwUDfKUys5DtXfm9J@vger.kernel.org
X-Gm-Message-State: AOJu0YzdO16cZfd0eMWPZKvyhx/ADuu757B+LoPt8qsjfDiLpYVKVyna
	lZPyHrIYMBBLgCANY86TNTE5YVxBcuuu2oxJKz0y2ULShDl+FVk7sjJgxwsjpZ7oHrNFGo1ukTS
	DsbIIHJTqsdbEFTj9qwyhVzR6jvqDKqqDADj1ycaayzP7sUED8e46WuNNiEs28Ooc2B39
X-Gm-Gg: Acq92OEmAuEYrzEWw8JqToCxcV9U3wltm4rQp4enMYF9Hdr1FzZVmdgHPscWho0IuRy
	zMK453ApSPG5cBIrqgFl+VQpmC4Q8W2foB/hRPpLtHO/9COcdYJqBgZ0TqLIuEwm/7gPouxmc27
	wkOxLqtO0nXRhosGBQrqG9lersQGen+kxUAABNnjAzHhvZNoSHWTFlEnIoa8LhLQcWdgm00OgcK
	YX/bQGGrB+WTSuKy5ymtzxlkDkunHYhlvn9ACKT3Oc2DRkM9rtGA6/ZbOBSY6N9Ugvlq6K4ycKk
	+FIjVQHRM0/mUDoXSxNTWaCAIIDTqL5ZYkONDKTsGaf1+uOrmcDlzqVy1LHxrZS+wDmPZ/r8XUG
	7MbMeS57wVf/xj2qjGm1JycwdcN50LZyHBO0xGA7KnDevJn3WtxENhMU05+34pq9kFzPliPs81D
	uV9hPvsuMyhKr8z8P0uKxOfHPS5kPdpShPI2I=
X-Received: by 2002:a05:6102:4a94:b0:633:bc46:c20a with SMTP id ada2fe7eead31-63775911524mr2035434137.31.1778683469406;
        Wed, 13 May 2026 07:44:29 -0700 (PDT)
X-Received: by 2002:a05:6102:4a94:b0:633:bc46:c20a with SMTP id ada2fe7eead31-63775911524mr2035390137.31.1778683468669;
        Wed, 13 May 2026 07:44:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c6f78bd7sm2578927e87.74.2026.05.13.07.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:44:27 -0700 (PDT)
Date: Wed, 13 May 2026 17:44:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/16] media: iris: Add AR50LT core support and enable
 Agatti platform
Message-ID: <xxjntsesqwz3kforkk3hzet7fevmkcmg6mivae3n3xrco3jqpm@yu76qknvtxpc>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
 <08d40bf1-2bde-4184-8792-40342112f3d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08d40bf1-2bde-4184-8792-40342112f3d0@oss.qualcomm.com>
X-Proofpoint-GUID: 9bKhsMUTzZj20Vvqpr3jV5LQukIwvTve
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a048e4e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=BwEK3Y93O76JwbGyEuUA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 9bKhsMUTzZj20Vvqpr3jV5LQukIwvTve
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MSBTYWx0ZWRfX+ZdbHetRajv7
 RHTpcBSuIZTh4eQfE27+Bo4ROZeV1QcKuu8vJmxulmae690SGHMh+aMSC1kRApZ8nEqDTduHsd9
 ZwdxCUtdbXAaMDBY/lFTKKOA/pYdnu26AQSM/s6Z80Jg1cFHAbq/RfzPM0vbndvN3gA1MGwKVBD
 3AaJJsgJsJxfGX/fvH4hjMn/MVg1buPI8TFdwNkLi6lRscOUW5lx9af6vNV6enRtdrjHwFff3pU
 3qEDvjsp6AyBmFy2oYpZFos7ZXbXppyfxlc4j7NcdlR8q2S7MIEHOGq1qCpCvK/yqYL/tpUbpd8
 DippjlfuatFWFwpvnE/2hPau9ZCjdhiH4NnCSseBGo24Q6dkT2WJbnJZaiTDdVpuCPw/E8dJDK6
 0ZzHNQ+vZxXuUGG2wcnctSoOSUoSy6siHmwEbmbt+5iIea5rcRB+UgbXEgF7C7xBx81M6xJw30j
 p1NUOB3Yzf+hmAoFdgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130151
X-Rspamd-Queue-Id: C9354535860
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107364-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 04:34:11PM +0200, Konrad Dybcio wrote:
> On 5/13/26 2:45 PM, Dmitry Baryshkov wrote:
> > This series adds support for the AR50Lt VPU core to the iris driver and
> > enables the Agatti SoC to use Gen2 firmware and HFI.
> 
> [...]
> 
> > base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> > change-id: 20260507-iris-ar50lt-06228469aa5b
> > prerequisite-message-id: 20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com
> 
> There's 6289 prerequisites listed in this cover letter (probably a record)

ROFL. It seems I forgot to change the base-commit. It's
media-committers/next + Kodiak-Gen2 patches.

> 
> Konrad

-- 
With best wishes
Dmitry

