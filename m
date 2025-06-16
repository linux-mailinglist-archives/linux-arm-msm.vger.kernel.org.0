Return-Path: <linux-arm-msm+bounces-61447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EAAADB304
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 16:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E43F161A23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 14:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D6D1F3FDC;
	Mon, 16 Jun 2025 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lI40D6PB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838731E833D
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082779; cv=none; b=LadGH7aniDtB6sTQbXfwakhmjtIzQ+M/xby/2x/CU5IehMV0iOpQ4roksib+w4rOibkJWudSbKrV3evkg7+ndRuLSIeuM9EGLmHiWNKTdHxxLCGrHVRwP94VRkntqdnzNQJ28W9vdpH/ULpoW4Qgav595217wefDHyMERG/DpUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082779; c=relaxed/simple;
	bh=xLc9ItWh5tpODOaZ69PPZ9EYd++GnaUzUK7aTCACc2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlzoqhJazhni2pSdcJcKdRzqoxZiqqY8VxlN3MCJIfONfQqFoHpZsHrV77A/nnM595wrUwiDWZp3kcR/rCLo6pwdc9/QOJ7qklfGAiuJbF1ohz+oQyojlqqbB6oiu1x6uC/eIwAJVqmDPbL0rQynROcfpMWFhibpg4THlkT26No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lI40D6PB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GD6dHg002282
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 14:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vh4hjv26x4W/Itf7e2ntHRGf
	CMDWqmAVMqTQ3fn4agY=; b=lI40D6PBuR/dA9dRvhU0KaCtNGb5cKaTtRJsWh/u
	QOCUul2h2ihPSphz1uWTsDL4tP/hP6vSOlhllZyo1WIeOgTTxm7N3P5yEaEjarJv
	//Ja0t10utkJQj5u1/YGdT7WT/g2KhDK/+MLs7Gx+t+mXO0JPpJHYM0aphm6hsDt
	8nPkuGUI25pOBgeVAkXOmie7PU6ZcBt7hx0acp6XQVtbbjvpuKV8Ggbz7pFqcu1N
	9l0zAzVw8sZxEsr/9sN1WeIE2RFlbbF45TwYxufz5Dir+jmg1B+jWbqSJcvKX5VP
	MMfsyqPdAYPsKxaldL7l5AvEMqD/QBvkpqtMb0OzWUEWTA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47akuw860r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 14:06:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c791987cf6so1019301285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082774; x=1750687574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh4hjv26x4W/Itf7e2ntHRGfCMDWqmAVMqTQ3fn4agY=;
        b=ntX+fH0euvgzODNOscbJ/mIhUyCEK/Z2tak8c7HPCJMI5JK0GmIhWa0Oo8jIgMTk2K
         P7w0d6ZSizOS1ataC2LA4jM2wuCVwBySmyB8v1zhRTxy0zIZoMoFgzU5QXQJs/VdWcFQ
         CnWk07f9pNXrSbOUrMpumffPMlRHDtqtjusJ0+/21S4C5jJnB17xTU0fANJPsZN5okQk
         lsmbhXFlgOwmmc5bdsuIEUY3aZcdSPtYE7oZ4nl9ixsNs3UDmqDw3K+UA51ki+R7ZV4j
         +cXDgsP9XoKvH/fD58nrIThjMlwQ5hQbiFzB5I7Z3y8wj12WgAjXz8u9WXxOku8DzUjC
         VAtA==
X-Forwarded-Encrypted: i=1; AJvYcCXQduyXNcGYvlnKBm1eevgolu2WC4LKabjNLRsOBLgmnkuUHemmytd+xMJJqvxY+PhycB9XP25OitHIgNTk@vger.kernel.org
X-Gm-Message-State: AOJu0YyWvcjgBCwjeBlzmCaUiBX6YHbdTPgs/NONEfNXQsB1dcs0IsRp
	V4Gnndss3SRS6yaVPoPgKFeXTeIzS6OlYfny/GFJIjIlwFt3hZdPfX+j4miCNkmaAjVYaAZexx2
	+lLYRrSXGpK+FVj35c1c9A1TpaqYi+eh4ztHfZKJXCKG1V+rb6cewTN6YgscOZ7iD9k90
