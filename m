Return-Path: <linux-arm-msm+bounces-82889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BA2C7AE50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 17:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE37C3A3AA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 16:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E152B2EA473;
	Fri, 21 Nov 2025 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnI1TEGl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGRNcbnk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD872E8DE1
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763743225; cv=none; b=L9EeVyCWsFei7ljYOkzLzCOQrKFIonvK/kp3qb6zJ9YqruuJLsbl4a44lkF8tY8oHxhkdiYOY8cYFjLzJAnDM7QnpDsm8QP9oBfbdYzgoxfUhUt1KLLoDOavAZZG85Pmq2L8ZrEcJbFq5f+wc81WnhoK9jEuFdEccp+7YdPWk9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763743225; c=relaxed/simple;
	bh=niU/0bNMZVJc9XhH8RelUI2nqUiVxLvkZfCT5b8yQTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/hFWAXrdCdhcE8lIfeEj9cQ+IWulzO4YtH8bFSV8pQwJbbEfk3qB8yV8FECJWCOruYwGL28MpNecoB8WxVGfOL0j0EHxSqIArts2TXQYrQrYIybONgcSdHTjPDJm/YGUjkY5z/dZaPeTaJQPzues3sbATD/HFgNZYV8wqsVxQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnI1TEGl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGRNcbnk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL9VuBM3048071
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kprjKRtKl0n0i/dHrrgwjUEd
	NIGv2YdzG2Fgt9Vl3Y0=; b=UnI1TEGljlJeuSU3ut0BWCMcO2r/AAYhkFJ1lqwU
	T6QUg+YMM7CuQh2VP2QHmx0rV9/c4t0jcsQVNdJ8BVxRsI8bUXfY7JoS4KemizQ8
	3MuWGv7/ydIvJ9vp+nA86EAuQtZKOTPBCoBdnyDX4sw6HrvlMrwqaaOQHIyXM5rt
	Ou/eIgiC5pR47EZgt5Btkkqf9mMOlBzxNWChB+DgdR4K5xZzjWW2CSCnHbS/pcUb
	7y1PDNmFCoNhUdpSZsmqPVZ7PLHHx9NoHO62gj/3joGTDeo7y6oT2HoI5t599nwz
	AHd9di66dybx0fTKenclCIfNAdlyu8cKv8IXgP9EmGw3DA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajnhjsaen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:40:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2f0be2cf0so844274285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763743221; x=1764348021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kprjKRtKl0n0i/dHrrgwjUEdNIGv2YdzG2Fgt9Vl3Y0=;
        b=dGRNcbnkUocVgZwkmEpHVYsXdTxgYk87IGJO4UFdJUOHLjY9uoUveHR5PVGSow6Ok5
         DDO2nuzw9f5+5jG1Xiiv8137HRqiE9WtmLMDOzw8sKLsC/N1wrpuTpX/JKk6rU0om3jA
         idJnRp4oRwVFpSXtVn8Hi1G9n83DMMfmUFP+N0xBXVP/bXuGXMX5ArjAIhwpONjAmgqc
         pI1ZeDLz1ppsS3oz/eolAwchIoFwV2GFRqg4T0X1HAXuraiYFsxMtnu8v2Qp80+6gwwr
         Ff0D0P/6LGA6827fLPxy/YHqj7v55L4hg/ipJk/biIQ0mdtNP/fJyl/OIBNgkDsFta+Q
         rtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763743221; x=1764348021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kprjKRtKl0n0i/dHrrgwjUEdNIGv2YdzG2Fgt9Vl3Y0=;
        b=L4nuEYCHyHrw/bljuI4R1HnPqpcYIUu3B995ehSFg8KwlzbxZf70ziZHOICxogSciS
         NgJ9w0Pl/8RGfsDy8fdLi0f/TsONxSUYxs9p7qBe+odna6CLM2ettxAFcds7KIu6GCwt
         RLUfa1aU1xHdD08X/BvrqsFHoTX4ikBPLxZTGUapBJMsyTp1oST2P49i13muAxB2sRU/
         crEWzOpsoqQz+LGhKwz1ZCvDWz7x8KcURhnCcY7+33g0bnduruYj3+eKwNqibUeh3hvs
         Qlh/ysAPCIGzqENWp9FZI05pWER2rcH9/0ZrVLjFYu3MxwLLIdQo3xA+CaFRvOaMjOk3
         e1Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUgLPPXvyHQLeRSITDfHMruF09SHVD38mKDY2VHfYSlWjWHwCeHg6tgh0HTpB20P0ix9U60uubHPu1OYsJe@vger.kernel.org
X-Gm-Message-State: AOJu0YwH1Yy9H+IZ1CJwn5osDiSU0uIuXMFkTCRaH6oI6PqCqVFc5QeB
	1lrJPBbLb0piH/3Ns0rREocrzZg+ywvjFBCRBcXgTdUrCAYYPtkFRkqSarbmYAKsjHXwmz6luf4
	n56dKAUNFy/QGwULKxt8ESgLlVr0CfydtawW4udNL34ZeZ4VD6Fp+DQXFfyOp6jKXK7SA
