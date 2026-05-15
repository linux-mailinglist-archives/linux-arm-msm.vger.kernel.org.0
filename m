Return-Path: <linux-arm-msm+bounces-107735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAPaOfDZBmrsoQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:31:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1699154B547
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 836CF30207C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 08:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D59137BE8E;
	Fri, 15 May 2026 08:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U78OPecd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PojPeHyi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F903FCB09
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833788; cv=none; b=rwjp/6OSDxOIjPC3ZyPxSai1zgUqp63jBu/V9uG3q11rwJJ7CImqASpfqa2tIgb2d7O0M6yDmyAtdXSDRnldB8nV5+5jB8huTrG7v7g7+faDKXU/kkXgyzT9cE46mYM71/U33za0Q7I7X4vE8xfvITAiulO87+MFVMa6T1YSdX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833788; c=relaxed/simple;
	bh=x7CFAFj5m9ZA6ar4UuYjjngctLltesIcNx9zgE6N7Zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muJB+hx0FCosKPn4U9CoRED651fpu317vSHfDYwq/7wU+ufawBhDLadTZTPcWkBNsPQCORH9rC9XPTDZlaD3i9PM/ypc5/e/JobHTzZqH/leg19UjRLRKsBNDmDloonb+rwDxcEYZKdWh9Piy1hb34K5nhPUmcpyMy96j/yy8xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U78OPecd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PojPeHyi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F59IeL3797495
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UllOcT04Arph9Lb63WObBizd6O2TUa0jc9E2byhLXl4=; b=U78OPecdnUfCWohB
	YQsmtqT0T2tkg8OR8wfWdAdSEZq3xPHwMfbSnHGBgnglliTFLfpFj0vsgDPFbTcx
	m4AtF4pLinB53TeA4SJtZgf1N0Vpiz5Z3hJ4YxbWrIJNaDxOLKbodlakIyHyWPoJ
	JsuJ/gSbsyIkqCWU59I3FBjHe3r61+/pNusiKQ+DP8NTiJ2Ex8Vvbhz8r8RvJ+he
	EjLP5YqRRh41J3rDq6yqp7z/jCWYzhukQV3UwSI1I0P/iLapTdniNs3FcZyc4Kop
	IwAcwqfPkO2zXRfZK25LFc8v5fKPmZ7FZWzp0uYsCcqr/JntzL/VLaJye47bT7Oj
	eeJ2tQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stc4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:29:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51494d74d4bso19342491cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 01:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778833785; x=1779438585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UllOcT04Arph9Lb63WObBizd6O2TUa0jc9E2byhLXl4=;
        b=PojPeHyiBay2OIBMKWvcMmxVCFUPglGzC63qJtEO9s2S977C/hUPZzWWyFw6mvKPiM
         h6BQR81R5clS5q6umwxja0VXEDiG6h0fYDvq/tOzonUkcf0uJY8gCo+SJO2J8oZyRK9W
         0qMG/ZFBv01dlE9X5ljYHSwbowIbCsx8AwMpZjlPzarSaUPwXsOrYZnxDHYMNQe37G1W
         XTDspmwxgcmVfeHsIQqognbI1wzRBq1b1CtITpXcigBR070tLf47wVHXOYLY2h0MIk/y
         crPxwcEhjdo0kgKIfjtgYjXvFjcnTu2JkZd6+eHe4WWJxk93PC4+MweB4AmbhZTLps+C
         WviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778833785; x=1779438585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UllOcT04Arph9Lb63WObBizd6O2TUa0jc9E2byhLXl4=;
        b=ZV55t3+HM5fLevVNEFtD42adlsc6mV7V10JHXJ0zVhma5vIrzSdo+Wb2CZ0WqWbnPG
         rKahSZDNabkcS/7+kfGc0dIl4qiHbuBn7XkBiTKLiqpIKu00um1942EV2OczCIghHl6x
         u2puj+AO8WkcYPzT4zlLutjyiJwlvtvxT95DyJm5Sfw07U1KProxjtTUxfZ0DQO/eFl2
         v3dSpNqeUCzykxVA3UnTzUllgrIX71vbeW9Ni7j+p6zX6wf4ixu+R7uOXPlLYOqCc9vQ
         AgEerRbdyJdBwBR/ZQq5ZXFyKBEbcp96TYc6Bjkv+kgEpLuceQ5yOWSnCRUaZ8fWjfVU
         rK+w==
X-Gm-Message-State: AOJu0YzuBtALfVmEFwsUeyLMc0MaqJo10/r8fZM5AySZ2ekhWet5jX/B
	EVjdU4t1+h8MC7h5J2muSKzuXg+EGk8w4Zefkm786K0VU/a+Dne9eedOZmNKXB+2UrDz1IHhSlZ
	Ui48gFMbtGwJVhKxMsQTX5uQ+/dbMA6J/XFuwj/cs1Lqt8qxBFDVnOyWoSGFtqVZkRuwp
