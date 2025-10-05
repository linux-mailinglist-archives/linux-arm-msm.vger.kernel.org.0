Return-Path: <linux-arm-msm+bounces-75987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6CCBBCCE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 00:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 110C23A8C1E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Oct 2025 22:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C16A1A9FA8;
	Sun,  5 Oct 2025 22:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/byXwH0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C22122F01
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Oct 2025 22:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759701932; cv=none; b=MjzKr/7l7zXrDPPTPw+Nj0dqnEFGpR52pB1GrLZbXgUZIE0eT7Os0ZIN87uw2wElJ8qzmxIsD5F4TIuUhjzzkzv+Bta6/zYhyxPTbKH2/0M5vaRprC+Lg/fWSlZoDqfXUKvnlIlONkU1QXv30JlVjbZdJ6wgQnzEq1gJtwl9wiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759701932; c=relaxed/simple;
	bh=hNTObQJ/BsZJoxgMmd3qjo8J7+vl7iZP+T7OGKXxBws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnstIGgY9FIYwW5jO9shWmvHXLbJVNBgQHRmeVBQ1dCM2jTMNqgc9e18NnYcIZuKmKwNdMUmdD7r8vPa0QfbSVCP4YiI/ivQQErYRlzb08Xf6oHBF39nf4EGlCn5DDGlNT37ECe/OSWnkv+8crRtXhz3Xec9nLkhWvOfmLb953I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/byXwH0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595LZUQ5002014
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Oct 2025 22:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YLLQrA8gIYr0kPOAaAByOZtF
	67X1Nm6784e/ECSQZ0g=; b=d/byXwH0rt2gBEvULpARCyoIDJ+xBd4zhMhY6v8Z
	mGvY9TUE4CvvErwk4lmK3H0v9Ohce3hgeaiScWNWJgw/zZkUM8bk+rC46QCU6fiH
	VL7zkpa7+ivBgvMkK4O2baqaS3TECTkgzf1Ej/AJ+xUNqr/NFPZoO5kBleC/Rbry
	PyiV0NnRu4Z/25Ygr+oRJp7k4C1TItIlu5ev3paHsiCqIS+l/PcpmBNAzciwdEbB
	R0YkAvo2Hs87Gaqf/ZbGbxxZkJc9mdtB7hNoNbVNIItj0dW8IUa5oFHtH/K2q9B5
	HtKaPgvf0tyxdiumJka5CngyCHRrldYFIPfhw2h++13hRg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1jfxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 22:05:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d6a82099cfso111476291cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 15:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759701929; x=1760306729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLLQrA8gIYr0kPOAaAByOZtF67X1Nm6784e/ECSQZ0g=;
        b=Tdy6JQ3cPyfzc3Gv8uOdd1ffLV+OG+In2RK8Uy4E1VGGC6hzNr60iSe9IKEA9L92l2
         3Mzum6iOTf5sPdqkzTalGqgokqUGXJCmMOfsZRiHnTae12R7ixRBws3IV7zF8iT/lCRj
         1eh47oNpyqt/3sK9zftqiLhbEW34C3S+OdetYqn3e56H7ARdcyAju1fFVnE8kq7jmzKZ
         BCN6fzEElnA8gRXer/ZJCo0KhC8FSIdmfxO+fBC/xjJNQl821KVweNdLVcspFXs+lfrI
         GLtoCk7nBROg0dml5lkLpVL2l5uR4TXq5xfLtMbWjIxWNsFlo0X7OgZDspoATQEqMZoz
         bXaw==
X-Forwarded-Encrypted: i=1; AJvYcCW36/MgccXvqxFyrSYd49Zxo7gBVea9Pro5UFPqgQQfescRH7yOilQl3NuQn530zm24RfRdHDSPPP+dNqFh@vger.kernel.org
X-Gm-Message-State: AOJu0YxYGaAdjXEwP9NtdBKEUdoYEokir5BbsRuygEMo1sV5rc0eUq0F
	/R9STJTC1e2BOjzke3JswnYmCsAe1ZS9q7WkhnkhiAhsCVWUpikq4+Q/S3DtedZdzGkW1pwN9UK
	4xe6mozoDoWuOXdk+GmLsVXC5baoRi/G+i+5oz0uqFeKVrpUo0nAiEElI3nhtjJsn//bD
