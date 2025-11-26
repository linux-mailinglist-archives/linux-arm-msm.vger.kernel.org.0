Return-Path: <linux-arm-msm+bounces-83469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A30CC8A5F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 15:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6BDA5356568
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 14:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07856303C93;
	Wed, 26 Nov 2025 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8XM1HgE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DtXJM0AJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B0321E087
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167949; cv=none; b=kCC8xpn163iWODHagtYP7ZESRCbiim/XLLQDMZUnZl5x9iKoX8i3JDk56kgx1naCL6UJVDbuCQIzeZjstxaaWxL1oZkZdCmdb23q1ceo9Fii6X5EKilYCmYaNsy/41FzUj7w7SQhNIalcf6S6o4O6YtwmMPY7+PgowIB00Ix8DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167949; c=relaxed/simple;
	bh=ozg/zky7pZYYhf21hDQgiq4F0XigtmY4Wqju6wrAWUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWJat1v9RNLezhTMZ5pK14elLlV7g+7AlLiBEzE+7AL63dT/JfpqfdGoJUgLn3LocyAV6pgEb6On4yMxTLakaa4KxjiZa7JCwxlEz4/+wfQ6eBPFIgxkQbt5kIUEY1qkX2NAC8K6OnYHjmRqTSjXtNs4OyX8CyPmYYgmjSHwCOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8XM1HgE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DtXJM0AJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNqdW1849482
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ih06yL3zICl3oBGO2wVm0aPZ
	B8b204IAvwsOOEb1LJ8=; b=g8XM1HgEHr1K8W8uAY4QNjDYAIOkKFvJk85GA6Z+
	niusaakNCF8kODCZI6RH14JVBEAY5/u97AWP1AYg3IHQKxBpR08intEbjYDYur1B
	hm9TIRXjdvgO+CSGt5tXU39B2n42OvR2a1ugoCrFDGULWpIhOdZ97PNSMpcSc31g
	7W+wnrw4RlcYaF3Uesq2cgBkMJSkQ7NEgNO6KGciLSnDtAHHNwzuIEV5VNND8raV
	hWQeCbkxzHGD0E2EVG3rwGL1hEWKQZSgTSK909AajpP4hOROng+NA9Tp244wr2LW
	+s5Sg/60PB+Wp5SDNROizl2evcDVCk8emY/vNWqD8lM89Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0msrfty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:39:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b234bae2a7so1806416885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 06:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764167946; x=1764772746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ih06yL3zICl3oBGO2wVm0aPZB8b204IAvwsOOEb1LJ8=;
        b=DtXJM0AJ75fF36lL+oEnLExKCC1hB5E2uzOLQ9mKLy3aK5cVRO99jpDUA8XiEvIAR5
         aV3P/4+9iPS0QJ03KteVz4bORnaHZN2zxxahLQ7EaDlGJ3djtZvRDS08EVs/zfqTo+Nx
         lxAb6jL11iwZEA2kTDXm+7HAVfCUrH2LGmebVyahivluapbg3xg+XnyNHPw2RCzAv6oi
         qZpEyPEpWjI8JCv7a9YBMsnMPIPVs8O8VKIK23NcxaryOLdAne6piSn+5S2+kZu19stA
         R6isd1ooCroGICN8Z2c+XSnWbfCRD+CiCjc5hWv9jLWFHRHBcElr/1XhThlyvP9Q9YNh
         Qb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764167946; x=1764772746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ih06yL3zICl3oBGO2wVm0aPZB8b204IAvwsOOEb1LJ8=;
        b=sF4AYcVH+d2jHjw0SBh92sj3HmgjidSCis3VFW0JSxM8X2U5x1m1ntiSLggdnXWYQq
         G9hUZZKMEh4EglVy6M31OfCH+Npxk/443F+HInFiKKoRRTPQ8Ogt3GNuSAm7e2iLGph7
         7nWLYPBb9t7J1DSX2w4knFUFsihFGcEr7z68rdyrgE1BMPNEuYDndOvQdIYaFo8Wy5Va
         sNh83O+os+InumWOMZzYaLG+Aht3UOSISB0V5qrTWB/3CxLjyJb2JstSjQ73iM6Bs3FC
         SLyTeHGiUwtTG0JgfhICBqw1C01YnFFnxVSzVBvnzNXpP17bVqTdz71W1iDMddIiDSej
         aJ2g==
