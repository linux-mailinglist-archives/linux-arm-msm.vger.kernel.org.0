Return-Path: <linux-arm-msm+bounces-86865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C512ACE73D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 16:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B9BA301225F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 15:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C358E32B9A4;
	Mon, 29 Dec 2025 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XeMGwU4j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T5J/6A0B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE5026CE11
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 15:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767023003; cv=none; b=lPp54bwAH+3Tisz5J59ICuq77noD6s8uU3+lWp6cTD4cF/suUoG3YKRuxXjQwLjaj//OF4S/NVjD28md+dqz8YIFmyKQ7Y7KdKzm5OLgCcjfeY/f7Csbsh/HPrgeVxhLdQ8M0isNJKowgOeNWllkaAa7HcZlXSag/9jr2IZAGDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767023003; c=relaxed/simple;
	bh=KyDA5jPbitptgL8V2pPJ7YAiOEfGG065+97UtlBDPwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UpO3f71q6c3vGVcoWA7xzust+p5RWWU9ot2MPOtFRjeyyNBuhV4rsMC5dFL2pt7ezZ9jTdx/lfzzFWIs/g0hKHn/SRRsY1otgP0IP/E60kadIvwZTrlAwSEhicA7wxY55yUBLKiOWNhUxn9/hXVP3A74NPRxJNwu5Y2souS9b70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XeMGwU4j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T5J/6A0B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAaeG73707398
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 15:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tDPZx1B4hbN1p8L7tZRDpAuAg6RUpSWIFhPjpfL2tQc=; b=XeMGwU4jp+mQjeAd
	pMvAeIWNMCKYZlcJJT/bIDE1yOXUnFYFS7boNhHpcXtafjUo7V1nFY5R3foeh2Jm
	BKfvotKU2wEQfr2JFrYcv5fZZKnWPyJyIBMVlPcxr0wicAxPwFMOa+UKE0d9VE85
	1yfh2w5Y/Of3eLozY+Qg5tLCJ1jP41o6bdY99c9l2B7GMvAWI9zR09xOJWbkyy2a
	fPmZ/rq36dQApWPnyzCE1K7lTjjT2nPzXNwZagtvPSra8n0BlH2kSGkPkAQ4rrZ1
	kG6T9zj435fWZBVQ5xtZloMxkjmpA/1Z1AbOudI2Y/GQNOc/qzG/fDZ2ho/8pk/P
	+RCB2Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg4rmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 15:43:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee05927208so41267321cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767023000; x=1767627800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDPZx1B4hbN1p8L7tZRDpAuAg6RUpSWIFhPjpfL2tQc=;
        b=T5J/6A0BWG/DvHt22pCuLA9uh9sHNrZuPIE1MAxPGDz0Uc/OcsagupvepDmptPibIT
         k0iVQcUz2GvkX/Z0orAPloEC2IYPhOw/sQWdJbU5jlZkQhqcd7lo598/dS+nMx4TaqzF
         X20y1WdD+AQdZaIruGJnjVlfdFIOjaBnbr+AKcxP1Ahadf7kVzQsglb72X3sAwFPkYUw
         SLmkOxa/UUysppaDiDEOf57yH2wPatc26GAP0kuS4M9zpL+pRA7zCOwhEwtKFvGzgjKw
         HR2a4S3dhFP+QGkO2zJPWHUlGzNGQ0WrKYkL6qz4g+EZYOnegONe6CgPsLgn+e0pK8oo
         PonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767023000; x=1767627800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDPZx1B4hbN1p8L7tZRDpAuAg6RUpSWIFhPjpfL2tQc=;
        b=OjbVELghEaFbAIuQRAUfhZOma0D2GsbQSwTWkIsmOJMiBmCIh2G68ZsTRjlZfoHKmU
         qYiWzRtBvC58v+uqBzN8OzD6IL9yz7puSWhzC6sFW5sEY2LSAtBn0SJBKleNUP8h++G/
         aUTNfxp06XjU5Jz+/O7r/E8/OAdcQJP90QaWQ9u0KH9bQJMpG5r8h0Eh7Uxgd1k2/Kta
         xjjBef0DHE42MtNQtO1uWeK1ZWYxAkHy3d4pazgSSatg4s7c13HJvL69cNfR9IdE7I1Q
         PjXt3g/vB8ei6xv/rYvtI1VfTm6pQa83d9BuKGSfHifIZN/byR/aCcPYwnhuDgERpF0P
         1o8Q==
X-Gm-Message-State: AOJu0YycCo7rEU7R8AT5YgS1kLj/vn5SP1kk9+XLVdOduXpwtlndiVc+
	A26vjdOFGfgjqXCmvwQO0s/8+h8vvEKJn/woikXiu52Grk8GwlSm38uCpOgfRUpGWs9XIb/+Kyl
	7Axqv3P49HXP0kZwiAoCuwBfHFKnL8ZxOynMrLypQ3u76h+fY9w2ISh8bQ6xoAdas9fEq
