Return-Path: <linux-arm-msm+bounces-79854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BD0C2476F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68BA44027E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3706B33FE01;
	Fri, 31 Oct 2025 10:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EmFhZUKn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQ+tefdk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC7330D3D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 10:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761906591; cv=none; b=XxFQEBURyojOg1br7uP6KF/rkBoqWRk2jZgPrrK3+z7ItA0QlW58/car2c+8JCi4SuxvNfKqHmjIFPFpPTI/paI/lwZZLU+VYJeaXwlLcUxBmn+GxfIgQg7dATk6mmIgYHTNW0L4e6bL9jmoFUBqi2BiZM7em+y5Cj5UQV8aAsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761906591; c=relaxed/simple;
	bh=GmomhQWu5eZuudMLA/J+HdDfI1qwJFEMPLFFfhzhn98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oigB4w5gwqnOThRM+7kyHDZaz1hTIRsSFD81dHYl4CtvX+cpXDlGITB7DTQuT7Mv6ylaqP3atIBl6zPJvf24m3YwcmMJEBXATCWqFLFcz2hxQcnzDtBZUP8tmUR4YJDQwZU1Ft3RUfhHd9tzj5o/FUezqLL0NT3FcK68a2eog1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EmFhZUKn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQ+tefdk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V7pfuX832746
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 10:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1jTND6/HmyqJwuhZfPw5RfQr/zkCEiCnZ5cJtmao/s=; b=EmFhZUKnBb2EF5RU
	iCYu22xSaHIXA8pJjOfr4WXzQ31PnHj75+xAWX0dHgu986On80CP3XFgg+xubKdv
	IlPXc4NwKrfxebfmaI0nGaP+9q9GgTYydYRB06UoK8HfT9AMHhV60XzbkicEnTMJ
	QODM0MqEGqXypry78ByYQy5+dvSUMTusnxIcBLndnWc0AsTuLmibbHnYrX7Ya3tv
	ei4Ds18XnddjxrbYdu3b11RlCPR2WQba+tQaWb2YcTEe+DGbD1dZMwgBxBV0kQ4+
	MdfjwKRPjZf56IzyHbKLupLXJw03UK4WL4Vuct5lE/sx+ew1AZ+M74ZHU1HHU6zT
	8X87sw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ffb1vvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 10:29:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29520b8e248so8783365ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761906588; x=1762511388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1jTND6/HmyqJwuhZfPw5RfQr/zkCEiCnZ5cJtmao/s=;
        b=NQ+tefdkBR7F/D/uM36a5n7aywSsyqVoLKk/Wcyv7pjP+tA0owX5Y5nNMf9OycRYGR
         7qEwdm5m+JBrgOaAzzLheNaPCdHJ1oB5vZpLBxhwWsQtFDi3z4RCTbnHFqQlJAFaRNHY
         bndCOPuntrDQtLrUGhUN3SGwcMG0bLlp/aoEi0MlHzdyo6DtyE9u7mKQkqmUXEFYj4Rh
         jJkacS/Phr0jBdjlmdMoBOEw4ZE5hVFNCkU0CydnFq6HW66d0ylZr+A1CJ4/kXccCY2u
         y5HTavDQv6dyUv3PXQXwc3vJA+rQU6hKNmpkk1sEjWuXzCPBYERZ+AhdEeFiyYozWHN/
         9img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761906588; x=1762511388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1jTND6/HmyqJwuhZfPw5RfQr/zkCEiCnZ5cJtmao/s=;
        b=VeXR8RJKmdGaVvwh92mxd+UYi86aA6VKkJcbZxHbxYIu/JT3QWzod82cWssHfjz7nu
         GksWJq0H2CQ9apXwfVLEEiD1d0Ar8hyEmZj1vSyatVlpU3koY4dmJ8kaDt/8DChCzpGt
         ViLmKFfVBRuQrrUAq68q449FTJwg1IgznLxjvNw6R29rfr1YWgTE2wfXxyM4VjhnyTaF
         1BH6OS661IHdZcCEh4ex8NQqizcTxJQGYhhz6GzYSKrzg8bIbxIH4emvT37q0eAwhbSc
         EAMqP6DWy82xc15BqGCwFVfQn813b8jD+IBIwvIvqqEr3TfNyqYRLM+J2lZKBwjLW6oo
         3Fig==
