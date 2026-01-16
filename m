Return-Path: <linux-arm-msm+bounces-89303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD431D2A835
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 04:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 934F4301501E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 03:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD72E3385BE;
	Fri, 16 Jan 2026 03:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="avWx5F/r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g9P2uEG6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AFF335547
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 03:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768532766; cv=none; b=QOMt8gGMEx99YlTwkzYDIfiHRfIkcvLqikb1YixfP4DI9mffw5h1PS/1Ji/lnIeUb4b0a012GIfzNknGbvh3HkBbsMTfOEwOmh0WhY4mRG5FNNfPnfZqr+WbYJYTG8i3xNoWTlf3r8hCp97+gq51iW8vzd56jWOn80gUgCfg/ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768532766; c=relaxed/simple;
	bh=73JfBunU9H4UHRxyB+H3lfEjbie2XZX9tkM9AXLNYaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uk3XxEE+HW7pOqjcqJ7bT4IN6vxb8svBus9zrQbTSF3BIQP9cqmxhk3dSYw/ACAg01TJSxXhPzBnEFdNKdsLpFfRLoZvOwG6zSbiym77JLbTqSfCOxlK5naGxxJHGMA6fqFbZLt4aVehYXd/esUAR45vbvGNJpSnoovE1O3MZH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=avWx5F/r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g9P2uEG6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbaFo3596349
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 03:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dlasHQajz7U0a0XT6wWHnc7RnLJ3ic3HzDEiIiLI+b0=; b=avWx5F/r1pKCzjYs
	KnkqP3/NRL+jJTc0fkRrHD7fEqb//JrC9j1urco91lDhA1sn1lHmpWMXhlNGYZAr
	REzveG7oFKP7IOZ6J0C7XHcls+PVkKlTgM45eTodRKEpYheKr/WU1in+2PGHcdLF
	vub1kM4BbdhgMrtXZHbBW13t3VCHZgFNktbT2xXVu3B7DmTmkXh3HGPcLmgt/dE6
	gCQmYfjEtMDJW0It5xoLPeE4BRue9K8ZuZafBoSfkjq1Rznq/qR2O6kyccEGQMfe
	zAkpsrSpumtKDIifx1A3WsrzGDgQh3SjRB1/IMNUUUCCRPWigufzlnDLYdhvobeF
	t35h2w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rrjxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 03:06:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c52ff723c86so918752a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 19:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768532764; x=1769137564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlasHQajz7U0a0XT6wWHnc7RnLJ3ic3HzDEiIiLI+b0=;
        b=g9P2uEG6fhFf1kt0Q/z91XcH6PwWlhvWqPEg+XzTaMLx43RwkjE+aJkYP176A0DS7e
         k+2pBaIcIYGKCP0VXu6t8Vg3+8gnVwmO5znhc8FbD7re6E2nSPku1210W4gjdO8od9jD
         efCE5329Lprp7Y63VnG5mTEZVB8jPMg8kUn+I2V5eoKa0WnNUGmsKByrxsghj7XqK4RH
         eHR1SxfIB5grErYbtZypOdHT6SLlyuKa57DfW5fWMOeo1rudh1gdBG/Zn9P1rQjSpy5S
         Ef5VcVOcOBJNVVU5Ygle06HTNOYTpwdlfy8CS7pTJGvLm0wJ7UdN8uY7F+f9P6Oq8Dkk
         7Pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768532764; x=1769137564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlasHQajz7U0a0XT6wWHnc7RnLJ3ic3HzDEiIiLI+b0=;
        b=LIDYJJVVMwqR+SbHrykyf2Bz1OGntvM7y2DTT1Lv7FSeL9sXruzwjZcO5kisc24967
         z0MvYzmeIpQvTIsZGimHVkoQobbOFfF783FfY+Dw+5T+W7cb7OlgCWI2FSzCpWIBXXzj
         +cgYx4YWCPerDUFd0TXE0hT1dUWbK6yCE2wdPkSbl5TDHFyCdSJHrIMgDUDO3VqYbHPV
         yJnLaXgEU7Lw4vgZtnws6xASkp48hpx+Z9OlsCVYRkRAZwC20OkqLmcmhSYZ/RYmO3Ta
         lJzQVCgyrS0ihac8lFXjY7fsu65yHJ3W6x3rNgSFoECOeiinJPsR8PqWovEPdIKprsYp
         i6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsEhZgoEHyyBCjIxfkRjTl1QSkkQA7HktYwbea3F5dYSt7PNv45T/Stm+TUz4qWk1M0m14to78uoBFmPOk@vger.kernel.org
X-Gm-Message-State: AOJu0YwLzdFgBG82tx+wGhMbxPOfOYZkVbv6k6GCt/5S6NSlBwgDEmYi
	k8vnaJeIpAk+QcF+Yt3AH62luouZqnHxyBRGNJQY0c/VeY47Dc8Wc5cLuAH91N2Bqn293WX/I7x
	xafpxSO/U3WVZwjC/9htMHwhcfh76RvCq3ft5AGz2pmVbSREvqBPYjHPO5pbTmn8Qh0IGOsmaQ1
	CtSdyu5Q==
