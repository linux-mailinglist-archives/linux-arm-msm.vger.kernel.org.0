Return-Path: <linux-arm-msm+bounces-68777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FA5B22736
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 761023B6546
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39401D6AA;
	Tue, 12 Aug 2025 12:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwwqwRSP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388AC28F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755002541; cv=none; b=qhyEPUVK5jmeUEJOV+FfwRKzslqlZiUVrzDFXtWASRaIJ32wDw12EB6xo8BzbG2AouYrNbt14DqVnpsjEDw4MB/0LQCnW2nuhNfWPPvPWdAMwc2pokWdQ3k1Mu3VVQzLHVTM7u5FDxvtB76mSNm3hzwAQZVtT4PTPRzhpZHQd8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755002541; c=relaxed/simple;
	bh=SgQjqMKBt7CJWaLMvJg19AhV102Y25Y0xPyg8I8J8aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZLZJyM91AGyH0jMal36Ea+5suDoEg7MQaGEDc8EZ76u5Z788AssWCzn3sjfpNXRmDKvDX/x4fGFVYHLbctWjb/3yFmKJSoZQmzBANte4LbEXmwUWYAQW18X+sDK4wY/B2n3nUaceZoYmSMT4xJticn4/KVuHVvYk4mn4r4Y5V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwwqwRSP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvgGa012378
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 12:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EB5A3Viw6Ds+mqLzJLs8Ml12
	bye1MT8yz9osTr/W+pY=; b=hwwqwRSPJbki84ihsFMw2BHE33luy/1jFHZoDc1t
	W+G58+AWEksnB3YJ6ZT4vBix187MAVToB+eMXElFkwsY6ncHetgDZBY+gpszgl+g
	yGfTWZ8RUm4akXC8ZAKRgwkK+8HvWzLi/w5vAi1gRGJhPcUrdNfbCbBENFJT3qe2
	K/IYAzRx0SV0okkdrbau43DzRldha9MxH5wgQPijFxouf/Qq5RTJxxVluZC3fbSG
	kRqnHsCCSA71oNma1RuzlojsBRBWJQxEHn4vDxXx+afBjvqjnBm2g0tsnGSjJoPM
	UaVlw0mBesAofOpCBX/0tMksxKrEaUxG4/dudQQmZ+jhRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv052t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 12:42:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e69a0a8bcbso1215020385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755002538; x=1755607338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EB5A3Viw6Ds+mqLzJLs8Ml12bye1MT8yz9osTr/W+pY=;
        b=khyvUJSNhK6fqZTKpKuUIs8cp6mglJMMhEB/YJWKR/F3jst5+kW3Y8dr+y3rQj5bo+
         4Guc21qpC5oDNv4dWUTQE3rbkGHGyqeric1iSE1rYdv/kT9USGSqOYoLKD8W0Y6skl4u
         VA8KqBju+lgv4VK4Sug+i8Kn5tFis9E8pNNasBgIEU2LrKhgMLzOnrMKhWKi1mEWtndD
         nymBZ815G+HFYU2YrVA+VIVX1tVeKDf4Jl/yp6REWQbsgWPzcDXgc3ZotHn+D94faZEy
         2mMvJ074OSMZbPSgvTkgDFgBlp4WWg3qsLKhvRUaDRCOvlhRo0v1LRgwIyhJkN+EPF6Z
         tX1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxb7Ny2CC1QaKbbFe6Xnt2e3UdYdnDb27mvBf3cA8ymZtYKi3a8h1eCGSsZG41cZmowC+o+qB5GjHJcC4q@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg+yhjaDyt5bVLYvpuzy3tmr6VgxeMyxdsnzzYdGlCNc/ea/C8
	jZ/WmDqpXDWCS6HhCYk2qUvYmpsyKQquQ9E3rHcbEtE5Ztdo23h8m1lQmURj9upy9JfzpzUGW3o
	lNnaAWxjcyxUMP00vIJO3gaQaxpko84yMGoGyTOAiNekJNDVKatQLXrzWsjpyTIom5ZPl
