Return-Path: <linux-arm-msm+bounces-83755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5900CC91CC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D27E3343375
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF8630F547;
	Fri, 28 Nov 2025 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmPToKsq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCON7uAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D554305E2E
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764329634; cv=none; b=uXVHxA2R+mBSehwk8rhGe+KAK0mgnVDWCYuX9YazbNf9OFfS6O7CVEKwGxKH8Gvffe5+JvCkw2oif+8sf0MDulHnMQev7WDo70c2IIUOmSf9fNkMx4c8Ke8PJyP39W3GM289Ircxlxe+2bgyidiKI2AfnzMK2gBQ0OlhK7NeddE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764329634; c=relaxed/simple;
	bh=4kkSnxG+m4digg/hpRN0h8Q83kFbQ1ZkOzxmrXAtCho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ajbw85s4h27xTtnK8eHY9XScOBhoNnLzZ2Ga1zoGSg5CGiRtJF+1Wq4m9cG970VmJFbWl1o3jRNsYQOVS/XW/uqpl81qxqoZGUVbLeWLx3cxyvM0UMorrQpeEln590RvKHW9Y6s6VUy2L1x0ZhRYERUnkrDeKbwy4M5NWyl2YNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmPToKsq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCON7uAB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8Or3o3621368
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qnvNSY6l++wxUOc+tnXplCDf2RQMm05JLxYRX0NE3g=; b=XmPToKsq0oXNIpqI
	7Yf5m2W21ST2sprPwUrM1+9VN10j54OxR5nNbsI8sy6bTu5C6ypGRDKejX8dUmOj
	3RyiBA5o4/ehca6ZhXTNNjeqGpfkrg5V/b2EaCvtCRqcXqFrQ7zkn3JTD44qM4cc
	ePh4aID3mdqwHokjA8Yz0Dcw3KqJTLRG4mJzU2tvPRkaqJTJyCOtNOpLIW/zFff1
	H4E+Q5LfqWUW0eymcItPMkiPiNYNAhUpgyuf57r9RiwRAiw0UkvjUnSiLk/Zz+lM
	D+kbD/iyeOEIQUvCDkUwfg4QpHoo1aQE6UCIMvBMIGKGxZ5wzO6tx1lNTQOEPhLE
	A08ICw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjdb7b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:33:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b1be0fdfe1so59675985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764329631; x=1764934431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7qnvNSY6l++wxUOc+tnXplCDf2RQMm05JLxYRX0NE3g=;
        b=BCON7uABfMYmcp9/SH63/n+bO4yHQBHNpwpI4RtT6P8Dxypj36yOIRk/+TL3QlxQ2h
         ljyBZVpxWxxO/wjCtwOPfTDLY879NC3IxPLXLSxqsbaboB7m4yNhUTRfvm14djlGhk0l
         jP4eR7hFacSM7FpwpyXXtdL7SdgxLwBMlu1rqLUOvSejSWDFJ7CQC8TCThJDouW3QuR8
         8c0403mOwp4+Q4zYLyK9/inYBfMxOuxDUDKBnAtgppL9vC11k/zKlZ/rEecBA/SyaJC6
         D8fKYuk16wUCt/eAEe+dgyJs+VbFIFDWX2U77M/mdpawz/dRprvdM9GmF1s+xo+0NR5r
         PCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764329631; x=1764934431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qnvNSY6l++wxUOc+tnXplCDf2RQMm05JLxYRX0NE3g=;
        b=pHnqqVTlJ3IteMMHtE35zBmen/rzWiFBQZ5CWJccvbcOjzDEHRDet23dXbLNTK3Yyx
         BLZ8u0Ay/M5W5ImSuL90HgHU2I0aEV9LxLGK6VanSI9HGJow6eehO+duJE78I90CE8i/
         4pAvnuIvn76pxOb8DUryYcd5jxuvDkrwHkxUzGKRmuasK/+U4v5evF21vnkwpBlCllcX
         ms4fPknJ09i5kUogMqzBe/zyGZRQ4h2CeWA7SKmoE4Ua7X4UedfBQTPg9wrih3zchaec
         zEYHUKIMQIty/6QNqFkY3qMuJWX8XDM3svgcnIugh2YRn6fryhGrzSOoDx8/3houTnV9
         qHBQ==