X-Gm-Gg: AY/fxX4j5D8W1Y3uHEwEXIPeW+hIqePSvOs6uDLHF0/dFPJLfD2EjgAAeaag2eFfD5U
	DRNuLAbim5R4wiReM1IGCSzcpsrPVis3GrWowvNBTKQ6sWwH1piP+yR2mjl6x7J9+tUDGv2xQUt
	UEWfFl4PqLg94cCjH6qPcU0QBmmUOAFgPxolyY8/RO6c8EKX7VOJQqNTQYHwEvXGKJgijpFh4GY
	I/wUiSh4LzGJy12UJ828KDZ6cJc69+s1OreOPhRnK4hRwMORAbM/zB910+o5IvPa69aJ2l490hW
	3On0ktvIrpJ56A5YnAkugFab0v82O6mFdMYsRkO0uqTe599hxmlPylFu0vpbJhPYvgDNeRv34px
	2plZBSHWTalhDTm7RYA4NXDlszg2mFfQ1W4o5e4QAkR2pLVO2P76+xRml+tl0gfGnLZgRCT9OTx
	A2mKHk
X-Received: by 2002:a05:6a20:5499:b0:38b:e7a3:9d17 with SMTP id adf61e73a8af0-38e00cfc3f1mr1207323637.49.1768532763997;
        Thu, 15 Jan 2026 19:06:03 -0800 (PST)
X-Received: by 2002:a05:6a20:5499:b0:38b:e7a3:9d17 with SMTP id adf61e73a8af0-38e00cfc3f1mr1207287637.49.1768532763536;
        Thu, 15 Jan 2026 19:06:03 -0800 (PST)
Received: from [10.133.33.232] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf355ca7sm650676a12.27.2026.01.15.19.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 19:06:03 -0800 (PST)
Message-ID: <8b33d6cf-2dab-4f71-9563-c613e598681a@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 11:05:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: kaanapali-mtp: Add audio
 support (WSA8845, WCD9395, DMIC)
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-8-a6cc9e45de93@oss.qualcomm.com>
 <v5rprswnwedm2y7rjr3y2zfvhdh5qztvm4nnaeti2n6yqyj5yh@7wbyro7orb3q>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <v5rprswnwedm2y7rjr3y2zfvhdh5qztvm4nnaeti2n6yqyj5yh@7wbyro7orb3q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAyNCBTYWx0ZWRfX2ITo+JMQGcaD
 5r4GQyXrVXdloz8SXLaogUcQjc+6EPuDik5te2r7DQMvuF0ZascX06lzuFlne7iLVVTaKAJTacw
 oyHNL9eDgDKF7LyhvvZvBNCnMZryh9686nD/3P0Mtu84/+bg8of7ifVW/lb3o/yVJTUDu1WAtxf
 4ajskxnueqgRkeXKE6X2VKbfQp6fiIs2jm2D/BJ1YZ9gGFvxoIvY2bu61atR3+8X/CHpFliAfFn
 BJPG/RVELQjZLOr60BxEykRRSODCXpsMfhrioVtQWA+LPviSiy2iwSC85F0/oTDqJrtPkzE8bmj
 +ITkw0Gco2cme1LLtXo8IrAcpHA/hroDZ1U4oh0jIMMOJEaP2jnqkq2I8SvN9ilCHiU1p1fMUgs
 yl0gpA9SZEIw6KE+0BwhSriL4BLmm5+ynU6fl9Pmn6OK0cSFslqTUpJxqJhZ0AKeS5SgM3Yg04P
 7M3zDapF1x/NNPSjZdw==
X-Proofpoint-ORIG-GUID: CxE_2plgAuMjh1Ier0-BTEu8reIBjaF7
X-Proofpoint-GUID: CxE_2plgAuMjh1Ier0-BTEu8reIBjaF7
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6969ab1c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nagTmyFeFluCUTjUvcIA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160024



On 1/15/2026 3:15 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 14, 2026 at 10:49:10PM -0800, Jingyi Wang wrote:
>> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>
>> Add support for audio on the Kaanapali MTP platform by introducing device
>> tree nodes for WSA8845 smart speaker amplifier for playback, DMIC
>> microphone for capture, and sound card routing. The WCD9395 codec is add
>> to supply MIC-BIAS, for enabling onboard microphone capture.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 226 +++++++++++++++++++++++++++++
>>  1 file changed, 226 insertions(+)
>> @@ -684,6 +793,14 @@ &pcie_port0 {
>>  	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
>>  };
>>  
>> +&lpass_vamacro {
> 
> It is a strange alphabet, where 'p' comes before 'l'.
> 

will fix 

Thanks,
Jingyi

>> +	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
>> +	pinctrl-names = "default";
>> +
>> +	vdd-micb-supply = <&vreg_l10b_1p8>;
>> +	qcom,dmic-sample-rate = <4800000>;
>> +};
>> +
>>  &remoteproc_adsp {
>>  	firmware-name = "qcom/kaanapali/adsp.mbn",
>>  			"qcom/kaanapali/adsp_dtb.mbn";
> 


