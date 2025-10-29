Return-Path: <linux-arm-msm+bounces-79415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E2CC19CDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1A5A5357BA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DF4326D6B;
	Wed, 29 Oct 2025 10:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyDoxIoZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jB5Omj4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFFA3128CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761734210; cv=none; b=lyydnZH9WSfxOSqVsRbwvefZzcAjLoJywTHXvEzvRj62Ybn944sOJyDcJA0rZLXjnWnJcXXAIyxtiaWNGWJY+nC+k1sYeZLm1ljNJMpCROaAN8F8BFv+6ov95HplrAdPtbv0Xvc8MQmRKSHPz6BsKT8m+51I4/j3oYgP8kDpSXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761734210; c=relaxed/simple;
	bh=1q/1phPagPUCQxAzcCDU7tAH37qhNCsUMCP0nmK5qpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwX80FqFncJKykyoZrhvFRDQQLFg+poDzSP7/uyFOSQ31eD0IHReIHQNc96VBem2yrLDgJEi0xv3FlOlnSxBG8JCcDFG28QXV/KVHnm1zEfRrb4TvZj4YBYwSkX4Dnpv3yfqlqZ947nn9dLhQPX3mYQZJENYV7SlHjiLZ3Q1RlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FyDoxIoZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jB5Omj4k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4uwLv3676849
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 10:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toxdlYRW6wbbji6ZyP5mSx2SHaUDU1C2FPUNRmJL/Mg=; b=FyDoxIoZYiP8iBzh
	113JaYIAIvwzPXjywvyKwUE54nnpEOkhvKI7SysO6iLU4FI/90v+DKXvmsluHx6h
	x/MBn0IorHQkUqzh6iPwPpND02sxN3DpXAqfICtXr54MzA7hp8niyeTZFKZuUf8O
	Al2UWsuT8dO4h8pj/Kt69aopTavp2B3XU4qlOvZkSQpSujN3nKlhUoTMsW1Etom3
	F1Rp9LfUqz+aasSxYTslwP/ay9qhvF2M/6CjpDsOjjkamNT9Ra142pvMD0Rd0xaG
	xRa3t44JraPWBeCfNVLOWkw8CEgjcEbLmtKp9Ovb8TNIvVf3sElCRhu6wOfviKUf
	OPymUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1j6jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 10:36:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88f7eff9d5fso1863931985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 03:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761734207; x=1762339007; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=toxdlYRW6wbbji6ZyP5mSx2SHaUDU1C2FPUNRmJL/Mg=;
        b=jB5Omj4kROpuL4KhAkaxjFlYbhlBnMlliNI4oZvaJwDvdqojWoa+RhWlRlBR5+hE4l
         C4jWW+XGbZf4Fp0fBSUx66NwHzMSPsYuApheDNmH8gLmSvYlYlkbl6DDk7wZPgt0oodC
         mCbha9Ggb1SsCi4V9OriCd5Bf8gkI4zPHLvpyF+s/QggyWnGe67YvZtd9J+Fnb1yhFYr
         elUX1odrbJpGKUvu52kLMbe3ZWxc/PUChBEzoHaFCDF2qv0CeQOXEx/ybOYNRAyV3wSl
         l9ByrAX1iuO/eOSoxAJzRAtxi28fqJXp0rYE/ip3rYkSkhkYsZCNahbfLwrDreVWpUuC
         /7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761734207; x=1762339007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=toxdlYRW6wbbji6ZyP5mSx2SHaUDU1C2FPUNRmJL/Mg=;
        b=tEfegdyWxym15H94c72yLZIlPHXyt1HpWApl8MyGyW4JBxveGsV91olh/+oaCr1kcU
         hyfRrTp2SZSQjLrbPJfy0jpICnyzTzPbGvBLqnAGgehChGNXyQvyV3Vhd3CI7dDFsyL/
         o8il1e8batc0ekBkV8TuvFi1iDVvovDW/Jrz1iWjRti885B8AjKZkz1LW87uYrjj2v/L
         /kYKoS1bAF2qk7VuPcDumBUbp7TxhlmtgkjygbEj8wKr3ZBOxwla2eT699nhe4I6y5AS
         hmCHVk21iRifi76k5vial+S5pRPfy0lUmrRa1CbCHQTJn2qR3h6vViT7uK/wAuOJA+Hh
         tjqg==
X-Forwarded-Encrypted: i=1; AJvYcCVfFpcEa2WCCvDHBgNc0k80uId0UjcsefILC49Sq0skKPoHQg69y+c/JGyzX/2dkal/MqaaPehFi6TQNAyy@vger.kernel.org
X-Gm-Message-State: AOJu0YwsZYXq+zKjseZr2mppZvnrxwsxKm6YCjyIO7n4f5jFDnXwFAhS
	Qx6B6Bgf9XwYuHO/BDQ2eKgFTXXkoG/6u3mWRyhaWa5mx2E8Yd1sl0wJrn90y0lwc5qP7GpNcaQ
	lUox6YTY1b4eC/x9E+eRZpt55aOr7waW/CyOeCMqdiYNTyGIBzzomPJXr04T0beTUBA9j
