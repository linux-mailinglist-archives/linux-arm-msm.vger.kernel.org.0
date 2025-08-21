Return-Path: <linux-arm-msm+bounces-70212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A911CB300EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 19:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64D87AE2D8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 17:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF162D062E;
	Thu, 21 Aug 2025 17:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnpnpTMB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1370D2E5B3C
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 17:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755796853; cv=none; b=fLkgcw+D5stf2HQgZ4XB7dhe5zu7cE1NJiY9ajisJo6wsBr+cvpva77to4agc66SNM5JduFj/H9EfSpKJhyH5OJBeCbiBxDzBcutUrbV95WKreuYmolOB2rPQW6kPdj5c+rHyXZlpK3ZK7BTX7JswCyMnniemrK+AaZrvNrl1Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755796853; c=relaxed/simple;
	bh=TLhz3rMWCYqIHd1iDP8owe1GnVQepPj0RnY98tlw4tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6KjnmgdkTJ8yfAbE9K9M/7ZlSFK/2CeH4iq4CbdGkM28OVOzSHw9veBckdxmlM8AL860t4CGEbVT2U4iOBQ0v9zKs3X8niio7Yu1RjCjQTo9QlO1P2hqIyGw/5G8eidWc+WxkTiNdmCj/oCRNoPojIT3Amn5GBuKxmlPf0BRJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnpnpTMB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bFZK007146
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 17:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aoikleB8qrZ5qP9Q/cyNCn1p
	Z+IFQyJRynDCSYl4hUs=; b=FnpnpTMBbAjGVONZOUKSg45IKIU3/Pt/XLcXMtBf
	ZxuQp5uWC/cq1N5YbOoezaPPyBEZB00p8bN+/xX2uNGVQbtA48PLCiUjlFuY9rLm
	W7tb/H5ZNYtgNlPGbK/6i58P2CgLxj+qRO1GjoXbYwadaCnLkLkXoiW5JkrT476z
	zU7lHrKvjTE/o0ApQEGMY8e4I8jPEz8Comuec7kBpBrNhnnqbpEWYPwG8NOO/6qE
	f+pPMoG7pOsufRCKCQz/lx5H993Jj9wiaTQcqNlMs7SPj04CFuRZjwOcZ9IuVygt
	jxOmM1ge/LklBDcRj3xAOInuaGu0QUppmdPfaJxRbbgYLw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52969kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 17:20:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e92b3dde9so1227564b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755796850; x=1756401650;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoikleB8qrZ5qP9Q/cyNCn1pZ+IFQyJRynDCSYl4hUs=;
        b=YJK4lpP+lL2C9kLicjb+XgZCehbF0uRy56cwCp3fUkc72rXToSJEzg4XFsDVKi2Ukh
         CPELEcKCXPYy/x2ssOjKOAP3+EJ9yf/W35FC6WlvGVLoLWea0sa5nblcSbFuMBhiCeEN
         IPaPZfY+WbJfhNT6+1l0DyCaZIG8OSSdqt0ZOE8ebn19564676q+Z7rt6ZoIZGcd642g
         PfeS4cEmJ3I+V6lQNDO7Sj3FJfP4ymv01I4wuPCfzLVH8yku83OENW7zWO9ywTbnctDW
         hy49YdGIixb2U1DzkUGBTL5Hjw0Y4QKZGS5fUjIri+NZbrRMp2XX2C2OqPYC0AxSp0LS
         n+fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSccI7oIFZ423kSnwBye+ImBwtsCLmkDr+QhfT1zKfRJQthxCEx4aGTsfS8GWmHTOcrxd+EPa1QrEIlmpy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4fa0+M9kcQ36vSZuK1m/4Woa+7KA6KMRQUieYwrHWdZqT1blu
	mACFxNlbS2uaBgH+7JD0rylDKdUzkWWjc0rpK32N84eO0YBNm5lFcKLZhS4UQ3Jv+1AMfuRv+fY
	0QWmlRgKH6UNR7fHKBoNl2pdz83vi/Ys3SC5IHyc77oxUMm5BSnSDFAgVh6MOIn0RAQ27
