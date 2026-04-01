Return-Path: <linux-arm-msm+bounces-101329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEH4CyADzWmSZQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:36:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDFC379904
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A299309BE81
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AEC3BBA0F;
	Wed,  1 Apr 2026 11:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZVe+tEl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iiIueIrE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9523B39478E
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043088; cv=none; b=nQPWk6hZW5h6kBVCXmWr3lO4DtckvFWTq6RERiCmaMowefVOMEuIutFxcsRX9fAggAZraiR0k3TaRmCpoYjY4AAYkwfSC4k3nBS3AQ1HRbGshc/mFTE9aACfpN3GMonIZgEA9nQfWEv0Zg1C367Lli6/RyyPLJ0fnQQHaL9ysVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043088; c=relaxed/simple;
	bh=bH6OQWW033078M+pZnkDl3K24EuiMHMTgn97RT/t8+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drjjf9Jg7B3iHrw5Q0jSOzmR+sShsrXxw8FQR2nfUol7O78dYUIZDqp85/hOpkPfh09GzNInSx5WX3qPYrTxle1O3SzMzvxjXjqpHmxLpF5ZArMjssjoK7q/xQsa0cyXAXMRrLaDvdQdc1Vcw5qLZYeJgwsMNDdSGHGLGZGGRy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZVe+tEl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iiIueIrE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317oWCM3081615
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r9608+SJx12/aq/uDZkF0WxK
	S1uDQHU8MsIx6PAq+Qw=; b=SZVe+tElXLPC6t6CEdiHx0F3EtRADm7qBjzCA5Gp
	W5+k65g/kH4SrNUeQel2hjCIma3vAV8nroVIdlIJBOLPKGwhlXt9ECgkkjmes/Ch
	MmeonhaI85mNJVPgyd85Q56SPyYC6AHNXRXW1LgE26cwy1E/bDHwphwOzxc2ifWs
	Q28tnDAy+OA7ccOO02uX+6WK8pvw4VEMEeIsUtz7j5kCOYu5UPvLUOtOCTkD21kO
	LFoDrTK2s/JZ1LSx4ma/f+1fKYU3wc+KGUrU+ojGQk7LgzXDoZn/NxLEV9X1O3/1
	fDkGnCzhGbC72osDKAwvdbLvTpGVtF9dAPoMUhZWacYLkg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkut9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:31:26 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5675cb317e3so5409298e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775043085; x=1775647885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r9608+SJx12/aq/uDZkF0WxKS1uDQHU8MsIx6PAq+Qw=;
        b=iiIueIrEbmStqfJ1vFHHSup9Q0WZlNG37nVYwFKJgvDeL5ErX7E8+EoijfT4ZD3KXJ
         9S/qCJsiSJf8Ywx41zkfdU7JwpHR1JYOoqUvxPyDyMHqFc3twRD8HCuksUYUFNhmPD4+
         /SGa81CmRlp2oZbcAb16oViVCPw96oYUlgE1RWHZrvmw4yAhwrcbpjLTGvPYeW1rnblb
         MwZi3qv8/aOWdhidI5hOyDoECS3uCvDZkB6jmEjENwFU65hR8u3cUkyQjRDf1wJVwVjK
         u8eR3wG8212xDU1zWIhUimNtbyrhwxT88fOXJxqLv8dxbKSmx+6Q6ygQfdhh0BqzLfJV
         tYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043085; x=1775647885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9608+SJx12/aq/uDZkF0WxKS1uDQHU8MsIx6PAq+Qw=;
        b=LxcYlsBFEoCoXtd4ZuAtdIyT6oT1eadD4pVqi8T0eNbVnQaBmjtRvsVzs7SdNNO5/M
         +BLfgpam8pPbQX+fuKZYsXk4kD0bZ9pU+9ps/or2WRYGp0LXkExs3l9eIrezb220bZJ1
         d4Eu+F7c9CgCeTFg1y1jZvwxsHesJ9qzBxpQ0wtdtg+QH1vW4HtnX5x4TFvRoo16PDmE
         To9UY3CCqXpA+VTvuxnHgGyJU4aN+cpwIAijJyIA63lPYO8juAICj6cV8w1s51CMBE75
         4N4U4L45Y+NxWIi1EsLUpESdS4LRlacD3xckdpOK3V3rvrsT+EKzKsgtNvlH/I2lw+v9
         eowA==
