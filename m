Return-Path: <linux-arm-msm+bounces-60088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 730E1ACC060
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 08:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30C883A3A2A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 06:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0FF267B6F;
	Tue,  3 Jun 2025 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4YWk38M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D71C2116FE
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 06:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748932964; cv=none; b=MF9b5ULp5YGdJv9tiXAB9m/UW3RwyL/qwe+OLKzrQiiwP+N6WmUesBjl09qiAQkdAeNmV1Sl16APUfF4tQE0Ut+N0uZlzQCSfaqe1m6F+gkmHdHNpigjEQc0YNRRdoi05qH79rj5+HyUC/iclPEyjHCZ1kw3nlo0vZ3TtmsTXR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748932964; c=relaxed/simple;
	bh=GN44FSpPUMryhxPjpfEqKO90JozkFgvGGpM5mOb+UyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fulu2RxQRI01tPpeQ852k4qMhHyUP5htl5yL29xdRejkC5ey+lfSnzREThyrjYvbPwptLgcQ3VPoLe8y6Wli5EmNBC6p8OOphTNln+9cyb0GSGV5MLlWPBmMMUnkFmx8wTzUOngnUkXhppAIQnUYqMjtmnVGqzCtN30MUwB2avU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4YWk38M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HK0UT006740
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 06:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FapTv+hgyXWAiQtFZ/6aCrTIGpX87fiidKCn0qHWkY4=; b=m4YWk38M+e+WaUU2
	2MNnPRd1e3Wq3UkuCDEej4pffPNTitPdua7/lMlqc2fHzYiLSSX2L9OWlyXfABKJ
	8V7kETY7JrwU3NqtcXI8b2sJseVYOpP2vPpNOJuKnfFx5PY3GKcI97mW7F/AI7iX
	jmWYgthlSteecvgmEb5Hs1H6FvwIa+9Qkk5Q/ms7l/6aS0T3U1Vnn6XGgNLSQB9o
	+VFHEt9QDfCo2QrU2uD3svK1YCFScCfVTjudGNkWv0gEUZvBCtz7FjwnLGIEDZU2
	aIf3ie8WOXDf732HT9jP+8P9RYDUjxeRlGUT63+Q4QOjgT395KOxJtUzsd0IFDjn
	/dXExA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8yhk8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 06:42:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-310c5c2c38cso5060071a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 23:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748932961; x=1749537761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FapTv+hgyXWAiQtFZ/6aCrTIGpX87fiidKCn0qHWkY4=;
        b=N06Y+xAmn2eLHRGif5jVxx/2NgB1cwzs3E4ln3o/bgbIG4F8e4BuIeTY6FH4oRdOK5
         /QhduujVkM40bQsg4xe/ZwNNTPY/qVMDtRDqN/wOlDgR6jfe5YQ/QQDcwynqlcst5xUB
         HqPiOrcp4dORdVjzQEPvSQ8Sbm6eBnJR5tC4TKa/+5hBo4bYkUvC8qDDJkkLaUKoRLhJ
         lXQM8vhxE6eA8Irs1Tc1/eF/c6gpE9F6RFF4xS1P7D9FpUyffBpawnVhjOL3F4kp7Xpb
         b440pEHIvrKeL+LP5Q4gBOF9cwCIMYKwcQP8lXh81E2pmH4/mQAiec0/TVsNUS7BdNzS
         6bHg==
X-Forwarded-Encrypted: i=1; AJvYcCUZJP/7bGIYJEeUihCBHPDLhaA8rnJ7WeoxO0XIHGVkAy1u+78YBhU5u/jsWVXxIL/Z6o+xNHYB0c4+8RnT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3dVsX8DhPJWp1YcnFEo2Q8jXbNLjk8Cg8S4ZZ+X0D2ZiLeDba
	ALyFAwO8HaE3wCGF7OXikSBuXBCwweMm2lVIv1+x2LFQV1dYwkbZtIH8mtIruEbYzFcOJLX0+Qv
	eGAzx+hmeCNeiLJK3m6pFbyT445OxIhiy+G/NF5H/1YKi8tzGfe/y4X98rFMO0A/Gwwfs
