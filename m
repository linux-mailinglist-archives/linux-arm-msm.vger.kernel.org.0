Return-Path: <linux-arm-msm+bounces-55770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5C2A9D2FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 22:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C67C11C00726
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB742221DA4;
	Fri, 25 Apr 2025 20:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jL9cDEwV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C682218AAB
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 20:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745612986; cv=none; b=SBLL0PwHBkUt/fu5w55L8PDMbhPf7ip0Qf5a0Wxb4EnXvk07WKUoyczE10igQu7bZzzLcWg/vUtqiyTyeRo09kMt4u5G/kg8e9LNKIwbgZLodv1R/TqD26soAz5DkgXnHH6ioyJ2cgluKiyslrZTB73RPPaLsshGvSO1cypo1Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745612986; c=relaxed/simple;
	bh=HQOXavJqDDNcxestJosnarQtEyp/wYkfQfX7kBoRVfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HwAxNteWUR9bkMMUkxJ/pPMPH1tCRV7/R651rNP5A2nsfclaxIzIUaxVY65urDKJDJX51utrFQhkEDbGqhAGQkLajg5ESrMrlYwcQbsSyWwIahHLwWCL5sELn4oHLKgvAeOjp4iSIAu41Qtm3+ZBXoBTNsYBeaVBdJ8Q0cvUERk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jL9cDEwV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrN2004016
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 20:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QQBvshjoO46a+foT6NAfUQZSlYX8diC7N7dcT1bHR/0=; b=jL9cDEwV0BlHZgDH
	/q71xNpEJxvQh0SixNDnCh+qHVx/9qXo/+S4u1cY8wnYLsLp124ZOnAKKue2YwVN
	beA14LgEXdy4y7OpubDcB90M8GQ2tQHX2FIN54Ze2/mPYW4GmT7SI5OFYLzF3ha4
	2nfHb9eR6R7KNJ+AjFyHXCerrs3oF6w6B0jeytKD6GskzKhjT2xvEFtcA+NYkCV+
	tHmmaJYKZ3xiL8dsbPrJqGHIJwtPNIsdbF7uZIMib2mKDZKl8ZDr4N2tWeyboD2G
	bznqpu5I5aUBPy0RQZMLqc2xNojcc+QeM6NvcOeidfUVWQnJ5HoXf78AgSMl/+2i
	MBnK3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2aa0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 20:29:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7789335f7so14552685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 13:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745612983; x=1746217783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQBvshjoO46a+foT6NAfUQZSlYX8diC7N7dcT1bHR/0=;
        b=iaCVx1vt2HKm4uz6LmDGhBulFtE//hytA9MTOqNl8dtPhLAf6w4RMs5vD7Ntzk5WQq
         4B3TbnX5LlgR3OtVIu9dcYNF+Zq5IR4z1G7Up+ObMFD+l7Wf9xWf1Dn2XxYpa+0a4gFt
         AasoQ0mLjLio8iDcuDYpuLqx2NKhShLOWl5boeSoiLuiPiWd5YZ0N77i18fGIfxXToHt
         TFDhJMmr//XyUOG65jJLA8NsxgIO86tohSCOmeCkfsFogSwEh/SQNGkfaYtSmBUtT+6F
         ua67hzn4tHto6v7Y/g5bDqBNcEHooNVRA2fvvXc70gCWkoliceTRPdXFvK6AQTdfC4qi
         18wQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3hoRTLuX+hdJMTsKDyd6WKPn+00QuKfDlsjr5r2A9NNPlPfChrtrgpqjI0QMCW/4+pr4ypJO5pdrQ0Eg5@vger.kernel.org
X-Gm-Message-State: AOJu0YzN5l7U8g/BiRO3eQiLJbZQVYfbqgXGC4tQcNb/0hE0ueFBQSsL
	dR1zGNA6mb+JzoaaCGmhEgjVV2kqt+IWa9yeISankq4B0/ybnVvlLLBDJxwLoRAZC6Edt0zLUOB
	+JwWjPfbKrLHZq9+pTuyKrOYFCZqh6/ayfeVqP7zsCMkuZ5GTCO1jCSMaKUaS1ypWINad90LC