X-Gm-Gg: Acq92OGJaOq7Gi1DdQjaITbNnpmZ1l8byxiMCijnHr595Se2DvFQ+gqAfqYni0GLhWl
	gID78YbenLenqRwJnGpY93Oze7y3iCxwwH4PV4z7op0+oyWSlTcdV12A4VZPZK5ru6Blp7IZCyc
	bJCHVtU1vHbfLlR3QhdpIgWDk1xSCy+v18tvO4zqzMoujbFw/D0AZzecUTgw3JP309XNvvdvQcz
	RfAIgCfk3S8QypJ4rNbF7EEclwgvW9bdBsE9zPzl+/GzTtWcbWd+mPXtKxpTdKwcIK9Z/MwE20g
	xgsIHWfuXEQ4baKjm/PsIWT3AxX22ZlWhr/OA1Vf6oa8BhB/+uV7OpRh0Bs4zLAEQ8s9/Q7QXv8
	W3bFHfE/MRXnv1SLA4mD2tE7sTk0iPRxMBQj69T+mCULJcO+rWZx/zPcDHew=
X-Received: by 2002:a05:622a:a6d2:b0:50d:9f3e:e1a with SMTP id d75a77b69052e-5164155af1emr72149081cf.9.1778833785315;
        Fri, 15 May 2026 01:29:45 -0700 (PDT)
X-Received: by 2002:a05:622a:a6d2:b0:50d:9f3e:e1a with SMTP id d75a77b69052e-5164155af1emr72148901cf.9.1778833784838;
        Fri, 15 May 2026 01:29:44 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab671sm43751045e9.1.2026.05.15.01.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:29:44 -0700 (PDT)
Message-ID: <db2942d7-720e-46de-a614-d9469a72d69a@oss.qualcomm.com>
Date: Fri, 15 May 2026 08:29:43 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: agatti: add LPASS devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223133950.221234-4-srinivas.kandagatla@oss.qualcomm.com>
 <07cb095b-7765-4810-a8e3-db2bd9ba6276@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <07cb095b-7765-4810-a8e3-db2bd9ba6276@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA4NCBTYWx0ZWRfX6aOrkBwO7d0x
 TS9B//CFnhJ8sGpuYnpQGGsuY7DS/MqaW4dKkfoGLsZrt3UG8wQ2nSv5eb2H/8iUKDzQ3OjMOZb
 1cgn+alFK2uYVqVnvsx94ShOXgS3/Mjo3pSVVK4eTg0A2YwgZiJ76wPAcUJpjmNRsT7jpHERvXN
 a1GbPJLtGLsyX8slMzWfXAJi4S3G2sHIPXx0Wx1SaNVgIdD4cX647jhcy2nUWmN8YA83nnp6+o7
 lukkjbvX0qrueO0AP3b/rJG5Aw7Dc7LARoMWqYRu9wNgYuI58Ypd5tdjzOKiu1eXysqoI2t+Q+O
 IA+cwE2ZytrDM69yRHhm9h38pyyP5XKs7JZgXX+te7sUrYk8nKVw0FSgbcZmn2vVjQUosD4/u9y
 tsfCAvqW9/QcBzdijT84IU4PgDZj4zA1Uhg4ShBvU9CS8PuYLr4bOLbOR+eV2a/ck98EKpz0xLO
 0vcqiuAbP7FgUjgFzpA==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06d979 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=APSRQGo-bA5DRRouejwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YXS-a7JacLX9cfah518_4ppeklCD64uF
X-Proofpoint-ORIG-GUID: YXS-a7JacLX9cfah518_4ppeklCD64uF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150084
X-Rspamd-Queue-Id: 1699154B547
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107735-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/24/26 12:28 PM, Konrad Dybcio wrote:
> On 2/23/26 2:39 PM, Srinivas Kandagatla wrote:
>> From: Alexey Klimov <alexey.klimov@linaro.org>
>>
>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
>> controllers are required to support audio playback and
>> audio capture on sm6115 and its derivatives.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		lpass_audiocc: clock-controller@a6a9000 {
>> +			compatible = "qcom,sm6115-lpassaudiocc";
>> +			reg = <0x0 0x0a6a9000 0x0 0x1000>;
>> +			#reset-cells = <1>;
>> +		};
> 
> This should be called "qcom,sm6115-lpass-audio-csr" and should probably
> have a syscon fallback as there's a lot of various magic tunables in
> there, in addition to the CGCR bits. The clock driver can continue to
> bind to this new compatible, like we do with the SoC-side TCSR on e.g.
> 8550 and the tcsrcc-sm8550 driver.
Are you expecting this to be a reset-controller interface or just syscon
so that drivers can poke into this register space.

The reason to take the full address space here and represent the HW
control bits as reset controller is that we have room for adding these
various magic tunables with some standard interface when required in
this driver.

I could have done the way as you suggested with syscon and let the
drivers poke the whatever values it want, but that is not scalable and
clutters the interfaces and encourage to use the way it was done in
downstream.



This is same for all the Qualcomm SoCs, why sm6115 has to do this change
alone? And its going to break the Device tree abi.

Sorry but I can not do the changes that you suggested here.

I would suggest that we use the existing mechanism which is more future
proof.


Please suggest otherwise, I would like to move on with enabling audio on
UNO Q platform.


--srini

> 
> [...]
> 
>> +		lpasscc: clock-controller@a7ec000 {
>> +			compatible = "qcom,sm6115-lpasscc";
>> +			reg = <0x0 0x0a7e0000 0x0 0x12000>;
>> +			#reset-cells = <1>;
>> +		};
> 
> All the same, except "qcom,sm6115-lpass-tcsr"
> 
> I'm once again sorry for not getting this right n years ago, but I did not
> have the sufficient documentation back then


> 
> Konrad


