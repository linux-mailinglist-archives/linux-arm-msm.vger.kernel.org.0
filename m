Return-Path: <linux-arm-msm+bounces-96794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA2PBLDFsGnTmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:30:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7325A565
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F81A3057681
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B153435DA43;
	Wed, 11 Mar 2026 01:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNdLaoif";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dcldvMY/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211541C84C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773192620; cv=none; b=VJTJYN3xV0j5U26GyrfZMWypXG3hqqOk9wvaReGYKsHsCsmDmkZF9QKyqWnzBkWcgGNEN2xpexJ2IcL1KzYA0QmQZRqf0FCP03aEL8zKbAV6C2T2KPcrtUCflIb4k5kj6POlsTAv+jj3n+bz8KLeorN67uFy/PJHvACaBsxc/yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773192620; c=relaxed/simple;
	bh=KhYfk5La3zPS9sY/f9J+v3gPXX+NIozeZDPHjR1XfM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaAQaBdOjhXsHMha5Vw8jk0Ty+9GGc0sM7Yxv/S3zTlUa7A28mRBcNpdyoDg9GLwOGbg0n5Pu9+PgWrEeVk20nveRH5dcdcv0dxmDq+RP8EZFiOvdEHfPyrRy/ImhvFi2pWtg51qvKw6CE4ZTfKHHx5oyojwWAub61IrFQG7r+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNdLaoif; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dcldvMY/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AKDfR51863186
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bkxQqKRENO2AomQ27AYoBHJA
	PGDEOt3uW5XK36rzZco=; b=PNdLaoifCFCbxWyrergbYQ4vzvXT+4kj3Rt9chIe
	VFIp47pPwAezmxzfoOoTI7xIeKDRP7//mGEElrYEzxMOky2udA4oBiNQXajJROit
	NQwtKb1daUGdP5ug3KcrerHTh5CX9SlCAqKKigeazCiVTeQnOT87MmWgMlyLx/Et
	VUKHZYKs26M+LR0i3Ia/JzCSjqucQjTPbRNgpd6dt5ku8hU/2kJrvcnwf8UDWQCa
	BACVFiMCc7yKVcnWA++6PWRu32T8T9VAb9oPQq9OHpyygylCwW57PPtDD03Cbwi4
	3PB8tXWLbTA9ZQBwOrNhulq+w4bkj5K0/Y/N0gaA3RrPig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctmw829b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:30:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7a25c5a9so1826900585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 18:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773192616; x=1773797416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bkxQqKRENO2AomQ27AYoBHJAPGDEOt3uW5XK36rzZco=;
        b=dcldvMY/eXunl99OqFTEhJl+9OLTiDhrBvmSKj5z1JlNwmDuzD/3OjXucn3VtNeif9
         vwBJ+rRMRZgH32PBPZ/PZZFxmqphZeS+70DTit/Fi5bJ4PSUGaWx4dWQ1unWTlEFr2Ez
         4Dp25fpjqswkUNda0SdQX+4Sostv1v8Ow9tiXsUYUc9ANgg1Bjywv/GyjwWk1PIUVU3E
         wXgKkYCPu4FY7an6XVuksAxlaN9Jb7Ea03w/yPYOUjCDj38ZwKkUMqqpUzLS5+RLCUuS
         gVBusc/C76XWgw7iLwFisf9ufVt/hd94YdDWa3tbl74g/O3j53T3c+7FKo0PthwlBF5B
         uZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773192616; x=1773797416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkxQqKRENO2AomQ27AYoBHJAPGDEOt3uW5XK36rzZco=;
        b=gxxpmZE5fhL+Ezm7NHQZeA8BsAVI7cho7YzJCMfXsNi6SXBUt51SwCVBoKAvbfoVI9
         FcUu7wTEDOKauEn5ydedXin2Ki139B9VplXi1PUIwarc16iKHcnAFIelbwgFvISth1p7
         dyRjA3zRpQfld8ASBzikqMloJqyn+6QDvNOdVEACPLXawvd4CHRCcOt9MTH0tftLzo8u
         3XFFf8EMmJQuL67FuA8tqpwV6dNJgMjeojL6UKGU44GSADLNrwH2OFVAfkV+dgS2XefC
         zV3PWywJwwjwNLQkJC8PEd8mpa5gv8JT55qv9SrhxcFji7EJCq7794aeKzyXkpEVMEAJ
         C5fA==
