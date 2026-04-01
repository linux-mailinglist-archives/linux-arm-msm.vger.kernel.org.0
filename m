Return-Path: <linux-arm-msm+bounces-101304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLWfFF71zGl9YQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:37:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB0C3789BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9439F30C0522
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247C93B9610;
	Wed,  1 Apr 2026 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5wA3/OA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5GdHfzn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C9B3B6348
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039325; cv=none; b=bezQ9iTA1Yb5s4R7SSOUiBL2lSdt2m7O5yaqGu4Q8iBE0GEZFfQerkr+9TMkWkejYbRQsEcP47Z/HMfQafTwmShfjt3dHxr4cUv5DcCViokAlbc5+WRW8REbUam8W8aJf88veFYGw4wkMfUBScahkqfzGz55kUT4MjSKuEGKG4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039325; c=relaxed/simple;
	bh=Y8U/SbnTbRfnG+RUT0NrN27E+AF4Bz73IZMBskY/pEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjbMQUEfjOmpBdEkht6HW7mLcWS15PMtnpiQt6y6UkS8sLc9UqiqEP+3zK6OeOUrbZ7dUD0HijmepO7p8VUv3YtRu6tUw/rZaO6dFUXCHH/PV7BcYcSkGp9cB+YzO4+Ch1tV+DTWm6EHFhrUjSwBMFqVWcM3gbQW3yPOKTypnWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5wA3/OA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5GdHfzn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63171bhw1285864
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 10:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vZuGnBT5fF54znCHzcS3cord
	3dOAyTYL8OrLS9VzRvs=; b=p5wA3/OAskhAz0BiSuYFmnkBMuNmMqaDbbSZCyS0
	+O1TLWS32ksdj/cr8Qdn/ejMcJz+QhScsPCoZ4F58dRsrMEhPtDhcTAG9gyjP8VO
	9PCtSDmX9BltegyKGGDF+o2QevRw0jaVF5jFeGfjW9FtieP5ev87f9qI/fV8RSfT
	xO+oDTF0waaL4g5oYH/Djk7DLygfgMCQVi7vqK9tByjYahcCiKeCwjCYY2bcE92e
	NpCVU8YPumzkzx4QzY3eemcKMdliQ5A10cAFCtUYkCGoBiM0XTnXo7/0aV78UPOf
	kus/nOGgXg1AFrtCwTwuxzuYU5hmR2PjcRfQBwTrIbc/yg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3rsea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 10:28:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35449510446so7253213a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039322; x=1775644122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vZuGnBT5fF54znCHzcS3cord3dOAyTYL8OrLS9VzRvs=;
        b=X5GdHfznYRLkH+plhEttf898ydTGNDrD9x7+fZ2p/dgNRKry2MfPgZCMmcZMYRIBaG
         aez2mtW8FDB3/YtigSx/ijVCGp7vb3k0SuDjqkcTCgCXAPN4C5NL4hAzEFznaOZBk8Ua
         AYlQfGTuBAecu9IoUuOnYTjqKkzAnJb+9uHG6m9YrB2o1VxwpASg1VrwK/yc0uIaI4tf
         BpCrgAryVcU3dWeOmOwv9XAWpTkRe2RqblA0GRetajUeIwmyUmUoX6gSba0Mmv0qjMOc
         2tt4WhYlNP3Daf5ADsuLDB1N1EmL9w9wk1RHGEjsSsFgglf4AZfVwLrDzOqiHGcAWz/P
         If9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039322; x=1775644122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZuGnBT5fF54znCHzcS3cord3dOAyTYL8OrLS9VzRvs=;
        b=rsN8Dhyeb6Ea1dvtbwoeAHxeSTpunEH7Vdk4e1M2R21zOqtPrsbfNV0qkYtoR6cN4c
         BlswhF5rVOozuW6fkbCRu2Yg/hugb1c7qMNII+cTSpDGBlvVJOD76pbr5bRYahgtSQki
         7n+fyRxTYCYN8MR3Mi0uxiFnwGHmbFcA/H/NLqRnDIvNBBTd4Jb6HXiSiNFDOa/nC7Xd
         An9U60Sb9TyapWMy7xpoTis1xBQDDrYoUO8k9HhffEr6FBw8SWvJXOzC72KVEGF/YbiD
         y8obWciusXi4ZVUwaVrWwaAi6h/xuseVJfN/QcuLccqlCYNBUWcPM7x4GGwBCUHLU0r+
         3crA==
X-Forwarded-Encrypted: i=1; AJvYcCU0gNNRbGHZiTsQIpZ7pedPFcvA9meR9LMKXT4nxXH2Xce19BwNZqv1vBQU4wHzHWOqUvojzvgaXX8CRibI@vger.kernel.org
X-Gm-Message-State: AOJu0YyeoWz9mJtGOcV63MRVYABNCdqvTk0VjukVcc4JUxGruxNfOoEV
	dhWJ9Zewdq3TZ6J9aqfR/rFXSMmjMVmUecg2jwdbkuFNnqm/RloN8Tjoig4eR9trNJQN24EsNFS
	+FI/GMnkIp5WaUx1sL2HAa7DA/2i3HnvJ/LLOk/HD3P2qcO0Z36GJZx62X7Y3f9h2TxuD
