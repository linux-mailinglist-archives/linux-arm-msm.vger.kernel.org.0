Return-Path: <linux-arm-msm+bounces-78348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F5BFCB9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 699C119A5BE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 14:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570BB345749;
	Wed, 22 Oct 2025 14:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gWwrbQ1V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FB521FF38
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761145050; cv=none; b=WxUh4FryOoy9xO8IwRec4nl0ZKRykCsoXzOD7n6rzu4RjkE20R4Kwte3gW2XlC+PdJNkMszGBLXksEpfzgCGhS7wKL3rORsKTq9T2BcwzQvyyFK9lo9Ml7M30e/Cw/lJ9X+kzybE0hqc7cj4ehFJcg5g1Eir7jsizcb2Q3GQGgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761145050; c=relaxed/simple;
	bh=Fu/xZENpvKUDCqtMVUsRDY9BZMxdH6Bd0VluzWRBRqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tw4GZ5B5hUgRSMt1K0ww9f4RiE+GYywntWq/9WvuksyUyE6VVYUoNZLpqeVv3ClDEGVN9A+WGJxDz2QiJdMa5jbrV7ffSDlcNhXRd1cPeBiiBg7meVbVFYDu3ekPBjdPwdpHb3bXyY6vcjn/gZZPGW5C8lVdr/38VqAi5tRiqig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gWwrbQ1V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAQN8T005281
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XHmPuHvbq0iDWkg8ChnLVtyO9U3YUPXFEyBFJyWCxv0=; b=gWwrbQ1VD+IlmlBq
	hY5PiYCQFfIANZ07H6Qo9wpdzYwreFrr/7Og8JkvInTDEV2wq6jfRs0J9R2gOl6h
	XIpssiE2Z/qp7wYQ/u1u7KzA5oJ5rKS3P7B1ArFMFzwcVmtYsMgb3oXQpXZCibin
	DWFJzThd+udW5nusWLzWiPAOE3/DmrC6I+0mPEcdvqYBW5yWcC+qB+QkX8UjzA3r
	Sr5TxZvO7eydoNA8l6pmx7ya5zG1vKK6OPU94spFJqQItlPioJybGwQpTfm576w/
	IAmIKHZoASkXBjuN7kEsUAC9j/TbH2LCAr6adXi1h4EGfMXLB5msMhDboEs/WR9C
	PH7kAA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfn0pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:57:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8afec1169so3734031cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761145047; x=1761749847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHmPuHvbq0iDWkg8ChnLVtyO9U3YUPXFEyBFJyWCxv0=;
        b=cL9wYhbERwIQlHO7JFGxlGKAOgLk/Vyl+xGwKSnZ3U7piK+hFGknj3RO66+TEOw0xF
         EHdNYywuWViZ4NByfG+sGVMWDrVpJPSUTH3M/3ebmCX+OJjLOtDpbVm8iJwpx+vxT+JQ
         4L8bxLnNVmSVRJgiASG34bH/CcHpx8Bx9293TgUOAebZl4Yv+V7jL6IyeGbAUSDawfg3
         1lP1Dvz3zBL9rmFIyOPEcl+hsSOdk5C4CuM8HrtvcSTh+qj9+WxmdHdYVBhxG1I5qfFS
         XoFFqvjEMBEk4qJ8c3AvzkmS7N84P6XxDFW90b39vQ7c6BYu8E3FyhhemdxAV2W+ugQB
         INaw==
X-Gm-Message-State: AOJu0Yznc5EZxoNxFqJTNobMw21uXmC4mt2m1V4HKZ8709D2/8skbgDR
	rNT2I9aAn7yevNyF/+4p4R8yI4iUGUw6/5pz7ejYdm79vgOgVYLZqiKjC5MID10yreO1Z8oW/ua
	ozKXxfNTCGbLsI+4xXn1Dzql+eTEeQhN8heZxXHFeUSeDf8rH8T2kuifYL35iC1AadK10