X-Gm-Gg: ASbGnctt1VrVvLugU1XAespIf8Ov47xz83Br49KEW8dldOrH92WAYZu/iIdJESxQ822
	Tr6W8gbSwKWQBAmscp/cJkmSVzkuZO1jfXV6E/yKFGWKGKMMIPymyjD7cu90nbdGSTgKh72TtRD
	7AGHl1oGsrEv5E3PJVFFENiUoqy2jhFI5326HPGj2WqOkIp4x6NZZ0elppmCwrpf+YlQoFuPpjG
	FDBbqGSo1NCAz7w6ELPbGLNIKzx22xE8GnzsD5+D8hlRmfZpE7jE8m2++oHNzFJ5PkvoxayNK8F
	yQigUFcVJly3Btzss3Z/78xFuRyV6WNOyoaPqVRlLZj4zZh1SjraceIoug7DPEALDPQmi5hj9D4
	AIKABkJLI/NQCyUuEJhnOgAAHlK+LLBt+SI3/cvuoyiabWBzeCDd3tlHF6Q==
X-Received: by 2002:ac8:5aca:0:b0:4cc:9fa2:f3a3 with SMTP id d75a77b69052e-4e576ac38e2mr124543651cf.60.1759701928996;
        Sun, 05 Oct 2025 15:05:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQaaH27LewBBN8pAy0wFq08LRB80W7t0WvFe+8d8xPJGr7fWp+GYQfzyZVGrPGj9rwvYf3Pg==
X-Received: by 2002:ac8:5aca:0:b0:4cc:9fa2:f3a3 with SMTP id d75a77b69052e-4e576ac38e2mr124543361cf.60.1759701928549;
        Sun, 05 Oct 2025 15:05:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba444480sm37768201fa.30.2025.10.05.15.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 15:05:24 -0700 (PDT)
Date: Mon, 6 Oct 2025 01:05:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingzhou Zhu <newwheatzjz@zohomail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for Huawei MateBook
 E 2019
Message-ID: <ysmkpdicoxuspqe7emzqbbdvigs7yorawgmc3ccebghahlyfr6@z4b72icdnp4p>
References: <20251001142107.21860-1-newwheatzjz@zohomail.com>
 <20251003131925.15933-3-newwheatzjz@zohomail.com>
 <pbrrkfjrqoyj4qspdrordksfueyqejxcsz2oxqctczeoll6ywn@ixpaa6v4mwlv>
 <5021717.GXAFRqVoOG@debian-vmware>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5021717.GXAFRqVoOG@debian-vmware>
X-Proofpoint-GUID: sY2GYQlTa9FTY4czF4w_VDcRLzXTzIOx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfXxVfbWYV6YqWT
 ATvC5MbolScK7THx/f6gh9Cx041BIHaXUeovS4PuQ+SEC4nrCZZ6DG0H1vxuvqEpC24FJE3U+8R
 CsDMa6SN8MitiAe56ENfvKPtgla47YAdP74vitWSVrXLzvmZwm2Q2ipI3CvCbnuNJhRjtI2srxV
 P2PBFCwlq2f9P66UEObabmo2T9cm7Ev82BinMVluUsDNXaljY+JIz0eofKCe8ftczU3Uq1U+Xdk
 NJ5iqC1eloYqTCOVvDyJrgMVny3GF/s4brA8mNAWCMBboNGYxYrACzXdFY2DKAUT/p2C9/tzsO7
 PBoYRAWZqk6XCf9CB5HjybaAWu3/i5oKmAT3okDWiSeRhmrHvSmm+sVRfz9hmNKvj8qAi2GyvIO
 R4edgfC+wms/mILapecsJnyYxCXdfA==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e2ebaa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=1XtEOhATCJ7woTDKNc8A:9
 a=CjuIK1q_8ugA:10 a=dK5gKXOJidcA:10 a=bfahJYbJofEA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: sY2GYQlTa9FTY4czF4w_VDcRLzXTzIOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On Sat, Oct 04, 2025 at 07:53:13PM +0800, Jingzhou Zhu wrote:
> On Saturday, 4 October 2025 06:33:27 CST, Dmitry Baryshkov wrote:
> > Did you post the board data to the ath10k@ mailing list?
> > 
> > See https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html
> 
> Hi, I submitted the board file several days ago (see [1]), but there's no reply from the reviewers.
> Is there anything wrong with my post? It's my first time to send patches, plz let me know if I did
> anything wrong, thanks!
> 
> [1] https://lists.infradead.org/pipermail/ath10k/2025-September/016495.html

This looks good. It might take some time for Jeff to pick those.

-- 
With best wishes
Dmitry

