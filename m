Return-Path: <linux-arm-msm+bounces-66927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E6B14134
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 19:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B8E518C13A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 17:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74E527603C;
	Mon, 28 Jul 2025 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndKoGrrT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7720527602F
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 17:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753723779; cv=none; b=MyfLiNTZJFmwVmFvUJ03acnzjg48CQ06xGzlpXOiw/+zEf2vbZ6h2unfZbMfFihs74WlxZcpnNRo5DXxrnX1TsadF+UM4N8yr2WoRv0UsJqKlfHAtBFucWymLyujN1aPwhpp2Bd/5bDxIQXqUuoTiNNYIeeuW22v9nO/NIk/dmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753723779; c=relaxed/simple;
	bh=28otr1PWkOxwqfxwLLylhjzkns3AMN2v2kaXHqkXC2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVQ5y6hfZWZbLoiL+FP8qpRo96MCj9IMGw9/gbw2BohJkGmr/rQc//4hrw3iSxJTjIGAQmNtWRtCx3ryoypPdJL5llWrCZ8VLgFjaaxIGBsWOEwtzIvOrd01nBMdX4YchItkzSkKt6fvtDCCXb+nZ6OlfhBX8+cQW/E1KMwQiNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndKoGrrT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlQxH031280
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 17:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	psaO0fhsKdZfRWyiSo8tAjmdJAZtx/Aq71yeJdW+1SU=; b=ndKoGrrTK4M7C3OK
	pJsr0X1o6iGXLpLdHSJMYA3nNmPMVy8YnfWcKsI0V24n8mRJ30912LCJ68cySYTA
	hfPm65aTNTTuYz4nCCQxJOMPy0k4FFTnNO6HsayVQT0wM8jz3cNItEyY5QZXP9Aq
	m6RXERo6e5UHBvGsmQcXeDtYn9NPlo+9anT9DJ5jzbKHnkoKJEQ8f2NPA/8BQR2f
	xAQDzWymlbnEoh7tvRyoLvSiUxLZx502nms9tzSHpOCnNN01lPqwdcpUFp0HtBmv
	n0dYC7pn2qe+tMIEQFxq1nMPi8UWO7Gv61+tIiWsbqKTGaKtDGdPjeLbUWZlKkZl
	5krA8g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xarey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 17:29:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so7403279a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 10:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753723771; x=1754328571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=psaO0fhsKdZfRWyiSo8tAjmdJAZtx/Aq71yeJdW+1SU=;
        b=w/P/WUpEXZX1LUN42Bcfz4e2PkHuBIx9E0eW46rGSBBx8IOCp+XPokR7FAM6d0/A4S
         Wpq3Jq/THP+R18MsDyAlHjQV6qaujYmG3XJD5drgl8QYjoBp5GuTAJJac+ATosJrHIpO
         H7NSiQ9DEFtJEVqPqEABwaRD8ofNwvcIHkPC5mnnA67TnRGZz9oNMZdTl8pA74w0Xinq
         GvVquYWdckhGnNHXF9/vGDqIvQA9DLBE+IWDAl3amjdVZEvmmxrcPzcBpPA8/JnQrqjF
         1Nh+2RoX8JVEIL4eG9hoC8czuCim0sHKV/jIed9NAt96EdD7JZrs2b3IppFigiTEwIVW
         GxxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoJIOQ5x/kHar9DKdqZSwlzIzsio4vzCU3fXJzwGI6TBoM2WSDluS9wNPsp7pk4qowGtIY2LEf7urg54/h@vger.kernel.org
X-Gm-Message-State: AOJu0YxHUDoMRXzVAGDJd4N01rZO3FPINVQxTA/s+QjknlrljfrKuORb
	sKWqgI5mni3MG+BTNTixUV2PQibXoSWWlPu/Xl1/HYIKDSVsv/B25E/wBPwrNf79VQwV72Rhc/Y
	svbtboYU/BF+ay5y88cHr9LDsFSCjOJUJWIbuPOPnDpQ0eIc3ncKLSQFt/XosRBPar2WZ
