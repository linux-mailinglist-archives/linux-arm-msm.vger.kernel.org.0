Return-Path: <linux-arm-msm+bounces-54063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBECA86644
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 21:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A3109C042F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 19:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5ED27E1DE;
	Fri, 11 Apr 2025 19:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VPdiGdvk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E34B27C14F
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744399535; cv=none; b=HWiGs+pz6VWJcKxay4M4OjCDLe4vb4q4wt+9A2VTlWAtmv5WleK0YrzZvmPSPuI10xOt0GkXKd17/hDImT8D2a2OMyXO37iOSbT6RRnWsvj64jRbiDhcK8/W3T0tkIvYnhULh7K8btpty+99Sq14COvHLIMipsgB8OHKaASkFys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744399535; c=relaxed/simple;
	bh=V0anQo1rxh4XE0m3zSwiP2GeM/s5e9XDDcmvcf/l5VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBhq6qdtO0LTV8TjmXZyT7pLFCxYAc4eCnPmozeAkO7TKF5TSX2S8XQe+a80YbK4zWaO5Lw+Y+m6dBDV726aVlhr+w3VoaOqAYFj+RTg2E+WwPUbxwJj35Ga9RueGuqqXZrPumSmmcYE/lg2qnDL8FzbWHk5kNxwsiogDQbh3ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VPdiGdvk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B9pZId006137
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9VH1A/ujECFcwD3gWjS1rTnxfuwqzakJlrQs995Lk7Q=; b=VPdiGdvkv8QNnVKt
	wO04rHDsWbvYpPMLw9gKuvhUH0cXMDbMPlvZfzIjMj0wTSjrs0CjQDjjUc9NrrJz
	m/2OpPyY1vSROvok3nOxyGp8Et9FKyDz0gUxXYXtnkPqF0cmn/lwmrv2UgiWykzv
	sDiVg3+lflMjvyWduFzeASB8hie0tbq9q3YqbeSYX0jZ6tM6BlmezNZTpyn+yHzP
	hvorOf2+LxgIEyfvu1L0ZoELjhAdTs3TOgFmLQFxe1Lntdam7n4X6oHOVMS3Ma4T
	isyWJehBv3ZFya9VD0NZS6cQVY3uEiG9wAWXFX3WIyDMQZT0tncUvYP1gjRih1fp
	Vee5oQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmkd4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:25:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476783cbdb8so5842221cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 12:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744399532; x=1745004332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VH1A/ujECFcwD3gWjS1rTnxfuwqzakJlrQs995Lk7Q=;
        b=DLSy5epO8+2ZAMMfTZ3Gl/Dt1K9S0ZUVzKpII40kikZa5jw+dAWARzR3nGWm1klh1+
         o0UBJIL5Kz5X4KFABu/mTRKpAOOK43kZx2jUlBYAPn1JCorUPqnIAd+U/61qcvK17ocv
         eQ3mYJ3S1UoEfLp6ZRZsK5sGbuXHi/iUYI6ajdJDN/w5KV6EKQRcN1fjAqFGGtxGOOJB
         CkwMccGCgOKy9t3Q3+TPohB2EXLCCeRWRvDO3YaRFI7Tt97ich6YNFr4ooYjQ9u01knK
         yyI1ZyroikGUMIv9uwVZT8JIcxZJJWtXdPakf9ANpL7O2yMj9eBBAGP4A8RQfC9g3BdF
         J0tw==
X-Forwarded-Encrypted: i=1; AJvYcCU6JKILX+iDxU4qIizQl5SVtdk1AVrW2fsiaXe1awV72ANMkQNtqnAPOqJB5BMN+Fh1qaww3kGAAQES5Pvq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/9UgLbc+OHHrQ0bYwhxMtDCP7uLMPp+1UptJW5qnL1TLn+jb3
	IbXCt+qQMaul7w2VT8rrKsSxXVLxa0URZUfhrvQUN/ydUMz3rClRjpZzL/RcIZm2cqsVHuJtUCi
	XlZMKQ2ocGt8gclG27cYdG34VsSYo0poOGVWHslmWi/IL1LUNlJ3QyYnkpI3snN69
X-Gm-Gg: ASbGncuN5a1tVQ0rBQjxkwcssVbzWQ7/zVtxfI71xJAFC8AcOOYHysFI2FHLQDslre+
	tfCnN3mHawFoy4a5KsWE57rRFi1JekCJ90BPIh1nz0BPAWOOq5+dIcr3xRJAZRQ9/OOIAnVA9St
	5lKM2dAQYbby80+Srm2KSnPaqPLT23yFtEscbeu/LdFwxMbc20abXOTUm94ywjg1PISZx4Ka72z
	FsWNW+xSAW3rx8NlZbHy06l4msf+wMqKrAv+LHgufYBkpQeDLACC7EIBxXiN+X4Kbqgx2lusRM5
	IpFjNpRZQo9mKY6dv7bLfcbtRxUarbcwirg8lyLdK5WS499JuThWSVGteR1+4eQ1sw==
X-Received: by 2002:a05:622a:cc:b0:477:5f29:dbc9 with SMTP id d75a77b69052e-479775dcc97mr20980061cf.13.1744399531815;
        Fri, 11 Apr 2025 12:25:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0GkTYT8sp70z92tpLERChqQZCSLS8yHt/ASTJmtZUW7ReS3382lVpeD20MinPQfD0hTs2nQ==
X-Received: by 2002:a05:622a:cc:b0:477:5f29:dbc9 with SMTP id d75a77b69052e-479775dcc97mr20979941cf.13.1744399531497;
        Fri, 11 Apr 2025 12:25:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ef56e54sm1390299a12.18.2025.04.11.12.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 12:25:31 -0700 (PDT)
Message-ID: <e19eddd1-0911-42c6-85e7-a9fbbeea778d@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:25:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 enable MICs LDO
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20250411155852.4238-1-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250411155852.4238-1-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T0GIYgEYWs1RZK7NMryjZFVuHoX6OwyK
X-Proofpoint-ORIG-GUID: T0GIYgEYWs1RZK7NMryjZFVuHoX6OwyK
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f96cad cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=I4MXn53k6lXHh1bxTIIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=904 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110123

On 4/11/25 5:54 PM, Aleksandrs Vinarskis wrote:
> Particular device comes without headset combo jack, hence does not
> feature wcd codec IC. In such cases, DMICs are powered from vreg_l1b.
> Set regulator as always-on to enable microphones.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

Can we bind it to the soundcard or something, so that we're not leaking
power?

Konrad

