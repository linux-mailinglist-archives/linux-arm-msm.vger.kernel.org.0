Return-Path: <linux-arm-msm+bounces-76316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 20994BC3BA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 09:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0406C4ECCC7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 07:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86172F2610;
	Wed,  8 Oct 2025 07:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbEkQFpe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE292F25F0
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 07:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759909925; cv=none; b=QhPokvZRuQwgadCai8UJvA1TwOGC1RobTka9O+g0VY/9VyB7M1hRvySNRNvLhvvzXrSBU9CQJMJlPBzJk14Q3BI5igDPODQK/9qTxIGkHMvAKmjyBk4oiMgEljdboGMS/4Z4FkYVtoBYp5lNcGW8ZyOliSjOC87YyEl87N3ZNlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759909925; c=relaxed/simple;
	bh=jp/zJEcCPvf4jK9W6zx5g+YSKeu8yY8hjmywdRuZSmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laEZVajXPEgjoTyWqq25iJJB6/LKGt0VPKMixr4U9/kPiM8trc0GTItkb36Mg1YXmzFCon4oaKhx1NugSNdRmUnzW5G0eGQ2eHXP6y36I5Koc3bZ+n3NXGv7hsLHZ6qsQ6H8cXC1dZEOrfn6Bn3tXtIHiHw48Zx/q3wAqZ+YhUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbEkQFpe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987arx1010635
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 07:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YRZFPPJQeCYCUJqQnDigqrNWBaX8OJqlWKA0JVc92S8=; b=nbEkQFpeRBLgPSQj
	/f1GLwdqSYQnSLmOMzcCP/how7x3+eNBMtAEDUCjEX6Utd/E+yinB3QFfMMQlwSc
	Uv2i54Y9RR30fXkrqie3pUnR3f9Cp0UQlYWlbniINnGP7l/4ADBxvbF9HlWpZawl
	tUUh/kDy69TLdt2XWjXovWJT0u+AF2BWBzBoyWTd9UTyc0+dHg6Z+d148idjyTZv
	B2gpn/vQoYrza6C3lHN0woop40T/CvLqET9ZGP+2k8ZNd0/k843l51L83fQV+v8G
	36q/si8FyItZ4TygoYzZOVRK8RK03imRIVzfWprJVKf6VLO6AY5QEopuGSRsCy+w
	Saq1sw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu9qce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 07:52:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-339b704e2e3so7740966a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 00:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759909922; x=1760514722;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRZFPPJQeCYCUJqQnDigqrNWBaX8OJqlWKA0JVc92S8=;
        b=iiSpoLJKT3Kg+FEbVnhHttRdLVYSrtfUYpmiybhwMv7PXlw52Bcz7CNbjZlqpDRNYM
         KdYY2kwY1woCDQLmxYuxHXStQqoinynn4GFgLlQVb5YutGC5qjGyRoGX8CQx3+ZXn3Q7
         kbogC4+P2iHrpCSqDemv81CF8vZV6aCxveLDMdlRPIVmju2aPvy2OXDEa/Kzy2iEeQYj
         HhYs79vQ1oGGR3prqyenrZbsq7OspVoHEjtT0MfLBAWp6Gvv+GenhAEqkVMvtZc7WpRN
         VLZr+Bd0ceOH5RkOK4YwnqgLf23C6cw5aDgAKMFwj1N8qNA8dEJ/b0LnYGkNSO8Qe90a
         yiMA==
X-Forwarded-Encrypted: i=1; AJvYcCXroq+21qe628REitFUD+UEcaLcAqRX9MmhN7gdjufcfOBFxEYHEy6/un/Z5+4nukS97yu5vnp/gg8yXpDm@vger.kernel.org
X-Gm-Message-State: AOJu0YyI4vY9+IPbmq+A2J+6hQ7E97PfS5UbYO8Ccvg4poj/JbpUoBka
	iLxe8MYxxyrAka6v/IrDcWc2W1f95vo/Lm6lNGKmK/PUNNGD30UTiY7Liu/xENYn2tjIicByjsg
	e0AqL//0Vsg/vj42xIf/TAPEHlJ89ZTIySXYT+gUm9bmBzQhuzjLR4eS/F5GSp/8+Yoan
