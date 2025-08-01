Return-Path: <linux-arm-msm+bounces-67334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E43CDB1803B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 12:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2AB81C28803
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 10:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B09C1C7013;
	Fri,  1 Aug 2025 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNKtvjkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6499823536A
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754044294; cv=none; b=QfTUhG2LEmZNdPpDrag7VTmIH3T49r5LNdNg2aCwoX3GMWPhb/sHQzxiXmQomnAL8watPBFw+yR8CSFeIrGR2ThlIKEM5i6X2cHbB9EOjLkP/AeSsL2cWBh/DP+mHly6yuhohfyfpDJBPyesXDNo7ezXsQLQ51JWtziEcZeyUdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754044294; c=relaxed/simple;
	bh=PTbICM3KD1c/dD+m/u0pUtSXhH+t/xx6pVlt+7dCQ0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HqxFPol+kgmjh6fvSgrjTv1o46fyvt5SR8y5iCzVLdjjgukNm6qD9rEaTbG6/BYjq+m6loR193PyVAjMQv1FKAKdQRI/HVjTQ1aXy0gmXCfUPUrJqo+wYt87/9LSYoHj+CC3BLfO5b6ogEtzgQDl7cSVn9ouqAM7ap75wpCovsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNKtvjkd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719g7ws006354
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 10:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iAOI0lIToQBsUNmMs7cWc7T3lg4pZZarBoVCwRquAEs=; b=eNKtvjkdSEG8Njxt
	42CIm+sYEB4KP7xN5xai1SgDtQAmT/OzYvG6B+xgcZ2Y6LGLfqil2uKir/hXVRx5
	/bvmZ5SW8mqJYWh6DkKqTx7r19qzocersKz9Daw/gSgpmdjdwzxl5OQmLdZKUHGf
	u/RydiUfEXkHinCUS1bdR9msnhPRwXE9fnToeIsIrXQN2K7GqmWBYuylksWcmPhY
	X6oHWwjYfHuR+T90eUHh2+aP/Bt2GlOeT/TuP8SjAu2uqv7XHCaZE3bDSLkPYNmm
	0rKzVbZok6spl9ZpjvJ8ubGXdLSe0rGkKxkb/pZC07z8f0V4DJK59HkGg22vb8Rh
	Xd7gHw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488u6505rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 10:31:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab3f1d1571so4381071cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 03:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754044291; x=1754649091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAOI0lIToQBsUNmMs7cWc7T3lg4pZZarBoVCwRquAEs=;
        b=nfSDXRlgs2w0dOkLlxjL9sXuiB2ZwOzGjqshnHkwNDCJu/g4qIrTIWN+AdxnUuXkKo
         w3qZylG/SfqvjLjbTPWqdMRDlKsT5KcPnQZ4q/W3pkcw1u3tRfSAeGTThX6/t7hkzaOh
         JAGiEgU/a+UFrMLvrOZfZD6B2mraG2vc7k4gUn7A0QRj+PkLvo+J/H5g63vg9jHjPzE1
         bnC3Lc4EjjP+Y4hemVKLiF2/jeWHHAbUsm9eCQjIEqJi/4DkXpqGGXu2pA0HZAxzA0Iq
         AYmti5lTcn6HzwI8ahsP9bgtZtTz4buMVP4kPbPrCFjgkQn58mU1LtzCuLycKlcbhLw3
         cXkA==
X-Gm-Message-State: AOJu0YzSVPUytAOSJsq12SsLtRorjCA1twl+fNfFgHyo5eum7sC9VmYi
	p/MpNjeXxbB/y6eqicr0G1/tkuq5dz8mHjcimmcqG+tTRm1uHgFzS1/gnxG7EOU4aW3kQS5yRqX
	vkivuAhiExjPISOEONUJjHRq7X0BW6QQz0QFE93xR6OY3ChO1qeb2eEYv5rtJgV8a4Gcy