X-Gm-Gg: ASbGncshJL2Xdqa7FOtNX/R1zsChMBZ/Byv3/HNvuAbXz+B/RF3ixyLwNh+lT8XR9NT
	OzuIH7Ds2K9U0IaY1gGd/SKj9SaGTKF12jKtNRWvARWvhnJWfnycNi/t471x8gyLTHNoOMOHGEC
	qYcbOK5FPpozdk6A+29NY0Vm7yY+ODLE6b73ep+MBGMv6ISizeLtFT2UMHg4mF51yysF9nxMH/g
	4Kqf9hJp9lufRKz/mB/HAvfJVjz3DHWcnknJWDhNLaNoyZjxzArVFYG3QOjIx/XIa3TxHd8JO3I
	tF3wmgxtZHZ8xoOtfrE1K7C0HukaZ1u+VTRwFuMIoBuQ19RCr97K+KEkiYvxBbGXQpVvqagQPnf
	Edj80YD573TEog17D8ny/V7sNptYLucu63tqWUWCBTWtxv1e8TzDt
X-Received: by 2002:a05:6214:3016:b0:707:44b0:2d76 with SMTP id 6a1803df08f44-709d5eb5873mr42459456d6.37.1755002538277;
        Tue, 12 Aug 2025 05:42:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOgbYxP8lmbkd//5XN/QyyavN/KbzNNXgjBL+A0ZKtWNtx/5x9JoFKTTaNkf4QNt8EyMMYLQ==
X-Received: by 2002:a05:6214:3016:b0:707:44b0:2d76 with SMTP id 6a1803df08f44-709d5eb5873mr42459046d6.37.1755002537776;
        Tue, 12 Aug 2025 05:42:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cac6a3e06sm2834909e87.172.2025.08.12.05.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:42:16 -0700 (PDT)
Date: Tue, 12 Aug 2025 15:42:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Shuai Zhang <quic_shuaz@quicinc.com>, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_bt@quicinc.com
Subject: Re: [PATCH 1/4] driver: bluetooth: hci_qca: fix ssr fail when BT_EN
 is pulled up by hw
Message-ID: <tvnw7nxld5s3fa7c57apw3ppubpwa7kpvormbbqh7vawd3d6uw@go44tyl5f3hs>
References: <20250812113620.3135226-1-quic_shuaz@quicinc.com>
 <20250812113620.3135226-2-quic_shuaz@quicinc.com>
 <4ac0db96-8107-4809-8b13-580d75948ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ac0db96-8107-4809-8b13-580d75948ef9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689b36ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=s1kbfEM2HHd9KEI90ywA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: C4oC6_dHNhGQ5jllA9rCSmF7kAjsiUTD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXy9sBJBvMhTRg
 yxpXc0yK+C9Dt55rhe/E9XQZPvFjAK/I0+7V2VHyPz17nxCFbapJlO9R2ivco5v2sCnkpT3UavU
 pu47zRmFxx18MdCkHNFLKusRWNj/Y3rgIFofxvVTKdEf4B6wX93/qNeW8f6Lh4dD2xglnNGemh0
 u22Zb4wKnLO9I5aqFdjCtD+BfB6/XnVyS09wSr8DxEtmePE8sOcEGru4litoCMKoZdtLs3Z7gf5
 OZ/P+47E2gAjpM7Weoxx9oTzZycSzKYzlZNnm814/F2e8zW9OsDMjWQHKpzSRXibionLGvf9zQR
 yQ2lQBjWewz7MoW8pS0CBSuxoyKb9FiJROI9ifscxJq+sa39o+SwrzVTZAvN0+k5bDa4/yA5dOK
 vfLhBIci
X-Proofpoint-GUID: C4oC6_dHNhGQ5jllA9rCSmF7kAjsiUTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On Tue, Aug 12, 2025 at 02:36:24PM +0200, Konrad Dybcio wrote:
> On 8/12/25 1:36 PM, Shuai Zhang wrote:
> > When the host actively triggers SSR and collects coredump data,
> > the Bluetooth stack sends a reset command to the controller. However,due
> > to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
> > the reset command times out.
> > 
> > For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
> > commit: 740011cfe94859df8d05f5400d589a8693b095e7.
> > 
> > The change is placed under if (!HCI_QUIRK_NON_PERSISTENT_SETUP)
> > because this quirk is associated with BT_EN, and can be used to
> > determine whether BT_EN is present in the device tree (DTS).
> > 
> > Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> > ---
> 
> I have received this series two times, you didn't add a version
> prefix (make the next one v3 so as not to confuse the tooling), there
> is no changelog and you still haven't added the relevant people to CC.

To add more on top of that, there were already v1 and v2 several weeks
ago. Please make sure that your versioning is consistent and monothonic.

> Please read the internal guidelines at go/upstream and switch to using
> the b4 tool.

-- 
With best wishes
Dmitry

