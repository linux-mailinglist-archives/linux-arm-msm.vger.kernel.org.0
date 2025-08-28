Return-Path: <linux-arm-msm+bounces-71148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E93B3A3E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 17:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D89CC1896DCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 15:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0057D1EB5CE;
	Thu, 28 Aug 2025 15:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+xFESxd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F464217730
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 15:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756394162; cv=none; b=ixe2OVVWHaahSJKcRYy6JWRFzxq2NJWGimv81LQFk5MMELrEVvMvdiBA+VNFPO+kNsYW4HxZ6c4cyk7ZxtE0QLuQqZRtRTeSXFrQQBwz6cqwLNxX1TQou9zAacq7UZ5N1/OIsQ5cWZyLn0PggpwMq6MNJH8jeDTXAHOAqfDEny8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756394162; c=relaxed/simple;
	bh=URRU48cWWZKXWYFt8cB99iHFjpEreIFbVOTSGj9tHNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cu0l32znDpvQ81I5MAXa84fyHpVM47ZFCC2LSzh6f2M8T6DWDxF4tornRlPdRLA/XdourRS214/Vd3hA8ivSYWoY4zR2Wi8C7TRhHZXTMxFpOTv8HY2D7T6HkUJyi8Pm2Z3mP153KzpetxSCS+aRMyUVOISMY2NgARbG3H7+yTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+xFESxd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SDMUXn008229
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 15:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=baDCJN4Ix+gOwGahkROrbNwU
	3+styHRf+7rMYdXAkDA=; b=E+xFESxdnnEimTHToxuR/9tA8PbNJaiQUx+qdK9V
	je7HYh6Yz2wxNfi+ENxmD85DkfWW1Ujm0SWws9G8YvBSeSJuGFXBK+7gcVHkFDx/
	D6Zi6tKtmOKkjlOQ8WC78/Ex7LnxC8PYY/nrUudmnU1QVOu3l865mND3Q+To30y4
	GKwPTD16++l0TPHutiTTdigM4zjsl9L6/7mq99w0jvqEVEWs2Ib1RKtKs5Ia0wUI
	MiT+ZELzLYOmhkPeAFXg8BhuGX7VOKTcUHP2QyZ4XcMts5J9+Kx5r0CZkv3MneNg
	IhZrzoxpuCyEh4RQgC/cXcaxqZ+jI2rgv2wceCSx9P4tEA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8apwpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 15:16:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-771e331f0fcso832793b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 08:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756394160; x=1756998960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baDCJN4Ix+gOwGahkROrbNwU3+styHRf+7rMYdXAkDA=;
        b=QdqbvvEaR/PhIICoIe+DMh9pSmOyxQixVsJ28bkIci7O5DVF5Xf0KIciVKxrcjW628
         Eeu38+PyWzQ/CL+yX1kHTYHTclZYMCOYHW/obsU8hfjU/hVQ2TupEocvj9kaFzE3RSQM
         GWclY15Svqzt5hiOzp+bMe0NE4vXY2UuIUf/uh8aR+tVRhjLWjgmCU2btmpu1dC3BZg6
         N15cl2hrkG0Q0Zbha44J3213zCMiQVbfXo7BaXCvHQmYv161g+PHohNEbqAus5ezg1mT
         A8mNgLUStgcIZkHEgxEr4ewePKqC8fU+M2K0LrnwALxsCWSNKbBTkgP0ldqF6Jb4Rqiw
         nL/w==
X-Forwarded-Encrypted: i=1; AJvYcCUJopzM6AWiEVAcfixhKcOE6pYusuT1RLKLKTrjpwNdUyWEueiWtxcRCazgTEwqyjl9B+f57oO8ItCYrhMV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9SZNchGCpcx0Ty8rV0prhBTeuJLQYg2LAZwzp54Mm0lDJJuUn
	H6RK3QYrPIDTr8UCm1eY8HfFCHBUouN4aGSbUblP8NUzyczEJm6YbZxmaiS+Nif7w3iJp25VBLW
	s+Tm4RdbYCKBYulemREJrNH6U1ddHv129k1CkgqOB9Yo5I95vKYM0aZALfQ4AbjzmDRwS
