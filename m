Return-Path: <linux-arm-msm+bounces-91647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDV0Cl7FgWnZJgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:52:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93257D7203
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23C0B3050904
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C16F39902F;
	Tue,  3 Feb 2026 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLaoq70M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ng2Lbdad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7C0396D00
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770112227; cv=none; b=m7ohXS8ogawZeiUFucWgdWHt+jJLPXavcgpNdgInamSr0HJGSqPAyrqcz6lIQVOQaf9M9nq3FCJHO+rDt+skrGQo1QDX92kP8PvDVC/bT0k70mmRWLOnXf1QeUHe33Oj/+FgUYU5+jWM5qv+7L40mz0KGAcNBFsDxAADhoqJe10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770112227; c=relaxed/simple;
	bh=Y4vDiByHQ8O7Jm+NDcj9YscuT2RegZyuZUdJ4gIfmtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LbQSCIgM6q2EWdmIMmVmTmk5Y6IsC6SJpOEhh6RGQALwxtPGvvTafOMCZEHYOe4SGMW0hfZYH0WNxJbb4Fcb37sbH9sfunyzCw5HkoTrdehoVD9qMTGqNFu/QMEXUZynPCNNYBxrVUje1IlaVq2YGf65OWPihDeV4KXTTZZmNy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLaoq70M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ng2Lbdad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136WHqF277353
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mi5bo05RB6v2dHGqgCtZm4yd7bhovE802npJty6f5bI=; b=lLaoq70MAh0zrGXy
	D/YDaNsoKdv5e6NU4vHNHGiIXobkBmc5WguJHvmrkdoQnE4yTKBsnkcrhiUX6Qyn
	rgJqPyKd7BZa9N63gFtA6KL4P3bZ/dfQp4dIfviof06+rLlU9sTig80Xn/cMv3nW
	I2KQj9LUAMwOupJraR6w6AvvJxENjb19zNDPZg2dUrPu+1lliICd69oymvXldCAu
	TAtfS3uRqArZCg6oC1E4c2RBp0lrSoAeqfMs+5JPIPcHlgiBDsw4Oma/OggQAvNT
	ztBWjbqWz7Z5P7+2cmeQ3xA+i3nLDj0ihxAiPgvbDwBK/TE0NfR/gURfCdX4Mt6g
	xBdrOg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c32s3a4tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:50:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-352c79abf36so4890781a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770112225; x=1770717025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mi5bo05RB6v2dHGqgCtZm4yd7bhovE802npJty6f5bI=;
        b=Ng2Lbdad39qmJk7/4Lk1T9F9ktBa6nspY08Ovptw+ZQ47BG/krkezVaxiaSH393U9D
         6HO3P0CrjPXwiMIXiSR89RqLXd54B/dlfp2koP7Z3UVcRm2dQzaZceI9Hd1HJp6HtERR
         tmdyvTQ72ddlFr4UC2sO7sbZPVoPw2GpsE+I4vzl8B72lUoCHN4ifGI1Du3miK/XxseO
         rX1XDLmSN6n4xg0caCfYTPIpWpTINKCZM4z+XgL+Qi0tbRBEgcqwBdUfe2TB9uqimGyQ
         JrMRvr025CetQcvVjUcmT/qDUBEjrXzumV7WI+4rNuzh14ZiK+ZXrzMw2y2TYYwL9ohP
         sNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770112225; x=1770717025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mi5bo05RB6v2dHGqgCtZm4yd7bhovE802npJty6f5bI=;
        b=QmE2U06RtZpZpmJTz31TsnGSl0jWdzEZa2btIgYao3XGKDENY3zbL/t9V1+YKPJkY/
         LKQn8yYcvJ+zthvRX1sTZNTn2sPz6KxYrujWsBWRHKi2kNvWIwAH1WC1i3Ljx8ryty4O
         wszo3aEfYFNRBLLd2pbKF7I9uNlao3mWV8N3qTBG4nE/WR2bvgoDCwCIrnuwsix/5i78
         mf1c/Jdx89w5SjTrDJ6pijv1tmfhuh71pjdp6451g2xzLyfEK2F2f8xJWfBfro9se9pt
         /bX8ZWGQRPM6SUxCqmMbarcm5aojTm1yS446WhYH7eLl0W/kgcwdeZCnJbGOPek77LD7
         DGjA==
X-Forwarded-Encrypted: i=1; AJvYcCW4hJFHvYZvjhIdxNtbdVl/mUPLzTxCQjKt65VfU/zK9qmrLQgemg/cvxooiG2USDW2j93RbxkCkAwdus56@vger.kernel.org
X-Gm-Message-State: AOJu0YwCaA9g9TtUwf92t1ycKofvkfgyZ1LmAztrtkLY2K6OtlK8+zR5
	vgXKYCZn4nYQhlOfmoR0vE8CkErP73phgY2U6Oin1dAO3bIROqwSHuHeGnQ4PIVUQ1UNj2I9iCH
	TjbHWopRCquEQx73TOhsOA0kqXaE15hGOavXO6Cb6xG4+bWzMLY4GNAaYwPiFWawOyvZg