X-Gm-Gg: ASbGnctveXd01yDK7b3vL5xv3BHlqxLOw1PIz2h3VnzGPbg2evVUYt0S6KE32Kqa6w+
	SogIuJ8oW4BugGcheLl7ddRcBukvYc/rrXMK2I4yvBvtPdKlg2XLCG9kIbLPmJkD8gcootVx0E2
	b1hqWYfFgUPmeLGeYoKvuTkLbONku1PmchKHoZeue391cNIrD++CX9JvdzXZ4HNlYZugqKyV9AP
	96gjXA5AyYZPhKPyY/3aQ2g8YK4fceaohR9cVqcWxlqpwNKzwKMG21AC1FFf0z30fBSgZEyuHdG
	Ix83NHGQvEoA6RCeFmyMxE4u637xnOrhZHohBHljHWdZv4tmRC5l7oNEndHIDG+C5IdvUrzV/ie
	CACJlpWy090Lgxlh/3g==
X-Received: by 2002:a05:622a:199d:b0:4a9:7fc9:d20d with SMTP id d75a77b69052e-4aedb96542amr77804271cf.5.1754044291336;
        Fri, 01 Aug 2025 03:31:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMBGkw0kJFBAVj6S3Vh+cLP8EoE+iTjRUAr+2UL7FVHEhgI/GeG8+ip/Jd2M6IsRnvbxbPiQ==
X-Received: by 2002:a05:622a:199d:b0:4a9:7fc9:d20d with SMTP id d75a77b69052e-4aedb96542amr77804021cf.5.1754044290720;
        Fri, 01 Aug 2025 03:31:30 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af919e96050sm267725666b.0.2025.08.01.03.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 03:31:30 -0700 (PDT)
Message-ID: <bceeb55c-daaf-411f-8bf9-9f2dd06527c7@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 12:31:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-oneplus: Deduplicate
 shared entries
To: Krzysztof Kozlowski <krzk@kernel.org>, david@ixit.cz,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250801-sdm845-msmid-v2-0-9f44d125ee44@ixit.cz>
 <20250801-sdm845-msmid-v2-2-9f44d125ee44@ixit.cz>
 <a51a9efb-67b1-4607-bcf3-8be70a9d1c24@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a51a9efb-67b1-4607-bcf3-8be70a9d1c24@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WErToIZFZls_y4WFBYpwjEvf5WIOR-Km
X-Proofpoint-GUID: WErToIZFZls_y4WFBYpwjEvf5WIOR-Km
X-Authority-Analysis: v=2.4 cv=f+RIBPyM c=1 sm=1 tr=0 ts=688c9784 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gv1wxAXu273yGl5PTI0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA3NyBTYWx0ZWRfX6V/F+eiiGery
 OO9b5vACrAA9qj+ib/KJL5+DiF2GgtQokFbRDpOkwYnhdhdJabIzxp67LPpBcu3fl3nLFQWps4U
 GpLHb4lp9gOGv9FZ95xug4SLpmIXE5UHe/EMSFp9oWyY64dUqA9CN+VmaCNfcf6qxZLZ/vhjM1y
 p0N/CMNzyKCh8zr+U2iu/NShr/RKN3ZZUohDi+OJKgwX4x8TGXrAO7nm4GzX+18T4k0q6vz7LD8
 FXe9Ei2fMqpR5p6uRfFCX+Sekx8vWKhesS2r9s1Zd/P2TiI2tUb3/ufGLyJ8fkbMgEl6VP2BsYQ
 Kx8ITG7rqB8iLZf5qcuyBUo5kHAJ/SKiFzky4KVqkYukTMpz48TRrQq+p5z5bw9Rha1IkvSr0kY
 cTaZQM/6/zdunmgZnpZ9tWJGN9bHnifOe6M4A+p1/O0ZPIhcE2mIntdnnY6KNA5/Q0MDZekf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=633 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010077

On 8/1/25 11:08 AM, Krzysztof Kozlowski wrote:
> On 01/08/2025 10:21, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Use the definition for qcom,msm-id and put them into the common dtsi.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
> 
> Interesting that they use same ID...

msm-id is the SoC identifier

Konrad

