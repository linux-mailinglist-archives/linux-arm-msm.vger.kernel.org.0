Return-Path: <linux-arm-msm+bounces-58753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3854ABE126
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 18:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B71E7A8D94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBCA1C8603;
	Tue, 20 May 2025 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KiEKW9Dm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACF979CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759891; cv=none; b=baDkAlDmNnuGPIO6PMKOxHBshcvGXXBtH0EvI3pyU5n/lS0z8W7UeyBVkoQoWnc1FCMoBCPCudHTu32zXmzOKQQ4gOJxH09oCgkEi5vbtaF+35ibhe6pnIepeOBG9QpnIae3nI6ZjP6i+PJNs+rXAZvPIQEmVuiao2COF7aMBEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759891; c=relaxed/simple;
	bh=I842f8QC/KMfYaWpLg9cY6lpFSAzcGFG5grlUZY7DNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNF4vfgk8AunZUiUhFT0vzPBlW4bbxBRstewW6/Z6u5AnB74zIK1UWOht30o+HOK5AxOVTLLlZWixYQ//wXTZDVFCMQKA7a/XiICo6lgbPfPzUilI8Fg5H5jBjKgVHMF+isf8HCp1qlGxUNyoIh43Hv0UU3Gw4Ot73ajsUaqSWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KiEKW9Dm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGe0Mu000737
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2Cr0Q3aujptwyPPP/18wEcr3RB2aPvaUVraUjgKeIo=; b=KiEKW9DmkbNJnmvr
	vMjxlDtRo8r5fXRGGWzTBX04jtarGLosI/E+U2UD5kTdezwZwdfC6SeVORsmKP0X
	suf+Xf6LM4UoZYqwNZ7n5/WKCS9wlQuYRQGAkKCCTc66pqOjPCaEBt+8jLCsIB1+
	M1O9P1WnWhahyt/4WqEbjhFXwW65SRRCiogj47qj5vFid5XwMKc/nlM9wm4dVcT7
	EEm1w/pQ94qv/gWowM+LfF97uuQD1mVWeBZi1BG8U7kufy887DNIUA6L9reb9FfE
	BF/XJO2fEb2CAbXbsAhP/qAhoe0nDnTh0bMQAHa8Z2LkO6UlO4pJydCKu0x1kcXp
	r8Cmnw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4r11r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:51:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30e550d45fdso2078463a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 09:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759887; x=1748364687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2Cr0Q3aujptwyPPP/18wEcr3RB2aPvaUVraUjgKeIo=;
        b=KyGXKAJZRqb2vguglu0rdt2MfkqQdNb0O9HmzD26Jub+tJMyHuPd3+cQb3U2ExL7si
         reZeBt4+PxlhppUd0lBrpAKRgDU78yFJtYkNUGctx3UiQfMwBiTcJYoRUUllrP5BH9+z
         PqWt8UVqGW0A5Fh6x6XpbmQ3txXmP4B5XShu2/8dzh6eIkpk9arzmsf6a6bAhT8++zBt
         GMQPPML1NCOYqg1Us6We+FMewUhiuCP+sabtOfy4sXgDXwDvuP+iyZKR+Hh1V7STc6UP
         MwMuTqoW4cgQDK6hwq5vMAg5mVx43/IZI2r8rKuWkUaVCtz5cC10peXAaPSj/S8i7SNd
         DoCg==
X-Gm-Message-State: AOJu0YwthB3g1N3enIk5WQfxDBOGivBOuPWmEbIMKq17NN5yKFNPBzmj
	WS0D/RSrOPQvb05JnysiWf+AWIAC3HvbbQ5YKwW6X3ysoZvtyiDjHGAF4LN9U8MKLP5zMNo/89b
	rTijI0kGdDyk7/k/ics1Ctiq7xoj1+WXFvh41rm8Ro00Y8t4FkTnjxY07ulfmUjhdc6Jt
