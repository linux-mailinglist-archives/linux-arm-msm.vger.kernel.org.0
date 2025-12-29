Return-Path: <linux-arm-msm+bounces-86863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC7CE73B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 16:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BE94300E3F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 15:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB1132B9A9;
	Mon, 29 Dec 2025 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPZoWL8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvNTSr6w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F401329E42
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767022721; cv=none; b=O8HdPqtU2mFO2q7xk8DD3TQX7znModxlXPdcljBz/iwqQABD3Psb5q2cBw3amziWfIN1uXA8vA5c2CCoQLVKEdW3JTYDaQPRYLQBwLbsSlcX/91Ix0/L5FAkKmUTs5/Xww5HkrItGTQRFEwp+B9y/WucV40K94zdZFofsr1gARM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767022721; c=relaxed/simple;
	bh=hhAsUdZ/3ACUABNSiakxuLJ6XCHkUJcEly56O8oH52k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MQoWFYLNR09B707twN6yyp5lA/72gp0IMWQCL+Us3kflaKYLMc9nloEA1Jf6OsdQxDHoLNDELRTQrudZEp6xBePVikMGRIWfnK/baTcePX4BmdJJkwBQr1Sl9dtyYIEzMMHUSQ2/fcEt1JnIMQH/1Rmq5wVG9u1X+t2q/scSEHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPZoWL8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvNTSr6w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA1d8r3706305
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 15:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uy3wHErMPd36fiuL0KsO80Ayi3dwwWvSwO2XvtIqviM=; b=cPZoWL8omhgtb7I6
	5F9xj5D4cz+WqJfpgYOC0oLN12qU54pm15uPwPXqlQ2BTcr6Rlo+D2tDNrerYpY2
	s4JY4lty0GxaldoqDeIUOePY+8V7DDwpJWIInZiichHT7JaKYIF7A4qG7uoQcdTy
	wvkzzsuA9YaLiEQsuNTz1lk9pQepvY+8wMX7amBE2uMuetbimVH8G6xGM3igH3TV
	WYz1IjSQH/XTLwRuEcZlnYqJ5kI0fMq5XUyFvUv+y2dun//LZeK0FyXAuSSRQH2u
	iCVSxhidrLLaRVm1Aw9YPsbUVkcaY2PuJWbh0l/VW1O5GQHENo1tvZpbd1pardjY
	3fgXzg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc8yt0h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 15:38:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f34b9ab702so23973471cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 07:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767022718; x=1767627518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uy3wHErMPd36fiuL0KsO80Ayi3dwwWvSwO2XvtIqviM=;
        b=MvNTSr6wShmq+wpXE2bhBRcMPmp1wkqFj67ifn9I9JLYZjM9pkeCbq8386e0IuK3X7
         WczuFVD1GNRXgFU3dlZUXaDGZ3Agb940OAn8mH7wKBd6zWJQfCBzG9Tpk101gxvQn32k
         tuhTBtrpO4FdOiqIiwKTgvpFi7hlF5bZvQUXW5JujSwpih5fSfz2ofOHccukLRs2c/X4
         CmnYWccGgrtJO0XREkul5JyYOqhWRCIZ3rBWpJcFmbJ9Zaj53dyBtCrAzPoaa1ovQ3Wx
         EbKvLRUse2S32ClYlfXzD1R4dBbP+FSrOu87R0PcW4r+91yaocpgh9S16a3w1frey/OQ
         SYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767022718; x=1767627518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uy3wHErMPd36fiuL0KsO80Ayi3dwwWvSwO2XvtIqviM=;
        b=RDRE1Xbc7clKFQSg6VxbMAkNHzt4HB/6Ach4OcQBPu2WW6Lrqq5gTEZyiPFBNUg82R
         yEs9dkzWWszvum2SvifMPwgKjfvoGEPLLOZNVLfyklvL5MjNuPMHe7+l/g9OdGv+Gwp9
         qTbg47egna5uOVCV++nn+JKyCblMOmz4Cb0qHr7RbEOSuj17Nq+KNzJEBa248RsINVoc
         y6IlpmzuKtW1TdoNyX1W/ncTQhP1lynQ/62K4FTo+rf5cf9mQgFD8zw37niiyjo17SnH
         K4chg8PcAAKNEGrARJ9wZKuXjCDrpHgesJ4xHl7G3Q0njBqVVvaFTzeyELWXnqlcGg7b
         cuvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSmtBn1Fpuxa0QTaeg+R0ce063HSKHMK00fioq/tZDHZXLWmhdr+hbdswNIGxNOFfatdE3hgV9MsLuLTTL@vger.kernel.org
