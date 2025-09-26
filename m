Return-Path: <linux-arm-msm+bounces-75352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50313BA5590
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 00:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C0161B251CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 22:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A3528851C;
	Fri, 26 Sep 2025 22:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQiNTdtY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8E8275B16
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 22:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758926210; cv=none; b=ecMc91ZCW8tc6pB9x7GJGccgX7XWYyGkS1oJMvHHAoS1Bvx8xg6gpetlqHnOpMDWLY1x+sUoduFKmZSFLXPXHsHmKKqf48cOsVLDHLTjq9qsoBjMjoOLMQzMqeNu3KyxHluRlihHycfVrWatSG6tjb2WIBOVfbaLKcHp5K+7lig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758926210; c=relaxed/simple;
	bh=LtDarIZoiT8w0O5sJbCrOHrzGdFAgoPYvGGnch7FhWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfawZyoKh17IymG/wSI/B8naZF6qgeJBcsHYVRHXP/7bVWZIqBT21TZ0Ss0kbO+i2cZ871S3stE15SR/6SmcJCz0hILRcEPDBcITcujZakdwryuarL00C9j8K87l7Q3UAVkpevCYgskSZfXvDYC1yZdZa9VhVxPUMWqf05TBHzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQiNTdtY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWqbD016059
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 22:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZLSUvcCXErFMAa2Q2lMIRtHl
	4lWxdH0fa1UAKAdTCQI=; b=CQiNTdtY95/oqBY14jdxzCB/FODcD14EBxyK92e9
	pYgq7LkBwEWHJECiVY9S5MBspcP7Hr1XpT66Qd5ElEeoRiFhNu5W83wLIYG8KDTn
	1CsI/9TQfPEvvRcXVeXoFYvbYsXgWSYvxhC/Pq6AUZangYhEYcmJT9ccCRPfzcba
	OjLezSP5ux8960lM6KZ9cPs9Sa4gyFkfDgnQRia0wrNjrsD5A3ciD+Ij4BBSHolD
	G0vWer46rUVY+9bAv/hfnHo+VdtVRRR77QOSfspIT9M3pnnlw4Mo6CBxdQguQZqd
	N3PbZ6xEz5WEq6IwNGX2njmSa3+V7ommfa/dChqPwQOC+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tvatj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 22:36:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de801c1446so18422751cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 15:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758926207; x=1759531007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLSUvcCXErFMAa2Q2lMIRtHl4lWxdH0fa1UAKAdTCQI=;
        b=VhnAZ7UQjh0toCvQg91JADAW0cLspgfvxvnLgT4Z1SNWm8qyIp9YrAAGKszhsAYM/X
         FaulGQK+sm4K/Y0J9no+Z3y+j4KAf3n5FAR6mSFQEEA3tIxTObwFeK/gVfHtNPnEtTl7
         J4RX1m7YdtbJng9L6h6RQuZ5iOFP9VGHKcwHk5dAIv2HoheWmbqc8XoEpVYpIUX12jNM
         7NsV0yd023itWG22YChblDDdYRz7pgzct1tptJ27n6XnQW7yC+CqmZuurzB29JHGN7Pt
         B9PiWMfTOuahlkzZTUhi1kF2C2ELxvjiuHdRmpvb8gxyX77J4yBxCZ493ktidM2n0sas
         d+rg==
X-Forwarded-Encrypted: i=1; AJvYcCUZbiutQfTQbMr3zZYZgPExrrobHORG365ERD+oEDFXlDxHH2+JxpRfqgXg7wKOVq82QSImpCrPNWn/2I+9@vger.kernel.org
X-Gm-Message-State: AOJu0YwtR59Ixq0LI5jzLxPX2b01nLfTUjli3bBvdzXXuivgLml/RU9Q
	ZNP3JF466aR0m88qlqThHxH1calU5wizAD3H9IIiu0a3O84Tx4/YPCjafS5Y29epVpXROfAMez2
	zeOmAdvtDkeAG4jCWG2/0PNANXeDvJ8IJ2ti58hhxheOpZxv5WoRUprx0jQQ5Ic9V3wk4
X-Gm-Gg: ASbGncv/QTa9fI+baq60TVPd2nALzygjyP0NPd3FA3G6pBQpFrkdmfsfg+waoIxLEFV
	dDFsTPBiQBjP3IFIFBlAfVmHuYNvH3AcGuk+Kr1E+oL11j5DMFmix6F7nnfC7T3ts0Ud/WItFDY
	ZutXWVvK0r4YOYEkRUS1PGRlPjYHhEpVFpxQwhISdQ1LfRWRI3+N7JMuNg+3HCyNk9mZZM5VcLZ
	uHUkJX5KIz2NhK8Jd8LeAvjWPiVILOnR1H6w8He+fM4/iIkGDZL0xtGePBiclaNhMadTEJs+Y8e
	NaauyCYFvAax48zJbvGJoyPrc5OjE/aFL9jrSKFi/JPg/c47jgdMO7nEOaGWb3BOv2BR69AtP3F
	glxVgYIWBV90bq5bH2iTiYFdoQeTn4kZnkF0+zEPdzrgIr+kgbYWY
X-Received: by 2002:a05:622a:a956:10b0:4b4:8dfb:33c3 with SMTP id d75a77b69052e-4dae3c29955mr91817591cf.59.1758926207264;
        Fri, 26 Sep 2025 15:36:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbe1wxhgonW447Fgu4TmABd4aTg5zyqFc7Zo18GRYrwhFmA693k/yaZQWV+62ImRcaYWFxNw==
X-Received: by 2002:a05:622a:a956:10b0:4b4:8dfb:33c3 with SMTP id d75a77b69052e-4dae3c29955mr91817311cf.59.1758926206763;
        Fri, 26 Sep 2025 15:36:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316656973sm2136641e87.89.2025.09.26.15.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 15:36:44 -0700 (PDT)
Date: Sat, 27 Sep 2025 01:36:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v8 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <of4bwtpgxib3emdltnnlzy74yips4znmjy37hzdljhssikt37q@m6guijrjuxpt>
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d71580 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=fvgdV2PV7z-sFcuOFeoA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CtRI9vlNN6OzIen8VqdGiNAEtJEKKcB4
X-Proofpoint-ORIG-GUID: CtRI9vlNN6OzIen8VqdGiNAEtJEKKcB4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX036BG37uOSLv
 xfUQ6wjz/frLdjv70g3b59BJziYc5N1P9A9Y8EnSOiV0E2jmTwmSICclVy0NoZJD9U/KKWad0W6
 8abAFS5dVconEa9nLIrxKnnd/V36azqyqjlE3QQU78B8kQEouZ1Cwr+Q59osK46pkZVFW8MTr5Q
 jnCGbXqp0wS8CpzWXbg5F2fLucbfrHhYU7tUNkjMUdU/cotptnE2S7Lkx0hh1eiNSGaaMwV+cF+
 xzBK3aF1Gq8JZyg7My0cTP8biI7qKxAQDPgV0U572kUIktbGy42h6iv1MJ6/3T5rPsvdkKOQCz0
 c42AEiANG6cGfVuAHBCqx8CPP4RNdjLL5Bvg7cNG24kmIBUO350TmkZoh0Ikv4XgSThidbQEf83
 R7TOigceNwRO9vLqc/1nubs7GKq1fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 05:30:35PM +0530, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

