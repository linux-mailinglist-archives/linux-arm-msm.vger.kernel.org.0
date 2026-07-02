Return-Path: <linux-arm-msm+bounces-116030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hpAHDShgRmpRSAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:57:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF26F7FED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:57:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GCjxUW80;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kudNbu6t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116030-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116030-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 895B130956AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75752480DC7;
	Thu,  2 Jul 2026 12:46:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060382E8DEA
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:46:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996409; cv=none; b=kYW3XS2o4uXam4LcaKuB9kRwMXSpqFDF7vw5iM19kLaOKqKpiCyE3feDL3yVV+rbFFkWpirTP28YBAzvLceh18gSLkOAw93Pwpe6yf7m+0Px11PSBkPtbDDZ4WTKQeUbQwph7SttJY4FDe2OnKhMLGrHYkXjKrfsPnTTZ7iuITE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996409; c=relaxed/simple;
	bh=5uHYC1eO+x2S8J06bwKaEfjHFTxm+1JRWoisJ4D6TaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/dZ+xRh0s79PPsVojsTSWgAOVzZKL8dBBCGCsZ7vkAS5pg+VdH+Sc6XPQsIxeg4BRzmZCkreHQc0SkVJ6qnOTgnG/BxQX5L4bCCGziLvOBD7R733OcG5QSccc77dwqOOuBCkf82AQSl23tuSpFFP1C09BvdC619yUWEUtwFXWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCjxUW80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kudNbu6t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662Ck2H2506261
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VxVATGBDUQiPbAXFQhZkLFDY
	sCweETLs6MuM7WPXiSU=; b=GCjxUW80PH1hTFi5yA+zkB2nlFSaBtRFmH6DXhzM
	k8R0RBoztVvXvjQJ9and6cAlKrUj+FG3Kper1/nvwF/V68UM8fld7uev/Y5m5LY8
	/jq3f5CtjR5ADB/H8PCPfyPP/ZjugQRPHiMBrQd9T7KKF7Tw72khtaC5NkbX8X4a
	QR9IQgiQ90bPgmbEAl2T7Kye09QAlGiiv5mLtRx3Ns7wYmRm5nEfmMnB5sGa+NaQ
	znhnypkPEEOpCbLivb2kY33K1VY2PpKSk4tutZYXlI0tFzs/2dp4TSr50WumxkQO
	xhspqYUjHHGJ3J1RtyBYnHQw+Ds7043dyq/S/OmLhoHpog==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwrvqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:46:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so211709585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782996406; x=1783601206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VxVATGBDUQiPbAXFQhZkLFDYsCweETLs6MuM7WPXiSU=;
        b=kudNbu6tUJJTiFje/meGZ+MQo/V8WzEFtsBGTCc9S/qd1tdSyuIm8yODeICsS8D2r/
         DMyDq9FON/C75fla0Vl6C7ZLYhWzu99Pwo782kbb2kDgN1kCqwEoPYKBggaF5C1gz0Lp
         qNFH1PsKSKcysSzrPqyYrzYKauY5DDd3Y76PF5X66SxhIUYHVGZx1CvwNTJz5I8i6MZP
         2bQk6a0L2Iahj9pUwCFYyYRB5omcb0y135iUNmQzaXuhc5Q64JXNOPyLqv+3QDbYR/5+
         QdgfiLmLHkXUF5Z/OhIOuAyWxvQovXV2VuJAMY/MQbH/yb6QWiIV5ZDwvRgQPqMvfntU
         gDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782996406; x=1783601206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxVATGBDUQiPbAXFQhZkLFDYsCweETLs6MuM7WPXiSU=;
        b=mJxGX9tsVXSqa7Kv/yrgmkk41wsGlIvyFIiE1UHML2ho+8ztQm8tBz9pHZb3B+4u2U
         lcXwYxLEudEZ+mK8GEqDrciEgXN/03YkG8dNGLEwqwBRnbLhD1VaE2awVh39Yrw+qg/i
         apLaDiH+TDR+WaAIMJyByDYom17Z70pQNFiDa2pDF4g43/Y0E8ov0eIqa6pmbSlYiEJM
         436kAe1diaRta8kIWHSWh62J/IbdBB8Pq6GpskYwsj4c66lfgF+f5hcoGamiaooTN55h
         Z+eL6P9644hkzcPghAv0pRmGY0wgP74KeK0Acg8St9iKqqhI9XaHFA9zsnd5fXGjgedJ
         03mA==
