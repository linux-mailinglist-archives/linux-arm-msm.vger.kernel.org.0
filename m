Return-Path: <linux-arm-msm+bounces-67707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CCCB1A45F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 16:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 120F818A21BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 14:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FCF270575;
	Mon,  4 Aug 2025 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RMp4iUAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF4526E142
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754317087; cv=none; b=hHput4aFtS0hTaeuEGf+/Jty3zF0BLRsNu7NjyNlOtJkAROrJd9hyTn4aPxLAslI4vf/md1hZrsKnDU7B7X7J5xArTsPG1bIViCzpmZ0gDL+xAS+XbIHyeIhwkPTGRa2uSFpindISP4WTTQzfNUsk5gnMcxTlDnYE/gDWWYwYtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754317087; c=relaxed/simple;
	bh=VKZmdjotUC3YbS16o6pwylau9DHkDdk5aDr5RC+8Sb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyYJ/+JlDNKasSND/tEYeYO4b6FR3u1qdDy4Onwvow4eXhlsSBBkQAlf4/i2DmxvblpBEIhr+ZicCficSYF8XullLGiLBP2DzAwMFoKg5cxP5iuzOInnvxOC9rZjehm1ZkZ9Lv4TdfBNCyunoXJxgIdmEuBALV1f/WCpBzmBlAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMp4iUAd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574E20H7002942
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 14:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yV10ozYgUe4tzTx22lApIwGp
	t095dJ2LaBUIJh0zJQw=; b=RMp4iUAdZ9MiaxFspe846207a/m9KYLu8rIGQKjJ
	qB4vNnU8PaDP1Ad933PHN0PyrgvOI0fhe2SGeJ77pV9WJgEDfyRM1Ae4aDn7aWNf
	IArKKl93H++Hq7ONRD+H4cj1YfYK67jEveI1tDzu0H3ULUuMenzm0QKUmIhAfn78
	eP/TJ68EYRxJALyFI17JPBWUmbN/MiaxK8jEF1ZMT/gakSrO37rUX60yFUKn3OWA
	BXG9d0aoFqfMM+IqudbsaqHxRQycBnRzuVyfkbun6/f9EN7LiFNusGcsS9E5lwp8
	vgrmuF45J5XPyfxVbmtZycCTKPTarVb1uTQOK3ybKwJnTg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4899pad9t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 14:18:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76bf8e79828so2958994b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 07:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754317084; x=1754921884;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yV10ozYgUe4tzTx22lApIwGpt095dJ2LaBUIJh0zJQw=;
        b=FDc/yD3JU74SwVD7VsJmZf6qxBeUAqgd1QEF/veOP+Kv76/8a5x52WUPn4FqFfbIBB
         7n4tiqFzMc+BKRogEU+AOZhHaWQI687DKWbOlrEioZYnKrwVkB/1hCm7w/IYhwEVdvMn
         8I7yM0yIHzrUxz0IzwdiVIgxhTTQLlxbg3qzjq0dZzZbBx74BVE3UfArtgZl1MONjdZh
         a0YSDzoxk195UoHsKoBhLR/Vl8HzxVRK91ZR6CfEIQ/1aQ75RqGyYkBJOx+cS2lfAmU+
         09VMq5qCEalqQqsW+d+B+63PFi5eesmgO318LgCpdI5b8EFWzCqlM/QeMUrVKum4nx7p
         8vYg==
X-Forwarded-Encrypted: i=1; AJvYcCXjk1re1EFOMrl7wqt+3oFzOcjPd7u9nRMqyhRtteiS67x1F+tkrSxvSRTTHRmyiluhk3Ju7lV52ZreAORN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd2XD8whatQg0XHt+VRdZfiXiGomkn2grrZJn/qM+gF4/xqJWp
	Ly3fB7Z/VyXdTDIxbUMZwn7kFbMQ90rRHJKzymvmVbmBvae9CA/LYOXf+Ro6NasuHSVbm1MHpry
	sW5uG/9LrRnHGw4mSxBxOKi7FahwL/otfK1pSddTKMFp2NzzbceQfGXtpZd2Q/jSgffrS