X-Gm-Message-State: AOJu0YyjgJSNF7AdHJt/xDdxBF2D2MX2aidvtFnOb9uDmT3M8s3F5PbJ
	XKW0Pt7jipnpsSnswO5rcUo+luVuo6Z4fvvRlblibogSs/J+WJzM2Z34DBqs8kxd9LdDnEpftYk
	q5fLTSVAmwCkIVyDRp9sHGavaawmqBcmR6FwclBZmqgu98ProzpjkIM1EFEKiAyyq2CKf
X-Gm-Gg: AY/fxX5sxIUpf8pOG5S9eSQnrm8QEwf5gRifD5cjPKxGvrrE23yD1DCY7F7G+t9Bmnk
	JjA4Sgyn9lQVfx5DpXtlKLM+lzqOQXRxU6lh+QdTxy+64dL4QdoOX9+bKTD3N9l3h5xWDS6ecWn
	VhJNMbt89rnrdDw7DBpSt7lCIzuzI8/DN9bDj2w1hOE1/61b+3cL3DiwcOR1vPzmr+2XTWrQgBy
	3Rd5HdCbJ7EK4ga3yBPn2MVQwTNvKqu9uiG+B33+JSctMZWXrd0qxnGCXxmE1sV4mlcVaBOdsZ/
	S+5BlBIMKQmbp/DeuVmXC+dmPiqPj9NeeRTtmR6ZrYgVu79fV3I9TJxskEAcCK0m4qmBZ7pPDKW
	Q4dUofyz3KILd4pCU4m5G+W3k7utRqJm6KTlTvR/milc1B5Xaw+BcqAVfB3ESv9jxNQ==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4f4abe04451mr316313981cf.11.1767022717902;
        Mon, 29 Dec 2025 07:38:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESSBCC/bjtrBlY+h5w2iX8YZY039H99iVEdZQm7o0476WqOh3Y2NKmcnX6714mpSpe5csxPg==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4f4abe04451mr316313661cf.11.1767022717486;
        Mon, 29 Dec 2025 07:38:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159ac90sm32058715a12.29.2025.12.29.07.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 07:38:36 -0800 (PST)
Message-ID: <39fd6151-7b64-4e39-9b97-3376b6b62b61@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 16:38:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,adsp: Allow cx-supply on
 qcom,sdm845-slpi-pas
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251229152658.284199-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251229152658.284199-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE0MyBTYWx0ZWRfX83fx0Satc7wu
 NqKXRocVwJu0OqlZL2oudZ5YsmA7so7G2lFVtNfMKVd1D9kkCPBOHsyPDo9qsLhdcJow7/KXc0V
 x4VoBnqWYiW4h/ulibJ5bzSFBcNAn7ZUgA1XW/pGa9+iIaQjIejvPyIiloLBXxlxgDhKPlwnNop
 uYPOpsnULar5/4GsZVMp1+JRGpFKqnQSvOm0eExgc9dPTvzmKl8M6KxEbal4fNbvY2rSvDdQoWL
 +y/P9PH1PPSmzPx6W8wCzcYkIhUr1juSZHRnY8N17vp13V3DQt0qzL0Lj1NaYrljGeMu9U1JHvr
 qwjqUc5/hnjB/VpEQL+7bZtk9yYBkr3v9Z7LYiB1s92QVg3vHM/g+pvdmVOnp7ic5t3gpXhQ7MW
 nTUoyv4Qk2bGUaow7fFFQzrhCafzAsCWn80jaRMaJJqwVSFuPaxnZ/Xq9aAxiRCosEF62gOiBOx
 H3jswcZ5Oo3satiaddQ==
X-Authority-Analysis: v=2.4 cv=cP7tc1eN c=1 sm=1 tr=0 ts=6952a07f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=y4MapCRUEyX4IQXlyOEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: tm78W6NMcHn9JZBawpV1ASU7ywiiyRfT
X-Proofpoint-GUID: tm78W6NMcHn9JZBawpV1ASU7ywiiyRfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_05,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290143

On 12/29/25 4:26 PM, Krzysztof Kozlowski wrote:
> One SDM845 board uses cx-supply, which is not allowed by the bindings,
> as reported by dtbs_check:
> 
>   sdm845-samsung-starqltechn.dtb: remoteproc@5c00000 (qcom,sdm845-slpi-pas): Unevaluated properties are not allowed ('cx-supply' was unexpected)
> 
> The SDM845 SLPI binding already allows lcx and lmx domains, thus the
> cx-supply seems like a fake name for something else, e.g. some
> enable pin.  The qcom_q6v5_pas.c driver parses cx-supply, so it is an
> established ABI, therefore document it for this device only.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

fyi https://lore.kernel.org/linux-arm-msm/CABTCjFBQOq1pmdou_17ZOV3MgTxD_2byAY4RitqPVN5FYdRuJg@mail.gmail.com/

but this one seems to be more tightened, that's preferred

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


