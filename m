Return-Path: <linux-arm-msm+bounces-74101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CCEB860B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 18:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DEF03ADEC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 16:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4E53176F8;
	Thu, 18 Sep 2025 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ES7HGXdQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B41F2FDC59
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 16:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758213084; cv=none; b=l6HGOdqNvODGkQNaDKIjs/pe4I8DEjCX7wOy6e7KgNTdx//Q5uu8NapXzmVem7EvqWi3Jf7P5S4FEgDHFm4yQCAxmbRzNk3CA8F85Z1txfSpEbTE55xbVxRAnl/era7mZ8KS6g7LbGuTXG37aAi4mb0LfyjeNlLlSX6zdE+t2/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758213084; c=relaxed/simple;
	bh=qCwN4UWf/qO87rnIbDuNnYXQZL556aOSgTuDK2FYCBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BioM545p1SEdpHofEkZyVbu2HpLJIaYAHkj6h5l2ykXsz+403BzdgubMZ47E/MTUFBHznYc1Rz919MepgJ9CdKfZZlMPGGMaRmF0KDWE05kGmFDaF0Aa/s4blG52T/jMmKY2jPmHgQFP4fHqql346DJrfNtK130heAW42Ogv5xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ES7HGXdQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IBHhbQ010750
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 16:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qCwN4UWf/qO87rnIbDuNnYXQZL556aOSgTuDK2FYCBc=; b=ES7HGXdQdiFxaJtg
	k2xDRMr62o8gqivC38tQpTwBe+ZOt1P2zvyqNsevxfkNhaIBpH4oc2G2/boJue72
	ijz11mbcgLUV+vnu22JUSDW0U2RbLYxVuu1aZm3sLJivpHUSz4t/ARsCpSUjIrN1
	DRqSzYpInBkK3E0aLzlcENMpSNE70PBX0tdVbFH2Gqq6fv4qzRw79kZ+c6I6BA1K
	7pDsUxQEMt90/FdLXUTxhcerWuyvAfd1dJv5fqMIZZqgD6hrFwi07SxJ/nZiKnuF
	M+4LSnv59bV5dlVuf15ToLzlfhcCmUiHWB30F+EnwZV7SpGW4l7yrE+S6s5CoGOb
	jpveqg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxy430-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 16:31:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-329b750757aso1013092a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758213081; x=1758817881;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCwN4UWf/qO87rnIbDuNnYXQZL556aOSgTuDK2FYCBc=;
        b=OJv3hE8iXzn8mzVbjaoqWPWp0VfU564ZxcjDAGnLaNJmNzS29oPSjQRxZ9XYr7K8V5
         P5Xb9dqJHRTndR00AsG5dJBcDAxyzfXZC8fKdCfhnr/n/+fP0aCv17Bon7TMP2SR2v+F
         paftY894QN7HjkNgWwdC4Rf86Hfau/Lq3qxeRssl206dgmWIyrvQbk6hbMeUWhIbt4R3
         B/ZWSBpvvFRy89GtfviQIt51ZJweg5TYk2RLx7K13EAYqQeUeBX7duNpDB79KsSW7LF5
         +wRBQ/sgB2BZs6Ih4z2EHnnIJ0RaieLhRmXM+R0+j0vMiEB+BIqArgDEES7ju5gy7fk4
         rD2A==
X-Forwarded-Encrypted: i=1; AJvYcCXGXZct4jb5AEF/jruBxeWXQk+05QJ8YoW4/mTQLxjn+x0JHu9XfUo7iIcqBHaO4LKPQkSB2DsiTFBLeaEZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzD0r20CzYAkg93b9nLtZFpon/hz8qpycFfug5tRnGH8jypr8E3
	9IqSKlxNXBoLPSXmpvV3xA9n+Diyx/8IWj+AsbSmO8sJHLv2wVQw2zYputcgnhqDynnyohOj1IC
	6RtAE8k2BAug4M312Y75YgXlJ9r41R1t1TR38PFgsMs378htDPtJeRfxsWcv/WPoCAuV7P+DNIr
	mx