X-Forwarded-Encrypted: i=1; AJvYcCWDuPqfakJezeJWxZt2idW0HybX9pBtcRgTO4gg89XIa0RZ8ZNV7gKwmLE8OGfInK3uTrtpM7EwjVxK41+3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4U4QHpjjaWwixHOPGLfD7kF0Nhhwcc70P6aXu5MY2YN2rzI8j
	CCWTN71rucPu1x//eD9JX6iKM/OynVd0LoKYuWaAfirVI+HbXKYW0YHKRCS39nvYiw3Y+P0KH7w
	Tk9niK/TSUAsGoEHO0zepISNKZ/Lv7hcAHyMlVFb+Ycps6ukE3Qw8eEREP45fwVgctSmw
X-Gm-Gg: ATEYQzwuxD7bAtEOy7VYU8KFGmoXycGDeq8EpYi0hmZ+0K5uDlwIMkqsf4aa1R+EEgy
	QnFKITtRP/P14VpUxCIT1aXT9gzb8z3l+Qq2MxGBCbpDKEfDa6MOdM3mgvfqKt3vpKfWR+a5sQo
	fIu5LxPmS+zSEB9M4NPXPkQwyuF6H7D8yp7cBZWcJBrkhqDhxthPcbH5VCaU1A+f96baaLPnZ2u
	4MDlZykg5fAL299vKv1Xyk1wCJA/KK35I5vUS7TZPvVSHoG+O0YKHZAX3OJRWEO1rw3TXg2vESt
	HLhVRPOlqR5mPxTMMCu5t0g4S99ZPNYx7tF87qZyBLh7EgoJxmLQ6rFbQWkBL0DKQsAhXmKMyaz
	1hW2/SQN6Z7vYA/xF2Pnr819HypbvYxtUvoZIr/zOwhyfUk6s5/yrD40uH2zAP9+Kixu2hRjwTH
	1T+5zrF/OmuVol0q1LHaYuyfvtM1ErG6MNomY=
X-Received: by 2002:a05:620a:2983:b0:8cd:926f:6474 with SMTP id af79cd13be357-8cda19f768bmr127379185a.25.1773192616504;
        Tue, 10 Mar 2026 18:30:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2983:b0:8cd:926f:6474 with SMTP id af79cd13be357-8cda19f768bmr127375585a.25.1773192616014;
        Tue, 10 Mar 2026 18:30:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33be6sm128000e87.7.2026.03.10.18.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:30:13 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:30:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/7] slimbus: qcom-ngd-ctrl: Fix up platform_driver
 registration
Message-ID: <xgqxuvyiclvrhlaeozvdo43qb2dw6omvm4av56k6ftmnykiwq7@23cotrwzjnyh>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-1-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-1-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Jz1dxNOwpL-UuaS5Fu4IEsXxQwd2VOsx
X-Proofpoint-GUID: Jz1dxNOwpL-UuaS5Fu4IEsXxQwd2VOsx
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=69b0c5a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=507G7j8PtStOqQvpsA0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMCBTYWx0ZWRfX/8LIdLC47Do2
 Tt8ecyt8qDWbyP/ecvy0aB5wy15/MB4NuTM7sPbRNemgFFnVIyCT5PmpCLFENvK7Nv2uBJyw9tc
 ZaWUgZpLH6VZ8Eu1c4NXBH/OLNQnWdP38U48TUepFDxqe/Uvpz7tv5kvGx9Gnx5+mA5qIff1pEa
 oRC4ZiGfROsmbtvgymEE7gcNmlqSNae8YVB56MgAmBkTJZ6PUUWVPBP9XtHpUlP5w2+s0kw1uSO
 h0LgKSynbJWSpSlyjPTERgx0rgt9sgUeVyGzcnX7lK3redqnHQsw4w2NmUE1fJ6mQFXWeLUdCNL
 aofe7JjxS9u8Ax8bBaL8gp0vUOS7MNkAzBP0YYBsFYjUAV9dZNv5E45BLzJ3PezEXIrmN3hRsQr
 ckFYnAWOQBqtZFsH01ihW8UB1dj/PwPmQVkcr4coe3FX8I+U1qTi3ahF+XmkE6APSDfQsT/6ZLy
 Fd4tit/yblgY2cjtiyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110010
X-Rspamd-Queue-Id: 66D7325A565
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96794-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:09:02PM -0500, Bjorn Andersson wrote:
> Device drivers should not invoke platform_driver_register()/unregister()
> in their probe and remove paths. They should further not rely on
> platform_driver_unregister() as their only means of "deleting" their
> child devices.
> 
> Introduce a helper to unregister the child device and move the
> platform_driver_register()/unregister() to module_init()/exit().
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 36 +++++++++++++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

