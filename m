Return-Path: <linux-arm-msm+bounces-75294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A85B4BA362C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 12:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E9574C368A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 10:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31922DBF7C;
	Fri, 26 Sep 2025 10:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFtKmtpo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D9329BDA6
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758883403; cv=none; b=mRUV5Je6vx3nXGeOBtoduyhexUc7Xos/Hri528EqW43iU27UQFn20e2mAU+SSq8lQV5Xv8jDAFHBNyk13FLTrZwXtdKVzOUVWYVp3/hrU8uzwZYsG9K1JHx6NyxGCtXmTq2nECrgGwWpe6sNNqfCg1fv4pAFXIqxYbrbfyf44Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758883403; c=relaxed/simple;
	bh=lzyUulIki5aKGPpP5fVxe5nwy/H12MYEtLFh8WNx5qM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gu/jkkq4VZcdyWl1XcpRUMuE+/l2grjRO+RMluQMukN+pemy+H8D8+pw9Zb2WFG9DlsD3cNLHess2OcB0blLwzmdMTs2k7+Zn4UPR7oi1DOB1Qah/JYytDmEKgoatD8/hr1aOvRY0WidvvfIw/ORj9IPWX/PVpFn/kBCMWSj8OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFtKmtpo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vdEQ018195
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 10:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBCHSYPAc7F0Qe+9c+6IkF1CaX9YY3oLMq9wdEIkFIo=; b=KFtKmtpo/IoZsy6E
	tBx1P3mAM2BtU8j+08faoGeAuRj9mj2nkv5i6Qt/udLmmNUwoL3bYcqkymPQ76oq
	Hd6dHseH85yFTiTD5EKnA+HQd3vrr/mLY9JrD08jpG3Zso5PMG8bJRH0bPaBXTPb
	21NI2l5gIxArgTAXjCh1QFHIPNuj9Lvh0uBRka+TQ2qgWeyGwfDYJ8SHgB39AX0i
	/IGFhOpoCDJeb09Y0sy+3JjSS171NTxTXQdH5OaQKfbb6IdMr5nltjEZoQzrG46U
	rLo2wdjDGVFSMCeFNl/Grp40o6PodLUKlpzo48EjpIM9RnAuGy3XmslrYydEgRxH
	4qdZFQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tajcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 10:43:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a9f5a43b6so3313146d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 03:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758883400; x=1759488200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBCHSYPAc7F0Qe+9c+6IkF1CaX9YY3oLMq9wdEIkFIo=;
        b=sPgUuyDTA708yryLmm/HU6Of67alBBabX9P8IFrC5mzB7VUT81s4iiLle9ETevE2a/
         kvfiV040aiRapsp3QkouWGh32yl0uGEht0pHXxh70kUY72Z313D1TUXDp5cFv2WmoqCh
         um0ZTHcC0Q4S/+tyvtlDTTL/cMmpjscCeJMwOSF+xykpdx0m7JTHUUkwLfp7hFRcXbuC
         G0s5xj64sNNJo++EQJ5l6lJ6FLy1Njg4Gii+YtCiHblqhELp+44ZtHw4eHpUtN2Drd5l
         j+uZpNjnm/dL2W52ZKLrlQJkAz5x62ERDcKAbHwcUKJ3NtT6++xOz3lQxXkDJvaDVjrB
         72yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiMOeIyXGl8v6koFfS+0SCwPn36njVXvdUUaDwTy8nGF460rHkruCxWkfkZd9baWHmO28FcN0OZaxcOI4j@vger.kernel.org
X-Gm-Message-State: AOJu0YxrEMC1yDsyChlNhT2g9txVr91BPwtScPpayxIMssry8wWulhjc
	NjZCaORZc8Y/XH2BMoL04bTJP2cItDRiEb870UYHcuytBloZm3/Kwtd3TvopgaIE4tH/QTaRUf9
	8guqk2690sjm8I5V/nENC+I0D+/DLpi/pMFsDEp2qyBIPIhlB9Y60lyOnMTZzUnnu5Kob
