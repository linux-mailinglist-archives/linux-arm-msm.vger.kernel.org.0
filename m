Return-Path: <linux-arm-msm+bounces-81920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E83D7C5F71F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 22:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C6023B32E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 21:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E764D30748A;
	Fri, 14 Nov 2025 21:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRLzmPpN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q10Q+7K0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E112FFDE2
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763157593; cv=none; b=YRiaRZM2e72Nd+qg1DlmyURd6VBWIkv6xj/14WZAxLU4N9vV1h/eM3UWQDkJ94aUdDo+4wpd841h7kVHF7bzQsryWyvlJvVmnmw1E+RtZHf/ESGFFIvKzThCP2h994UpPN0p6tW48HYrFlErjl68xfLBXca30JSiMKA1iqLbrdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763157593; c=relaxed/simple;
	bh=A2EAT4dSbG9NJGZKZ/4kEmkelWRiPgGslb8Z49kRMx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHxjfkJFoSAgzpCJU5CsOMX8zBHJHzEQ6YdqMg8gy9i1BJ8prwTsGb8RgQ4YpvEih+GUBqyUegUzYsWZHpRYjJkpCrQiQj5EVQHBLjsMlFvfCdCqlKn6+RKPOW/vuESrCVUtfhw+/ochL0YmJv76294UDTreqADHosgpHl+Odyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRLzmPpN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q10Q+7K0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEIQCrK380885
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhKcalCbZ6CIYKOwmVkeP+G8NiKWk0cRuh7XCbJIBfQ=; b=PRLzmPpNOds+hLvn
	YlZBtR9/u+NEiCQXeRCn+JE6l91bBwkXKeehhX0t4EkcZzczH4QBh7ZUCCgCpx9w
	lgmll3xSStSAuLE55kQ9PBzMLw8gkZhYiS1ew/FHxVOtVmtoH2VvsYrX1ABAfl4z
	IcXhoNQvVNxQhYdrk8TvtFsh3DUzR0/glqJx0bZQpUmpycOEHoZZmLNWmIn8bBtp
	/LekNBCMqUBNMLFLbXDWp+D8vt7dKKZyfquGKdam94eKehic7xmztV6hzYrhkZRL
	i+jc1A9xeXsp/ugjQvdl9oJaNqJq5rC83cbnPAXUM+mRm/VKv/v8vubCRFVofZ1X
	c4dKig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae7qh8xkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:59:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaeb11630so6652711cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763157590; x=1763762390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XhKcalCbZ6CIYKOwmVkeP+G8NiKWk0cRuh7XCbJIBfQ=;
        b=Q10Q+7K0QLLROoYzpJHUiiHVFKGE5Y7KmaDb79V9g28USheTAs5CNeheMAB32i8+Fk
         Tp6hrWzZbdPW+XuJjujw3nwTPKpwbs7dVlR+6Q96kmmDMfKd5jUgsBMHFgGnb6AB+2PX
         q4mlwjacP5CebJ3RqbDfbUzFZDwwdJbfKvhDd6nPsYSWkw/r91Djm7/w9g1kHzvKK0e0
         QzUrspbSYXl/ANePqlVDNOuX/hqqHeN4cOsY/JGwsyn7oN9m3mAmsSPYEEdlUPin/gwt
         pwrpzrlVDsjCUxdMVxq/bhfb/qW3AuojJmMrMa5XQWh1gNKCBaOOHTjnGWnq+klp5IHZ
         sxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763157590; x=1763762390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XhKcalCbZ6CIYKOwmVkeP+G8NiKWk0cRuh7XCbJIBfQ=;
        b=RONbin3f7P3uBeZRi8d1Oce3pNi9kinRhTt83oMY1exXUls5jfuDiRIYL991lpNW0n
         aLMjmPoamidn7rJ2DJU+f2VJK3Htzpau0c0VDcF/HkeRx6UPzccPWh0LcmfVpw4fOVJ5
         1Z1h1Xbj4nMb146Ctz6d7mVCy0EzRziruXd38xFb67SO4ECIS+3svah6NmRklsDQhM3g
         5D9gc7lHpZBFUeMjwysJ1uEzL5kKv52NvNzE+qNNnczaDH9+2Dv3jVYKrqrVS2nuuuvo
         o3NkDkDszTc18s6CuoDgKGpaHsni1vtsa0CtAupsopotxgcpM7My5ivtrXzo05fXnMWF
         Cf+g==