X-Gm-Gg: ASbGncsn7Lo7iR8hKxf+o2WSii1KkwVsFYl0hssg/W22LCkiZHNEstsbYUQpIZ7heeA
	KkG4lXhPmmSh0g1DqaSxxGYoHx/dFzYZTUNAimAKeLvikAXIaA0uWEDI0B1ucJecrVdvY1geGDZ
	4QQKvbCwjp6RpM8Rq+NZoXKcb+vbMhzSkfgmsyEXD88H4i5WtoGhFtIjghTVcgZpQw+9RXyMz1V
	gkewZI1xxLES6wu3mFe+KAVq9ry0b1BWfnzwYQQEx9NfaHVpbWInLFJlfLyaiAIls6AsRFNDokk
	pVc7GGn7IPxZ69TKKWf4noKPoa84jQ1KY0USyACkbSeIf6mdEflBJKH44QsOSCK/aANvwkElAlb
	VIovGymXf51N6H/BgCSbQFvUTqj5hj3lntGM=
X-Received: by 2002:a05:620a:1a0c:b0:7d3:b8d7:a9a3 with SMTP id af79cd13be357-7d3c6cd8471mr1278004485a.29.1750082774037;
        Mon, 16 Jun 2025 07:06:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErsy0AzGP7wZvoQHWt0vDtH88N24PAi2+rnq1/4b7VJfb7Qwiz2c7LeWxv+Fli4AzjyHe3og==
X-Received: by 2002:a05:620a:1a0c:b0:7d3:b8d7:a9a3 with SMTP id af79cd13be357-7d3c6cd8471mr1278000885a.29.1750082773641;
        Mon, 16 Jun 2025 07:06:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac135d8bsm1570805e87.70.2025.06.16.07.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:06:12 -0700 (PDT)
Date: Mon, 16 Jun 2025 17:06:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] soc: qcom: mdt_loader: Ensure we don't read past
 the ELF header
Message-ID: <5u4vb4wjqvc7zlcwtyeixfhb6qnx5vppgnscvt3ypft5olcnig@rmbscleivq3u>
References: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
 <20250610-mdt-loader-validation-and-fixes-v2-1-f7073e9ab899@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-mdt-loader-validation-and-fixes-v2-1-f7073e9ab899@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: szfqnuVtAIHL7ncAiLNHjgaYO9uW8rMG
X-Authority-Analysis: v=2.4 cv=He0UTjE8 c=1 sm=1 tr=0 ts=685024d7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=_mC99nTGYcsxCmVRH_sA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: szfqnuVtAIHL7ncAiLNHjgaYO9uW8rMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4OSBTYWx0ZWRfX4Oy1m66GQPRD
 L3WmCnpODu7+zXKNe1juT+Td4zALBVhiUyeJ+KRA3bhy6bTU77d4zLit3b+vIaVv7RfJBwVfFH7
 xphYZq/fO0YqkZLGJJO1eTynC8r5acqALM+Q8D0uNtLHe4z17LH5IkAb1a37fj9edQuXlZb8R1C
 5nCpI8y9vDjkIoslUwotE6GW9UoWA0/XKGC7TFmC5lx710tZk9NHb6nVlNhQkKuY8CAfB5JF1WR
 JVjnvRhhBKLdMiDNSe7jE5NiC2IF2uEoi+gp0ClBNHX6yzqiueLf7UH5ITvrDQJqsIWs8BVOnWj
 JbRm2H7R2zdK8FWrv6yd1ryI/G9u7vZPon76SNIWXZBSXq81nMMYmiHKsmTpkJ11hNltGpCPesB
 f1Gvq/hZ0ul7zBPgvtXIbSkKMfkKOwQjUU+yjhyGzls31wuHhMPtpoeVHDg59wamaQjKBxF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160089

On Tue, Jun 10, 2025 at 09:58:28PM -0500, Bjorn Andersson wrote:
> When the MDT loader is used in remoteproc, the ELF header is sanitized
> beforehand, but that's not necessary the case for other clients.
> 
> Validate the size of the firmware buffer to ensure that we don't read
> past the end as we iterate over the header. e_phentsize and e_shentsize
> are validated as well, to ensure that the assumptions about step size in
> the traversal are valid.
> 
> Fixes: 2aad40d911ee ("remoteproc: Move qcom_mdt_loader into drivers/soc/qcom")
> Cc: <stable@vger.kernel.org>
> Reported-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 43 +++++++++++++++++++++++++++++++++++++++++++

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Nit: in theory we don't need to validate section headers since we don't
use them in the loader. However it's better be safe than sorry.

>  1 file changed, 43 insertions(+)
> 

-- 
With best wishes
Dmitry

