Return-Path: <linux-arm-msm+bounces-68309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26957B20564
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1E053AD8B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905431F3D54;
	Mon, 11 Aug 2025 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IA02Yh3N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC9378C9C
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908348; cv=none; b=co0lrDjnfIykBjD5xJFSpvDkqPFUp5ZKwFeCzkZrWQNS084oXGM+z0KVeZaGzC6SkRdEaCrh0+bEfcFWTgJQUMjjdBDF1hNfYTaeah0ieZ0ziFJTChKKofSaD1+CToITERvBY0Zo1uzEfQvP8G9p6Zl6aao8kIGn8iwlHvgyi+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908348; c=relaxed/simple;
	bh=7/8dM/Xx2So3McTrDBstGgyw4FvAIG3Efd5JypBSmKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgDC5m85fLXisH43WbFLperuhZYbmQnS6fyllGMYdCIze7ze71wwNR4K9FAVkhdthb3PM7OGhvvP2/cSsC6a7/1/DBUDW0uCnKr9v5GG8/S7e0i9nt+wc5tUZt7dYVAzo0liu+9H/pbAyLNU1X17LrtKuXGo92n0ZU1UInWpAhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IA02Yh3N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dCr3007636
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WlaZxjCGfsTi93SkuSR2T8Yq
	07Bi9pE1AjxRp5EAaPI=; b=IA02Yh3NboUJA0n3jJF6ku+QfGN0XT8g2rXZFYHy
	VCmVeGkQGdA0BITjpCxL1edsddPuQe5QTWsNLXvBQw7tad1h0hBtKRwE93PqghzA
	dhJUCdZsCZXqwj3zwbGr0g8/Ds1hKLCdjOBQNnflluOO1h+t34NmbXZzwwCXD43M
	ppy8wv9uyj/xeD8I+mcF4GXFvhh0zHrppeje6qljyf9RqJvDO/7dPwZ8/7NHxE05
	XzYTP7uYT5c00PkSBMt0AnQmxCVD6AHOAUDo+hRzv1lgQgsvArT4p6OmXhIEsaI/
	79LVIGNGDTTW64bNBp7uFHK8IBLz1Qw6dvDKJ3CXsKsEcA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fm7ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:32:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b08b271095so116907071cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908345; x=1755513145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlaZxjCGfsTi93SkuSR2T8Yq07Bi9pE1AjxRp5EAaPI=;
        b=iL1axAHu2qcH8KdNTZVMD+SB9ZrpmRC38jsjjgrnSjBqKacvqkiKivW9AnDcdK4hKg
         0RQKwv1sZZRiTqgL6FxHYP9O+RQXsww/cO2Ivq78ggKswLv2ktYG1YDIGtYkQpUNBJdC
         h8pAW9OpfbzAFEHy5EQdopWdqOcdJ1BrsqaEsHML44kWfr+qVDt1VxcmxZ1nshC6+GgD
         DvMrgjoi95cr1lg39Af/p15quJiHJAtjQ2dHOKtCJphixjfB/XT3Da8jT8ZrrDcmASYw
         LOedgFtHTzglbbRJwJrFKQlEnyHNSyJnQcPgVYrhUncZJTtYGSuu6WMezoo646o7veqV
         qBCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRt9phClTwQIyOyVQeThi8+r9iwH4TRvVvjDao49H2izcxuI7rlWv+zEmfVlo8Qv0Z4bvMxiQmek1LkuyI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5NVftltE8KZaDz9Qam35bCCn/StlyqlzwejxfT4dOo5H2EKf5
	vK1bRLYYPpKyLqG7EzpYXdBJC95lrBu2N/llyXREQIOD+nxBEW90pEB0iBW9N2bQZjY7rHZKYqk
	QfLdfHwuNmMwJxH0PanoO1IJ/nt9hEiViQYDzhyl0M56vfQPs/qdOdcBA3DK9bwNY59kV
