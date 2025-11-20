Return-Path: <linux-arm-msm+bounces-82658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 65295C736F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 11:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1413E341461
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5BC2D8779;
	Thu, 20 Nov 2025 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6PinFcU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrPbcQd3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D34302CB3
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763633938; cv=none; b=FAY1UavRleIhI9xBflXaq0y8ABL/DyX+mgQsHKbhMVfaMA49TZzcAwq4gHyQxtma/ozBzHK6BDvHehJEHqe7aePfNqP3nq9L2vaEeNmTP3g/RWCaODfqavCJ34xdYdqQtvs3KDIukGIqlg2IJ+FotaO78phtCy0NT6jtvSL2Few=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763633938; c=relaxed/simple;
	bh=n12hdx+rwaS2auBqDKsa0fk0bekWwwdDNF1M8gKco70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqv+hjP5w6+9Gv0Ipk1mzuH0CYwt+7E4MWh+o3uu/TQmIvdOR+Ik2/W3kR9svuenm69uk/zFqSWOFLNQcfnW/lpTJymIKaERMXFZ3qLHRV0Atph3WRrUnYWsbuSNniOa1PWgEMDgYFhWUV0WwaJANRjqI95sH7bnd8UKaLvvJ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6PinFcU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrPbcQd3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pmaP3844007
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Z9jH5K+dtfbsFciclTUCEOU
	Tw2xYHT4MJ9vMnlS8jw=; b=i6PinFcUpkdHBA3DD4PaxuFLQppFhDud7jakn42N
	ZRnCUJGCHsRge5aiTGWBdvYdushbmoq1ecpwbdCK+vuug5or3tEIwIjwaNvG89Lx
	i1oZJkGJNY6uvNiHGOvNcl9cnXJbDbGhiZ/EC6cx1bxaTkw+4MB4hN1uPb98U7Vb
	w/34vX9prrZg/gDfYOGH+ExZ1eDzegBx57mGvgreiynNfJwo3kfQb3dBNNWEL3ou
	SxjM1idd4mhEug0SRuSf7WqJTWv38sZQVTswWcH+Zw4UJboP8rOmDpqnv9VnDhnk
	oWjCdRrP1eQqiV9NmhI3EdpTuDgS7s2mIhXQd8nCIAi4OA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahdpr3pmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:18:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7ba92341f38so811775b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 02:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763633934; x=1764238734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Z9jH5K+dtfbsFciclTUCEOUTw2xYHT4MJ9vMnlS8jw=;
        b=MrPbcQd3iELUydkjvIEJE45vVSHblO5hFZh8AGYs1HmWgbVUtd+E1jcF3DyOdk1ybX
         nIbOMDTCiOBB5JHtbUZomtKNg6FDqewax6MRTdPzunuexoNg5a9VPZh/hg21bkAESl8a
         a1W7m9tVcABjeuOtBX4pd6j7n3+EGjXE7JAe7r1bB25vNuypvxbEP2akQar7iM4lWVFO
         J+8xMeI5yAC2hFssXjX74prsDN1L1jSzTdcBHqxRmkcS3ywCHWvw4/mfR28WpU4vagNt
         zIGq6l5Uo/i4+gUbzq06vI0uuu0v6eHSQ3IGc9OdRgszxpTkG9jeBVgodOBJML/0ud+n
         j2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763633934; x=1764238734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Z9jH5K+dtfbsFciclTUCEOUTw2xYHT4MJ9vMnlS8jw=;
        b=YFiO1zAe/ZTySVIspiKjn0ek1LCKW7QxsVwmRx3aGs8HkuwR1xnNaPdLhiwo9lMaoO
         uoR4N4gpCB5s6670QKXG3tk3EXJy67RssPp0H/cIHR2C1QATrUqCXFz8bH2SJv2j3L80
         c9S1BmE2evgZOgksuEMeH4vPD0rIueNX9Z97gTuy7wUFnheS0k0eVAWBwOlJ5zUuUlld
         SrEKFBukxzUfZBmzv5A8k5WAHom+0EOD1BiVCgwWr1YYi2JAkuGaPCNY/DCb2+xnzqaI
         SKIgTAwMG3QnqtRh9YorM+wxOgBb5hnjpaR4rJM620XQ2QLfQ5+rzr9JQP7+XG+xEoFX
         VDHg==
X-Forwarded-Encrypted: i=1; AJvYcCX44VVX6YbAhzGFImRF44zgp/9P78F+/WevrQ46aWM0mdeaIMsZKXkgev+DQ8eVIpU5F2GJuS/aqflOYlNZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwmNLhCfQVpq4Wfj4pCT9Oo4cerWgdVgMXZmD7FLXa8tgFZsi6g
	Km8aeLDwlby1aRTLTUpGBKDlRTpWWAkmQZXiN9aR8kAEumf5QB0ucFBcU5em4+P14kPTliZOQkA
	uOzE/rz1K1W1P/GO/bfhO16qsjuOtsl+SB/hQPBPM+PCA8/0Nqoh1vYUp5EDQuaA6WN3V
