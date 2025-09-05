Return-Path: <linux-arm-msm+bounces-72287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FB5B4586F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F21123B5A2C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 13:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB851D5154;
	Fri,  5 Sep 2025 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGfTKInG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2261C84B8
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757077640; cv=none; b=FP1isSyjLqbCvEekvo3Hhn+LeusqgchJYLdmthRo+dEWdABeEJ5xsIeAysW9K64SOvnRzlpcQs+sOmiKovB1VlepNdrU/Ip5d76F4ACRS9f0th5I3QiwzwcJPxRvpyUQDDcM0883HbeZGdnWWJO+vi56CqGBfGjk1GQT9rW4qxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757077640; c=relaxed/simple;
	bh=JsdLLPrUmGM8Tgv1FnyKp6BjjHIfVQSZbw506i21JtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKMcBi5QhQLnSWKhqiVhvmY1d1PmSsHCusLvihvOIUX9iUX4sNVNBG7WUc6eLOJgxG3J7q3G1qbWhVClDUeK5ZfnFYjrc5eR/kSDyaVDg2/pAubooBoCdAmOPOhD5JQGC5bpYQJL7mA4HZwtJws3YF5sm7/y6Uh3fWnijBP5X6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGfTKInG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857Qkej007622
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 13:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KrQKZP3w0ewlZNuZWmqjmyoq
	dp+JRPUq5JvWfsJm8Eg=; b=KGfTKInGLH016v/bWWLBLY4d0AWU5cpjdf1TzVMT
	LlSQIhkrXp03YU/0z+2IQ+1BmyRxGELsUmBwhj9nwXtkIKjmGxJc7CWgFsDdusgx
	JX3DvgR/W0KhH9iwOqQLJ3UxkwEdMj1Tz6MBKVDTTBB1iTAQ97stY5Y/szaA8zI5
	kiaTdt5l9ITkt1eF5gTuiWSqEv2TOC3twYKNBQt2WJMqJZovXcXBKw++nNqA6qBS
	56AHOEsNm/PaEbjHIGMUCLaFovQJLwABBEmwpkIVMAi2Ba8E4uh7mQHVJBIpmQ01
	6KdhKYZUmoV1C90nxvpKB8BnjPxmYv5gpFq4YFdqS7SJkg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura93323-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 13:07:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-329dbf4476cso1812274a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 06:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757077636; x=1757682436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrQKZP3w0ewlZNuZWmqjmyoqdp+JRPUq5JvWfsJm8Eg=;
        b=SJVjqDghX3+yZBQO6s98k0ZYi/ZJY/QyG6eXPyMVLjcxGBJ6ifzqGlGxhmIXXlvdhT
         PzukhDda/EqTjPE4Z1seLnY30rBiIhFz+NvdyOYAtl/DSC9zkrrTVEmUTW79yM9MIP/u
         9BSlpit/plxyHjl0LD9ktM8BXBKjahTcIh41Cd7fMIyNmew2q7XzdzFIqj+IhSjJxcl7
         P17SbO8SurqEc9Hwpo6V1uf2d1d5kL+bJECqwomShZsmNUDDBZMNdAZP/rQV8XUzk1/p
         2Ffv9qvB8AX2sdj+1I1YYRphWFatIq7cznn7h+RxGyYTSK7L1dhzMjWAvS1htz13sCDE
         wxWA==
X-Forwarded-Encrypted: i=1; AJvYcCWpv7bN5VMRQDcsXL/5L9VuQd+uCbu3wzARgKv42uzopIg7m9DlD/XRpYoFN99YQ8GstFnv+wP5Ua7ZF//a@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQu9abYghIvVTgD+EpnSjsxBZPOKC2KajmG0hJMFDq0NfrBJr
	FNAN+zqsClmGBQpJsQIov3z2S3mXT9fNk+QGKzLGnw0xEgZcZ82sRsR0xdpbcNVI1HBLZZqs4Sq
	CrbXNWgwRzhEfLcnI2lsxImdR1X81gDNzBjXitQ64uQM3PvZkctokXtKEwQ0eGLKmsHbaSFHpxq
	nd
