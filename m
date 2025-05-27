Return-Path: <linux-arm-msm+bounces-59540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80566AC4DF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 133493AC20A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 11:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37B319D07A;
	Tue, 27 May 2025 11:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4YuzMjN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682EF7494
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347077; cv=none; b=lTiSpqoLAt5FjL8GURNxxFEEIinKZVmAr5zgDBL+YMEa04gamEiBmJoTp7Z696Ispd4Ec9qzYVjc+NhP+IUV8QBZUTSv8KWwsi09sIZOs/J3XfeUAkRyfU++cuWoKYvOvFyHBLKe/7AjVpmaA2YA87ckt9F6S8pX73eRzsknyUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347077; c=relaxed/simple;
	bh=iG7alVLRQPBLu2uFDKDhWTHeOCuXazt6XYy1LINh6nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlCECRkvA6ecW7LXp2v6T3awWEfKzxitm+Eh5tHj7Q8eeHr5HqpLjTMghmEWVrTXHmr2Bir6Ft7a0mmpGfiDhKz/x7fB6OCa/1fCjAkuwPmBQOkCfNWWxjkxiERiKEJJ8gD0UElCtM/NxL1IUjmrmTL5TuF97jvxA2yHXw5P7gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4YuzMjN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RA7Zl0026761
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00npxAYXcDwJtuc+WcPd16KMqvA6u6AGGT1iIUkKzfU=; b=d4YuzMjNLkLL7Obv
	rM7H+uKqKDuoTIoO1SJatzsEv/fL6jUIPwgSmmy4WBUC57SXQg8kdnjeBbnPYg01
	kRN4x1Pw3Zf31u6Vzu0PG5S6ThQtHm0KCKuRlsbcOYUOIy0gsd0FVoVP+/Iur2Gv
	HK+fERjylqJsuHzUUnAER2/1G0XcBFM29E9qlvfesLfA4Db5TiQzoVCytd9OskmD
	HbIJj8oU4PLYASb6Z93sC9dTugL76flTyUikUTw91PDZcbw+CDMxcn6fEuIqci2F
	3AJHHr631utVLtXGEdKP6bO7i41vOcqbmwOfVjoX4PbaksQB3ljRkhs32TQ0r1Ut
	7KdffA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcu70u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:57:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-49452798bd4so6480591cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 04:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748347073; x=1748951873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00npxAYXcDwJtuc+WcPd16KMqvA6u6AGGT1iIUkKzfU=;
        b=C8+kSYTYpB1dwXj16R+8zUU5IJH9wJbqLW0GU5ibm33iISXQw2Vq4BaWfl78BdUH0f
         nuYn9WFVVIRURhQ3XCZHe9CYp1dCXmQkRwok4QmN/TRKWPtBIppIMhVI8Midq8qaeYz9
         SFFpas6RB0jnTTTtTcUCOTF1ogboQhWNL4IFvUnjVWfDzYZNlt8YxUvkFtDJPSFgC03q
         AYwG6HIQvGy3LTDnvfEIp3Ux/l4k4oKoIkb8YQFitBeTLN8TBwNj8R2TFd6acbg4QegN
         EXAyX1ssUzPSWFLGuHQ3I/Jb55rs0GhuvdgnQZyk3RjSmJVg6L3h244zC7DIJPn4Px11
         YKWg==
X-Forwarded-Encrypted: i=1; AJvYcCXtvW1HQcoc/voJ94ir0Obn5l5msxiWED8JzZfWHjl1IMQlc7xaBgPHhiD8p6wkqPVib4YdQVge0Dm/76FI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/S2VB3RSf1RKr6mXTOXmluNNXrSTdH895wWCOKM1Ueq9s+MBC
	56Zlu9noTyd6yVzl21WmphtZWI9UyeW2iC0QQLcBd7PNLkntb434y+62E2TqIDK+EJqnpdUuzHL
	R5+Ti2vbpD7A667wRqLeAdLfoURgI4TaCXnj/rmNqPJN2ZTVKZhTHkPXeqHN9oH+Gd+UU
X-Gm-Gg: ASbGnct/ie0zv3MkdM7fzGFCnBghTPaEKQL2Nbk74nM5rloPPEPJ/ejEFVvpvUqzVxR
	vdDlyr5enJ38cfEjV3xrpzO5oSVuNmwtTmYAueXo4PMeTALKav79T4/5R9pUqkp1IT57zT+Q7Vn
	nhJbsFL8uDeA4CVirMHRs9YwKMPLC6nJmr+aLAgdGz53lb5EqJQRm5UwYg9ecjKCsRl8mbkhcNd
	mpZP/yJGGAS8Q9wDdNUh4+2jLzd2mcORgIQFLTDFeQWictt7YPOiJJPyTilsfZaysRfWfSgkt2g
	dLtVB7sNKbjWuf/bR9xZ2ACTj0m8prEUjK1ABejHhphyRXh96k+kZuLoL8S/0ABRCQ==
