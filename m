Return-Path: <linux-arm-msm+bounces-82642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A482C7315B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0DFA034C1C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A4F2F066A;
	Thu, 20 Nov 2025 09:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1ieVbFd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEFVSxVE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3D92D8DC2
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630355; cv=none; b=eWRcvkvlXeQLhUfRKaQgKW5smlAWKG2MUnfYxWujhXs8PRA4jU0cnc7KQEmwCQuF2fo9X9B+xZSsn9qXqYxhjP4C8UCRGMD3e23QCV5lA3quEWjiptiv8Ttil4Qofh0XdRzdh7ExVGm83L/MST1iDtUBbW4OiVQKQ99QQQCdkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630355; c=relaxed/simple;
	bh=UyX7+WnSlzwBD6fwru2796ZZzakiwq2UBqLBXE0aHl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d51KlxVzXm7HE2Hd20PODl6fdnEOl6iBq7OtbRV9mK9kgUMp71Av1RRjbz2e2S2P+8UHFf1ZH2yKf+8CwVBB1EAWGF4Oj2s0kx2oBTm27C1uG8iLAj7nNip3sDdFzmeXavgBcfDQ4c5L4IbRV+JPU4TZi06KUqT6msWAkmIEynI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1ieVbFd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEFVSxVE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK56XU04026462
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Jw7pqmsMMCuaf957Yn9KOXuQXh/kimrXDX+aOG5htU=; b=F1ieVbFdXsRbbAga
	odZaQChkmIjgOcqggekmcTgMjMXAiL574gFiLKDanvaywrw/ANXz5d6Lo2zr3iz1
	zsStdXeAoNzC+KsCsjI28ohXkdwBSa5NXUyJXF1+9xoq9jpLp2u12GqJx8x1ndXc
	QlBmoJTCo7NUU74onJshVxAa1NbjS2x1JrYPemnCMpq6W39IVM7RhXa/m2Q53GPv
	Cb1ZeQpX7VACRLRL7Gy6ExTpWmHK6ZVQXjzGMgw2nQjz1qMukBgBrrtdIibylfMC
	yTgy4nFvq1aORIZIKYguEDEKRQ95Vsp6PPNOf9RAujlnPnuSaWfNm0AXnhQzUJJo
	cnNusA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahvj3gqbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:19:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edace8bc76so1986681cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 01:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763630353; x=1764235153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Jw7pqmsMMCuaf957Yn9KOXuQXh/kimrXDX+aOG5htU=;
        b=kEFVSxVE2C4fsE+FeXZs6LGYZfh0JsTp4SK3G/dHPnjxhcWT1ZJcqlMBvtw35NveKc
         jXdvYyYo6Ta6bwHaFHNgbYQVTcMF0Kx6Hcqm/D98a4NLeOTtg4D4RC1WEf3sdHxR4m1d
         raRzzvwBlRtAfZnEdkJWjnCg/Lbyt6QicwJzsbL7WfLpvN0Gj9EYPqgrMi1OnOiI3gnF
         k1E6pu1wDXFfu7t9gFuSsW/XtU2QLOFaJxf6JRb6dsHqrlqCcais7ddlI2Xzx5wLpnZC
         8g7Tk6x0fGmE78uYA65v/me+v8jiCUTUokb/Nm9IdUZQ+oDFdFY30GOV279KZLtXaHw/
         t/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630353; x=1764235153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Jw7pqmsMMCuaf957Yn9KOXuQXh/kimrXDX+aOG5htU=;
        b=no9TpKAu8tdUZ8GccBoriL4cAa6MInWQTzJVpi+t2d3+x5VV83MPh49i3UJQKn92L4
         l4elxs2OcXRVtNXGpPyFtOtXAe01U8DBLU+5UoIAs7NKg0IjYmRZIYESdAhDcL/zu9CM
         NgC2zsxGI/gz3jwckG9EHi1h3ytyOW1GsymxHPYTzt+QLB0v0tGGCsJ7/zmW/qwTIm77
         ojpIAXoVXkuaUGwPLl2NluisKZu4+wSkZVNXzjYix07N0ZqiZRU6qeI3zZVJ1AMAkRlo
         Dlrw9AShhtVFMVp29Kc9gbJc7utEKhLxnmoTz4uOfpu66w26JVzfXcigTIyjrZDWQCdr
         hlJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5yzQNroIB6ebacPlF7eLKaasw8pcqr+5QbUsFqc41G2CMEPEUc7zZZAUJ6Ts3s6jjWLVp6rjyG9Laippe@vger.kernel.org
