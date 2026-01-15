Return-Path: <linux-arm-msm+bounces-89260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01121D28465
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE4B23073FA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C491A31A7F3;
	Thu, 15 Jan 2026 20:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JypMXQ9j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b20MRrqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B59531AA90
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768507266; cv=none; b=L9vCmvLyJ40iITOtR8DUeyxobmPYWY21YjfnqWVF9m9wyCAfSAuknUzAtICTqzaA+qaPoNq836S6XdUGont2w8q4XB1BlfpDdAWDYUwMSTyMOGEm1IDdFfhlDNY3r4LzdhsjkI5KaCwsd7RLhHmiFOXyXCEqhpYOmhK7joGoTGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768507266; c=relaxed/simple;
	bh=j0KnlLmPZJDeueg2HCP4gbfs2ZYlp2t1cI9AaOl+sZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FltHiZbMl6GSOIA55OmMTWze53xlxY1Ilqqx0jZb/onZhz4K7O5ou3QDhveJNyIj5HVQ1y8LNUAzotoe6f65khj3JiHocMCGujrInjOCQgZpuCt+vQ2zXACQX25fkhMHK63L3id0cAhY7KaLlPpzYnR0UTWSnwCEtyCX4JbTM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JypMXQ9j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b20MRrqR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYMVT2866856
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iGNAsi5NvW0w/zxaBS54l6pl
	2j/zbg/8m5WCIafia3k=; b=JypMXQ9jTJoVYUdRYGHMy+BjL3K45duCN7NzJ7xU
	SOD/WvqsLTAMnrrRXv7V1wJA4PKXjbZ8jvlJHpbqMKDZqYlIxKdJboN/Hu6ZPxpT
	vfuEUnoeBDxH+0cjKNGZMlfKjLRKcNx+Ea5VqizyoY5lTeMYX98KeZO6xZ82waTw
	WC5MmYWHDzKk+DUi5V7UZtBjMjalfPRdqA8Vod2SZY8toJssZOdbV7x5iQMEougu
	4NC9G5UMrkZVEYGuQfvrsgm30Y2xPbaeXbE7HG/cA5qBGzD9JQbrj/Fs88AxGN2f
	0L8mmK8xqdFmjGajj6QBBgniyaMprBpp9+tSb/uIMqzIbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2j9xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:01:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b234bae2a7so398312885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 12:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768507263; x=1769112063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iGNAsi5NvW0w/zxaBS54l6pl2j/zbg/8m5WCIafia3k=;
        b=b20MRrqRzHrblfULPz5PiEBkeunf+ma1KVutSWm32+S++5IK9maqTD0adjuyHDB/xp
         tYjpwvZZcOWz4aFl+mOtSZ156Vwk41Z4E1fvrGVl1esNN4v8B8ZDRJDEYg3fjs92dOHM
         PpgCuLf491V6fs/bwOxN4ntUGPzWf8EAYactO4y+mvfE3GOInhcck6KQkLgPMMFMqcvP
         a5p21uxsA2gE9p1zNyoLS0fF2jhiqF6pSu8jKMLIFDjzsjg/saHpqT1uJBAharTSFBVy
         Kg1M08KDzEF13nTQNrV/P8e7XBJJGYr7he65neGosHdgYGO+XzZVCVHM/OdCW5wNa5+X
         bBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768507263; x=1769112063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGNAsi5NvW0w/zxaBS54l6pl2j/zbg/8m5WCIafia3k=;
        b=SOjI0p6rpiDfHykP23SlN2rcoaT780Cs8dBDBlbk3+hknlGbZYP3qmDLerb22O5285
         voe0uhTmFbunQzKtMqxJLg8cMXmRMNK+rZmMsLu9fVaLtavXHrY+MpwzyYvcRH+1Ih98
         s887lP1Nd4aJMBL0e6yakU5sKzwKITkxitupli2gS4C7GpnxT3RuPeWepG9FpCMt86MX
         wruDeVWBhrAfzzNgF+pYEbNT0bX2gZvVvJSZTOeVE3IkX/G7YG4kTEQUz95Pct5FB7Oa
         QOogl3Nv6XVVOEasql+btG5vq2vIXaDqjmAUssK5N7uoixbmVpH5uSgxkWF314kbZuBS
         JC4g==
X-Forwarded-Encrypted: i=1; AJvYcCUfz4VR/laqAb1505Qkt+kW6UfLIbbwPxgp4pjyJK7hDaxO6cy9FT4SS66GqF0/usOm7FR7Powz5kflC73m@vger.kernel.org
X-Gm-Message-State: AOJu0YyKMMIyh7w05smOY69hC06XySZQN/xI7fF9kaJXONb9jJYfukqs
	ndkKiTNaCLhNPa0kkEdlnYhS3mmfxAqJTv2bXMiD7PgXP8xou0Sj2RU2a37/O5tEo7S8BpqXQ8+
	O44p/43uFwVzYHlhMTkfyznbeUVttL76AWDgbfYBZGeBr1Zs07VyoUYmycWiz+k7dVOhd
