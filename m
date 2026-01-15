Return-Path: <linux-arm-msm+bounces-89271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFA4D2880C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 893E1300AC41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060FA31DDBB;
	Thu, 15 Jan 2026 20:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNCiitYi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fEqajIdN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850542D9EEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768509948; cv=none; b=O0KXM2ZNBKeGP3vMnTnTE21dIRmduov56bEoEhT1lWFR94Gm0o+3R0czMzDmVY7EDoQyEWQttU6LE3MPlTFlkBSDk1huuWVs2z8kG1EG+ludI/AOmt1ph17idI+TKRFnZ466BRXhKF+lSmMF4cODuSMzy88WhEo7ih5mQbuvg8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768509948; c=relaxed/simple;
	bh=fwAmB0qJlbsVC85WALpU17CbW9uvCSuqOHu6Nw4RqUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPS3YsxQND+BHDxxTOdKPe1qhCt1LvR/d/AvWklcRxBCO2yqK3TqEYfwI8Z/epavGpayhr57h8i7yKU0Tum1oNMjgoVX8OC/fnLHjvPXxREMyFZd4UeDslsl37JTAmppTEQAMKEOSnHYzDa8A6A/5lKx65lYnBb+Wkj+9CyCHCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNCiitYi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fEqajIdN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYGrs3113500
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R6E8aIEcdWErvvrSA26t86V0
	yVBOK98/2uVOh2VXObM=; b=BNCiitYi/skNfGYATVL+B50wLK1SZA271JOsyozT
	zZ/nU2km+SVYUykof45CspZw2zcuAe++lBNYaYAlZgKDt6WdYAHFgJjO2ZEpMcAv
	iJOv6TJjHU+Nt2NJKfoqB1Dcbg1z+92v58Rk/XZ0WZ48os2pesy5SstxW2SBkFh5
	Fr/r7MRP9W+cPR5LWwBLJIGXwUhJtaNbt5lgJCTVdgJrhvsC+VYJ8ghflQBKGqJf
	rY8yArRDgZXHG8di/FSy+XB9phpIB5TNXbaM81zcd6w4SwxeyL2p26AEr/yGIS1P
	PZIf5LmwLApAomniMp2Ez6XMcYKQ9pM0lUPLBNoiy5yTSg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq2pm109q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:45:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52d3be24cso178594185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 12:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768509946; x=1769114746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R6E8aIEcdWErvvrSA26t86V0yVBOK98/2uVOh2VXObM=;
        b=fEqajIdNf76R7+odYEbWI8QjA/BfQ9JRg9GPIA8FosSaxM3EVIwadJBpCokf4jpz7G
         84Z2DuoAuyhOzSdBKh7zj76BeBd6OM4cthZhRbgpUpdieWWcwbIoaglzTKo49ilyk01M
         iVs2BkRpyQ3KWDHbz7ywvPqRlu0Gwq3DtxIuHHwahVvRTC8fW7d0MpeHEG2F2O6Sf5Y6
         4cU66XALoVCwbGM4Oep8atnsktS1CsI+jV7zb2PZHQOzlQkVtA5/yWR7hGZZ4QvwYMJA
         Q5xAH9c4qi28/2KSnpg4xUZFuxt3DWfyDPIweVzewyPoEmUzbiVLlTnHFf+ieua4cBUF
         Pedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768509946; x=1769114746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6E8aIEcdWErvvrSA26t86V0yVBOK98/2uVOh2VXObM=;
        b=oG7cPnHEsKrXlPScKDGFOcBkeOSCSgIsEA0riySbn881vc/kGehEOgYKY0XJIgs2Hc
         XuNS/CDPw9Wa7BSYzaTaoDuOQL9LzrwoHRZ9lGtDpMrtf+OVbmi0M5JfhgT9Va7u4F6H
         cwN5h7moLo1R2cJRq10+PS7qh+jSv4aaJosPzRxpmFMCTWAkn6cH6QM882KA8dwGFZdP
         u/x0Tmh97HITpoU0ywetOq1V3QwPgvfeuSDz2EIBSdsA5KzgAKhtNECzzTqHZCPVqa7M
         4lX4viBdRgcEhVQmtRnKqbXAgD5RdNLs6orRQO3lrY4kMrcLk06UrfikhH36AjRN+DYy
         3kqw==
X-Forwarded-Encrypted: i=1; AJvYcCUP8m5jmFVcmhVwNZUoVdigBvBo7ejPjCclwhvk8ZmhV5Vf5Zm8A8QSLoJ/joAPRoELadyoR91UHW3KxfLE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3LhJvZlHdWTYr4MoLowipEhIxCuiv3m+f0wyPr/wCsyWGFMFk
	Fk5Y5YA1QbXierIZ9oXndO/OXu+ExHovFQa7p40W5HztMoS+xcnN2HXAR9AGGk3hfM5ZFTCGam8
	G6cmXCY1pTBChUXJikRdfv38HEEQbkEMvAyiYpUT0Gn3+TE+DX6wWcCb8dw22W7jAT2vX
