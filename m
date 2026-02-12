Return-Path: <linux-arm-msm+bounces-92712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SgctEujqjWn78gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:59:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C91E012EB20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5B6D3038516
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773C243ABC;
	Thu, 12 Feb 2026 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGXgYFEV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BcuMIP+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CFF25DAEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770908246; cv=none; b=JQDTB+stUyNyshZNOcasUgszY9+sbuzSqrahSeGJLy3Wt3zsnU2CuzMEMZ5e/jQcd1/GDuiJ0LisYRNkMdVp/vAnKSl5FHPl/DBPEXTQUhroIN1oIVCoElPOB3WABrb8uyYBPSGLLOzTN2BD/NJP7+jJppdNujWQdWYWoEVH81M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770908246; c=relaxed/simple;
	bh=OrijPGENLGfQV97sq5Ev8AlHCCr1NHlFMga1Fx2gE7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9pxktd01kWnQogLsTtPuYvhWyotI43cbYG/mxIAFq/U6X0b6GcGAmZAvMxJ1cHrAeXBUabETLDybPREj7EhRkL1LpJV2+bPcBwmlltCqjM1FycXQn9wQojsXM0P++wZm+nSSwYryjMcoEjFEFXrQleFNo4EEOZrCrovT7vPTjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGXgYFEV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BcuMIP+T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRhMV3844141
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SrVvwGOv+6vqMxw+o7mtnWWIKD8USCrryDikYGWEA6w=; b=iGXgYFEVejj6ly4V
	lOwdtJdBAH+tdn5kR6XA+LtnYHlml7Hi6/qI7ebPpv3IVxcEiOvMpCI0inGfRzYY
	ax4CLRz3N2GCuJnp5TF7PF84WClG0MWXggw/EAmw0ff8Wuu04poFYbAULTwCDbz2
	s/RbE49jxXZ1YeQAWuzc1Z2Ot09jgSlKGeDKGtdL79Jh3VUR6mIglWEfPkvT9O9t
	jSse2j29xkaA53RZEjPpJ9ly/Uki9Mz8yAN2sgRBMsmmcEBtMLnD+hNmoG9Z6OHK
	B5KXR2B+RGKEACle580HWhC7IzaA7klm23xmUuQ1AIyUG0AB+9m94jCPJNuVBnyk
	XLUMoQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8wtpkpxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:57:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89496f5086dso28995916d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 06:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770908243; x=1771513043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SrVvwGOv+6vqMxw+o7mtnWWIKD8USCrryDikYGWEA6w=;
        b=BcuMIP+TJXmL19J2IcWOsk+1dakrURsA4TyMFkBxrxtH55PR8IzvfufyYZwLDWespR
         +5mqpoKLJEP3wRTqbZn32ZXJKkqrHSsbSmi7iP7Fyx+gKzvnnjjl9klMCNQwP10IeN/B
         wPciCiT2jYUV4bvlaM2LiRcyPioWv1kS3Ez9nSbbI09KgvwoWr40oZ26qU1pZEM6oxgk
         5W9ZpOhELs/ZMVSzJTWizVbtc9hPMFINXUFaHO76ZVwrMDOfsrhmcwQKPQxOKk6i/+Gf
         jWSgL4uJ4oa9jwd0bLArhnnHOb1UrNIPAPXCZ6HyRXzG9ureWk8wlB81ouExzUQUGeNU
         ieuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770908243; x=1771513043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrVvwGOv+6vqMxw+o7mtnWWIKD8USCrryDikYGWEA6w=;
        b=gxlMlL9AuVYQOoe60DKKYwZxkF77Zd8yn+AszTFL/61xZUXuyRXbaUMN8MEejJJYHH
         0DVL7JTkdqqTaVIpnIC1xmTeCUkxRe1/IpU0MVne5rdw7w8ZIxMR86G7QarKBVzkCTau
         YS557Ob3z3e1nGCcWG66auqKhoG7xfjKfDrLREKxcryGclhkERpsZk62S1RNtAhIc2+q
         4GF/v/q7xyXt7jgjsmfSxgjO8OtPaGC2A6ySrJMQVxIVu4B5FnKQXL2epBDyE+7mW7BZ
         Q3IZuo+bDAk5m0Znma99XCaGJrkCKiFDXaMJhan+ccQXOqvNXvRz3c2d7/M5/GPmu4K/
         9dJg==
X-Forwarded-Encrypted: i=1; AJvYcCXZtW24T5yozJCEj1ieVZUGaxpuaYJhFBCdGdXyfHD/4/uQyiUvi4270lYXQ3U0KauQBd+ghKD7Bil9JLbc@vger.kernel.org
X-Gm-Message-State: AOJu0YwzGKBEXInfxvkvyq17UshvAEBjNLFl246/ZhPpq1J/INwxJIa8
	VFUrpOr5qer1XeWgC/BD9mwSONY5FIAIFSn93UsOCmnXFhdT61KLhypIHRmVeWS9PpOyGGwCl1N
	uzVuhIV/01zRtubp0ccfQ7oGJUChOr1wocDpdjNIFy5yN9vQ6mvnY89DzPXwTaYN49JA4
