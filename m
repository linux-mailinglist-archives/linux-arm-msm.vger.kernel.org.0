Return-Path: <linux-arm-msm+bounces-84573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFEDCAA5AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 12:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D6DC30625AB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 11:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB461E49F;
	Sat,  6 Dec 2025 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyOzA7pe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HaLm6bdZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E67D13D539
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 11:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765021552; cv=none; b=Lmzz/vla7/1bkzXx4qLk6Hyr8STq52ZzTeWeUR8mnneYZzncCgTOlj2wVKiTue2dAM1qkD1tE33ioAYwAN71NPQD3LYY61DY/kaJSyAfDtU89If3YLdJGJBEPL1X0oJKFnHQ87rVJGKM8EJEuIbmoyimVCEkQI7NBXL50NNOdq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765021552; c=relaxed/simple;
	bh=yfJjYI1TKTl+dZ7vuy+EKk5k/Wwc7PCUSaLTtm6n/TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKGdv6DVTsyzEEnW77nvhL0tomxM/RlbWaDFzRsVpcPqWFLehVi0rz79g28wpfQC7qJZWnB3Pj8oh7OtxEUrsBAr28iIPp0k+OknLBcYmXr0NoQ5KwsSC0/Rubi9r+0i94W9AksWqRxuaoTogH6nbIq8dUrm3xvGDtux5m0V1E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyOzA7pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HaLm6bdZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B64EbET2278102
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 11:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qd3aBq0UymBii6ZFMhW0qvHm
	kEhMp8LfhgbHB7N8EfQ=; b=ZyOzA7peZHV4/z2NAtE5wgB8cBXN9TpCFGUdoahZ
	1MhxL98urs58pWFrqkOP3Av/NXo/N2NOFNrvUJajZS911nC9OsuQ391rYqLhSXqu
	4VYdIxXEiTvCcCIXyW+ap5dd+TsquG4n1x5/HTBRRCK1b3JTLmVKO6e4ct5wF1xI
	b2noMPAuSwKT49IYhUVhJ3xzwRehNwKoz5T35XEoSTsqzPQ4K0XAnEetQijpwkPq
	GfrFA1obaGec582kqqyqQIUsw4rLD/V8j7wPsEUUU1rDO9stkb32CHXRrCYMrt6V
	ylYRnP9FmUbZUhWY+54oSEmDUAnEwXpCaXg9cORy9fbgSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avd8e0ke8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 11:45:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b19a112b75so92778285a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 03:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765021548; x=1765626348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qd3aBq0UymBii6ZFMhW0qvHmkEhMp8LfhgbHB7N8EfQ=;
        b=HaLm6bdZP2VYR77HcOq7ui2e4kK0EBKXPAJZEqGiM/dC/kp9f0qAKJcLcL3BUR8rj1
         LT1ty5EMm1K9sNfoEfYbsaRij9KmMGbekpIZRm6K+RbhEd/fwdwWKylZ7cjmTATGdle9
         MPzvSkqMrK7n/XH/xjnqioQ8+VJzJTno+w9s/FOEFw7LPJ0kv9lkLvJU5k7BcTKe7JHy
         GrHw+l6Y0LT9yaqF3u5VYMWr62Z3p8wigBWh8jHPkaoaNmO+x4c2/DoT36/bNDQEbNmA
         a5n8umnTxs4cZih21srC9KWfaznpWlMST0jqS8r8JXZMeK8/9fJvZYoALYTidKLDlzyD
         vovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765021548; x=1765626348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qd3aBq0UymBii6ZFMhW0qvHmkEhMp8LfhgbHB7N8EfQ=;
        b=hSfWrv1ZKQZ8cE4hjySW0uKKtqP1Fy+20bV7JUr33msffJi2XCLGI3tYmStso0HVgg
         D2o93fovVrnX83U/8lEeQ2mU3EmB4bOG9ShAtJPBzH0GSjGzhMAxNywsc605eQX2ENXJ
         eaMCnY3EH5morroF+PiV6MJtwgVsAH7bnDl6a2Mluylx7FwmDQp8PbInNFUMHLy6d7Cb
         vX6eGf89NlOIGz/Pld0uI5NKa9RodL13VwlHD7TdKKlFEI0f5WNBzBYSlUMe9Yary6vR
         RAeyf7jfxMdehVs3AGyfx1/IoaOrlDAlLwl0dH7tKPb5vMsl8OKIrx9bFwRLtmncma5m
         ebvg==
