Return-Path: <linux-arm-msm+bounces-111652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 05XOAkI4JmpiTgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:34:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 986CB65273A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:34:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DU1bA8eA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BIVro8Sb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111652-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111652-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8A333003D25
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 03:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6435831AF3B;
	Mon,  8 Jun 2026 03:34:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADDD25B0B4
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 03:34:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780889662; cv=none; b=HmGUVVso8KFymejlhdIYFbH6D251+yZ9wX7Iqs5i/1poE0L99GlttC5zb85zw/zuL/Ew3nNVC61Id+OQi7+LVbvhYdNfNo43Ah89CXOlMropdpjarNs7lZbztUQ7AOlhMfd3my4cyXeqlmwxPEjQHXteVa3zY/SZXEaxTLYaaCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780889662; c=relaxed/simple;
	bh=3JWmxHmT8BV5O00wC/eKX2wtjzi5Z9sf5VibQC+9U7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZW7rprQkrfqvn5iIGaLvlopejKz3Ix4r9k6wEXL+AiSAn7C4889LAdvdBVdXlYhvcfZMJy21cgb5e0d8JIi6F5E6fcNzWUi8FyBWTcv1nqlqJceIv4Qe4AgFpXHjVbkUwYtbl9qKjdTFQrRwgxhyI3CngvE0nfK0VvgSlu+Ai/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DU1bA8eA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BIVro8Sb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GdSw2027762
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 03:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PAVfXYzqkLmqdlF6wMfSABTU
	Ei2iQ1b6fy646y6vNgE=; b=DU1bA8eAEFBEHRi/OMzTnnFmH5ib0Ik07AABrMqN
	HtQXQWBuvmztyaR5mMVnCgzWXy2E9nzMu6dwsKIT6nxy79bUS1u5A3kQiUkcJVLZ
	SPUoIYjJay3SvIH0HpQ7Q90IB1mTBnZ6WPqHbKm3eVAOXFBny4X5vnvMJdRTkZ2B
	7RxnwxvvyV1eBqcQgJ6wUxPAaeB9Gd950KISi/qssr/toJy1BBvVAZPxQ+fdZtkb
	RD2SA09rW2cUVkJ5bVuZr4XVIVP1gRKJ6brGz+ehd0lMZQYii8Sv0QdwSCZxcwkz
	8kbqF1W+YCVIbLfTZi7JONc1VBSwKWPK5xgHHyBSh5VEBw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4wx34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:34:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso1943970137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780889659; x=1781494459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PAVfXYzqkLmqdlF6wMfSABTUEi2iQ1b6fy646y6vNgE=;
        b=BIVro8Sbr5Vn+JTSDqsyH7sx+541/eBVrlrypCLKxxQe5YnDL6NLrQmbdQior8SYG+
         rb7aH5nFeHod/1K531PgA42U9z6QLM0NWsjLUoEo3dDQXpn9FK3017lN0xLK/ZBAqG9Q
         Onn0CTnwY0aFIAjXC1hjo1cGqR6a2hv1iVzNvByFbqbutXCjiJEZgN9kDq/ywGPOCRMK
         gSR7GBBFnM9hKLC0b/FjQDhi21foUba7avz3oShcBBZcm+sDd5+BvNJNRwaAIXUhBghL
         zJB7z7gObitTzLvAbeVHEqa9S7pBLmduoPB60jGZPDueDoggNu5kFeyVVZ2xL/2y3kLZ
         lWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780889659; x=1781494459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAVfXYzqkLmqdlF6wMfSABTUEi2iQ1b6fy646y6vNgE=;
        b=SV7QZC/3aySVctzdE3mS+3wGjngH+i5zzA+p2InLOAauWOYXCG5l9i2sk7pkGC1pR2
         rn+eANMZksqSMan1+5nIJzihcMb0bVu/Y5QcuuGRTozr3nsTIs8yqgChSxHlERRYleAO
         v1o16V8cF+lvUJTM8EzU6dPnnfmTl7ROBdJZAYeD+biAn9XUHA4ddb1FWxFdvnYbwrxN
         xpG6IEZWJm+2K2WKTEtzXKJX6DJgt8kwmKpDB2x6MJRsY0DipLKTpYTNc0f+EFjyFm6x
         DJBHePzhLDwdf9SVj1FHWOM+Bbz6no2t3drPBd9yrr0oJ6pxaf9LPCtZqM9okLUk3kzu
         z81g==
X-Forwarded-Encrypted: i=1; AFNElJ+nB5GnroRvQuZc3zoLjftmtsRmAO0ntRztNIYiEAGirm9wDFDZXZ9tOe0nCwr326qTRwU6rKCO9NXEWhck@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3n2WTTVi4OLqVB3p2mLAPWrL7bMLoQBJlaPwXJ1sgizmuuuDK
	xkq2Qt+OH1ViJyKnQEiH5Kn7YfexYWXH7biCcoY7COeQGqM0ycBGBOctixo5Iysl8+urjTZuDVV
	0+ukfyyl3O9nz3rCDtIejHKkOzXLAV8iy8Q6w6pWUsrgQJfdJAWpcOiUmyTrjF5d1ctu6
