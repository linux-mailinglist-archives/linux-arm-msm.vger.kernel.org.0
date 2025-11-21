Return-Path: <linux-arm-msm+bounces-82848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8552C7936B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 888AE4EE90B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 13:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E82834251A;
	Fri, 21 Nov 2025 13:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odIW6uIv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YLPOv+NO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEE630E823
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763730983; cv=none; b=OynyPwVDyI8Z3hCPAfh+Uu+z/jvuMjN1bZbSjHSlhhlsRnrd3lBtgDuSKy3mNnS1sDclsoUc2BWU5k3XQRwDhEAs8z4ZFpBg8zDTzTgtcyb04d9E/MYr4rVVdMFRCuYEY9nXfxs0APwLpooRZix1ok80PItTXE47eUbLzs3SPi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763730983; c=relaxed/simple;
	bh=JoLSGsrTeqAn9Y1i9FGQohdxz9oBmAZOWBYonqcnUBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cI8Bp27ObeLtaqD2TOhx+O3WrnAY2VMoco7G+kmwRt0gj9djuSfn3+YjIjxF+PNJ3TnwZHOEsYhMQB3JmeTO5q7X6hHv/wN2hdoiOVc4V4wAfBmBz1he6Fl4Y0YXb6na/QYRwi9oVok50lwCF9Oe8nAhB7NRYGlW7h03v3g3+3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odIW6uIv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLPOv+NO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALB483A3911236
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZslwIa1gPGf8VYsPD6TMS5oQXkWUn6EfvVM23jBYgRQ=; b=odIW6uIvp7hvW0Cl
	GOJcadtC4QeNjpEp14ayxg/BvoPO5vyCke18a4WtOXmDD6gLDNUmS89qLhpMY5vS
	8K4oq68TlXG98e9J9reAaGz39QddeKPOs9q8g2Vse2WDUd7m0gfhTjYeIuX1MoNp
	F8bsH1yZIK0Y+oVxWVL/iN7IUZ2V77lDnvDfaQ6ihpVJc9l7k6Q8U9WBTewlfEV1
	t/qp8Beu3FFIKFmUU0KejuLNvOBM0Fff36o2ZPT2GD/FhGC3ZRr2fNu8GQzc/56n
	8uVcORoFTPVWBEkpf9ftJRN/skhPoncQH9HO7z4j1USWErR6g/kxndoXe8ZqP8ip
	cqCfSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajpvsgbk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:16:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so6845591cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 05:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763730980; x=1764335780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZslwIa1gPGf8VYsPD6TMS5oQXkWUn6EfvVM23jBYgRQ=;
        b=YLPOv+NOgGxlR723rJIS8w4yjX4dZAEJrQxSHYPzcgXWJAtIa24HYGyEhUwUBVUT9Z
         1ij2vxqc2OdaI56O5Gnzg9auiOYkMjICYCr6K7GqlLT/5bDhJKMrc+2Yqw4hxAT67RUF
         Na0vr1Rdde3YikQTzgumNcfN7d5JWgHuBHekT9R3U1pOVHGOfW9p1nC7w/Rqn7Ci1Zgs
         4cgy1Ly/VDRUbdHN7vtPupapYWjuXLE0Lz0NHzjKyH4VeReUD0pw83tWdsERet3CyWgJ
         ItAD4Fy7JSpPUerqP6/oM96c943FYkJWNiEPSuKeI3Jk+PDp5o8N8GKihH5zw8VAyegc
         j43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763730980; x=1764335780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZslwIa1gPGf8VYsPD6TMS5oQXkWUn6EfvVM23jBYgRQ=;
        b=Fm1GYs3zF3urluJwYSigIyEPoQ2C9m1kXaa1D8rmQxWBYs5fYQRhQ/on/lKcnM34CR
         MrL4Vm/a0dJ+l1uij57US6deANP/Et0ehnj05cixze0Ngl6g/ez16ymo/+nivuN+44Sn
         6cNfblSOyGVc7sizqR3wCCfbGgH3de6Ee02Wb1v5FgHeIuOCBLqc8iGhiiHil3djIET/
         7toMRvel2kcWGrVkLliK7KQ9TmWQcUowkfDc/2FDzpw07Kwsg0yinOK4Dz1T88QwRlhq
         xMBpKfG+dsmpyV+kK3siVVNGoRhZgvp50yIjDZBYlogxG+wNZHgRwYRNAknVRg07GeTo
         lV+w==
