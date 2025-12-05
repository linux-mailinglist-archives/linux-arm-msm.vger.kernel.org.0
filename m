Return-Path: <linux-arm-msm+bounces-84449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F384CA7878
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 13:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF99E31A6348
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 11:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43D730FF30;
	Fri,  5 Dec 2025 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlymWOQk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWGTd9xK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BF13074AA
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 11:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933628; cv=none; b=QzWVxeBzGBiH5r7t7h2bwIoucJ0Skvdju5DowEZ1ILsXhMohywlW1Srp0m528F+tfeAyOrjjwBugPFNokw7guRHZu8dYvNtOu7sf8v4Tsv/Ye7At0em93SyNpxIzZMOKWIIW/tEjtKNap7x447cfM3T2370HlQKoAtXvaqccT94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933628; c=relaxed/simple;
	bh=HrPzEvY4+QQAdwNUCru3OvJ8qkiA4ZMkxhCv33NtqW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iYovJaAeW+Ell1BxhoT3qywNLW0MCr/5cP6fNwu8Nkc0TPe6ksa/En42w7MO9ypQHjDsAEeSyZxpPGNrtBObuhK2m2/gQNDSGn+MpqACMJGxxVTl+icLSRzB3n5KrLy83np3BxoEcfY5qtUmksxdGVmURbXO7vKYhM1miTrg80k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlymWOQk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWGTd9xK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B54JxYk3643667
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 11:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Hw+hQnLqhQ5fWhV7QpMHU3o5deWeFh4Klr3pvkARUg=; b=UlymWOQk5OscX0c2
	+btNyICcMTp/aZFK3XZjiwN7e+/SU4FwS1xwZzAOFzyhbTbItA5nVjBiDMU3aKjt
	PNNg5URMbxIB6YMOdp3aeCBJjdKtLVhAG4s/rg0SDVsci9938TEicD10w2sZme1H
	kUt0gwrZzaPleoQsLKAR+wgINnOgrjt4qjE/NlCZAmFYU/UNrP2fyh1AkAkwasWG
	yarErX1vEPuRVZ5WqrsDwP9+TCPBY1B0DxCDoIysc/NtOkH9MA3IiJn51n15FDaR
	WVK9RIANKKOd5pN+f07sfjourFr8CnIgLsTJhf5up3Ff+0FK/8D+f0idjayN/tfv
	VVdStg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aur9as42k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 11:20:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88653c1bab5so5551766d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 03:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764933618; x=1765538418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Hw+hQnLqhQ5fWhV7QpMHU3o5deWeFh4Klr3pvkARUg=;
        b=SWGTd9xK3g/7VnNUxJ0+kodIXbhX/TyUBlnY3vG4GOuA/rzxMfhEFYKzUjzVFvOsG6
         BZieGmcNQGNqcOkeOFXqiCVNUKU89iOQ4FS+yzj08P8gaDgZ7RKzEIKqEct4MSId6t5E
         uxt6sE1hRfEUMW4a9i9qTGb/YRP1XXw1yEi7MYh28V8fYXDpH9pSgrCxGdfd8iLkzfO+
         TqzhIIj5ALx9tIuasDedetiL2eIyrTy4jiNGHhxuiPYhM3ZJh8nOSRWkTtXfmpcnKML5
         Oe5YKXpNWckYq9oO5u7jjO29gBmjtpzyRwui892I/B7BqwaWZJ0xgchCH/P2gOw9nQ4d
         VxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764933618; x=1765538418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Hw+hQnLqhQ5fWhV7QpMHU3o5deWeFh4Klr3pvkARUg=;
        b=s+mPMID6N05/+UjiKrkQRLLkMsOWNblRJui5oBobe0ZH9B0bsKCNB4YSODvfLRLD1A
         DEIT86FVf33Md7d43MTzXrZDdi1qdBnuSjnaTKJN2d5gr9m07phkioSoeL+8wF9fERQD
         cNZC75UX0GMxkdbGql86ExQQZ0oWVgjTEq7teV6UuVKqVxGdnLuFiLR8RpCsJlbTIL/T
         V8VO8z7OlGDh3IUhd3TWMi5qOsXJLhYs05ACUoialuw4vIIp8GkT/yGSDwHpDy/Fz5+A
         /wrfWJcxVYFXPjd5rRDY4G6W0h/nypGB+92TzsI5vghzJ+xzbmGcaRTfEyKk3hT/XpCD
         CPDA==
X-Gm-Message-State: AOJu0YxAz1Eg5L2HNJXSHhta701b/eLahQhEiZZpCBDtA1N2dW0m7wfD
	b+cefE17IOlhJBUpDfhrmluF1lBMUBWEp/ohV1tYAu0tRcgYIYGeGnDj3TMgxpfPA8v9ZlHsl7U
	5Lhj6lYkab+FX8KmeZW9Sxdz1x/7iWHIohNQwbZSNVXsHNcFsX20o2hwvU/KZAE1Tolx6
