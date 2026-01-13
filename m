Return-Path: <linux-arm-msm+bounces-88791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9014DD19737
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D6E1300D15A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 14:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0805129617D;
	Tue, 13 Jan 2026 14:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCaR4Ulo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGl1Mqja"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4639D28CF66
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314469; cv=none; b=qDepZWJC1ZMbnhMeAFOFdYFOLh1ke2UBRdKLUVjnGaJuvpnE6UMrd72U4wFb24VYbIvRc/aAzsOUtJGjEN8LZgnm+eNMzKPM4aZCzz30XgQAbbj5Plwf4MEWJ9yUNuJV0Vv286folrJmNLue8I0zBq0edsGwvHRsEjqh9SCevCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314469; c=relaxed/simple;
	bh=NeoR0fPNxCSdzYMkdOI+2qYm+0DV4Tdgor4+2UlbwKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KpT6Mu9/KdgmIGKZrgjtBd/T10SN11pnk0MbugkVHuoHncCJIM2ABdePKoI4meFBjg6fnHNVUa6d8t2OfPpK/U41HwALRhJsWDePOqB/DW1hf2CdelLNUAH5OzIVrQUZFb34kb6gHz+eTCtnb9RZRNYqptu/Mk8Y455Tmd84FoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCaR4Ulo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGl1Mqja; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DCntEP3734990
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q4nT7i7wEpjHjKT3NdQ4OcmrJHkGn/s/l8olKaCe/HE=; b=VCaR4UloHp60WWR+
	ehYYYx1BW1Bzv2cY+oxJUBYhYX+6sN8bJ38ubUfB0K0jw0e3/Gy06T/+WYamOrTr
	zmE84kHRFVzK/Bjy0GF5uCAtyPA1mHxZlXRTqXaasp5ZdV/jbFkMP3HVqtErmzvU
	PgqCbmgPVafdjWb5e3YVrkBxu6Qgj2Pa6gODu0sd+CUKX9pvVkF/bWA79blvNMnT
	v/bwCNe5H/Q+hIQh+8DD9/7038l/erTBcVFlxuYl9FXoQnPy7vyczX1t9SIQF3bq
	vqAL3oiQNthAPGPrYB0D1LFbKYDNm5q/URBkIDvwJGFCPrknnSNkLd4WgjzmanVc
	UziIrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng879hw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:27:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bbb6031cfdso248764085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768314466; x=1768919266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4nT7i7wEpjHjKT3NdQ4OcmrJHkGn/s/l8olKaCe/HE=;
        b=BGl1MqjacM2V6v8V1LHSNHmNlxYDyVNMLjfX9qE8szgnD6VIQa3/hhEebXE9a9bHRJ
         BW07PRUR6Qm7ZTOq1yGquD7Swq2cJancGcnxhcV+SU3G0uTwvo3Fgd2elbVnUUhsAWto
         +p5Anbmo2ISVhCmsZn0aOlNgeavrb2QL9I4ABS4Crj/dfrUq83AN+RtYzKQSh3dmT8lv
         lHG4BmDhaNgavKi39m/nt5AFMk/Yj7AGOIAFopEXbPhz1BQJXknoxUsE7lS86zMkquyG
         ay7NnsTPb1EOmHgYUdaNEQ73dDxIqMH7By06wuGT2MSNfZK6VhTp7dsQ5d9kbrRtVVnK
         lGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768314466; x=1768919266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4nT7i7wEpjHjKT3NdQ4OcmrJHkGn/s/l8olKaCe/HE=;
        b=OpbE+LYztegCmkUcQpaTZUMkWllHOYju5BMZAvjhQDv3DC5mBIqNK25yNBF0/RNelm
         0JPffATf443DWdX2J063E51xdrsyBat7OV/3aVKIV0QbkfYpaIHioxMecscnIfuTn8kA
         RU1tKbSDB+hH7pYag2e4wO4m6Cgj6co+0LQ6Fv6X5FKYDA8XoWIfK36mpHXYG2N7jQ3U
         gfgbQN8JhmLPGthLT78zvmXBC/PZsSapkvzG9d/A1f/dEhqdPxY00FPv0yNdaKhm9o6m
         LlbOJ5Bo4aIKShwFbOp8fNaC6FgD6L1thQODHdsJPAlhGRovr0zohsOpnVsgM1WcVNDI
         5LVA==
