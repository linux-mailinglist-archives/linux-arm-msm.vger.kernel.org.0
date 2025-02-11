Return-Path: <linux-arm-msm+bounces-47610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7BFA30FD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 16:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 413B53A1CA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 15:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FC8250C12;
	Tue, 11 Feb 2025 15:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z8rw2wrr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16C61F55ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287892; cv=none; b=b4ZiTh8oZhVGqzanM8QjiHMBjEANqpppekG/LDKAwIyvOLNNj6n87Ioxl30H8/91e5mCJlWgEFI10ih/cSSULyD04DheQNjBH1npsTcYDGIRu2rLSXqHCrO1UVkO+dMco6wwKAGkeAbp1lWInh5zE+6BS0Sp8Kwlxd8fyspqa4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287892; c=relaxed/simple;
	bh=Bg6Nt+8C5j+0uyXnIEaKjL/2chmotYRWBmv2M/smtRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XR9hbHNTjE3uBQXBdUJXdoX7jx/wB1+DkH7a9krMmGgQuAlrhUZDKYr4/uuhToeICZYHG8+Vb4vMRmSZerpkM6FusTfnxLv5NxdXGnY6LZqvecUVyJbrQJO8VLYR00iL2IXNylS+BDYL6wepg4CSjd97OzL1ZLHXmYKURD9mcc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z8rw2wrr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BCawuW030244
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 15:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e5OySbyHguqdotrWL0HqWl8v1uqJmDtsgQTUaTpXBA4=; b=Z8rw2wrr0KDm8cSJ
	ORCU/NYvMIkBYjf5RynZfJaS0XWWbhWC80QIPlRTooZeu9p2V+foeMyt1kPKcojq
	EdB+qoLgglyaE0RKi0mRRf1ECPbW3BmXv+rzq3gMZRWiKYrufIYzjJUaWzNTshB7
	oAt+jQAG9ra3IPNdpr1+dL8Vui6oNMxkA+B7MfyoIO08/bRI1ChYtWbi5WSq4HdY
	UrqFTVl3TGoQCsb8985zmCyhPaVSR90lbFTFZddNGobB95T+3yuWnwCeDNEc6O0y
	j3YWcJ8FdZkt0PpglcQx3X4MAeeJ3YOsfiVtmrSpPolw5kMX+JYFWQGgg39vDMfe
	ZMMFKA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxg9hwce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 15:31:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4718cb6689eso5508651cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 07:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739287889; x=1739892689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e5OySbyHguqdotrWL0HqWl8v1uqJmDtsgQTUaTpXBA4=;
        b=eTmWD1rqQkW4EqYqfE4AcKUZGwRkOGj7glQigyqTBZt8NTnGSya/XF7KyPhtPSX+kN
         ybj+0aFVKD7jL6OVbsrAikwMS5OLblg2Lrp0uo/oQrxoNgBptdrsaC26dRS0SjfEMZSE
         wcXwH+VXHc7MqQp9b2AoF5HbL7rCRaKgdgl6tbbHZ+qRiHnBmmUVDImG/M45FH1eFEIc
         c9uCW8ReeprVP5/8O1bkdn18DApcVgeAs3QukCGT2bwj+MCaDcb5zbsZ6S4SlSwTuHC1
         I7+DiQZ56o0pbe9bIi+Tj9+jGNABfg2osLbyH/iqlCK0/m17r3SGjX+8CNmBbpjb1S9f
         Qqjw==
X-Forwarded-Encrypted: i=1; AJvYcCXfEyP7wJZIAOWuFwanE4InwhSaKwnOVL/b1oh9/fbd/2IEIgIcoGdsddzL7XuRI1wINfEe1lj8EsMB85/p@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2qMJtB/4UD3M0FtiHtPcdztrl3g9o4WLVB/LuShsM4TsgyZjV
	bmLf7uKWkoOx4n9/wJWvCCiApQVlk3ZLD5msWRHmsmLgFzmPl1iskVR14X5ogH2KplTwZof4NPj
	riUqiAj76ZTjoYB9+IMY3umCodUOjLWFtsu6E/qvtQalMrb2w41MKdhyA9ydjAhIu
X-Gm-Gg: ASbGncuTM/n2AKIXho8n8/dD4wg3HBScQJslPje9WH9ZXOsLb5qMKb5k3G9u9hZWE0P
	tEhdHAHsszK51U+gI1g3//VnHxEtBrYM90G19YrIF2NUlRFF8Ez4EhR5dWikTdJopCld5ixKT5d
	UeY5Aawxfz0ObyBoSQmzzKNz4/k/NxylTx9Jf1dhsrfidwXUnHXGWZG2jv8x6a1m92Zw+VrsERK
	rgF4iIT2Z9P35bim6W8Ia5tKXRIIfomX8LYa4Nw8+D/FsJeF4f+gfcShGNo/UsWaM75NIvmjZ9t
	Uu0X1PidJrN7uEHiDVqAezO/hfUNwlIN3dp7wGVkXu7/LZ8IyRzlX+A2CeE=
X-Received: by 2002:ac8:5913:0:b0:46e:12fc:500f with SMTP id d75a77b69052e-471a38eb6a1mr15565921cf.0.1739287888728;
        Tue, 11 Feb 2025 07:31:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7FgJZnYB4h/Q3ta0guw1kWk+ay0aXvWhv0/ehdh20wsL+3hNZVueDiuf0CB+w+LhrMUtPNA==
X-Received: by 2002:ac8:5913:0:b0:46e:12fc:500f with SMTP id d75a77b69052e-471a38eb6a1mr15565691cf.0.1739287888319;
        Tue, 11 Feb 2025 07:31:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d72ae04fsm209952066b.46.2025.02.11.07.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:31:27 -0800 (PST)
Message-ID: <93a1bdf9-52a3-4dc2-a2cc-28f34b7ee0b5@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 16:31:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 7/7] arm64: dts: qcom: sa8775p: Add CPU OPP tables to
 scale DDR/L3
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
References: <20250205182743.915-1-quic_rlaggysh@quicinc.com>
 <20250205182743.915-8-quic_rlaggysh@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250205182743.915-8-quic_rlaggysh@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qls-6jneeN4alvu915WVDB-mpYbp4hfW
X-Proofpoint-GUID: qls-6jneeN4alvu915WVDB-mpYbp4hfW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=932 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110104

On 5.02.2025 7:27 PM, Raviteja Laggyshetty wrote:
> From: Jagadeesh Kona <quic_jkona@quicinc.com>
> 
> Add OPP tables required to scale DDR and L3 per freq-domain
> on SA8775P platform.
> 
> If a single OPP table is used for both CPU domains, then
> _allocate_opp_table() won't be invoked for CPU4 but instead
> CPU4 will be added as device under the CPU0 OPP table. Due
> to this, dev_pm_opp_of_find_icc_paths() won't be invoked for
> CPU4 device and hence CPU4 won't be able to independently scale
> it's interconnects. Both CPU0 and CPU4 devices will scale the
> same ICC path which can lead to one device overwriting the BW
> vote placed by other device. Hence CPU0 and CPU4 require separate
> OPP tables to allow independent scaling of DDR and L3 frequencies
> for each CPU domain, with the final DDR and L3 frequencies being
> an aggregate of both.
> 
> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> ---

[...]

> +	cpu0_opp_table: opp-table-cpu0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		cpu0_opp_1267mhz: opp-1267200000 {

Drop the labels, they're not needed anywhere

> +			opp-hz = /bits/ 64 <1267200000>;
> +			opp-peak-kBps = <6220800 29491200>;

(921600 * 32) etc. to reflect the clock rate, please

Konrad