X-Gm-Message-State: AOJu0YwpGcpExh1hgfMzenoCQm0J9xci11DS9jGEDEyq81TlCTrOpZI0
	mpxAyOH7tCoH+398QXAC+tmOX7WJYHTHwS8xpzu03xAL7tJ5mLmuHQFac06441LN5ELrzjUIykE
	ePo/wxmIn1VqrbQhnn+Sb/YYQrRKNrDaHht8Oz7VxQTpuPbmtrNj/scoP5rsbpIQvoOq0
X-Gm-Gg: ASbGncsut35XBzMD3uMLEaybag7Y8YtHNsxc4LC5NscNW2N6+0OKAAjwua3XPBSWuVc
	maw2nOoPYq3Go/JSMxMiQasoJcQrU9gqhMvU8J9liJXBRt/6ydYZz3ZkNlm3vvHPbHSMin7QuoX
	O1vwy0LPXzpemLWbK4mDFTtmJ1AuRcBWzlbnr2jvpU+pjwT0bNf5k1621K2mobizGEBUJ0P+pnf
	ZcQa0G0Btjv50MKQuizEFtX/4/qw6FdZE8AiZEqKyl4BKgZwZvt/P127WU9Y3VLZCLx3KUKJOLz
	w+IXNnS8DecuQDWvNWxNqNQvD9Z1VFNiQ+CqLo5znoeuhc84vxMxlvZqbQsiQwV2/KgWzFj8Rnx
	5BdjRG8EMSacCK8XxwBy9f2u52GQWr5y0jQBcGd4Q1Ez8svDCO7gwSh9I1bu8XBB52h8=
X-Received: by 2002:a05:620a:1a24:b0:8b2:1f04:f8b with SMTP id af79cd13be357-8b341d19712mr2575207585a.6.1764329630764;
        Fri, 28 Nov 2025 03:33:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEv8S6uIv+QwZ60lOKqrI5e0iazvmdLm3BRp5BRT5DnpNRUvlat/SlDud2WU9guvzLSXUU/g==
X-Received: by 2002:a05:620a:1a24:b0:8b2:1f04:f8b with SMTP id af79cd13be357-8b341d19712mr2575203685a.6.1764329630342;
        Fri, 28 Nov 2025 03:33:50 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035c2fsm4119499a12.17.2025.11.28.03.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:33:49 -0800 (PST)
Message-ID: <2edea260-076f-46a0-b2f4-cd4193011167@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:33:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: flag sleep clock as critical
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251128-ipq5018-sleep-clk-fix-v1-1-6f4b75ec336c@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-ipq5018-sleep-clk-fix-v1-1-6f4b75ec336c@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l29-UhgY-PiYFjVvoA5hPBf30uI5GXj9
X-Proofpoint-ORIG-GUID: l29-UhgY-PiYFjVvoA5hPBf30uI5GXj9
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=6929889f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=yoN80CkuiwKY9Z6PWDQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4NCBTYWx0ZWRfX0FQ02ByPRqt/
 KLlSOFuiUSs/9eaS5wsufooriOWLQzB8+IpqZouSmyUzdYaGgDLEllcPTSUGfRG9rdUmJ53Uisn
 HP8pW4j4g/wGBFex3IndnwAk4infE9WOjSNxM5IZPNsFHJtYOk20VZvJO36v7pYeAKUlJntkZWX
 VR6L4N1coDb156Vc+Bt4LjcNLU6CF7QMw9abSqGAm5/CL+tB6iqTwN56V+Qfuxnj3cM47+NnNtd
 jl5bfnxiCmt3sLZhBZdUdz4LXBnv7lDwwQeFtpaj7Zuafi2xXcO2T//PdLHGa+6daWgO3DbBY02
 1yX1GvLlvhGwLfEMS+P+KMN0Ewqex5XZD2iMcujg2Ypwigs41wmUfKYU9feHIyTVHcBNqffjVk4
 qnyCtOFcPw8RbejCXXQ0i1P94VwtOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280084

On 11/28/25 12:03 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The sleep clock never be disabled. To avoid the kernel trying to disable
> it and keep it always on, flag it as critical.
> 
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