X-Forwarded-Encrypted: i=1; AJvYcCWmbGaF/MlQaaljZV3NUPOMc7YfzPM6KX02s+6w9LirotB+5yg11rE+9nlflauDvdMCutS/28NPHL4jT5Yv@vger.kernel.org
X-Gm-Message-State: AOJu0YwkdB+4+82RZaq6JtgXmYp2Ie0SZSFJxZnQcxl1Le+4pQFW/ANz
	9RoFOD8qyKqy8Qe5h1k6KdVe1UfEhSgfmSdd6ovZDA6OjAWzJWjGBHkFT9crIgj/1/9WgSkAUek
	YkmxC/2faB87PxAvSPWtKC5mV3npTVlKiSiYirYCV/HtwVADkzMTY59+6CPOe+1KEewRf
X-Gm-Gg: AY/fxX5x1ajC5B3KbAMyliQ2GN6tT/WqfFXtTW54xjlpoheWdVAiVLYsqYFrrwtS5KM
	tOnvadVj/NhpJF3j4ACAWD2ewE7SDW7wwJCSZ8iMz2rAsoIi69FZ8hySnj1KMmU6gGEpNqs4p7J
	b0nLoZGBPQigt4xaZa2uKOHvHEqv14JFTj7JTama3aipjP57v9FPRK9GYgog265NBHgggWsjMYl
	6n5e+kylSmGVavbvCYB5+RWNVz9on7yz2W6BOEENOAGBmLnEQTjtw9Fc1lxkN9Us2g+VGH9fqyZ
	9OpBqVRXJaa0XbfcbWNf2IhoQ7OJLslcbGHJalLykFpy0viZcIE4mrazeHf6E5JHkSDEjekqOpM
	qTKhfjT+JpIQRrci+KTLSV+nXI9tS1f4Zm2yz2gr4p1IGW9FrhX+OT0oMA7+jyAAUP3I=
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c3894104edmr2194980085a.10.1768314466525;
        Tue, 13 Jan 2026 06:27:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHScso/L7ys71AOzWfrACJ67yGq+O1Tl0268Rco6zWp40zeSyEB9hK9SwA0CE9pEPkDciaQFw==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c3894104edmr2194977685a.10.1768314466088;
        Tue, 13 Jan 2026 06:27:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f9a9103bsm927560666b.30.2026.01.13.06.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:27:44 -0800 (PST)
Message-ID: <f9bdf491-0809-48fb-ad81-18a77d98ae00@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:27:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks
 from q6v5 struct
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        krzk+dt@kernel.org, mturquette@baylibre.com,
        linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Govind Singh <govinds@codeaurora.org>
Cc: robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <20260109043352.3072933-2-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109043352.3072933-2-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyMSBTYWx0ZWRfX9n6peUN3ZWdt
 vlqcR+fOBPfsz+ebx5lxZtR+H4xMGpa2v4eKXKSj+6my4XTTTindpDJ5BV4AoQelvwpINpjwIEG
 bK2oVVcJR/O9fmscgUw1Y2yeRoSRXV8dVVd8+NbYwc0CoPdbXomBKIu3HD7Byzek8Xw4dQ04LxH
 yJ/iju47t9sqYw3KBfhHuag2PvfO8DfYBIrAZaskSy0bBg2LbAfuxOmlYQ3Rn2tqQYTWx2WV7+L
 BsH6tyG7gptGK3G+n5BQk+4KtuX4UGpZtMrDGWNnswKJ+43WIXtasNgaPVkaPNelhI4Ut0CGm/H
 QpqQVEki/IF2DMV1+90CXW7e2LWfA5uy/tMoKqNMZUywTdDMUKybDeXpbis5Sqfw6aDWGXPfEWV
 nPUkXKrehPpyQiA7LZp6QrjyN2MHM6FtojnLO7CMYFNkBUTJNMDyD+3UGQ2uTskUBBQeCcokNtT
 6r11vRT8ekIhneoR1BA==
X-Proofpoint-ORIG-GUID: P5kHqA72r7U0_I0zsTqKVZpFEqyi7cVG
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=69665663 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=3QIJbu31o7VC6p0Pe9UA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: P5kHqA72r7U0_I0zsTqKVZpFEqyi7cVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130121

On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
> Three of the clocks from struct q6v5_wcss are not populated, and are
> not used. Remove them.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


