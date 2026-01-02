Return-Path: <linux-arm-msm+bounces-87261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F7CEEB8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 15:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5E8C3010284
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 14:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C11330E826;
	Fri,  2 Jan 2026 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qgfgcx8c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/dhoDQN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84372EA731
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362585; cv=none; b=LxVUkEq+qZusAGk6Wnkal+1M4uQGzk4nnUIIrzKRr3qy21Rs7dh9qRv/j2mMd4Jf5lifxvxElX5aB2ivkH5PM1W3Ve2yHHXiGnSHZ6UU9yy43/KWQTm4JJZU8KOJwniEDiQKuXuV7zjeo3BLppY+qiUnocd7Dl6TKdOLiVwG74k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362585; c=relaxed/simple;
	bh=Zwg9PgIyv2CqnsfGgSl2n4zQIYgz6ToBX4DtUXEBbes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xxx3CpGBN8vXolclKgO6GllrmATv2qltEsYmwD2XYluJxqz1oWYaKiSvfRQuuemiVCfIolriu2lLJUWCPqykSUfL5f08XlPYqFVQjDt5EYyw13jqIUOIEO4bxwyTu7nqQ38DcE/RFux6k+7eXD6W0+oVjkNi0yixudupRK4SNeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qgfgcx8c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/dhoDQN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WFIV618074
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 14:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KP3CUn/aT5Yp7p8MFdqaPmc7EEkRpfQdQGCG9jCpRdQ=; b=Qgfgcx8c2NYfJNIs
	8weIai2TkCkB/p39wM1rG5hZUciUiOSr08aBt/DqoD4UdC1TNe13h3ApYkRum8hR
	0gp9gKMeXjlkIuZbm/EWWcC+Yxid8RpdelHEOt64YRiSUuL16X4XTrfvUzmuFYV8
	vvhKciKNAJHi3hXAVlgmPDOkerElZze8FKN6G2Yt8kzBuFoldg58cDXbeKwFCVAN
	2tR3gPImQUMif9iyfxqOAOYN9ipd4jGrGiUz0cW37NZLUZcK6PqSR6G4w7ruIOA5
	VPOte4XHBKAwGKUwIfSmXb2uDxHYv9Yf04uFDmROkW28x4WJ4dEtvkHL2fmal9v+
	nQAvuw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beb4wrh33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 14:03:02 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-646518169caso2754117d50.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 06:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362582; x=1767967382; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KP3CUn/aT5Yp7p8MFdqaPmc7EEkRpfQdQGCG9jCpRdQ=;
        b=H/dhoDQNuyyTP4Ugba8dlUBov/K2Wweh5A+L0SN02UtUIZh8DF+FXuSBnj+PPXVA2V
         UNMuml9HyXSPqDfsI4OJzNwG1bKD3KyAPp7jwfCyXtnh//87hGZvsdxQ0UzZV9ruYkoc
         ghqzA9V8FwBl2BGKezJpmJaDEN9QQvyyyn6GcDPvjuFr/xTmmcDLyxI61CLZZj+H5xre
         tuAyxaMajgl5RuW/68IxCUTurUNhA+edHETn1RphkXO31YRk93aTSCWTKUHxHoCaZW6f
         wC0z2fsO44BWWwGZFaZSQRcZ2olVsdVfGy2BKjpsjfWGp6+vLMQD4m79Dq2UIZI725RL
         /O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362582; x=1767967382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KP3CUn/aT5Yp7p8MFdqaPmc7EEkRpfQdQGCG9jCpRdQ=;
        b=f1gngVZRPIu3uHInpYGwhLlxbiJckBmUkOG4K5OsiqhLS1pJ6HxpEeQCQ/e8+JExl8
         HFga67eW0tFSyWCfYb7cHTkM+LAfgXapt8d2qrII6dAUGdO8yh/77mF5vS3+9a60DFuJ
         z4b3dZyIJb97E5tqm86wUmqJlRB121hnFoZD9PaZ7xHFJy06X+yyDlgwahA8a2q00UdV
         ImGD+EefyFEZ8QkKIbdgHoQhJBevwe+v6sf7RJBvGZtf0yKZw+iuSXZnoPidN/yJt9p3
         Qq8HS41SFLLkV9t6A63Q8FBu47aqlAx5Y23V0kj5cMYx/Dxr2SwCC3d3d45XwFrO2/au
         rnZw==
X-Forwarded-Encrypted: i=1; AJvYcCWnYTBsapxbFkjpXs9TIPpqRTY8nrHnMbCMoYeDF25G+r+GaLPXg3hXyr3DNrIoZ/Vej5RpsOW+FSRCkxkA@vger.kernel.org
X-Gm-Message-State: AOJu0YyYhidPEyOAGmpVKqxDQKE7SuFEw2XAt4F9qTUteJmCeLX5KSur
	b+kT5I4YLM2sMulx8DFv6GlDf/c7UKJXJL7uo4UrJCFhiffBv2iHjLYgO8cUNoForVn5GTiEMCN
	V/haiigT+gjlfzpl6PbxsB2iD3K9eSk3xESeBFNyZu3NBYszgd0Sd+yTfLmVYbEB+OK3J