X-Gm-Message-State: AOJu0YxVLdMdiPD4IFN5+KslMtVIU4us1gawef5joI/Zbg0JzXHYH+7e
	P8FAWOd5tN4RZ5ICXs5dsPNdQX2m4J4VPH/GbQqiOiWyqn+QmKzFy0PyvJWEc737pXsC3pjBM/J
	uHbpwL9LqqU+/3h6Mpokm+9l3Bi0cThj19xd9iV27hXYcr6mvXW0G4xiS7zSOsSp1Szbg
X-Gm-Gg: ASbGnctxTAbAfvSBZtcwsCSZomeD68ycWoC5BoHDMGCAOv5Xf3ux9SnGrmgv2/EFSxL
	+hkdgna8p1ZIpopbIPrTyaVqlHW1C7E5I6Vs14tTnQDp8Cn3FAggE893H+4UwtsCgbGVrSGaymw
	xNbXKoRRYY24ziYRCdvTUQj0SyCzZeJUX5h8oP5jIEoQryCYBvkQZofKWsh43x8syobJYFFLv5a
	WMQHACz12IVUO/us3JvjIvBFoCIMMxQn82zcure8JEO+K/0V9DIydb1cFTWRPvDxVKTQuEn4wE2
	qT1ngW5tAtt4uk4tvUVjbeIVEctuTr1PbaPHQogpTd6tqypQzVH5g6TShTmn5uWJeWHnaagwILU
	fhOCoyt4k0cbE0erM5EtpzugPykew1Id2iRs58yg/gdYV9pcFkrsqr9Nh
X-Received: by 2002:ac8:118d:0:b0:4ec:fff:2815 with SMTP id d75a77b69052e-4edfc87b5a8mr18718361cf.6.1763157590065;
        Fri, 14 Nov 2025 13:59:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGa1yUZoc+1cz/ul+Mc+geNaqhfxmLf2qsxudKAH++WY1ZZqzxI5KpMHPofr4S3aw/9DF8wqw==
X-Received: by 2002:ac8:118d:0:b0:4ec:fff:2815 with SMTP id d75a77b69052e-4edfc87b5a8mr18718181cf.6.1763157589628;
        Fri, 14 Nov 2025 13:59:49 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad43dfsm468318666b.20.2025.11.14.13.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 13:59:49 -0800 (PST)
Message-ID: <3e54b28e-8ad0-46b0-bf78-3f8be3cbb079@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 22:59:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable TPM (ST33)
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251114-enable-tpm-lemans-v1-1-c8d8b580ace7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-enable-tpm-lemans-v1-1-c8d8b580ace7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cIvtc1eN c=1 sm=1 tr=0 ts=6917a656 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2V1sWMUe3bcNMym9idUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: CmJjrOpzjQG_sGE9qAYla0HoH3n8SLR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE3OSBTYWx0ZWRfX3yHaTxls+Wwu
 Azq5RPPbbtaahgxfVT6Cx6oLwxHBhMczh4X7nu+x6wAjV/MSp+9slpLAj3ErVETWn5ySI9QnGml
 s7PrnU/GPgSGZ/JWzrsHQs/nKsn7ZugFcnIcTkdnyCnzShgwg+1lBXx7N71WtPexP9q7H+Q4Ivl
 TOxRzGDgAg5wSTdFdkvhqztgFYPqF6PlDSu5gqrzCvDwvvwsZGqHejF96Rf6cY2NlPnMWQ1UfFX
 DKuWvJfD5Zgcat/aEHoa+jjzC+qRxcaZ1dA0Qcx7aI5fgm2vMHMVHWeZzW6DKLB3VsDGBaUTSt5
 Vx13OLMCEN7F66mq184h82YmJH8MAKVoHZlpBQopo5ftq9A2ZoS2Uh5SDBzyhpbm/13pXOyrenF
 W6/tgqwd3oqory+XeHczpGOsp2dZBg==
X-Proofpoint-GUID: CmJjrOpzjQG_sGE9qAYla0HoH3n8SLR_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140179

On 11/14/25 11:15 AM, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI16 on the LeMans IoT EVK by adding the
> required SPI and TPM nodes.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

