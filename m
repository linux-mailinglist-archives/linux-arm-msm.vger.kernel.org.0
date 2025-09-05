Return-Path: <linux-arm-msm+bounces-72342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58974B45E71
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 18:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFEF57A8C96
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BA7306B09;
	Fri,  5 Sep 2025 16:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AI+2bHfF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E41306B35
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 16:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090552; cv=none; b=jnTZFwot/+Uje1JnYc/mDNfHrDXCTIju64h0zqM/HCUvdigydeFb9aKYS4S6Z8dZl51eeFOL2294q/M5bhq5XumksMiYv4xoyg93Cr+KZmwN/80MJVjWOWlMRZTm6wnz7b87yU2n9nOTjq6GEworPP/bIWVwulPZgHC7vBJY7FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090552; c=relaxed/simple;
	bh=DUFnGFR+b0RlkETnIw6FBxZGRdV4PzHTSFPqvHJy19M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFwhaK+TQnZREAvcT7lC3sumC+JZsz36+LqLKnXEcoaYJhrbRn7aXIDYMtjwzdhaonsvTMV4KybB3zibzK+j9JD+VQVP+vGloAkRJ89YG0z2DL46xpexHb0J8vFAEceWoxjr8HWhkYwoNHWMKC+CPNEbNxWfLDdTRcZI+EjwtA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AI+2bHfF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585FkcLV031741
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 16:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jROajlmlcBln6vhnpv4vvF5t
	CEtoLH+4Zh8dpioFagU=; b=AI+2bHfFH59iPt5l4s5H4K0lpIczuLf5F2mAfs+a
	K8iWJc2K9PcOkimdSuYSYPoVRDMAb5P2cgHHXsJVEI+g/BMGRmgIA0WftaCuj/cc
	ljimHivoESGk3rRQvLz+mZc+yoUNY2/pbgg97JudjNvRFRBRrJ1hkoiO+rFU4+d9
	8ZNtqCSQbiTn0Fk7Y1jox7SyE6Ln8CpqfV3msYkdyjI8u0bpqvsPA1QYVWb+DeBI
	LjKwPDmIf/qLiB6JuoC2YDmg0vZswqS8vAZKF0qdj3EKfQeLqZ9pWtjC3IVzwHyp
	8C/YUBTfVtjg++P5aCY8ZLTBOen2wcvYWD46GBoARsJC9g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0bwnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 16:42:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5eb7b2c05so23942561cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 09:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090549; x=1757695349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jROajlmlcBln6vhnpv4vvF5tCEtoLH+4Zh8dpioFagU=;
        b=a3MVUdnFYH1nOKGm/15r1jr6QM1/C9mmB+30JwgCApbqhJC00RU0B9qmZgz7avdwq5
         CL7vOBVfRWbycFzWmOCpDMiV6WzqqPHnfWDGeaf75zinQwyZAxEdB559Vv52yRACiEow
         YYjqyOOVcqKCvbh6jz34IN1wHPY6IUca8zzAFAyzLbpDxJw1hXpz5CcqFZkyVVtdKTB0
         +uPZ3z6xCpxn62sqxSH6WrrAA66tRP43rnGna8HYJVu7DpTCTWTWyEKLHxABddXva90n
         JbR+vrbkzUX/EI3dYNfZdvdaWwXCp3jbFq+kzcByZlT9h+9t/tzd6mvE3kjEZMZLGhyz
         7RGA==
X-Forwarded-Encrypted: i=1; AJvYcCX+7MwukjiPRhyyk6+JyoCmCqPOEZ7Xxgzti5ubNY/wx21OpVcI4RaQMOx6gF09E60Xt8Lp0ObB/hSNK/Ev@vger.kernel.org
X-Gm-Message-State: AOJu0YzoU264uvbfT+DbB5HzZB97wFxWl56TGCzfh5C6ao6bfsWZQvSb
	/EPk4lgaBKHWzz5RSfPmO9Z1TXj1bkvOjCIWTQLdqR9Eoa9fURDzMTjq70yACLu8Od0u9uxkP4B
	LFlgiMCtIfiPOr7Kv5+qi4ff4JusQAItxZJ8W3q0fKEaiayrvx0GLqTsiYLN4FA8gbjY/