X-Gm-Gg: ASbGnctXXC9NwXCyjOXHCoNQHEP1kQOE2jbu3qGOfiMINND5ps+Qpbu7/88+mtt+C9Y
	0DcNTLY9LeZTHmqPp9gtqIjHWnqNppW6xUR/wp/kg9jjCJjrK54Pmpk6HSVh/8faN9d1R4Xa9GF
	sxjpc0gxitevTEZxuipnTrE/URJdYQDCyPqPHKkpmpZ6hZhGB1pP+fBo4nIRmSSbjryr7qBIBtp
	Uf3URATKVVTarHwXLfHryYl6+3Uh5qCkj3+B8qNTL5jnsBXOanmABp4GZ1qw9RzxUfbQqllF0dE
	UPFIi2W2JBUKAFXYWTe8THTDZUWJ9AFwytmukfwun2o3tit2ylWTZSOHBKB//Ws0vbVm1eFttkw
	4OTU7z4yDjAO59mxLFIJ9HXJJ2SsWCHpkAkbgUTLnxZusIqSWnqEiPp5p22QAwhyAN295XWBW/B
	9VFDGjSGlNTk4S
X-Received: by 2002:a05:620a:17a4:b0:863:696d:e37a with SMTP id af79cd13be357-8a8e4e006e4mr321291485a.44.1761734206723;
        Wed, 29 Oct 2025 03:36:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDn6C0Q5aW30mE0+ypBSnHz9+A4C1AANd7lKkjPrOnIt7fuqfOc3mHR+srflmr9P7wSnz0aA==
X-Received: by 2002:a05:620a:17a4:b0:863:696d:e37a with SMTP id af79cd13be357-8a8e4e006e4mr321288785a.44.1761734206193;
        Wed, 29 Oct 2025 03:36:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f60dfasm3791480e87.61.2025.10.29.03.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:36:45 -0700 (PDT)
Date: Wed, 29 Oct 2025 12:36:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/24] arm64: dts: qcom: Introduce Glymur base dtsi and
 CRD dts
Message-ID: <gg7srymb2dspk4jeycc5su5gjl434ymgzapqqyqw7yq2marzue@ql27qx2ptuo6>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-3-24b601bbecc0@oss.qualcomm.com>
 <2960a6fc-106b-4280-b4d4-9c1a3a449454@oss.qualcomm.com>
 <0a47016c-1d7e-4026-92bb-a13ac2ce169b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a47016c-1d7e-4026-92bb-a13ac2ce169b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Nu/cssdJ c=1 sm=1 tr=0 ts=6901ee3f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=TvNQ-Dz4i63DqaZ9HxoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: QEWIki-zrsfN8v3lnNf8o9oRP3xMf4JX
X-Proofpoint-ORIG-GUID: QEWIki-zrsfN8v3lnNf8o9oRP3xMf4JX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3OSBTYWx0ZWRfX4FWdyljtaYdM
 x8RzwMSn+Xary7NH1IxBWffsb20OvlvmCQLc4+yETl5+zIhfiPCq7FWgnDd7Ly71qLKWQ/HIE9P
 Ww9QD4TkuBRkF/0QWbWvCk7BMoxyn9xCBQCCkUY2G8o1eFPAxnnaeXZU/9ZMXrv8KlOA98YpE8y
 Xl+wqcM1IFKTQqgCIrzaks9B+hBlogtuPB6Uo3O7G171s5K7g0e+zhvEfNyeXDnpYA3l83/PbRL
 yJJFO0yM/S7EiK/onIne8U28CSgsnblCen4Oh4H5EbWCTAIYIiorlDHH4JRULd0/VUF0bvZNphk
 a1iiUFbusAb/p1BKJff4dqk0hRDPTC3o9IgoE06paVd7YtJ1YsI6G8TwTSRd7G0v6iLkQ9GPeKZ
 ml8mvjlpKXLNsrvqhnAP18iDZJui/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290079

On Wed, Oct 29, 2025 at 03:30:54PM +0530, Taniya Das wrote:
> 
> 
> On 9/25/2025 3:46 PM, Konrad Dybcio wrote:
> >> +		tcsrcc: clock-controller@1fd5044 {
> >> +			compatible = "qcom,glymur-tcsr";
> >> +			reg = <0x0 0x1fd5044 0x0 0x48>;
> > We can map 0x1fd5000 - 0x1fd5094 inclusive, as that seems like a
> > logical subblock (this would require adjusting the driver)
> > 
> 
> Konrad, we encountered issues when trying to map regions beyond just the
> clock reference registers. Normally, we map the entire address range of
> a clock controller (CC) module in the device tree. However, for TCSRCC
> where CLKREF_EN registers are located within shared modules like TCSR or
> TLMM—we don't own the whole address space, and mapping the full range
> can overlap with other devices.
> To avoid this, we propose defining the base address as the first
> register actually used, and the size to only include up to the last
> register we use. This ensures we only map the relevant subblock,
> preventing conflicts with other device nodes.

Then you need to behave slightly differently: map the full range at the
basic device (TLMM, TCSR, etc.) and then create TCSRCC as a child device
to that node (and use paren't regmap to access the registers).

> 
> So want to keep the mapping same from the start of clockref clocks.
> 
> > There's also a laaaarge pool of various TCSR_ registers between
> > the previous node and this one.. but we can leave that in case we
> > need to describe it in a specific way some day
> >> +			#clock-cells = <1>;
> >> +			#reset-cells = <1>;
> >> +		};
> >> +
> 
> -- 
> Thanks,
> Taniya Das
> 

-- 
With best wishes
Dmitry