X-Gm-Gg: AY/fxX4BAm7FjFWEbg6W3m16XEAStJRNaiKJFW5CbH537BA6iJ9UFHCN40eZ/xB/YSv
	gRqUmEZKzdviwXAH/zgbLBBr/N1nr/r3kwgclP3eU7UO5ZfHbYXSYSMEMcRkL5XUSuPF9O1LSfv
	E8uv+os9oOdIYLJn516BPYgr2a2r3C4tMGdJ4vXIkVLqAC2rEL1yhYs53zNJWlyI4ax2LKQZz8P
	4lnDUmxqI5Xe4FQlOLusyAHLrMqTnnH/34wiqRmLahHVL7jLqnBhvS+ifRAbkEPtP9+B4gkh4iT
	VBtxr2pAaMsjvono+hNQwUK4PwvikHGWK+/peH22E4rb/ZJ0DZFInpCxJWhlq/7hovvIMK5ntTg
	c8JKS3pTYzprwVUj+OPiiTj4Zn0EtR3GgGqRdo4Aa8SArpXsB1xAU42NeD8t4yEdEMOLD/E/zen
	hKRheZ0fr0SU20zGxgxaeao0c=
X-Received: by 2002:a05:620a:4729:b0:8b2:e346:de72 with SMTP id af79cd13be357-8c6a676ddc6mr102116185a.57.1768507259293;
        Thu, 15 Jan 2026 12:00:59 -0800 (PST)
X-Received: by 2002:a05:620a:4729:b0:8b2:e346:de72 with SMTP id af79cd13be357-8c6a676ddc6mr102101485a.57.1768507258106;
        Thu, 15 Jan 2026 12:00:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39779dsm115148e87.55.2026.01.15.12.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 12:00:57 -0800 (PST)
Date: Thu, 15 Jan 2026 22:00:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 4/4] soc: qcom: pmic_glink: Add charger PDR service
 path and service name to client data
Message-ID: <s6xfgmrv7axotpozgq43qxsflr7muzg4snff5coadkqbvfcofq@ktbqljjlue4l>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
 <20260114211759.2740309-5-anjelique.melendez@oss.qualcomm.com>
 <20260115-refreshing-panther-from-mars-fb2f2e@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-refreshing-panther-from-mars-fb2f2e@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NiBTYWx0ZWRfX43Yh64KmDKMi
 qe8Omxh0zrfSuJXHYu59cue9kXxVZNWkBpzzBaKblH2w8+LH1teorLLFpTQYyOir2o70nvK/GsX
 yB/QVa9U1U78avFtaDtYJ3m2QYlpff6/GTMdlUEQQwqevmhvzgYABHpJ2ct1L4cPl0b2ZFMzThN
 s9T3R1Ny3xrkfa3wj+l8VCSCXlTtWikA/JxBCPCrEZWs86kcK7YZjI7zqT84l0mJpbtiKc1pBnJ
 E/t5zRwWU8qyeZFo0/+Cdw5YF+uXCdQPFEOY1mrBBbcD3FH3AmaChoIVMohj1QLeQzE0Yk4FJg3
 cte1Z98FZsfaDvkrYG68+/1Q9ETeq03pftd4hfG1tTRNT69N/gqC70F1GZq1nBw7Z2bsbqlnJlo
 Er5gP2ZfPLjyPQCgKqaEG/zDjp4qKiPM0sJCaFhPTOTseD+OlKhpJwANK1U2RZSw9f6fYhflHoX
 M9406QVPbSdX3HUfrQQ==
X-Proofpoint-ORIG-GUID: rNJJ8SMCHzlFVnlAtdL7xy0FYmrpdjok
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=69694780 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Qpx8sCsO31C_0ahKLUYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: rNJJ8SMCHzlFVnlAtdL7xy0FYmrpdjok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150156

On Thu, Jan 15, 2026 at 10:19:20AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Jan 14, 2026 at 01:17:59PM -0800, Anjelique Melendez wrote:
> > Currently, the charger PD service path and service name are hard coded
> > however these paths are not guaranteed to be the same between SOCs. For
> > example, on Kaanapali and Glymur, Charger FW runs on SOCCP(another subsystem)
> 
> None of your commits are properly wrapped. Please use standard IDE/SW
> editing tools which solve all such nits. You really should not have
> received such review.
> 
> > which does not have any specific charger PDs defined.
> > 
> > Define charger PDR service path and service name as client data so that
> > each PMIC generation can properly define these paths.
> > 
> > While at it, add qcom,kaanapali-pmic-glink and qcom,glymur-pmic-glink
> > compatible strings.
> 
> This is confusing. You either do the changes because something is not
> correct OR you do them because they are part of Kaanapali/Glymur. Fixing
> a bug AND adding new support are two separate commits.
> 
> Find the real rationale wahy you are doing this.
> 
> > 
> > Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/pmic_glink.c | 66 ++++++++++++++++++++++-------------
> >  1 file changed, 42 insertions(+), 24 deletions(-)
> 
> >  static const struct of_device_id pmic_glink_of_match[] = {
> > -	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
> > +	{ .compatible = "qcom,glymur-pmic-glink", .data = &pmic_glink_soccp_data },
> > +	{ .compatible = "qcom,kaanapali-pmic-glink", .data = &pmic_glink_soccp_data },
> 
> So these two are compatible? This should be somewhere clarified.

I think a lot of questions (both from the patch authors and patch
reviewers) come from the fact that the actual data is spread between
several drivers (this one, UCSI, charger). I'll take a look at pushing
all the data here and then necessary bits down to aux drivers.

> 
> > +	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_adsp_data },
> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(of, pmic_glink_of_match);
> > -- 
> > 2.34.1
> > 

-- 
With best wishes
Dmitry

