Return-Path: <linux-arm-msm+bounces-53756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF0CA837FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 06:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F08C317D9C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 04:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BE01D5CFE;
	Thu, 10 Apr 2025 04:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIBANVCA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485A24A04
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 04:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744260594; cv=none; b=pZwRHPkR8d0egdS+0bP1GM+I6JEYyMUKt0jy3q/oFxHqgKHJ3gJql8PDNXbb1Fym4uDYchqs7aCkRXT4l7FUXK0+HzUNMeQVn0VCu9TQ9xbDsh53wMG319769Y6pHgStJZodVQlospxLpqk9zpV9hwlv+kGwv8RRBLyYSxRPvwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744260594; c=relaxed/simple;
	bh=HJubsNTysXTSg4uK/7vFlSsmHsU1JS438LmRfIfFBYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6wHLUjA6/yr97SMAE3+rremiaKLcoykjpVCTMDOtqHsY8v6ke6I8e9IluQ7T4z4YWxB4I/PwqPguvv4d/DIbuxkCru6qogUReY+Yp0J2spBA44PDtCTcGKfvRcBkZERSAzK89B5HG8ezu9Wdkz1FZUawQr5Nad6hruQfae6b/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIBANVCA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539H8F46026650
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 04:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EBe4h+OgQF6wvfsXVl90BUY1
	oHsbYsSIiyiB+HhoGsQ=; b=aIBANVCA2GR+yE21Gs/xRp5QKXTryJ9pEofLPOzE
	BKPKb0IC0+u5SlPqHWRg+dc97HSIqFMsvwgI5/EgHX63qd1csdaDl252/hiNlWCk
	4cMODLt7/XFmCyWSRMFf7zU9PUy0d5LNBXHUTpjtYUJEl0pJb6DdqwlqYScLQFPp
	kZdvaQ3xydV8lV2WvRJAaRaxTixgmmklesbZlfepoiR9g53aYZsutxaX8WHv+lko
	Y/kIl8NCz6zNlzc8L4zT/6x9IJQb/0C/W63HU2lHv2I+pKBuO6aXpGkEyqtUWWto
	Wp+9gwov5mql+hFOhuDcry0DzPXwXCdk2rzYbNrRhfNuxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgnqpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 04:49:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b94827so74345585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 21:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744260591; x=1744865391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBe4h+OgQF6wvfsXVl90BUY1oHsbYsSIiyiB+HhoGsQ=;
        b=GS813l6SfGnRTxvSoACNbVaTfTrGifR3Epv2deiVTSO6kCi0y/EdIWKVnWL7JLo+tA
         gfBHVZBw6Ah6z7q+iitUvUkQ8d8MK+LyvWE7yF2k+al/fwPzkmKLmhqB/Si9CFuO+8QH
         iqMWQHmC6mW4XpmOR2tUW0Pq/GWsmQNLUQvsAQO58h/3H7jGkmI/c1KnDs4GvD4q74/W
         LUj93rUOWmmwYsngpnq/3yNEhp1s24+jgQQ51lfJZfm0G8rhlgQ5QSF6tQxXG160rZdo
         4QLWArWudUGCacv2SUCFopi9urFOb77zFQoBGo56w9yTIrBXairsNfiun/lAz9+UJeih
         /ZUw==
X-Forwarded-Encrypted: i=1; AJvYcCXoUyfxhDLH362jw8PhTErOQvG18HRoY4G95OREUY8CtFipKrvJHJMOZHGhZ7A8yXaSwV7YwH+AL0jMkBLg@vger.kernel.org
X-Gm-Message-State: AOJu0YyBjEvEtClooTfvst1TRKxgIxJdU2V9j1V0JUs6goJZNd+N8ZQb
	WoM19hxhu0UBp1fMsM1mijy3H8NEJlIhYLnINc1Y2r0kHquio7DSqFXQnogrtT2S0FLx7nqbZW2
	8sBlmFvyl4hbQKPZNRPGXL+CcZXp07X6Xj4KJeJXQCYYxcjPwa9lHeiCV6RTXDMJp
X-Gm-Gg: ASbGnctDb56KiYPtaT+eOQLKy5gLhOC+Xryro9tQ4UyBaAB3kNs8vZD47Ti572+UFEN
	N0mOM7njKDQ2xm9twThAafC/j9EsxdZLmuIoOpev3ftxsBNyMCyrU27n//qGZiMyAtG3Xvd+u6M
	P00WSA6BVRcyuezhx5soIaEll0RyxwWGSsttzMxWDV5SB9mcBpGNYMpn3xnGGUFk5sQ/HVBJ/NM
	eXCp9/4ZPf8TMkh7O8gNNVmcCA4asFmfRNufMSjUK+hTLyxIYS1dXa/pY4XVMAOJdYR7OrxXKOC
	LLlq64Oup4DIDBaS9mEPpTdkyu+oxi9PZx8c8cL76cM1vBldFzV10oK4L/Fg54reB1ZZqAQ+5Ao
	=
X-Received: by 2002:a05:620a:394f:b0:7c7:a5e1:f204 with SMTP id af79cd13be357-7c7a76d0513mr192040185a.56.1744260591159;
        Wed, 09 Apr 2025 21:49:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFck7/LVrUqvTqOk8GDKtlJNoq9VvB11DSq0iOs78rjGlby6/VccIdHdBwARgqpjy/7DrynVQ==
X-Received: by 2002:a05:620a:394f:b0:7c7:a5e1:f204 with SMTP id af79cd13be357-7c7a76d0513mr192038085a.56.1744260590818;
        Wed, 09 Apr 2025 21:49:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d51051dsm38905e87.182.2025.04.09.21.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 21:49:49 -0700 (PDT)
Date: Thu, 10 Apr 2025 07:49:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-hp-x14: Fix up BT pinctrl
 node name
Message-ID: <dyfj4b74at2hr5xftohn6byfa3tzsr233y7wmgf4aums3hjnax@2lgotcdl37x6>
References: <20250409-topic-x14s_bt_tlmm-v1-1-b159395b7922@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-topic-x14s_bt_tlmm-v1-1-b159395b7922@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f74def cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=9F8HMpmrTCUkXK7qiZgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 17VJr0eJRxaQNso91-RA0Kyj8kXuXVuj
X-Proofpoint-GUID: 17VJr0eJRxaQNso91-RA0Kyj8kXuXVuj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=694 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100034

On Wed, Apr 09, 2025 at 05:00:00PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The schema expects all TLMM subnodes to end in -state.
> Fix it up.
> 
> Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

