Return-Path: <linux-arm-msm+bounces-79736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 982D3C2183D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6C2654E07FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB0336B977;
	Thu, 30 Oct 2025 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q92/7ElM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xz8ppUTx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C41D2E336E
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761845780; cv=none; b=TuyJBMOzjt/20FaoFCPC9ojyWqspFvTZJhxMaZjKzqBANlTb+bUt4BPF6quV2bH/FuyHuY6bZMRj1laGlGZDysM9dFc/7THkPR+dHoltW/TI05e4UCFbi89rjulHDiegSfv3DEgAtE2Erj9Svg6JYaFJHHVT/Tth2twghEh9NEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761845780; c=relaxed/simple;
	bh=uUxxxppzY1laGWupbvMT+M2JtV6B0dUy3z0UBN8w7Z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1vHyjkrckNJd+sLEQuOqpYs/2ElMVBP6wZ8emalYsFGHPffyCNkBnxNxKNLOToSB2+exIMSTV7Co5MG2K8EI7cnY9BhUTBDjnQC+uayfpQnT6lHw/6dFlwAsQnzpnsGfqVxaO5yFJruSms7CHUTrJJjWpXydCLyip1yvynsZ4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q92/7ElM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xz8ppUTx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UCOtOl2622811
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bajkHqMMv5pqZJo4QCw1Ta2zYwtF/RwQTRuwpNjkSLQ=; b=Q92/7ElMP3R0fyOM
	imgHlHInp3GVvOBewB7MFleKB9oBawKM8a9G3uXojFbFsdR1ylWJH3MusQ+/hvnL
	iZ+7OxLTNG2nY0Zbg1GvCDhC10IoON+63JDhw6wDLj1irFyIFwtPIgAqItlwbmTl
	+L9mM8lkq7VQi3WluSw7QttRzuzk4oPwVj4mVAeuG6vL4v+5dngvboPLXJFstPrK
	uruBs/H/uBVdfQB4LHCTkrTc1WsnVSd2YERbfefOZd45XXZ0sHGkbCSl9kbvk5qy
	F8TdzZHxIB9KuHLqmRJL8n/HllTQoV9T9dhhXGyM8IYs1+ms3D1BboL4IJF5UHLB
	+U0IaQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a41fxj5bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:36:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33dadf7c5beso1263643a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761845776; x=1762450576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bajkHqMMv5pqZJo4QCw1Ta2zYwtF/RwQTRuwpNjkSLQ=;
        b=Xz8ppUTxYFPiumpexYs3AqJJRTpDJctfYaUzyzWW/U7dVqoXCP38uMvfAnecztUAbX
         9V7Vr7PmKtCbTq/c9XSdHnDTYPksvtUJNeVhkTr5rw8qJPyyBTU1ha9cj8YydAPcEg7A
         VZzHFnxzBVH8ETRpuGxvp2gsdXdaqGwGB52NO7Vg77QwYPhV5JtIhyaoEzc0UoiUgC4O
         VjIEtM5XobSRRAuH5Y3kzG/XnGHk/F91Cp6QvYxDRnBNjUm5hS2kUQGTtWfxk4qcrgN7
         ftx/CFG9IJQ7pg/T6ON/R/ExCo7fZgB5DrLGjpyttp+ALetOh45ZuewRXrhlKntJ6tqo
         NPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761845776; x=1762450576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bajkHqMMv5pqZJo4QCw1Ta2zYwtF/RwQTRuwpNjkSLQ=;
        b=GoIgRB6KcjxDot2FCSBS0rJKBq2cHOyXAzS6VS4S6ky+4GvRHEHkNgOTDwQND8MKUf
         neYAYwiDRAbYnrw3/WaOaRdBoCVae2iFnBqNYFzkZDciP7Blvyz/cM9TFcG9aLYn7T09
         jkeJFmGNuS9Pv4jkeoR5D6djKvp93BJJKDAf9eq/2fU1fSMnH8Xrrm5hVTwnbJcPj8TI
         ChoQkK+jFo7eKBK9ePRGBIR3v4vbvmnGRch0Nn7JI5djUR1ayf75kWAFeWPpLv24ngNu
         v+hqrpsh2JMk7DwCzcHvVkqe1/GwVaMuhruhCl62N0ndi0XrMuyBj+W7h+Az1d3LbopR
         BVOg==
