Return-Path: <linux-arm-msm+bounces-67793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBD5B1B607
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 16:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5474718A73CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 14:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B9C27F72C;
	Tue,  5 Aug 2025 14:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAIMma6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D96279333
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 14:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754402720; cv=none; b=lYcBDqaWaSM1WQeSb2HMNcXiStuYUaTc3pIo/oeQbZl/ndIiOx2BEgh1UrnWlHwEv4fh4RYR4/NdHdP9W4asb249SVpMVVPaSyNmznMzTeGzcaTQVNOF0H6xjyvTRX8XvjjUw+Q0JL6eeDX1NYBG5st/4JCQaAGt4t7KvTyB6Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754402720; c=relaxed/simple;
	bh=8J5cuWTNGNmnCmEFZreVGaQl+BFghG3/wBWhuX49l00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCPZz2RqSSmDU7B6/+GhesrDs/7zp0sovcgtwfSpxkCbzlpn7xTOB1mlFFx5YtXQxJj5TaE2oqmie4fazNlegsGbVOD1F0SlYIhT20fiszPdZQzsE0BzM0jygorNUsIVtx8JeLWwpacIpgokHxyLF7L61xgAwJwQXJuo6rZANgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAIMma6C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5757FThO003583
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 14:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y8GWTLsDapJ06m9sj6GKQ34d
	0P33lgkh1NvaX1OZEs4=; b=jAIMma6CYw3JK3nfFf0Da2hkIb7nPW1Jh4bDgmtD
	5iw1pkAPLrNmwsi+f6MHzF+yZXpcqvNA+nivsWmTgTGBYZsyFEGHnZ6Z0C5WgLKo
	+UrsaTVsR3Hc2lBXoCXlKiULAlsfBm+nhYZSLvLhM1MECxBSCQIzQYtwqEhwEkkm
	SUHpQ9vVYlxAcPlFzel/7M8ThaizvIwdTPXXqqsufHLPnMeTT1EilxP+W6ZJKsHc
	C5z7N2AdRpr1WurFIipApsqpmD7uelP8DxdCKqXMZ8N9XgDUpIs4ptV4JDZ+vh3u
	eD4BQr9Qvh4D+WvpvJMBklk1m668AibdG7HQg3pQ7LjOIA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b3j3tm9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 14:05:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31ecb3a3d0aso5248126a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 07:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754402716; x=1755007516;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8GWTLsDapJ06m9sj6GKQ34d0P33lgkh1NvaX1OZEs4=;
        b=qQ3ijameMICZWJX2q6r9aWi+cM3iaTi6VUsRvsHw/gQsKn2/HehYqiUgKlQMJj7VaK
         +FJ4uZd9lHAzCIsGe2LJVSmha4DuPsjMZOYrLX76y1Znijh6ut0XIUTdi/0oC62Aywbw
         5nWDRPiAHY6gdR9xzA81/P62KrSruB2ufNo1Ltx+zBI3k1DCt1SRIKDXOvbOFDYI6plm
         MdDAChSbCTmtFG52bqX0jz9JZvjnaLiiDykPV9UmmP4FPvpNX9sGrN/JSEjalGXj877Q
         4nfpF4VHB+0TUMnPZJhF02octzwB+LH3YblKvlNIS+K0Xve5GPS/L1pVzzmrufTIMrI4
         jSUw==
X-Forwarded-Encrypted: i=1; AJvYcCWgIhJnCtkzjh3EzZUgCshOfNaCjpOGdRcA0Nx99vr0wPuOjvUr/MpI1TUU6r10MPpwVFyGxbJJSc2/WMDn@vger.kernel.org
X-Gm-Message-State: AOJu0YwisVp+vf49k6n9LfAsPdYoW/mcFADHxPe+Hsx8mfKXgRwIj0+y
	Pv2qWGSNWfj2WeVAlaaU6keSjGoUIF/4KdeCzXPO7zrxbKXEDCHfxmdPbXVw02QQ60n2gvOK4NG
	2WobdPxj3nZv+yrPPMpkH5NHK3K7gB4ggKEvZwusTXCqLX8K9Clm9u+9o/8xG81F1q2ao
