Return-Path: <linux-arm-msm+bounces-64539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC3FB01921
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2D5A3A3980
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 10:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C232027FB19;
	Fri, 11 Jul 2025 10:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgVA7m81"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0A6A92E
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228062; cv=none; b=hO0JXp037hFoEyXtBXLDC4B03RW5ifn99o2wq+UNRbmSKhursqeD7orcbjmpzGbTg57ZpyzaYsLcVA85x1/AcWUzqWR1zohZ1hTiltGG7i+V3appizuvXo97P3qaDZta5fuAch4dD1Be4g6yUmaP+qyDcE7/8Rpdr7XvX+qoLqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228062; c=relaxed/simple;
	bh=zWLtanhvCIpSQaF+swneQUeYFWPTh5F4obnY4lrF7m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fb9yK+Ute/OoJrAjWkfe7tXoD4nfZp3VumNq/ISWEQfqsmQyX2iPA8sQkndbOUOmDoKKVoq4Ykd6mSYrbf+C6nnv834JVgJ5Sath4Mf8qUISRX9iqF3rbuRCw1fHw1i0QuUPFjWjZcigXls9n7dc6Op1Y89sq4sEHtknDFeDSb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgVA7m81; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XQZw004831
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=NgVA7m81R1L9A0Ki
	QNp4kFDi3N8DvO3qx9RAcYjs1jtC9/B+avlbDc1rtVhy9F3stierm1OKhJXjyvGW
	YdJRQ9sJZI2dq1voO32H+V90S5DBNkGEzMB+xaAjR/XUQqiqXKUbmfFIb4pfvmVg
	addsweOBBLqrhC+UeeNjdbg6BndSLotgYWOKAXr9XGGsXN938CxJNVJZZLif9/67
	bTDai8X5rgEivv0G/Ddbk30UzPRe6GPhQK07mI7NvCLN/vavWRbSaFIQIrbwsqW6
	eGBhsOpspzm7+h66u4RlX5bUzXbU/874gi2Q1I2OiV3jDc5IUlMIMm7Q1MkP6jwn
	rNhUlw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbp07gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:00:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3ea727700so31170085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 03:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228058; x=1752832858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=;
        b=F12O3ZORJ7o2jltFIy5lIMqYAupevtW2ge2n2cQszl5C/+Azg+B87Z5+JRr3yChy7F
         OW9kELAX4uMyDosTcuZZ0xgefviZTxiioAqW0YBnHkgkovJbvCBuai69hlzEcZDpQM/v
         DHDWLSsyuR5wm+UZ9Gjw3NQIdGCAarRr6gIbaoKkoon4MJRAvOk46lNyDqU+PH3CBcTg
         Bdq+9e7LDbzC5Kj40wJYxSQiLcMZ23dHepZYdiIRokeVFeWDRFhWL+4qOw3cnxywFngp
         s49e3XWwxhsoi0BtJv79AZIfYn1TSP808jSTlKKuOq1ePrXVNOF0inPlQwyolWupuLR1
         8hOg==
X-Forwarded-Encrypted: i=1; AJvYcCUDZpYkt7iSCanldKpNh5we/h/dYkCGvsrKIMg2TuLGp7d+cJoGw8AnfvRqun136neYYOpv81+9OJ2PZEHf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj5VXZ+HbLTL9gtcHp6M1v9u3nmVygdXUNp0+YOBbRl7lzXXsj
	5yGKDASsRP5zjNY+xfVrLIMCj+HY4MOd9oHDYVDlxAWZTSTX+4au0cglKw/mU5adjLHMe+LMn7y
	mzJ2NCOvp3jBFhNlg8MgnQ0Ov78Ymv+MFMW+8O6f1Oyh1b0//zp7d9J0nNN7DF7+rSqFF
X-Gm-Gg: ASbGncsxVfPh8TAus3yiHIrFmVF9/T2sXCJDtWVlfjn7n8MpOJt7dyaRf5pFQu9lQGt
	7U58IW+5jyrgepLShG+LnXU0G/N4TMp52tuFC34ulLupzVRTYbBn9WGSEQ8uxIFb4BugG/3X+56
	MHh4WvnRGdYxqQaQAFKTwckh+I5rm4OBHBaCygYB3HFB34ZitJH+qSsw1T4qGOPB/5BVqAtJ63p
	wqIYU96slMs66txRpXu1amTPWCm93oP5T6q8pjIHvzcAnmUBpxie+EX1R0jhA+DKIqcLneUSkKX
	aj+6dh9SF/XRO2J0sRpDIiZSZti/1lnrFgsOUXZtOtAYIWAbDBHUvgGHk4+0RnlNsUk+zLJN5pc
	N9v6FKkqO9gaEB50XCxBQ
X-Received: by 2002:a05:620a:198d:b0:7d3:c69e:e3b with SMTP id af79cd13be357-7ddec077b97mr142431085a.12.1752228058103;
        Fri, 11 Jul 2025 03:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLY0/uyOhHuHX1X9pWT4ZRBIdqoYlueRYMn0zZIdfXxI0Ouch9sgLT86MrHZruF7j7b5jRXQ==
X-Received: by 2002:a05:620a:198d:b0:7d3:c69e:e3b with SMTP id af79cd13be357-7ddec077b97mr142425885a.12.1752228057424;
        Fri, 11 Jul 2025 03:00:57 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82645c3sm274825766b.99.2025.07.11.03.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 03:00:43 -0700 (PDT)
Message-ID: <ee4fb01e-4fc4-4082-be96-3be22e1769e3@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij
 <linus.walleij@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
 <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MCBTYWx0ZWRfX2RU/gvGt1Njp
 nt3Pt9ct7LUnTywFJQZTsdbPutXCNcjs+Eb1bz5ySHN3mPgbO4inAmIma7SmX6fOD5NTWjv1mEg
 YNSXUrLrxA72nVrq0GoK5QvkMH9b2ar7EAdCLVVxK3TwomQzrhU71LL9yMn9Y21PSSQ18ZScjy2
 whheao4Cu132itqadl6ix9C9/I/A9rfcTSVRhrO3HOV+CXtP/mVsaYT9HWMCS2hKt5XQIjdKp5M
 psDWNSXKaASKaItNrDxbNl12lizfBJTEwqNpJviBqOub9qccoMs/wdM/qaUSM2uPya6rH/ZlH7w
 dj/UKULBKm4AvAW0lDcuLrHXkudyKyCyVt0vaQx+UaJTojfNV9KXJl+DAO+4GP1t1lt51VrymCl
 bY76qy6Z9M+ZG3DV6uUwnGNTrIswFmVHiHQn7r6lWV4WCk3xHCu8Q13nR4CiAuuNPm7DKErN
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=6870e0db cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=Lh8LEGs6nEvmLzq652MA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: TYqJINsPP_F8D69TsTm69aOYXonWLkq_
X-Proofpoint-GUID: TYqJINsPP_F8D69TsTm69aOYXonWLkq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=720 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110070

On 7/10/25 7:43 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

