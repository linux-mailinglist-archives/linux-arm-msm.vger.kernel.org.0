Return-Path: <linux-arm-msm+bounces-55690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD015A9CF92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1450188EC1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782C91A23B7;
	Fri, 25 Apr 2025 17:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtqHv9R9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3771F8AC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602181; cv=none; b=Dtf1nfhDRKWn7sEp2aSXUTSRziBkA36fpJ+IHF7gJXLipQE/AvnFhXJtkykUd+B+PsPZE9zvhOJ7sV4TIUyaHOL4xoSf+glj3o64uDh2p1qL+3W93sOs/52C2Qss13owa+8mrotQILqua42R/8E57ApHqO7x1J4XcL6ntY/ncMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602181; c=relaxed/simple;
	bh=UXBn5EKDEcylQ3JvkMKEMbRtvwMjr4YFKPUwt6mIqCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6CEJKSSDepWQ+NcGDpy2WafGpRPrHkXV3FWga/9X8VjzMLDQzsW5wxDfFCTUmcCRfdbKkYP/q9HEBIBg6ELZqVw1tpv1q5IvAM8Y1IEtoHHz16Ejym0OEbQgXhO8jmw/8Axiap9pu6E1z8GkPdi6wWiUCDIRN9nhyfOLpWDXAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtqHv9R9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrn4011053
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1I3Mn6qvcpM5bV5KzICKpYfI
	XWtjURj6RGv9EIv6etk=; b=gtqHv9R99Zk4v0XenWDKf/Aqlp2I3wQQP5GkBrMa
	e0Eq6LutVOng/k/2a/e9Yymk7iZl3hi080TwHm/KD4haNn9QH0/+O42y7R+1IDeZ
	6PiJLX6ItoZ6yEp3p3H5JVOjzLWqgMUv9H4XPQHDNHcpNJKASiinS4fQv9VeMwaI
	CBK8HssSui6KjTktWFtEfvJkfRCr38Kl7FN+BgmhS3OZg1d6dO37m9YA5anCIat+
	jDCIv0A6DdLnKwsirpfuY4FwxCCZ72FsqZPx1e94vaGOhcbJ/P8Fj//k6eXap01B
	uWOk9g1nikEksKDiL3lXrNUaAH1/0BT/Da72Yjmsy/4A1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0hyn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:29:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0a3ff7e81so438822785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602178; x=1746206978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1I3Mn6qvcpM5bV5KzICKpYfIXWtjURj6RGv9EIv6etk=;
        b=Ulr3j4MQYnRYRjxtYrO0cXIznACcbqI+TBJAYueaPEDHgRv3JsmWp5n1nPNUFmQN/y
         Nur0GD5v8Bdmu/trq4J1zqVljK7Dcqrr6P1T3N+1+7S+W7uKOvbrgd09MLylnEHqxctw
         ou2rT3SdoO4mqPz6nLy5yl5JEbJ7GGhTB02ZNKiq/XURfEjCs/XxNXwQxU3xkHm/DvqB
         8mjz7CNuDWpATAXbCb/fhbjdgNhxmkN0rc1ipDaqqG2d0mD52a7bzxkhpBMsj9skeIyI
         TeO+kAse5etmhbrGpVRSYgbYQIyYOqS/LOoRtpVt7C/onMQ3jXT5Al5u3vXQCarbTYVL
         ENgg==
X-Forwarded-Encrypted: i=1; AJvYcCUQIRr1O83xYkiqPSXgL83LSXRVO+d5lB72LN5y80PYzhTDGGlCcY9gxR3jx0A9PNZrTGKJc+4gVq/jVtfy@vger.kernel.org
X-Gm-Message-State: AOJu0YxKxz4jmO7cL4xgDThZUV05dAcT3IItkhfEIe4B7qISrZ2S15zb
	up7xq1NwXGP7xITpSUIrIDapcDdgsrnbXB2fi1+p/v6mX0FwSHqMMr996aBxLzfcEjypYRB+cXx
	QF7wv6EMyMTuPIKK2EhrPUZu0wwpn/b5TEIarjl76ZfftzYqk6TQB2VHueutcehwU
