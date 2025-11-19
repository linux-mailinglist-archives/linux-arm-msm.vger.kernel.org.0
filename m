Return-Path: <linux-arm-msm+bounces-82436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 143F4C6D5EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E2B444F6564
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D6432ABD1;
	Wed, 19 Nov 2025 08:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hB2A649l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DpJ/vNAp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3464329E68
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539474; cv=none; b=oKaGIPsUgwhEShbksRezvtp2UdmxUm0W+hznDeFkIKj51UERWRvdIOLef6CeMoYTPovYikMpsupc2M2nYoAkAAoBk+4Imx/ntUuhJIGgBlQNcGz1sIqrqrEgjm1VtS6UAla7dn81gny8xlHALwwfuAigxlTkdQm+efbbOUQOl8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539474; c=relaxed/simple;
	bh=7JhyeQPnykqrctREh3gq3R6Fggw7kbgY3Qj5ctrT1BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Og4qlkLvP7XmDoHpWYojYPnDFY5aGUrXq666x9q70mZ9ftM/Vry1Y1JD4XaaaYHRTGUbBQqouss32dOuR82QKUYZXtSCMvbuf+9sQqfrPH6dfVThaC/qGTwyBk25U3i91Xv3SCmRVhKzTZ0+JSoKiNllnT5hbMyQMehM7LuFooo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hB2A649l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DpJ/vNAp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ0gaXZ3412657
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UzW2JyXuV5Ut+VkxfrbBFCLC
	xAnRX4nTI7Jye8gtO/8=; b=hB2A649l5HaWH6AaXGU9KdRG/IH0DoIOPcLcknZq
	drgv1XoGXpjXbd0fVYj5WbqTrFj+tm666Wz2MBrGfvK9CuxjHrgydEQWoG1OtKEE
	iKtsaFCFIfm48pAEYIDVHy8C2QvE6y/mp1c9G9G5OzLo2pWMxrmUMfTia0OgLj6w
	lFdDv3X6+eLTS7BgVbqaswZ5gIhHYv5J9LVQTRF1temN+W7NoLsLZgUAD9PC129O
	JrPHvOqFxipZp67JJK1JLSVrswQqWAozu4lvglH2EibvdL7hExVZgNa9JNUefyt+
	VBiJf/SjJ+50xA15pi4WGh/c4ZoMGZtVX8RoC0ir4J3w7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agv0v2g5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:04:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed7591799eso185545661cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763539470; x=1764144270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UzW2JyXuV5Ut+VkxfrbBFCLCxAnRX4nTI7Jye8gtO/8=;
        b=DpJ/vNApjU88d4R54dQu9oWVnGAFhm8YJ4fzgKx9MckZgJhFpZKu+N7zxn4A4Q6Kz8
         9/A2T2DXN/jKmU8vNJn3/FZmgSrx2WRODrdO/X4o+v5Drta68aFfNK9VErPEvlBXVRR+
         hcDe78jOFB/7HewuGfk1h2uc1MpA/CsZnDB7U/3eu44pVJ0qzQK/3iT5O3fvC/EJm3Fk
         zAbej9VZrJbp+sSclel6COt9HctZW1r2ZPJqe9yH9VFrsBdrnjAF132vAd/51j6dwDmg
         4XcrD9vfJvIcgxM2CeLcs9ELkQR5SRbpTuzSZGEVLBsdeGio9yjHIe6yWLd2w6kE55PQ
         5nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539470; x=1764144270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzW2JyXuV5Ut+VkxfrbBFCLCxAnRX4nTI7Jye8gtO/8=;
        b=WokA9nBLdBWk0VtCkhMNxxrL+cFtKisapNTTjjkvvb27xuCgMdz+pOHdeMOEDElhQB
         SpSVcRtWlbQFWPaJ0eleR35mFWg1Hz2JFWAOodwQFNtXKC1sSWpnCZdFPCLLiAbw/yDq
         6TwlCi+QFy1baNN7xC+XGIEbqsXNyTC1LT/WkGolS86jhLLI7Krb8DWgQ7gqzQ7Bt/f+
         w+FGD/vYq76yQO85qbC+PYbPykFP8BbaN+Yzt/YdF5gvlhIysOQqgPHgwn+RRifvd/2D
         /8c84hbWb5cWP9F5HqbxPE1aUFCCUGST24TnoavCKAxltXyTVRkTobeMOlDTqc0tgOdu
         i4Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUIJdC0OmGTxG4nI9lm1XmDR2p9cgpP/bkDGbVb2Efa6zLpOm4GqP+yptrAP+MaMvU2jgGfYYUMKILdY+fN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9nkH/cyYOwDMCYjuJZBu13gf+w+fWyvLXZUxrp8I8E0MCTOr3
	7jsoYSEyuD8bWpp8YI21JOjxaXY/zyaiStddugW7DhJfffx1kQ1+pMdcIqVbO+28ersiKBLErO6
	MAbnmvUd3KSt2wWGhF2hfzqQlKOmZ477tiZpGNnELGin9XxwwYHpyAzba/I1gYkac/RXH