X-Forwarded-Encrypted: i=1; AJvYcCWx18u2J1jt+bA+CBLBLKhQtDzW60cvLZxnAr0rpM3781/cMOJZUsjAtt6GoIwEZqJDOC6O7fL4vJyg5DY5@vger.kernel.org
X-Gm-Message-State: AOJu0YxX1t5aahmIFrjskcsQ4BERiC/FZr+95H+W69P01hJ7E8+fd+Gu
	zXiU41KoI5LhCfKiQ+mBip+tqztZjKB5DByiMYN9MIhQJ1DNSjvUC6Gs5hP4xbv3oFvOLi5srMC
	FpMUq2OP4Ef3j0AXdOFErcqksIfq1AJsFQ9fhkqIIfUTInQIvZswE4VyTAtYfdWs/fx0t
X-Gm-Gg: ASbGnctT4vUkMw9TevYmrOthNN68G9qMtmHS1tGffpA9an7+bXYSociWwdAefmv1gCE
	oPuMUxJOfTwTJ0+d1S86G4qIXuJJfUMmzTMI+/aLTMJpVYC17XWL8jjEpDEe6oBKEzi/HUYvR8B
	6VNEzIVJKhWDB/Bh/yEUwhel9w7C0pbLoXsrM91aOzgmrhMel+Tmg5pOQ13h82bnQOk7GSK3CTC
	tgpLN8YPuTF4pqoSgFWl6g6pfgyScJM2f5N0rZfk/OcJOpj/dWVX+T7ROHTH96xDTBPwwrgjl/P
	ixle9gn0jXKVdoK+/YZFYwk0DwskzZ9wl+KY+OF8KbA4StPmpvn+2zbzoFGMj0Ssd2c6rq2XBL1
	NZ93g5ZaYhtbnoeb/Y8ypT1wUjKc9JmPOQcNrJnbP6gOVaBhXLswkNxvTL5oRSwjIOa7Qyiubts
	+tg/nSYhIJa2EAsd6b64YjSIk=
X-Received: by 2002:a05:620a:5cc1:b0:8b2:f228:ed73 with SMTP id af79cd13be357-8b6a2348d63mr208849885a.7.1765021547769;
        Sat, 06 Dec 2025 03:45:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7lhRj80fCQhRwzG8Sy9MVABWIaWuDqVkUzPeyO/wCFqFIdnng6bpykxGDH3HN12wdPzhmBQ==
X-Received: by 2002:a05:620a:5cc1:b0:8b2:f228:ed73 with SMTP id af79cd13be357-8b6a2348d63mr208847785a.7.1765021547290;
        Sat, 06 Dec 2025 03:45:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70660c43sm21834671fa.47.2025.12.06.03.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:45:46 -0800 (PST)
Date: Sat, 6 Dec 2025 13:45:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v9 11/11] crypto: qce - Switch to using BAM DMA for
 crypto I/O
Message-ID: <2rua7crcsdwikakbchbsmzbcwkofzwwbujskknub42hpkxjlsu@owqmdyl2gyuv>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-11-9a5f72b89722@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-11-9a5f72b89722@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5NSBTYWx0ZWRfXzeEi39djn09O
 P0IE1fCX4PIB2ZA9m74tiS2ebGEZrl8sigJX8Xv0P4YKGfke3CTW4nJ0pHRNTYYtwYBIR1lwv0d
 6ccSxVXkkw71yA8a/OGotHLOK2Jrgt+81Z4KWoAC9pdzQ3kGnRwBli9IBGOUEZjxweX8Z8dZqHw
 6bx3IJ2pvwKpPfRneeWbGohXxnJcp43eMBHjm43l91S0v8u5Tc7Zvj+3rlDfyNGvl7jSM9VFDg9
 z/rvVtLxwtdRpyhKWXFeqGs48AnKN33jyAKoR3iPWLIxda5+hKHbbT0yb1UhyQJoubQE/hWdD9b
 HniACtrDUFPJGUQPgQt5MGdHTSQo9nfpUx6Db6l3lwia+uXihNi8LGtwTxkcwLRotlRU6UUTI4k
 nEXcPwu0/OjamBEXVfPI8efinP77mA==
X-Authority-Analysis: v=2.4 cv=BqaQAIX5 c=1 sm=1 tr=0 ts=6934176d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=RpWgtCqNgKFi5XhArUUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FUWYKVIBoc9_WC9duf4MdiEHZESRZS4g
X-Proofpoint-ORIG-GUID: FUWYKVIBoc9_WC9duf4MdiEHZESRZS4g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060095

On Fri, Nov 28, 2025 at 12:44:09PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> With everything else in place, we can now switch to actually using the
> BAM DMA for register I/O with DMA engine locking.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/crypto/qce/aead.c     | 10 ++++++++++
>  drivers/crypto/qce/common.c   | 21 ++++++++++-----------
>  drivers/crypto/qce/sha.c      |  8 ++++++++
>  drivers/crypto/qce/skcipher.c |  7 +++++++
>  4 files changed, 35 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

