Return-Path: <linux-arm-msm+bounces-101296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mECwITnxzGknYAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:19:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2F1378612
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEA11300463E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653DA3E556E;
	Wed,  1 Apr 2026 10:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PS4rqm3P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EjxLJli8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C61F35C1B7
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 10:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038773; cv=none; b=WqUG02aTaQN1ATsX1zjmrgcI/SvHM6IOo/U1A80HyMsggMbVxdlnj+MWIZjMWhRqZMtsxDh6ywS7iTAcd8iy4en5bh98TWlKUx16HiHQF2hYnKy1Z0253Lrpf5TvdgPnWlLteaXP7iY66ABUgzI0009ZVuKJyLiuY335EzhgOCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038773; c=relaxed/simple;
	bh=Njs9tyb3D8m4OZGmINAbbtRppnbGqiI7vwhKUfDMq0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OLcJEIIvb1O0b7YQpwIlB2nnDyE5QVr7ag9V1XIDLsYVpL2PBniP42ltsV3gxd0sej5peC0NaZeaQZgOIXPcSdTFUCp6fYitkG0+/6ESJXgfvuJyyjSTyuHQfGpwaJRnGgy3RW6bvGua7VPfrchvzCxhfid2ecVFCz7SwtjcGnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PS4rqm3P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EjxLJli8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314MdG53363191
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 10:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	icigY/o4erm1hQ6wPL4lotqSd1rhrSmpE3CjS8+amCc=; b=PS4rqm3PjWOKLUxC
	fZmZSUMfFQbAXkocGS4eg3LQmoZUuKRadt4L2LHY2ulxThZbr206u3pO9CW3UceI
	UqxuOqvR+PJFdbi+KZv5/EAiCXBXxZXZupFmQMuLK39B1ekkfHVpsE9vxzptH+Kr
	mRIHuGhY4/qc84EWpt65VFnnPwEzHmGQ8bkE7pFQFOmErjbLwg26rrByfwO4uulw
	bv5JeqhlwDj1TXq6Nl0j1mbzEGn0K8qDmhpd8teX08ypCtTRpEAAe/r11HsqeUri
	iZa8sy66H4eL/mukdq4REeOVhw9MpCBeZq6r2NQzub2RTBo+OWNGrfOY6ZrAugA+
	+k7tug==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8nddjuyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 10:19:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a016b99579so11941096d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775038764; x=1775643564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=icigY/o4erm1hQ6wPL4lotqSd1rhrSmpE3CjS8+amCc=;
        b=EjxLJli8UVcbyrIh8P2L26RAsZaNbeigCRp65HilibDeJkAJLuqvDbgvA3yjEatPAU
         UI/HifMc9uMgNLUCeRy4ABllhcFN+//JBX1nER9JICTDu3BbhgTGMt1SAxxomly61hIQ
         LKbYVYnHfVVFyvNzCHNktmEllxzCi2K+GWt9jn27SjlfDSG5Y172/G0zYv0Gi3XXrd6U
         x1Zt0KLBnSGqdLch+fxV1GugzL5vRRJdRXtb4/2bQSKI5C0BRp12GDZGKDn+yZ6w+nTY
         Cgp8skyU5cMazc1v9yA0fq0DPAIyQYc/fCz6vKU8zI5TTW/guHHKyhY1b4AD9OYKtIMN
         8Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038764; x=1775643564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icigY/o4erm1hQ6wPL4lotqSd1rhrSmpE3CjS8+amCc=;
        b=XQxGXT9N3/0TTbR2tHlb81U3X618cCaOlcdcJqbnup0u79B0dblktZ1aePT+7aqLle
         5Cg7w6f20iE1S9J8wve4K/s3P8pyXFXBcnIcrRjYFFDqN9gix2OZ+p5o3dDZVJZYMbd0
         OdQWV6k2sNI50HIad+ovDrMex3thGI5OpbkTi79BV+XllCRYsUPAxFS95/JubVhRzRYR
         tRLqTOADDYBtXrY4+Kp37a6IVrf7ReySSVqv9FKZABnFqH5bz9pPL1nOhMuY5o8CDExm
         rbcBW4KWKFUH3PEYjMtY2cTiFzIFhd4/Y53V1vf+J8RBFERKt483D58f50mFxvgkjSjW
         XUCw==
X-Forwarded-Encrypted: i=1; AJvYcCX+v6xrXQqScrlB0L150YUhaDi88OEc97h/LuG5uGJgohGtmWTsy5Ml9ZpeUjCwetWt6J0C44wgB62J2dlT@vger.kernel.org
X-Gm-Message-State: AOJu0YxieS17lrrrlt6cwyn82MQuwv1UgwvyErJacjFl2WNHisbNnEmh
	FEKdbGqMCJBxyqvszb5G3Zxa6Ko7X4t5LfiMxvYUKHheNCpDwcnBR8RZeOjl9ymdOnBeMRDDKI7
	utxGdHRtJp9jitqml7C0y5kcte2qL5BtOUVnJh2lHlh7IZvN8coSc3jA5cvgH3Jg2MWwq