X-Forwarded-Encrypted: i=1; AJvYcCXzPWMYyGfpucj5sMkfTrhX/vTmIfT5P8ckjKd+rw1vhZH6tWxYRCBxp7QwNVTma8yapaSme9vOGiDeZ2bG@vger.kernel.org
X-Gm-Message-State: AOJu0YyW7p2Wpuh8pCqmsyCOsnWvHIxi6cm1Q9YgHRmwNRMouqxV3seX
	XsxmwWlxzhGh/WKoOznkLDzBRK1R6TwqWWE3GbDYuiGws0bHBwmdNFi6FLpIqIvdSxNfqH+IeD6
	uKoivi5lN0OYV1Cbed3ApwioQM9Pi4Ovd0Hefkd9reS/icOJXZpa8f9cxXskudr2StJq9
X-Gm-Gg: ASbGnctpJpgIhB8OcOp/OGRDzxp+MGu0Jbsx4Cw5SgL9nLCFZfYAMOmmPZJyc67GDe/
	fBV8X1yXMQPTnqxrVqPS/AOj4gX9464KKQxdetlGNiETpKNiHtfRmhE2svbe/3ZjTUFLkcIDjDv
	91rrJJGerIrtgenuTNhsqD4Nfm4/iohH3jaa72zeXbtG+OAH1SPaw3MFZCj/GzYGJ9mAhr7k0qn
	yeCvtTAZLCzFjy6JNdjJqOrEY3vnkIrFrgCp2NG3XGkU3jqLc+7/Y8FE6I8oqTEDLMCy8TiZPyh
	25iFOo159KSEEgCPzcqKPO13meySwkSFEqEMHAqDHEua6RmCn++aIjO9MQHs/sg09RFpjgbv6+Q
	FoA72H7eCuK+fCRrAPrFoyz0rudy+yZKhjHJ4+R8pPxb/Wu57nvrp
X-Received: by 2002:a17:90b:5490:b0:33b:cbb2:31ed with SMTP id 98e67ed59e1d1-34082f057a0mr726850a91.0.1761845776351;
        Thu, 30 Oct 2025 10:36:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjy1qSt2hZ98/eZvNJ9wygZ/dv5c3bUXaazDj2M0X/Bxw7LMUxGQjHWbaOsqTKpz9V8v3MMA==
X-Received: by 2002:a17:90b:5490:b0:33b:cbb2:31ed with SMTP id 98e67ed59e1d1-34082f057a0mr726805a91.0.1761845775801;
        Thu, 30 Oct 2025 10:36:15 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340509b444bsm3239247a91.13.2025.10.30.10.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 10:36:15 -0700 (PDT)
Message-ID: <e89a830c-020b-4970-a649-86850246a530@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:36:13 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix typos in the documentation for qaic
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251024165749.821414-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251024165749.821414-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r7CdhVB1AbZ3j9j2PdmKLk1xLIBJ_ZmA
X-Authority-Analysis: v=2.4 cv=UJrQ3Sfy c=1 sm=1 tr=0 ts=6903a211 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=_LXf31rqrPtJYysunv4A:9 a=QEXdDO2ut3YA:10 a=5OH7ri-qmpsA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: r7CdhVB1AbZ3j9j2PdmKLk1xLIBJ_ZmA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE0NSBTYWx0ZWRfXzr4y8phYX/Rv
 aBl8aYFvSei9+h3I0moMHUMKq8X0DO6attJWRxD09tPj6aT/3ZctQoEBLT4ogiLjSfTorxUYJWX
 w66ZbZuiXgIt2xZhNHhyggesqHwnTIkZIf/7XI0VD1I2N7svBck4tSrmikM4XNu6Udmmx9G3pDC
 QuaJ4NqH3J/s4Yix56U7xobj0R2DeSusc467XOTbWruF6KUa+IFA5uKCfHWPOVsT931QBXgm0nI
 g1dy86r4N5HCtOD4udsdYkOXq/q5e3Bc1EA+VUvlSZdcmzfog6SEzvfwHhONSWcj7dP/EN55oqu
 qf+qAzrBYgx80ePd9SKg+YLLsbGlw9PkML5IgCSIqNVB1B6/yCYLsLOAbI0yyPXq5Y/lB5VquO2
 Ao2dc7Hv4f4a1ROQAnsuyHBPiQSszA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300145

On 10/24/2025 10:57 AM, Youssef Samir wrote:
> From: Sourab Bera <quic_sourbera@quicinc.com>
> 
> Fix typos in qaic.rst file.
> 
> Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff

