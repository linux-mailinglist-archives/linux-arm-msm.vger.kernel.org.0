Return-Path: <linux-arm-msm+bounces-36921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A4A9BB30F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 585011C21126
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E821D54C0;
	Mon,  4 Nov 2024 11:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxVVPBqX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B361C760A
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718777; cv=none; b=m0i+O2+wI8CsgtHDRizQ/u8a7bGxdx0jeJBOUoUkaW8oUcuTt51madCAtDi3E4rWd905EU/o6xPJBtKeBybf2vXd9/5MO386rqaDTGoadLEg2PEBu/ObAc8i9cGSaHvlIbq+vl77WxCu09Bkhkg0wqGAvaI87XOAZ4+ESg529sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718777; c=relaxed/simple;
	bh=GfTqS8OGtgvdq4CghxVn86HK6W2OBHBs1c4oIr7MYHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZBLqga3zyvzmpFnqoqi3pa2lfzMg9B6Vy/9GxdTVqyh1ru5XsljOlqWzJk4c+7/ftAIrCoHiOngWHcWi/2NAEbyVOrNXJhIEw5mxKzLJEWWdu7KPbH+dKPUqpyuQeV9f/dVjFBogmBvl+UWoOyN6TpRM4bcs107gZZOjLekfaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxVVPBqX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3Mw8FP030748
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Nov 2024 11:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FkrN5aPzH8cFJEUSM1S5b0+HOoTa6/UxeCk1GA3RQ9E=; b=cxVVPBqXDuq7NWL+
	K0ZmgTrC/lj+ijuwzxBWw59YbYsxfcyXoO4/cpsxY6E5KqxeqJV6REBqI1dMCVj0
	nyIBbRafDqPM7sopTLCJJcryagtohr8oQ+QT059X6poX5vCs+ngT09h+DW4JIyRu
	tFXrnb1xPulcBuYOK9ZRd9BPeljahCv1uFUEeofR7hidLsF7tdrzB6I/gZAKMs3c
	pRZsV3ERVhL4vcYbk76TP0LIz486cGWKUU5vuTVZwyCsmBsSHl5Vj1H+pivihBCY
	0dRGCUrzvWqbI3YnM50T3U1gIodUQzMIPpk0LQgtvhP/9R8DH+sP+n7fB0sKhrVP
	6RGZYA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4ykuh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 11:12:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-460903fc1a1so10910211cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 03:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718772; x=1731323572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkrN5aPzH8cFJEUSM1S5b0+HOoTa6/UxeCk1GA3RQ9E=;
        b=OGhPeGhBaoeT4N4k6NQuKRUNYp7yIF8S/juJjmeJJuwZQ4mHZmvKVeM3snNT9uzkLy
         OYZRSGXrRg1Zms2Hortxp+IUwYDtc2XZyppMdPiKQocUZyV5U+ckMph4W0/JbOUd2gWG
         4ANZQL6PXA7u6gYENh3cGgVVFui8fGCPiqgJO6MsAEHmWNVZldkCHiX5gN/1GLQCC6mr
         8Q1W/K87hwafhl48uZBtD1w5QaxyPH8174cZHP7vSgaj/WOVMUdRcAH0jlnRRnAVs+ku
         I2YcqM5VJ4Q2NhxBtuwUb4CKoEIHPMKm4a02qfMG8R+Q0jqMrFis/CZS5Hs8xelLkYZY
         ywCw==
X-Forwarded-Encrypted: i=1; AJvYcCUvSA8R1RQqAaT6BlhgvzRFi91z3m8EmpMUpG1ChHlpLtTLoyoWUWEfqLJruoVtNTLsAjbMyervveLKC13U@vger.kernel.org
X-Gm-Message-State: AOJu0YynWoHCrCvoYkoS/HAfvBesLSxR8K09wMSEWAT1dm8WZtb2F+ed
	Oj7OV1QcX9m1Jc/xZAGRy+7KdnbpVU6g7F0+ugibl5HQL1IBANqc7Q5WxegFK76GHbLtxiUx2q5
	Y4N5qTRxEvZuXHlqShVvMs07Qm8Pk+7Tlq/lEaClAjzux1vOMZz03MnDIAQ5Ux71y
X-Received: by 2002:a05:620a:17ab:b0:7b1:43b3:8189 with SMTP id af79cd13be357-7b193f68cf5mr2130263685a.12.1730718772737;
        Mon, 04 Nov 2024 03:12:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1kLsLhTw1eCaFhwc75OEkkLjLtmAZaNU8WNIlpyHgnRFt+2XGunT7R8lTybD+GT5231O6HQ==
X-Received: by 2002:a05:620a:17ab:b0:7b1:43b3:8189 with SMTP id af79cd13be357-7b193f68cf5mr2130260885a.12.1730718772318;
        Mon, 04 Nov 2024 03:12:52 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565e08d0sm536708066b.115.2024.11.04.03.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:12:51 -0800 (PST)
Message-ID: <e9d5e5fb-a656-46f4-9f5e-c6092729709c@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 12:12:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sm6115: add apr and its services
To: Alexey Klimov <alexey.klimov@linaro.org>, linux-sound@vger.kernel.org,
        srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
        krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org,
        linux-kernel@vger.kernel.org, a39.skl@gmail.com
References: <20241101005925.186696-1-alexey.klimov@linaro.org>
 <20241101005925.186696-3-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241101005925.186696-3-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XJLmMANWhkcDusx9tnab696hnIsVRqT8
X-Proofpoint-ORIG-GUID: XJLmMANWhkcDusx9tnab696hnIsVRqT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=509
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040099

On 1.11.2024 1:59 AM, Alexey Klimov wrote:
> Add apr (asynchronous packet router) node and its associated services
> required to enable audio on QRB4210 RB2 platform.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

