Return-Path: <linux-arm-msm+bounces-76943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C20FBD1FB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5EE224E2444
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 08:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EF72F1FD6;
	Mon, 13 Oct 2025 08:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXNudYia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6D4DF72
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760343461; cv=none; b=ebaN5SyzKGQ8l0yjGxGNXbL6ljvn8N0hwU4Rei2Vk4v1zUG9wS5fohIMjlAPI8Z5GRTyoUl4caC/Y93gk6K2nS5m66e/OdX1osPX8lsfMzVUpF9uNfhc6r/E+DT2HTZK5lYB48gj+hxD42yqvfbwDecDpwgygQSgtsLm4BR4d2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760343461; c=relaxed/simple;
	bh=SJhw5vhfYi8mELvzUY6nKX3txrFMIMqW1JgIFNGo4Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRZ02MUaTj3Q63k24v81Q1k6oQ8BrRle0QtDe6bA2RLLy0EDtGx0aHeCUPNAkgWqgzz9CESR4Ob6xxf1dDjwM5epLi90HcG6banRT8HP42RjddD6pi9jH8/GfuEokIo+6QoV2pqt+jxV80Pg/Izy2zadv0Nubc/knCL8kNqeMR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXNudYia; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nRca016980
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D/hSBO4JMIhm+VIzVQtzVCKQOqmVbVETrjuAEMt01aw=; b=oXNudYiavdEHYW6q
	Y7TlxCFzOBkWjTqdGsX+Lj1Ga3kli6kDrejuEt4jsmKwdXgac8vQ4vP27J4vW8O1
	KPeLWmCXXVB64DKVuhDuzNa51D7ydXy1psrHrxUV9QN1LmTFdyT5tbK+nM7yHgyv
	kGoGj1hYV9zF16G+IjEX+M3lq9NYtEzXuSVpupJ3hjQJjD9xfLZogGlF1/sA3srv
	lSBf4asJ8J6OIlCmXtSzP6gfv+DfyC9CkOUjIMrNuj+FdZPj1PTUzWVvDE1Eu1OE
	VKqmGtCVA/esLLSkhDYuMU9JVDUy3b6/i7mFVfLouXt8I6/KlIs53O+ZTW9CRSUT
	RKyOVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbhuspp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:17:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-853f011da26so282617385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760343457; x=1760948257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/hSBO4JMIhm+VIzVQtzVCKQOqmVbVETrjuAEMt01aw=;
        b=QGgHJa/WBm0Lv591u5CLx4f28ATDUTMlfEfjMK+aommC/gimAn0FKWwC9EVqV7zW4u
         03qiKw7IzB68LCzsyR+LkuwQ0Vozh4aZxRNqBTv8JMlCwFAdmPHVoECPgcQoHW2uLpo3
         G1EV74oIek4MhBaHVrY6harRYFQRC47tfFoG0jXBrNMcwOPZAA226qdJQMpnryuouvGp
         i1ncAFq84A1M/xnIJDGzTWL3w76gYyQyNJTI8pC2HNfsC/3Bx5bJeR4KET4kJKcp3le6
         tTJS8pMmMHZrvr74TCmOKLUSyLE1VW15iYh07EeeR1HJ9u8VYNlCRBfu4GTRtuGPIkus
         INwg==
X-Gm-Message-State: AOJu0YzuMb+FwQAYoi1rETwV/PgwdWC/l9/yM6I8n5i6iZPL50jAd4cs
	KIG3mqcL4PxNCoF33lxrLgS9/sGkwmILDzd/4uMItyKKYA9SgOgOpWAfdfu+PCdPoF38ya9EPww
	kEufAGnGhUcKRtJCJHSM0+OWfpKe0KRwWaQPI72MEal3zGx/w5VWuMF8T4of+OHfGERwI
