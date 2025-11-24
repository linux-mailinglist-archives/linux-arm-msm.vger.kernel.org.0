Return-Path: <linux-arm-msm+bounces-83038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC67C7FE7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 413DE4E12EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD5D264A74;
	Mon, 24 Nov 2025 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZIkwCpG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="foFyUoNZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89151241139
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980340; cv=none; b=KukIzJj0pHRgQo/BGP2sss5WGyODBbMXvTYGKW7c7jfchgtSHRvJghOT/1Dm8it5iV8G2pkwOID1Yu9Phx6cJA89zEwPvWzz2UfrlFRP9hS/lVVJ6WCtXu9EXlHY0B728RSxmg3aU8zkjaPprUfzEjmS1ddy8Klz/AVCnc/rwmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980340; c=relaxed/simple;
	bh=H0gmUgIaNDK7snVAGPyxu3oKkqTgDcKTMDEoqvWHH5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p9hUkREqRWHLTGASrZluZAQhmJYDdsqF8OaRlISK2KPGIub5dem5QH8h6Bz7WrK+p64aSs22TDocbbSRCMP0h29al4g6so8LoM/g8i0rTlO6Ali1+cYqMxUzqU4LVPqvjdOJbR+ZETP7gneHkeidsEFkfnoEvkyCmkMd5tor5y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZIkwCpG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foFyUoNZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO89S4t3821627
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GwtgMDoRg/TWKgPlmeBxjnlKslodaTrqnfG2tnJKdLY=; b=jZIkwCpGc+Nguyao
	FTnGlGsHHZQRkakevESdVP8g1TyCCbyJJ799TNrEI1/4UUgaataKK4SkgnAn9WqM
	UhCqRYgae/B1aBM+nRdrUvJFMxtHteER+HTq7cisujakHFqHn2Gc3FEKFFjlnwS+
	fmKV+fYGXqBHuVGCzCmMNTAJ4dga4THz0yLEE53HKMlWwrIaBVUakmkYzT+COc9R
	IA31MCCnGUXT6r9249Bsq0vFKHeD39TjDeAinUFZljuiA9L2HijVGBukNg8O5Fnc
	wiHOWYiO5+GO5n+SkL6nFeleW98sW6HUOoQKayqMh+Xzzn/FZBs4UtKsX9qQoBwc
	9DWD/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amkknre7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:32:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b184fa3ffbso141147885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 02:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763980337; x=1764585137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GwtgMDoRg/TWKgPlmeBxjnlKslodaTrqnfG2tnJKdLY=;
        b=foFyUoNZUq9CyizM+xu5jxbjmu64eutsvDl8V654NIk6DNllgp1o4ZU3ccyCZtsste
         EIAyWdIRAad5nAX1IJ0RmOMzurDEhTwiZjFcomwOIutrzQsa9zN1GkeMZnvLPopi+CMZ
         td13ZOs2PLxaHWtp0vyDQ55P06+M4IYrJ5hYvlHvfNsgRagba9lRanhtnjzzLkM9mglJ
         GCRLrkJs61Sq/TfpcKrtfI+UrD8pSxDaCBB65DV3D+fa1hWz+gJB6s9M98KQp4PTVx2a
         iDvxMd1fKmGGHEhx8l8YSx5+RAel2IqW4h6Q896e0jzNkEZXeoPpzpiNtiHitO9bxfLl
         UgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980337; x=1764585137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwtgMDoRg/TWKgPlmeBxjnlKslodaTrqnfG2tnJKdLY=;
        b=hCCN2Pn7SEORMf+g0Ln6LcduC1BlapkEzHKOwo50ubACX13BhQKlPTvaESbeyW2uPy
         COgZouIQT/st8rbCjqa04TuufDVRHtZ+Vv6QRzdCp5Vj8eBn2U8HVAA43jfTAcrDz8c+
         eADeMcADJ1BLhi54SWHXxvJSFwnb6pwrEB13/whlJjkxBg6r+zltQ6zFqKurDSOHMyN8
         asocG5b3So3wWglPPDpQdDQYus1+MoZtFfnMqgREDI8cqvM2BJy9veeU+6dLx/kVOtf0
         oesRwvrvdtpwPnvUlwwcRvPUcOTZ1+K2I7TyqBweCQmJE1SAuKD14HZPpYaIuT8ub9A7
         SGdw==
