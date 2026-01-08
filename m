Return-Path: <linux-arm-msm+bounces-88020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BCCD03A38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B62EC3002D1A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BAB329E5E;
	Thu,  8 Jan 2026 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RjoH112P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eP3Tw6tW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE163B2AA
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861811; cv=none; b=EeudxI50B6lSxq9qv8KtweHUT6lnm+nlz1WFA0wF/l5CJoNpX5eh7SruaJ7iRk15MYdXQhgA5jLWZ4QslplW7zE91U3ybNJLOH52DP/1IW5otmuPQB2R3F+2pYCEWyOcdPKhvxPMwoH1JIlSxLCOpv9Xxf6CPvX18C//qLTUdKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861811; c=relaxed/simple;
	bh=/L1RBGqyxwzt5zmuUJHrm7b2Dc7plZB+AlIdSaEjd6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PNhlChNHW9AM1PkGp4hiwYPu2BSbX/G4zNN+pisnb+Keyuu+YHXWmf0XVEo/O1bISJBh/at8i1mV6w77CmevnBUS45YhSEl11vBmTpqOD/thtCazFrn8S59GPZsv1uhtE0uemgga8ukVmKA/v9u/qeY1OKJ2WyIGnOjoFDXMZfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjoH112P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eP3Tw6tW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60846AJa2779224
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 08:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BPOoQG1/WLrFfJKEWQFWmYdIx6qCpvKkLYYmUCq7tyA=; b=RjoH112PsEKCbZqA
	1lVrTTkjDcW6jFRSQnjmeixO+/vKjNcCqVx9RASfzWPIOXc6/uS6pBs8Gxxlu3PT
	ku867K3/CqnHoNxmNqa6tYGjc0nwWN0BTOBm/7mO0erS9F6OSxWsGXsAYyVANkjD
	AtHQnVUYfTxOmdnHCySJsXk8j6psp3ksM6uVz8utIdHVod8+17pNs8haG9bMaAe5
	6I50hCB4dmk1VMemCiszWkl18gsfL7RYhKcZpGGB7z+/BzE3QkRENkrwfibn2l6k
	qhFJxzFtWQ8hVhUZ+feslP2DO6fpFgjcvygeTOfGN5NZrYLJ4M8qMtP69zVPr4te
	viRPsw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj58ugrsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:43:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b952a966d7so5765389b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767861800; x=1768466600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BPOoQG1/WLrFfJKEWQFWmYdIx6qCpvKkLYYmUCq7tyA=;
        b=eP3Tw6tWayt2KMjL12H5vXYIH6driyXwNk6+z+oTG6p449KM5gMHLfL4G0lTNCldXE
         ZYEYcFLBCCqKiD46AG+R1i8unf1yNOL+MG2XfMLX22QawuAP1pc1hJgKAseCeORQj0uW
         QOekzUQOkQoTs5JzuKDYRkx0tfyOKkKloyra3rzHsZRP92o6EpWRLhzSkZqZnEV2eZKs
         Q+DByYXp8fi9gKnlCaLwl6vrXaD8h6H9AsrUYDOj2cEYdZTSl73XFHp7oxxyr+xGA8dk
         gJIPSf8BDF4zMg1e65ywKDts0DXeq46R86vdFYZBdCn4++e1c8Djjgp9F1x7rZz+geSd
         4T3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767861800; x=1768466600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPOoQG1/WLrFfJKEWQFWmYdIx6qCpvKkLYYmUCq7tyA=;
        b=ILcgevLbMjPc/+Qn/zMPfmP8xVcmf8xud2jh7ab936hFBNziXOmowYxmUcRZwATPac
         X63vmliY0Nq6PZYDoi37KvLqEYlEL0FY9sK9zT4/4YCHcNSvp4qohFQ8d49ryRFfTt/l
         mFTe06smxkwxeGw+CaCm0IoLYpl+N6/+0hdRZbASd8k7MuJd9XOW3s7FgJ1gEAvQqgAO
         ULsX05KizlplOp9YsF0ts6xPsKsRQr/1p7h+7wp2McwwTell1T1w+yvw/yEGbxstr1oj
         cV3aKACvRDnXVsfZK0n+uMDl0be7RpDXxaw2TnSDl0HycrRLKXoh/uepdqGj3G/MypKz
         fmhg==
X-Gm-Message-State: AOJu0YxzYLU8NVCNACYXp3Tu/+7XUOajJ0GQb/GQaBbx6Not2LW6C6RX
	YJZy9QvD4HPpAdat6FYzHyloKv9gVhb02WaprcEKGelxcIyvuWnK2W1xtJNE11KWMrOKZl/mprs
	foTA2EwbJ1ua1nlfV4duwgvA6SQ+oBkphOXKEVl3tITpvBJrsp6d3oZlHLDjaqo5ssUjT