X-Gm-Gg: AZuq6aLwaBGfNRzEPz0CdIacmYn2DuqjBQTVBb7LBKvBrfHjCdG5zlqMOiCdz2CDZlW
	1Sv/4ed60jYWn36/ukyPClSMcBQMR8RwINsYXbs5f2Xk2wEPEKoPMcKT4D1m9dt6RxpgYbxR30f
	Kk65owZouSAxc3yYT4cmiEM7XARVVQZl4Oz8BiYbGfeXtFsG4TVboWuk1whl/2C58v13xQHM6qH
	Eb3B+m9pX6+bYaxuBxalT9KeE18HVHEN4wAo3QPIqHZz2hVvVbWSj+x8tgr9lSLbiWnABqW6DmA
	G2Ca4lThRkLCGamrg2Lss2+69nAbHPDwHbGNE7xqqcwJWPI12PJazFVzOfDMxFCBCkjaNATIwwO
	HnNgVBNpo8J8upGGiChFpKyw0zTyIyXph2CI7YsqZx8NHVDnLsbJc9XLOeRA0+ZdFoTw2TeEgJa
	TNuIE=
X-Received: by 2002:a05:620a:1aa0:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cb3315d0f0mr282070985a.9.1770908243386;
        Thu, 12 Feb 2026 06:57:23 -0800 (PST)
X-Received: by 2002:a05:620a:1aa0:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cb3315d0f0mr282068385a.9.1770908242932;
        Thu, 12 Feb 2026 06:57:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e9cd6d4sm168653666b.23.2026.02.12.06.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 06:57:22 -0800 (PST)
Message-ID: <5f354a57-36a8-4d27-891a-358b4ba487f6@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 15:57:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Add UART15
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xilin Wu <wuxilin123@gmail.com>,
        Molly Sophia <mollysophia379@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20260211-sm8550-uart15-v2-1-bd23a0de18bc@gmail.com>
 <567d28df-485c-4dd6-bfc1-5c357da7dde7@oss.qualcomm.com>
 <CALHNRZ9siWXhXGob0RrrYUauUu9hjChMhJTMU_BWoo9EGfEQ=w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ9siWXhXGob0RrrYUauUu9hjChMhJTMU_BWoo9EGfEQ=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=baxmkePB c=1 sm=1 tr=0 ts=698dea54 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=_ivdKdEdT0-elHp83W4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YunBEwBecUFV_dMPyZqus1Ksl8lxNjlp
X-Proofpoint-ORIG-GUID: YunBEwBecUFV_dMPyZqus1Ksl8lxNjlp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExNCBTYWx0ZWRfXyYHnVmEDv/9E
 rm0tDrNaYextfXdwns2DducwskDTkZerHrxObr2ipITnPnBRDM34PCANBbG6UK9FjBSHrbJfkX2
 ZjMMD6qqoBik3Bsy7A3zwAEo+JLf7kg7rXzMpnzEaQQb/MBaP+G5GbV+OK9ImujCO+wwYclA/Ab
 kM3/ckJHOVRtTBWw4tjtDDy2egqIs20FuCBO0RITJbmcESMmeIiV7jWYTaeJFUY4abDizIW+7qW
 zOQyJFY0MJvxsoeY65NOxUq7v2o0uO75gHIZJ3Tc7Wl1v/evGIl1LciTdWOlegQb9dH9QrQmXXw
 3Dxjd/G+sM3PPFqc5bOhXV0kk1IDGaudyEnlnotAUps13GvnKfHqm6O7dqzAKjpb3QV5SFt/1y6
 LdeRTVIikxT+NZ1dJ0O7fQah7ydMPwrDfRK7zZs0OaWKWa9mcoGV6otaHRMyhZ6DX/zrFIhAMDc
 VZgTeNifRebN+azt6KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92712-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C91E012EB20
X-Rspamd-Action: no action

On 2/12/26 3:53 PM, Aaron Kling wrote:
> On Thu, Feb 12, 2026 at 4:49 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 2/11/26 11:35 PM, Aaron Kling via B4 Relay wrote:
>>> From: Xilin Wu <wuxilin123@gmail.com>
>>>
>>> Add uart15 node for UART bus present on sm8550 SoC.
>>>
>>> Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
>>> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>> This patch was originally submitted as part of a series to support the
>>> AYN Odin 2 [0]. That series stalled, so submitting separately.
>>>
>>> [0] https://lore.kernel.org/all/20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com/
>>> ---
>>> Changes in v2:
>>> - Use QCOM_ICC_TAG_ define in interconnect paths phandle third argument
>>> - Link to v1: https://lore.kernel.org/r/20260207-sm8550-uart15-v1-1-d8ccf746d102@gmail.com
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 24 ++++++++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..a54f375f7f041a193a4396e4aa911abb42e3e6dc 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> @@ -1251,6 +1251,22 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>                               #size-cells = <0>;
>>>                               status = "disabled";
>>>                       };
>>> +
>>> +                     uart15: serial@89c000 {
>>
>> This should be uart23 (see other nodes at this base addr have that index)
> 
> Am I missing something here? For sm8550 [0], I see i2c@89c000 and
> spi@89c000 labelled as i2c15 and spi15 respectively.

Well, it seems like I implicitly upgraded your device in my brain.. what I
said is true for x elite..

Konrad

