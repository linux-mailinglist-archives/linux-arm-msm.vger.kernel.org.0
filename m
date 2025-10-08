Return-Path: <linux-arm-msm+bounces-76458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7ECBC5EE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 18:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 174A2544642
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 15:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4003E29B8D0;
	Wed,  8 Oct 2025 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzELlqbt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C1429B8DD
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759938709; cv=none; b=stmG74cIipzo5hTdbmWlv88sQ7Lgi65nN5MBN9+dvnZWShgicydfDZMldG4+NtvIUTwwt18teU930XdXQSlDSa8cANt0MPo3p0ipkw0HgdSKvFMVvwdGamRFW4whrBxpFhrSEyhrc/rfFR9+ZvdGJxFAJwAVvHb2e738a95FjO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759938709; c=relaxed/simple;
	bh=eyxcEGk5La7pCXllukSF0zv12uqJ+J81tlCMdMokhAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqQVCxXmqfDlN3sA+T8SzV1Z7uFejhloFkyo5cQ0JeGDO/W9XdNiR7eg2NtYURMtpkRtJqoYUQWhj3kHa/Si5LwoJaZasSeip8Qs2kmJzmeNs0PZ9kYwMnnJexiRGegP1+rx4cQZrgDvknAIj+fkEjDRyRwVK5HiAMzf8RSVxKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzELlqbt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Prg014216
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 15:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RcwrCuhkeTvKEu0J3KBAezZB
	eXuc0UhImZ4vhS6DyQ4=; b=UzELlqbtZYwto0rau/q/lK+qg/21eXHcVNBzrFuQ
	2ejLtnv2+C/y0UbHKw/2Bc2ly2P3LFwMybj/jfAdi8XKOY1qQfZqwrCSMjXu4hwg
	QtHSjjjRFd0PtEfH8uWw2Kb9RPUJ2HxW0IxFppa9IWw36UeNlKfDTyUb1HpRGvct
	kEzTQuaZouTPrNZDXijQ35HdyezC6ZDZgjBXgIDwAm8lGSHfuB1qNADAZXPRJuWo
	qosmi6+hEFQ6BSg+sNiAoUQQVKZX/6G2T03CW9pYTNDg60F2yi56f1GgcRm0cQLu
	3dUnGELxdBEnqRF+McrBiEzTd2DDHKF7VBzzciNU8/n1UQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0puyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 15:51:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e6e4f29c05so80976031cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 08:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938705; x=1760543505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcwrCuhkeTvKEu0J3KBAezZBeXuc0UhImZ4vhS6DyQ4=;
        b=b/6ZMka9LxLTwoy2kNLk6ebqvhaECLNn1n/xqfjTwkNcDfwCWMFcYqe7h/NBexIUUt
         lFaLhYBEDL3fbLdmX1vCckHt+s7905AFAYB07jKfA7XcD9yveuuIGoC9+mGzgLnrdAvE
         OBsQywxDZOpV7oI9oL/WndOUP8gqKDOf1jiv8sx9bvP19hR8qQKJgJLimYW1pB1W1Fho
         S6Ysw/M6C1K5Ok6Z1EgXtoMxPlDcBkcEH2a2Oawz2Y6NjKebOsHvE9RvSuFWh/76HKxw
         PZTBxum7IqRpH918I2a9+YIMlef61gkPOJIFDoYa+7uBFrbvY8W60/9mxWhhkRiqTdOT
         bDWw==
X-Forwarded-Encrypted: i=1; AJvYcCUDBJVtAXSbL0d6yZ0T6zkaDIe4PwW++DhCtjAcxdhPxEYypQHuizpcDOokRp7ydC8Shan4IYtsDjQwdylC@vger.kernel.org
X-Gm-Message-State: AOJu0YyzMV6yLw1h2uNkzXJX0s++B5ka7sIY2BmnG7SFV8v8ElpFTFT3
	yXrHnpR7NnYkcMPF8oMF0cB6YTlJAvw4v+0ZXabpHQKPlThQ2UXMQdnkF8e6S0jjIwOjmvvQUGg
	RZdZo/Iq2W1vVyK/2X4qkAOcy2TdNRNgqd6ouME2FhTuFF/aARZylUUbelOLDsWfIAe0U