X-Gm-Gg: ASbGncu+iXlwcY7v+2SwUp/GZ0SsLUdU0bUaXBeQFiqx5wNmMPlQnIJIwIvupV4gmo8
	B4M8tfdgI8QUdNpnQ/ZWlqdbilNVtHKi/pNaklCIMm0BnLJ469pi28bJ/5ktjHaR03UfP7a9jSz
	iJOet5PDdAW+uZlvJDWbWhPRTN5SMM1i6RZb581uIdov0OOJTrwTT/XWhWj1FoPnsqywpn5YF/G
	N35ot8x7/h4aO7VBVtU2tgzo0vIXRUfwpRiYlsROle67jdn1jf6dPQW6XNRfX7/VWg6771HTbtb
	scyhn7viqZJvkuFPD+MnW0yX+YEAsr6DIgKB0tZ+PeWeA9LLX36GM9ZWWg7kn8OMn8GyfzCmisp
	aH8kGwCPqBY4GJwDx+r927g==
X-Received: by 2002:a05:620a:4107:b0:827:d72a:7b45 with SMTP id af79cd13be357-883525c2e75mr1943378685a.12.1760343457512;
        Mon, 13 Oct 2025 01:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg1Cytc7cxncZGp15l962GuOIDaNAUKx773DxqnPs6dpbD1VJGCA2HzKR8IrepSdXmWy8rtA==
X-Received: by 2002:a05:620a:4107:b0:827:d72a:7b45 with SMTP id af79cd13be357-883525c2e75mr1943377285a.12.1760343457008;
        Mon, 13 Oct 2025 01:17:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12d2bsm881038366b.49.2025.10.13.01.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 01:17:36 -0700 (PDT)
Message-ID: <8554fb52-cbb1-4e5b-97a5-ca6979dc7729@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 10:17:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1-dell-thena: Add missing pinctrl
 for eDP HPD
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251012224706.14311-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251012224706.14311-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX3saszcDR/xik
 kZoUPzEWtlzBFW//21M532k7wWlOrU0ZkRnM/84KP2162TmX4tlyfTzlap5iPcNJGFueRIUMehK
 8ZcOS/OjyWuHN8QfbcwEhrcXji3JHxw4QeB5XzobbTULqSWX2BYL+mnzI1EH+1aRf+FAqhDwANK
 DR1fM4QErYWXtVNgLzAx4gE8GCv/5Yrf3q94p2J8h2IjLvkJrT6CJBlNTupAu0cjHM4dqkwea0N
 BQUzIp01+0TiuvDV36xgL9oC5thHPuFpGvnSFHH7LVGvb1ZXaJGPUm4pwF20bs+ixOoL/pQzAF6
 75W3p1fuIewshvMmjw5Hi5nNrwViXs2YyeGovHxYC9Y5G8r8fsGl3GdbOp99u90xioRsScYCSQP
 JooZYrVtywvlsVAleeNSt3ojUIJ05g==
X-Proofpoint-ORIG-GUID: mATWO2GanYuL-cKm9c55anYE-QvgcThi
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ecb5a2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=uNKBZDDHgDJNm4LnVW4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mATWO2GanYuL-cKm9c55anYE-QvgcThi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On 10/13/25 12:40 AM, Val Packett wrote:
> The commit a41d23142d87 ("arm64: dts: qcom: x1e80100-dell-xps13-9345:
> Add missing pinctrl for eDP HPD") has applied this change to a very
> similar machine, so apply it here too.

This is somewhat redundant and not very convincing as an opening
argument

> This allows us not to rely on the boot firmware to set up the pinctrl
> for the eDP HPD line of the internal display.

This in turn describes what the problem is and how the patch
alleviates it

Konrad

> 
> Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> v2: fixed commit msg style, pulled R-b
> v1: https://lore.kernel.org/all/20250927032330.21091-1-val@packett.cool/
> ---
>  arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> index ef83e87e1b7a..0aad80a1159c 100644
> --- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> @@ -1104,6 +1104,9 @@ &mdss_dp1_out {
>  &mdss_dp3 {
>  	/delete-property/ #sound-dai-cells;
>  
> +	pinctrl-0 = <&edp0_hpd_default>;
> +	pinctrl-names = "default";
> +
>  	status = "okay";
>  
>  	aux-bus {