X-Gm-Gg: ATEYQzz6NM7O28WAOR6tIfoTjuaLNQSlFJl/9rLmXmDBV+z9NQ6QGttWFsXQrmba6uS
	tkD5E0sZOAWPGD6zFmmvIueIsQEs49nrtb0TAAbVE7CRK7+Vc3KoNREjaZZYx6KxLeqFo7JfgG7
	CBx17EzKKX9xJpSLS3EQma/KlW8Lb3f439IoOvDw1Y1g9BMkSqpukLxp7zWTSBw61ahD9oxISFV
	9Tvn4KvzDEyboKatewN9AIiK3atX94ANb/szunHtxTMB1+unWDhRxc+b0GC1jV/2IUYW2/9gxZ9
	8IL6EUcbGevwEtBGoe/5bkwm8+X2y/EOU0MWm6bA74P9014F12DNs/N1VrF6JI9v0dp0ZAr2Kv4
	vL/KOAWSEmilKHMJaUsPKtkMcIBr/oagfEV8UtwGFxO+33SUfvHueXm+WDp9PrgyT3eQUOg1buW
	KZJPE=
X-Received: by 2002:a05:6214:5184:b0:89c:5285:200e with SMTP id 6a1803df08f44-8a43a55cfe7mr30042776d6.4.1775038763837;
        Wed, 01 Apr 2026 03:19:23 -0700 (PDT)
X-Received: by 2002:a05:6214:5184:b0:89c:5285:200e with SMTP id 6a1803df08f44-8a43a55cfe7mr30042446d6.4.1775038763384;
        Wed, 01 Apr 2026 03:19:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c2c28d97fsm23326766b.20.2026.04.01.03.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:19:22 -0700 (PDT)
Message-ID: <ce5eb817-ce13-49c3-81f8-8e28c40632a1@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] soc: qcom: geni-se: Keep pinctrl active for
 multi-owner controllers
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, Frank.Li@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        linmq006@gmail.com, quic_jseerapu@quicinc.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: krzysztof.kozlowski@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
References: <20260331114742.2896317-1-mukesh.savaliya@oss.qualcomm.com>
 <20260331114742.2896317-4-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331114742.2896317-4-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZfUQ98VA c=1 sm=1 tr=0 ts=69ccf12c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=z3Ex9-aFqVcHxkoEKGUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: DOuqGLL3EjQDGdA_kwM9hgMW1zoCPwUt
X-Proofpoint-ORIG-GUID: DOuqGLL3EjQDGdA_kwM9hgMW1zoCPwUt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MyBTYWx0ZWRfX4eMWO3eMjp5/
 7WSl96SvqzysfJXUyIJQj9FKyZ+qdSbG72mFEG5MLpSfam900odP+/btVSjox4jDIsDQ+8cdZcu
 57gPnaDUB15CNkotBrJY7EjRPPeprd+Ezx+pMFaDi5KxYtqrl70dFS1MUfUsNYdBOa45VhlQIzX
 U9KWEZrc60JLJhtUdrIKY2lrwBEfszeVj8xcIn7g1S1AcyRk9Y8/3ebvYedXb6H7Kn5V6bm6wPP
 r1mWDBR2SXRIyX4JaF8HbrTzumLSxlD3WHUfXmBxoutwj5VsGIDngF5mKZVep153nOYnIEG+dtH
 wLPGggvRHIR0l9amr51+Ug9TxY4cUinVlyzQ/9iwKAnTCOBB8Wpu4BZIMC835l7NQ1mWEoFz1Q5
 fk9OiAVJKbmACB6vTEFN6fk1hwD2rrp+8Sy3Wdy2bhFlqtg3fqwS+a2QJH6C51jBkNQJ6ajor2E
 ZYn8efmuZdfm8HDhLtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101296-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,quicinc.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A2F1378612
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 1:47 PM, Mukesh Kumar Savaliya wrote:
> On platforms where a GENI Serial Engine is shared with another system
> processor, selecting the "sleep" pinctrl state can disrupt ongoing
> transfers initiated by the other processor.
> 
> Teach geni_se_resources_off() to skip selecting the pinctrl sleep state
> when the Serial Engine is marked as shared, while still allowing the
> rest of the resource shutdown sequence to proceed.
> 
> This is required for multi-owner configurations (described via DeviceTree
> with qcom,qup-multi-owner on the protocol controller node).
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---

[...]

> + * @multi_owner:	True if SE is shared between multiprocessors.

'between multiple owners'?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

