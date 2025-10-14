Return-Path: <linux-arm-msm+bounces-77259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9638BDBA8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 00:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A4723ACFC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 22:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC5D2BD016;
	Tue, 14 Oct 2025 22:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2Vlhn/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F8A2550CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 22:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760481548; cv=none; b=p/JtL5Xwg1F7RhQhoV84BNSqk6uuyZlQ6oC4n5NyMFAUNRcZZzTKT1QttVoQvhjPwW9lL05XScz7oBiIzOrbqGABH09Z1o8AjLN9w4dY0bB5v8QDBZyy24TLtNZNi56jcaR97W4Y4Yc5NM8oLNSTr2WWQBQsDe0XA4ztiv3jNGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760481548; c=relaxed/simple;
	bh=LRXf7zoTneh0faYdMnc0/LhZFo+UjTTolWI46Z9U54I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbH9dS14gA0QVA0SeMcK74ltr1MZ8pbEM+JdvRuS7n09dsXNFzTtoNUoOOFj4FlaCUmzDkosY9IznyYL09TqN2ifXjAIo/IcSfl0U6QSIoaxo8e2mg2I7/iOdap5DVpVOuhzE5k+RZD8cPruOIWf5sEUL5Gw2kQnQIk1iWPf0C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2Vlhn/V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKRXnF001996
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 22:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J8qH2hDTaqud6En4jAAuso/H
	AaC//gK/RbvrpvFRBGk=; b=G2Vlhn/VVlT2+0iR3mUUveGo0Xi3ZP2jMDV/npnW
	KAAFaUXW4rbTooFCuzfbQTUgv04Go0dIQ3SmOY7qNNHMYRmMpxGVjEH4sAFKVWMi
	NPBsvSwohMiekjw4d5ghQTvvGFcitRKlUgJz2R392MFPhPu51IabAtyzbL6peHQf
	XTrG7nlTMIRI/4FFeAK1anEa2ajBxCAvbFnACEcgD3angnETVPwCEFpxB3P4MLTe
	GMlZiIf4gXve3baATFl6DrgZS+B2gZJli8s3lq+MMtbkpU3AXM6+A0jzU/pyIT+D
	FonX8GX000CL1xFiDhZ8FzC0u6QwI2QaN/jO2KIJOO0rtg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0t7sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 22:39:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8645d397860so1369633885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760481545; x=1761086345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8qH2hDTaqud6En4jAAuso/HAaC//gK/RbvrpvFRBGk=;
        b=nfqBZA/u6RP4QMptqHweHG3zelqAd7vFWMMxhmxd7xgzAOtktSXQChU/vmFXtlTpir
         j1/l3VtaeCYt9FjQaqGnwYjgQepR6n1Qt7vAteXovRzwOW1awex5C+u/RST5ueAVu59V
         DsQG/1MpxipIKVYyFDH7+yGSiFd/ERf5klzZGhMtPaqqSewXbvWGQZ8jUD/ipoo827qC
         n2nPTjOaEhfzyhije+s9ImMyLwmxeWA3XbKJv39R6PA6UZ7bR7YkrjMrQr4aidujoo97
         mlYDPC8E7uktFw7ot6neFXQMFN8PSe3pNTrWuYqh/BKz3AD78TlD+GYNmcsG07DicCRr
         R7+g==
X-Forwarded-Encrypted: i=1; AJvYcCUykqJWOCsU4pRZIFCbvrQUTsUPCtCIsV8k8EOh3wMmGMsqCWcxkok4ond0HpGGnu2uuXxkjGL+6bZh0Abp@vger.kernel.org
X-Gm-Message-State: AOJu0YxjzVnVODEEE4ggsHRPqiuxILIYlr+8wngIMxLwnh+lxs9yc7ju
	nALqN4S/cOkrVFLb4y2Puk3+sXJCJRcsqPqZscNGbWN5cDSewxvM1YioQPK2jfmQbZ5NxDq/WXA
	czT5EUWAJi58fY6cZ8Stf98XjXfJc65NB2tjWDic4NRDpySb4j37+yhJJYkdWomt83EIP
X-Gm-Gg: ASbGnctN0E7Jr0CDFh2j1IuPSlqfvBwN84SgLGnCd7v868/dY3r/UhlJ9EvpyMa5vhU
	iPCFB44fYj8KUU7mgFfvBUA1YtnXEnt5bCEUyxxXumRgA7ty/IpMLWFHkhKDUst1o3bZ89Rqxdj
	7iVVze4CVrxttgYXYJ+MunOjBVEZ7hkhz3+w0XcEtoAPdLX6sVfH4cCTZiyh4NH0CwedsC50bPg
	H34b7EpItwOXTaOTWgv2FnUSUGkCQfkiwYJb3cc1GYwhMVZnv8sxlaYRuwjk9yxqKFI9fnOlvGj
	iasIuqJ+Qg0TjsolAqlN2WMDK5Y4q/9zmSi4FTh3rcK2nB+gtcfWLgbr+eVGh+LQVf9fnkV2h9Z
	/2xIJh6C73biynI/+bvyLefAWuJP5DhGtNX4sDpoPTCvdcEu67xxl
