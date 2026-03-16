Return-Path: <linux-arm-msm+bounces-97983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HODIVsluGmNZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 16:44:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF2229CA90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 16:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC886303EB7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8ED3A1A5C;
	Mon, 16 Mar 2026 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdjPBEfe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D8QWxijY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF70D39DBE4
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675670; cv=none; b=dTjWTfdhHp5qsSNoI3aUe7BMMFiOAEuNy/GOpYDyRxLH8+zPMPA+bXtlHsiy72kAulJFLHyMecTQxYs3TT2Kc/VwZaqgfgAbQTv9mD/w+9/dZAURTuPRX3ncQlOK7Z2NjSWeRoaoxQNrexDbGkmtBYKK4IND3ceyBF0eQ+/bD44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675670; c=relaxed/simple;
	bh=O8yto55xNnTzWDdCC2lltVd8Df/jo2x+gU+MW9wd6zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gs2+HQAFxG5Wevp/C4+j+iw0fj6dTaY898fxLJeM18EzLodB40uTpLJNgspGCs0FWmQvVslJmDsvGkxlOAV68tjG36M1tmjLbyQoEP3IkY/AWmUscsBPa1T2X+/1oSjaepq3/7v/Q+2yfOUyWe4xu6Gw62LFdRV0IzkXHDQLVYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdjPBEfe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D8QWxijY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GF4NV4795437
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tocmhRpILSKZ2dIX4AfeiN4F
	0iPi2NKdx1DQyp8RAsg=; b=gdjPBEfeIETpGxhWDO6z1HZzwTrOyj0YHHLATaUg
	tLnaMzU/SlgewhMOphJ1Xr4BM+NViX+XeCQwdIR4Rgn5juduwTnexQXIUDZVz7le
	LypVXRVt8ROonl/xp0MlUnZVuVj9QYzHnzltPR8e13GCu4/SiaBi7T5aA4GuoBI9
	KqfWhx05NxT0BQIq42/evjO15ZSBcoGgrn75M77izOWZhIBm7XG8KA8VxK9J7jQx
	6ppcKsgClmEbVZWQrsSAoRMIx7ooR1MN/4YwEAPc2Hw1CLRbW2Ah/fUggSTq/JZi
	gsGH9fle8/QxtlIyjRWfjGlrz5IlBWwpDKLAUjYxJJQeGQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm6d04qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:41:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a90510a6d1so40305485ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773675666; x=1774280466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tocmhRpILSKZ2dIX4AfeiN4F0iPi2NKdx1DQyp8RAsg=;
        b=D8QWxijY2YQRqU4oA1Yi8xEwARj+DG2gqiUGNVzHmZwj2KmTXAPR5+xCEoeBYR1txm
         mohFhlPh+oOulNkqnjTSOAZa450F5LULzAw3zZUY9p+zp7AfcueTJZz4k6bLX6/sW3cF
         BoEmeMMkUG0WyPmxHwWIZ1/N5aSsqnjsb2yLx8qj+D3KoxjSZzOns0iipFnI4Wa0iYRA
         eMXpDIwJ1tEa+isK6DKwMa3HvrZ1XaHYqHXee1fM80p7iiYw5n4ZSH2Ma2jnFNaufFWd
         jncZnZMHOCt13xFozRJJlTxKAzsMtSppQSxAqH1dJbRAOW+hWgTzVe3j/cRO7wMdd6kC
         f80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773675666; x=1774280466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tocmhRpILSKZ2dIX4AfeiN4F0iPi2NKdx1DQyp8RAsg=;
        b=Wf2u3n8tZBAHO3a7i2hWKgE7RDU/0ZN40mV+inNjbu8VhO0ZIlkchtFZV1w/bc22sg
         vwAwjGJkzLekN4MjFZBzD42dHaWyZR09kZ8oT56BhXlRij6Mi5y2wQb5tNQ1IXdXoZ4U
         LI3RT8NiEXwUof0qZ5IDCU1nKLCOrvbr/CSFmF3x22X0fl5lh2/CNBrD4L4cj7vxZRMp
         RtkPSVSnhLL0tbkVDYxmOT+DuRnQr6V93ZRLw5oL1uv4L5Sq/015Uibr6wgrAoFp4eCN
         gnr0WPlj6mljVu/G4CE1dkFClYxbse5xujNj7GphhK7dS8XxvgmSMBZ2+Fo3FUsRDpF3
         wwWA==