X-Gm-Gg: ASbGnctsLNxuz4B0t/UpVDxEdFhGToYXpkpJ06o3XBksSbc8oVuXUDRncQIf+Tb58mU
	U9TemJAJfj9W2G9rQPVXK5mp3Tun7w9uVWOl4XPejgv/0Vnpo4dbo34h+NHvpMP1kVmpyuRgAwf
	cVPApvKgEi0pEbxLbeNbSwP0x11/PQvSyFNpIOmzqaXBWsUpdgI6qYolw9TIG9jY4xTmGiWrEi8
	12vLUCKdoGI8IC0uaZejsKY62W+Uxfs1TvuLabAcfcOAv7AJY/nKSBCTeNYeU9KZxIb+r2Wtn9a
	IHrLrMhaB7l/jRYTkIv318IjTIBVQxsGihPVAZSYTax/V5N9q7cuCGtgFS48CvnZECRGWI+VQT4
	T
X-Received: by 2002:a17:90b:3e89:b0:311:af76:35b2 with SMTP id 98e67ed59e1d1-3125047f1b0mr18780923a91.30.1748932960982;
        Mon, 02 Jun 2025 23:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGVU9kEh+fJEWFdjM3ozZfG8ZXX9JAQnIZMnanwAHvQ7aYTu3wh5QiNLtgU2x8tq/oYaLaBQ==
X-Received: by 2002:a17:90b:3e89:b0:311:af76:35b2 with SMTP id 98e67ed59e1d1-3125047f1b0mr18780895a91.30.1748932960527;
        Mon, 02 Jun 2025 23:42:40 -0700 (PDT)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2b67f4sm6603856a91.3.2025.06.02.23.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 23:42:40 -0700 (PDT)
Message-ID: <14cba9ae-e3bb-46e8-a800-be5d979b2e06@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 14:42:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] dt-bindings: soc: qcom: pmic-glink: Move X1E80100
 out of fallbacks
To: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel
 <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-6-9e377193a656@oss.qualcomm.com>
 <4e093835-af3b-4a84-b42f-fa7d3a6f60a1@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <4e093835-af3b-4a84-b42f-fa7d3a6f60a1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA1NiBTYWx0ZWRfX3q6IExhXEidp
 8mMrE4gEfgOGsDkg52Ubzuf/14mYZS58rTIC0lg9pK4yQ/GSxJs6NU2KXQDE0nIoR+GC25pgMlZ
 Asq7XuM5WmgLFByhvZSm7d8bNhW2RAtE+vfo+441591t9QNgXf0PGmORLF7FzuGiR1FoWl3e5o2
 M8XHSWVUX/zHlRzEewdniP6+Dh1ln7M/mnLFlxwLFyuSy10ExXjdb1zAt/mXHg/orYTX2HCcQGv
 ee4CpmgW6gh5gEF9QQQuaDyuPordDTQlST3Nn2uFI2IelQ0akZH1JbPci46GN/hwEIS8jbB2xME
 yBBSHEUfN9KIrXbB6yu/xFsQBuD9EQ1i4ihgPypwXT3KbbEWnZWQj1VmaNLhyuZUskh1vLbYjUZ
 poSAkCHDewUM6WY4GfKqjAP1Wjq1ziaceDQdMwfiqU+fcMuuOsmBCRyDip1knHtecx31aEOd
X-Proofpoint-ORIG-GUID: QrYaVmBU7tAid14hPLJq9DqGtgnaSeK9
X-Proofpoint-GUID: QrYaVmBU7tAid14hPLJq9DqGtgnaSeK9
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=683e9962 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=kUhqu5DrlFyasPmHbFAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=828 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030056


On 6/2/2025 3:40 PM, Krzysztof Kozlowski wrote:
> On 30/05/2025 09:35, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>> Move X1E80100 out of the fallbacks of SM8550 in pmic-glink support.
> Why?
>
> Do not describe what you do here, it's obvious. We see it from the diff.
>
>
> Best regards,
> Krzysztof

Previously, in qcom_battmgr driver, x1e80100 was specified with a match 
data the same as sc8280xp, also sm8550 was treated a fallback of sm8350 
without the need of a match data.

In ucsi_glink driver, sm8550 had a match data and x1e80100 was treated 
as a fallback of sm8550. There was no issues to make x1e80100 as a 
fallback of sm8550 from both qcom_battmgr and ucsi_glink driver perspective.

In patch [5/8] in this series, in qcom_battmgr driver, it added charge 
control functionality for sm8550 and x1e80100 differently hence 
different match data was specified for them, and it makes x1e80100 ad 
sm8550 incompatible and they need to be treated differently.

I explained this a little bit in the commit text of patch [7/8] in this 
series, I can make similar description in patch [6/8].