X-Gm-Gg: ASbGnct7JXveeDktCZPCADJnBG82vYBnhVk+YTYHxWoiy71SUxLgC56mwAJTdGwTHvQ
	jzCoUfXCVtcHnWzsN6HrtrVyF6kzylad8Rci+OpAGfu8LsJpGO1oTBuRRi50VrO6Whv0dJ5MhvG
	+cn8k5/spBhODA/w213P3Iw4LG1PfgkgZc6FgE5YkTfN9YnWoIShSpHJK25t9NbSuL+jGwdeE1P
	rAQQnYNwKoZU08ssRGFnmC2yhTMXoI3WVMHxjP4HID/6LuxEruqonCGWkQhqgdv2eVSkkKXXS0M
	Al1IkEcATbUDW7mGUm+qNQ6Rb2PaoTjfimf8fsSJKy9tcnJJEyz1lXYOhoOIjdTncV89GPR5O/m
	qggbea68fGk1zt9tTqfjH8A==
X-Received: by 2002:a05:6214:27c3:b0:7e3:3baa:961a with SMTP id 6a1803df08f44-7fc3a977b11mr70955246d6.3.1758883400013;
        Fri, 26 Sep 2025 03:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGVx19skRWQQlR8EDWFUgJT0cq0EvuBNJ2BsNp3bV9umJfPc4chZbhX8d3bAvp9/otYjBeqQ==
X-Received: by 2002:a05:6214:27c3:b0:7e3:3baa:961a with SMTP id 6a1803df08f44-7fc3a977b11mr70954016d6.3.1758883397116;
        Fri, 26 Sep 2025 03:43:17 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3b05779sm2734879a12.49.2025.09.26.03.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 03:43:16 -0700 (PDT)
Message-ID: <57be4253-485f-4a24-afc0-a25a3c33caa4@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:43:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans: add DT changes to enable MDSS1
 and DPU
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com>
 <nnvjazbxpywrmjnt67isba6m3ld6rqdaiid4qeczunmuablntz@vlbrjnxj5r2k>
 <d451f8f0-d2ab-44eb-bfcc-ec1e9dbba060@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d451f8f0-d2ab-44eb-bfcc-ec1e9dbba060@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _RS-q-bq24U0o2SvQET-OWSW0BDOMImB
X-Proofpoint-GUID: _RS-q-bq24U0o2SvQET-OWSW0BDOMImB
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d66e48 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=_fRLgir2w6SQuGl5B5EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX8NCcwem07EYa
 Ewz+mKszhfgMoMkHpNxBtknHUXhzROrrY7TISOz7+xjck+kIXHV0dCSmPQ+OOAn4IHQebM6ZN2i
 oddGg8XMelP1y5Ok6mEBqiFqCMrAnNeeaqYjCWdUcVJUlCuhE9mNGukXwv12K5EYqUy7O/Jy57q
 FlmmnWHvDfCjBBF0VVp0o6TZ8MaSHcf1NuQr3HowVXK+mVlnSEUHTIoNZ65LNmbhu8xO9c/4kTt
 8nPbob+M5gRw+E3l2PGKAmwf1CzKKTY2kPVpvz5q8D8PaBh5x8KZmdhsn3I3O3QnDwMEsy928wx
 VXS7Cb/EWv2Ue4S0tVGyJp5Ic21v7SCXTPGC3wiQyTAVL+9jKBbZiFxc+Wpdyw5eHWw2d0k+/9E
 5mEjWDt305jPEV4vfyVHUb10GGrmmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/26/25 11:24 AM, Mahadevan P wrote:
> 
> On 9/26/2025 3:11 AM, Dmitry Baryshkov wrote:
>> On Thu, Sep 25, 2025 at 02:28:07PM +0530, Mahadevan wrote:
>>> Add devicetree changes to enable second Mobile Display
>>> Subsystem (MDSS1) and its Display Processing Unit(DPU) for
>>> Qualcomm LEMANS platform.
>> No outputs? Should it be enabled on any of the devices?
> 
> Outputs  and enablement are include as part of this series:
> https://lore.kernel.org/all/20250926085956.2346179-1-quic_mkuntuma@quicinc.com/

Why send two very related and interdependent series separately?

It only makes it harder for the recipients to manage and track your
patches (there are ~100 emails flowing in daily, now more because
of recent SoC announcements)

Konrad


