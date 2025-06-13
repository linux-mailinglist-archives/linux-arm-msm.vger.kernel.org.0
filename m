Return-Path: <linux-arm-msm+bounces-61270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB82AD95BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 21:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 243CC3A2189
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 19:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9282242D9C;
	Fri, 13 Jun 2025 19:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osObhhsf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2359022B59D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 19:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843700; cv=none; b=GcOyLmPgZto3RwpARStOI33TOYaBXZWDE0ZnBnKURwzPCYHAY9Ksn5A0Q+4T6IM0ev0yyEme8XNp3IKsFPdh8KsxQtkNF5T+RGKxCml3rtKY6Du6QgDV0lK56Wo8ZjizCpiqQo9Hu8r/aINoFnnez1rqhuR5kefuxLVA70mEW+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843700; c=relaxed/simple;
	bh=VHGNStfXRS7au1gMiH2Dbzhwuas9kiqaBcefG/Usvaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rjyu+iFS6uROzBt2CjdBhAsEt11kLoHeWOXTGVqrQEyPTgXeu1Hpr89uWsIuSs9za0vY1r1Y8mUK56q9AVb1U0jYuSrbsvgcjwcANxCvy14IxHyz7mEl4fhYj2pANy6lnD350OV/V1sNdoX/rX8ntbkZPVv9AISiqjyhAMw7/24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osObhhsf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9JlEA015378
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 19:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZdJ0wBY5oGK3A+eYa6OTWVtKRBxZmcf1tbSrTCxgbVE=; b=osObhhsf09hBoxim
	9EwUrts4sfOzbxwoMafQiQzdq3uY353WwpXwLz7rYvL3RgLEgnxcdfi37h+BEetl
	VzlVdJg7IFWWkiinKnFhiztUHTWh8JNm1CQWxcbPYSFBGpUSLrhuOXXY8gEStNuu
	WQGi4zoxbbCbQYueqfmD8Itwl3D1OXmYoiFY13wKMCTTKosOoXz0RmY7DMASJ59K
	AMagNdKPgXF0AL6a7437jV2cj3rZdeA4X2/GCPLMWtszmrNbudD1hcKmJohS4o7d
	C84oUYZIEf/dyjYqrFD0BKOutgxLpKDO41mZAcPEwdcheu8xK6ogqB/N/Doqj8zX
	cMfoNw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 478h8ks74e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 19:41:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fabe7822e3so4640326d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 12:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843696; x=1750448496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdJ0wBY5oGK3A+eYa6OTWVtKRBxZmcf1tbSrTCxgbVE=;
        b=d+IsuIz0yQ+R1EfKoek59sfU3YsRSBRx+uoQ3RHu/68AtU75e41frANEIZfg3EsvKO
         l47+Ra8yyrfEPtrtxDDDvTc8wzigWB+xPcNb5z7R//y1K4zWdIxG27W8tvTstwUp2Djh
         qFRZp8mGP0CjUShiTWmLK37PaX9Z1uzpPPZr/lmlWCCsSSHCfDT2XtO6rCsCajusFx7G
         yzb/TRat6lCn0c05FfVw2v1hAc3u9ZQFy7sYnPUrFq4U1krh5DptiYmGcdSuqPBj3o7o
         tEX3JXYSgNWuYiZydW5FLPpEx1Z8YkmsiQC9UzjROKuXCUVsPtrTxZ1fdLR/UeQK2e9d
         W0Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXCbGpi4ffNND1J+C1UyY6f/2xoqyILEo2hQ2jfGINfX46cKfijpfoICuMQc5FC/kkzO0lkpCVOM8SMdyws@vger.kernel.org
X-Gm-Message-State: AOJu0YwW/wa+4LZURiBgCBoqidW0VPfDp1UGeTVH0pZM+cVpNUqxNoNN
	+i9xfmM4hg2tIv9DivB1OyLfAC6EMT75y+8oFGKUhL9QbTKWKj4vSxQouA53TecEGLwVFCZr29c
	wuPPdMu72lhnQBRNAlhCOKAIVh0dATcL72bcgkP0pR5UNaGYrqmZ9SEehCvuQIogAX2Ko
