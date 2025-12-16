Return-Path: <linux-arm-msm+bounces-85296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9998CCC1075
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 06:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A136E3025313
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 05:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCEB32D435;
	Tue, 16 Dec 2025 05:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpWvMmw6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDluTBjC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E802E719B
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 05:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765864140; cv=none; b=d4f43p2HauzrtiH5UTZX8AvbgTtPTgPTxteLOF6rfwq224P8mah+2YxPPpptPeVo7PPbK7rFxbosumzo9a0QT9uboRuk5OrO8RjCedp1wmqNozLofKJUZOYRTtcNN7uUoLzCJOaQ9KDCptIxBc3+zd5C2Ng2HN9RmjYavxM5t/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765864140; c=relaxed/simple;
	bh=FcmUXUqwY50Hy2iJ/OWPVRZpes9f4U+aKevdmpp3QWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFKGxKiX2LVeZYFL0P8mzDXGhNgqp/tpl/9gPAqzbsyAwmZzeu3AehrirXK310//2fVm+14t0naDKO0Rp3Q03kwsUti2tqcR+QPxlkjHW/GJeEnU3tzyq4FVhHoPnHXfRv5xT7nsGAnUIwC+oT8XrvKItlEy3OuAULI+Jqu0R34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpWvMmw6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDluTBjC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG5MC5B175749
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 05:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+dgRg7+lylSThVvRyr3vmwzyI3Yjx1mKAez1lMkqZik=; b=gpWvMmw61flFTDYa
	sb8MCq4/B0ybI3XYRFxrtIHAO3RT7bRx/onz9RfrJSKVYP681xqHIjO70bN1Q6Zi
	bL+0qlPEfMjJJLxitGgevE+3Owu3oFllVfbfiq3k86OLUDF2v6NTSGaMC/yNqbbw
	N2N/XNPBx1ywZaLfRE77IymWERiiYdKx1afLYZG3fAdlVxk4Xjg8KqcjpucKIkPo
	YpGXcV2XNSVSB1jZDAs3IDlny/tlgA6SC/yYG+biSnnPD5H9MsctdtVIUmQC73WL
	/GI2+EiAP0Bvw0+txLTekb54IXfKfuL+GSkMGBxurQKAIVSupEzLGTd9VDuM/I2q
	MXxH3Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2kmm3127-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 05:48:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eff973c491so96636521cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 21:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765864128; x=1766468928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+dgRg7+lylSThVvRyr3vmwzyI3Yjx1mKAez1lMkqZik=;
        b=ZDluTBjClebgPou3aW27N+f+ew4rZ2ed/nSylLbWIjIFL1+2wTk7XdJkzZewZRGh9f
         eEVG52bSRvqvkBp/wWhI9RA3NKj6ye6fgQXPM2LNcbQTrT7m+CCXUPL7HOQBOi2psvgS
         2DMrt2NQ6bSmde4PwvxwTpCWSTE+T4h0II6VXcA0xOibI9TcjF/00DzEYvhfviG9G8X/
         fB2bIRIwTmB0tsWP4dsDcHCcTDnECnwFjRUTKtLI4x1wOMzmpQeGrI2T+RFck9bzHKfU
         ix2uNxJFlkmx1XlsF30o5/ZPVpV8xMxXuvn1JoSAZvjliYt5XHA64GuNSEjDaEcudm5y
         wDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765864128; x=1766468928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dgRg7+lylSThVvRyr3vmwzyI3Yjx1mKAez1lMkqZik=;
        b=MJJ8hSoDwy5ciSlQ5aWuHch4gcWQCSQg430q5ra3jhF3UfXzOG9v0K2m52L553oc+B
         RJVxGZXk9oPPfZnsMRnWpT+lHKCpnDlKYvtf1XumQ17iqPvmz06nMcImYqgIVdSwGgXh
         6tzlBC9H1XsGBxKdg4ZnZcGfN7pg0R9nx+bsmKRYhe2O6ERpnOQjBSYtZg0fGKGIv46F
         ch0DhE3MBzCsTG6/An7A4eHr0luv/Pcd1PAc+MkIR2EkrLzMx6zazEZVaxb6BsMiO2Y/
         SJfQT9VPrDO5ObamrLzY+5u77P0H7/1FjUsgGV6pzfN965QGBjUMR44jxrbsicQWNsA8
         M4Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVw3ds31DyeHzfBSNtVYJtMZ/IbolU6TTrdDal/ecAstJdz5JnROpTSfqhySx5TB58/jkX1kHZtCzb9b9aO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1HuScG1vynKr3oF7J0NK6eMSRZRdAGFR7nCfU4XqhWdhkDfjE
	lWBWL8dLaIe6iIh586C/pRPUijyOF8ti9+lspGNHiwEi+unjnuAW2tt8ZjjmhlX6BSF31pLpj8z
	QHh09KLFEvD0x2H0fmadg6cD0qR2e3qo6n2gYDwgy0dIbe6lgDWjuEYRPFKMBmOWygI2ksdJzpY
	xc