X-Gm-Message-State: AOJu0Yzl/nU+2P6uQ7KsC0VS/8X/qLXA5rXEoQfCUHMbhS2wQN3jtKVn
	hCkV6hS1ga7CbF8jvs4FHYU4un2zFNLM6i8eEi0z08AaFqEPrOSWSDxD4LP502BhM314O0KRtnD
	UjCdfts2uNwIeY2HT1wBhZpkLrFqPv3I+JPK3ZlI5UMyUufikj4tQ4w6XS6pcTgwgiQgX
X-Gm-Gg: ASbGnctgejq4XN7MFGfxmDyIUthU46vVprrQBf4EnMeeBLsmKsSdkPaZxCci5PnRSOh
	B0pnKg1AkBTTa6sKMIubzuikBIZ5qXmmd2XqgGe7uLP2+2vTSMjyGv55otakL6UTyLWwDVMKZAY
	kCZYsP0scf1DWDpk4OuJR/sJto/66mo0sE0/zwLAVyGxUySYTkVfG4SGVkj4MhS1TRSaJTgjbJV
	9BluBfpLU3zJV5abG5krIDmRB9AFPND9F+145ypCyH3atUGwzNHuCH6huTzc5R+fqlO3vYx9zDN
	uZnk/MmUg1rgtxckry19QpmC6CHDzmHIs+XaA8YCG8sEohny1bYLH8T3GXQGU4jYljuuxI2cFTX
	OA0BIQg+oNfYQx004et6teFhEde7qAmoj9nqzjASAzjDYS7XdhKuJBVJdkg+B3rrHIpM=
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr22807611cf.3.1763730979812;
        Fri, 21 Nov 2025 05:16:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMERWEagVuNh2sUh4eb1aDw0OcAZfvUXbxb9EL/FSkUdpKjmUVXox47zbOGtt3PcxXPwIAbQ==
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr22806951cf.3.1763730979209;
        Fri, 21 Nov 2025 05:16:19 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b765502a9cfsm447078166b.57.2025.11.21.05.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 05:16:18 -0800 (PST)
Message-ID: <d68ea27f-a317-4a58-9fe4-f0519edc0e07@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 14:16:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] soc: qcom: llcc-qcom: Add support for Glymur
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20251121-glymur_llcc_enablement-v1-0-336b851b8dcb@oss.qualcomm.com>
 <20251121-glymur_llcc_enablement-v1-4-336b851b8dcb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-glymur_llcc_enablement-v1-4-336b851b8dcb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5GDeyPych1afRivQ4pEa1ZQRhRpinIJL
X-Proofpoint-ORIG-GUID: 5GDeyPych1afRivQ4pEa1ZQRhRpinIJL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5NyBTYWx0ZWRfXx/APZbqxHT+X
 oJ9cS8uwd4mbYZcBLsKIviY/tQ3UlNsH0IL7HQg60QHdWrl3NDYDNgX7mznCfy0joDGaTK9KVel
 4ZQ1A3T1OCZWJmxOzjiflei9BIUjVRuruzyPGyOoS72U7fNfXxW5X/nFWdglHhBBKVIc93Y9SOi
 oRTh6IG+M/EIDGKNXmmwMyask3m9PgSjMUbaKlO7sFQfxIFJq/Y1BKH9LaL+x+gS9Z14DDzj9ct
 4+f2RFoXea8/ZzuPyrSSc72wa6GSKGehqKtfk4tnz2MK0EdEIzHXwayF/GUMV7uHQGXaFGBKs3K
 0kCXkW0f0yb+eFtIxjGNyAqb+NJTpReUlvD3iCV8jRn0e9OyxAIeql3o+T+9VZ20tfDgAPgzjox
 LDhyOwBkcXlMna4UjEUN9/p3bcrnoA==
X-Authority-Analysis: v=2.4 cv=MqFfKmae c=1 sm=1 tr=0 ts=69206624 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sDGfGVSqItyTwvN7xOUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210097

On 11/21/25 10:53 AM, Pankaj Patil wrote:
> Add system cache table(SCT) and configs for Glymur SoC
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

I have verified all the values here are correct

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

