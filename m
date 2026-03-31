Return-Path: <linux-arm-msm+bounces-101110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KrAFPcMzGnGNgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:05:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E75F236FADE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8216B30AB4F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1AA345CBE;
	Tue, 31 Mar 2026 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GOuDg9uS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dO2K6jXE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CCB3E5EE0
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979841; cv=none; b=ZjhgHv679klcmPjwYT/jNkSKSyCcOSaIvDTEhUHEav4CaPDAr3RbBs0bP4uY00+ZFgU7qIbyOZuRBRchTw6ivFQJeeBVojuJz3ilAm4A8lzJCnAtkj+2l7h+cJnvTWGVdYpFk0EqCLTT78q6gJ/Vr4Br57E8QAQMtWgDEoUrI6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979841; c=relaxed/simple;
	bh=ZNMDvUjp1Z0vNgEAF/F4D5sKB1e2hhb+mazoqSBw604=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPVyO0le828G9vZZS4pEmHmhJuCxa8V0JJRgdTwmj/wPI8RFP9WCOvO+SjRgpfdXyNEZY4eJIGbrELCBMU25w79c7Gs/mfWXHZp+AsHa3hyAKIkWDYgN0iczPjdgzzme1CuYn9mavrHsOZ4hLYWlIqlupl/cnz5oEX41wiYcGAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GOuDg9uS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dO2K6jXE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdJfu3882842
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5oXftKeZM1w3lPhQGQUWCz71
	nY3TyjltUlO5BVHsn34=; b=GOuDg9uSO3rdoGbbHmUSn9AGAuKuaQMCkp8gfB4b
	yclyGBYSVIf5kifgsAXy56BT/xbdddgArJBJib22xgCw+5fbo+aOKVRVRdK52A/S
	sPcdo8bB5+XgDe7H5ayvFvggyxcYg3FkePjhy6egLl/x3mKzgzjPUUv/dwy1ofcr
	vNTxUInWBbseEfhDIZt/dJ7appG5CbYuc/0Gmn9dmMU7TfmHFthnImjuQ1HsRvqt
	YE60h+7LbnIT1DAHI2nvSBZdQ+RsTO0x2Zj8yqqpB3LQsdph4ZQTkLKcvifWIZsh
	cAIgnBRfJDlIM43/ZuQ8HhYRF8gdVETc8S6ySlnXl1IEeA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89utat8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:57:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31cff27fso55495241cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774979837; x=1775584637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5oXftKeZM1w3lPhQGQUWCz71nY3TyjltUlO5BVHsn34=;
        b=dO2K6jXEkfeD6xy/cHok190Blvs/H2GHvQ75UToxN45QR/TCMV6z4LnlEAoLIM1cKs
         E777selwcG1rwqhMlLT8ELHM0hV5DtpBthVIRy9sFHIpaw2crE0mw/ikvIjA3zq3ujXN
         dm+RBjLejm/pxYin8/RRt98Z5tlrQ5JE7LyUsiocMqqJNjKmIiR/BgFcLRVGA43ChRhR
         h4l0ohDqgx5dqgDze7jeyTvDGp0fkkcz1sU8CIppVFKOudF+iDUqXdOV7foDmaCKDPK4
         zjt0DPZf93ejyQ7do3P04Av+p38K/Enmtf339O/HbckveXMNbm+IYslghBkxaXk4im5A
         wZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979837; x=1775584637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oXftKeZM1w3lPhQGQUWCz71nY3TyjltUlO5BVHsn34=;
        b=KRPJTg37sd0R2gA8SQA3ZOEKPWnm7WyEGPb1ydcWMeB1znk0/qsdkiCYJCG3+XaPec
         M+O9FLJ7uBu3U0yI5+BJJe78JBpk+EgLLSEfrQ9DzMHYQPkjmq21vztYgGHe1zVpo6iz
         msC7oNsNmKt1EzZgbofev7AG7AF+wC5jzWPICdJAFX/cUydjEiPOICflA6IIo96FhQ+B
         p77evls+NtJR/z+6p00kwkfUzn0bCaEteSH3PaP6Xg7T4v6kDo8hbT5u/y/xw50IkFFQ
         yItFkTEv/LOHeJIOP+Sp5aeXkcyL/JnNIqOY9zyCe3DazbIisFXrtZZ2nzEEpveCoywm
         VE4w==
