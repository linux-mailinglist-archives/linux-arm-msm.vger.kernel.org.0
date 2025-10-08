Return-Path: <linux-arm-msm+bounces-76384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3A4BC4A3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CF3B19E1645
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931652F6166;
	Wed,  8 Oct 2025 11:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maqMwvrP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258C12EC542
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 11:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759924547; cv=none; b=C9z+OcfgYD+r/b7jT0F+4c86y2OARypRxAHLXbO3Be1Y9W3lrbrcrrTZCYDTk9YPfwiTBejBnyZBokh2Bd9lvJuC1r4zEpbZO/fsVQXWtPibCUvv3gV56eZ88pD2ty1jdgbT397RFN+ZKBQc7vt/JxZTYY/z3db8d+Nkx2Es3Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759924547; c=relaxed/simple;
	bh=lzKibfEwcgq9ZCr8yG0Yc2sdc7f61txnd2gsqpO1nqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYfN/nyTMhD2Wgx/IYed7YF2ew4hDOuzxQ5JeOlVFGjaD18zZBeieQq5gMqn+JmisktOtE++ToUva5hvmWmrn9FAliop83EdByI+713jTB32lHaR1uSViQBhFTLNwmqvow4rQ3lo9Tslkig49A0vKSi/YH4F6IdaYEx48ROUVL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maqMwvrP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890NxT028748
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 11:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	is4ONlRs15AvSM+w6vGZwSp+0+G+NrjYHHMxgCstEs0=; b=maqMwvrPXDPQLR1h
	PsZqdH+9wtzKQkon+whG0xm6+74TxTDygaIHxF+wklHOtBeTH9Vu7xmQfxjT9iuu
	W71b8z2ol1hHRssAl7Wjh5NSK3rnT/vLugyyXxVzeWlBVdP0b9rxNcouP0LR1Ahg
	3kyFjG2EDj38td6Em8/qSoJqRkYt5HqubCEAGfPI9lzPD769ANCTpdnYm1DsZr39
	FptnGDbW5u5uXMSf2CSIVbuk92Exk5k0i61EOZisO4zgkDt1vqw/HaIjxtyfcSAh
	Wt6TPthsWqBBsAWJAKDUGRf8CzbQ368lv8JZqDdxX7NQpgcE1GzSau3Hg/9uZKzT
	xnTr2w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9e2fsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:55:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b60968d52a1so12834022a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759924544; x=1760529344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=is4ONlRs15AvSM+w6vGZwSp+0+G+NrjYHHMxgCstEs0=;
        b=acK8/t5D6MbeGS7H62VAGSkVzYlZbcaZcwTTeCK9rcNd9iHcl5EVy51lnnc2RstuXv
         HcW1Jm8gPQsxe+YfEMVU3nQoFG7a0fE0PshQOsSQFYfdjqtLm3QjBaOVSiFUcwEC90uJ
         6i/bIEIpbjBpkocgppGPzU1tw0DlVfdINQ+nQxbBzcgi1QWIrZdONmta/ySBiXzyLPxG
         aGgbStg+VSOt63Dqtjq2bNpdfHGgBLcSdudAjrheySdeaa4BaUjIwNzrEPguEE+LlBIx
         //Af0N4JQSwYnZveqm6q/v3UCQSYGC0SMAQ09NKggmgMF21OMSJ63aoSdtwm3Z431B13
         3cWw==
X-Gm-Message-State: AOJu0YwF3To7PxM0/TnrzhisLgVgWJLjJ5ZLutdeLZuysKHJ92D0+Xlv
	n+VIC7xSFlQlZMZXklEupyNXAcAecFUEno7Wt1gG4c23SkAy7RodTvEh6QlYyFMC045I4W3lSeZ
	+uKnC2aKf4LgwXmfqSsObj/3mxG3sG3w/pKk079Nk1lxKufArK6ROwFpITwBEmMz01MBV