X-Gm-Gg: ASbGncthkO/g+gvu49U2b6h704HBPCwqe+aXzT3ChRrCOmNv7HSutdcKhxWkQ/iZXoK
	amVdDyOUxDOG6wcb8PDECMV1xPb+RwoHSQEOKl8b5JiY5lpfJ9UYpwlfZQwq73BpVW9uPsDEuP1
	AstpGxVcoOeVCcueCxNyG3fPajOZh8MBdVqdBIx3BC0DpI8b7WHT+4j07tM9kzUyxxh/Rfadcmp
	D+dyJA7NIPQDLL5kzLTlTGBn8IsEZ7f3XurFxLvb7UC85S+w5w/eNkbxh0ZOfTldGhsnQFMUWVc
	qVJR66V6LZQ5b6wxaJLtIXGWb1XklBZMlq1xFnIC0bKgaUUmuytZ/DTnCOd4+LAduM03fzp0jf9
	PB1rs2ntb9+AYsnAZOM2Xyl9ruZXijmA1sK7ZPHmyRl1E8MQ9uf9NFRyc
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id d75a77b69052e-4ea1178251cmr60623611cf.10.1761145046790;
        Wed, 22 Oct 2025 07:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzl5V85OA3sPbLu6H91feQiKyMJQoUwjUyJ/NoAGCjE35UPb9mS8kIWjXkh9TqTGBEiHskXQ==
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id d75a77b69052e-4ea1178251cmr60623311cf.10.1761145046263;
        Wed, 22 Oct 2025 07:57:26 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb731fb3sm1378835766b.69.2025.10.22.07.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 07:57:25 -0700 (PDT)
Message-ID: <4e3d6a1f-8bb4-4232-a629-2d20ce08ac6b@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 16:57:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] regulator: rpmh-regulator: Fix PMIC5 BOB bypass
 mode handling
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-1-5c7a8e4df601@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251022-add-rpmh-read-support-v2-1-5c7a8e4df601@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IdPYXIe9rMudQ0r8jm-WTFiSgu1AipUf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX5qwx3HsAeImG
 TlVLe8+KwCQ7FQMMFcN8euPUstPO003DEkA66XVrxl0/vWJ2TA8jY0dC1w6AaeFBdoCmxzhbyNJ
 qCOoKk1BrS5ozwpmvBwwT7/p1YIDeJYJ0t6g2pyOUYRoIuoIX6XXAMF9rvEk194KGMPibmUfrA/
 IyzGW65r8zUurYXMionny5eE8R0EJm6XYVPN0NJJpAdKvd6ISkn0TAIbCakl+mpJy8+RnopT9Qp
 /4QShiCJPkJhMGDS8MUF8I1d5t98z5BQ950YVX/RBEYb8VbziXZo5FMlALGkZQqcMnhWiu6OHQX
 UOnETXVWLm2smb4W4/sI74vc7GUeoWQ2hbaro/mYlaAB5jHZbI0DyKbxmhO7b9B7RCAhgLCGrZI
 neM+RydaK/lm4QWfXKRre/0T0RIr7g==
X-Proofpoint-GUID: IdPYXIe9rMudQ0r8jm-WTFiSgu1AipUf
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f8f0d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0w8jFtCSA42vhe3mVSsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

On 10/21/25 11:08 PM, Kamal Wadhwa wrote:
> Currently, when `rpmh_regulator_set_mode_bypass()` helper function
> is called to set bypass mode, it sends PMIC4's BOB bypass mode
> value for even if its a PMIC5 BOB.
> 
> To fix this, introduce new hw_data parameters:
>  - `bypass_supported` to check if bypass is supported.
>  - `pmic_bypass_mode` to store bypass mode value.
> 
> Use these 2 parameters to send correct PMIC bypass mode that
> corresponds to PMIC4/5 BOB regulators from the helper function.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