X-Forwarded-Encrypted: i=1; AJvYcCVKpQdsbF+BLxmhm3MzPuL3PfAVwfhAF2CJKv57HNJ3bJYafsJgboNTg456HsqZgvwEVC6Ye/zpqg38BFR/@vger.kernel.org
X-Gm-Message-State: AOJu0YxmhC4CuUvOM0an1khjcAOSeigvRcsKyjmerZKfV5XuOJWOikeT
	rG/Z3I/bORIrIJ9SJru9tHydtd01KpaSs/JWvnukk49i5KliFpBedr6rk3l9av/DGTPVZy+apd2
	oiNy4QTiZf1+m6rJVyWNe+wKZkkOi3EyEBaxBKrTZjvA8kRg0vNl1qc0z2TLVDFc5l/bu
X-Gm-Gg: ASbGnct2N90jsSVlYjUBZcVLcDWlwun+no8p1m6CQeUQAETLIuKrs/xHvGH15PHxIpF
	HUdeedCwNGwjt5wyF7NplKbp2C/VZAZKWDzoT+x0oNhdI2EtUwsayWzpdqC/ILr/SuW8fwjqgwu
	ASuZsK+kzTZ+38TjwIVGM3ev6eh9eeU9Hndfb0FS1cySi01YEo1lEdsNqCIpOL6xhTI1bxmqjCO
	xsSkKZbx22G1LR7jYkSbJfAtQ0pCvxrqzM10mMA2d8DUIYhhO7gaBvQTMEIU3u22sIK05XpWhXN
	SLO6zI6Y/Gffs4b7Sql4YA3v2TBhmWjZcDd9GQxIFMjlvvFDmezIHm/iz0uICUn73xIYQAJzEVn
	Z/SHsY8hk++kTX39xCq3lDmrSkq4NRbfuTwLgl+tq3DTSIcP8Ya5lQKWrS6FRa2FIto30MBMKhX
	bWnAyItbZ7D6o5LRLM1JcfWj4=
X-Received: by 2002:a05:620a:1a04:b0:86e:21a4:4742 with SMTP id af79cd13be357-8b33d4808bdmr2719411885a.77.1764167946368;
        Wed, 26 Nov 2025 06:39:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuvwz9GZiR0vucNDwByTSixZwnlV3s+6YWSU/zh6BM6UYrhc+KLDg+561iMmnbTPrGqzYR6A==
X-Received: by 2002:a05:620a:1a04:b0:86e:21a4:4742 with SMTP id af79cd13be357-8b33d4808bdmr2719404985a.77.1764167945752;
        Wed, 26 Nov 2025 06:39:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc5e07sm6013824e87.83.2025.11.26.06.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:39:05 -0800 (PST)
Date: Wed, 26 Nov 2025 16:39:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        manivannan.sadhasivam@oss.qualcomm.com, quic_sayalil@quicinc.com,
        nitin.rawat@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH V1] arm64: dts: qcom: talos: Correct UFS clocks ordering
Message-ID: <s3eeapfrmw2smh6j76mhegeanqfq4vwa5jz7ilt2d5bf3acxc7@t6hkp3c4jjsk>
References: <20251126131146.16146-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126131146.16146-1-pradeep.pragallapati@oss.qualcomm.com>
X-Proofpoint-GUID: hFTt4FKVYxIcMeZJH2i2PC3z1DAQ5SB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEyMCBTYWx0ZWRfX/3jw3Upjonpp
 50JVBC3RSTkFuYwCBdx4algGEDPfYKg4XhTGR4haYLgG5vTiCAB8nL+qI8jeLBBuJtzJ9gDucod
 14crzt7vJuEZcDe+G2PGWepCovpnBpJQzxuD42VPAnH/CD5MGtvd48s0FZOygz4VU1Ua8sja8w4
 3R7v8gRGiTxXofxTSnL9vzTZrYp4jQghSsN3KcJd94ftj5zo61yhIhFUIqv0Fnvrx3Cwhbfvteu
 mjNYCrFnVzk36YxJWnR6t1MPhwFSrUSipPA2758pPpQYgJdSai8Bja96tcrXDIYLzcGD35rqr/9
 Pez5nbIk0STqTkSLfIcKDWtY0KCZzMdpL9lzqoUkFGanJIYDOZnfmWvFaCRb1k/DvckosPkO+0s
 1at6WH6/gNMprAYu8h/iYTC8DNLrGA==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=6927110b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M3Igi78ymzd9_o9g02sA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hFTt4FKVYxIcMeZJH2i2PC3z1DAQ5SB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260120

On Wed, Nov 26, 2025 at 06:41:46PM +0530, Pradeep P V K wrote:
> The current UFS clocks does not align with their respective names,
> causing the ref_clk to be set to an incorrect frequency as below,
> which results in command timeouts.
> 
> ufshcd-qcom 1d84000.ufshc: invalid ref_clk setting = 300000000
> 
> This commit fixes the issue by properly reordering the UFS clocks to
> match their names.
> 
> Fixes: ea172f61f4fd ("arm64: dts: qcom: qcs615: Fix up UFS clocks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

