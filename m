Return-Path: <linux-arm-msm+bounces-42204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C699F1B3C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 01:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ABB816B342
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 00:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD47B64A;
	Sat, 14 Dec 2024 00:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2M2UW1B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B24F4E2
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 00:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734134785; cv=none; b=JDhDPfTVGVK3VYa3XoQZUSl8nQDmU+3kwwnVWiyUoshr3NyrLf81We9cjgo8TvZg6QYe5Yef2MEihfOxzDcH7qbZ4guRUi9vUYuTZ310jtHEELCZWKF+VK7QdHawTTChpcP4f11y+qgsEiq7BZfvRT6FsfDvf+MtQZMNgpLJmVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734134785; c=relaxed/simple;
	bh=oVdrsM4iSvcVVv59Bq/l3kQZnH2DqSvqGHtaO/V5qFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuZs0iRLzkc1vS9I51rUytX5Y5WDL9Wy5f5jaLZtYgbmwTCfpwWM609S/YZaycFg1gBNKj/8THqkWCteEFOvepZOs0ZDL2dJOvbXf2MZUVmDyyTKkswzV1QQhttx5j81+NyiayMo4JUSSqY1wgxeTU9SAfiWsrTWP7EddUZPxZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2M2UW1B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BE00ZcL030152
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 00:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URnOAD7B5WVB2bgpEbRPQyjpSOPc3nHHY920y5f2ebw=; b=M2M2UW1BxPSxaQvb
	anPmbJygF25tMadYTvtItwsBMrlje+k3Xj3EssS7xtfo5wSOWMGTCB2PLLPN4LNa
	tIcTUXlsAxhhqycAACh99VIENndA4K2+e074DMMsdc8gX0MhRshkoej2hO6CScMr
	OE9V16amVfGnvrBVfEhVi+h1HAZT8HKNr2BjLAxUEJnIDoala3dXKJyu45y7Ggw9
	+eWGdfH2aux2n3sDa8r7fG5aXRJqw46tUP/KSyTjf8lOxqK4AMsAeQt3vfWycnos
	8dPnk3GFNoRXRwb46ncs31h3NpDKAvAj08D469Z3hu+9/AeuXdci3LkfzflDLHn0
	sLrOfA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgena27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 00:06:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d880eea0a1so6322286d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:06:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734134780; x=1734739580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URnOAD7B5WVB2bgpEbRPQyjpSOPc3nHHY920y5f2ebw=;
        b=tX27+xlGYq/ep4C+GBBbj8PdwlzzYugFRQheuYn+KUWIJk+3TdaZhMiV58MOndpULW
         dsNj5NWb6gGQKGd+oXSUPi3iRI6XqeTuP1Os0EBKeOI2So3LY6bxtJqA10QTZf8iF27X
         /mlwvQ0DZIWFIdilTKjUwez0L6NGpoOHwW5XVirVywtIBy9RwOTlh7uTR8mussFMozQU
         Sla35UV8dN/QAkuEjr4ToWpZE/0aeSmjsmYn92BvxThmPhwp6bsZf507jbefRdZK480z
         0uPvJvJqi6PaDyHO+60hiAG30se3A4HG2ajrP2gARwD5sbuK7NAxtquaXq4yWRlCSezW
         qRvA==
X-Forwarded-Encrypted: i=1; AJvYcCWftaxIdYmSwQrcNCSM9KoCBo0psTjzKeufxkkafZ38B5AKBnCF5E6NjRKTkNqdRWOVEmWscCTwCYav+OV7@vger.kernel.org
X-Gm-Message-State: AOJu0YwKq0mMWGpVphPH2s4IggKmBZ7950xl9nRi+t8JYvQf3bw50ft4
	9er8f+4Pjfq8nPjpL7xIusgU9WK1vqnXWiLSGx6X3IoZ2qn47J8HsyxTODr23WJ4RkoiF+phGHX
	QXzp0Z0Ub9SQWZrdOYMoOjQgL6TlXEFqBfaAx2RpTd/xcaACDDH8Z5gU1fm5N6kL5