X-Gm-Gg: AY/fxX7TGBS0awwhskRvTobrNa3VEinK4r5zjbfpP6MtKJF5zqv9kgAIUtIacoMvmVK
	xSTRuhaxHwcDe4wbgma0s+Df45I8WO1SftJWMdIrhsX4GKleEEAjt6Vnuheh2jkRKENbOCfrqP5
	D4mYMPFhMiIhQs3rSRvNP6QQhagxbh5gZ9kT9BX+Zd5FTcSFqGmbfHymFXuYmUewloylPuO37nv
	f5DaF7v0aSCZuTjP88o0XuZ+xXzZAsQWurFfIGLrSk05sddIBjkP/C82oDs7jOQMandbmcMBocM
	6xyCL9J1WUB0MbBsQBcO4RWti9B8ypNIEtbi0HE17Vro2mflEt8GgBGNc27nafaez4jCChPU/pu
	A50hmK6j1qlQLVBIgYlNltiYie432YL09McLqw0Uu795VDWr9yVO5VY+ribhXi8IGCg==
X-Received: by 2002:a05:690c:f13:b0:790:63c0:d68c with SMTP id 00721157ae682-79063c0d6dfmr26440717b3.5.1767362582003;
        Fri, 02 Jan 2026 06:03:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbusYs3ozNOs8NWxa9BnHuqBKFosDDQsr6CiB9XZg9kzKh+2JBJBTSUldqxaVLAis7neZMMw==
X-Received: by 2002:a05:690c:f13:b0:790:63c0:d68c with SMTP id 00721157ae682-79063c0d6dfmr26440477b3.5.1767362581631;
        Fri, 02 Jan 2026 06:03:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f511fesm4642072066b.65.2026.01.02.06.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:03:00 -0800 (PST)
Message-ID: <15e41ffe-66f1-43ec-b0af-241041c25f9d@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 15:02:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
To: Bryan O'Donoghue <bod@kernel.org>, barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <NLGulU4z-1Wrf5120YfX8CYJ_8DSP-9-DhaJ3KAIQCvqF9Qf184udOzFoEQH1qgJDZUl9cxEpsdyztfhcz8G-w==@protonmail.internalid>
 <20251231-mss-v3-3-f80e8fade9ec@mainlining.org>
 <6bfc790d-b0da-4c5b-bd2d-ceed9a75bb24@kernel.org>
 <DEGDp05xNKls7EO30mtT70wJFIkDT0-248vPaBikWJGkFf--YvzpyJ_h5sc7RSH1y9hkCKdFRBIJwQUNE9Rlzw==@protonmail.internalid>
 <a627abcaa38c0ba11c76c1f0c42b0c6b@mainlining.org>
 <d3bcaf7d-06ae-4410-8d7c-970fdb196c47@kernel.org>
 <3i9J-ztSj5n83TPS7yQ3ngZYVpv2MnqVgpnkfywumw-hk2fPN3mty8T-vI2c-1Oh8V_ArprPioyoPxso6k2W0Q==@protonmail.internalid>
 <1440e47e-2d7b-4d49-97c4-a717fadd3fb6@oss.qualcomm.com>
 <1dcc9380-c2c2-4263-93ad-71edce86b0da@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1dcc9380-c2c2-4263-93ad-71edce86b0da@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fKIUfZyiPLcdwfc1U0HXXgJk-jTZlHwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyNSBTYWx0ZWRfX8QjG036ISWxt
 XD2qDkkkicVnMM3WloNRWSecJRnpbeWPq6pefQV71mvSm5CUhUOITjnHGkGGZ81iWBZiJ6rZdQq
 nHR8aGsxCadmqegDH1BC1yj2TfeKMv+iInW9+CZgjpmzvlBf3a/a+xZLZ3wNSReEGxqZ7d4bHWi
 2s+xwajW/RceWpiXWH28b36oHLPbw6LOXvg3YYG3l14Rq4yWCwZLMcvpUcNZ4C3E7m5Vc/Wvsuu
 E3sCg6SgwPJW0SiJLJELoKzVJS3zy/mDDmtW8BteaxAKxjLoojEJT4Ie1areKE2YFv6+wSyJsvz
 x+V5elgVwKHEECdBoFE3QDozSYfFizUqe0ECDs9AeJb+7VDUFmBUAHaIF/vsKZ8BKaWtJ5njQxI
 SikWRiUvDjf819pD8n6rZ+Z4e3FWx0MnuzEo5zQVGPNusPxjmDStqlP1c7rG4NeJp8ndKd0DVdC
 FajYBonMRTs3DHyPBUw==
X-Authority-Analysis: v=2.4 cv=I5pohdgg c=1 sm=1 tr=0 ts=6957d016 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7CQSdrXTAAAA:8 a=zBxm4P68afzicwOvg-8A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: fKIUfZyiPLcdwfc1U0HXXgJk-jTZlHwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020125

On 1/2/26 1:59 PM, Bryan O'Donoghue wrote:
> On 02/01/2026 12:00, Konrad Dybcio wrote:
>>> Is there an io-fabric in the world which exceeds 1 microsecond to perform a write transaction ?
>> Writes on arm64 aren't usually observable from the remote endpoint when
>> you would expect them to, they can be buffered unless there's an explicit
>> readback right afterwards (which creates a dependency that the processor
>> will fulfill)
> 
> I don't mean write-combining cache, I mean posted versus non-posted writes which is a feature of the front-side-bus :)

Writes are posted (Device-nGnRE, note the E attribute is set)

https://documentation-service.arm.com/static/63a43e333f28e5456434e18b

Konrad