X-Forwarded-Encrypted: i=1; AJvYcCUlXfbAqwmRIZr6dvp3cLALX7R/K4dlCndK6ID241bjKBNCSSOKn652gbsIOLv/O9A9IdzdQ7p4dM8d+0eX@vger.kernel.org
X-Gm-Message-State: AOJu0YzoEMKQs1TRS0izmW0KliMIQgWRTfpPPeqJKTpXEDkKRy1KN95B
	mnR/pXkfPdn0JuxpRGbaGGB+H0DQXvUGgMCwA9QlGjIxBuBKrukfdgY53/wzZMG6a73ko6RKjGg
	akTRtngcJxCDxXrvWONR0wmqlAjKdjtCabFjxwSEZZPVGLxUvx8++BnlRa+NUp6ATKXC+IkbN9c
	/V
X-Gm-Gg: ATEYQzwTqsfiOI4StrK/6NgH6m7aTsad5+860uHT6yW/wfKxVFIsoaLXr4IS8t1OXxK
	YoOHECYMP9Aev2ehSL0PXWxaybRVvYph31r2qmAhh2pujWjGB5g8JRqU+untx3Vis2334Y5mRdr
	zAjx++Z4kJ2/7sdZIqk6k7vc8hrqnUIudegWVZUzWfOJb86FgioKYSdEgQT1eh7P3EFaAm3GEcN
	fOXNP2xDQcV8MftFDE7+yBlt6HQj81+OzSI5jgZ+Bka89nawTF+XEVJfI3kBFFs0R6f09HT7CGj
	oNpWxNmbg+chT2/06LIWisP3jYwY3nu80ihZvOPj9O9k/epxT4j6GQfIRsbzaMVQZYgqJA5ouUj
	f4MZdV8K21d6LnrlkCufRCz8GiqQ9QlLii0bP0UVnuBSPuvGtgOkDxPiQeB9mp4kBHkG3VmYCEK
	GPt5zWDzKwvuJSoHqIro47G5aFzVhzrOv2txg=
X-Received: by 2002:a05:622a:578e:b0:50b:4435:5dfd with SMTP id d75a77b69052e-50d3bb8e8c8mr7412411cf.1.1774979837186;
        Tue, 31 Mar 2026 10:57:17 -0700 (PDT)
X-Received: by 2002:a05:622a:578e:b0:50b:4435:5dfd with SMTP id d75a77b69052e-50d3bb8e8c8mr7412051cf.1.1774979836664;
        Tue, 31 Mar 2026 10:57:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2ba02c26fsm939342e87.21.2026.03.31.10.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:57:15 -0700 (PDT)
Date: Tue, 31 Mar 2026 20:57:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: smem: Update max processor count
Message-ID: <dopgyc65xh2ei3oebltbzrog2jkpwzoz2fu4b4vmpsolmaziva@qtfbuipbeneo>
References: <20260331162439.1922486-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331162439.1922486-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4M4_A7QYDNAoZ8Ez622MHjd-o_n1BZnJ
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cc0afe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Ujbb7JZiITYpRNsm72kA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 4M4_A7QYDNAoZ8Ez622MHjd-o_n1BZnJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3MiBTYWx0ZWRfXzBvXgQ8LBAXE
 4ah5ZkLWqR0BiQFG6J0+ZLuLd3O0RD/62ulwlI08DWGcqyvl+7aL8Duh3v/Avk3IYO4vV1cvC4e
 S8Uc1yrdo9nu5PDN1rsSDiwQOqEPG53rg1hr1xnCP5TpdD0iU0lfS+X+v8UU6Qnjt1zZXr+qVF5
 VSrae58a4/2lkhY0UJV6Ymi55NJgx5urykUmSNiX6xYZYmmXZmd2ewt/uX2SklQKRqoJCcFnWnh
 2Idz9fJIK4jSH5epEEFAyYWeeFuA0bNlQybUW9wvBoaQtZgwLP2K/wM4zdGxwV/dNcREqkvNWdl
 3s76dpdlHb8EMpPYSHVwrP/b5CtlMnEpjW59ENri3ZNCZHyv4lhX6pav014HdtPQ23A2j8S4g2q
 FUTvkR99ZfOLiZn1H4GNYxJucHNHKbYJF51/wFy8DuZGSaZgBnpZIbCy5qS0jN+qGR2pxApZAGQ
 BlPPJo1H4PXhg9qjBfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310172
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101110-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E75F236FADE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 09:54:39PM +0530, Mukesh Ojha wrote:
> Update max processor count to reflect the number of co-processors on
> upcoming SoC.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/smem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index d5c94b47f431..8daa25d16fdc 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -86,7 +86,7 @@
>  #define SMEM_GLOBAL_HOST	0xfffe
>  
>  /* Max number of processors/hosts in a system */
> -#define SMEM_HOST_COUNT		25
> +#define SMEM_HOST_COUNT		30

Would it be possible to get rid of this constant at all?

>  
>  /**
>    * struct smem_proc_comm - proc_comm communication struct (legacy)
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

