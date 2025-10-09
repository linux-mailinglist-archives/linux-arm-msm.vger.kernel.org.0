Return-Path: <linux-arm-msm+bounces-76693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD22BC9944
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D1F9C4FB448
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD542EBDC4;
	Thu,  9 Oct 2025 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ep6+HlCS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D520E2EB847
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020904; cv=none; b=V0GZAQfpL3S2X6Vkpphjh0XbRIAhiTEvUq7pJkSAgC2P3XuUYB6S5a+Mn8FZxPBB2YtVdM4rxQBZXFtknBJL30caKuGIMmRdJNloW3xIgx2IwTacC6FIFxnVM19OolPkzvMMYwfM2esefu48tBSIu91pAUTgUgJoLsIsNYkQkWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020904; c=relaxed/simple;
	bh=HclYgnPF4LRbdDLD/Q8caHudhorVDWjtXDMuv4Ilhzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r87k6Srnwgcll+AvSsyH4wVR2zPNqvaN3cMFqVAJyX1tRXSx9w7K4uhN+JTU24Owq5s09NXGbVHxoRutgVBHE50Qnvk3vYZPq08MRbm6bWWzqCdDMyyJTzkhSzqnI0udnXO+nGEauexnQ5xdLPCC0hAq96xrXlCN+CqYAdVdKEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ep6+HlCS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EHtJ028477
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 14:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qZxbfmQyGMX+bvx3enASN+Ih
	rNAG5CFfSD/AXrL+wew=; b=ep6+HlCSyQOJYq9gMKv7Lf5Yl4AvI8mXKlrQ9mtn
	3hF9uNIa6GCVtHHdvjY3B6y5oZQMwgNIgVgyu2nHqdCELr2MAJPaZe5o8zG0xmGw
	u8HSoS//g8O1z8Mcf6xxBwDGRbcunC1WVr7XI52fb9YR/GymuZpRltTVHt35XeaC
	VBmS1I/uKOi8WteNS+q6K/qEVAvbKQgJg+FV0aij+gkvAI+Sijy+LDSNcr05PVmK
	guTCqdFz4PwY3z12gCIxN5nJ+dDAEsBAExvH1Ao1SPtpvAWLRjP1dlFFF55/1YVL
	CHo7LaODkouibxY5AUaNgZZ+pFnkX/vsgFxNbr39bbDm5A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ku774-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 14:41:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e1f265b8b5so35975761cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020901; x=1760625701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZxbfmQyGMX+bvx3enASN+IhrNAG5CFfSD/AXrL+wew=;
        b=iSe9K30XiAC22E2nap1vzDENIl/DT32qmN6wDESXQsJ/HOBjRAvIVzQe9X4y86wwtf
         t6pk0QelsiKAPYpstIn2/wRzWbefCKh6tlXZH0YJnCYInis+K0Ccpc3pqIa+Mi7vE4Hu
         zClqleFWKRDLCdOGYJQi8yiTic38A4niOQxcP/6SZJgVpxoVfUWgXoBIyTAp4pqA2mOj
         GyguWblGPxjD5H0UbfL0WpQ4MW6/1V5c96pVnCnEB6GBMXJ+HR4O9WbJ7cCo4y5i3Ku1
         yP/i8P+lu5h421H9/MVA1maK70rR5QEUOtmu1f5fQgZ1DawTBuXrx+yCGgapS1UQN4PD
         ztfw==
X-Forwarded-Encrypted: i=1; AJvYcCW3O2bqWyS3GnTl3QDvykDzn3S3lM5q+plO3OnM5IUjlp4L0L73Tc9w7M4cnWDTx5YJTKLQ+ZMCcCxTlTYh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0M+uzH6lp3MTWuohJNST6uH3UNAvnF7Ji0VlqUoVaffnA3Uoq
	tPDIdQM4E4lbCer0H9Ob1gBv8XH5eNcoy6NNwhuH6ZeoTBrZdMEkZXRoKPdqmbB3bj1o29+gBtn
	keqyec05oL38BB71Fzww75GjfCOdJV6WIksVu7Q2pX0cf7hUrLqnoNR7+bsRTpds3AxIp
X-Gm-Gg: ASbGnctmGO2fldqm4hDf/vaRNOyN8Uk90DXIaHe36I5Nj2pUwMY5gUBXV55N3Uj3U2J
	URymeObhmgNq0sKs4h/qLf12qMcABZsAqee3XARS2ItN5ZXuWwsFM0Pm9WcBp8dvWy4ZBYNK33/
	jNpR3XuT0gQuLOd7hUcACclsy6xgPQo9WxVlFMmGZqIuAFOhP4syrs5HjbuDWJFGR17focV4zur
	4VcjpCmri1DHWdkoT6Drfn9R2Oq5b501vRzgEuwdsVG+dbPhfR6fuzhjlNf8p5mErowBfRWOjzi
	pKFvPuCcQpKZ+W+L8T2baF/QStpackaVDvUeVLnUlN7kOdeRiWJ7r7H7X6WIYHiL7ZAQ7hy9t7Z
	/kSBIrHFs8W+zouJD0ZZuUQpJBAhKrc2cnxX3kiUv8VjtafDQ7vt6BgXtZw==
X-Received: by 2002:a05:622a:507:b0:4e5:8180:d4fa with SMTP id d75a77b69052e-4e6ead4a78cmr98196601cf.39.1760020900796;
        Thu, 09 Oct 2025 07:41:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv0mdo3za5+5FAlM5CJ7wLkbh7iaSVKM8BbIGVMwJLYVlsYxxhzIKo+VojFEtceXLiOMhU7A==
X-Received: by 2002:a05:622a:507:b0:4e5:8180:d4fa with SMTP id d75a77b69052e-4e6ead4a78cmr98196221cf.39.1760020900338;
        Thu, 09 Oct 2025 07:41:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac1f095sm1108654e87.37.2025.10.09.07.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:41:39 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:41:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: qcm6490-shift-otter: Enable
 flash LED
Message-ID: <b24tiwwhie34narc4u3ez4le3cne3whjtxaccm4xtit3wldumb@ipgsccain72f>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-4-5bb2f4a02cea@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-otter-further-bringup-v2-4-5bb2f4a02cea@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4kk0fLhd50Z4
 ErzShSZhj2AGQFLF1yrg0b0VaFFIbE8y0XD9j6mwqjFm9wVincPDffyjc5R8ZCqqog2/HZYysqN
 wUrHZUjT4IfCiARnxq6FNB6vuoaH/iBa5B9k4IHZ0b9AZVRDCVIkR5q+PwIz0ts/hslwXV+e6pT
 qiZF5Sp5lAZ8L94mDcKufqzc/8u764YDYgLJsLK+4eLzKGOmHVt6rpDLYh64kdlAapEB72Kw71h
 g6F03KvNcrJUEYGVEpj0m8lHy6rD7/n6R7bE6D1UiBp/TswXqezrV71ebCBoLL2kpTerX89Bio2
 jLkuL7JuQZc1PBtjLfSnxm5QdyZTSMsHFIDr9GRoHK6YpqwuVOzNo5jHzAMis9sgVxaxBl5v3rY
 ZEzeZQBzBPguwQa91X3er5MDVpv8+w==
X-Proofpoint-GUID: Bc3NC4cZ7Z6CF_1IzTlNdpHn_dflKvAt
X-Proofpoint-ORIG-GUID: Bc3NC4cZ7Z6CF_1IzTlNdpHn_dflKvAt
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e7c9a6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=kDRJMEyxNqLK-ifJ8_YA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:06:34AM +0200, Luca Weiss wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Describe the flash LED on this phone.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