X-Gm-Gg: ASbGncv5ejb55RDhwoWakCvShx5oaWoG+sqjPbpBkySSwOlejhqez60bjHZvDL562nl
	CbKsNsyF3guOjrnKQO/CLViJpHLqRmBN4TnvyXX8H9g7aEVl/5OMLcOh0r9UcjeV8RucQsQ6vn9
	4ZW/ON8ti68d84KzHiuOUL2Y0Ch2Z+fuuG1ui4o4G+YQWiYyd8/Pgx7+BlNxPCfG3e0Pt2vf25f
	gwFxv/z/do73y0TR5hty/0TOZqxK72XOjUhx0SYcdrI4JQGwrVSLTSNhuFefP/gjxqORvzAOxSp
	7fAMHJSxAhoPQke9PuCAZPOmSGwUZh+cxGpbqPfojtN5+5IMmBI33L/93SHvGaQ2A6uuw9Pk
X-Received: by 2002:a17:90b:4d12:b0:32e:3c57:8a9d with SMTP id 98e67ed59e1d1-33b5139a279mr3467243a91.30.1759909921538;
        Wed, 08 Oct 2025 00:52:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu01xYjaBLVLru0tk2ZrxcSyg6W5LORhAKpnIdoAjX3D22/ZziNpKkl1IjWF6AN1qDNFxpNQ==
X-Received: by 2002:a17:90b:4d12:b0:32e:3c57:8a9d with SMTP id 98e67ed59e1d1-33b5139a279mr3467197a91.30.1759909920761;
        Wed, 08 Oct 2025 00:52:00 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5296d52esm888452a91.2.2025.10.08.00.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:52:00 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:21:53 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/12] firmware: qcom_scm: Introduce PAS context
 initialization and destroy helper
Message-ID: <20251008075153.wjvlnjr3iuncfued@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-3-de841623af3c@oss.qualcomm.com>
 <qqjynnzjhpe6elglh3xb4ghbtesfkr4ssxyq5flhcy7a5jp6ym@3viy7jyesamq>
 <45eb9c5b-bc8e-4866-bbaf-5afaed9fda21@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45eb9c5b-bc8e-4866-bbaf-5afaed9fda21@linaro.org>
X-Proofpoint-ORIG-GUID: P6KR8YjDsUIc92fUvHUDMKTEdU2nWhN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfXzutqAqvS6tWt
 ONfUTdv1+q34GK/qsBOii4jXu8i5B6nioVmxz+GMhCc8qxKElaNVI0wEiwV/2tmIxha+CHcZICj
 iaUsYvJmxpAkPsgksh+s3SsvScMfGeUBWQ1XU2Mln4qFIStVTkXyL1tIxNAScq6nJBTHW2RYDw0
 TzTcfc/E0Wab9K/CZlZgFxvDTnvhip9ogK15y0zTAkdxzMkH9qRdyOlHRLZRquMl0DrLFDRU3Zu
 TOixsOE+UGlnqqpkYrXOz7kyxwO66g647E3V77rd5P6kO5xLOY3UERJiFzRxD+EwcOhZH2j/Yfg
 Iqp7KaVleplskaODkCElaDMJ+hOVWaSw638+sgE+1sqYFCnYO4J4IpXrKX8mmuoyNlh8X9xlMYe
 j/lP4Y/KiCP/oS5TL5dK6jwXIhaEPQ==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e61823 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=3aEvWvYx403qF7UyPRkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: P6KR8YjDsUIc92fUvHUDMKTEdU2nWhN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On Tue, Oct 07, 2025 at 11:16:28PM +0100, Bryan O'Donoghue wrote:
> On 07/10/2025 22:23, Manivannan Sadhasivam wrote:
> > > +void qcom_scm_pas_context_destroy(struct qcom_scm_pas_context *ctx)
> > > +{
> > > +	kfree(ctx->metadata);
> > > +	ctx->metadata = NULL;
> > > +	ctx->dev = NULL;
> > > +	ctx->pas_id = 0;
> > > +	ctx->mem_phys = 0;
> > > +	ctx->mem_size = 0;
> > Why do you need to zero initialize these fields before freeing? Are they
> > carrying any sensitive data that warrants zero initialization?

Nothing special about the data.

> 
> Mukesh, have to say I don't think adding my RB to this patch is really
> warranted.
> 
> I gave review feedback that the above looked odd.
> 
> https://lore.kernel.org/linux-arm-msm/9139706a-708c-4be6-a994-120cce0cd0e6@linaro.org
> 
> Could you please drop my RB here, and fix the above in your next version.

Sorry if I misunderstood your comment on this particular patch.

I assumed your concern was regarding the manual destroy call, and I
responded to that point. Since I didn’t receive a follow-up on that, I
proceeded to address all other comments and added your Reviewed-by tag.

However, since we are revisiting this discussion, it seems appropriate
to remove the destroy function altogether and switch to using devm_
APIs.

> 
> Also please add me to the cc list for the whole series.

Will surely do it, thanks.

> 
> ---
> bod

-- 
-Mukesh Ojha

