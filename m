Return-Path: <linux-arm-msm+bounces-75060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82118B9EB54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 192ED1BC6EFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C1F2FB60B;
	Thu, 25 Sep 2025 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oX9j66kR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B062FABFC
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758796423; cv=none; b=NTDsTjhV/MfgFxSP8F4gzRJ3HGrji74InI6AaaiTQIpE7m+A8tUmj3HcZVjmYjnCTHvbzfin/JEET4j48O5A5zRBUA7FFHi50owG/zFglgXEalwrsA98H3nfjrKKkVIy9zyxGTO3BGFPprspEmOVxbpRx4Hk8ANFGzmtrIEiVXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758796423; c=relaxed/simple;
	bh=zej+0XcA4O/KYcb+DxmZqeXEO1sCOIfJbhlYjGA0ZhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7YV4/SpMmp5AH54K9lwLZJz5BLkPjWbdszz42KAf23badGZZOM1Z5fsZO4+5jljswFQQqMj5PKMi1TiWcMsPgI3ANAV6icn+gVVhBjGFEjwU0ZIiNaK8WWCdCE5t6yWBH2VDa4QYJGf1OP5+JoeNelwBCgzUUdu+TI7CTpoUqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oX9j66kR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9C3lQ021569
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFRsyLmJIufwOkTJA/XGc096S5ZP7JZFqnfjB1m0eAQ=; b=oX9j66kR0DA/C7uL
	WK94bNc7c3fmG5aGmUyB37OJkNWcMTJA9sDRcFMuoGcYYBLk0GZGb3d+np9si8RB
	05eIQhISocD1HBqn4685OBFFQ7Xo1NLPqa9SJgrqUb7G9HbGq0azdBq190HCyv9q
	JrQQ61iQsJDeqBTK2StKjNYDQBqQHBeXpu/aF/gK4qH85bXM/MxaDenO3uh5Ngld
	WyZGyzrxE/YkuXAGSGqP+CqgPE0fh0Y1fqVCtJXDxNUNxSwIDtg/Lk5UchEz/gWI
	sjo908l3SLgTjM+E/EKDghyCryQiB/hvEmPvXTZOwIWLK+Cntzqr5TF9fTnTWpgA
	ZKuuBw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budafb1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:33:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85696c12803so34762485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758796420; x=1759401220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFRsyLmJIufwOkTJA/XGc096S5ZP7JZFqnfjB1m0eAQ=;
        b=LV2y0lZVBvMb4osoRtR6YXzYDc89UHtrF+T5gLnmE8xd5vC9ofjVJ4eqp5idMX6IYH
         9IDTcKa0/yYtEFZJUIvC9nFadhkgpHDwwDsr74D2tldWwjouKA34QzQhng6YXLcbVLVv
         fkXh2zgxsPEvxPmuSsCoSvd/Og5WtKlK56GO05GSZUJlidhlhkNnVLFcMJTIOYJO4XdL
         XvYI7c71tKb4ryUTPr/r50RKbOcy2WDzf4S9ttLqzdvz6yOiWLs6BZSioMxGRGVOn7SI
         G9D787hm0ASEAbTWIFdh44BI2JpdCJWdpT67aFbv40dgcIwpRlIOsFFJrn8fmeCdjDXF
         k6kw==
X-Gm-Message-State: AOJu0YxnLJJym9m8bER/3poM8cL73VpUpCJFrj/iE9LfUE91DwM8yu2r
	gTOtOZeABpNkzgqqM2g2oC9Igc6YtgSS3bYV83ycP+iOVV6gQYTnDGqbHec8n73qv3w60fDgF4O
	nqyaOa+thgOJgMSv7mXWm70jw926ZUi88IqcRjf5EN0HOfDGg7F4zPzVtOFQjwIPoA31W
X-Gm-Gg: ASbGncvst/KXnosY0cxhY7PkEYVxzXpxprLeGxNhsThe90QSVL5OTKQ60dlkaZFxpGO
	vej2p1wJMRsidl0C4Do9S+HBUMjJOxLrdvMg68zKNC5wUFFST431niuHbHFQP4dvghGka1lk2E9
	7Fi9Q2cBHeh+Cj63Gr7bTCKupvs7bKiFkUBUbdimmWtkuqdkArBRyCfzC8xCvG4gtgETeET5JNy
	V+KbAwhEE6RncbcniJs3Y6sgP5BbUe/W/dlZHa76wxe5OllWr/6Zzlxqz+mmJ+8ynPRjGFE3+/9
	81a0BW+OPLOK33j5mvPSOXWUj+vkZFTB+K5YUPMoMbusYsgITmiqjhDs8UCwtBlGD2QKOxJUXI4
	OwFLuq6LPfdI7MPaXe50c4g==
X-Received: by 2002:a05:620a:7002:b0:84e:90fc:9bcf with SMTP id af79cd13be357-85adeb4c7d6mr258398385a.1.1758796419351;
        Thu, 25 Sep 2025 03:33:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHua7CpFGuTkLb23y689m09dwFCWAXFmDLjmnYAHIVDng1NKtA47v+/EAkxhQQoBdLLeIRjjg==
X-Received: by 2002:a05:620a:7002:b0:84e:90fc:9bcf with SMTP id af79cd13be357-85adeb4c7d6mr258396385a.1.1758796418723;
        Thu, 25 Sep 2025 03:33:38 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d11ecsm137737366b.21.2025.09.25.03.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 03:33:38 -0700 (PDT)
Message-ID: <3c886104-937f-4d2e-ade0-fd525d56dabc@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:33:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/24] arm64: dts: qcom: glymur: Add display clock
 controller device
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-22-24b601bbecc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-22-24b601bbecc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ULQnG_Rm4aBi-JFbW1PpLEAmpqJW_vUy
X-Proofpoint-ORIG-GUID: ULQnG_Rm4aBi-JFbW1PpLEAmpqJW_vUy
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d51a84 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KtVf0pUd8HSTWu7jDnYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX9UXOxZnue8RP
 2J4KyuRV/shfWFWDt6qmOWpAzcNtkRKfMnVjbBz6YyoSll7Gz919Ksz9lsG+WfcA7rX7I7MLoIF
 30LaG8iDYWNNoeAy31Fb5KFT5k9xfBQnel59Q7B34BLCHYbs6FGmI8G7lN7eQhZmbyztnO8KFdR
 Zdn/1f+jF3hFU3Rvcx9rtuBuC27QQzZltT52XEKambiaJPdO2lLnD3nunskdYwww0aHyMo62dx1
 vegIJUa723nTjJ/MHlr6DAsaTXZXoe9Wf/cqhnXVfmn73TZHDIp2cMj854yaOpwrdfFGuFSP4Kl
 Rv7tjItp/CQJ2nV2XVpWNISKgpLzePqFECSh71G38PDH6QKX2BOscV9v2+3cdOvTzK45oN1OxFD
 m6rT+qLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

On 9/25/25 8:32 AM, Pankaj Patil wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Support the display clock controller for GLYMUR SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

[...]

> +		dispcc: clock-controller@af00000 {
> +			compatible = "qcom,glymur-dispcc";
> +			reg = <0 0x0af00000 0 0x20000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&sleep_clk>,
> +				 <0>, /* dp0 */
> +				 <0>,
> +				 <0>, /* dp1 */
> +				 <0>,
> +				 <0>, /* dp2 */
> +				 <0>,
> +				 <0>, /* dp3 */
> +				 <0>,
> +				 <0>, /* dsi0 */
> +				 <0>,
> +				 <0>, /* dsi1 */
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_turbo>;

Really odd!

Konrad