X-Gm-Message-State: AOJu0YwNaMyJns+utmWVxcrrYopJ+/2nSzjPcQQXWpZb4v0Ky8aqcNDT
	++ge09OJWlkH2Jjf08LN6xKb74+nFxKzUalsccDiJQQ/HJo6jCGUst5ghnocVhJtrRj4C8TcW8d
	iIXBPVU9KLGBHVrRK6sX/HmhJKs+aYtVrYWDkuUJLqoDfClTZY/4wYEAX5H38hd53LqKv
X-Gm-Gg: ASbGncvwGAHqF/6Tv1Kq4J+UxbVhbgqBtRHGwOsenSTDOmE+WAWrO+7IGqyp4NkgsT8
	XeUKnXJnzeowc/hJucxebxAiF6htpN0E/YiAP2RUGCPtEiNjY8ErP8n4dcLC0/Y4S/dxiqNAdRr
	lNXN0hioM9SbKypSNeduxSx9xFqJccXlpn77JffJo3pOVti8lWXFz2ZSpnhUwpPRFGsxyqs3NnG
	xKWD2E0JOKsJ0vQQrVmypU0Om4xwSZXfvWbA1ftwmpx2gu8vi307wgvsGpgrCfz6lyYRfPVWty7
	1eMYSHsKwnSl3RbsRdzei2tLCo+sDM0oFyvRj4yAM/65XpvSJWCXWTOFjMFDLCI9Fkne5fyO6X6
	eGZ/0PCNjJ6pidiJq+15OEBFgUY9AUyNcJS04iGUM7W+Iyif3lrzmfmrF0Bw19I/OQ/s=
X-Received: by 2002:a05:622a:1a95:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ee5b70f038mr91463081cf.2.1763980336823;
        Mon, 24 Nov 2025 02:32:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7EXf2sm3sIPzcsj0LF8zX8qENsA0X5O0HEah9Q1xscDCvfKjiRnQHgdlzxjDck7GOHcgMFA==
X-Received: by 2002:a05:622a:1a95:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ee5b70f038mr91462931cf.2.1763980336427;
        Mon, 24 Nov 2025 02:32:16 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363ac996sm11657036a12.7.2025.11.24.02.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 02:32:15 -0800 (PST)
Message-ID: <e3a4dcdb-953d-4d79-af8b-60e4cda345bc@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 11:32:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] ARM: dts: qcom: msm8960: expressatt: Add NFC
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251122-expressatt_nfc_accel_magn_light-v3-0-78d198632360@gmail.com>
 <20251122-expressatt_nfc_accel_magn_light-v3-3-78d198632360@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251122-expressatt_nfc_accel_magn_light-v3-3-78d198632360@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nfL1FHD9KR9dcSKQcNwc0r5fMX38Gm-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA5MyBTYWx0ZWRfX+spfpMlRMELC
 WPYlutFq39JGTDY//EJ+JRvn0InzEnranjVNCuUI4Wh9dgcjyfZASq4Cc194TDjFf74iMnV1lxc
 WFDnshteuICKUwNkuqMkI4jgGDaXFWG21T/5DQtNS5WSve2q4rT8i5Vyn+U8U2sYlDD5WAuOrln
 N6/eDFizvhKdgpzgMHSUh5LQV4crcej/+cmSKDxQCNi2LqLjZBSTj3PXRMUkk/XV0gCrKgIwHYO
 1iE9AXp7ysHQ7MBIjfayPXZOM8BSRHO0/patJBHISwFNyWa3/vgCicnENziNufapnZNg3NNuBK2
 BMmYRtWy4AnWhtWwno1p/bFceS4fVNZRszzxsBWNFz6yO0pRDz9TBLf2XxYu5GgVor/mPh2xeRT
 fMt4dQ57TqN4MtzxDAp/fu0eQEP0MQ==
X-Proofpoint-GUID: nfL1FHD9KR9dcSKQcNwc0r5fMX38Gm-P
X-Authority-Analysis: v=2.4 cv=B8S0EetM c=1 sm=1 tr=0 ts=69243431 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=HeSRM4ZExxmZ1UROd4UA:9 a=QEXdDO2ut3YA:10 a=p80W13QwkFgA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240093

On 11/23/25 7:44 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add pn544 NFC chip
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