X-Forwarded-Encrypted: i=1; AFNElJ9tUypQVVoWHpTPkaGvhLv94TJEFD5l5j7ecVw/vo/3PxsdW34cPLoeQ0iPAhFQqQ+3BZbKhzT5gpMb4VF3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyayk8mT1OsTopUNZ1EvNTNIar3MRKa/z7CtB28OUbYUu0HcDfq
	EF1pepd3KRQyckeUUjHou7OHkvf9d2AMCfW3M93r7GMgMGdpqzd2qgswtbeb4k03Ffo3OJRn/Ii
	PUpa7pjwpD7KZfjcxIOKEwqeHDnFsowE1R47ToNObPnSoHCHphVcPPPq7y9aFno1PmgpfVOqtJB
	3a
X-Gm-Gg: AfdE7cnlTdWGP438eadSbVYG6Fay90pyBomqbEnArqyEZU2lOjK3Jfx25NJAC81Coh6
	nA1lCIBOVrWYMz3yAr6Xo0do68pDfxymwola29SmXBMBcQhMqlNQ+GnfeYm1XqQluwhdP8NT0JA
	/U/UWVxuf6iEHUkqlge/SY4IXelBuFoZBgGN9mTJ4kAco73QrpK3+b1IMYazyQUwOmfn8icrBDD
	71Q8rrKSAaVtBxHf4teiRnVJ7tDauwHM4uGmtcrOzH8Jo5u3PEWPN2IN0zxHe1ZCwmypkCwfGK3
	4FmbkABPYx7BSqf4G91g1Y15px8FGhVYrYwg26M0nbFt9bRQ8M9Kk9qN/5sHP91sOBcyTShSW33
	JojEuTZcLOm6+H9eMfmkp236zumC7D4zsRizPWemAZPSdCIXxeJXFPo1pWeYM+t7dl8KESS644J
	PPEnjX5W7WrGq+opskQmC3WQzd
X-Received: by 2002:a05:620a:a18f:20b0:92e:7ba3:73e2 with SMTP id af79cd13be357-92e7ba37697mr502998285a.74.1782996406279;
        Thu, 02 Jul 2026 05:46:46 -0700 (PDT)
X-Received: by 2002:a05:620a:a18f:20b0:92e:7ba3:73e2 with SMTP id af79cd13be357-92e7ba37697mr502996185a.74.1782996405860;
        Thu, 02 Jul 2026 05:46:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b37fc492dsm5699941fa.22.2026.07.02.05.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:46:44 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:46:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/msm: Return -ENOMEM on memory allocation failure
 in probe
Message-ID: <nesu4iru5gs4wif4iip7evktqrqnwhg4e7efawcmd7gie4sif6@w4qq57i4qjsa>
References: <20260701222411.138514-1-vz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701222411.138514-1-vz@kernel.org>
X-Proofpoint-GUID: OaN5Y6udlCiOlIuR_fUOuXCc2jf4c3Mc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX9ZXCZBQDkSPp
 gVd0V/BIL1tU9prC54Y9fMoq0zoXUbmfaYUcCjjvxNyUX5bMdkE/QHhkGAforp0/bOmgXHsU+FB
 sAPJCH7n3V7Fau5aaL4iVbb4U3oUUj7UFwkWRWcgfIJ0XFIL2TK5QEOfeDEbIS+lm2roshjcgh5
 wlP7MHAPj5wxDhZZRCuRSlaXhnpgrLDs1xVWECeYROGUal9P9FsliRYEAI9LRMMgxrMkFXCzqBu
 1GKhAlSHRdBsvdPM8Ku+QqFkC6cBAMgXPB18CCXD2oicbJIStT2HiN4EsuFfyodw0MPpB+XkEHV
 LfGNnsGRoWWVJSnFplkylzg1ugV2KSAZdeXNh6CuUzJkZekXnO3h8nZTgRmdZFn3iNJPA4CB6mj
 noUXgmsGYgrnD/8IcjKmSEWbpe3Ey+sJ8qAeVYnqOBu5L26TTu6F3fReR1w713gV1ndHfYvxYrg
 i3ukyuAslF/7nNNW9Jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX40FI50HC1q0r
 9t8JoTTM783+gOT98lEqWukYsgKZlFCiS7wVto5ukyejC7AblXb/vonPIZY//wSxskM2NWOOZan
 JtqKjxOCNu6hl8TpH3/SfIe8SuG2sh4=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a465db7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RiI-g2rLsoY8Z6saGawA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: OaN5Y6udlCiOlIuR_fUOuXCc2jf4c3Mc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116030-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,w4qq57i4qjsa:mid];
	FORGED_RECIPIENTS(0.00)[m:vz@kernel.org,m:robin.clark@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:quic_srichara@quicinc.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9BF26F7FED

On Thu, Jul 02, 2026 at 01:24:11AM +0300, Vladimir Zapolskiy wrote:
> If dynamic memory allocation in driver's probe function execution fails,
> it should be reported to the driver's framework with -ENOMEM error code.
> 
> Fixes: 109bd48ea2e1 ("iommu/msm: Add DT adaptation")
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  drivers/iommu/msm_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

