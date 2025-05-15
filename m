Return-Path: <linux-arm-msm+bounces-58083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0792DAB8B17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DFC4189339D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3135233DF;
	Thu, 15 May 2025 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYXiuIxb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7DD217F54
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323760; cv=none; b=kI7qYbZp9ce4ydlvD9gAaE4AG8etLhO2nX+n6Mhr/dRZqFCR7k4Z29BcvlWiTEn4uGy+xsSjiTQPsNuWGulYB/EuYq/VbWmJbHLwaiml3mLeNkFJe28XDgxvVPKKEhQdMrSOC+yhBERCnjxvwfadnmJEZL22MUNm62ItCOjcaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323760; c=relaxed/simple;
	bh=FEo6NTHasI2BR0LBYbvtpmuoiyrBx+Jq0hbw9nffhCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kunJ01Mdc7Wv9yKPJNE1ogYTPcxHZJ3xMe08sY3YKyC7WUzQcM3QcHuUk9D+XmcjJBErIcSPnxqKeOfDQ05Bzpqroqmn0aaE/fclo6VO+WHX0CLnL+gEv/hzrLnS2y2kulb3wectkoKSF0gjPVHL/KgROv9UsnqYQCGHXlqRG4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYXiuIxb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFD7L014763
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Gp+EaaMTwpM0ikpSFqefh88Lpc/kVGRVyoOOkW3KS4=; b=HYXiuIxbWR1kRIEa
	0J9gPCpFT7y5dr+Jyw6qlYLYMpIcz0wChUrH3sZ+YOaA+yBP0dEx+8btwj/aOGln
	KZM5l2lQeCFtIbvL3Yin+n1yh1GXkWDM1C65Rqc9XW/B9nN6jNHwNakbCjBUBG3D
	vyL6t1OwLl0xOgexGtOj8Kn7y5fSYmbwQStjxJ4td91LDD7qot5KVb9LUu7wkv5H
	KFq/a+tiO93am4fysiDbewBBMkDhLCdWhjYzFzakj/lm0lj6qkgEyoVAmRw0hTQo
	N5ixLMExmiw0L6rxjlWWVz17AwoeFgKUV23aDeqY6Yr9O1P4uiPKfLzN8cGVD6H0
	C90h7w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpesvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:42:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2c8929757so3162326d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323756; x=1747928556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Gp+EaaMTwpM0ikpSFqefh88Lpc/kVGRVyoOOkW3KS4=;
        b=K1b0l74cuv3O7HNi39Tt4AyvJBbzCnUmZawJSJw9NglR6bnhR+RXzNTDVQVhzvRe0Q
         yJetUD79AITh0sEMzWz3OnczjRiPvHHdv9IIGVS2XQx0mzwjjBcGFf60lca62z69heDA
         PiLe0V0T+JjWtDYrRZaQL40jglVmCgAErMX2HoV/dL1VyQ/ciORf+YCKfC9wb/8Jm+Dk
         G7daC9H0BFUJku8iHxh811L/sA+SDMs5EXVPcq3MoiA1iShjl9jkI5X+zE9jRrzYH3Gg
         hQY3dKQerPcLZT4lvq9X5rEo1PLnoDen2AEufFnggqLpuhsnpBNRKDf9rFAcQAxpFTIA
         be1A==
X-Forwarded-Encrypted: i=1; AJvYcCXrTbNM1VBKROSNVXG8q6nuEUt5BkXuvt+HgIuDRhg5+IS/JlsiwPzbIegFbmMSrtCP17BOGqRz3Xue8NAO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1mlKt5rp5XtXu2aQ5hbL2SqYqxKDy1o5R19OBpdITMAyJDLtQ
	Rj0SA4Ra0PNwcfG9dJCoqUj29cQ/G+//rVN90QnYll5GEk2sc5eOfOEd0k1TIg13t31ttYsgfhf
	/auXMotzWi4RD3yXxJBUEb9oW2JzfWA801ZvcrSK4eRfMqN51RRTxBqTChOIqpd9bfygNt6/llr
	LE
X-Gm-Gg: ASbGncvr7r7k0YriXsHF+8il6hsndY24v/Z+CEJwrY9pdmSElEaof3poaZfvGGvxMgE
	fxMKePBCbjSRYIX4dU6TaB3/biz49Nz4R6IuCah0xtOCNAzSiTlfKzJ9OXLKNIIImZJZ8RgJN4T
	f3/caX1r09/z5xANXR4w91mtLy57ELyaWVfqulHsZs2rWQxaXBLaPTsExsJvOU+Q+qSu443ATJU
	XKYnZXuCTl8mgqFo7bTcuvk3CJ2a1gZNGoFbzFA65s+Em2C3DidP+oG/uJNFSF34ylmG+jcRVMg
	sigRw63Lil6Mdj2je5U6TV/kpO00L6UspNsaqk1VyMO0zraX6bsnj897OVtwEnmLDQ==
X-Received: by 2002:a05:6214:2602:b0:6f5:4711:2987 with SMTP id 6a1803df08f44-6f8b082862amr1258296d6.1.1747323756481;
        Thu, 15 May 2025 08:42:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHycrvO/sWsH1BFm3roYJt54oQuAdB4SWzNxmk0MLSaYCohDOB0eaQ5GpCEYDaltbZ1ZS+nSA==
X-Received: by 2002:a05:6214:2602:b0:6f5:4711:2987 with SMTP id 6a1803df08f44-6f8b082862amr1258156d6.1.1747323756110;
        Thu, 15 May 2025 08:42:36 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b059sm7133266b.10.2025.05.15.08.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:42:35 -0700 (PDT)
Message-ID: <19d32dfb-9842-4d5f-b9ee-cd5926e52751@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:42:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/18] arm64: dts: qcom: sm8450: Additionally manage
 MXC power domain in videocc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-13-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-13-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VCWLsU55M118_civOtr0Qm5jWgPwsYOl
X-Proofpoint-ORIG-GUID: VCWLsU55M118_civOtr0Qm5jWgPwsYOl
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68260b6e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=pq9-8jp3JCCm2Y5_lFoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfX6bemuyxvYfnz
 aL/z3l+Cb9UaaJDJnCf4kdrXsQWsw7irKngSs2AKzZ9gh9HcFgIsGXN3fqJSsrst/TunNCPFPYz
 Rjsv3hm6dWAJQgeIm4jTz8UdoAffi/ClfAaDWBbIU8XTbyCYAlB9itBkNKno6BC06sna6VxBbvc
 M9X/y7foqwijMjKeoa3znTiBiwXksa3wSHrpSpunvBxJamiUkzHEgZPpYGOCiyLdZHOD8gpRDR/
 SUOulGnjWhpfIQlFVTEpyU6wII5AGwjHFF8Qle9OIEux4qDNnuvQH8L3kgM/99hHuPX+gKLgeMH
 rbyaF6WqlpOO3wiOpL/4yGeDLic1Wajqyb+bQu4fhjb+OfHJ0xH2vwf4+eUSi7U3FAj/5bRxTLC
 vdzIZR1U88IT8IXkpAh0axh5yfTG5HwvuEAWuefn5Rda3lFng/8psBJdb2v4fGS/QpKeks93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=724 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150156

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Videocc requires both MMCX and MXC rails to be powered ON to configure
> the video PLLs on SM8450 platform. Hence add MXC power domain to videocc
> node on SM8450.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