X-Forwarded-Encrypted: i=1; AJvYcCUHpokh7lR2BdmYuJ2QXGPMVA/VTwspVglNF6Uc3SB1vKvxfmKr0ecu6EmJwER1HSLR/uxE2W+etDDvrhRp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe2/uW0NrMxlOiJg6rJvOhGCzkSshEiZ/2dDztbP8/q5/gAfAg
	AiWCYF9nrYWbWAzLWwX1npZQGFcxPDIYIsfEmcZCPZxz7VrB3oWW5o9xythFQy61Zo5j7NhCsuz
	liSQ3AEfejmphkH3nUxQ+AfvyIDBcAT0e/54221ifArHSKfeAYQjYnbo3OjZK6qeJNGw08RKz6O
	tU
X-Gm-Gg: ATEYQzyl72hOYxxpwm5dzf0LIDTQHQtmCJmRzbGm7yG1MOpLp+pYP1npG5a80FFY3hr
	PvrxOHW1dYj5jvoT925/98N2818ZLhFRRk6Xh0c/SlJs6RpJ22QzYL6hOa1mi3kbDtophqcZBc1
	SEUfStSVbBJxGuELJJ/mGaHeoaL+nNAcERgtop/OsndhzE1HUMu6JRjwnc0tbtrpXLPE6jZ19NX
	VS/RQhd/q8yPNjZ5erEOBfQto5uFk7DHIXdyHtKsXeV0PDgrC6g0sp825LxwiB37k3zbZo7E41D
	LbAtkrqurXEha4C7VFYyCkc2HR5GJta7OvsAqr7tUOEMb6rVL/FzM9Ls8zt+gaUDe+AqaN9C9p7
	cW3RYrYtaW//djiOR679TSr1L5UTzCUIizorFOo4fuJClpiGBfErCew7M54oyycwU1PxS5WpmI6
	hXSxPyX8VaZY7kPWgsRjKUSrS3lrKft8y3/no=
X-Received: by 2002:a05:6102:c13:b0:605:6650:465c with SMTP id ada2fe7eead31-60567e07604mr941868137.13.1775043085464;
        Wed, 01 Apr 2026 04:31:25 -0700 (PDT)
X-Received: by 2002:a05:6102:c13:b0:605:6650:465c with SMTP id ada2fe7eead31-60567e07604mr941849137.13.1775043085052;
        Wed, 01 Apr 2026 04:31:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d4381sm29415461fa.2.2026.04.01.04.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:31:23 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:31:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add power domains for Hawi
 SoC
Message-ID: <ht2vvduvxvz3s36cn5m54hv3zon7qelrgat3tnykfvqi7f56fd@t24kmaliap5l>
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
 <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNiBTYWx0ZWRfX/k4DF7ZY8//B
 k0DV22WvUgqo1BPH560PqhMo7Irguh9vaYh2/p06pMGEb19jWgsYBjghOgj2IGRuTx8N4CCq39G
 /2IZ7IgBX4wVj+I1d66D2Z18lqBIHx/TJALK5G4LFLeSDjq01DIRCXIHn8fx51DsJh609zfuqSd
 xLDPZHIHyUEBH2BZbOfMdA0POrfAoOBuEp7rnO/Xke1qgyglFfoUKRO+Rv3PCQ3bR1/jepkx33g
 obu+K683qtn9V2ANlQ1L2bIFNHsjoDu8gwl8+ERk5CZl1ZHjlNNnfkG2FFqLI8kKoM/02IHwf1w
 sqU5OrnOrtGj2/QH+CIfqSKG0ycM1K6H/2MEKCKUQ5RvdQr6pwN3vn2sHeWyEwmqlGIDdxtJP3b
 h+BWr96aFojb0GJ+9kcGN0g2PBJaHn3Uat/60l87Tn1pxVMAUg/VXngNmM3C3omUmOs1+zHcQmo
 T2zbmnALbUOkZ35xaHw==
X-Proofpoint-GUID: gRBtH-KXgjN7bXPI-Pv0FcVFdAW81QFq
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cd020e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=bf-_WMFNrYAB6uAn52kA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: gRBtH-KXgjN7bXPI-Pv0FcVFdAW81QFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010106
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101329-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: BEDFC379904
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 02:15:31AM -0700, Fenglin Wu wrote:
> Add the RPMh power domains required for the Hawi SoC. This includes
> new definitions for domains supplying specific hardware components:
> - DCX: supplies VDD_DISP
> - GBX: supplies VDD_GFX_BX
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> +	[RPMHPD_LCX] = &lcx,
> +	[RPMHPD_LMX] = &lmx,
> +	[RPMHPD_MMCX] = &mmcx,
> +	[RPMHPD_MMCX_AO] = &mmcx_ao,

So, should it be just mmcx or mmcx_w_cx_parent ?

> +	[RPMHPD_MX] = &mx,
> +	[RPMHPD_MX_AO] = &mx_ao,

-- 
With best wishes
Dmitry