X-Gm-Gg: ASbGncshIyN3lOPAWIWTZk4VjNowoeQgRtTlF9kks6mzVtzzFsjdJX1R4jWPKUBgRtg
	gjGwaCshi8So566Ey7wG4S+gUF7yAttRcLXVm9WlVPhcxhz8lHBciV8A3Sb31tVCXPpCRmCSrYg
	kWn7vn6pfd9tOkemGQyRduGa8JecwNDM8p2K/7mBcAWJjrUsj3bJ2Dmw5guER9BsSP7TRJXWg+Q
	mOKN581QlDLQn5EZRKUWCjMUq/1RLtXr6/Wy48PY5/kB9RD1pACMbjed/1eC7bAYltuG5Fg/9rF
	HZw9AYEmgsg/1WX0U8t5iNHOhBy1sGPInn4=
X-Received: by 2002:a05:6214:3002:b0:6d8:e5f4:b972 with SMTP id 6a1803df08f44-6dc8ca4047fmr28201936d6.3.1734134780407;
        Fri, 13 Dec 2024 16:06:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4vD7vPLzQ4aG18YUkHITmORVt4lbdTdCFofhZWV8MLNWse7WmiAnMO0rpcbotPtBwqo6Ceg==
X-Received: by 2002:a05:6214:3002:b0:6d8:e5f4:b972 with SMTP id 6a1803df08f44-6dc8ca4047fmr28201686d6.3.1734134780057;
        Fri, 13 Dec 2024 16:06:20 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963b33bbsm25855866b.196.2024.12.13.16.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 16:06:18 -0800 (PST)
Message-ID: <6e9c4ebc-c52e-47ee-b3a5-570e84125e42@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 01:06:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/19] arm64: dts: qcom: Disable USB U1/U2 entry for
 SA8775P
To: Prashanth K <quic_prashk@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org
References: <20241213095237.1409174-1-quic_prashk@quicinc.com>
 <20241213095237.1409174-9-quic_prashk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213095237.1409174-9-quic_prashk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 71qxojMDxrv4vBg1fhrIinhUrQv2eJ5o
X-Proofpoint-ORIG-GUID: 71qxojMDxrv4vBg1fhrIinhUrQv2eJ5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=519 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130172

On 13.12.2024 10:52 AM, Prashanth K wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Disable U1 and U2 power-saving states to improve stability of USB.
> These low-power link states, designed to reduce power consumption
> during idle periods, can cause issues in latency-sensitive or high
> throughput use cases. Over the years, some of the issues seen are
> as follows:
> 
> 1. In device mode of operation, when UVC is active, enabling U1/U2
> is sometimes causing packets drops due to delay in entry/exit of
> intermittent these low power states. These packet drops are often
> reflected as missed isochronous transfers, as the controller wasn't
> able to send packet in that microframe interval and hence glitches
> are seen on the final transmitted video output.
> 
> 2. On QCS6490-Rb3Gen2 Vision kit, ADB connection is heavily unstable
> when U1/U2 is enabled. Often when link enters U2, there is a re-
> enumeration seen and device is unusable for many use cases.
> 
> 3. On QCS8300/QCS9100, it is observed that when Link enters U2, when
> the cable is disconnected and reconnected to host PC in HS, there
> is no link status change interrupt seen and the plug-in in HS doesn't
> show up a bus reset and enumeration failure happens.
> 
> Disabling these intermittent power states enhances device stability
> without affecting power usage.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
> ---

[...]

>  
> @@ -3570,6 +3576,8 @@ tcsr_mutex: hwlock@1f40000 {
>  			compatible = "qcom,tcsr-mutex";
>  			reg = <0x0 0x01f40000 0x0 0x20000>;
>  			#hwlock-cells = <1>;
> +				snps,dis-u1-entry-quirk;
> +				snps,dis-u2-entry-quirk;

Oh?

Konrad

