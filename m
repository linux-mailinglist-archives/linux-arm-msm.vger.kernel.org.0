Return-Path: <linux-arm-msm+bounces-73085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D89D0B52D3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99C7AA005AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 09:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20332E974D;
	Thu, 11 Sep 2025 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kY4eFS13"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C352264C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582909; cv=none; b=WiI5TEU2YDD9vw/q0hApFEwETwz8d9JdkT89C1FQuvaeYHRsgsL4m34GJxv1y+yIf6xYKiHVdtGZCixHir1ckTnZniDWM9Vrqq1Qsi/NKAom+FAzQkaWPOnFd7OmXo3NajgsNAOE9qgsZ0dURz70/nPDNS+OWBHFDzuqw8wUlL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582909; c=relaxed/simple;
	bh=yovw8dZIZk5YZsJALLgL7PpXDCJ+pB2XBfFLRu7cBK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRfng+JNVNbCrzQAoxHdhaUWK7E9926nEVfWJlMAvMk5nwWKRqIHr3S5S513QU8jfoXhZqypqViWR5cx3rf93AARr++aqe0uVDLQZwASaPawLNtLCFhejgNUB+Etlt2EWCWqI3pTPJ0sR4//P2bOZaCCnHvYqAIknLJteiROKmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kY4eFS13; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B8VfkY003663
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	seEt60Tx5iAxYQ3HoY3ySHkhbPT8S/AfxXLYjPv5sfI=; b=kY4eFS13XTG64nV4
	OQwxHvR7pe/qu8p0W6DBC11a9PsZ1vqJrpWF12gAZHP0PLMuABHz/dGJrFcjaCS8
	csLFM9yBpt6IPG2GaoihQyJac/tyABavtt43O7JzCQRyGeHOuNG1R0niB/kupecU
	VJM3Khwe5S9u19MVhnDzRiBM2ApZY3KsXrApVTzqgbKTb2qwGppLcpD6K/EIB3/y
	au8FmhuvvDijp8mECz+2P68K95RX40h8opWi7d7wbwLJm86gJnictq3Rnk11I40p
	fuDbUBsYczGjtjcGVXH+r9roMGyUOlLU1RzUf8cOzWzpGimIWz9q8MhTDmhkS2kv
	kEeTNA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493tyxr5y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:28:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f76fe6f6so1527421cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 02:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582906; x=1758187706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=seEt60Tx5iAxYQ3HoY3ySHkhbPT8S/AfxXLYjPv5sfI=;
        b=g4ybY4wCma1DXMXDKoMd56PgplX/VkO8t/PE17BmnQeUEiQbREjjl/hNpuUCV2XFDj
         d9exJn5Wxte9T2DIpVRv2DbyWg+wRpMvsXgrwyxXrkpQZz9JMARDxeJooQ0MipHrZapo
         I5fc2YqWiRCusdU7Tg5U/hd00igHjFXQMkvRuTyZzDHPfwNhzTUbLfHH9nprMYwnBQRv
         y+ZFjk78ukZlplDAoD3tBveNjfbiR5zc3yMWljTJQBiRULptNOJqwUYvpW7tWXXz7gPF
         pCPxfY48z6AazFB2yyqXYaSNNuMNtV3nzlCe8kLdlfNm+Y6XatjTkZpfh1aoRHo9QJo/
         GzkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ2Ge0MKQy+a9RCNEAImTSNdQ09l+yTZ9fwdjhdlCpySWQpJD+DNLdu4jIYdNERhf7qCK1f+G11FsefNAT@vger.kernel.org
X-Gm-Message-State: AOJu0YyKwkX+uO/umBtU1fwkAktJ1+uvEDI1DEdxcQTZ2Rc2IP72E+6I
	JgU6zM6h7fkNR/HWat0ozEswYND9cqJIdyg0fHBtAKK3nvn3s/xsgoMSGz8A1lXzBTxPFMAmiPU
	CwGzWdDJ61GNUdudFMLV/YuYND6zG8pTB8i3gl5udoxqDk5Pq895IwLpP0UsNNC6Vg7YF
X-Gm-Gg: ASbGncujq8mCkrDrPhaq+x/+Ya1hvt+Gj5hqHHE+VzPRmfbKh1Ihw+w7azPP7aJs2+A
	MwXseUVRp2OQOSDrSAdMQQTSPT2fH5Ri4GlswGEx26uAKEfU3xxlqR6Vt1JSk3XRdU9508+vR6X
	ENwwO37/bwVe6u5DUNTiUD1z0JGIaTubWayB1UlvZC5F6R4k6Nc82YkmDH+xOpzDKWs7iayFdXl
	tbA1tMNsSv2tB7ZVurIxnjqaT2wGb65kbOuS2kSgDCzyZAQYmxR9oHDG5877jOPDAjwmH9XToV4
	4eeLuzkZSokcCkkGl6F+gD0HcXH1P4sUjINwB5fOVP6ck4bdvRokm1j+9jsGbcmiREZnERf2bjk
	OLBZFkW7jTjmtSvt+InD1Fw==
X-Received: by 2002:ac8:5ac4:0:b0:4b5:f7fe:4e25 with SMTP id d75a77b69052e-4b5f856938fmr130984431cf.12.1757582906382;
        Thu, 11 Sep 2025 02:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuvq25R+77BqYBHhzzp6kJgdMsYLQoXQhRp54t2KTaoUknoGX09ov1azdmsGzUGYTPoZnMJQ==
X-Received: by 2002:ac8:5ac4:0:b0:4b5:f7fe:4e25 with SMTP id d75a77b69052e-4b5f856938fmr130984241cf.12.1757582905864;
        Thu, 11 Sep 2025 02:28:25 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33ac2efsm806457a12.12.2025.09.11.02.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:28:25 -0700 (PDT)
Message-ID: <bed315da-d1ee-4d2a-8104-8aa2e8d174cd@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:28:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: camcc-sdm845: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-4-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YPqd02fBPbwGXH_buWwaT_VPwrhYNNm_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA3NCBTYWx0ZWRfX2/VYzJgfnybH
 gBwXv+GwlsDcotxwZhWKuhf7CSoCZGgJM5ktU9GwhKrdfPePLNaaSv58k6AA0Z8I7RlZa1RZCUF
 Mjj9H2izv0r94nhsNNPl4OiX/m17S8FwQPVthCjaGzJlwdTh888Lg3JdFai7putzKEak6O4HQgF
 Yn6yKCJpY1aWz7RG6OLOGhY5R5xq1WFGK4P+1EimBrYF4vpkEfcOCr/n4lLBrHqLqucAy67Hczk
 YMLfnrjKq0tpAGQKEdtWuL9XXOE2FPy80ws9BykCXcDcrxrESooG1V0SXAJRpysInfAUie8NMid
 cFH0qvgNpHpVjvGdXKFVvGcEiJpbIFmzr6yPlMMirY9fCMghsIKzQmFD3oG4HUJhSVdHbOTNxnn
 6IqbbGqy
X-Authority-Analysis: v=2.4 cv=VZn3PEp9 c=1 sm=1 tr=0 ts=68c2963b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LDDDIuMr0XRAt-0CmwQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YPqd02fBPbwGXH_buWwaT_VPwrhYNNm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509110074

On 9/11/25 3:12 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SDM845 camera clock controller, and it should include
> IPE0/1 and BPS ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

