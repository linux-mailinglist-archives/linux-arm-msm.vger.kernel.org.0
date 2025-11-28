Return-Path: <linux-arm-msm+bounces-83748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 989AAC91C42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3356E34BFEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4455B30DD03;
	Fri, 28 Nov 2025 11:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADmtW2Wc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkaVUUrh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878052B9B9
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764328447; cv=none; b=dcM53rtydOvU01Im8vSQM8dlj7RUQdKLE0bgQh0tavRmd8KHdtDuMAqf16QI8VPnXnS6KqRaz2+HFJROuR9QAEvfbn4dNThzUgy4tIEovwfxrtgPDXatJbOhZCJh14xm54l+hRMayqtbDSgNTnx73QixFxUAxj5sgR45UriW+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764328447; c=relaxed/simple;
	bh=6NzDnvCbY5+gujzQWHG1qdZdNd93vkH0QwTbqAYAodw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWMuW704JtrPlkEg5ukvSvYueykCrrEvNvIAFNBmMowHzlH+Wc5zYx6exi4bJuu+M35Ux0nwGdCSgcFWN9RPdDs6orr5cS1Cu1P/Yht507vY667X2/uwMJrzFtP7XRIykgzSer+D1u0OwI4c5iFNceSDk0kSk4ug5fhSptsTyAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADmtW2Wc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkaVUUrh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8NwvB4191783
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdyKjK3yUTxHRTsH7ahf+Tg5v4W/bvGpPBUZXxSBEsI=; b=ADmtW2WcUfZwjBrl
	s32sKJl0sy1zW5ji4DcsTTKDFCexmb0pD1/zFeGaUSwIMAniuH3HPb1u1lpdu4te
	aUtrCxHlu8pPr9oUHoc6f3UwTkbdRB8hq2s0R8yB7yj0v2aslf0vdYGFmPlBeAXT
	s5NzeeZC8MR/lSWjpDTQEnKueFEzEIgFG7g10QK0yRQhMRagmh0W+ZDgoGWxfcFn
	hAxRuRY9GtD1h9Unxm4PYGu7wF1lyg/PY22t8eL5H+D9/u/Q4WnRvNO+bP5aJE03
	qxjjquShj9IneP7ump/wxBWg/raRY1DGRWMhoXBAzyyCsF8qsCvAqFuZ31lxLY7N
	AFIXKg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq58fgyk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:14:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaa289e0dso7086411cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764328444; x=1764933244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdyKjK3yUTxHRTsH7ahf+Tg5v4W/bvGpPBUZXxSBEsI=;
        b=fkaVUUrhEgHTqn8bPI+k3wG1O2XNKDl0ncKJz4N1W3tNleF369Brg4nGk0ndQw/AOV
         5JU/xtIyzzZ8M3Wb2O7FdS5FWVvTGSjc6I13t22ivGqRZaY9zHOigiZ6SjkgWDDQjK1D
         4TdeFt/sVybjcichXjqGGB8A8Z++D0H1fY9L6/zk7meoTgf5vQsUmVGj9U67O0RSIRVG
         nw2/mUsgG45+Sw5CzO9gVpk5AHgYtGzI9rvLm9VmRnAVp93zna1INf0Kg+OkckEBb4yw
         7LquS3ZgBHV5bK3Q9G7Xd8rjAbi9oi1GYj+o0Y9o72fVYA6Ms9iA3IAHroiXWj3grwyw
         1YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764328444; x=1764933244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdyKjK3yUTxHRTsH7ahf+Tg5v4W/bvGpPBUZXxSBEsI=;
        b=rRb93srxeUT4JSZGJYr1F2RIpS43cWderB3JjaAab7IyofCWDjaXCLizdsDsoyH7Mz
         aBe2RGIvmqImCJE8xCDkhvVRyCnVy8RTvNUPL7bwyk7Mk5G/0gzrpHFlLDn9aThvTuwG
         XtDAclxmJ0z71vtrOYABnQOVfJfAWSm006aYOZaXxQ2aQ9q+xJGBAdJAiULtxtN0NKsh
         RNTE13hl1EMreDFxrl0krLjBiLpkTBqOu/PCbZDPw3ApDafQzJqcwl729ev8fa9bCA8n
         gYUBm+MMTDMgLnlcTtTXLe+jDUAFDh/K9uxKNkTNtYXEjByzOFOATrM8H5dipvwQCTuw
         1Jog==
