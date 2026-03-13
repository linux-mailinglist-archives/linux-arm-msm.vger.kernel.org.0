Return-Path: <linux-arm-msm+bounces-97534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4TZqCKEgtGknhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:35:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7241E285132
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A26A8329BEBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C103A257B;
	Fri, 13 Mar 2026 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcI+0Bbx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bb/z9mSC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC6E39183D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773412202; cv=none; b=OhXuimj/KC9hB5ixOcyXZ/IzN1Mb7syi4CL9kqRSpPhgjV51WxsitaPi17EQdo28hzSZY7YtC6yJucGrWsqXUTSi5stFCUoT5LXPQcQu9V0+T9/nj+4jOGmtpBuW/cqNbPsje11zJ7aBNsMhGCa4XyVza18+f0e9HQR2KRpiw3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773412202; c=relaxed/simple;
	bh=9TnOj/Q1c6YavHbFacFJgnSrU+SsjvwTf5o8Am960UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BR3UbKeGKtTd0Sli3h5skzpvk/pFo7UanYULtqtPfBOZ3QovCHGRfHYjzjvA4Phsf//VH7jNo8MGc8gMcZpj4Hx7agBxau/lcCHOoRNe2vHMgbOBW8eLGcHTsmoePqT/BT7wLoYzxocmNkTYbK4lSaj1/oVJLFzlj8qEBoK72ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcI+0Bbx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bb/z9mSC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCAPAm4140701
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5bxFQeCPd7k8jJvVFFFJLioU
	dLVXiU/NXmy4eQvQlxY=; b=DcI+0Bbx7x+WZjWfzXUPb53/dAIa28T2uWZcMvOG
	+6jcPI/GyrJUOBTgZtbguhbpy3xxiICBp/x1MdPFl7NViU38r/KhH6c1z7Gpmzqg
	jNNnLvHseDglh55A+EHsmJz1lBAZRkZvEDG115dIm115Q/TAGobWzP+t6/INxleT
	xFIPeSxbY1+Y4Cf7kql/jLvPiaGupVuHE+2uY9LCDUgVtP/4Ja3Ef3W2iRZRvPLd
	czf9NZJavbW6fJoVuYM1RxWz5QAf15oay0M6RD7C7Q6zrhhPZ0GLJmr7DtzKlpLe
	CYFJ0V+ZsvWwan7cZbAKpsoB9pw1Zh+ZXF07FetNG9rlxA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn29yy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:30:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffaa511969so3095231137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773412200; x=1774017000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5bxFQeCPd7k8jJvVFFFJLioUdLVXiU/NXmy4eQvQlxY=;
        b=Bb/z9mSC4vhVS0HMEBHenNhZM3hyFz+HsobnnwthBlrqUid+Dn+qr5T6nLqdFVvZIV
         s/5tKq8i3g/V7R3h564zy3GiN8FkKhwdXpUzNRjduvLWf7Q/NRh34itMGCGeHnIp3+4g
         XZLrS2wGLUmYVfxeCXyiraKT0QuyngX80niLvCQzbSbjI2fq9o8cX9WTyyKDqdnHPGR3
         r/hr9fKunr9yUPsJPsArB5ksFmG8qnvBQQl1P0DTljGTecVyUZHP+EBYKdEiMHhybYHj
         kS/tHJn8zbQhDB+SqbQ9av2bt4j9PTdj4PCmWorNhIKo21zC//FuQ6X7EMf8Wx9gCl7m
         hpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773412200; x=1774017000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bxFQeCPd7k8jJvVFFFJLioUdLVXiU/NXmy4eQvQlxY=;
        b=kOxArRFS64oUJcZbBxEc+4JQMlbbqx26YCO0NA24QLxFIBS5lPRTpOduNDN3kjfjsI
         Z3wHkMX46U1ghWKMkYrTCvQJY5eXgRD+XzTypUilNvv33wVkeQQhjIolmZaEznlGjYJO
         rmC3XrgAg+hbIpyqRs3s7Y1vruw8aLRHZg2feDZhoCgS/vkFTydtgHAzHL7t0mEG3E43
         Fxw24/VRv+ccQoxt2VzcmvoIJq6m9oeqeJqD56kBwUxzJwn2mcVSozkgpJb6icSu722c
         kRBJUPf8EzkMMgKzeA4z2muWxVIYaYyLOX924uSXwLunjDs0zF8VSceJZHeJ0G2oC3cW
         gj5g==
X-Forwarded-Encrypted: i=1; AJvYcCVGettZDWxSWqdLLhsQYBZa6X1aPNJbgcemfX5Bu6gckY+eBhvHvSVugtwMSy4YDDN0B+KkEBdzO4+cfoGR@vger.kernel.org
X-Gm-Message-State: AOJu0YyEBQv3OK1Gddpkzc2NUW7SE2S5vTHbZY9jK/gOd+PxJ7xaIwQy
	Rs0FyW66IM4UIQrdnVf48VpwYnl9xpn4dFpXG7DuAXrrAHv2vDmlEB2cku3+Vwm4I2uNXrsaFh0
	BXAkj15e9iDlRo1IB0PmzlS0s+lOneCJmSPlMpWThOsY7bR47lXUdlwzQu+9btcNDIMiV