X-Gm-Gg: ASbGncta0bqrNtWy4iQyYB6klQ7WgeAeVa234+lbvEj8IG/jEIGeAb226Z5dRZM8ccq
	bHpfcSdyapLh98c6Nsj6N10R/53XO1t3gfxm4hpcyZkudo2qwECoDPTAe+HSCtrjsyM/azGVOAw
	Vb44FGLTZ8oiKAXHxoaVa+vKpmMw9X52RzIY+D4GUoXkgwvNgEew1dw56Je3PaIf7+FpnT3WLb8
	FUS5bFiE93wcEBf0ZgHBksDUpdW1tvTkaQ+WEU4OxEy3puxuKCXnL5Jap3P7uY5Kx7UtqOutSaj
	qvCtajDiYbmNpPlBzHQAhhclR1nocLfQV0Z2U2MatrU86pMGw3St6Cc+SQo91FEGCRAWFDm15SE
	G4OsCVwsyrrMHigtidjXTpxLVue9U8Ktl+JQkXB4HOXpOVMqk4sqmiDt11kYh+5MIWlwHy9My1p
	gA0Ry3dbicZiTn4q0Xd5AZauM=
X-Received: by 2002:ac8:5ac5:0:b0:4eb:9f37:9df0 with SMTP id d75a77b69052e-4ee3ffd25bbmr17713501cf.35.1763539469932;
        Wed, 19 Nov 2025 00:04:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8bKxT73k4iNySvpq+VMcs2Rp55dM2frvfFxchUHVKyDp4dkCf4vaRjdN9EtvKEV+97+XzGA==
X-Received: by 2002:ac8:5ac5:0:b0:4eb:9f37:9df0 with SMTP id d75a77b69052e-4ee3ffd25bbmr17713241cf.35.1763539469481;
        Wed, 19 Nov 2025 00:04:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803ac88bsm4649362e87.12.2025.11.19.00.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:04:28 -0800 (PST)
Date: Wed, 19 Nov 2025 10:04:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 RESEND 1/3] soc: qcom: introduce new QMI encode/decode
 macros
Message-ID: <6j2dnxud43ywxflnncebhj6b6kmrkda33evyj3iju5bzr2vyoh@ijytjv3p4pvi>
References: <20251118065343.10436-1-alexander.wilhelm@westermo.com>
 <20251118065343.10436-2-alexander.wilhelm@westermo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118065343.10436-2-alexander.wilhelm@westermo.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2MiBTYWx0ZWRfXw6ndYLnRQmFY
 0/J2MkXdNufSJ9Rp2lyKEDhvdVfc4T5SWwoqMKG94H/ZsnLBU7OiG0/QeP3HttFeHZ0S4Lj7bk7
 rMuBwhAlQIy8JIpUJDRy+hYm80iP4cwaR3vvWNXW3tlOb3f+bMNrLo/knM4zxMSpI/3mhxi1Kq9
 jxp4VveS5ISI/RPxfMZXVwF/CoYyNR5qzYR1olPehDiZZonRoznuhVJ3DsVFnvy71yjwyny9iLb
 YOEe0uBsZXghjgMg7H9Vt3h7q70zL3VD3e9FKtCkqwxj7Avmq71ocSeHWN8P/dW8oxVYbQqQ71I
 4rc4WGV+PGFS0V6V4p/Tk/zkpli4eAlDG7rhpJFPjPmvrdCbjdErBNzfTjB9RZ8EXdPbyUFQVH8
 SAJ9AvCKWBpW3ZXoTBnaiOhHcgaFww==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=691d7a0e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=XW_CCpt8tLB4Xc_L39sA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: oP_J7DniAR1SQ9zJk8ordKVm7jE3M6HE
X-Proofpoint-GUID: oP_J7DniAR1SQ9zJk8ordKVm7jE3M6HE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190062

On Tue, Nov 18, 2025 at 07:53:39AM +0100, Alexander Wilhelm wrote:
> Introduce new QMI encode/decode macros for each basic element type. It
> allows us to further distribute and handle endianness conversion of basic
> element types of different size.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
>  drivers/soc/qcom/qmi_encdec.c | 56 +++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)

Nit: I think it might be idiomatic to fold this into the next patch.
Nevertheless:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

