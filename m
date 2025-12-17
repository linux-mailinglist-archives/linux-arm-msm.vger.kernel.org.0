Return-Path: <linux-arm-msm+bounces-85516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB6ECC9046
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 18:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85AEE312DEFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9204D363C74;
	Wed, 17 Dec 2025 13:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vh0VhrlR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NoTWZZBM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1638363C61
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765977787; cv=none; b=D3s412MqMj5KbmEBFqS37yHOXvK43XdLQwGs4u3qxUfsBohzboITutOaJk9LQI8E0udz1jB577ZRlcwFE+AM7K/NXwaOWXv0mZvArYO8XCIt1ytaG9v5NKdpxrqFK1Fs4VmO4lOhM+Vts4SrSM8/HbCAMX0tux5VviYt6jkkaJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765977787; c=relaxed/simple;
	bh=Zlc0vBXqq0Irlne4XboZzabyObkVAwR0n1DevPWYfaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQC5kVB1YIBREB9ec3DgZw5vrPuLFKvxZ04UCqoRQw2HRCJFNIKxGrl4W+zCWZognpiLyDZX9aluNoqEsWVzzZVyqo4ACpxMsliM+GhkEcb4jtYrRkIv5vauSXayRzZ4eQZvoQBWeXe0W6BdkjEhGfc7cCcaS3IZg1H7QRzr7Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vh0VhrlR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NoTWZZBM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL2JB3330357
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bs68MhyXjy7fggb+VYhXusf+j0KV8hvgnqpT+o0xydA=; b=Vh0VhrlRe+qfdspW
	Ke+P6MKuPj3SkYIbkzCss2knZCvJ57jGNEOImc+7DLIZBSqgdy6B+Mc+Y/e7KFZb
	DLhGjmiNDw+C8qqyuLVK2qnURttWKh09KVZ8UYJUnbkPqYpogVFNGzYZbnJMLRDc
	cyaynSEmqSHXVokaJM1+xzD43eYtRdRAlMK4YZwT9nSTCtdCDUrEll+kEUorsTH1
	NhnzXfiPNRGo41vXulp88CmIMK6wd/ASjDkk2huGxpgn/NXXVS8OCfATGfwic4sG
	/7pjJUPg1vm24XLtan8VSK92c/DlxLcYHiqmuRCkgfud/IZoWQxVPILZozhugJZR
	hZ/74Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkhjmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:23:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f34b9ab702so3070061cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765977784; x=1766582584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bs68MhyXjy7fggb+VYhXusf+j0KV8hvgnqpT+o0xydA=;
        b=NoTWZZBMZv43B5wAqdgxB0Qwgz+SyYcsTnOWpP/Goo2CJHY6/5n+rsUiDh6pYJVPcG
         PCXKsvNTrNnP2enJSs0Xe7AowKnwsV2oqt56JLdkfE1dyYF2tW+ttjgR0cYJvH7M9/uO
         NyOSP/5FqXZ2nmgZk92rDlTOtIITtkd5X0nCIt7BOoiUGJ6xtHFhxv6Kkl2ImWNfrHPU
         0pGWq7wEjiHCC8ns59LY+CQNbWP/xbw9cAdFhJXyjx3WnKae7Z058i60Zvje1Be3IrGx
         SBvD98BkxY4c/knPrf0HH0jC9MJMpowy+IFHIFaM/rBX7AiqwOShnHBZt555KuJ0g0CA
         g3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765977784; x=1766582584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bs68MhyXjy7fggb+VYhXusf+j0KV8hvgnqpT+o0xydA=;
        b=GpsIco/aUaET24BnwyFFtRk/AVjQtSU+dfoZb6SwDu12rlnlUgLs2DfMfyYidmCjyj
         2HwA4ulfcBy1g+eXFzbjBw1htLGZwIIKsSwA9DvzT6uIcXtlxWfXTVvmWCU4+47e6l9o
         7VG+LHMbVWQRvC44aO3C/1KPJU0ZyhbQZf3eXcSIb6KBU5S2kT2lLC1rVMMglvzavWum
         8xnn298G6FQSgAVKcIhS8/IgWw0d8uqQZPz86qyoaGpKsPqVKGmX3eZ7Owu3EadbO89G
         5V7Z/R3LPeiDzawH/h6PPThax4YaoIRQ/tynMvK75yPdgfYK/Lh9jfzPim13WPZEadIG
         MT4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWN9v0wtj6ZGSg7YvIImkt5mlnaFikb9/5ph6/G9XtwJVh+wxcadq97Gha1vh41oZ5JgkPHTlmfjWgcaKXM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx6e2ghmYe7tFcMouRhiI3bDGR5cgVSZm4ReBShYj636L9oOzs
	K7auzNKyelGqQSdLptMkUC/5EC1mlISt65U3gLM7MbN1t3h20MNva1bgWBeglWQvmvM62ykLuAL
	XnvZlLdvDHRH2EoQ4GEqK0tpHE+E0GUNG0tDNLiH98FwkY+rHCZL3v0gVPtImr3vQnLYv