X-Gm-Gg: ASbGncuzpcxnNqQEh9nd+oGAvnInq5gFCVkOaIWAavmnMiw6nLqRE/tHry2XQAcvw7t
	zy9YE3pfkbXM67JjprYr/yjDpTqfRWZSoMd3gBCk4BvOY7rQIGqXfFeJxxFdO80tfvnGIjX3YBL
	/claJ3XHCiVn8kGUBMPqvzLPAswLBvf1rUc96IisArR0LTfe7iuMyfvVcd6+jUMfhip4S7X3yGA
	W2RJ37HE2mgxvVUgSXarpz+6vk4CqsDijYqRn9TWXDzsnr0ANQle58a8PFIM/XukbtYLS1GAQSW
	bFlyElWRKIAhqPHs5WJMHC3XIWLseZ19On+jYNyPen/l5XbRjEbVNVqOtjRSuc+WEIpBCF8WS2s
	=
X-Received: by 2002:a05:620a:2b8e:b0:7c5:5a51:d2c0 with SMTP id af79cd13be357-7c9607cfbc1mr587859085a.52.1745602177906;
        Fri, 25 Apr 2025 10:29:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLeqfY0EODr6yyjD1N0AwEtnVsrJuvizRria8y8RjiZAy1KPkjGP/p+VwiY9/KyGUT7aGNTA==
X-Received: by 2002:a05:620a:2b8e:b0:7c5:5a51:d2c0 with SMTP id af79cd13be357-7c9607cfbc1mr587855485a.52.1745602177613;
        Fri, 25 Apr 2025 10:29:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3d948sm681707e87.99.2025.04.25.10.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:29:35 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:29:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] soc: qcom: socinfo: Add support for new fields in
 revision 20
Message-ID: <oxemmzhfy4cnv7nlsdzbyijwceqzu5beefkqbezu2apwypfgoz@ihd67ny2e27v>
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: uoRw3-ljVS_VC0U6Oynny7TSVzisZrVr
X-Proofpoint-ORIG-GUID: uoRw3-ljVS_VC0U6Oynny7TSVzisZrVr
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680bc683 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=y_N5iSi_J5k_ybs9BqwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfX/RLiZlPu9R5R YBa95TWuSzBaS8pCOZmG4ufEXHlcthiqC+mxBSh/U5o0FMXHszzWyKREwxeqJJERsdl7FdIY4Rb tVPXyErowHxzl7p7cobM5bhZa6flZFCQumDWyS5SzSwkiZvwsaiJF7N+tvNYPmNgcBdWdGM5sZw
 6aojosZDY/jxbUKR7hE/CPC+qX+Piglx39fepZXFM24i7za2NLqbxKeBR5q9qrUXq/LDUDTU9dU DvXkdCYDuu9JLJpYrpPW5JQAsDQgqD+g6DQyVIHvNljyu8AdvaqOsdp6rnoLL2iA5fKm3ApRp8+ WL19qMaHIVSe1uC+HsushzxqEq2dPT2DlL303FI94zvuvtCM2mqz9bk1B+fEP54TChM4CYnynEn
 +h8dFz3F27jAT3lLnls9/8Md4RS84zj3yXDjB0dyBuz+ei32bDdBxr0c8L5B9bvC1/rwpdJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123

On Fri, Apr 25, 2025 at 07:29:44PM +0530, Mukesh Ojha wrote:
> Add support for socinfo version 20. Version 20 adds a new field
> package id and its zeroth bit contain information that can be
> can be used to tune temperature thresholds on devices which might
> be able to withstand higher temperatures. Zeroth bit value 1 means
> that its heat dissipation is better and more relaxed thermal
> scheme can be put in place and 0 means a more aggressive scheme
> may be needed.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2:
>  - Added debugfs entry and described more about the field in commit
>    text.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

