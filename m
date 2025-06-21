Return-Path: <linux-arm-msm+bounces-61930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B231AE2898
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 12:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75DEE1889615
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 10:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C99C1FDA94;
	Sat, 21 Jun 2025 10:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lt7qSfxI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7551E1DE5
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750501431; cv=none; b=DQl7/jltb5iX8T96w8xIYSZiy7lPc7Akr4Qfbg5OgPr6wF21bwOppNijO3EuhUYjMd/FyhVWiiDfz+eQvL7bDBqeOwnM4PMZ105cqvwXxCJhXK0v55WFvF7cN9Uj8Y111U3WczC6y1V2yQ9q1OydX23eHstoJvmShiNKUiWBvuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750501431; c=relaxed/simple;
	bh=TpLdTFKcF/XRek+8L18J0nRWqX7kggdzEKxNv+QMNmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxM30ufaL1dvs3Wtt1WEv7afJmHE/gl+8mbXV6rTshrW3TMXHde+yVKoT2YLITvvxuaHtSLe9hfKp1E0dHWo0HeYagf3llGOjMqB6F62yV80mcGlYpt0tNmveGH6sfurG8cx1m0Ph4FssqB7kwT4P2GfqWWCEDAYXsLE4X/Sj4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lt7qSfxI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L9o2sM032443
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpLdTFKcF/XRek+8L18J0nRWqX7kggdzEKxNv+QMNmw=; b=lt7qSfxItJQcd4bj
	vkVgf/RGoSAPz8F41MaQl7WhZSQ67RRy7fVew8ndOkOj11gX/ZVjAySh05frYJUW
	UbNQryYQlCEBVDPfVl3pi3B88ck31hv9uX7TB1OA7Y+aY6X8Kz25HvZR4jii2OXz
	VB5da15mzbdIAnD1/050Pk5hD+L3KMWRVSQXaaEHq/uOLZDpaXnTm1cCDAJA/llc
	4pEy7QREE4P/lIutk0v66Zo+zCP/8L7Ja6np/i4JcmSvTkw/w704E9zOOfKlorXJ
	eqhXBJtySnILOmhSCQa8i4jlAfmH4YIIO9vv8xn5JKWGGG+49OXiXomgtbNoUo/y
	Hb9qyg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ds1a84w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:23:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fabe7822e3so6046186d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 03:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750501427; x=1751106227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpLdTFKcF/XRek+8L18J0nRWqX7kggdzEKxNv+QMNmw=;
        b=croqisnVz3enkNIw3ha8z8N2Q1IRdPwpBLmpOEw80VV8LWrTZ0Nl0XTxnaexYRW5S9
         EucqQnYwWu6qodTaXe9L9Z1Pnjnzs+4oi9LENXPzYtZtiYCOshiOvCGYbcRF90s37ajs
         GoM8u+OUU9q5evnv0JBlasEFCMP1kQEjQQ3LqnQmsfxEFQXOSkvX821DfcC8sWpG2+gc
         Vs/PrjMkl0ZIf/Y34CjrEJABT6iS38ymxmRbMSoSnpnw9oguKta4EVWj4AqZaN6q8kmx
         ts/hncPWpMHnXYccLybCe2B5ZtCU5q8KqNpM2pCrFmqsSNOr2DC4BnCK9ZpJy0gQpgXY
         aD8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2HIavN+FCtRqrrtU3SWy840UfplI1CV9/o/h0RuOws7MG8Jxbhpp3/qNf8Y+ryqQYmMYA16YAJ2atmZB+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+K5LfTIZxHP25vjxp+yvPcCcQdrU3DPtmFe2FIgOcpo3fTGkj
	KfYfinb2jWsnp7onnxXepcVOPV9sV/aTmBWT8hdxjss36T3FoPeAhd6/KIAD/Vijz73YUHfGZPj
	63OlCdfQfp72QwKWE0PQOXGepSv95U5Tc2hi5JIP1r3Cf/iV+8A2hjNRpTAnSU+2mwSQB