X-Gm-Gg: ASbGncsT9BzncNPn0Yme+Eki05UIstn/0p48vqKTY4OQNZU9dHSjKkKX6vR3JKfN/R2
	CZUB711xTTMAHfKH4U3wJNYtN4uSx+n+TYTuZ0o3W7yDoDaEzOFn+R7a63D+L0Q7q5094yPtxpl
	8kwD1Ay1OpL0B5lmcLSBRm2srLOUywz4kn4TwbWcprI22tQJx2F9fc7+/zOtogGQRkc5uXKzP+f
	Y3+HaA+BpK0WJpR4sH2FLV1mrguYh73eV6c1mvJmbPndEidbfuRoAqivnhNOfmjXCi9ZaCTEf2V
	MiQmRTM/1Yg1MwyrVehr3RqY1ezT4TntEA82lH9eiPCkkViYVAfSU1ZepdnBwjP1l9k=
X-Received: by 2002:a17:90b:5830:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-31e77a09df5mr14812095a91.3.1753723771404;
        Mon, 28 Jul 2025 10:29:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2TlcuOoZ/w9fSJKReXr19wg4i7BNBJ46J1r389MBi3VQRREXKv6EbL1QihQHnNxN6OtEqmw==
X-Received: by 2002:a17:90b:5830:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-31e77a09df5mr14812056a91.3.1753723770840;
        Mon, 28 Jul 2025 10:29:30 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.31.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e663a71fbsm10033869a91.35.2025.07.28.10.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 10:29:30 -0700 (PDT)
Message-ID: <713d1c82-6c48-484a-9995-2d7311cbf2fb@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 22:59:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: qcom: Document the Glymur TCSR
 Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
 <20250724-glymur_clock_controllers-v2-2-ab95c07002b4@oss.qualcomm.com>
 <20250725-chubby-spiked-tanuki-eefcd9@kuoka>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250725-chubby-spiked-tanuki-eefcd9@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEyNyBTYWx0ZWRfX4F8uGNaUyudc
 tKiL9i155dHdFgM1/ZgKRU95t9r/RklY8+xZ9bwJbWEIyODzLC9kACsldaKBON97k5nQHlUN0RU
 dd7q17xHpb2mYWCxNk8bVD8pGkgx1+ObqaF1HCFHV9SNZmIrqpv/TD2N8Il1EQ6pEe2OtAg8sbj
 rGcrb++QjBU2/UhAvWWRyR1NI2jw6rB528mcEZZajMA+RwYj2Dnl6eqqis+m+q4BIpY/1iFrv0N
 mRXw3aNRKJi5wJdyD6E8jQuqKTuZEAZk2PiT7K7zzAqN5my6VjPX2D8KQ0pg1N6yYM7ADq2rsZZ
 bsKucYzbjpFhUO3w+dHVbP6Yo3rPPh7LRW4yL6fHRN3FZAXvb1dTWwJuT9+2iqTm6YKGwh8NALG
 AA+7P9DWXf8+PzuvOuQ3NSf+GDwvsig0jMacjFXPWe+jWljtZUmNKiooYPk5GYM+jc6KCVJf
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6887b37c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6kochd2Oe038OFj2Hkel3A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=_CRzW6w8_PcMKYmKewAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: JdWgfbYh378l-RWxjoq8GhtYO_jJTOrm
X-Proofpoint-GUID: JdWgfbYh378l-RWxjoq8GhtYO_jJTOrm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=978 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280127



On 7/25/2025 1:19 PM, Krzysztof Kozlowski wrote:
> On Thu, Jul 24, 2025 at 02:59:10PM +0530, Taniya Das wrote:
>> Add documentation to support the Glymur Clock Controller, which is
> 
> What is "Glymur Clock Controller"? GCC? But this is TCSR? Please write
> accurate commit messages.
> 
>> necessary to provide a complete description of the clock control module.
> 
> That's redundant, just describe the hardware.
> 
Sure, will fix in the next patch.

-- 
Thanks,
Taniya Das


