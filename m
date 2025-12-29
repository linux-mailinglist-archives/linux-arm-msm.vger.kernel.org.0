Return-Path: <linux-arm-msm+bounces-86820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB43CE68B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5073C30076AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 11:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9500030C342;
	Mon, 29 Dec 2025 11:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QeO20t9+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E07WhPzP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF162E54D1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008129; cv=none; b=CN3h6gPOHLp/OCC57T4N0zLnyEMdhcQyWkCXHpRkDLiiUom7hnMJpcttz+borVMQGv6uZ51ur9LtDtzVeYZmJfZl07k/oYoMZr7prKr4R6E83BS3Fhz0AOQKwoLL7vNawh/53RJpzi13miGJta8hLUD1pvji99ZPaNTSbbbY1ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008129; c=relaxed/simple;
	bh=xt/rDgSFffMfSGBdV7txSj+UEiHqltVogbdnuXlssbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H2ponAr1+wqdl3RQW5BXtJdlIhuEXAKjnRfx5YJZ+16H6JbtHEmwdQhrLsngeEvdyR+VToqcaoX7xaNPZn8VkH/+84Lv/nAHz3AUCIZ1x8vjyP8/31Wb7i4DYkntEnD8/ftcH5vFT6z32e7thrmFwpMspU2GWkXU2pWyUk4GBdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QeO20t9+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E07WhPzP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAQIZw2990007
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6IKokE3C3IMD7jrMhwamF/WgPUFvb/9N1ZvQisTxM2A=; b=QeO20t9+pTYkno1g
	T4s2W9EHGmDKPb3X7TGLXH8day3B+1bJo54jmMMUZmuRLRBnPx/PkBvg7Pv/M0xZ
	wTUUp7PkLhjODwxUKOSyxotr6oD3WzgPx/jzq9/yN+Zapvo5jomjH/D084PgXTf3
	qIPFJERiakju3n0bEQQN0O8LVcjzmFmg272Z22+/HDGyrViOCLw502Kn1DxnUZtO
	nlMFhUwOKBjT+Cx5R6UUgTog0UX30xhMt6h7TMA7dUCQp3vdRuzS7V580pTm+/um
	Rv/6JvffB3/gcyAnQmRVm6/wsX4gkK9ZnNEzeaopIS33htqVUIxqdeOwMgoEbY9n
	3qMYig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6c4e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:35:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ede0bd2154so28811361cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 03:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767008117; x=1767612917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6IKokE3C3IMD7jrMhwamF/WgPUFvb/9N1ZvQisTxM2A=;
        b=E07WhPzPxWbnlBzZGJYKiPQsexx0YP0WWdKPZizwdjwrS9SXgMiMO4QCyrkxbaLliP
         qeie3wWlxqjy0oX1lUOWyhZjrGJatv0/bUAL+/Fpxoti+IjI6lPV7jEBzvf4wQhcJCMl
         El6YQMC8W0o+vrbYpzLm3zeONuipUk0Fl9yh5HszF5C5GxrlkQ5V0uogxQgnkvX23s4Q
         TLtLHDJG+mABqIrIcO5W5QqqlXNnCqTCK/VW8wmWhWrncr2aPeOfVIIsewB2sZL7oYDG
         4u2+zDlysTiK2MQnGPeyZ2kxp6a9t8bAqpnQOAJXo8iEXlqH4WBDW56nMynPYpbx4F30
         eWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008117; x=1767612917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6IKokE3C3IMD7jrMhwamF/WgPUFvb/9N1ZvQisTxM2A=;
        b=imFfaxA/mjDB0AAkZ+UlQjxM+oRPn5SJM5bQgr0Cr9NDUqqzAi5tBAM7mR4ZbBLOG+
         qD3gurGxi2mpLEq1O05U04PPjJx1R1/qKTWcERX2gAQN3LMQClQb6LJZE0Qx3GntmluN
         0MsyF5/Ezov8MD6Iz3Trc/RrLC1izt3SeSuE0L7Leu8uWRcfDYPWjcOGHd6hU96IBWVd
         7pGqSWYzg4MxbKz+MrD9mW1ak1Ou1Yy344O4DCR7GydT8PmMpd+hT5q2J+lESraeQzwX
         9+GFV/xEJngeWnaoaq3YGSLt/1pUHacWFDAf3sZ6t2ecYprQN2f5t93MUwdjnkmWH/vY
         nTgg==
