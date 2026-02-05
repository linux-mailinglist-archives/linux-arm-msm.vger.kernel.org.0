Return-Path: <linux-arm-msm+bounces-91869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHdqA6JbhGl92gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:58:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 752B8F0292
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4933301F9BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 08:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4C72BE053;
	Thu,  5 Feb 2026 08:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ki0Yfm2j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="al0HOZAW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E933835CBA4
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 08:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281607; cv=none; b=V7iTHCCI7+7F0P0P/jjXeTdDn6sc9iBWWay8JvRavqyicfIeXux5KSKsK4/9wDa+WYZUeDxvvRW6QrwtesZ0SbI+Vhn3F7bKEtk8/ugvmCksVAg5IoLHljCnnsVHxd8yjxXeua9sacLoZCG5F2f4Jv3/CSMsLaIlM8/VFjeegV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281607; c=relaxed/simple;
	bh=jeRxW6NvArbsNamVoyEoTUZu2w80losl5bhdi2hXAM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JT1x7K4WnzP0TIaDASKZVNJvbluvg3Kav4yoOQCjVL2nZgtI910nh5/SL/OJCRSzOO8RhxiWPtVzlHWLO3XwaAmdReGszteQT4szv1Mk8dyPhMyIV4EaO8fGffTrQ/gHAIX0Hd4jzCOnbzfQLZPsHFcP0CgxsdFPHbxQE010rpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ki0Yfm2j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=al0HOZAW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153e2mm2104147
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 08:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPSSGnCIlHvKiwP/3XZmhF9BeEla2vdg3S2YBYcvhTE=; b=ki0Yfm2jmU9Z+59U
	mkc6Jqrb9mTZI+dczY+MENE1MYRBlATcXVndj65uAkkG/Sxyr5TRgpigHWXLjXgK
	PhsmLA5agdBnXBzG+VvZ4FyLLVTiX5x/We45YqbvR4ksCkLzEV/MFsR6lm/keCWH
	OOBO+whoyR1bvcugOD+k/i3Uq/+RMOKtE+h9R6Dk7qwEb96P7Z6sunF4IQpgHD+X
	ifiGnsUv5jKst5LGjg/1Mc46Nd/hQTcygJdjKSkdBRnaHEwrBu1396XO6EHBqVTt
	xp1Ol5a6GY/o54p/EupbXr6Ysdsrq1As8ZWnxpponUiH5kxiAAFR8KKB7sZA7WTw
	bMs4ZA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44xjkmwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:53:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8946ebb51a0so2801946d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 00:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770281605; x=1770886405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPSSGnCIlHvKiwP/3XZmhF9BeEla2vdg3S2YBYcvhTE=;
        b=al0HOZAWOEb2HwqeA39MXdkPKEwua/B0hfuxVQMObhJlzYgAwKJ5ECPYTgoaQzIFYA
         ujFHgf4kq77G9uyZQmTBtLT7a+nZAUDv37pARPoNO7S7gjmHrLtA5EvH/602xb/gNCRx
         OIAlRldFji50ui2EIq7yXVhce7UZU89F26iGGuJulA1Lv+LhfZM/Zqu0NmNN97Ha7Un6
         Gg37K0cICXe+lao3/wDJogdhRCsmiLM2qbci22Cy/nFlBYcR1+PY/7fM2c3lU42a2u36
         e6dbUPcD11kMR6xoNVvyyrpvk46QmMN1+e0lIpfUC44EnVYAnfVulhbKd/Cb4hDSK1Ir
         M/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281605; x=1770886405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPSSGnCIlHvKiwP/3XZmhF9BeEla2vdg3S2YBYcvhTE=;
        b=VzxaPbUIw2Ml0/aJh0aVpzLGPZYSAzW05LCQyrbUWlBork9dUEnuncjA3T2aeRi7nd
         WDvQbBDdjn2SWXhDgw3Jk8bd7FR3E8z6yLYW4kCs9S1lqGrqG+SH2sbzzyUc86eiU2Se
         wfe6fUVo/bWZLTK8coSE/vOx1cDXL3H6iuHh611m5L6lPmDj9k3RFEsdv7+47jbuHm38
         6AbRCKo6TpLNDFwGexpS3RfdWopNgm6oAnpm99nj2XW2bX7Txed5BMQZwZTKaI1QxmBV
         xPGDKXFIzI/3IoW8I8QQaRM2c/nMVwdGMJuqpmB3xQhhc2iX8L1nkjFLoSCPhLz9nUZW
         sgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkel02hcr4a3u0rJQnXM77fE2CwxjvMhPaw/WyZVOEo9Bj77F74mXaFpMuGRKMrimisjDUCS6UccEQ2wrW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2wEsKpMMIPJeVcMmL4IwA63lo/Zfm0ZQqEvvZgtOR6oh80o4t
	IVSLD3rtJciABtfP6ll6fGy5kdD6L0bHQZauz+QkPyIT/5r8rnDBELFufbWDIjOr1kNhm6pGqjT
	qNaHe0r8/KWcDiNTYfDM/zSu/YSznowIT6GRExtBZ91pKaso7dicnKHSNbcKAeQyn0j7J