X-Gm-Gg: ASbGncv+FLXfU+mApcYs6licbkYoQv+L+uL+yW0xBMxUiAECIRWs3hElx5gk21hJpRp
	fr+3MQwiCuG8k0Z5s3PR6/8e5qVXiVsEKsqzd6XWqShWaLR4xbCsUqGtgtLzBgBGTDpmOhZ3ntz
	r7HEezkgxQZGVsQwNF9xEnhliTf2ytaKXhJ78wcMrFh9B3inui/9RwT9/FwRccS7YrH7eeqiCtP
	+pCz7ndG/gq82AQs0jybAy+iQcBmDWjd9N6/06S5+0uzHig/8SfVSWIL8BVB8bIqvprVTgY7Rfr
	iLLj+8Bv4Iy7mIZhR8av97qsId8u67Ff1k1g011XGLNZm75SjMjZuKWMg+bEx2VceT+k
X-Received: by 2002:a05:6a00:2d85:b0:772:a5c:6eea with SMTP id d2e1a72fcca58-7720a5c7183mr8959042b3a.17.1756394159456;
        Thu, 28 Aug 2025 08:15:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr+f+TmPKCG2a3iQClc3TLskdjaiUttLjb5wUJrFV04qdT1/xLcvX7ROCMwXEmiI50+eK2WA==
X-Received: by 2002:a05:6a00:2d85:b0:772:a5c:6eea with SMTP id d2e1a72fcca58-7720a5c7183mr8958959b3a.17.1756394158822;
        Thu, 28 Aug 2025 08:15:58 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770eb8b94efsm12551158b3a.40.2025.08.28.08.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 08:15:58 -0700 (PDT)
Date: Thu, 28 Aug 2025 20:45:49 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Vishal Kumar Pal <quic_vispal@quicinc.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: lemans-evk: Extend peripheral and
 subsystem support
Message-ID: <aLBypYX9y4KPPSji@hu-wasimn-hyd.qualcomm.com>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-3-08016e0d3ce5@oss.qualcomm.com>
 <bab2e05a-140f-460c-8c28-358e37727c6b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bab2e05a-140f-460c-8c28-358e37727c6b@kernel.org>
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68b072b0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=UXIAUNObAAAA:8 a=ogXbWB_6-ELqwvBGSFsA:9
 a=CjuIK1q_8ugA:10 a=bFq2RbqkfqsA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfX520oVqfWKAPh
 VXKVsKlGb1Jkd49on2E2gjBbCfrBdidCqEJKciLtsPJot1/MlUVZLg/I4MM8jT6bgrAI2wYiEQl
 fFLBqi+j11gm5/Cme8OgZuCR6nkfzSkTSMNWA5+P+rAMGK66p4z7bm6ZNzOOehVP+PbeyA84pPL
 NxBpcFnOKZQdA3rpuV4zaIBxyhhneDvKYT4MZp2ta7BmnppDtsY4eFpDttDWyPhm3UssrU33Qxi
 t94+TZKF+JA+Sl5DUcc8zZbobnlAbQ7ANcCbA/9QrSNekpmCcsoaRIMPbuvt51fCrO5/D69m+54
 earPicTCAuGycUvwdTBbTE1q4JE3FkqVWpV0GVNdWNxbE/WunPSIpvr4OT/58uK3xxVlnWOQxF8
 Pg44iqqN
X-Proofpoint-GUID: -KYs0idv6NufPXzH_MNuYz_Cs4959xwx
X-Proofpoint-ORIG-GUID: -KYs0idv6NufPXzH_MNuYz_Cs4959xwx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153

On Thu, Aug 28, 2025 at 08:56:07AM +0200, Krzysztof Kozlowski wrote:
> On 26/08/2025 20:21, Wasim Nazir wrote:
> > +
> > +&gpi_dma0 {
> > +	status = "okay";
> > +};
> > +
> > +&gpi_dma1 {
> > +	status = "okay";
> > +};
> > +
> > +&gpi_dma2 {
> > +	status = "okay";
> > +};
> > +
> > +&i2c18 {
> > +	status = "okay";
> > +
> > +	expander0: pca953x@38 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 

Ack.

> 
> > +		compatible = "ti,tca9538";
> > +		#gpio-cells = <2>;
> > +		gpio-controller;
> > +		reg = <0x38>;
> > +	};
> > +
> 
> 
> 
> Best regards,
> Krzysztof

-- 
Regards,
Wasim