X-Gm-Gg: ASbGncsc7CZldSw8NleXkMlQtEoz0h81XoIvGD+ypGE5kdbKir2yo7iHibmmZkHcfdL
	eLV81SCOhQlCr8hzGsvsaaXAngQt+ldZSVye/e9t1/8ioLb9yM8pJKNQoQtvtjDOpxwbFlbLTkR
	wLQPM9uteifh6z43CLR8zblaz6cUg6ZbWniulpZVLXOWGWgrkmTas9LIHm1wxTQiqZx5R44HExB
	9HjFN4LlOEvpidCMlKVlzb3+mm1hjWxu7PQrgBRGtHtB2VPMoFII4tyWVG9XRlWDUXYoCWiJHzs
	ZL6gCnIdQ2YA8dxBd/Wb6e9JJUXDT82t/PsKH6bNQ3PQ+6AWoIMpWk2VrXoKHEYALw==
X-Received: by 2002:a05:6214:18f2:b0:6f8:b104:4186 with SMTP id 6a1803df08f44-6f8b10441bdmr82991716d6.2.1747759477859;
        Tue, 20 May 2025 09:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4a0OdI4aLpuBYrJMMu6xHS4MmAbVCMTTGLWKZDGXZ+g4jOZbXkvgeQMFRDEnmvpFkP5lQcw==
X-Received: by 2002:a05:6214:18f2:b0:6f8:b104:4186 with SMTP id 6a1803df08f44-6f8b10441bdmr82991556d6.2.1747759477341;
        Tue, 20 May 2025 09:44:37 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d442069sm762552866b.103.2025.05.20.09.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:44:36 -0700 (PDT)
Message-ID: <6f12b7e6-5743-45ba-a425-029655096f5b@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:44:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8750-mtp: Add sound (speakers,
 headset codec, dmics)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250519-sm8750-audio-part-2-v2-0-5ac5afdf4ee2@linaro.org>
 <20250519-sm8750-audio-part-2-v2-2-5ac5afdf4ee2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250519-sm8750-audio-part-2-v2-2-5ac5afdf4ee2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DX2r174d-j74ZHupZQ19BmieEJuWpgU8
X-Proofpoint-ORIG-GUID: DX2r174d-j74ZHupZQ19BmieEJuWpgU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzOSBTYWx0ZWRfX3Cu8vz1a2+LR
 sukUIzRr+i0glcpXgYRucye11E1pb/jJHjEPu5ff98Ip+Xgw0BsBTu6fdWN3z0RTjWoBL0oqaHS
 wNbauyFXNhfovehuYmQELkELMGrlMnrKQAJktKIkgfatpWm9HqooCW3M0BcGk4Mfl3ldUWWP47w
 n4SRjeySmfgkut33YvYXss5nTONFr7Jqr1OwOW6drE6kOHekTgfEr/V/qnNpD9aT53eZumkKNia
 yyyDFq8C3TFC4dX5AXR8/wWu0IDJFfOy/KM4QWIuinZ3/1G/Jo5NSoYQMeZMs4pCfQ68On7ziD8
 IcuasXxoQTKPY+aQZf21ZUXLgDiEtSVYolkkyQKhI5v8tebqGsQnFgpupAu9hLeKMqhkiV6JOdT
 sYEPOOPYOfhGyCcxgICAVknoDnMMrkB389a164ms/fOhvwIuFP21sO/RDkhmXdWeqmeUrJb+
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682cb310 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=er6kI1bek27KySCzKVEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=907 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200139

On 5/19/25 11:54 AM, Krzysztof Kozlowski wrote:
> Add device nodes for most of the sound support - WSA883x smart speakers,
> WCD9395 audio codec (headset) and sound card - which allows sound
> playback via speakers and recording via DMIC microphones.  Changes bring
> necessary foundation for headset playback/recording via USB, but that
> part is not yet ready.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