X-Gm-Gg: Acq92OGHqRap8EVDBEgEkXy6EekUEZmQGwHIg+K6JDUmIdkkfSGhLIvnH5v2aHvrhxg
	Kg/oE6Fjj8qnJrXMVASqXcDnuf2QoOJp6ybr1RW4uZ+q7cvQfgrYZPhu5P24Uuv7EoKJT2Dz1r5
	4lv7Wi7m2udumlWV2EmvG82AuqL+bSvUgio8K4EQiniK9rp4qsFvXTHlzMARc4D97XZAGCuo97W
	re0cJUj8gAWiv09zvsmZR9thTQJyZxYS0BxHxOrfA2K/UWESHyrw9hYLl9EjvnqTfiBCC809K0r
	j+4F/pmFcVxryoA/ium6+mVFCupLI8o0xZvtd8jJubQV2BL36gBFP7LxogsRHJZFPVneHQ22qPN
	Ga93Vsxo0lp4aZB/94ju3XKMFgYiS7F6puCVsBPUKMwsAHdrYBDiXnPXuRAIvuFn2xVv6bVzi9x
	TzJHEJgnmel7KNAq3cpg3HMH9mlHy0drVYuu23DefJXWIKlg==
X-Received: by 2002:a05:6102:dc6:b0:6de:3c29:373b with SMTP id ada2fe7eead31-6fef998979amr5596490137.15.1780889659493;
        Sun, 07 Jun 2026 20:34:19 -0700 (PDT)
X-Received: by 2002:a05:6102:dc6:b0:6de:3c29:373b with SMTP id ada2fe7eead31-6fef998979amr5596480137.15.1780889659105;
        Sun, 07 Jun 2026 20:34:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8880basm3460246e87.0.2026.06.07.20.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:34:17 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:34:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: qcom: Fix resolving register base address
 from device node
Message-ID: <pqn4tyd7zo7drs252se6rhcw5lvetlk5khmm25eexqq2bv36fk@lxlsbqwuvuyi>
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
 <20260529-tlmm_test_changes-v1-2-88bfdccb4369@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529-tlmm_test_changes-v1-2-88bfdccb4369@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FfT03KFdYwC86na_Z_gVS1ncQCMudQEM
X-Proofpoint-GUID: FfT03KFdYwC86na_Z_gVS1ncQCMudQEM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyOCBTYWx0ZWRfX1sl+k8vCrgqE
 /CvwcuBq95oXp/4OEEJymvLBxKzuy8FtT1d+E/wgv/jOxJ/1/xTyOTy1+i/xDhrTdfyK6aJsi5R
 yvo3eALtTejUShVvd9qPzFdQO1qhcGOX1Y6i9J6baApK0ODbHEMVOcZtbBt1mlMKFELuZ7KGXsC
 13Q0Bva+F9wqXLHbavguAGYfL5aG0MaiJ+Z+Qid/2lx7hyF8GEU1rhk3fytxo5VNF3wWHwvzBTV
 RozUeYxF9CnZ/25e77cTzbrRHO8FdeLnQLEIfw8/z4usP09DKAPo/4kejV0/qa5uql0oLsJ3rxM
 2rt/FynN6qC9ZAElSX+OQt35khkyjXHyUv43OEHbr5BcX95lPRhKblqth3sFS2+GhzEQULPeNU5
 f1He/O9/KbpXmJ3bwP88eZTsmJSkeWhM1CP2GhbTu584Rz38IthIvzdE8QHKeF/WLaQPEacdznH
 M99NNQlSwTbRYQq2n6w==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a26383c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=gs58SK7taYNcaTCiRREA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080028
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111652-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,lxlsbqwuvuyi:mid];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 986CB65273A

On Fri, May 29, 2026 at 06:25:45PM +0530, Sneh Mankad wrote:
> Commit 56ffb63749f4 ("pinctrl: qcom: add multi TLMM region option parameter")
> added reg-names property based register reading. However multiple platforms
> are not using the reg-names as they have only single TLMM register region.
> 
> Commit tried to handle this using the default_region module parameter,
> however this condition is unreachable as the error return precedes it by
> just checking if reg-names property exists or not, making it impossible
> to use tlmm-test for the SoCs (x1e80100) which don't have reg-names
> property in TLMM device.
> 
> Fix this by moving the default_region check at the start of the
> tlmm_reg_base().
> 
> Fixes: 56ffb63749f4 ("pinctrl: qcom: add multi TLMM region option parameter")
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/tlmm-test.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