X-Gm-Gg: ASbGnctGYUeCJItxT+a5Q4CAUQV6G4tS59hXFxNbNf6H4EtSb2wByrtld8hXdUzcdJb
	JjVkTHjm/fNVm2MCfKMjxoA4WnXE0iJH/M8qMNrjKVVRlZkzkza29zqDdIvK97oTTeE3Zo2QGnb
	Um+1sENUXO4T1TzOoak9ZEFtDauDNPY2h0j3RhI8ZWWooZQbiyxSwTJ27HFJC6dnXM0gbHH9mPp
	P0RxJm6SZsQSNp+nsDUxj63aX2K/m5tTx5ZewPJk5GA2ib7sY6GTH+SRY1MnrVlWJ5aquvRK02j
	C6IQJD1UIIfxK2tv9lRqDON3gPALn9WilPzbpXyrnRCQ6vgLe9UbRB0VoPQv82/V+eg=
X-Received: by 2002:a17:90b:3e8a:b0:321:3715:993 with SMTP id 98e67ed59e1d1-32137150ad5mr11688570a91.14.1754402715854;
        Tue, 05 Aug 2025 07:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjmfwajEFNC0n/4JWnoR261FA5nFMX6Yqgmg9OjOOyA6BAlGJkbJzfB308KbNyUV9w099bVQ==
X-Received: by 2002:a17:90b:3e8a:b0:321:3715:993 with SMTP id 98e67ed59e1d1-32137150ad5mr11688449a91.14.1754402714757;
        Tue, 05 Aug 2025 07:05:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d846esm369077a91.8.2025.08.05.07.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:05:13 -0700 (PDT)
Date: Tue, 5 Aug 2025 19:35:06 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
Message-ID: <20250805140506.b6d2x5berkss3it3@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
 <658d7d55-fd5e-42cb-bc5d-abcc0b47a168@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <658d7d55-fd5e-42cb-bc5d-abcc0b47a168@oss.qualcomm.com>
X-Proofpoint-GUID: k1kQ2Z1gKrbGTglZZUVJR0OTfl-UUXrq
X-Authority-Analysis: v=2.4 cv=TZ+WtQQh c=1 sm=1 tr=0 ts=68920f9d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9ZXyijcKk7BvzWFVFWYA:9
 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEwMiBTYWx0ZWRfX5exfusb27WTV
 +hDTsZdkczwLp3BGSazWW768eQqL3OcQqyc63sy7DdMtPjZ9gA9lDLQL5bt1J8RmlRThXgyL4oK
 /oOGFedoejhpLnhfnJ+CQwhvnzIN/ofXAEIPELd9yJpDSqdmmNTZH0Pp9Xm34FbCpovCqKjVmJ/
 5jeItVyKY4x9QnjQo6GsqTmV7pml75cp5icZP4E8QE8HW4tcLWfwqGrp+f7Jj/JurJRX+5eQE+f
 PMXY4e6Xvk2kLxg90Lppwu8fMETUHAlA3soKGDAD4c3O0yo6TnqhgA916MVg+nrgPyY3hdL/VLc
 dVSoH28DdNK9xZ9sryKg6bgmcLbJ9AMH69/y3J2AyDRHRcz72QNf354zzXKhC5vBGN0d1p2it2V
 09mi2OSzuXmZqpiMRZpzjgHe33ri1nYx4v8G2oBy/F30WTE/f+BZL1ez1Ng9f4gHT959cd3R
X-Proofpoint-ORIG-GUID: k1kQ2Z1gKrbGTglZZUVJR0OTfl-UUXrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=910
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050102

On Mon, Aug 04, 2025 at 07:17:02AM -0700, Jeff Johnson wrote:
> On 8/4/2025 5:41 AM, Mukesh Ojha wrote:
> > pas id is not used in qcom_mdt_load_no_init() and it should not
> > be used as it is non-PAS specific function and has no relation
> > to PAS specific mechanism.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/firmware.c |  4 ++--
> >  drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
> >  drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
> >  drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
> >  drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
> >  drivers/soc/qcom/mdt_loader.c                | 14 ++++++--------
> >  include/linux/soc/qcom/mdt_loader.h          |  7 +++----
> >  7 files changed, 17 insertions(+), 21 deletions(-)
> 
> Since this patch touches files which go through different maintainers, do you
> have a plan on how this will be merged?

I am hoping,  Bjorn should be ok to take this into his tree ?

> 
> I can ack the drivers/net/wireless/ath change once I know how it will be handled.

Going to send v2, please ack it, once we have confirmation on the above
question.

-Mukesh

> 
> /jeff

