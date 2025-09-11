Return-Path: <linux-arm-msm+bounces-73133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FCDB53322
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 15:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 830847B6F0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8C7324B1E;
	Thu, 11 Sep 2025 13:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DX1rhjO4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6F5324B16
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757595813; cv=none; b=n8ZvV0O2LrqK5CZIyZq6nbzFgVT0vUvfiE/46bAGpv4kD6kWeXiOH/yDNPTGaKyF5aVPlygDJxTik1WP5vC/Tdb5vY1WFYdBFMQNv9OFwYum4r71gdDJQYssHWVY/VXqI4/L+NseDOcoQWH1wwxNudKrlnrcXA2M1kWgbF5nfuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757595813; c=relaxed/simple;
	bh=Py4v1guUTScG0vHotSUHA5Z/oQu7Z3EeobDMJ3o3oKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuX2AtOnqTJ9fdCwLIxLs8zHXt6QMxrK+ll0NOq7ZildK/bGZUVViS6/q/uMxFzb7A5JMKKYKti2dEj4WGHHj1moglUYmpHPLmH5m/vGJtDpFS8QkxROcOfg/o4LP/Qj6n7DVs7EM3X/G+gjxGRBRRv9I3BM6a5ziLHKdzBqGPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DX1rhjO4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB5NmI015131
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3TiH2ZKjnLM++Cw9wXPbgBqAvgKW59I/imntpSO2OVc=; b=DX1rhjO4qW5LD3Lj
	xLFCy7IN0NjCF1DMLY21jE9O+6EqCosul89a5kC0A7ZjkRHqCe3cl0wPl1sxjx6P
	vb5eKn/e7bmF6l10N4VHzgIhvgJmTHAg4kSN5t3K7lhiHzeNLYtzooWAi2Q5Gu0Z
	DqaoMBNjDK/Jxn5+54LdpbzJCA8iRcLEYGqnVTWojTGY7uqh3SJjs96+HNAHECzk
	khM9p7Z5d4BQxCGqgyrHoWxAsT7L9xpXT9Tho3t70j3w8X5dOjbgCP6aC2WZ9c7Q
	c8bw07+3fNzVNlS7aA/BAMF5n+6flBGOrO029BkW4MDsV9UhSYB6wAYw4wEbjoC7
	xqH52w==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m7kmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:03:31 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-8870219dce3so66487139f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757595810; x=1758200610;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3TiH2ZKjnLM++Cw9wXPbgBqAvgKW59I/imntpSO2OVc=;
        b=iGRjsCE7/y1MJ3LSw3ksuhKe4eix1T0EAxgrhiEXHVD3ay98qDpHLKcCiLO0tA8O42
         mAAPtwQRR+QaQ8/aHFYoq7R3jGedPuIuMKspvGPKVwboxkaX07zrgZaOAuPKLRJlNyrV
         VANWExrOUd4w52rJX7QE8t0sNvBr1BE2xNXJ0HKOsGS5DJFp08kUvFIZwBmOwjQqEWwU
         ouEcx92QMeZvxSbEEVvl2NtL4YhxDJDobf5Rx7foalGhokN4SNTKhPm3a+xD/G72hUvN
         T83h4f6/ZRkoaZCnViRlcMyy8laddhSE/2SREUvRcgaJ5d81gQw0wuV73pm9FuQjGV9R
         yFIg==
X-Forwarded-Encrypted: i=1; AJvYcCWOgvbA2mXB+ZLU4a9j36R5e6IcrvVvk4M6PkSm0HUR3NztABDhMpMMfTqp8gIam+VR4A1hJiL0k1Xe3cPv@vger.kernel.org
X-Gm-Message-State: AOJu0YwzV1wYEK93QnNgRO4B1FTKQN57rqbPTHORh36V/OqoWeA018+3
	ysPLFvSrIfzIb1WwInceBEi4liQpjGQrCpsS5XLyFLYgTTB5NskblECRE4cUzlMG5XZFpq1jI5V
	NudQuHAh2FgHWFktr1nONU8/eUNG88Hu4Oj/ztehQFHMRStsvl79iMbKnCbx3KNaQ1FBt
X-Gm-Gg: ASbGncs+lZK5w/T2HE4+x3YQZLeqzinB9cEzHlOu0ZTORUpF5eGLFfkPklfWrsgwAFm
	GBgbd0gy6Om+BYGA2t6LWzkIScyfSEhEvtEbVZe6zoBuvrYBRJt1z3LzZeRRMhbspYefPKmQZtA
	q50QbxBT6Ekv9DFojzblWB9d8tXROpnbPOvjOVE4og34z0dHz9/GGxwqDBOjVWGQhr2KUqndVL/
	oDna7iwRO9d/cLPwUNay+T90kDXQRc4Dxli1k9yOf+UCl1zcNziKCL5RsPTV7w0GurusLhDwRcf
	xBMKAsqrFhPJOlr9wamRjn1im7uYTHuXGDEDwBzWbidbjlq7JmHPrfvVfzmiN1FDan71JuKxg4Y
	EVTHOzbimenXklC1QzrywsV8otorQKo3yY0Gf+DGlJwH3eoHytyLA