X-Gm-Gg: ASbGnctEmJBuhBVpO32LWryAn9smOycs7fwSNOWFZGJkCXqx6K29JWA8QhRlpyR8xr9
	NbOw+9W+YabC/VygyHwzY/wUphTgyx7J+jjyQlejrJkio8b69BoC+IL4S0K1dy84TUpnZYMFllR
	9lGexSuoxz7UKR8p56pH0pJAAvaKhUBw2WZPzKTEnL33Qqox88kbiE2tKgnMSDOoIWKUMeYDqRX
	/aWWCy/07/49Zv2PLY22wbaJsEA2WVOBLMJmwcytAAgAq7DyfnrJa9cXwl11nbeOy8OISaH1eRQ
	xRJoJueqsaClytr7D8acb2GmLz4ohiN/p1t5NquiXeHEZFRN+fEJrK4aeXhsYoGktT97bRjZVGY
	AhIjdALPniBDAPUmRQfdOiIiJ
X-Received: by 2002:a17:90b:1f84:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-32ee3ef7071mr9571436a91.15.1758213080970;
        Thu, 18 Sep 2025 09:31:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5Bzu9IzjWAIb1ykdrkuMpLZlLBm0S0xGZhC2cExjcG46jsKIRUC4NyJocWI+6wpsHTHQ7Yg==
X-Received: by 2002:a17:90b:1f84:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-32ee3ef7071mr9571379a91.15.1758213080410;
        Thu, 18 Sep 2025 09:31:20 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff447060sm2685889a12.53.2025.09.18.09.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 09:31:19 -0700 (PDT)
Message-ID: <e8d283aa-fb73-45d6-a89a-54ff31f205c8@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 09:31:18 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] wifi: ath12k: enforce CPU-endian format for all
 QMI
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250918085406.2049559-1-alexander.wilhelm@westermo.com>
 <20250918085406.2049559-5-alexander.wilhelm@westermo.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250918085406.2049559-5-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX0dr+QyYaTC0R
 s2uMz0k7BlzZEAyEpyqa2VghyD0c5FiO9mjH2rSG6rWmAfUhZdPvtnCZC6uLe8e41TQTwE7oKTp
 64NwjpXEmer7cdoCw3lZjT+xVZ5LXaE9mhLak6qiccM9z5aMb4BSpyU3UE1kGBuqtC6nWQjKmD/
 01XHtaRvNCiPisNRUJjD8aGdhXhDrGCwzkoYwswhkbrGztqur8Q4tgttDM9qGTWbBFYgWLKHbwY
 7zJJc4HrQzQBifdeWdaMHFIUQJK5+ssyxFfA46Sl/P6QXGn0KhfkJm7rtOAT/qzI1EP/dt14ulB
 n8EsnUgIMI3YCi0sRGlOEPoPG7Dqh4pcd/sh8hU5481ghwkgj7Mr2POBNtgBJ17Uc8mizDYfg9f
 tHmsgokr
X-Proofpoint-ORIG-GUID: 7KYy82IJwApFVLDcZ_rOACfMuUoZPdgP
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cc33da cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=msdzb5vn4zVyWyR8mUoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 7KYy82IJwApFVLDcZ_rOACfMuUoZPdgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/18/2025 1:53 AM, Alexander Wilhelm wrote:
> Due to internal endianness handling within the QMI subsystem, all QMI
> requests and responses must now be provided in CPU byte order. Replace all
> QMI-related data types with CPU-endian types and add the necessary
> conversions to ensure correct interpretation across architectures.

I think you can break this out into a separate patch, but reword in a manner
that doesn't indicate any dependency upon your series (it can be a predecessor)

You can do that by noting:
1) currently (before your series) the QMI interface only works on LE systems
because of how it encodes and decodes the data
2) however almost all QMI data structures did NOT use endianess-specific types
for the data structures
3) the ath12k structs being modified are exceptions
4) the QMI interfaces are being modified to support BE, and that modification
requires the QMI data structures to actually be in CPU order
5) So change the two ath12k QMI struct which currently use endianess-specific
types
6) This change will work correctly with existing kernels (which only support
LE) and will also work on future kernels where BE support is added.

Then I can take this patch separately from the QMI changes.

/jeff