X-Gm-Gg: ASbGncsCh4wkjx6LlueTardJCX6GWzWD0qVOxmTydO7F+io6xn8aOJz697lNcOnRxBS
	QHI1OO0iDPa0xtLl97YBRVcHsv/rO9m30e1bwvLEzU14iZ1ahtDpLrj4hB+3ZdKZPyxWQi7RmAM
	tQQJlE81GsZw1q9OJlDE2ODL1d8FL6u4p61YFFLVrWKb/YT53yqxJND+0n4wcA+vDTRVSvdfvi+
	vtS3i+ulBurifqWyfaeY8IJmV0+6I3kUWafCJaYiyyJXGojGI3jQUMv89M9BJiMkj7IBrDiC7Yt
	5011Bt2/STq4vhaaODSgRw8EV5DM/fnWwD90txc0AuMT0WHNftNRs2uszMK+OnPmbbl8iSiHBdl
	R5zdF4MvFkmYjpaOpq8CQKLxInAy1QGoPmhfKDAlMFqJNVjMGd9XL
X-Received: by 2002:a05:622a:5a88:b0:4b5:e8ae:2c4f with SMTP id d75a77b69052e-4b5e8ae4c42mr57976111cf.51.1757090549051;
        Fri, 05 Sep 2025 09:42:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPiRLE19NZ0JHt5HAhIWc5mt20Vu2UIiF998qL/Cy3guuAy/WYnY5wUX4hI6ZNygHmSZ0kCg==
X-Received: by 2002:a05:622a:5a88:b0:4b5:e8ae:2c4f with SMTP id d75a77b69052e-4b5e8ae4c42mr57975671cf.51.1757090548543;
        Fri, 05 Sep 2025 09:42:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfcd18sm1858430e87.108.2025.09.05.09.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:42:27 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:42:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 03/12] soundwire: bus: add sdw_slave_get_current_bank
 helper
Message-ID: <2yvgofbauwqzdysb3r5jfijedpg2qdfb4znfkj5veuyanff22d@tro4rzcfytk6>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250905154430.12268-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-4-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: uM3fLFEYq0meMwDwFsDdCAYrvi4OnIZq
X-Proofpoint-ORIG-GUID: uM3fLFEYq0meMwDwFsDdCAYrvi4OnIZq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX1Z8ckXFZIeQ3
 MeVC8amyD3d0aV8SJkuT8LcFE3/G08G0lU2RhXQiOP8gZDmNzqfGTVxP4JVPfOu2XlG5Cmi4ivc
 w3jIVPdGs8zO8ZNl4VJUS0WVuXwM0S4fKk260WycOpZzE+bOSj33X/NMMSmjZ/spqdJ6tUQSRu1
 NfgdUhyLd0YDyG5DZAMzbjBGY2uHOhNSMwthByA6uNBoQc4iQCMblmpp0PIRNQdeuNk4xJc4bbB
 1YhiwJuDtTav7qlh0/uUEELdk8ye1/1pG6HgmblmN2P1xT0o0G8exv4HdGa4znOAVJC6XA49kC9
 fLIXdeuqTHJdR871BYuk/tR9Hps2aIdgIZ+SmA48iQpusPkUbeWcpxeqmJJp43VH/T8MStVdbXP
 AbgmTtdo
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68bb12f6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pQdESfS3DBkDoFfcH0sA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Fri, Sep 05, 2025 at 04:44:21PM +0100, Srinivas Kandagatla wrote:
> There has been 2 instances of this helper in codec drivers,
> it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper sdw_get_current_bank() for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Acked-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/soundwire/bus.c       | 12 ++++++++++++
>  include/linux/soundwire/sdw.h |  8 ++++++++
>  2 files changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

