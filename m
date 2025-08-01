Return-Path: <linux-arm-msm+bounces-67368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6D6B18321
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 16:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABC04623911
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 14:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6366261594;
	Fri,  1 Aug 2025 14:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="egO7XlpD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818DA255F2F
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 14:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056982; cv=none; b=FuPNjUPjVo9OmdIWZtoyYiydShbHoa8AGRC6cttDzpUe434/I7IEyDGdDVftxYgAOreZOm2KAaMJM/g5nKc0vL3QO22M2b/GfE7nLKLWcSXGqSAN3MMWZWH86Lkm3uUQsOEvuescGGZvaQPExYubmUxlydKXiPq6wQZvQplSs40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056982; c=relaxed/simple;
	bh=nItOCXaMTZikrEd/SG/gPX9uFOdLbGk1tBhDXjWOOog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=siirXMiTHWQ0fqCKYREmJGNl/FyvfPDsf3cKHIOjTyiFxEp16boXp08qAhumJf/G7T5cR+Chd/Qy8y+eq5djyYQZEP8O11Kp68OKQRQSTPF0fnKVgeNAe1i4WUaXnEkpdFHXYcgNqK3lheU1xaTJz0vWNCatRV+GDb1Gd/sPVYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=egO7XlpD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718jkaX025585
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 14:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygnu3vKtE4DVMIUyobWs5dsEn3embXwZTU9fPdwC1w4=; b=egO7XlpDG/iZg2Pd
	ouw+Sd0Y5zRBUvnt27rkvfU8XyM6lTFdcypePMt7sLtPBPz7lY4q5vGZ0653Nrl9
	zFDCV0w09TNVGYGMtNND3D7/hKCpL4WgkBwe06VaKPVobsZSMHa0wjbbRAMsv7f1
	Zy3rrkQznQtBaMbWxLlP1LIT4ajP7F801kftJg8+cqVZrzkTypJk9lE39XXmHlig
	9QQ5KDul+1Y11dL/MyPwDYCf0R3I8aGRZbSxwC5a6o7MwKvwZx+oxQNoMZmEaTSR
	5Tcdh0bRpLfbIqfONpPah0N8+wj8kS1wjCSc9HI0iWQClnaQ5V1agVVJyAndZ7TL
	g+nFEg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48887g4gq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 14:03:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7deca3ef277so67821085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 07:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056979; x=1754661779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygnu3vKtE4DVMIUyobWs5dsEn3embXwZTU9fPdwC1w4=;
        b=CRLtAgQpQB9bW9QgARkk/Pu3ahmOwORbW2ZYE/tGgm+WbiSUUC+EUirV8VY3jNcE69
         ySviTiSwxpqBoZR9/aNp/I7ZEUu93QytthLj4DdqqKccsjDDty/uE8ZjRTGPj5F9htzt
         eW7xZR2dmrayzre1h8S6JiQNZt38UuIZZrJ3Mc/YMz1BHw0Yt8gcxRIdeZ4enTfQnw8C
         x5WNfB91uO056fQ0yBr+ufCR+Lhv/QAP192zzwyjimwnUzWcTETltFLC6obXC7t4Bcve
         HwCCNbAYGw1CLiuOt2lv9ItusstP5iPgNlornk2cCHRp3LQGmX6pXtLN7Ea1cjZumWR4
         uIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGou0Vqke/549yv3nX42/EzV4Xq0zC5qB2nedFR5ngYJnLXlrQ8A8a3MjOXRH5b/6nLeOIiCgKuQD9Zgnv@vger.kernel.org
X-Gm-Message-State: AOJu0YzGvkGcrMMwRjmd4Z9k4IvSA2YaiSuzjcLfoaBWkEW7/GQInLUO
	U13fxV4T6cGlwnSak8ZLIWw1/pNlNBIe7SkK0OLIlm/pPrA3RrRuaV8w4otId5BC6GfGiWrn9FW
	Z9ca1WmLZOfBFOfRGw4SzqJndQYPCxKsXCb/k0ceY+Ik8YBf5/x9aVSC3+TTwhbzhBoVf
X-Gm-Gg: ASbGncsnvtOR4qo7D1EfNeDUrGazjZpXAaV+pnR6FcInD4hqlk/LctohOweofhdmIxn
	KKyHu5nGF6EQqya9bLtjSakuCog5Pw8KB2wAQIvAgIMQB4KdTQmoT37GHs0Pq7fKAybVAleH6yc
	2iBP9QcrKQ4VRnBeC1R8GZ2xvhCESF0hgWz9bgm0LZDNBOqZ9efbIw6BYsdVH4iHN47suj6yZuB
	Ueg3Hroqp8dxxvV4OvRXz5cgHw+21F6eDKpC4ts/o/CQ3uNZR5QsL+ByhXSwJQGh65gSMRri9Or
	enPBdbNyNv2A2l6ofEbC+CurrpRDEMVryjmOfL8/fd4FgmKfKqECxK47SnhhUKnTULQi6AfFuf4
	uRET4OvJ0d4r9MS5+Jw==
X-Received: by 2002:a05:622a:450:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4aedb9d4b86mr86440811cf.4.1754056979057;
        Fri, 01 Aug 2025 07:02:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcPlC48/d5ChZvKarK4CBxmt6g2Onl0ZKqiWKPbE3pGDFKjvLO3RnhPcMsdo5wR85JCYopFQ==
X-Received: by 2002:a05:622a:450:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4aedb9d4b86mr86440301cf.4.1754056978309;
        Fri, 01 Aug 2025 07:02:58 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a2436b2sm283269666b.142.2025.08.01.07.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 07:02:57 -0700 (PDT)
Message-ID: <5696951a-d4cd-4b98-8190-a1126dca4317@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 16:02:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7280: Add q6usbdai node
To: Luca Weiss <luca.weiss@fairphone.com>, cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250801-fp5-usb-audio-offload-v1-0-240fc213d3d3@fairphone.com>
 <20250801-fp5-usb-audio-offload-v1-1-240fc213d3d3@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250801-fp5-usb-audio-offload-v1-1-240fc213d3d3@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vdn3PEp9 c=1 sm=1 tr=0 ts=688cc914 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=s1otzWxbid28AevFAO0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: fh4WU_CnuOFM0BMF1sy-NP75biVDYC7f
X-Proofpoint-GUID: fh4WU_CnuOFM0BMF1sy-NP75biVDYC7f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfXwFSiQNeiH5kB
 n/F6KAdtQNSBWW7kxKxKa3HeDrsuvWKw/cMOwngxz73Q33I0rNCx5Y205NfV52lrR5WALy7uB3Q
 e1RGWWdZJkEKZXnrM/uvL42zhxWz/g0XYvFq+eN1S7etAaGV+RuXDl1p+vYtc6XIwqYJeOo+8im
 F1pZhGwDSWOydYdq1p7mkFHX/kJfTxuL8Hy9h2U+ijw2sOaHfk1QB/MLWOVSGxsrNP+9AvxFSX6
 x5dIOMsILdB9fBACjqzevo9t/XehOAWeEkvtnPmOEdaodAkiX2iUTB7lE+uMTsdj+dx6adfTnNH
 rqv8WVCRVJgSYrOXtQ7UN0UC2+C2aRU1acoBowswHGWNBeLsHc7vdBGC5MjvWR19KAzcTdnXYSG
 scue9/BWd0Up5irOdyIkDdEQhxRAnh/GTnyXOAa/Jjf2OQ8gNEIxSXrOQzzRmRCTF04lKGAe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010105

On 8/1/25 3:51 PM, Luca Weiss wrote:
> Add a node for q6usb which handles USB audio offloading, allowing to
> play audio via a USB-C headset with lower power consumption and enabling
> some other features.
> 
> We also need to set num-hc-interrupters for the dwc3 for the q6usb to be
> able to use its sideband interrupter.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