X-Gm-Gg: AY/fxX4DQ23B8XB4JynN5NSCskz44Np/V2o4wXYo36lt5Qi+/sv4Le3vdAoFcmjgCgH
	HOMSI7talxFrIzr5nDeC9hZ6rGhGTzc6YQsX4Afy5Vw33JwW8ap65bCdwiJrwGiKc4a4lprvJI+
	gryZ/nXXWc2T3jrMjgCR7lrhmwKhiNdJMvU0/W+MbtpyTlE+OqsTII/e0sXTMLe6m0FRdfayXaA
	52+W6nDcwZG0OQTp5v1YxZFAFJagucIcokoWkNamqplvvIjGBogaIMYevz65XCPnkQ74TmAMtN7
	U3S21rbk/LbZBwQn04/4JXMvjeojZb/MZIYM6Lgl+bQBvCcOU6UpJBMBuP8r2nXHvgVWjIK6DJe
	1uRoU3rmGblTkFtQLuhCybaCtWuuRIu6W6UmmRxgvAQiZCXLZuKhRS5AsaIR/TJHAmw==
X-Received: by 2002:ac8:5a46:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4f4abced018mr342115991cf.4.1767023000071;
        Mon, 29 Dec 2025 07:43:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4GslQPK0btiYKcbqKhdOiyHZI65pBxoO4J3Cjlea9v68qz5mTSWi+lMtSPy2Ny6eH1xPqGQ==
X-Received: by 2002:ac8:5a46:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4f4abced018mr342115521cf.4.1767022999558;
        Mon, 29 Dec 2025 07:43:19 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53c16sm32305340a12.1.2025.12.29.07.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 07:43:18 -0800 (PST)
Message-ID: <98e90787-885e-4e9f-a854-4a756e33ec9f@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 16:43:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-tama: Keep labibb on, so kernel
 can disable it
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251202-tama-labibb-v1-1-f8f3fda53d1d@ixit.cz>
 <ed0bdcae-6fa1-48a4-9618-e0ac09097f9e@oss.qualcomm.com>
 <e3590c98-785f-4774-bb57-04c65cf12d21@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e3590c98-785f-4774-bb57-04c65cf12d21@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: X1P-H92I0MEU9x2qOIEQLfyaWn-JPrmV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE0NCBTYWx0ZWRfX7IpKJnpJdAr/
 +ogC2hu3m2Jk1WRBstpJ8UbN4TaMBQuZa1mlEY46JklZBYZFsZNTHGzVsQHbT+kiJNYvs04zRod
 4kddL3Z0ZrGxMqP+Ux1/JNN5hdVm6UIIaRZCo+2wf3PQeGPRmyrKs7SkOzp31oIpDtAu6zEPTjw
 kgAyEIBhPLPeqCCJw5QAk3HyI2zfVu+pUwyKs9y3b+qJRc9HYQiHwpnBhmiJALRzC//M1ugzT6o
 d/IJE+H6YdT22sKTgqVLFKdOZUf7pt49I/uW4BYarTMrywEnRpPGUUokfF1RgBTAHywFSrFJyZx
 XZfv0ZR76poc0G/1INFVIF4vSahsJj3KzZPGvVXnG/KWTA3THcxxgp4GVadBeLitQ4b5idCbXyi
 RTzMrwmWaJNLPLwVUIlaJxM4up8fPsv/DIGmJ1C/tVI5BktbCSTW3itMO3CbBAgpJD3rFdY3qts
 koeah5Ls7Pn+sG5WQxw==
X-Proofpoint-ORIG-GUID: X1P-H92I0MEU9x2qOIEQLfyaWn-JPrmV
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=6952a198 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YbIqboIzxJKirXsSkAcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_05,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290144

On 12/15/25 8:07 PM, David Heidelberg wrote:
> On 02/12/2025 13:55, Konrad Dybcio wrote:
>> On 12/2/25 12:31 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> In case if they were enabled by the bootloader as part of some
>>> reference/common routine and left hanging. Linux will switch them off if
>>> they're never used.
>>>
>>> Discussion about it can be found here:
>>>    https://lore.kernel.org/all/20251130-oneplus-labibb-v1-1-bb3653e43120@ixit.cz/
>>>
>>> Fixes: 5dcc6587fde2 ("arm64: dts: qcom: sdm845-tama: Add display nodes")
>>> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>
>> Perhaps "keeping it on" is a little bit unfortunate in that the wording
>> collides with keeping the regulator's output enabled, but anyway
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> So, friend fixed tama-akatsuki against -next tree and having labibb nodes there crashes the kernel, so it seems disabling labibb had some reason.
> 
> So, please do not merge until figured out!

+Marijn could you take a look?

Konrad