X-Gm-Gg: ASbGnct6EBGKfKnOj0K27ygAgm2+dzPpBMqljDJKnRSOhGteyVSOv5spVo9LJDJHPsP
	afjVILTKV0KNW2nxDJuCGA6yqqRFWP63AauVP4YGNQeH2C7YbUzEWr03z3fVpWGc9RSlBlWCJyk
	gkSlyQrX2U4MeJu/KSnQfYPnzXPiUvWOBhWpBm5+2kfC57sR0filSqCN8MH2yXYt2YLe9YLY/O+
	JRb3Gd5wKnARWVKpjtDBfiz49BQYEE6wUFOLO2W47Q4yIkrOzWLMVm3Uh/kTJmW4mBZhydIet4Q
	l/ZFNXonxhw26+bD2rhPXXPwEhyX9Ek++4Bdzn4ZTDR7U5hKsk3FJagcio9tu3n0ohU++PgdjHA
	WG7E=
X-Received: by 2002:a05:6214:d0f:b0:6fd:cfe:eb69 with SMTP id 6a1803df08f44-6fd0cfeefd6mr33144126d6.0.1750501427580;
        Sat, 21 Jun 2025 03:23:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL7MibXEyP9F8lz/Y2lKLYp1eoWNqfrsGdvD1Pks6XZih0R0EqMtTrZY6/uhIV2aRLfbEu9w==
X-Received: by 2002:a05:6214:d0f:b0:6fd:cfe:eb69 with SMTP id 6a1803df08f44-6fd0cfeefd6mr33143996d6.0.1750501427186;
        Sat, 21 Jun 2025 03:23:47 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05392172dsm338550766b.0.2025.06.21.03.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:23:46 -0700 (PDT)
Message-ID: <5af406b6-cc31-46ef-aded-7c0de3115e52@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:23:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50
 broken capabilities
To: Sarthak Garg <quic_sartgarg@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
 <20250618072818.1667097-5-quic_sartgarg@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250618072818.1667097-5-quic_sartgarg@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pej/hjhd c=1 sm=1 tr=0 ts=68568834 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=5CWsPqat_0j5EhUDu1AA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: kZo_BXEoyZJDl8mTgM2ZwEbSbkVoek2W
X-Proofpoint-ORIG-GUID: kZo_BXEoyZJDl8mTgM2ZwEbSbkVoek2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA2MCBTYWx0ZWRfX+IVXO3pQIhoT
 rOtpLnBy+fLFjcghQUElXL4L3NQU37khcl7OwrX6CidqGkKL4n0OUKK842IXL1ZPeV59xrw3CVM
 xAW4KFwocSSAXV/VxAJ5bRo+msrBsCb+6pEQ5PUSG8f/WhrDaXWeXWGr/gJFQ21SaZquFoUQmHN
 MjowgjczHJfsWezWxODuOxgH/+moQq6fL8sJ9SNR0eqKfwmgGGf82TXdhUNB4U2HJ6G1fbebnHD
 QjHcKsB5XJtDnZHxiQLsG5aZeXg5cEHNmZdxp3/q2zPR1Fsl1GwYNDLFr9Wr/IXyDvpFg9KgPSL
 juVQ26ewYl4b7mtZ5zEdtRkvz9scTsh3jvgYe6uZSJ3kIc3xKe+Yt5yX+ELKuQykFTNCHTiQJ7O
 uh3FF3hH5qhYfA1Q+yG8NTU8kvVuwenpRfviUQfWP3vosskQyUQthgLp5r0OmW0zVjE95djh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210060

On 6/18/25 9:28 AM, Sarthak Garg wrote:
> Kernel now handles all level shifter limitations related to SD card
> modes.
> As a result, the broken hardware capabilities for SDR104 and SDR50 modes
> can be removed from the device tree.
> Additionally, due to level shifter constraints, set the maximum
> frequency for High Speed (HS) mode to 37.5 MHz using the
> max-sd-hs-frequency property for sm8550.

It's a little bit
hard to read text that is formatted
like that, please stick to ~72 chars per line instead

Konrad