X-Gm-Message-State: AOJu0Ywm7ZXfDhj6o9POMMLmYH3Cy0lCv8bvuav4Py/XKIxu0YeaAu0u
	E9VWsaNaLnch2OpKtHpMaLI19MKgg9AES26ewFwF4qJjCY/6UnrNxbhWmahqW5GuXlhQrhRgn6j
	6IBpuAWTfSapk4nN6Q+WvvnUM9ITJ3Xa7KXqzMGUqX2V6jSAF7s8/tdoFl4wJdDRXgjMT
X-Gm-Gg: ASbGncvlVB/Tv20BxosoZkOh9WWZcXZcHjJkTogW+zA1O/mYXDyS+Qu8kBo2Dt+dEo7
	g1x+i+1vY8ulUK7ylBVZQX8OT21LGNVNbAqrgEd5pSx45cEFAp6CeEjZP6vysQJ9/FYZS3u2f8Y
	8NH2J3M0BQWfJeZ53WKzA7yRL5lAkzZVRBGKYXy0eVWqROLzkeklkKtgOv+7aAI9Z8A+AXG477N
	4KkrNaeBPbqr7wbAvTRpe7T2SB46sBP7J85NM3R2cRCF5jVWn9z82rYqKGDeMvL4Dj2jBdJsZYG
	NkkLkuCIBcIo5xXwnQ2xuv6EyVD7s7QKGhtgEnUn7+UGDv/hnZCxjM+u1oeefxDFSxI7iN7sCUC
	0zscxzIz4BSumbS2OfIFHcQnkW2xydoGTGwkOgKeE77uU0s8w5cZ8mpaHyLdXDJIGNP4=
X-Received: by 2002:a05:622a:1349:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4ee58941ff1mr273986151cf.10.1764328443927;
        Fri, 28 Nov 2025 03:14:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmPxjenl66dAD1ohk5y6pxaCsYenI38wsjZB+43zYyXsnS7DPABguezN/7WaotxWC1ngm4aA==
X-Received: by 2002:a05:622a:1349:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4ee58941ff1mr273985821cf.10.1764328443520;
        Fri, 28 Nov 2025 03:14:03 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59eb401sm406059366b.54.2025.11.28.03.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:14:03 -0800 (PST)
Message-ID: <b977d495-99ed-4604-84da-bec39594ae10@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:14:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] arm64: dts: qcom: sdm845-lg-common: Add LEDs
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>, Pavel Machek <pavel@ucw.cz>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-4-a5a60500b267@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-judyln-dts-v4-4-a5a60500b267@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qgI5g7prwA38JWKE861x7w3ekQsqAI0O
X-Proofpoint-ORIG-GUID: qgI5g7prwA38JWKE861x7w3ekQsqAI0O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4MSBTYWx0ZWRfXwH8hewvwfKQI
 JdRxIANSWu9kk4P2w55nTVxL+fvmWuaiCP8iKkYbVpVFt7AuHUjTJl0YBldVCZ2ANfB+ELD1qXJ
 UXrRsWg4Ndnm2v65OdBeqRfNwo0H9nCyrU+faHzpzYc784O92UWmWf3VVJvl1Znnd8/vpXpToEu
 HB2MoFj6Wq1qxSXh/5qb5zoh9yGm+ledbu1ix0IUI9WstCZiV3lf//RLAJEbOY2nNebVDQST2gV
 CEVqxhrKita2EYmdb0UuurLt6c2oHQfcGQCIEPA6UIebyShsV5pH/LqoDa3pUy8rTiZhb4wT5Hb
 FLDXRPdTjWCkiN7UD2gUf9WeMvRdO/HMw2R4B172s8hFife0j4JMLppbyWAlNy8nReyG3L14cZq
 Hd2w296O3mj7iFr8ypI8wrjJfpIReg==
X-Authority-Analysis: v=2.4 cv=E6DAZKdl c=1 sm=1 tr=0 ts=692983fc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sfOm8-O8AAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=Trm0UzkazMAc2BRhCbsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TvTJqdcANYtsRzA46cdi:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280081

On 11/25/25 9:12 AM, Paul Sajna wrote:
> From: Amir Dahan <system64fumo@protonmail.com>
> 
> Add the multicolor status LED in the phone's notch.
> 
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> Reviewed-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