X-Received: by 2002:a05:620a:468c:b0:809:eb12:1ea0 with SMTP id af79cd13be357-883546e2601mr3663314885a.81.1760481544602;
        Tue, 14 Oct 2025 15:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxH5DvJku+UB0VHHWUK6piGxCPJ1l8jYzFuBsQSJN8q2+dqSi3yQpT3dZOzHDbmLQCFlEOXQ==
X-Received: by 2002:a05:620a:468c:b0:809:eb12:1ea0 with SMTP id af79cd13be357-883546e2601mr3663310285a.81.1760481544017;
        Tue, 14 Oct 2025 15:39:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563c98sm5645388e87.74.2025.10.14.15.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:39:02 -0700 (PDT)
Date: Wed, 15 Oct 2025 01:38:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>, joro@8bytes.org,
        will@kernel.org, saravanak@google.com, conor+dt@kernel.org,
        robh@kernel.org, mchehab@kernel.org, krzk+dt@kernel.org,
        abhinav.kumar@linux.dev, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
Message-ID: <nhq26qmkbaycrnw64nwur4pufalurtdf6pyecy5t6vzoncqe2h@mxzwvzuaepmb>
References: <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
 <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
 <8d88cd9d-16e8-43f9-8eb3-89862da1d0c1@arm.com>
 <hOs24ZavnUyKYyNwBWwRpYnrsefzBfp95yuy9zyp1ByxR9_3VacGX1Yntt8pCE4w3gllPwvevs1AZqghmwKoFg==@protonmail.internalid>
 <zcgn4xw2xghyna2eysavujbzbiydyki7p7upzzv7one5mdyjy6@sj7f75kc4vwu>
 <fb767586-a376-48eb-97b4-bf33061642b9@kernel.org>
 <a4WDx80rJP1GnGNEK0OOD5lh-m-MiAvireXdpiM9ETLKZ084sBJ2UthU_QqRbU_nwD4XtsdiyEqQ0AhxguzJ6g==@protonmail.internalid>
 <6gx74wxie4wcabq27wo5y7v36uuurez4jxlzanroepqazdlgtw@sdtv2ld47d3q>
 <fa3c1732-328d-46a2-8514-2e7f9ca6c63f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa3c1732-328d-46a2-8514-2e7f9ca6c63f@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXxWN9In0PnAvA
 o61xohFbtuCydrIoGrtnZIqEz+RzsJJ0Ajuj48IWtQXH/nx7gnWzylB1nQs1fbTKmOpuwtSb+rL
 R+YQxTP190DzeZcghKcxXVMqvie03LNSDT/J8PeQ0Zj0XhseBK99/WxghH1wEDIyTp36HZ+yJYp
 qQtYIl553jY7RMTDDHIAHmi1dL0WkKc71lqBIMhNRpc9gaZwZlWqbDnMz6iIpG03Lv9+FytIzIr
 CV3w9cVt6VMc5io+6qkx+YNKZ0u54wrXppLSdaKv0kjhUcOCbZc3oROh8el0LyghZMcA6+OWfu0
 ivw4rjnMFPpMv6dwgeFWt54rCr+R0DXRlY5vMskDQ==
X-Proofpoint-GUID: xeQupiWP2KvTho026XkBxHrzuFYGTH_4
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68eed10a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=GN0BuYHDo_BzztcbwqwA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: xeQupiWP2KvTho026XkBxHrzuFYGTH_4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Tue, Oct 14, 2025 at 09:49:17PM +0100, Bryan O'Donoghue wrote:
> On 14/10/2025 19:35, Dmitry Baryshkov wrote:
> > > Each function id can be associated with a device and a compat string
> > > associated with it.
> > So, which part of the hardware is described by the -cb device? What does
> > it mean_here_?
> 
> The non-pixel path video encoder, the tz video encoder...
> 
> What's not clear about that ?

And anyway. The "non-pixel path" doesn't sound like a piece of hardware
to me (nor did it to Krzysztof, [1]). It is just a port through which
the data is being transferred. The encoder acquires pixel data through a
pixel port, processes it and returns it back through a non-pixel port
and vice versa for the decoder.

-- 
With best wishes
Dmitry

