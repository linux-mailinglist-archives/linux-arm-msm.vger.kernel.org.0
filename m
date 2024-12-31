Return-Path: <linux-arm-msm+bounces-43732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A999FEE5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 10:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAE123A296D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 09:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCA118D621;
	Tue, 31 Dec 2024 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONY1nNCQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B0323CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 09:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735637553; cv=none; b=kyI0kb9/HNYrAcqXcAjlrTsezbFx6MozYHL0yLSimLwLC/4Qy7qw8G2c2ts45jT2XWODcSsv64Aj9elkGgyW11q5ftDFnXWhWKjIEfHg/RASrWTJRew/mYczORClisMrai48+tiGTPHhvZy0N51GVDM7AAaCgRvExXahcSm14Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735637553; c=relaxed/simple;
	bh=1bkF8mUwm0oFvcCGGdTq6QZEde9GJTBFLRYLax6Bqd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aQcF0mc5JUFyls5BsXUxkuRNCv55v85PiCQ5mrRMxcnovrW8o0D7tw1+pbSa7lgKVCG8hHKz+2LEGTfTf4h8L4q9l8vPF6lz30OGNweBEA1LSsg3jPEpU6KoZjFUyiq+evoSEPWxnUZq7XDIaYfG1HeDcD3gWqFBkZrIZv0CXEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONY1nNCQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV0NLxi020941
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 09:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkiPZZbbFu+QBO+pq7kC5P+upRO+kAel6emNBQx3EQM=; b=ONY1nNCQOoPVwaxu
	/+fIRmS+Xw+QNHX2Ji5bOLkyM1sOwdmLUY0X0rM8CEP3yduXv4QJrqDn2bpYzjL0
	jrsH0zKsmlh5cKBbF2nZeVYaQ4mhMinUT41tL8o+ibPXWO67CLDxqaJ2zd+EbtSj
	lj9oHT2TQL0b4jhqLd0VqlR042T4+t7uVeFfguMCZWdYc/b0kcOyTLhM3l6OBTIz
	SIxyeVym9wEpK8LFDUSFIIuJn15IB8YtHXdPnw90hcvF44JcEjYeZf/OJcCUo65E
	osy8H7IDUG9xR1uTGRZ/fkQdD4mPYHi7Pq2ZpGnC3ebT+rmi/OBk2gjCclB/wzJW
	qO7ivQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v35ms9jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 09:32:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467975f1b53so26110451cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 01:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735637550; x=1736242350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkiPZZbbFu+QBO+pq7kC5P+upRO+kAel6emNBQx3EQM=;
        b=nTdE7IeY0Ddz22W48kKAYftRlW4A5WNr8C0z3JpIkpKffuBfp+spHre59F8dxVu5G2
         kS0MEF9tVCy5WQwAIroWoMYDn2fXFtiVd77F7+TyvYfCn5zorokq9zrWWsUgRy9OfuiQ
         CFmwcVQwnqngAMX74BFVHAYTv2Ky+VvclXLd1lbyeNdxpsY5vfPU1FJwTN9CctGlwj1t
         BKZSqFf2gWiZ4C9W0ayOel+LKiyQV3cdutszbCmo4xssqkQw+OHZklJRhQ6e/9itwzqk
         ZFEPlxzqNgJCnNRd+zg/LYLuvIMR+8ncLYj9OE4yBEATt/XhO5Ip5xot3ZSfd7WC8EUG
         f9wA==
X-Forwarded-Encrypted: i=1; AJvYcCXNHYqqRO/AcH7+liy1+8xdBA0HzNpNp9ps/rHUvhIUxfz20rVx/7D0rG2ZgoIui51XCE5WkuYN6k2YgSVr@vger.kernel.org
X-Gm-Message-State: AOJu0YwcP218DCgL6ChPO+6Q67Dt3IHE0POJYp6CV/sYr2m2MyxYBzWc
	lldv/V8uE3csxonMfld3fvUVLSSjeQFfrmwzQsCFjH18M2+NVMT33gdJJAcGjy4hjn3/vTp7Oae
	iEu+g3YCymw9A0SiLaHTBSkdzvRuK4gnJH9lz/KBuprsaPETJTXU5akNMchHpkPuC
X-Gm-Gg: ASbGncsKHjGppfEx+Tz+Xz5k5hF70qjmyb+SMkHsdKsNJqu0FdAekqq0BxnZ1dgg7vR
	VEm7xQlKPMHsWcfOdU3HVmhK/x81Y9a2c0R1j+fyLcDJM8w7tdmIinhhfAgnSayNhb+3Fcq35Se
	MB0afJ6ctC7ArSbzmP/By19LpnxpL5Cuej7/h78vUhP43c2qd1BozXibzoP3m4IuiIMoK3pKKpV
	V6XVdT+XP0kE4CRVSj5ftdk4BVdE4uWHTFy0QrPQ8N/p+JJGABXi/8WQq9ZEuQRZKCY2b7uA/Ez
	2zbdUUAiJXjQkvObD7/45jkDqwBmOSw0Ko4=
X-Received: by 2002:ac8:5e47:0:b0:467:6486:78bb with SMTP id d75a77b69052e-46a4a8e151emr227593651cf.5.1735637549818;
        Tue, 31 Dec 2024 01:32:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4pufUgtQGgzt14adazwD6t9KP+MVwQhr3lllCfTUzZL9CdnvIa1iQ6PTju+i8kjlpvtPzsQ==
X-Received: by 2002:ac8:5e47:0:b0:467:6486:78bb with SMTP id d75a77b69052e-46a4a8e151emr227593411cf.5.1735637549367;
        Tue, 31 Dec 2024 01:32:29 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aae9c3eb987sm1322079566b.110.2024.12.31.01.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 01:32:28 -0800 (PST)
Message-ID: <3ad8c99a-d722-458e-8783-951018e2a7ba@oss.qualcomm.com>
Date: Tue, 31 Dec 2024 10:32:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] dt-bindings: mailbox: Document qcom,tmel-qmp
To: Sricharan R <quic_srichara@quicinc.com>, jassisinghbrar@gmail.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, manivannan.sadhasivam@linaro.org,
        dmitry.baryshkov@linaro.org
References: <20241231054900.2144961-1-quic_srichara@quicinc.com>
 <20241231054900.2144961-2-quic_srichara@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241231054900.2144961-2-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TATn3j3mMJnDglgET9aY7HU41_WnZW4e
X-Proofpoint-GUID: TATn3j3mMJnDglgET9aY7HU41_WnZW4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=829 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412310080

On 31.12.2024 6:48 AM, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> TMEL SS provides different kinds of services like secureboot, remote image

Could you expand the TMEL acronym?

Konrad

