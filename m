Return-Path: <linux-arm-msm+bounces-46372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B082A209A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 12:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9C091611BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D8A1A08A0;
	Tue, 28 Jan 2025 11:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SP9Eta+n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B0C1A0711
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738063600; cv=none; b=IiTzy0ZVI8f4J1qh0bs8Se+KqiDhoUwM/dZMROA4YOb7qSpfJZZtaI2dpCOJGjuFc4dfuxy3dJzGjp8Ur53gQin7h9C8A7jb3lEoM5rrk4h1AkTlGHKlwoS65x7is/OVisoxLHijbgAFfh44a5kIGUSFpXN/j6PRlxWF5KCX9U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738063600; c=relaxed/simple;
	bh=dOoN1H6FsfncEe5JvH+mItBiiJZFYhO8jumBlOj6SLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YH+t/FyEEKuH0mbAoRqZtoQW6+42+v8aMX+43wWyeA8xrsGtqdv6kJAXYPFcQFf+FRmyKb70zhzcm/tDAmBrrEDhY/57PAofdYrPkgpCb+0jWE2oEY7DzOxKDLgD7DpeWeryAVw85LtydUCrvp5fYiG3E2aVyfl7tOqRAWkFO4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SP9Eta+n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S9lgUo018420
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+S/4n15YF+vLVuteKg1xzKfW19B0jPDHe/Ppx9S+E6g=; b=SP9Eta+nduAfb70T
	bkiYWR3DjAY/2PKn6/9bReWzakawRinrwcjojb19vlx59DhVqh4X5TeAdn/DZ3e9
	Li4WjwytudG2WpXi+kTvIO2Fqzn4ngrqKaYfcFJ4qjkA3IRi3XaCWVS37y2/SDCU
	jn/U2gYVMYByDJLA4y5NU4dGN+RGzUWYDS39H72TwLNra5GISyDyGSi7LPWM+xGd
	vjunKOrjI5R9GnZb/rxPi1r5MGA8l0u/m+qIxTfLDGmkzcUkSY/AcAdWFlAhPc7h
	sF2/aLDxXbiOxsgHnN30bh/8kvhWbSIzAXLucdZgMDM2rvAiCGW/0aUJHOdzz1XO
	mofd7Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44evwug86d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:26:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b71321b993so80134785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 03:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738063596; x=1738668396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+S/4n15YF+vLVuteKg1xzKfW19B0jPDHe/Ppx9S+E6g=;
        b=AhX6aLr4FxK1ivuzUqUiewfIANfYMkgejxSXJxSZZKToKCMdZgJVxhzzPNsPD/e6ae
         oTycey98fOEIg3tcHessc2dwM89gx4cQFjrmSb0PMxOLHqj8igVJhc6zmbCPSuPJtGqw
         XeL4HwPKlKkECRxFRboEywZR40VW1KM755ZNzy7jMMy7ECdrHMyVfJTy1H7Mf40d0egt
         F+gxjyQteJ5injWOx9WJngoTrSEUcp6ubTPSCo0r97BIPi7L1uj22Vvyo7seZNaezMyr
         bY3YN5l1DEWZAqRkpnEjBIsrdzxEuB8a0V84xoe1Xnzy+LISMcvSNgNejgoBMd8vO3Si
         BGyA==
X-Forwarded-Encrypted: i=1; AJvYcCVtO3tuepTX+hc9BFCnu8IDVXqaC5sumwaScffkpoiPFmTWo/lGyee2zu44DTVJG7U14OPfidOvz7r44JHQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzxuQtpJg9fz0+BVoPQvb/EdZyO79tMWtxzzxYjHNjAck/rzlL7
	7xMg3cC1PCII6GOfmg8IKgAzciMqoY+yIynN0C+PnGnxwwddcZHvzYxSdJlcVyU270GjBAJ7ZMB
	6eDkquldXzhjaPKm3WljZ5klIH8yeaBV65OYamFDm+JzyVIgfqCgoAccxCxpdGejyZwDe5dwe
X-Gm-Gg: ASbGnct8BxSPvGbx8aeBJZvq+YtYIoZG+V8iVvzvM3aQQKrxtQP7zD5nyyRXs73P7xw
	BxIeWZvRcqtNT110hq0ZQM6nbp+44eFjaTYJzycL78Gcsh0ZAUewUwEiFHguc5LGmbf33wWgpRL
	VzbD1lu1D9VubleRwb5EniYkc92epYs0wIhxGZ06j2Q1XPSj2hL2Y5uRx8pO/2p7aH5LSxem8/f
	FeOGiG/hU10pXEm/+cg6nOem9zd6pVdvhbHKAASIeOTnB7/tPgFog0U2KF7gF/YkbkU4iBLb35X
	n7cMoIXvbxRqeBck+uS5RhtKU4PtXLM6oHsa4Nl7XzIUaH/w06SooYnSjPM=
X-Received: by 2002:a05:620a:424f:b0:7b6:dc0f:406c with SMTP id af79cd13be357-7be631d330bmr2710920985a.2.1738063596523;
        Tue, 28 Jan 2025 03:26:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIC9noFjSJ2CvWjxQive9gz7MmGb2ik624YqYy8TWgSNgPIPR/3aCC0pmxzOUK4QB9uZbSKQ==
X-Received: by 2002:a05:620a:424f:b0:7b6:dc0f:406c with SMTP id af79cd13be357-7be631d330bmr2710919385a.2.1738063596173;
        Tue, 28 Jan 2025 03:26:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab676116951sm752369466b.169.2025.01.28.03.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:26:35 -0800 (PST)
Message-ID: <56dfc864-9a7e-4954-a7f6-91ff6b6d05ec@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:26:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: update interconnect cells for
 ipq5424
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, lpieralisi@kernel.org,
        kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250125035920.2651972-1-quic_mmanikan@quicinc.com>
 <20250125035920.2651972-3-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250125035920.2651972-3-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TklJeWkaab7vjIIIhmD0DdvW7J_6aJxh
X-Proofpoint-ORIG-GUID: TklJeWkaab7vjIIIhmD0DdvW7J_6aJxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280088

On 25.01.2025 4:59 AM, Manikanta Mylavarapu wrote:
> Interconnect cells differ between the IPQ5332 and IPQ5424.
> Therefore, update the interconnect cells according to the SoC.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,ipq5332-gcc.yaml       | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> index 1230183fc0a9..fac7922d2473 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> @@ -35,8 +35,6 @@ properties:
>        - description: PCIE 2-lane PHY3 pipe clock source
>  
>    '#power-domain-cells': false
> -  '#interconnect-cells':
> -    const: 1
>  
>  required:
>    - compatible
> @@ -54,6 +52,9 @@ allOf:
>          clocks:
>            maxItems: 5
>  
> +        '#interconnect-cells':
> +          const: 1
> +
>    - if:
>        properties:
>          compatible:
> @@ -65,6 +66,9 @@ allOf:
>            minItems: 7
>            maxItems: 7
>  
> +        '#interconnect-cells':
> +          const: 2

Please apply some criticism to the review comments you receive.. this only
makes sense for platforms using icc-rpm or icc-rpmh.

Since this driver registers an interconnect provider through icc_clk APIs,
it explicitly uses a simple, onecell translation function to .get the nodes

Please drop this patch

Konrad