X-Gm-Gg: AY/fxX6+3q022CmSEo0IWj1tZcm6wWsrNiG6v6odUjrKENLMBywQU7Oi2yZ48QryEhL
	6duK3jX+N0ozICYnWfCIKcpWvU+e5+6bRH3w/gF4oCaVrWGylSN6TTsbi1UTbeuBbvUQadcgYsy
	KiEYCaxiffqyTq8R1OJEAqdT9+VXSEg4giLUIjmidJkG25RUM34iJVCeJQSffRTo6luGu8WKd8S
	HMZpoupZ0W0mJ/nmrrscjiYjm33628M24OchGVz25EZynY2a2g6LsMjgVmuRSdfaWmz98S3cujj
	pjcxdkI+E/5eJj6GrrCWn7TbMOghw1ZsDfxeu5HIuo1d69zy8lJf1MTL4aANCqGDF97TZBeGK4+
	i1iAIDhSF5RQTVyMQFa8iJm7rCe9D9e3zdhu5
X-Received: by 2002:ac8:7f4c:0:b0:4f0:2305:89d6 with SMTP id d75a77b69052e-4f1d06255afmr202809081cf.80.1765864127889;
        Mon, 15 Dec 2025 21:48:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXxmE5ATyDKU7eIG5Eip4bJ3Gifs/dx1Uk+JAzgABa3IqwDFWQAJMkWoNdLgnqHrkhrBqSZA==
X-Received: by 2002:ac8:7f4c:0:b0:4f0:2305:89d6 with SMTP id d75a77b69052e-4f1d06255afmr202808911cf.80.1765864127464;
        Mon, 15 Dec 2025 21:48:47 -0800 (PST)
Received: from [192.168.68.107] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-430fa7d19fasm13360092f8f.30.2025.12.15.21.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 21:48:47 -0800 (PST)
Message-ID: <fb7ea0ab-d75a-4716-93dc-08545fdb1677@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 05:48:46 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next] (new?) audio issues on Qualcomm sm8550
To: Alexey Klimov <alexey.klimov@linaro.org>, srini@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org
References: <DEVENUXSAUMM.1DMQ7M0ASXSDV@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DEVENUXSAUMM.1DMQ7M0ASXSDV@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA0NSBTYWx0ZWRfX9ejwSdAkbUin
 fHo9rbGXDfXI7rKg8gBBdE6TYjBp3HbZjqFgF0IM5TTrcvQc9go5v0J+IaMS0K3KBM0jYRWiGDx
 O6pR2M5/Srw8Ar9+cE2dsXv9FJ6O9TpmtETrpttr8oHpF0d+2+dXZfME8p49H+xUlvEZQM9Yfjm
 0pi4Z4GsfceMga4oSWk67C3GXcME/zQsUoUleZ8d0vaOHjqoxpNU6AVYTpywmgxjLe+ShFjyG0d
 +YKoTfVgA6WW4stjIDXqGU0Ep8ksDASrxVwXLpl5R21GL+3RY+fKqFp+aiK6eDvUQPFHJwf86yx
 MNw9ryG3KuFOEVGrKnCCJGIAesf+5pCpzJBGBqfVEzcvIIKGk0mCuZAXJpSa645C2x+IJYLcKWF
 +C84k2vgUFjqjtxcRfi2LYXvoWgC5A==
X-Proofpoint-GUID: eXNS6Jv_hyqvv1Fhb3_fEUcIbpjOVpRE
X-Proofpoint-ORIG-GUID: eXNS6Jv_hyqvv1Fhb3_fEUcIbpjOVpRE
X-Authority-Analysis: v=2.4 cv=EcTFgfmC c=1 sm=1 tr=0 ts=6940f2c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OLL_FvSJAAAA:8 a=p4JCkcoLdCBRvWdrFTIA:9
 a=QEXdDO2ut3YA:10 a=E0o1KwfEpQ8A:10 a=ET_4v3hgxWgA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=oIrB72frpwYPwTMnlWqB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160045

Thanks Alexey for reporting this

On 12/11/25 1:01 PM, Alexey Klimov wrote:
> Hi all,
> 
> I am reporting new errors here because I soon lose access to some devices.
> Please let me know what is the proper way to report this if this is not the right
> thing to do.
> 
> I've started to see new errors on sm8550-qrd for a while now with recent linux-nexts:
> (also reproduced with today's next-20251211)
> 
>  qcom-soundwire 6d30000.soundwire: dout-ports (0) mismatch with controller (1)
I think we discussed this briefly in this thread
https://www.spinics.net/lists/devicetree/msg837844.html

This is very much the expected behavior. There is a bug in the dt entry
of 6d30000.soundwire controller, which missed dout port in frame shaping
data.



>  wcd938x_codec audio-codec: bound sdw:2:0:0217:010d:00:4 (ops wcd_sdw_component_ops [snd_soc_wcd_common])
>  wcd938x_codec audio-codec: bound sdw:3:0:0217:010d:00:3 (ops wcd_sdw_component_ops [snd_soc_wcd_common])
>  wsa_macro 6b00000.codec: using zero-initialized flat cache, this may cause unexpected behavior
>  snd-sc8280xp sound: ASoC: Parent card not yet available, widget card binding deferred
>  va_macro 6d44000.codec: supply vdd-micb not found, using dummy regulator
>  wcd938x_codec audio-codec: Impedance detect ramp error, c1=0, x1=0x0
>  wcd938x_codec audio-codec: Impedance detect ramp error, c1=0, x1=0x0
>  wcd938x_codec audio-codec: Impedance detect ramp error, c1=0, x1=0x0
> 
> I also think that changing volume via 'WSA_RX{0,1} Digital Volume' no longer works. It used to work before.
> Impedance ramp error seems to occur occasionaly, I don't think this one is critical.

this is interesting, I can try to reproduce that.

--srini>
> Best regards,
> Alexey
> 