X-Gm-Message-State: AOJu0YzT1p/0U0VK7u5b7WzHdhJKKO2bjaPrjtSRwyGcYvSq1WgUVG9L
	vOWCFYsRpBsuSXsh895v5EMUy+lrN8+aNwAgA0nXvEx6H1Tlwdelz6jlrcVtXYFNjhhmqlbb6HH
	AkI3Nf5UyzThVLhZ7jkYDJ0aFZdUd+owfQ4HmXbmUsRxH9VDw8Ek+ME+b4iJlqIg7+lhq
X-Gm-Gg: ASbGnctZyF0oh9dQxqMaDTgP8NXD7f8IyFjQDEtgGFSImQgwf+b0+UF02E6wUNymKSj
	DxEqGhCE9tZutgYc+BgSEHMbURaLtgl363jULqwNEtBqFWwD1As8bd0wolzyNXPFPQowsNFvh/o
	wT/m/1is+H/ufxOAr7iS8d143L1gayKFJ58+Ydx5fIm4/yGuEjgVER0H80bltkm272YSAnElg2V
	K1DALVg7L4QeV2pvIwUrL30ASH3mGbwcDgJ0XbIhFfpCKs1o3FqOHHhp9nANwY/6h+P6bo2vStd
	tQopG574yhBMRJI1L0Jxdjcma2mg1+VC+o83i1L13EfsN1bkuYQhO2ojiWY8Gv8vK6OclpPBz3P
	S4IMgJYFvzJB0LR671ruHJgT4TH1wES6UFRnJ2G4h8dCHPudnxvSEFl2B/Cj+pf27PSg=
X-Received: by 2002:a05:622a:199a:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ee4949c9cbmr20965051cf.5.1763630352815;
        Thu, 20 Nov 2025 01:19:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXSpqdI2wMetO3hFEXX9ez/5oxr0gnpZj3ElAiNw6gp7oyMrtGOdyujf7/H5/PzN+wmgouYg==
X-Received: by 2002:a05:622a:199a:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ee4949c9cbmr20964901cf.5.1763630352373;
        Thu, 20 Nov 2025 01:19:12 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459e61sm1636749a12.32.2025.11.20.01.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:19:11 -0800 (PST)
Message-ID: <2f18ba6b-ff82-4c6f-8a6d-154886dafd48@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:19:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Use BRANCH_HALT_DELAY for UFS
 PHY symbol
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251119-gcc_ufs_phy_clk_branch_delay-v1-1-292c3e40b8c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251119-gcc_ufs_phy_clk_branch_delay-v1-1-292c3e40b8c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J8WnLQnS c=1 sm=1 tr=0 ts=691edd11 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZwrQQgbAbSsAXhscLloA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: -pyoLc1KjX2YQNemGhZWD2N-LJBS_F0M
X-Proofpoint-ORIG-GUID: -pyoLc1KjX2YQNemGhZWD2N-LJBS_F0M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1NSBTYWx0ZWRfX8fvthczNI5wc
 wVZeFhVDk7kf+w/P/jDoY51kwusQG8kvB1a6fK0JvsG8LfT0E4IQq8cqgfQ6BYMDw+oinDpcFNA
 7PvjrW7I89Msd/QA02iah+23l43LAxCorVV6n8HLxShV/ga+yx2a4pnt5rc+cAlUvVrWUyvPJQg
 UMfY4Om4aObYFxEaWFyNOfD8dFANH4WRivF0a2xcYFJELiqwQYPQhoQaTF3bSPzXI1shaO9/Y79
 vXQwY0Z5EG38h2+Q1ppMuhFth2oTxvJc9jFb00r8qln6wLMBtIYGyJS/RV0JKycTzmF/Ycpz+mD
 HI+dPckcJSZ6dESVN8F8JqojOKCYeitWIPk8gcViEhfpxq4KexlHwfPxWAeg2cC5USZM/cW+kqj
 Oluf7tyKm0A4hV0FWf40Q3f0tXHy7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200055

On 11/19/25 6:53 PM, Taniya Das wrote:
> Switch the halt_check method from BRANCH_HALT to BRANCH_HALT_DELAY for
> gcc_ufs_phy_rx_symbol_0_clk, gcc_ufs_phy_rx_symbol_1_clk, and
> gcc_ufs_phy_tx_symbol_0_clk. These clocks are externally sourced and do
> not require polling for halt status.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