X-Forwarded-Encrypted: i=1; AJvYcCV6bL/cwHgDe4dnbaxKGqVzgTiQ2+hUXZlOD3N+ncU8gSYslSa0CApAsXRkzOFhWSvvO/BaT/I8uL1Gyi/r@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/CeGOxgRluCqUO8VEZYHsrCGCTX0trPnyhXmW26E5fQc1qO8W
	BujXr8Cl9cFl5wZLMDiTREMZLToYT9CmCLo7GI9yNZdj9vMVZPVm0AjDi9bs/KT2gwULwu21oWE
	xhlH2pAi16SWpXeQJ7OQUzrEQ1sDmV1swKD3+kN2/DcyGjcv6cTKZzd87nU7HOwcX8BuD
X-Gm-Gg: ASbGnctLcAYNvY+nzjD85T09RhgZMJ5ZchQUvc7H9bLeuLHMjNuh5NydP3bZwN4OTfH
	ZqhUQfmAqngXglfWlDr6c3dZzTlDO2nHD3CA01RCFkjZcmhDbjmAyQHELt2/Mc4R71jy7U5zLBb
	x7p82dcOie9lBSPrNTqbXdiRD2FsiIvXYMKlSlJwNcc5KInkEE+Q4pPrujsg2QQ5SWRObFrmIO3
	/B7rKlTT8+fBjfG+1USC8QclFylX4cBnRHGMZmCnpA/AgLTKgWj2CNv3SOTQxolcq7AtwQ06sa5
	2nLJcBMIcNeAdJsLtOvus2a1nBNgkb9fe1ZLJoAx1kxe+EDKLI7O5lePYx3HL3wGNY8bZavlAgZ
	mG423kglN1UVRBlxgu9xjYr/WdXPM
X-Received: by 2002:a17:902:f64c:b0:292:dca8:c140 with SMTP id d9443c01a7336-2951a475500mr45451815ad.44.1761906587661;
        Fri, 31 Oct 2025 03:29:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAz5IcFrme6z6y4aSHIYgc1QcS14uv3B7ta0DOwkl958FLQrOzp8GsnimVMwXGTTWGIw5Mmw==
X-Received: by 2002:a17:902:f64c:b0:292:dca8:c140 with SMTP id d9443c01a7336-2951a475500mr45451265ad.44.1761906587018;
        Fri, 31 Oct 2025 03:29:47 -0700 (PDT)
Received: from [10.218.50.9] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c62csm19059985ad.74.2025.10.31.03.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 03:29:46 -0700 (PDT)
Message-ID: <f6903eeb-76fe-472c-974e-21338e07eeb5@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 15:59:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: tcsrcc-glymur: Update register offsets for
 clock refs
To: Abel Vesa <abel.vesa@linaro.org>, Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251031-tcsrcc_glymur-v1-1-0efb031f0ac5@oss.qualcomm.com>
 <ievmorxn4cpwx3xnlr5m5j7tgv4p2ixfbgr5bojsetzmdgmid3@764lndl3yqpv>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <ievmorxn4cpwx3xnlr5m5j7tgv4p2ixfbgr5bojsetzmdgmid3@764lndl3yqpv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CZIF1AzPXrD6qgN4jtxkV78Dz6bKxUA_
X-Authority-Analysis: v=2.4 cv=fpjRpV4f c=1 sm=1 tr=0 ts=69048f9c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=p4WGWtBPKAh2wfn3LcUA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CZIF1AzPXrD6qgN4jtxkV78Dz6bKxUA_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA5NCBTYWx0ZWRfX7ZqP3hSue8Je
 mCVnqQcecw6JAqNc+JGORKQRCia7duOTamVEb2+ine3UvgOacH6Z+eHziMA2pYyO/6p9APDco4a
 YcCweEPeDjJ5AXbugeWG/PQRYK07GTc93ZPX0oxzgTbPDWU3Nd6oH2twCinXnv6DpEqxgrM5v/x
 7ZASbbmhOc+Jxg06Vj9xIgCOjNuSZuyOpRC0jAGh7VuLIZVV3VObS28mZ+LqIe/36/LWFu8QaO8
 t0yEcm0RsFQ9j9mqE2pO6sXaghJTJZA0r8l1rNurN89Y9m4kzeneyLpymACR0EhkY7/vyOzo/D1
 yUQmU/qsVOK5H5eUpWWRof1rpWh8fzdEuzGv/Yc7lcISG4YnQc3F/pGgi5m2ruZYp49Nb2fPtTj
 e8oCB0xMC/M86fQfJlzSFuEh0ptkBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310094



On 10/31/2025 3:44 PM, Abel Vesa wrote:
> On 25-10-31 15:32:25, Taniya Das wrote:
>> Update the register offsets for all the clock ref branches to match the
>> new address mapping in the TCSR subsystem.
>>
>> Fixes: 2c1d6ce4f3da ("clk: qcom: Add TCSR clock driver for Glymur SoC")
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>


Tested-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

