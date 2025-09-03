Return-Path: <linux-arm-msm+bounces-71816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C00CB41D17
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D446C171285
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60D42FAC09;
	Wed,  3 Sep 2025 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmyr8uJx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A822EBDDE
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756898977; cv=none; b=q0Try1OnBx/e3fHN+HHlgH8sFXwilaoWdUvhOhEv2n2PaKhXivZeG6ONfJ5RLW8T6uswMY+PmmyacGH/493KziQjhlAcPOKgQfr+RRUfqh91bVXQRD2i60CZr+oU7vF2iiuxG4iOZWABBXSauI4aF+pYhKhqZiGfAHy3Nv5dgn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756898977; c=relaxed/simple;
	bh=+ii5ePXVtRuyPwTD5x9Lo4Y2oQsXTwdTUVmZ0nXZC5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uJl7VZqZIwkozZOFUsygxnm7Urt+RAyfySR98n8a4Q21lNXQ4kvNzok0O8cC/6NmgcUhDYuYgMieylPlDwuXxjyk6jcEKifMP34824q1hj+LE9Xdp0a4nI1Tu9WNlGO3Xb/kVc8dp75fRMByyhL5oLhh37CvP7xgyVAaNQVlxn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmyr8uJx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEwnC022946
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0DlARa6c+cT5Kx7CXdcj/rxubZTPaG6M02eCca75WUc=; b=nmyr8uJxJ6etqPP0
	b1kmFIR4J1vwBabmRS39wXQngdBbYQL9ssENpoYw71UdRLYJ/tDruDKHMPwKfKwe
	RUbkIBlPRXXcBGAdX6oIkDXLbaCbudFuzHf3EKyFrZ6bvwneOfbWCyRF8iGFbbar
	SVBx/tS9is24GRc2GsDkQyHCJ07evboGykmbwnfaQU8cye3qXatbiGxzXDVORmrw
	78zJTmYocEplG4rMs33Y4WWe6pLl72vGPL7UAggWb/ADOqpnoHTstC303x4HeQhk
	HqU6YrTlmlEe9kJNrQi2cdhPAlOpiam1O9rMgO+/ODHUCpmV0z3HqcI9DWK3ZTHQ
	ckBYVA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ekjye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:29:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b33e296278so4530031cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756898973; x=1757503773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0DlARa6c+cT5Kx7CXdcj/rxubZTPaG6M02eCca75WUc=;
        b=Gb+9JHTcKMiHdLsopRkfJ8mkEybHxZ0DNsJ+BJKm1rH6/pSGDASq10Xb1pJ29+Vg87
         HLJ3gfOFy/IReSinYiVJ+mGa+mJfmHGQlBCSgl2AMI0XJ4ccnfSWCxMIJbWyffIbocdY
         A9F9xSHehtyOE5WzugtlON1KfahPXxvYPCfy2Pn3BziB9ZQgqvq4SiXT/qxsPDTmS1bi
         87krp76cFE+Jtr+571LQbCV5krxarlxbWsv2nhFOCHivWt7a/HgluKzHnuZEvB3Z/Ovd
         xyoQasWkFoYjZRAdSPctk1cnnYqNrsTk2tDebqpdYHNfzLenXohxdn6CL1kfJJz+JOd1
         pIxw==
X-Gm-Message-State: AOJu0YwjtVpzfWz7LmkCEZBS3uo7d3nNbU9He2Xt6x+2umz4E5/P80z1
	Oa2CVwiRCnwbER5hhuhKkz2cLy9IJNF2iaVUjIj8zoira31RF4ZS1J4oQ44aHfmQ/mrFpNotFrB
	8SDBWj/HvKnK8wtlKmMsbGvExZnlaam8WfnQHUAPISD/G+2EYQ4ajNDVZmUg3weQVK4KCyPwdR3
	rB
X-Gm-Gg: ASbGncvYtJAIQdzDVUVnAnH9jIaeDpJ4U0Gfg86UKT3iA8kcoQCgNLfZLG+UVdKj4xF
	8PpZPzSCehTEJ173vvjlhsNWWd7mymoS9VCp1EGN3wgwUIYV9CIdG+Mn184cq/eVAdcmr/qtvoS
	rIwt2J2zj7OPUrdSq+NxFDu3FNjW/Ig3hVJTCA7ApCha6j/IMHPfudGEUyzgso7StO/HaaZ0z5u
	WhRlZWkwAH19+HXB6ZFOUUIpHi7kAB5YLIJGmwaKo/2eTSyPWd1MzYxbWrW1bJWyn8fozfqqja/
	WeygSoR6XeGD5KYlh7SgkPidat15qlpiudFVtWfsenI74g9chfOM+Qo3Z0C/VRLkFSHU6Twtjsi
	kh2hhkZkiQNDyG2LXPYmm4A==
X-Received: by 2002:a05:622a:3ce:b0:4b4:9175:fd48 with SMTP id d75a77b69052e-4b49175fe5emr12198271cf.0.1756898972979;
        Wed, 03 Sep 2025 04:29:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhha7kDI06WR5/PTkK4mODNgVoKoKqWlu2qkXEihO/vwGB+8ZKEGtbIdhREN8PsqTm32pSlA==
X-Received: by 2002:a05:622a:3ce:b0:4b4:9175:fd48 with SMTP id d75a77b69052e-4b49175fe5emr12197861cf.0.1756898972219;
        Wed, 03 Sep 2025 04:29:32 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc5319afsm11824675a12.48.2025.09.03.04.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:29:31 -0700 (PDT)
Message-ID: <d74e6c4f-6be5-48bb-bd67-c9b5e42dfbec@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 13:29:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] arm64: dts: qcom: Add display support for QCS615
To: Fange Zhang <fange.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        xiangxu.yin@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Li Liu <li.liu@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>
References: <20250903-add-display-support-for-qcs615-platform-v8-0-7971c05d1262@oss.qualcomm.com>
 <20250903-add-display-support-for-qcs615-platform-v8-1-7971c05d1262@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-add-display-support-for-qcs615-platform-v8-1-7971c05d1262@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GZB_fJm20pXhgwWIo-hVF6vjXkeoYfHq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX/LfXQMOzvX77
 0DBCgRDjbUXhEij8yXIxzVwAoaREZ+eEU2iowIgKT4zwNU/LD+EgptAWxsxhPJTqquc1hshRy65
 CQAFzOOB09gr4dnxBWK1DIbJoip/xNXewDXUUPY/BDMQjtAqbk8fyT7XbTyzzkMyAVmVAwjstbT
 vGtZMRwd1uxiB67V+ZzkjerXsjwh9sL8tX5gWKimmYMEDQ5ergcfSLWyA2EIkZDqfWcLhQbDSNh
 GH6ufEl4N8N833pj1oquJSjJRe+Tmsa4UTOR+ayKmiBW/JwCSMVHtcDKUeClpMu8F06D/yHWA55
 YfSCp0cjEZ0k4yvNTTiFNc7AsPfXdpbE+WJcnnkKyDJks/XXs39l54L2XWE4pYX/L7luV5N941C
 +arBL3T7
X-Proofpoint-ORIG-GUID: GZB_fJm20pXhgwWIo-hVF6vjXkeoYfHq
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b8269e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=7cbv3X7aQ-hLW3yDF-EA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On 9/3/25 12:49 PM, Fange Zhang wrote:
> From: Li Liu <li.liu@oss.qualcomm.com>
> 
> Add display MDSS and DSI configuration for QCS615 platform.
> QCS615 has a DP port, and DP support will be added in a later patch.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Li Liu <li.liu@oss.qualcomm.com>
> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