X-Gm-Gg: AY/fxX4gvL5K0SQ5cbf682B+FZDdHWlb593X5wT217PDc+ipxmTzg+37OV2XI92rYPd
	NZlCICrNOJCLGd4fTfk3j8JnQ2dFy6no+3xwl186dzeTwHtdmm4q4J2miTnwavev9M3rzwUyjCB
	PqbfHLlhKCTStb1vZUfuL+gvSWrt3qcORwsDSMHHY8i21/l8jicVjD8NnvFX+4+okM0Av5FL/k/
	z2RNlcrLuVfJMWhE1hlgVjsj1fg7FTdp+O+JbvvO4sZmOHIeBXbQhQlvqpUDimgAtRrowJO9Px0
	wBHgbsYgRG+P0fZD3h/LYozfVf03+FDaG/W6yOhkE90h2Nn2OUwW6Pv22ISCRvUjpWfZmDczM9B
	TQrlCsz4NI3raQ1gUWK9Idej9esiVIV49cQ2BLag=
X-Received: by 2002:a05:6a00:8d8a:b0:81b:1a87:9eb9 with SMTP id d2e1a72fcca58-81b7dc62248mr5173604b3a.25.1767861799612;
        Thu, 08 Jan 2026 00:43:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7uaKjXBvAUuSttJfVLqA14vM+b4APrPJU3uKuYVZNZwLgKvmkpMc+SlUXd+RMdyIv3uhYpg==
X-Received: by 2002:a05:6a00:8d8a:b0:81b:1a87:9eb9 with SMTP id d2e1a72fcca58-81b7dc62248mr5173578b3a.25.1767861799093;
        Thu, 08 Jan 2026 00:43:19 -0800 (PST)
Received: from [10.218.27.120] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5edcf34sm6934022b3a.67.2026.01.08.00.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 00:43:18 -0800 (PST)
Message-ID: <98804ad4-a481-4125-8911-965e3376be83@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 14:13:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml
 bindings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, konradybcio@kernel.org,
        amitk@kernel.org, mani@kernel.org, casey.connolly@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-4-gaurav.kohli@oss.qualcomm.com>
 <d6396ed0-8529-44af-9d2b-cf0bf03f17f6@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <d6396ed0-8529-44af-9d2b-cf0bf03f17f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OCBTYWx0ZWRfX7fxEvVYsJ4w3
 n9JXv2V25QeTIoQUj8MXCwglY1IAcOF+BfP/qVmy6nNOgmAaa2QbeIR8Yfu2QpBKkzFt3gfHAoj
 VbpnVaHoN6M8susInuQOE09oSwffW8ygjXgWonciNPZ+SKzqwH4YMa/5aCiF+eW0ZZh+YzuQMN/
 i3sYUWnbBL4v280Gl8b3uut4xgIc10QRSPoqTapouOt28f+hhKkYMlYmORg1HvGC9blh4Vg83VV
 Qb/+QbwG7wHMFdXY0r99YRIToLRh0Sq/ZnPAf7EKZ6WgcsrncjB4woY1a5m5RvQTYdzwpZwIIAp
 UPFc0wsgEffuGWhtawvBZFz6N7eT9c0w/9uZBRCF4QVve3VZuvc07IHSnXCDYH1F0yBkzAFR1wf
 o0PJQjvFaaNeENnM0uNgN00162sJYDu8IEAfBTPDuS3qZ9qcevAdpXfyPGNbYab1agVWqApyZu9
 sAQuIk4LFVhvySUBdKw==
X-Proofpoint-GUID: HubZyDorShhTJZRT9HKvxJDdvzB33_Fh
X-Proofpoint-ORIG-GUID: HubZyDorShhTJZRT9HKvxJDdvzB33_Fh
X-Authority-Analysis: v=2.4 cv=CMgnnBrD c=1 sm=1 tr=0 ts=695f6e28 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1smkeVCflDFu9ac9zQYA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080058


On 12/31/2025 5:29 PM, Konrad Dybcio wrote:
> On 12/23/25 1:32 PM, Gaurav Kohli wrote:
>> The cooling subnode of a remoteproc represents a client of the Thermal
>> Mitigation Device QMI service running on it. Each subnode of the cooling
>> node represents a single control exposed by the service.
>>
>> Add maintainer name also and update this binding for cdsp substem.
>>
>> Co-developed-by: Casey Connolly <casey.connolly@linaro.org>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>> ---
> [...]
>
>> +    remoteproc-cdsp {
>> +        cooling {
>> +            compatible = "qcom,qmi-cooling-cdsp";
>> +
>> +            cdsp_sw0: cdsp_sw {
> I'm curious about the meaning of the name - does "sw" here stand
> for "software"?


This is same like cdsp DCVS capping from firmware instead of hlos.


>
> If so, does this essentially mean "a software toggle for throttling the
> CDSP"?
>
> Would all such occurrences essentially always have a "sw" suffix?
>
> Konrad