X-Gm-Gg: ATEYQzzLMNBq3ml15dlZLLHdrZZ/epIKkpwf4ouiMgjNIU8J0TXuucN5gHZmfPSrJ10
	ea3o80fTA57uMUhU9iaUXMDDOFmVuFpoKgPBOQVu3SqyrnlQiMf1C2We/Q0+rQzN8xdVF1+LYwz
	GPXXuJCcQa+w+M9YVZd5SEIe89GHe2f9/LZgiRqwhXoRhgviNPi26lngE4Xg/Tye/lY6nbbKF5G
	QICIEJqG0Iyn92ima0UoGmJAHy69C4dodfRRgeBRTPtY3GNsg7Svqbm1r1UWnUpCootVKvpv0R3
	alwNJBRfRD6xRQPdlxWPzEwlEm4UIAx2bMLWm+Yf06Tsy/9d+Gl9lDYXTMQJnElvK95YuzASJQy
	XmcXNLo9+PwTlYyh1Uju9886wwDHfCg32oTa/TBvVDCLkvl4F
X-Received: by 2002:a17:90b:4a81:b0:35a:24f3:2c8e with SMTP id 98e67ed59e1d1-35dc6e48f8emr2783732a91.9.1775039321589;
        Wed, 01 Apr 2026 03:28:41 -0700 (PDT)
X-Received: by 2002:a17:90b:4a81:b0:35a:24f3:2c8e with SMTP id 98e67ed59e1d1-35dc6e48f8emr2783708a91.9.1775039320872;
        Wed, 01 Apr 2026 03:28:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe6e2fc9sm4634555a91.15.2026.04.01.03.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:28:40 -0700 (PDT)
Date: Wed, 1 Apr 2026 15:58:35 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: smem: Update max processor count
Message-ID: <20260401102835.mg224zzzapjd3doe@hu-mojha-hyd.qualcomm.com>
References: <20260331162439.1922486-1-mukesh.ojha@oss.qualcomm.com>
 <dopgyc65xh2ei3oebltbzrog2jkpwzoz2fu4b4vmpsolmaziva@qtfbuipbeneo>
 <25a0cd52-ea99-47a8-9965-18a1e6e0687b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25a0cd52-ea99-47a8-9965-18a1e6e0687b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69ccf35a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4BFwz5vye9m9lzpxv6QA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 3ph-FJHc0HYeEDrfqq5qFrU_4ckxaOXy
X-Proofpoint-GUID: 3ph-FJHc0HYeEDrfqq5qFrU_4ckxaOXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NSBTYWx0ZWRfX8sWtPX12xeDO
 +meEhs4Pc8YigAoYUSPhnvbuelj3CSw8pJdaRY2CRyQs9/2SkabDTuFN343NLdc76TpU5mzeFN9
 c1xjRugopuQDHIALiFuwp/73hChXihKCc0zhSU4wkkgI7XtGW0yU51XRDvQW0720adlmn/G6gZ8
 Y9C3jeEeQNtsmQta5z+POaiqKCZtKKSQ6IbDogJmfVZ+/awjo9pA4oEioCYA4x1g3dM6MJUjA8y
 /N7bvlKRm1o5V9CMlUu/HF4jGjPrx3m5/R9vh1aOYMtKawSGjJ760A2PpEK1Ft8ljCbfYWaZTgo
 XAR7aCkCqhq3bJTQeTM5aMC9qxmqsQLiQRSYvK+EBqsqG0mbyRnGrxFJp/DlfT4QjUw29tJcjOh
 bsH2dAQAzIWqyrYRK7EomhPCwdYFMToj8CSJGkT3MRMclYPY+60sBOgTucqZp3utXQLf3buhfZ0
 6W/Y+yTASHo2+gNyBEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101304-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mojha-hyd.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCB0C3789BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 10:25:05AM +0200, Konrad Dybcio wrote:
> On 3/31/26 7:57 PM, Dmitry Baryshkov wrote:
> > On Tue, Mar 31, 2026 at 09:54:39PM +0530, Mukesh Ojha wrote:
> >> Update max processor count to reflect the number of co-processors on
> >> upcoming SoC.
> >>
> >> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >> ---
> >>  drivers/soc/qcom/smem.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> >> index d5c94b47f431..8daa25d16fdc 100644
> >> --- a/drivers/soc/qcom/smem.c
> >> +++ b/drivers/soc/qcom/smem.c
> >> @@ -86,7 +86,7 @@
> >>  #define SMEM_GLOBAL_HOST	0xfffe
> >>  
> >>  /* Max number of processors/hosts in a system */
> >> -#define SMEM_HOST_COUNT		25
> >> +#define SMEM_HOST_COUNT		30
> > 
> > Would it be possible to get rid of this constant at all?
> 
> I've seen a patch in pre-review to do just that. I'll poke the author.
> 

I see that now, thanks.

> Konrad

-- 
-Mukesh Ojha