X-Received: by 2002:ac8:5f4c:0:b0:494:b4c4:8d7e with SMTP id d75a77b69052e-49f47631130mr73699081cf.12.1748347073198;
        Tue, 27 May 2025 04:57:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER2zMsxig6MWdo0BnCzVG0WnNdmIBLmV4Ag489VTpniSStMzoJwJoKznpWShclgNRbJnN9eQ==
X-Received: by 2002:ac8:5f4c:0:b0:494:b4c4:8d7e with SMTP id d75a77b69052e-49f47631130mr73698861cf.12.1748347072756;
        Tue, 27 May 2025 04:57:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5b192cb0asm1057955366b.170.2025.05.27.04.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:57:52 -0700 (PDT)
Message-ID: <c2ede70b-41e3-4009-baf7-afc6c2c65949@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:57:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] CAMSS support for MSM8939
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N4zUVFSh8E80KJURxZ-YtPU5bqsb5SDn
X-Proofpoint-GUID: N4zUVFSh8E80KJURxZ-YtPU5bqsb5SDn
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=6835a8c2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=G1DFoxIfSOwnDC_JHQgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5NiBTYWx0ZWRfXzvmFkhu+ku3a
 l5UBNh4wb6ADu6S3yAm9W/vRurqy9ThYEBOTdF6BbuBOB+Q4vzrX5+JXZaSrodbstsIoSXKjJQo
 r1EugLmUsliWx7Ys46oBqD0Hm3zRwJLD8QpXRW6s5WY6CsbdlE2fI90NJhG2YmoFz68kOum/rtg
 YTwnM2Km1KmyePJfxMJegC0pciY/JmWTe4MCcgKloBHd6VFgR42kiX4bB5/rpddIj7bUcy33p2Z
 QtYRPIYWGTm8fZ1vzNfUKy/0r4YFMfZz5ybGmtqrMSRdctnBGOOejtSqPxXHQX5JyvKd5bmpESE
 dF95vTKtTuWBnEb2CsndZjFO3bNusiP9trbAC2NLNB8vW3s8zcKjT7HhSOGQc6VHAlMDzTNyY6m
 ZEWy9w+GsA8TW9Ua76bhT6JedSvoM/JiLvD2NUi9SesgDeGhZAL4zN+KZp2XgxW8UmjxkUy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270096

On 5/25/25 9:25 PM, Vincent Knecht via B4 Relay wrote:
> This series adds CAMSS support for MSM8939.
> It's mostly identical to MSM8916, except for some clocks
> and an additional CSI.
> 
> To fix black stripes across sensor output, and garbage in
> CSID TPG output, 2 VFE VBIF register settings are needed.
> So the 1st patch adds helper functions to do just that.
> 
> Patch 1: adds helper for VFE VBIF settings
> Patch 2: adds CAMSS_8x39 version in CAMSS driver
> Patch 3: documents qcom,msm8939-camss DT bindings
> Patch 4: adds camss and cci in msm8939.dtsi
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> Changes in v2:
> - Patch 1:
>   - Fix devm_platform_ioremap_resource_byname line to not end with
>     opening parenthesis (media-ci/1-checkpatch)
>   - Move camss-vfe-4-1.c handling of VBIF previously in patch 2 here
>     (Dmitry)
> - Patch 2:
>   - Declare regulators in PHY entries, not CSID ones (Bryan)
> - Patch 3: (bindings)
>   - Fix bindings checks for new errors (Rob)
>   - Fix properties ordering, code-style and example (Krzysztof)
>   - Sort reg-names, clock-names and interrupt-names alphanumerically (Bryan)
> - Patch 4: (dtsi)
>   - Move #address/#size cells before status (Konrad)
>   - Aligned CCI with msm8916, thus removing ispif_ahb mention (Konrad)
>     If "camss_ahb should be unnecessary", it's still required by qcom,i2c-cci.yaml

Give it a shot (with camss disabled so that the clock isn't on) - make
sure it's off and see if you can still access i2c.

If it turns out it's fine, we'll fix up the bindings instead

Konrad