X-Gm-Gg: ATEYQzw2hU+mCAvaQ8Nw5q7jk94dMueemQlmqhy4Ax7Is77hWBntPy9dQGGpZcE89Og
	CIgCJiZ93fG8rCaamf6DQ7AH5ETG2U8FI03n6USvngEEOgrJsZ4+e4iokewQkWZaRBCXC+O9R/D
	3xoh4RBV3+O+5YE5xZJT0BaBnhtReh/jDgvvDPoRhEe8Z+oHhHluHhQOM7hgDX8GGeGu4XboU/w
	Wkp1BSmiItPVuLg9KAFosejwmn4lWQUyL5BpYw6FUA9VzqC3E+Fj6Zh1V4SUnjDOIpNg18hpimU
	sldJzvP2oDVrZhoIciWpUhz26OVTVVqACzxL+tJq0+6BINIMHPwDNfz1m14EMRQEd6lFBWxdnAc
	3jtCfG2znWILr3QfxPsoTIesQWNi7TYfPl/5NHeIUzvg8bjLhF1x5wyw/XP+0oKT5axz4qDCUAz
	84iJ/N+Qde/5f0LN4ocaKaqSe1RZRFnZxP7bM=
X-Received: by 2002:a05:6102:510f:b0:5ff:be25:8937 with SMTP id ada2fe7eead31-6020e6233d1mr1360025137.31.1773412199949;
        Fri, 13 Mar 2026 07:29:59 -0700 (PDT)
X-Received: by 2002:a05:6102:510f:b0:5ff:be25:8937 with SMTP id ada2fe7eead31-6020e6233d1mr1360012137.31.1773412199436;
        Fri, 13 Mar 2026 07:29:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ecedsm14686921fa.21.2026.03.13.07.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:29:57 -0700 (PDT)
Date: Fri, 13 Mar 2026 16:29:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 24/27] soc: qcom: ubwc: drop macrotile_mode from the
 database
Message-ID: <knrwkgsq7fp46y2yy7ub5l4zqwrhpmsky3khvtltsvdxsemjn5@t3re4gxcnbkc>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-24-b7e8f800176a@oss.qualcomm.com>
 <52bd0410-5009-45c8-bfdc-b493e2f60610@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52bd0410-5009-45c8-bfdc-b493e2f60610@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GmgprVY4NqZwhV3qVBfqHdxMEXyTkCm6
X-Proofpoint-GUID: GmgprVY4NqZwhV3qVBfqHdxMEXyTkCm6
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b41f69 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TemcLLIvp6Dw_u3LJh8A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExNSBTYWx0ZWRfX7Q/qTTwwqmMz
 ipWGuvWB7YXM6QI8fn5cLdD1a04BrkLRVOlJCj2s46R3yc2BKC95jnoMuSHiGM5Cdap+MZsexd4
 WD6lbXLB0K/VorsGp13nL5zOAgsRpztYqBWmrytUBp4MhiZ6mjyDeGK0zjjhUV4V+UsqQ36eOyP
 I2Pr8bW1QThzPaDk0VJ5zfsU+QzZnZcGXoO2rZVh70/CKlMX94IL1ZbmfeaXN910RlJVaZaiiqS
 GnCj5ZKZ117WKa0xYjj7XfFbXsGtDyhRyf6+p+lcJ/8J4HnS8TetTxf9Fuq/PK/0NZeVwwBZL8w
 JYvH7VmN52WsZpwt6QOuZQeiWsXXT4n0QQX1uFddjClX6Dzu8nhUYBCeVr42pqRV5GTZLkJkutF
 8ifzIcfpycGLle17IrQb7PmxNGJEz8ewZOh/U2MFBHzAaK2IZYLkDeJVtny047amQEJU3ZCoGNA
 YLbFL5Gem7DhnNUO38w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130115
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97534-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7241E285132
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 11:28:26AM +0100, Konrad Dybcio wrote:
> On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
> > All the users have been migrated to using qcom_ubwc_macrotile_mode()
> > instead of reading the raw value from the config structure. Drop the
> > field from struct qcom_ubwc_cfg_data and replace it with the calculated
> > value. Split single UBWC_3_0 into UBWC_3_0 (no macrotile mode) and
> > UBWC_3_1 (with macrotile mode).
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  static const struct qcom_ubwc_cfg_data sar2130p_data = {
> > -	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
> 
> Is it referring to the values reported by MDSS (4.0.2 enc, 4.3.1
> dec)? FWIW the other doc only mentions UBWC3 for the platform..

Yes. The code (and the database) has its roots in the msm_mdss.c, which
had that comment. Other blocks on SAR2130P might have different UBWC
support levels, leading to UWBC 3.0 (3.1) as a common denominator.

-- 
With best wishes
Dmitry