X-Gm-Gg: AZuq6aKVvTrtb6wniNJRujcqKtA6z9O3ga3HznqCZmivRrVz7bCG/CuDzXLXsFUsKhz
	rOTJ+ismxSOSxfx07lib81AQzxXsyfZMRa1j3HupboOxFVlNvf0A4fv3I4xuBc+aVgRKmGdT2Yp
	oNUh+5fRptnPPmYO2ExpGt8YXYT447+jOHkU+eqFCgJ4obe3uvUILxXs1MqN/OTAHqqDTBJD7cn
	8Cx2U2bcszuqe1+CpotP+f33RSim80fs/Z30NXnfC9POf1YExTGlQLjZ9q1NpUliVbEwY8l/Ca3
	gSMcIYe9wNlEJrpFjA75JDlY2uJKbmU7gk2HKNczEY1PFOFw5/++aExX53+aE+ITT7YQ2Y+R8s2
	weBHDf2UzeepXkjaYUCf4MRgE0RMK4LAWyNSC/EkDui8rNyyoV6krAznZ5dCjvwEqi/Y=
X-Received: by 2002:a05:6214:4e90:b0:894:9d32:6160 with SMTP id 6a1803df08f44-895245ac304mr43939676d6.0.1770281605179;
        Thu, 05 Feb 2026 00:53:25 -0800 (PST)
X-Received: by 2002:a05:6214:4e90:b0:894:9d32:6160 with SMTP id 6a1803df08f44-895245ac304mr43939506d6.0.1770281604769;
        Thu, 05 Feb 2026 00:53:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65949fd80a7sm1876774a12.14.2026.02.05.00.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 00:53:24 -0800 (PST)
Message-ID: <aa0e8a75-969a-423c-a94f-fd8098fbeb48@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 09:53:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: add
 QCS8300 LPASS LPI
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, srini@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260204174237.2906-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260204174237.2906-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtpbOW/+ c=1 sm=1 tr=0 ts=69845a85 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=oKlzPlN8YpF2C1mTYpIA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: QiX69JhbDUszKP3gpjy_woHRpDhAE7eh
X-Proofpoint-ORIG-GUID: QiX69JhbDUszKP3gpjy_woHRpDhAE7eh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2MyBTYWx0ZWRfXzshy7Q8dvoh+
 gsoVFhtWv6JUlTIpMcds+oJa0mgLrirRS/Dqwq47cH27Vfppge22+12m2fbop7cRIreGHpeOJTx
 vNmJcnbSItwTV+Skl1VDvzAfunJpOYTZjfbvia7Dm/DBMfT6btMVynmhfGGiol6kv8I4TYk4Zgv
 e2X27wpYmCXrSgAZ3UIhp/nio44Ca7sqQlwlB3bvIkDdU5YkNkXhhxNjCNLQXh1B24ev5P33QKW
 BTb61HTW1TlyuYvYniV9ARzKYWOOiUFein7MUj36mhmGeL866r8UOxHZij9y+FN0KWcXUsixxRb
 Nui+7jrEehFo/30CVcE6muNYPAa6xBGbhYcRc1yNkgQPlK+p1bDYBE9LwRZyGdFMT1NlRG8q0QN
 9VE157mlhbLbfKBFfP5wsT6l9AzLmJBw3TwOuI/YSw++kYZOM9X1hYFRo1saH3wz+LaK3cCPYIF
 N00oKijt9Q+Xl8lYJiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91869-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 752B8F0292
X-Rspamd-Action: no action

On 2/4/26 6:42 PM, Srinivas Kandagatla wrote:
> Document the Qualcomm QCS8300 SoC Low Power Audio SubSystem Low Power
> Island (LPASS LPI) pin controller, compatible with earlier SM8450 model.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml     | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
> index e7565592da86..c81038320c35 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
> @@ -15,7 +15,11 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,sm8450-lpass-lpi-pinctrl
> +    oneOf:
> +      - const: qcom,sm8450-lpass-lpi-pinctrl
> +      - items:
> +          - const: qcom,qcs8300-lpass-lpi-pinctrl
> +          - const: qcom,sm8450-lpass-lpi-pinctrl

This patch conflicts with 

https://lore.kernel.org/linux-arm-msm/20260127105511.3917491-1-mohammad.rafi.shaik@oss.qualcomm.com/

Could you please consolidate the efforts?

Konrad