X-Gm-Gg: ASbGncsvUj4je1u8pTDJ1XZlzfzIqRCdYBBNLrIzhhIKfEOcN5HYxEFul1HvqIQSbYR
	G+eehAj5g4FaWYuAdtKQ3/gLqqMu6FGYRnQxngxDj+OVi155tmDYNGWlNp9GTpuuZHRGCJRZh1o
	2ZbPQYZ3FQDsm8LcQP1oBrabSgFYnonkunzQ/7bW9z/X5vQILbbjBTubTUO1nzn7jmOzMOtdtVF
	gPU8quwZQLLhDar3knW62pV/XM75pRsN4mYpnQG4KYPs6q2A9CD4b+c0WjGH23iIrFVlVmc14yS
	6As8Mw2CHt+Llfx4BB2bn9Zx0Ba0PVT7wLQs79R1o2XtnzeoWf4X/BOeifbMvdjC951d
X-Received: by 2002:a17:90b:384c:b0:329:e708:c88e with SMTP id 98e67ed59e1d1-329e708c9fdmr18453332a91.20.1757077636167;
        Fri, 05 Sep 2025 06:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOWdaNrn1TEaOULcrKSkZdESm8pCYoEw9CzGYfoVI1gFXNQjbHfv1K5YlHjOSkq90MCHN1Fg==
X-Received: by 2002:a17:90b:384c:b0:329:e708:c88e with SMTP id 98e67ed59e1d1-329e708c9fdmr18453243a91.20.1757077635494;
        Fri, 05 Sep 2025 06:07:15 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32bab2022afsm3689920a91.2.2025.09.05.06.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:07:14 -0700 (PDT)
Date: Fri, 5 Sep 2025 18:37:07 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 08/14] arm64: dts: qcom: lemans-evk: Enable remoteproc
 subsystems
Message-ID: <aLrge0QLmApr881B@hu-wasimn-hyd.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-8-8bbaac1f25e8@oss.qualcomm.com>
 <055bb10a-21a6-4486-ab0f-07be25712aa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <055bb10a-21a6-4486-ab0f-07be25712aa5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -fpZrDh12seli6TC37QXc92HiPDDxMkM
X-Proofpoint-GUID: -fpZrDh12seli6TC37QXc92HiPDDxMkM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX4WxZ3jCZ8z5g
 D0VDTNNVhJdpIhlRMzOq9va0tL9sYBUsDwayP8osM7a+8/f/2B/kWd1iuvGp2Y7bViRc36Gy2kg
 HQLTJ5jD8rHPJLOtqXNVXI742gFtLwWZf9NYV0c0D8zCQqGBR87eVAuKszwnCN6epzGBd+QnYig
 lhEVnUPrF2QouSm55g/2l4M1LcTtbKIRGvByQRCgY+bs6fQAdnr01aScHSuZ95ikMxsbUMX3+Ny
 y0PsWLs9JThCLdrRjzra1qPfx+Ytyu7SxrpOFM9POi+ncpu991VVEyxazTVXfPH7JIYpJO3rqUh
 LbdhCIMHrrJmdYn4mF2etyGsJudnIwjAdULSaXVKjbXymh17kD0D4qBGMSCt7wg/MbPOViNtPUc
 7RWZWVJd
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68bae085 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=CfLhDO45pqEqRx8ihX8A:9
 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On Fri, Sep 05, 2025 at 02:46:46PM +0200, Konrad Dybcio wrote:
> On 9/4/25 6:39 PM, Wasim Nazir wrote:
> > Enable remoteproc subsystems for supported DSPs such as Audio DSP,
> > Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
> > firmware.
> > 
> > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > index 17ba3ee99494..1ae3a2a0f6d9 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > @@ -425,6 +425,36 @@ &qupv3_id_2 {
> >  	status = "okay";
> >  };
> >  
> > +&remoteproc_adsp {
> > +	firmware-name = "qcom/sa8775p/adsp.mbn";
> 
> Are the firmwares compatible? The current upload seems to have
> been made with Ride boards in mind by +Dmitry
> 

Yes, these are compatible.

-- 
Regards,
Wasim