X-Gm-Gg: ASbGncvDd29ua2HCHYeUOkrRWy2Ihib2QbYCNBCJtSvvN3NejGDykgzhu4NKr4bwy/q
	pRex6+6zZ1iTuNXzNry1GJw5OwuZF5maoGosV4de4KeV/WtZh2vcMpIOcT7BNapi4D8Nk1o1BUI
	OZO4joQfRpHkCVe1llNoRBjE4ATgMIMDqr7DBN64nvJ4TIO8cazUfX851cOJZWYnpdRI6r2p8YU
	IK5JkBA5Yr/c6Y4Jb9ITE2nREJsPS9uGy7UgJm9qLvNae1v/ma9BySVD5MS0puT6+ENnJ4NN7O4
	YZMJ9AjyF30xv9gQUqHGHZBuONAB9NiQPXOuwnLXhyM01wjh+6r1f9jMVVd875rGXCo=
X-Received: by 2002:a05:6a00:744f:b0:76b:f06f:3bdf with SMTP id d2e1a72fcca58-76bf06f4064mr9615984b3a.17.1754317083684;
        Mon, 04 Aug 2025 07:18:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGDsTzlLGqDnAvh3MpUA8PVpt35YKMpiCWpzipsOhlEqGhm5w5CMVTLOTYyI4L20glEIYSNg==
X-Received: by 2002:a05:6a00:744f:b0:76b:f06f:3bdf with SMTP id d2e1a72fcca58-76bf06f4064mr9615955b3a.17.1754317083308;
        Mon, 04 Aug 2025 07:18:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bea205365sm6411378b3a.83.2025.08.04.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 07:18:02 -0700 (PDT)
Date: Mon, 4 Aug 2025 19:47:55 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Message-ID: <20250804141755.qzwfgqjdx3s6yc7q@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <095ab6dd-9b0d-4f58-872a-852c5f19818c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <095ab6dd-9b0d-4f58-872a-852c5f19818c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3OSBTYWx0ZWRfXyp+fiie/unMl
 jcT7tmT4cSQtW8DMVWYZTy3VOhSGQ9Fc3es1VIlti3Tsp/u85X0N/VymLju8me4miHG4vTmxWe+
 H9xbcQnwaiLTUidS89QXcc5PGCBnq0r2IsprzR0+5rouJUJDsyrEoxoBQc5dWey41btw/btaG/V
 MJF8eodkFaIVLVzmaMCu9ZWVt2HKYoYENRolWz28ItZW+fexOtYEMBqA64m6L/tOww804cvbdCM
 KNFjeZriGmbLKSLd2tFgXF9d7/hjgnlUK7tkJSvIZ9/hmf4JaB35qn6pqiGwdgpjOyy2Ayh2dwT
 Btk6MwUe3uG/hy8tQ80Qv6zzLGfXjhz3HUTgcso4J59Z8qCkldJTkHxUSUzqH3paYdu/gBZsZzH
 ye3ljtVq141+1759Rwlnybyf5EFEDUJAuTzIJCr3TuBqb+hZ2eLnY5lIZadeH6Lbq1/dIZqu
X-Proofpoint-GUID: m271Tar8kOdrN0JlvRCDl62c89KjehNq
X-Authority-Analysis: v=2.4 cv=N88pF39B c=1 sm=1 tr=0 ts=6890c11c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=6krb5mtG3PrLwc7-ycAA:9
 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: m271Tar8kOdrN0JlvRCDl62c89KjehNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_06,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040079

On Mon, Aug 04, 2025 at 03:16:35PM +0200, Konrad Dybcio wrote:
> On 8/4/25 2:41 PM, Mukesh Ojha wrote:
> > pas id is not used in qcom_mdt_load_no_init() and it should not
> > be used as it is non-PAS specific function and has no relation
> > to PAS specific mechanism.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > -static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
> > +static bool qcom_mdt_bins_are_split(const struct firmware *fw)
> 
> This seems unrelated (or at least unmentioned)

Ah, Missed it.
I will keep this as separate change.

-Mukesh
> 
> Konrad