X-Gm-Gg: ASbGncuGBmc+3ueVNS3Cj2idxgxkaqQFS6alwksjNfS75SQkAo09HS9yOlm/h6IY/wf
	N6Aqtuy1ypDVidP7IBQi09j2ralS08joTWX4AL5xqUcENAtELs1ykyteKgQA4QOSU9iZ3JVNLa6
	k+OQMoQdRwq1uVpLNZ5YCmsPlmgppy96beKRqoNS0wSCh5qLsGd94POggfMMwychghGLG35RBkq
	7f/axIy6B2jYTXxlpPhBg/7PMVEclSBzDnpilkDiKDPpzuRsm8dP6qud0aPogb/enkLjaD4JX7i
	P0QwDyzoEDsKdDQBrURIQ6jS4XUrS/Mv6gN9Fgd4nHi8wJYURFgDjoBcMdj7lnEpIkkwGNCVw34
	TcHpmLvdWsn9kiJM+U9z/UbNphXnNAe/cd13/bX7hMUSVmuY2LlNDBhM9vNBDi7UbEQ==
X-Received: by 2002:a05:622a:181a:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4f01b171b43mr96400511cf.5.1764933617606;
        Fri, 05 Dec 2025 03:20:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyLlJQTD7B6oMAHQIM+JvPQHMynIdpRsVwcxKHsl/Zs/PTL03EagDPNN8tDw65D36lzJ5IrQ==
X-Received: by 2002:a05:622a:181a:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4f01b171b43mr96400311cf.5.1764933617129;
        Fri, 05 Dec 2025 03:20:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f497674asm342960466b.38.2025.12.05.03.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 03:20:16 -0800 (PST)
Message-ID: <93a4071c-d2dc-451f-bc4d-defeafe383ea@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 12:20:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251205-add-coresight-nodes-for-kaanapali-v1-1-d3d2099b9b24@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251205-add-coresight-nodes-for-kaanapali-v1-1-d3d2099b9b24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=6932bff2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=xlrG_fDB6KsmEz-JsE8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: jhJpIVKco-GkDzbEITB9Bu7ZrRtkc-MQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4NCBTYWx0ZWRfX+pKeuTQbO+7/
 35+4lQGW+L+CDlCcMj2lhoMafzTD4fbQCHbM/WmYCTX1l+KzCOW0x6bfd/I7pvQQeQHL/n4QLW+
 GPwCWzO1s+Hum1DsVocHbEyWArw2N61Uus8uMPx27nSt8U6PvGuhX9xNnks7rG2TRaOlKBeK8jn
 A06y2QKxNR/Y/aTeF0hYTyeoGCmW6czcG+bceOUD6TqQ8lfj/IcB51fZte8N1OzuvTyQp7ydWlj
 k2lLkkxhbub7az2l7O5Sd7oIxnQ+Z8ntyX3wrfeoHf5QmFYPmsLOhStdqAJ+OKfUf1Mm1g7919m
 rKDESirtbxSlcmNTuHnZIs9jnH6lsREHlR+pAvflDMB1AsB5ZXzOz4xThl7FyR8z2La7+PjerdF
 2r+4O6EZ4RIF02Fw/0/6LkTc2leM9g==
X-Proofpoint-ORIG-GUID: jhJpIVKco-GkDzbEITB9Bu7ZrRtkc-MQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050084

On 12/5/25 9:36 AM, Jie Gan wrote:
> Add CoreSight nodes to enable trace paths such as TPDM->ETF and STM->ETF.
> These devices are part of the AOSS, CDSP, QDSS, modem and some small
> subsystems, such as DCC, GCC, ipcc and so on.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Dependency:
> - gcc: https://lore.kernel.org/all/20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com/
> - ipcc: https://lore.kernel.org/all/20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com/
> - base dt: https://lore.kernel.org/all/20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com/
> ---

[...]

> +		tpdm@1000f000 {

This node is out of sorting order

Everything else checks out against the docs

> ---
> base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
> change-id: 20251205-add-coresight-nodes-for-kaanapali-27948a5ddffa
> prerequisite-change-id: 20251204-knp-dts-4ad60e175645:v2
> prerequisite-patch-id: 1057cce23a42b5be40a6266d510bc62f756e3578
> prerequisite-patch-id: 9924e37fffbad0125759ee3aff03137bd1cacfc1
> prerequisite-patch-id: f7455dd4049ba647ed5f13e14fb99844340ccacc
> prerequisite-patch-id: efa90c4f38d2e85476f22cc0081d7fbb8a34973a
> prerequisite-patch-id: 7fc8429ae2438ddf1aa0f0aa005293cc76540f22
> prerequisite-change-id: 20251121-gcc_kaanapali-v3-ab91e1065bd4:v4
> prerequisite-patch-id: 9a9cd779ee23419a023893f357decbe09da1e42f
> prerequisite-patch-id: b7d46739fd97b16bbf635569018bdd809fd30966
> prerequisite-patch-id: 0baee9ea7681fe6b4ab1c69f1e087427ad0050e9
> prerequisite-patch-id: a7ee79adf85ce9c5aedca168a561a9560fa59b44
> prerequisite-change-id: 20251028-knp-ipcc-6b4189f71121:v3
> prerequisite-patch-id: 6cf08b941741eff023e37a6a8afd5478bdf0788d
> prerequisite-patch-id: 0ad500fc45e104a874839181b5ae59a4867ba1cb
> prerequisite-patch-id: 628073856ba29bc3ed64f801dda4c9c7d767f327

This list however should deter you from sending.. it's impossible for the
maintainers to resolve a list this long for you and there's a high chance
there will be changes/rebases required because any subset of these patches
you depend on may change during their reviews

Konrad