X-Gm-Gg: ASbGnct6t7k/fr8FpWrUBYDQnp1/oztRj3sCgT4FkVRNs+0t5VsiBMbgRNTorn3eVI6
	8LKiW4TZ1TGiEZWLvQsMiqtxtVXSRPwAuKbcViH3ATJVgp7C2SqA2fWZFAaHLLe1DXJedpfJtV5
	rzPL75EE8PF2oeADJ54wggiReb+lfPRC7JWwIoVP+CsHtYpFKs8t8+gXiTWsWEJTboM06zGw1y8
	vENHjyh98bVuVvYoNM7knhVZ0RBkWyLRfJrioktBbBxY+a8SanKsPegyA/TtkQYPnqmihKdwTPL
	3b1i5CfEW/e2FlYycjBdSVdqG0pDfLoRj3XjJ7k3SpAAtrVxnMeHn6GGF51JuBjMjzSNwPKVxuY
	MzxnU3M+jGHrBDZd2P//WqP6dOOrAn1NAjxIlo9mavpEVZB1xFu6i/z7JTg==
X-Received: by 2002:a05:622a:30a:b0:4e5:c50:54c9 with SMTP id d75a77b69052e-4e6eaccbd6amr57213511cf.14.1759938705288;
        Wed, 08 Oct 2025 08:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz9nJurxqqfXeqyo/dKVySyAMhAg+u4zXN9CPjAveUmFiC40Vh1yMZggNhpP1YkzNwKyeM9g==
X-Received: by 2002:a05:622a:30a:b0:4e5:c50:54c9 with SMTP id d75a77b69052e-4e6eaccbd6amr57213131cf.14.1759938704793;
        Wed, 08 Oct 2025 08:51:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b8213csm20602691fa.48.2025.10.08.08.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 08:51:43 -0700 (PDT)
Date: Wed, 8 Oct 2025 18:51:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm670: remove camss endpoint
 nodes
Message-ID: <tqepksd5rtlbgpih62vmw3n47lwbulkjgg2atcnndtykvnihkr@5464jxsoy2w4>
References: <20250905215516.289998-6-mailingradian@gmail.com>
 <20250905215516.289998-9-mailingradian@gmail.com>
 <95704b74-52e7-4831-bc93-d4d7aa32736f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95704b74-52e7-4831-bc93-d4d7aa32736f@oss.qualcomm.com>
X-Proofpoint-GUID: FobSqwbcQGhvCWMLc-1BT6w4NC7QgBss
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e68892 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=gJjvgzWfCafZWgNBPEkA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FobSqwbcQGhvCWMLc-1BT6w4NC7QgBss
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfXzZyv345zEWr0
 GQVdfLkG/vjwlMsHlgZkpJU2LspKxoJFiLYwEJllCIycprHTyNU07HAbsajJ8QMbdSe2ToHVbHY
 7tYDf+G9EFh0PBeiEmMrcYZmNhRiSKYoz8bLrVfeyRCfKBpJ/9WRqLCpxc2IhosGC3wdmu57JW3
 Ks70Q7ksy0hocjFTXQXNIn9SuppMJXfaCy3W3mE8v8mRV4SwlYMNISvzIeG43AFfDsNk0zNTMZA
 N5UIbjc9QvZHZ/HapyllUDzMWKCARSGV+wGr4WU2TfGhUzU0P7HNt9ZjZL6j06Jpr6wThtx+ify
 8lRJUjpTs5ljVzOlEbvmvFk7V57/9tqex4zlLP8Wf9Lp+YeQ6Y789EIg+I8dB+xrHS2ZFXZXG48
 vCbTc2O6OrKKdn7tT3zxfWy7F3p59g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On Wed, Oct 08, 2025 at 12:05:55PM +0200, Konrad Dybcio wrote:
> On 9/5/25 11:55 PM, Richard Acayan wrote:
> > There is no need to add these by default for all of SDM670. Originally,
> > they were added so there could be a label for each port. This is
> > unnecessary if the endpoints are all added in a fixup to the camss node.
> > 
> > Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Link: https://lore.kernel.org/r/488281f6-5e5d-4864-8220-63e2a0b2d7f2@linaro.org
> 
> my comment on that discussion is "????????"
> 
> referring to nodes by label is the least error-prone way

+1. I'd suggest keeping the empty endpoints, unless we have the actual
usecase where are more than one endpoint under the port.

-- 
With best wishes
Dmitry