X-Gm-Gg: ASbGncsjeD3nTcTcoa+QrlmiIlQ6pusrH49ELqIeyxwS1teQOgxkS6qYmF4dDaMOSW1
	2y3ni1CDXths7TupaFTAyvQcRYwsdv6hUmeRDjbIlu0YOyqGzNEHpM3HpY40xXzmAzj5UOFUwC/
	4YW4ktMx4zda0UGETYMpw0dZXvKGbZ9FJmTn5qDpgXbpMQ4511AfTI4kEVU0fBztGnMfpwAfF8n
	PGYI1on2nzfmgKB7PXrASXv6kmR7J90Nnfz7pkqTAbpAL7GxYa+3TDIGY+hdXN9WKcVX3iexfu4
	bjNSSLSlR/acJzH333zzyqHfj0tNux39S0XqZBttmWAbHjq5zlbXm6o0NQ9yUt5EAxa8q2UbnZ2
	gyDLIkU4JCEjlzyDMPaPQmIDYm5GtY2R0A4tt8h+khWRO1uU=
X-Received: by 2002:a05:6a00:3ccc:b0:7ac:acc:1da with SMTP id d2e1a72fcca58-7c3f0d55b66mr3127731b3a.25.1763633934171;
        Thu, 20 Nov 2025 02:18:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGojsxAyQ1LeGcdI0PD3xHObbaxSuwFaBe2lXTXDlrtdSRAJ3b8dhafili33ngNySy6coQTpA==
X-Received: by 2002:a05:6a00:3ccc:b0:7ac:acc:1da with SMTP id d2e1a72fcca58-7c3f0d55b66mr3127704b3a.25.1763633933659;
        Thu, 20 Nov 2025 02:18:53 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0243b3csm2273910b3a.36.2025.11.20.02.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:18:53 -0800 (PST)
Date: Thu, 20 Nov 2025 15:48:49 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ice: Set ICE clk to turbo on probe
Message-ID: <aR7rCTZGTRGMWkMq@hu-arakshit-hyd.qualcomm.com>
References: <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com>
 <fca8355e-9b34-4df1-a7e6-459bdad8b1ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fca8355e-9b34-4df1-a7e6-459bdad8b1ff@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Uq5u9uwB c=1 sm=1 tr=0 ts=691eeb0e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=M7-gVhU5_WYnB0XQLAAA:9
 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA2MSBTYWx0ZWRfX1Ei83AFYqbr3
 e1cYsPBhIUm16PSjw1n/Lb+k0uWbUgdlwjgeSwuG+96cQoN8yfs3olDL9j4ID7mX2Uxtzl8c6Gc
 9FOuLHOmFfQEC9ez+/s9Yq/DfE+0tU83PYp013rbVoA7YtVte8eQgXGA+zPJjcBvLqIEiukAhVK
 lj8jcmXAmyUVSEbGiNSoFEL0A4xmHrWooIJKRrloiF/wjZH2dZXAe/pRbntJ00YpI9PP8db8NiB
 E0hL5vc6L9qxOl8XBagRR5S+jGnACXC2+pMtPkiMvLnUvdHHvY23E7/EV6/8u2860In8eouBkeJ
 6ntTQBsgQD6ASZhTmorqV4UnoUpbJUFK3WRm+i/Iyr9LlzB3ua+8c4EwakkmLB5cFESkVPtPYUd
 rv+Ud8me+OugdEI6iVJjoOxUVcnvWQ==
X-Proofpoint-ORIG-GUID: Z_7zPgG7nafjp612EmQig0IFEBPI0yi4
X-Proofpoint-GUID: Z_7zPgG7nafjp612EmQig0IFEBPI0yi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200061

On Thu, Oct 02, 2025 at 11:39:05AM +0200, Konrad Dybcio wrote:
> On 10/1/25 2:14 PM, Abhinaba Rakshit wrote:
> > Set ICE core clock to turbo (max freq) provided by dt
> > entry at ice device probe.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> > MMC controller lacks a clock scaling mechanism, unlike the UFS
> > controller. By default, the MMC controller is set to TURBO mode
> > during probe, but the ICE clock remains at XO frequency,
> > leading to read/write performance degradation on eMMC.
> > 
> > To address this, set the ICE clock to TURBO during probe to
> > align it with the controller clock. This ensures consistent
> > performance and avoids mismatches between the controller
> > and ICE clock frequencies.
> > ---
> >  drivers/soc/qcom/ice.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index ec8d6bb9f426deee1038616282176bfc8e5b9ec1..eee06c499dc36a6bf380361f27e938331f1fcb10 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -535,6 +535,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >  	struct qcom_ice *engine;
> >  	const __be32 *prop;
> >  	int len;
> > +	int err;
> >  
> >  	if (!qcom_scm_is_available())
> >  		return ERR_PTR(-EPROBE_DEFER);
> > @@ -577,6 +578,13 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >  	if (!qcom_ice_check_supported(engine))
> >  		return ERR_PTR(-EOPNOTSUPP);
> >  
> > +	/* Set the ICE clk rate to TURBO */
> > +	if (engine->core_clk && engine->max_freq) {
> > +		err = clk_set_rate(engine->core_clk, engine->max_freq);
> 
> Please make sure to use dev_pm_opp_set_rate() and add introduce an OPP
> table to ensure that there's also a turbo rpm(h) vote to match..
> 
> Konrad

Sure, will move the solution using OPP-table as suggested in patchset-v2.