X-Gm-Gg: AZuq6aIO9HgTiEXh38IYq+6ejLHUcxXXeJS9JLgZoGM1ts8o3FWlQFXe/sLrPRSUs0w
	Rsihc7P59o+npAbBBHWuUiErVMEL3//DN1SKfyCq6dE2TrN3WjL9u5XmhIRZNhbn4pOHjiHAfcJ
	5E7j3EeoTo5q79/XD8kC6vSsO6zDUEtEhebGtmv5cTU1nj3unQ0VFGX60YOPlm6ByRZrUvkKhzn
	ubehNh3B4N/xWsxh8f1j+QtaD43nJMH+dOt58rUPbVHrtZO1K/iKR4dmQ4tOY6rjop2POiVvDRO
	Q8rbztR0TII9DdLZANCYMVt9qGK0b/gLZt7VEow3B9Eo5aPzSNv4td9Zk1u+OpBFq212gyUBWLr
	VwlQt1YDhF5WLzipGmOQTbY7rfgyYdOx1H9i4mm8XpRhF7yFrG/SyB8n9m1aWhM5dnm8I+8e99g
	==
X-Received: by 2002:a17:90b:2ec8:b0:340:b572:3b7d with SMTP id 98e67ed59e1d1-3543b39824bmr12784260a91.19.1770112224635;
        Tue, 03 Feb 2026 01:50:24 -0800 (PST)
X-Received: by 2002:a17:90b:2ec8:b0:340:b572:3b7d with SMTP id 98e67ed59e1d1-3543b39824bmr12784240a91.19.1770112224139;
        Tue, 03 Feb 2026 01:50:24 -0800 (PST)
Received: from [10.133.33.97] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3547afcd119sm2013991a91.1.2026.02.03.01.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:50:23 -0800 (PST)
Message-ID: <c14ba722-5195-472b-a4d6-3b8f6421df7b@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 17:50:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v2-2-aacc7bd7eccb@oss.qualcomm.com>
 <c739da90-de92-4d84-bb5a-e653a9fbdcef@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <c739da90-de92-4d84-bb5a-e653a9fbdcef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zc4Q98VA c=1 sm=1 tr=0 ts=6981c4e1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6DexCDkPx0JeSCrEoRYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: CIlbXpVhxRIGcs7D0YcveVSM5dAF7NUf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NyBTYWx0ZWRfX01sER1zNh/eY
 lqOtuiTBUuL4kSxyTpOHF3PChx5hkMl1wDXp7TafLvdVtkx5GdnxcEvxVB2GVVJUL9EfuCpE/md
 eiLC39ngTjhs6OabZFq8vP7erV1KGYItjmz0pZJKIpnpyaeu9yfNoCSemgybcMSLsqfH5wdeo2E
 L7oAeyLMFByT0VBcZQQ6MzLKNOEB2iAAF2JKSwmBT1koTB72t7fWfbVy8t7kyk8OHqqIK0JdUS7
 z2UQks2lKvPU79JQHS5f6H3g8GdvLHMrm1cVj4BRsxjKvFCmZwfSAJ4t4Olat3BPCbXDqHGfbnT
 DuUJTyTPrvRoQsKrjzsFCndhkC5LSdwypfRgIaRonoQZxKHxyqz2JSBD1YL1HuaaFRC10isRUUr
 6WLNpklyzRfOLqai2PaWQqCSZVj+1cKw8FDND6DiMaVsA0nr0QuWxo8mmbN45ue86itcwjMvOla
 79wOtrkFM/PRKI66Wlg==
X-Proofpoint-GUID: CIlbXpVhxRIGcs7D0YcveVSM5dAF7NUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91647-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.152.154.104:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93257D7203
X-Rspamd-Action: no action



On 2/3/2026 5:44 PM, Konrad Dybcio wrote:
> On 2/3/26 10:32 AM, Jie Gan wrote:
>> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
>> tracing data from source device.
>>
>> The CTCU serves as the control unit for the ETR device, managing its
>> behavior to determine how trace data is collected.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
>>   1 file changed, 159 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index db65c392e618..88ec29446ba1 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -6771,6 +6771,35 @@ data-pins {
>>   			};
>>   		};
>>   
>> +		ctcu@10001000 {
>> +			compatible = "qcom,hamoa-ctcu", "qcom,sa8775p-ctcu";
> 
> Sorry for not pointing that out explicitly the previous time around,
> but 'hamoa' also falls under the "had numerical compatibles" category

I saw the dtsi is renamed to hamoa.dtsi but we still need to use 
qcom,x1e80100 for hamoa?

Thanks,
Jie

> (you'll see the only hits for "qcom,hamoa" are "qcom,hamoa-iot-evk"
> which is a board name)
> 
> Glymur and Kaanapali are, understandably, Glymur and Kaanapali
> respectively
> 
> Konrad