X-Forwarded-Encrypted: i=1; AJvYcCVOAWHk5EhSYm0F4qYrg/SuwQ3I7zYQDINbUQX+tlxCmsdjRkc54WmBQP29eItqejg9dpLo2PmLzDNozxs2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw19qT8JzD2OmzTnfMz9R46WiVN+FOPFygv2A0hHrIKxq7UW3s4
	wS75NJ7eUJFhbUMQWO0vSqSwp26k9HMNN8/GYWIxIwlDTYZbjJiEoV+x4s18EMz4MPmYPTEIZdg
	n4EYt8N4h4MBTvBn+Bg8GyaUU4faFuhTqIX7sP8KOP4v2QYT0WAwD0wu9wL4UsAtMyVSb
X-Gm-Gg: ATEYQzwFJ+1qLcZBYp4ONRwXWbW/XM3/qowec/GnMbGqoUdH4FFVZ1U0sEdFQOicbM0
	jmDhjvzQkQi9vUUGEMNFoXxqbpGwpXKnG8SBkYnmOOtGRaRFj4P8uqvHpRqttJ48joV18tjqP5A
	CHDfaZbtzpCKGRlnv3X/rlXNvQbl2hkrpkXplGMVOG7au7HcIyEVa3w5EYPX41jj9Q+u++HKCHP
	pNTmXLf2fJR8q7cpOfEJZhFEiP2YDd1rgYyqEPspikPU3p6R7NBV53btAvRDx2QnQYq5DWGBtEu
	ERMMxFnXp1a2YDQ49ulAOl5i/nklUq2Dm+Z+C2dFCPT9aDqjJ7FWpfzY67byZmxg2rjF0wIU5g3
	lZhBGLDVXYTrohCnNHufRoPx4c5UGl98+3jFeJOmRIPDREp/c
X-Received: by 2002:a17:902:dacf:b0:2b0:5629:37fa with SMTP id d9443c01a7336-2b056293a66mr46676035ad.24.1773675666442;
        Mon, 16 Mar 2026 08:41:06 -0700 (PDT)
X-Received: by 2002:a17:902:dacf:b0:2b0:5629:37fa with SMTP id d9443c01a7336-2b056293a66mr46675695ad.24.1773675665785;
        Mon, 16 Mar 2026 08:41:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ed6cfsm143464045ad.59.2026.03.16.08.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:41:05 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:11:00 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Cc: viresh.kumar@linaro.org, rafael@kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Add QCS8300 to cpufreq-dt-platdev blocklist
Message-ID: <20260316154100.5pt2nyli5nabvrm5@hu-mojha-hyd.qualcomm.com>
References: <20260316103752.289324-1-faruque.ansari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316103752.289324-1-faruque.ansari@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c7+mgB9l c=1 sm=1 tr=0 ts=69b82493 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lkrs67fAIAsnqgaE10IA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: IpWEDw1CiR1cnQ8MW6kjEZbQ5CsJqGgw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDExOSBTYWx0ZWRfX16XolhK8x6h1
 DjIbF0ynuoPPSaEWe/GKkajX66FDJZ7yJ4PMSdUN/u/Bn0uOffdq5R7OwE/IPvV6qM6TRbPD8yN
 L45B7ZiOxbLDP6+KgLZ+b7muJye2BgPuQKbnFgIQkJQopOitbvpmS34ED1VYExcXKdK7rKbW3y6
 jCQftFdQuKsb91ONfdxoVX/9q7lb4CiqlYz82YtDfgrNpshyiFH4VPhPWmk37nH1HFUQzDtrkh2
 afNuCmtEPy93kRl3z1D8j33TjrdCtbIHboaURYje91QsmvM2ZEgC9aL/vnCifnluR9eUuSfZUsH
 yKzG5Q4ho1DDhX2/QiuzAM8IEKbhPMfEjW4xoY38jFrXA0KMp1Jl6jPVN/tBPI11xzrlM3/XsmH
 JANJi9IQmc33n9CrKAZ3jRmbBkZ6TdORVY4/R0G/RvfeglVo55k+i51V5M5iCWCHSkBRiy6+Vr3
 wBGuVajsQVMPSyK+9Og==
X-Proofpoint-GUID: IpWEDw1CiR1cnQ8MW6kjEZbQ5CsJqGgw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160119
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97983-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BF2229CA90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:07:52PM +0530, Faruque Ansari wrote:
> The Qualcomm QCS8300 platform uses the qcom-cpufreq-hw
> driver, so add it to the cpufreq-dt-platdev driver's blocklist.
> 
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 25fd3b191b7e..ff1204c666b1 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -159,6 +159,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "qcom,qcm2290", },
>  	{ .compatible = "qcom,qcm6490", },
>  	{ .compatible = "qcom,qcs404", },
> +	{ .compatible = "qcom,qcs8300", },

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

>  	{ .compatible = "qcom,qdu1000", },
>  	{ .compatible = "qcom,sa8155p" },
>  	{ .compatible = "qcom,sa8540p" },
> --
> 2.34.1
> 

-- 
-Mukesh Ojha