X-Received: by 2002:a05:6e02:1608:b0:41d:5ef3:df2 with SMTP id e9e14a558f8ab-41d5ef30f0amr26828355ab.18.1757595809621;
        Thu, 11 Sep 2025 06:03:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ90goZe3T4OOiFo+85Q/4C7S07Ofj1OLJoHQ2FlrHY8mgdsyHXVlJIJfdlAHrxR9sWtFSUg==
X-Received: by 2002:a05:6e02:1608:b0:41d:5ef3:df2 with SMTP id e9e14a558f8ab-41d5ef30f0amr26827705ab.18.1757595809121;
        Thu, 11 Sep 2025 06:03:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b612csm422915e87.12.2025.09.11.06.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:03:28 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:03:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Cc: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
Message-ID: <gd7allvjkgbmqgc6pazq5o5u62tdkrogpf2r43vfkqfsptzybk@66i2def6aumf>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com>
 <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
 <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
 <3d26b554-727a-44cb-a1a9-56f49775ba3a@quicinc.com>
 <j475dpcflsibhrim44wjmtbfcfht5jzvptlzrj354oyjee5mit@wmfc6zmrkbfs>
 <0ca4f6bb-b2a2-4f98-a494-bb0507bafcd5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ca4f6bb-b2a2-4f98-a494-bb0507bafcd5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX3Q2B4MYhN/JV
 w7wqrSJCvokmBF/yg+eWKwmWj6Bq/LkrjZd3Rgmm1ugnRusIrQjMYZ8085D0PeUGnbARORcJSO4
 kACoP3JwX+sSr6vdfYmi0ma46p3sSFUtBc/Lh0Mv5du+i0kk9WBI7uGbKB7haeCEOrYQjJrYh6n
 dZzNU3o7ECEEsYx1bKxp2tgRTDpxP5WBaF+Nr3mKj/Ni1tvcDOVhNB9vS1faWumgxicpq9+W2W9
 xeF5CtQyClBMNl9188qEmcnsfMJig+iyzgHNtpF3pOmMbP8CpxJZex0q3o6BI//s+hRZIyWJYn4
 EPYXRkIY/6wWDELTdTMm5oJpvy1735lXGxRRdToPF153KKWRLbDrFfvEeuy64fM9igN4H6JldBe
 EksQ1pR5
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c2c8a3 cx=c_pps
 a=7F85Ct0dzgNClt63SJIU8Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=UxSgn0eRCaJVYZHEmbAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=LKR0efx6xuerLj5D82wC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dhendb_s1vUydsmTtJptfqAzo8TUGMWm
X-Proofpoint-ORIG-GUID: dhendb_s1vUydsmTtJptfqAzo8TUGMWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On Thu, Sep 11, 2025 at 06:19:02PM +0530, Nihal Kumar Gupta wrote:
> 
> 
> On 11-09-2025 15:38, Dmitry Baryshkov wrote:
> > On Thu, Sep 11, 2025 at 02:49:59PM +0530, Nihal Kumar Gupta wrote:
> >>
> >> On 10-09-2025 12:33, Vikram Sharma wrote:
> >>> On 9/9/2025 7:31 PM, Dmitry Baryshkov wrote:
> >>>> On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
> >>>>> From: Nihal Kumar Gupta<quic_nihalkum@quicinc.com>
> >>>>>
> >>>>> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
> >>>>> Camera reset is controlled through an I2C expander,
> >>>>> and power supply is managed via tlmm GPIO74.
> >>>> Why is done as an overlay? Is it a seprate mezzanine?
> >>> It’s not a separate mezzanine; monaco-evk does not come with an attached camera 
> >>> sensor by default.
> >>> The overlay simply reflects an optional camera sensor attachment (e.g., IMX577 
> >>> on CSIPHY1)
> >>> That is why camera sensor is configured in monaco-evk-camera.dtso instead of 
> >>> modifying the base monaco-evk.dts.
> >>> Please suggest and alternative approach if you feel this is not correct
> >> Dmitry, Do you agree with this justification or you have a follow-up comment?
> >> Can we post v2 with the same change addressing other comments.
> > The previous email didn't land to the mailing list, I'm not sure why.
> > 
> > Anyway:
> > - What are other options that we might support? Having a single
> >   monaco-evk-camera overlay means that this is the only configuration
> >   that we plan to support.
> > 
> > - It all should have been described in the commit message. Please update
> >   it for the next revision.
> 
> Yes, We have planned to support device tree overlay of the IMX577 sensor via CSIPHY1 only.
> I'll update the commit message in v2

I'd still suggest monaco-evk-camera-imx577.dtso

-- 
With best wishes
Dmitry