X-Gm-Gg: ASbGncsfnKs6yhhDaifvWD3JAY1qX8dxiykVBAWuLvA7YqBcn7rruMx6bRLNm3EmRFr
	UCiRB07zSg/QV0bOYVlT4SGDrjs8VPkc2AGM+AhdWmKvxMHiVUtYY/7te+NDlcQF/pFe3KKsQoT
	cq80Xvz8+xaRzr0MLflaDKJW87TzQMucTADyHlGAYACr1SaZXReg0SpPwwKsP+WqFK7e6u+JeNz
	1CjTxAVmrsvzjVhr4QuXM61JsvXVQXBWvJqBdi9u14ONb5TgSVR/8zGzjgk0g4BksHjT4K9pb9f
	aXP7ydr4dvYYljp/AfaoMpuilwxoQDDHDiYs0uWS95nrtJQH8+Ho31c1Pzs5Ba03Eg4qqBngf6v
	oPgp4CZAZvZKQeaDUGEaAlUH9tmdlvd2CMBdSHwDlA+c9qV0qU+MdezfIipz8cY0=
X-Received: by 2002:a17:90b:1b43:b0:32e:18f2:7a59 with SMTP id 98e67ed59e1d1-33b5116251cmr4321784a91.11.1759924544294;
        Wed, 08 Oct 2025 04:55:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8dAKsyBbZvrsJrjiadHYFmwWdD8uXe/duyov4znxSNrQv9BCH4o3QlpUkcce67iM88n/91g==
X-Received: by 2002:a17:90b:1b43:b0:32e:18f2:7a59 with SMTP id 98e67ed59e1d1-33b5116251cmr4321743a91.11.1759924543785;
        Wed, 08 Oct 2025 04:55:43 -0700 (PDT)
Received: from [10.79.195.127] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b510e919esm3186243a91.5.2025.10.08.04.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 04:55:43 -0700 (PDT)
Message-ID: <064d2a33-22e7-446e-9831-a390510698cc@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 17:25:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] arm64: dts: qcom: glymur: Add PMIC glink node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-18-24b601bbecc0@oss.qualcomm.com>
 <09b2ee28-ee2b-46a8-b273-110fb0b4d8a7@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <09b2ee28-ee2b-46a8-b273-110fb0b4d8a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e65141 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rqt88i4GeKtY4LEx51oA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: pjztGw1k9kGaLHhquZg_5iKcCMj6MHbt
X-Proofpoint-ORIG-GUID: pjztGw1k9kGaLHhquZg_5iKcCMj6MHbt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX5+rmeY7Hkdhp
 wy+/6wptj4ZqClKwZjcyXJV1lTUGVbiulagzbfG0yzkNWUcnVRlK+ELaMT5wmzmuviiLTqTfY2c
 CruGIhyzspI1/cUwlTQshC9rLTkcj5HTUp9Wcl1ZU2tP9lSsZbCc6eh1gj2OzuMIpRxNeq7Y9Pr
 0x41gFf+u44MlR4ttLociJWrMo0d/1Wrb29JK/MZhuTodHIbVoy64xrwuO7b5wSxfA48pEyzlRR
 pz5Jd7xWp5v0uiZ4gijVTnwdifFIzs8AaaNs89y8CWZGiZ5/rKIoIoK6TqYMgg3hhg70/0iTjJx
 SjbUNtZZnVl2py7DnKMuoXQxcuobKqgFaC3avorPNG3RzFlfauulb3P2aDjRcr1YLwOheh92KTz
 EOEvYS1jcqMYmiZHiPWFLpZ+cv7Q2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On 9/25/2025 4:02 PM, Konrad Dybcio wrote:
> On 9/25/25 8:32 AM, Pankaj Patil wrote:
>> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>
>> Add the pmic glink node with connectors.
>>
>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> index b04c0ed28468620673237fffb4013adacc7ef7ba..3f94bdf8b3ccfdff182005d67b8b3f84f956a430 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> @@ -79,6 +79,34 @@ key-volume-up {
>>  			wakeup-source;
>>  		};
>>  	};
>> +
>> +	pmic-glink {
>> +		compatible = "qcom,sm8550-pmic-glink",
> You *must* include a glymur compatible
>
>> +			     "qcom,pmic-glink";
> Are you sure this is still compatible with 8550 after this
> series landed?
>
> https://lore.kernel.org/linux-arm-msm/20250917-qcom_battmgr_update-v5-0-270ade9ffe13@oss.qualcomm.com/
>
> Konrad

I'll check and add a glymur compatible in next revision