X-Gm-Gg: ASbGncv4uJWcEVBeL1fSZQh22mCui5Wy/Tbmb+nEaeHZMRAmN3098/TU6tc3bJ+55bA
	gIGrpZG8iGfUfV7KYVosKacezPuUTkxbtVPbja+AW7ypvB12D+jYOjO6Q3Z5sq+Z3Y3IjF9LjBN
	ikMVpVrOG1pL/pBasY/uWQtuBdN598eb7Io5T/tL0rbxcgcEnVq2VNZ9OiZfuyfiqvIsGlJ+Vqu
	eU4+dqd6nFzS220N6u3PMZXQw3opELAZKAJZFX/IpVZpDwA5vyNnaJ/U0KBeUZu8nnE+w9+xY+U
	qw6aiBhr3L6/HN3bsanwYPzWaThdqadzaoMHeo1ZjAhjT+30x4l/uYnUZHUoNJHyG7Y=
X-Received: by 2002:a05:620a:2907:b0:7c3:e399:3289 with SMTP id af79cd13be357-7c9607027e7mr190059285a.4.1745612983072;
        Fri, 25 Apr 2025 13:29:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFAGDEdWKjfRDkqRp/Tjoi5DhaLxxMVp2ON8LwC2p+2GTY0B+a8uhwaJcDJ2BW4Q/qkxJNPw==
X-Received: by 2002:a05:620a:2907:b0:7c3:e399:3289 with SMTP id af79cd13be357-7c9607027e7mr190057985a.4.1745612982610;
        Fri, 25 Apr 2025 13:29:42 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6eda7a0esm183777266b.163.2025.04.25.13.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:29:42 -0700 (PDT)
Message-ID: <40aed2f4-ec33-4087-8245-7c4acf861387@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:29:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
To: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-7-gokul.sriram.p@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417061245.497803-7-gokul.sriram.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680bf0b8 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=osemwfdWNkGZlHKaPu0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0a54kk8daGgn0jC-TrYYJRCIpifek1lt
X-Proofpoint-ORIG-GUID: 0a54kk8daGgn0jC-TrYYJRCIpifek1lt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0NiBTYWx0ZWRfX4aX0FfLXTGsF 0uKRiuraSqflWNaGjAYzgpQLGbNcObERLN7KJUoI20569gCu4YE38XzHEM1sXcMY6U6nEB1pV40 0q7d2CJGElXtn+NXVM/MY89BSu0AbmhprvZh0wuAL1DTMFnK3iuwpFfMHXEaOSwXWyJuu4iAXEc
 nRzhUHmfNYYz1ZRBxGlWSkQXTvZxhiEVmJCjiwtEYf6Y6QLHc881peB9CR5ltOoI88n3Ep3nvkj gqn8NKen5cSp+LTVSs0H5OGxY968ilNBN5eYlNhIBQ4nipIdjxWSyQCF6fxFG9vre+qzmaj/IXl /HEBde/0eu8IapRyrh1uIweqWZwNu+7lTXDj5CP2y67/i4bC25EwgfqEErAQMQPHidmSiz0KyDk
 QcjNXuTSAlPpVh7JrIxOALPymf23TVSBghYysgCfSroW/D55RlfB/9qxZKjBn47mwG+leLdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=710
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250146

On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> ---

[...]

> +		q6v5_wcss: remoteproc@cd00000 {
> +			compatible = "qcom,ipq9574-wcss-sec-pil";
> +			reg = <0x0cd00000 0x4040>;

0x10_000-long

> +			firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
> +			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
> +					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
> +					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
> +					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack";
> +
> +			qcom,smem-states = <&smp2p_wcss_out 1>,
> +					   <&smp2p_wcss_out 0>;
> +			qcom,smem-state-names = "stop",
> +						"shutdown";
> +			memory-region = <&q6_region>;
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;

Shouldn't this be 323?

Konrad