X-Gm-Gg: ASbGncsS4Z6hPE2e167frGD7q59uBxeYiUGB+afs2Z+PsNNtRLQwfEjb46DRvlSKWoF
	9wRnYAKmozvLj9SFRL5c3Q1jZJ5PkngVdDlRbV+i6zWUXrJ8uWXLl+Dcd/WEP5b6V+mVc6DwryA
	kCUT2B1oOitXZHAVovE54+jiKmdfwbjONvN1XJXpIogZVMsOAa68J7W52WKmn2Zmx7h1uuxVX4h
	dBnlZR4PQERDS7s//xDfO1sS0dIQIHxf3k1Zn2hw7s0a+nxA5A0JZPz5duTWDzeuGxaX6TnA0nc
	hBPI2HPqIER+/700WQvaT1+qPXoPnzush9SJVKols8SIHVJT4dm+L/TY5t45bSvK03s2SYyvtTS
	RFKo=
X-Received: by 2002:a05:6214:d02:b0:6fa:bb44:fdd3 with SMTP id 6a1803df08f44-6fb477cbd0amr3159326d6.7.1749843696174;
        Fri, 13 Jun 2025 12:41:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2uRPMoMDmeHgp85rukBQT58kw9wJmx4qV1auWs1/Sz8fmI9/qjVlmri+yElgGOC2BQuIm2A==
X-Received: by 2002:a05:6214:d02:b0:6fa:bb44:fdd3 with SMTP id 6a1803df08f44-6fb477cbd0amr3159226d6.7.1749843695811;
        Fri, 13 Jun 2025 12:41:35 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8159e54sm177372266b.12.2025.06.13.12.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 12:41:35 -0700 (PDT)
Message-ID: <6bd88bc5-c1b4-4ae9-b631-93b208e9862f@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 21:41:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: pm8921: add vibrator device node
To: Shinjo Park <peremen@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250613194004.19390-1-peremen@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250613194004.19390-1-peremen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 97Fy86PY9nctcmsYg19x2dY1QnDpKi1g
X-Proofpoint-GUID: 97Fy86PY9nctcmsYg19x2dY1QnDpKi1g
X-Authority-Analysis: v=2.4 cv=Pp2TbxM3 c=1 sm=1 tr=0 ts=684c7ef1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=qUHfeBcuc-EptDy5CXEA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEzNiBTYWx0ZWRfX/Z5OfCHhft7s
 +yKEETXW4qM2GBl4BRbLdvBmIehNOsRVjX5rkfsbFYnZygOzIOIbfK2sEpxDBO2tLaqH3AlDU4p
 Zfi/d8OBQ01/s6IXEgfBHc9gfvjqq7yWjfjf4qFMtjlOiyLt0WJZs6W33NmLpJLAbDS98nKyYOq
 Hv+PUJElxtmdWV/Lrc4TlxP+3s3JfONwgrzHxaweivO0vojaRyAV2D2A5eOzCM/t69G7kHGaPmu
 9BNlphAhQ2cH1uMIlGqBDeUU/G43nS/kZUGl8V1hi0oe6F1O6KwYBeG0qnPBacVBzVNbdRVvJtx
 B3X1fpPF7plwxxjY9nQJC2jzAauTMB5wgyS+mkYRNoC1mvj49YFLYQSZOmW0HtV8dC4BBy9hPbU
 8shx/DAu8Lur/JbIbZdi+xWtpqwLeEGw1Ma3KMWsCJIMQYx+M8nPCZHUZuEUAszb7dMfFq6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=734 mlxscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130136

On 6/13/25 9:40 PM, Shinjo Park wrote:
> Use the same definition as pm8058.dtsi. Since vibrator is used only by
> some devices, disable it by default and let it be enabled explicitly.
> 
> Signed-off-by: Shinjo Park <peremen@gmail.com>
> ---

This is the third time I receive this patch within 5 minutes - please
check https://lore.kernel.org/linux-arm-msm/ to make sure your emails
reached the outside world

Konrad