X-Gm-Gg: ASbGnculQXkWIKOo7IeHh7ABfeKxUMzN12kfHvBgPENGk9EuLeYayaRv3qpT7/NINtz
	CL5LPSC+v63zOuMF0TRDejCheLCi6LmN7eGlPJaZbHGWtdENiZMsdu5BYvtG7D6Z9xoTBx079mD
	kuQl7b+KmFv9SSX61jp/FTaMN7HSt99s1biJs3mGg8pOjWlZ9VwZTIAy95sV6V8+oUWC81OgUPX
	gA+6r6xiH2YQs8iVn9QfNjY69iUcF8HpBW8HulODtGN6okIWSMIsff5UAzQcs/TkBfLvuwbvKxa
	rmHO/sfEAIVWRUjHJNLW5O+QiZMpIbrLZox1O4KXhvO614R8i9HVrUvbBoqptHbKNak=
X-Received: by 2002:aa7:88c7:0:b0:76e:885a:c3ef with SMTP id d2e1a72fcca58-7702fc18b12mr165890b3a.27.1755796850505;
        Thu, 21 Aug 2025 10:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqqgWcrAIo2xfc1nSKhO+omw39OC5L/phKySKVnNxOepfjjZ83oA3Goh+/8/RVSK+mnw4EhA==
X-Received: by 2002:aa7:88c7:0:b0:76e:885a:c3ef with SMTP id d2e1a72fcca58-7702fc18b12mr165864b3a.27.1755796849972;
        Thu, 21 Aug 2025 10:20:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d1b63sm8977588b3a.7.2025.08.21.10.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 10:20:49 -0700 (PDT)
Date: Thu, 21 Aug 2025 22:50:43 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 07/11] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <20250821172043.fh6sr6w4bwyhov5q@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-8-mukesh.ojha@oss.qualcomm.com>
 <4a60c3d3-11fb-40fb-8686-3d83539f250b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a60c3d3-11fb-40fb-8686-3d83539f250b@kernel.org>
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a75573 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=SpqgzKZKrfenv9_tDssA:9
 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 6pk63UvhJqoa9pXK8OceEcBgtpC0vErZ
X-Proofpoint-GUID: 6pk63UvhJqoa9pXK8OceEcBgtpC0vErZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7afgFmWqtWrF
 HtNTGlIsI1JJiUrIMmZrfmLSQA1AuuFxu0y488qsCWh9iVh5TrWfi3YrHKszn3rdwtHLpM5KCrE
 CJ6gH3ECDCEKDihlYANVOWnEFFp1zS11+qgcUfQz4YcnNrcFpDC+rVfFhTtSI9f2muiYy3DbG9L
 HPTJhm9pT+2NM4PoXtstHiGo3wr6GGoyJvdxNN/lmC+aj9z+l6eV1+uRPQxK7P+e7vbv3llu4k8
 mUW/9L1NytZ0XgNVorHXmfz5X1WrtkUO5gj56m5y5GvmwUN28Sc+osm9SZSPzam86v2khLjKeq1
 MMQTBGz4CZIrSRW1Rc0jXdXv8S04QkiKUmGavZQWW7Qyr1sBVRL7ceMfHWdFzkW//G9qYxA4Hg2
 aaj2INr9F/OfDYN6DyJcxbwlL9DSqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 05:05:59PM +0200, Krzysztof Kozlowski wrote:
> On 19/08/2025 18:54, Mukesh Ojha wrote:
> > Qualcomm remote processor may rely on both static and dynamic resources
> > for its functionality. Static resources typically refer to memory-mapped
> > addresses required by the subsystem and are often embedded within the
> > firmware binary and dynamic resources, such as shared memory in DDR
> > etc., are determined at runtime during the boot process.
> > 
> > On Qualcomm Technologies devices, it's possible that static resources
> 
> It is possible? Only possible?

its possible 

> 
> > are not embedded in the firmware binary and instead are provided by
> > TrustZone However, dynamic resources are always expected to come from
> 
> So dynamic are always in TZ?

Yes.

> 
> > TrustZone. This indicates that for Qualcomm devices, all resources
> > (static and dynamic) will be provided by TrustZone via the SMC call.
> 
> And now all of them are by TZ? Previously it was only possible?

Will correct the wording if it has cause confusion, I meant, currently,
some of the chrome product supported in upstream has resource table in
subsystem firmware while most of them Qualcomm SoC supported in upstream
does not pack resources in subsystem firmware and rely on Gunyah to take
care of its static + dynamic resources when it is present. On its
absence, TZ will provide.

Will add above thing if it is not clear.

> 
> Srsly, what sort of AI hallucinated slop it is?
> 
> I think this is pretty close to proof that your submission does not meet
> criteria of open source contribution.
> 
> Did you run any of this through your legal process in Qualcomm?
> 
> I don't trust any part of this code.

I don't know what made you think that way. There could be confusion with
my writing and may not have expressed the thing i wanted.

> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha

