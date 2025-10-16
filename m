Return-Path: <linux-arm-msm+bounces-77527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B125DBE2078
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 09:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97C2D1895737
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 07:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864E52FF145;
	Thu, 16 Oct 2025 07:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8yIfGgN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CB62D6E72
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760601091; cv=none; b=LJD459H9tyuqeujrUb+04vCMD2DeA3qgvZ1Sw+MXv85UoqLFTwEWvksPVA368Dfybzo9zn+otdos27iJoOuGyGTWoYOgnBDtScFlD7yvbMdf1aBUo3adKPZU3zjY0SZ9ZmbCtsNOMepRv266TvE2qWEYtv37NMdF7XcnYwfyjTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760601091; c=relaxed/simple;
	bh=2VFedUnaQCv3d4QtXQ4yKZxmJf80+KvjvkBPEnLIhDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=okN4+aDDBKSO6uEw0hnmnShka3P9yzoLEyMm0XzxdFszdQ4IfUuFVnP8qENFxaTcSvTXe+Qlq+73yESMHc5uGLfjMO0Hhkcn5ODoUBYcUnFw75nGt7YEcAX9SjI4FguHtKLcFchNZvwWYn8KpskyuZHuxBOev3w89/Fhy2myGZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8yIfGgN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FKkul1009138
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hF4W4Pb67pimHUF2lUJMLPPpWbgUCRfxD4sGD6fblL0=; b=H8yIfGgNVJU9lXU7
	xE36ywOmTTxDMPOZuRYq6LRNXacYNfwnkUUtlbs2jdEH8kVdwCJ//rjg9J467ZSP
	KdV8nhdrRKKkjVrjQMcCe16ItfaiDM6A80tuuXXWZ2JU/ncXalUnXSAvSyd9cWD7
	1dm5TP7uMFOxcSDtFECERNtCt0e7edXpJkENBHaXPP+l/Q2V6hgi3QsIwqUflW7L
	i3U8fRk4b8/m+g0GZzQcasgImkkcF1IsjzRGsikWP3YffBTnxW63iNfyFkYqNUQk
	Q+JQrkjF7JOfs5B+ih/vrOi2fVljc3vOM+lVEPMLEUXp8wlwTKyeocBhLGKrbp7q
	MjHsCg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c7b5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:51:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269939bfccbso7903045ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 00:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760601088; x=1761205888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hF4W4Pb67pimHUF2lUJMLPPpWbgUCRfxD4sGD6fblL0=;
        b=I3teVdweWFkaQ5gSLebszqMfUtFm82BpO70S594C9DzWQZoTXZFzXqhZEdiVkrkbAQ
         stCluVjYMK7Uy42ch3fTp7WY2KolBF+wnMeTIRAf03XqFLzXWAAr87ywvkFRyiGUNryN
         geYbYUFI522naQc8DhdRgcCy32VzbW9ZZFtN0e7EGZIsJj29x4SBvQ1AD979wYHrHJMZ
         FWPsXsZKrhz9ArqZywnDFCkcKAV/A0hvcMHqSQPzQRqhswltPGldhH4r8JZmUz4rEKuq
         61QYvDdfCx09exJrzRIHu/L8zyxPtTmuV7Q40uI5oLKQar8dv89p79bjDVvf4Sjm724s
         pCwg==
X-Gm-Message-State: AOJu0YyOjAVFsqfZ9Hpnk7iucymGfyjpDFkBOoTIq4WIRmKIDU6jfZVF
	0yt6jdGGK7j81npc86kKsXUkZ/wMV/1uGm2cQiNCOV8DuajuEvelyNgPWEjJpyeKMAhfvDLT79e
	jvyy1uEtZfkodN4frOzKcPNrj6gMM72DndI4VFx4vaHAteln28V1G/Vs7iGDwZotLhWbK
X-Gm-Gg: ASbGncuxC2Eda6KQGfAs/W4HjFLBn7PKcGy0mC5D9MQYPVjNFMg+cYoIUfNVXO1Zz/R
	vVfHcLPKRW2O6ThamrtEEUs/7QL44tJHlYI5ZOiE5o0o6awo3fdFW11kJBYzNbYFV2XVznVppON
	/KL1Do2EjVlN2ingwY+QaWb7AFMnnXIrIAAX/22W0TQ0oa6MF89LjRZnbWFdSbNcinjLGwViMr0
	Et/xeCBqebZ/mRRslvWGMxIIIfKLJoIDkroByrC5JndjoXukfsuElNymF3BxX2IJ0ZieQ5SghQD
	JmVEzEMrWvC96c8IdJbwhC2LgsYnf222tf5FJxzkHakl0mO0o0WZmOWFG1DdW2za73ATM2JbmEm
	smwR5KTJdyvIZ7sgu1DZWaSfI+vPjr6tn
X-Received: by 2002:a17:903:1510:b0:25c:982e:2b1d with SMTP id d9443c01a7336-2902741e7fbmr390196085ad.59.1760601088300;
        Thu, 16 Oct 2025 00:51:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkWk699Cs8rJdoNF7c8p30aWtBOTi6LJBDiXqz6Xzdy6iqBryCPq1dLN+Bddi5eDeq4uxmdg==
X-Received: by 2002:a17:903:1510:b0:25c:982e:2b1d with SMTP id d9443c01a7336-2902741e7fbmr390195855ad.59.1760601087832;
        Thu, 16 Oct 2025 00:51:27 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099b0215esm20054995ad.112.2025.10.16.00.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 00:51:27 -0700 (PDT)
Message-ID: <fac1a1a1-43a9-4bec-a6be-812e7d97e807@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 13:21:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>,
        Eric Biggers <ebiggers@kernel.org>, nfraprado@collabora.com,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20251015105231.2819727-1-krishna.kurapati@oss.qualcomm.com>
 <20251015105231.2819727-2-krishna.kurapati@oss.qualcomm.com>
 <80c71cfd-e12a-4707-ad03-e03b0ac48838@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <80c71cfd-e12a-4707-ad03-e03b0ac48838@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z9DBLII-EvOaniy-zBmnVSjK3lxAuoj-
X-Proofpoint-ORIG-GUID: z9DBLII-EvOaniy-zBmnVSjK3lxAuoj-
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f0a401 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=6obPUMqE8-fqOp28w3wA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfXy2+fUHI3N/Ie
 wtchJk73A+nXfMbfjcsuqaxgnSNnV5X/jWIiwoyGlQc/nfDj9FNgO4jJi1oDdj/QsR4DtWvQXvj
 uPASsUSHcKxbP8ujl/XFum2Bep3ngiK8gAHgxutmlccEd/Fh56ecH+Of+KDMBwabvY0bfW3OQi7
 VjFYbsvlF6GNBI/KLhp6VQ+wvZD/Z6FnmDcXzyIlN/ndyxR9OnjJqNoiSnDXWwlbKJrPMF3iBuz
 EdCA/S02sEYqE9AnSpH6wTg43lijf4xKVLKDi4ujYNVck+WYeGj/qBcl5ChV86grKCvonLCLALQ
 2+POI2H1qwZwfynZuy94SbgWoc8TETTedVCpkrOrOexvTGgVohI1jD5dK+w/qJN2Iwrhhe/msUV
 NLkCvrwt5IkWP1NR3EYf9qwlKc73MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022



On 10/16/2025 12:59 PM, Konrad Dybcio wrote:
> On 10/15/25 12:52 PM, Krishna Kurapati wrote:
>> From: Wesley Cheng <quic_wcheng@quicinc.com>
>>
>> Add the base USB devicetree definitions for SM8750 platforms.  The overall
>> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
>> (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is the
>> transition to using the M31 eUSB2 PHY compared to previous SoCs.
>>
>> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
>> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		usb_1: usb@a6f8800 {
>> +			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
>> +			reg = <0x0 0x0a6f8800 0x0 0x400>;
> 
> Please resend this using the flattened model
> 

Hi Konrad,

  I didn't want to disturb an ACKed series and hence I just tested and 
resent the patches as it. I will flatten it out once this is merged. 
Hope that would be fine.

Regards,
Krishna,