X-Gm-Gg: ASbGncs55QBqtMRwUrBg3J1aVqsdrifjs+nUYDO9AhSBopEV0LJdFeAj6XGHjYVA3QV
	902RZl9rgH61mQfajN1ULPC3CDpA2vmNedr121uTFoNxFd6vFi9jg4NfP7mTSP2LPWhUqCs4Qun
	G2oZyFDEhMc9q6tcg5nZts+6hqxj5IxhKLxAAPl5Zlbd77493zUrZJTFoFDkomm3kKwZa0v3Lx3
	3IiNdTJyK4xorsYGNx+wB4Xq3NCpTZyqqQjkWW04Hz90SCocz7gNwHVK1Q/1SDvmqYwaKgMykDc
	lxUPRmBvjxCOmmTMP+3WPQYkWyyyO70ezurswJ18PVgvOruZoWcHOvHlOHmQha5S4XSzZEsB/Dz
	KXoK1GAPJbRpEnVgXu17mQ5lbCpayfaQgiOA+arWplED9EUwJF+u8rt05Tw74R39EgXzZ5A7Gno
	s1/BMWGd7VHMzQI4Dx5NYng2k=
X-Received: by 2002:a05:620a:4629:b0:854:b9a1:b478 with SMTP id af79cd13be357-8b33d1de1f9mr327026585a.18.1763743221616;
        Fri, 21 Nov 2025 08:40:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+44Keo/qyO3jQHDmY6hSHEbl8ueDkc9bkqlJNNG+Ts5L9XKK8P1iiUYwzusZL9p/Qebr8fw==
X-Received: by 2002:a05:620a:4629:b0:854:b9a1:b478 with SMTP id af79cd13be357-8b33d1de1f9mr327004585a.18.1763743219235;
        Fri, 21 Nov 2025 08:40:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbcd137sm1750884e87.94.2025.11.21.08.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:40:18 -0800 (PST)
Date: Fri, 21 Nov 2025 18:40:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] iommu/arm-smmu: add actlr settings for mdss on
 sa8775p platform
Message-ID: <mxvscsve6otq6pdqfi2w5tncyvg5sqezmw7lrhegg3okl5yznb@276udpr3kdse>
References: <20251118171822.3539062-1-charan.kalla@oss.qualcomm.com>
 <himyof7napywkc44vre5ncqsatkkaxqnqbhjht6hjt53lakper@4wlwsvxkkamc>
 <50bd3be1-63dd-4bf5-915a-02d923fb0376@oss.qualcomm.com>
 <09b933ab-eba4-47c2-a667-370dbeda2749@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09b933ab-eba4-47c2-a667-370dbeda2749@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: eASlTDDWk2Baoo6iiCGV0Wf4WDLog6S9
X-Authority-Analysis: v=2.4 cv=SPlPlevH c=1 sm=1 tr=0 ts=692095f7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=X_2vKkYTdwsKauOBYDwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEyNCBTYWx0ZWRfX6sJs1hsTUsHJ
 NjgTUniZV9Pr+aMl9xSKgKN8Tm40ZlUOMYAWQKXaiujBQ8tjalg+EflgLz4jT/Qs1eOBbkmZeoC
 MQNWp5Gw/2IBNZL5cFnTBqv2flSvgqxsItOiwKK93/KCO/AyOb4kzt99+WozqoTIxNOBEgiUuuo
 BikLmwZKMxIE3ZSyZXMJTxIvC9kYOgzZIQDwXKmKl06y34/uAInbx7f4UjmGH3K395N1HmqSlMw
 jTyZctUv+ABY75lYZ819ofY6yv0+u0y30UR4NDN9Eb2MnLEmIV920FZQ1237Z0TN+deh2csghvR
 68opQi3E9PZO9T3roykNGUzuwEDlaNX5vHlfLPR7GvuDNDUV23yYrTHtd7syAzWefJ6AjGeeehU
 T4SI7ycTS+3I9GIIuqRyUA0qJLrcpw==
X-Proofpoint-GUID: eASlTDDWk2Baoo6iiCGV0Wf4WDLog6S9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210124

On Thu, Nov 20, 2025 at 01:33:29PM +0100, Konrad Dybcio wrote:
> On 11/19/25 7:06 PM, Charan Teja Kalla wrote:
> > 
> > 
> > On 11/18/2025 11:33 PM, Dmitry Baryshkov wrote:
> >>> Add ACTLR settings for the mdss device on Qualcomm SA8775P platform.
> >>> This is achieved by adding compatibility string for mdss in the actlr
> >>> client of match table.
> >>>
> >>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >>> ---
> >>>
> >>> Changed from V1:
> >>>   1) Added actlr setting only for MDSS and dropped for fastrpc. -- konrad
> >>>   2) ACTLR table is updated per alphanumeric order -- konrad 
> >>>   https://lore.kernel.org/all/20251105075307.1658329-1-
> >>> charan.kalla@oss.qualcomm.com/
> >>>
> >>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>> index 62874b18f645..0b400e22cb00 100644
> >>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>> @@ -41,6 +41,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
> >>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> >>>  	{ .compatible = "qcom,fastrpc",
> >>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> >>> +	{ .compatible = "qcom,sa8775p-mdss",
> >>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> >> What's the difference from SC7280? Why don't we need to set CPRE?
> > 
> > Sorry, I'm really not sure If your question imply to talk about the IP
> > level difference compared to SC7280 for mdss?
> 
> "SC7280 has MDSS, SA8775P also has (a slightly different) MDSS, is there
> a reason these two have different settings"
> 
> > Regarding why don't we need CPRE -- these are QoS settings that does
> > control how well hw behaves i.e., related to performance settings not
> > the functional ones.  I guess, these settings are derived from factors
> > like how many masters are sharing a TBU, how crucial are masters using
> > that TBU(like important ones may be allowed to +7 or +15 and may be
> > others upto only +1 prefetch).
> 
> And this is a good answer
> 
> Perhaps you could reword it a little and put in the commit message to
> make it clear in case anyone has the same question in a year or so

Yes, please. It would be really nice if you can add settings for other
MDSS devices too, not just the very few that management is caring
about.

-- 
With best wishes
Dmitry