X-Gm-Gg: AY/fxX4RdOnjQmZSri4Kh342f/rN6ku6DFcUvVqy39Dwe92y6hyLrVVjApiUf8QyxR+
	SQL6bzbcmucNUD4aw1+QrgRfQ1ytav3IP3ksCL62WHOe9qgRc8mJSD01rkMBX1zI0Ayale4E3EE
	yoR1oQPnBugAvqgpFgZtDUABdpjwmRW+QS0cKcgy0o6sjW7VONqoHzDgLzTne3UiIlchc5YXIow
	LWutlNu+xrsz2euYqE4E5m8u/pJCGoc9NZpqa0Xi/JLGybUwygmhzQUb77ovWcjv864AMOcJ9p6
	eU9ybwPJP2cQktno23bncubr2j7/CKnlMAIEntiXOsf88ErPY9VoGtQaXY3Hlo48QfPtpQBZ6Kz
	UkDq0vmLmPBHYZPiNk+s90/0SyB/IW/FgnAOGn9cp7gQB/wPfP6sp7k97ayluAfi+bEU0dvoe76
	0ey7cP5cF1dChSwmmACq05ims=
X-Received: by 2002:a05:620a:45a8:b0:88f:e620:21cd with SMTP id af79cd13be357-8c6a67b093emr110523885a.62.1768509945804;
        Thu, 15 Jan 2026 12:45:45 -0800 (PST)
X-Received: by 2002:a05:620a:45a8:b0:88f:e620:21cd with SMTP id af79cd13be357-8c6a67b093emr110520385a.62.1768509945307;
        Thu, 15 Jan 2026 12:45:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c03bsm140307e87.77.2026.01.15.12.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 12:45:44 -0800 (PST)
Date: Thu, 15 Jan 2026 22:45:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
Subject: Re: [PATCH v2 2/4] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
Message-ID: <gfi4s3wn6ssmq2242ws5fduz7s46lrb3wgzvyn3y5djpdqtkqj@v4c5knprxotm>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-3-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082851.570-3-jianping.li@oss.qualcomm.com>
X-Proofpoint-GUID: zD9J8ckZm07oHSAo5iRYuNowcCHHXiZZ
X-Authority-Analysis: v=2.4 cv=TNlIilla c=1 sm=1 tr=0 ts=696951fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=40V_IHiNs5IrJg1Q9KMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zD9J8ckZm07oHSAo5iRYuNowcCHHXiZZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2MyBTYWx0ZWRfX68eR+kKM6HT8
 GSEBEmhBBdBOe1XmIenVPuJkYB8zU7HqBzZdltdol55hxE5RJEc05m79jpctau+uYZYtarTlglX
 TSOEg7sTqGd2rFoPfuNVREZ8H3rNv14oMCB70SWKg+OlocHP/hAUZkk9zqe2/0VVMXOvKIwrmh8
 O2jDYOBi87NdKJOanC9FSmkbKxytdZE7pkbV76jzBAvhWCOFxrqFfn+wOFBGclUw04JaWFhXvH6
 Toj5zhiAxmsXCedW3OJB9ZtsrdgXGi7lzt+CoqkzXrZ6p7gARWetawrjJeEBcmkcNZSlFEXiIWS
 /7BDQvyRXK8QQcT8H163bNCLRtzPq13+0W/CnwETQhLlPNolZPwjCf6MsK5daQoFNj4lRQ02izx
 7BZlieInXAuF8msT+n+RpGvSH7chXkcRt2wJm5CghTiWnzYsOi/nFRr9/S/hCLdaUn82kP4RAm3
 y2+QmBvrzEiA6KmQyuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150163

On Thu, Jan 15, 2026 at 04:28:49PM +0800, Jianping Li wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> The initially allocated memory is not properly included in the pool,
> leading to potential issues with memory management. The issue is

Define "properly" and be more explicit about "potential issues". Please
be more precise in commit messages.

> actually a memory leak because the initial memory is never used by

Why is it not used?

> Audio PD. It will immediately make a remote heap request as no memory is

Ok, you've described one issue. Beforehand it was "issues". Are there
any others? if not, please drop the "potential issues" part.

> added to the pool initially. Set the number of pages to one to ensure
> that the initially allocated memory is correctly added to the Audio PD
> memory pool.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

The patch  LGTM.

-- 
With best wishes
Dmitry