X-Gm-Gg: ASbGnctWt62iMDvV/bVlSnaW4iV8mT3sqEQA+9ZPWn3fZ4e86DyfbZsOpmKIPdym1TN
	JfOTnwxu5rEtLzGCer092q36zgkrkdQOu5bgkJg9rLrkCwzEN8u4t/aX3VAS3xQcMTgKPg0aHOq
	mJoyYJief4w2owH5dQC+OrhtKY/IaPg1daEyhRTsbKlyeN1vUcC/3iBxph8Imr+yeyrDCHpbo4E
	fRlpMF08gdXauk7vupYjrcvSmxVRPYWHKRBb2d9j/hD9SSpp6LkliikjVmOvB0sgsxrD39ovjXC
	j9l3XDSQY8aRSihdPyy1CfAb/2/lePZAlfNXx98kPkOxQlwGTzZb26Yu79SAbgqZFoUowW7QzwW
	WZg8TgJp7TK1rS897h3ae/5RXVtpnXaLkGVfaJqKn/baS5AmnDcsJ
X-Received: by 2002:ac8:5850:0:b0:4b0:8633:f961 with SMTP id d75a77b69052e-4b0aebe7865mr200416381cf.0.1754908345038;
        Mon, 11 Aug 2025 03:32:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI8sa5r1o7gt5+wFXRCE2Q7Do41HTXVXbxsWRBmDIwxhwtGo1QPiM9a8ztAkxfkOqvDVAq1A==
X-Received: by 2002:ac8:5850:0:b0:4b0:8633:f961 with SMTP id d75a77b69052e-4b0aebe7865mr200415961cf.0.1754908344591;
        Mon, 11 Aug 2025 03:32:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898c158sm4264371e87.14.2025.08.11.03.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:32:23 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:32:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] drm/msm/dsi/phy: convert from clk round_rate() to
 determine_rate()
Message-ID: <oukh4eoh3kwyzqo5shujprxsizssbs2gckaa3fr54tqu5qmqkc@6nbvqf4rc5av>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <d00689fb-8074-48df-ae95-bcdf5e756111@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d00689fb-8074-48df-ae95-bcdf5e756111@oss.qualcomm.com>
X-Proofpoint-GUID: _OA6cqb8SxkGLlT_AbE_NX3Afpyx7YqC
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=6899c6ba cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9wg58hZYqdY_vEwv324A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX0bznuFDuLUfU
 TKIQt9egfQjOlS4u7nLdESPrCsHC9BTZaCqKFAN/LtttcuZrnVvKWu6d5DaFEyqj6vz8VMmx40B
 j6ggWUC4Igq6SNUyentt3LrCCfhFInpgmjNiRewNrnbCD6cMOjjKdhZ26moFS4hGNz9DLjtn9ea
 Sy4HatxkVsFGLoI1VvbkindfhQtsIrCSEj8v0t4tMluli3CbLO9tkrL6cm92vHtx+FyKgv4aXCN
 lDztyU7YVy+nU1KlfQ6aOWJORvq2dLTq2qs/pbdoa27ZAkBq9R7zxeRYLw3KFiA2UhwOUM4vEBk
 MaXG8eyLsT8hl9bTfZgmKsKO7LJSs0/1GIXofn7vGACk9xrcOyMtLhG/tRNO52shNI7au/b98WH
 Wjl6+oNg
X-Proofpoint-ORIG-GUID: _OA6cqb8SxkGLlT_AbE_NX3Afpyx7YqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003

On Mon, Aug 11, 2025 at 11:02:46AM +0200, Konrad Dybcio wrote:
> On 8/11/25 12:57 AM, Brian Masney wrote:
> > The round_rate() clk ops is deprecated in the clk framework in favor
> > of the determine_rate() clk ops, so let's go ahead and convert the
> > drivers in the drm/msm/dsi/phy subsystem using the Coccinelle semantic
> > patch posted below. I did a few minor cosmetic cleanups of the code in a
> > few cases.
> 
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Unfortunately pw-fdo doesn't track series replies. Could you please r-b
patches individually (sorry for the troubles).

-- 
With best wishes
Dmitry