X-Gm-Gg: AY/fxX7V75sBTAb3d2DIcAcmgHbmEpGRB+mQtDmr+KBJ+kknAxCl5aUNnzthupLl8M2
	Cxc4PBS5dSj+e9qTDLrakiJFr8I1z55hxbh7H3Ss8LO5LsSCQp94tyzxOGDhOr5nSxx5miCNFgM
	Ohg1C/IxsqHnGyjpCiK2QtmFqA9+HFESqk+VBx/0Q5VSfayZe2ygQ6wGg89QkQ7LIYB46hQj+WL
	k6cf22XRX21u3bCkygkm2pBSZk0dTU1k9lSrsoM3yKAVFmv0gnXgNWirXJ7mXCm7iK/ZzkqjICA
	K19VVrqHOMX/QZfqBgHt6+0VnUM1YmUsj3xQV/0tQqNsdPLTalGVw2e+ObWt0y4C6aD9Yz2wOUa
	d0KDXbNJJ15l681L9PT2Fu9KirtMdXQjeldXw77m7wPQ7pBGpj/9jLfyZCCy7llyGDA==
X-Received: by 2002:a05:622a:4b:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f1d05fc5acmr193029131cf.9.1765977783899;
        Wed, 17 Dec 2025 05:23:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpn5aLn1iOCruV7FBHk9VV/Ny6pCd5cdcHqaZz8vOqqKcrW2tjqlTPVxasp9W9wjhhdHf/Rw==
X-Received: by 2002:a05:622a:4b:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f1d05fc5acmr193028721cf.9.1765977783290;
        Wed, 17 Dec 2025 05:23:03 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29eb76sm1969402266b.12.2025.12.17.05.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:23:02 -0800 (PST)
Message-ID: <ed17edd9-fd96-4562-a3dc-45cf7185f66a@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:22:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] clk: qcom: Add support for GPUCC and GXCLK for
 Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-11-fb44e78f300b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-11-fb44e78f300b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iEO0nWdl7Sb_rmcp6OmcsOxghGTo4QKD
X-Proofpoint-ORIG-GUID: iEO0nWdl7Sb_rmcp6OmcsOxghGTo4QKD
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=6942aeb8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=91OgtvA7_0Jf-gwRHFQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMyBTYWx0ZWRfX7/wDvpwTzYeX
 VAYI8HtBMRwrZx0ggJ2fKJRQLVXvzFw5Dq/rhr7acU2DoVDtHmwIxEewMthSmq3vrEorZxlFT+u
 NsvFU94bN2PJZG6lECsistvB+buZvjFBu6607jeTj3pn8EHPjmF62s8L+by4ScesoastRa7l3Ud
 2bWsyKNipbrJtC40l3u5X7AUamTWtYNPN8xetwE+nFkiAoAyo69j44wOZ1aWif/cocp77nmw/+z
 m43g07IN2QbG/z3DvvSwPSSYcVDRmjSNyrhGsS3HezNCrVcTWmrVjFLdm5iaTdbEK5ElcKMIVs6
 LTZvA6T/PWoVP7ZA0/zL4pgWH04ag/ioeUC3Wys3aMAA+4tO9CgOrSFBGUWZeiMa7m3sIvAzoXB
 hDBG18AhoU5eh7BGlaMsxsGhEBQ/GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170103

On 11/25/25 6:45 PM, Taniya Das wrote:
> Support the graphics clock controller for Kaanapali for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig              |   9 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/gpucc-kaanapali.c    | 494 ++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gxclkctl-kaanapali.c |  76 ++++++

I previously proposed bunching the little guy with the other
object file:

https://lore.kernel.org/linux-arm-msm/20250723-topic-8750_gpucc-v2-2-56c93b84c390@oss.qualcomm.com/

And I still think that's a better idea. Alternatively, we could
create a small "gxclkctl.c" and make it common across all such
platforms, but I'm not sure that makes sense, if for each one of
them we're already going to carry a gpucc-xyz.c anyway

Konrad

