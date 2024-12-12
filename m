Return-Path: <linux-arm-msm+bounces-41828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 037F59EFB69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 296B0188E88D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1106717BB24;
	Thu, 12 Dec 2024 18:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLhmAXEZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880E218CBFB
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734029281; cv=none; b=DQs89+Or34/izZ2g7PkGpaOkpFO6elLGB7P4kY7j9XKNgt/cwf4bdZiYggmfWhGpv35MZEmK+3KuvMd3eeqKxrZfJ8fvsgPJBX9i61v87GZDDMVOGMjn5SDC1msxXupT1Le5IkRi+o+6jqWSVl02EIqiPB4IMYHNUUY7BewopcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734029281; c=relaxed/simple;
	bh=KlkSWLS0Qd/mfciP5UkDT25gBWSNSTSCByPeDrKJSD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kml1TfiH7rf4CyC2nkJS9QZ7ECVVtYYFa4+51amZGvCI6f8x9LF3WsBBUxy9wrzMuY3NLRc/4KOpW5p5GSfpPMGgC71H33yYrmGfoSOLxLO77aJGRLVZvwgeaYjYqCSotVP/zumP0ITs4DHO8vTF3MU3J+6l/oypgIrZS3I/0fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLhmAXEZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGFQoI002082
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALq+X0uDXx9y3Xid0ehyViPpa6r2R/TSZzWUGNi/JQ8=; b=fLhmAXEZeVEMBALq
	TkeSvcA1HtPZiNwJ/SSYzvg0kA4Bmf6IxjR7Ex7bhmZAV5CKwPB9BYjr+3KRy9tl
	xImOFLRLH2drf2fMMkbKhkfMD0cKHldEtLRDKeRc17Gq5uEhbiRUoJ+Dn6l+0tDF
	INEOPWvPXTipikKsHoT7oQtYYheCAI4zBYSwm82RlbZaWtqEwbIXDhmRzEJ7wMWG
	yJEhTQ1FTFC4Yfz2O/FXuwJ6GiOEV+BLxAaPMJtL5Uapr4nQZrCWNrfIZhkK56XK
	pQgUjE2KKmzVLsN5qcyOra5t8MUcPrBzLxD0sHRzAFznd/cdoUGHdTFtdoiFBMmJ
	fwlW9A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9xcvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:47:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d880eea0a1so2485456d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734029278; x=1734634078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALq+X0uDXx9y3Xid0ehyViPpa6r2R/TSZzWUGNi/JQ8=;
        b=YS8t4y2oMKttkhbcv7Vnb1YYlFAk0PU/AUY2jcvk5tXGyyYQ20Z8XRBcTiowCSA+Kb
         cZAW5s83R7UrnWe3kYyVA3WyCKuhtvmsN6SaBtpNH80ZpFtCH+vNRgI9zaN2PkEZWHXV
         Co2VA6r0/ckCNRH/uehjFYjeEU7fVd2Qiwwg3hMtkrzKMzsCy2jU406OB4frZRIBizle
         TR8/eI6d+YTPDQizfF8ntQ6YIx6iWdPOvVa4yK5Cyc+MPOB8iItMY0l2XaId/ZHudDQ5
         MVHrA8Iii5GP2JyaCMwGflHGHMlS4OYKk4tBgPPeENqEpZspfIr47d+AjzwbcTsNc8tU
         h7ng==
X-Gm-Message-State: AOJu0Yxj/X5XvcCF+NhKOBYg2n3zf4dAZBl/9IsI2BUDTMElewhPinem
	s1+qesfd+YMItCxqEKkZjDmnEZRXCGshRFDLk3lleKB5t88Zg37La8seGfzs3M+9GdeQwn+1Rdm
	t6zeRbCq+Krh6jMxnAfbaI6IF8pWMhlZejDiL7lu+eA+oPEeTkLkfYRJa/ajP8U/7
X-Gm-Gg: ASbGncvcFaxNjnet7x1XXEwujshb+s70RFUXmIB7v321Mb6L/q92IE6hncoKPzKVBDm
	iQpWZuaCBPZK2hgt07nTpFjefRnaW7wGMXoRzEdgbE/5B+0sFKuv4jJpCocheaWBlDeGtDnV1gY
	Q0xM6sokLZ6iQmYiKrzmi2RvqiwO5cWXk7Khrzgt49yoSZhudXlL7EYPYu7p04EECNGGgAnlOCo
	5Ojhr0B4PgQD9dT0Kmm/XeJvt7xOck+ux1jYNEBmyYhpYOMsc+JGBRl5VnMFZkOeRKnNO1DBIWR
	7n998tvU1uJ2lnD0TZrtEBkFPa9PTLXmKjLGrw==
X-Received: by 2002:a05:6214:21ec:b0:6d4:216a:2768 with SMTP id 6a1803df08f44-6db0f82f0ccmr8310616d6.12.1734029278611;
        Thu, 12 Dec 2024 10:47:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEh+G1C5zbhHrm5ABg6kM6JkUvZ5KKIo29bktjk85BGikSGESW+ovgWonPs025EJAUyydbJTA==
X-Received: by 2002:a05:6214:21ec:b0:6d4:216a:2768 with SMTP id 6a1803df08f44-6db0f82f0ccmr8310446d6.12.1734029278313;
        Thu, 12 Dec 2024 10:47:58 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68e800a9csm569897166b.34.2024.12.12.10.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:47:57 -0800 (PST)
Message-ID: <27eb49c6-c81e-4792-b49a-904cce95cdc8@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:47:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/19] arm64: dts: qcom: sm8350: Fix MPSS memory length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
 <20241209-dts-qcom-cdsp-mpss-base-address-v2-3-d85a3bd5cced@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-3-d85a3bd5cced@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zsQJuvvFjWDndWJWldnyz_9-qA6FWNha
X-Proofpoint-GUID: zsQJuvvFjWDndWJWldnyz_9-qA6FWNha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=819
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120136

On 9.12.2024 12:02 PM, Krzysztof Kozlowski wrote:
> The address space in MPSS/Modem PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x4040 was
> copied from older DTS, but it grew since then.
> 
> This should have no functional impact on Linux users, because PAS loader
> does not use this address space at all.
> 
> Fixes: 177fcf0aeda2 ("arm64: dts: qcom: sm8350: Add remoteprocs")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