X-Gm-Message-State: AOJu0YxDeaQDNWm1NswTh2l/kvTquzkm0uXBzDzMJvyvNOZIpFr9pfUM
	w/wV3C4dqgryjHere28H2LeWtkXo6vPDrgtcmx2KOCNKt8KqvzHiiUs14eGgtJFvnod1V2QRDWr
	o5qREGBELa8fpBQeJxbA6N1GtptqZy4dXCTCA4tdAdobfIQ88yGWr+W+osqUW4h/8WAszxYrqRO
	Ap
X-Gm-Gg: AY/fxX6vIgX3jCGdLy68gMbQAY+nEqkEMIAPtMXQREV9ooDCuM38RwQP4oRBomrECIA
	ALTkNE+kMMPo3D61NBOgUEOZrqtsZSPEXbnp9xWGyspZDZ/wV71vrryE94OxLQXMjpSEf2wNMR7
	TDTt0bJFEm3+n9HOcn6LTm3Lr5UAXr2mnFTQ3y60BZ3v/QEKHWDSKCBypJ3bdkGo57NJ9AlgBc2
	AG3T2NgbjSRAEjkNaNJ0wOpIiPFt+6clsyDDOugFOhCEBQQJg0xgsaAEAavTwgAWk4A8PhXJKbQ
	GzePMVQqKdCUk2KpxoQPnPdhJn0ofTMGdCs8boEknnn/kb8k0BwzzGPQ3JUdvEmp4r2W54YAoug
	soxvJsMPiEm6aWo4yiCG/aXQnkb4NtctqFFyKmFgdsrUdHORmC0/NQL27/Sa/7/+GvQ==
X-Received: by 2002:a05:622a:6bc6:b0:4f4:b376:a689 with SMTP id d75a77b69052e-4f4b376a711mr243212201cf.4.1767008117499;
        Mon, 29 Dec 2025 03:35:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5vBv1yDQDplq6Y2nJyKiOzTBcplQrNB9UzWlezWrbYHiD4gCPZL6KYl8ZxS8Bsbo+4+u+dQ==
X-Received: by 2002:a05:622a:6bc6:b0:4f4:b376:a689 with SMTP id d75a77b69052e-4f4b376a711mr243212041cf.4.1767008117123;
        Mon, 29 Dec 2025 03:35:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91599844sm31742314a12.25.2025.12.29.03.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 03:35:16 -0800 (PST)
Message-ID: <6b8b1db7-82df-4397-9e6a-73c6a100e49c@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:35:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add capacity and DPC properties
To: Ankit Sharma <ankit.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251226123258.1444419-1-ankit.sharma@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251226123258.1444419-1-ankit.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=69526776 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VcFfoyNLmAT7u-qNsN4A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: kLJ18_85Z0uhTxvV3RYkOQn8aGg4oTlY
X-Proofpoint-GUID: kLJ18_85Z0uhTxvV3RYkOQn8aGg4oTlY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEwNyBTYWx0ZWRfX8ctya1s9lhVY
 HCfV1LpIK60hDy3clU20X6Wq+aWRHXTArCB5GQyIbJpUFIPLiQx9uRD7qHJKY6iWUyVL71fV7J4
 tjOlEFgV8FTWbZYIMZGT53d4LWOgqxhU4bxaSWEDejYhSGapF3bKKsKWhxULwYSEC0HC3Ox8npb
 b+Gl2GYkDHU5HelfmFuOo5ntDQKXJZMNJ0DqvE5VJ+DMrq8NpXL+Q06iISV+mWpKxizwGfhtnxg
 bi7BTK9wrCjruV2oPxFdMY55WuBE9iG6iqG2ALiYDCp4tLiYbM0AJLWQThYTylqLkmpMMBw5neF
 MO2BQKg6rVLxQprjIAZxCEQLvxgDZGy7zyXtY0lFDUU3RPNhhf8ic2VL4PVfbJA4JYvk3hW+Imu
 UJMvlqI3pSPIZvjkoVuZTgfnnRiyNoSYIwhTi+lANK23kqA4CC0nZoEUv2PWohJx4vLmCs5TRjq
 jxk9SrjA0ZhnXjJo1/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290107

On 12/26/25 1:32 PM, Ankit Sharma wrote:
> The "capacity-dmips-mhz" and "dynamic-power-coefficient" are
> used to build Energy Model which in turn is used by EAS to take
> placement decisions.
> 
> Signed-off-by: Ankit Sharma <ankit.sharma@oss.qualcomm.com>
> ---

Is it really necessary? Does our CPUFREQ-via-SCMI service not provide
energy model data?

(see: drivers/cpufreq/scmi-cpufreq.c : scmi_cpufreq_register_em())

Konrad

