Return-Path: <linux-arm-msm+bounces-91297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPHWMZGcfGn2NwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:57:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2595FBA3FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5020300A8E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B20C285073;
	Fri, 30 Jan 2026 11:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNJzxztk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtC5OfJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BD92C0F72
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774161; cv=none; b=oTff2hneafpUu8WHS+R5X+mS3OR2kA4jX7ygyONP1CCsa64CoGcyXQYMaz6ECT1NggQWGyrgVbwN7m1SDHfkDL0i/5YuPi4QDWmryNaMHUFF3adW8hiuHKg2NjznA/sHgZkiSnyQvZN0ahY5RtigSi03zL9bOnWaekHzD7lCEpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774161; c=relaxed/simple;
	bh=OJwPTZRTEklOZhpT7S5bhlvgzfcai6Sxyl1nAIPFzMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDUFwel6z6Ez/0hWahham3zPKhJaVP3CTFZ3mFXmrO//Ro2/Ll/7PiYge61UnDH5TQ/OpmrK5HedDWWFrfSFBjp5KW/ZMzqs9egDGQK5g2tVAThkgVrCl2ecEZHPyRPl0uIB06Qt9o50chiP6H/BGIxfIS4iXmpvNJKUuj+DAeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNJzxztk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtC5OfJt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U4tObl2294948
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+WZkU1lyCaEeWQ3hXRLyOfKOv0thvYXR823k7SIXJtQ=; b=ZNJzxztkk5D/w1Cm
	aryldQv/FAo2EFC0eh1VODa1GlDzBQdJcw5aaClXocDivbYCI50b08jRRlrRYP7k
	Y2em1NQiWVot9qt/gGf3qjJtDtYLG8s0WAdfF9H85yLAKy5tNdaFyS0c6LAXszzx
	ch6QcNlUAAdYxyZgOnipcIsN36ccsS1KeUDhJ/NYEYGdLoAo464N17czcmJQfW6k
	tdaheVv4gNJuulQXw+pDdthTd7+WqUoB2BUPk3t+eEP/2gN8reGp3/612/W9vgrv
	Tm/KPL4qhoNHfiIDU3cFwVu1VSyffmQ3KdcFnfr3T+X4L/Xui3apFwGeRkDml0hb
	PYOh6Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p1x95hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:55:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-894662cba4fso1553826d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 03:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769774158; x=1770378958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WZkU1lyCaEeWQ3hXRLyOfKOv0thvYXR823k7SIXJtQ=;
        b=KtC5OfJt/asQZgpzm6o/ZA3UyeQbaOEmXw4o1dAbg02jljyoDsgNFdcHLLd+e4QenE
         XmcXmCNyNurAq0X4Is57BKTXUmhv/7bRqI9y7s81Ps7yzpbzagYHiiP5/SFwvbaKLRFL
         yIQNJ1EZXBR+rHDcBM/5Gp1ykTlqV/XGEVIGpiWi+FdCbO0SAkSdsXol4wpscnoGieMI
         2tuW6XT0bIDduyW/ApEo6yOeBuNXlE+4Wt/8XbkfTWaiwPo9qJR9vVKVIioSuy0hKygb
         x0157fqpGBmy5oAoXCymPgvdfM4NEBNr3GohDi8rRM+oTzahDTKhkkdO3n+99gf1+LIX
         j2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774158; x=1770378958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WZkU1lyCaEeWQ3hXRLyOfKOv0thvYXR823k7SIXJtQ=;
        b=EWuLsBo8j/Ev7ZsSAXTvomSlA2XR5Auu3iES3Sx3rpuPvZICjsj0DYwthWYe5OD14x
         C8QX2MlWEafDMOci88UKaNnmGc8xPailae7vldGMXW7HElhYdAq9r6AVszTeA6EUjnX+
         SyFjgD/C7Wf3C+jlQYQNVHTpCUGXD+K+83V2p7SBaxTCw4rkeEORUZboxql4Ri5zph6h
         XV52qPHt/SWaC1Tfj3GkSNIgoKaDpZUPTVGyfiN/5GWcww/huTqf3VgLYwYTLrj6S2ip
         YUViRH6ky/Oj0EaS9Zv9nhVOw6Rwhk1DWwZjmwJh8GgUOTEBmajpWs8zgNDn2gJjMiF9
         2BDw==
X-Forwarded-Encrypted: i=1; AJvYcCWDTcxBauhUOwpGENI3cT2pG1oJyZeUJgI2RP1u1Ubej647u8O/y9R3b/D48oNzsm9ycg3SbQdYABs0f5TT@vger.kernel.org
X-Gm-Message-State: AOJu0YyhHxEVe8B1U3qJTds39kZdIgX9CW3ormqqUyeQwVpdOyfClrkv
	XkDsEnPI0iEzN6kWQnuEPyLx1FKhWcz7xZGeOmV/a6VOjQw8lviihhbKPz3YHtHJhzucRVRcoAO
	LhrBcwDoIUuGbd55V9jZ0U5iA+Gl9I5iAecCbmVU63az43C+kb/o7YRpaN0NZNsO7xq0j
X-Gm-Gg: AZuq6aJVt6qZSSo6gDxt7IRP6RM9JcltyBgJdwkWrF1l39sbpvGjiHY2v3omNOgoBbG
	OumkD//JdzF0AdT/GXc56VMxWPTIZxRvxa0vHr+hUH1gvuFK3K2ksgGJ2rBFIHJvg4yr2/C47UM
	7DXJaxSfTe6UDxh7e0BEif4+dH5p90Y2UONateWULKN3g7YkyK6IEgR+QTl6L82DvlmAoP6ygiQ
	1a7qTyBic1vuVCNh9ugLZ7l2ScVTI85IubJk2yw2jjaQ03CrP95/V6GHMJTYDesQE7j7Lan2lUV
	yjXHyoga9i5Qt1d/iiYEVmxB/KZOByZFQHh7Q9lVe13QliWAWocxA76zduWjAw4ARxAyvEuJklh
	4WHsBUzkOOEWNg+BuSyEjT/IpP4DHt5FAlbxBeSUkYYgAgjTchqCjlIyshMHotc84YNs=
X-Received: by 2002:a05:6214:4f01:b0:894:946e:3687 with SMTP id 6a1803df08f44-894ea096a36mr24616306d6.7.1769774157962;
        Fri, 30 Jan 2026 03:55:57 -0800 (PST)
X-Received: by 2002:a05:6214:4f01:b0:894:946e:3687 with SMTP id 6a1803df08f44-894ea096a36mr24616086d6.7.1769774157533;
        Fri, 30 Jan 2026 03:55:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4256a4bsm4118791a12.2.2026.01.30.03.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 03:55:57 -0800 (PST)
Message-ID: <2697d1e1-8421-46aa-b58f-10608a2bea2c@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:55:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: ice: Avoid probe deferring for un-supported
 ICE feature
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        mani@kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260130091118.147379-1-sumit.garg@kernel.org>
 <4ad700f3-da8f-4175-9172-3fc4d87d8152@oss.qualcomm.com>
 <aXx_UDTkdYHY04FR@sumit-xelite>
 <4f629971-94cb-44aa-9502-4f5ebfd63937@oss.qualcomm.com>
 <aXyXtK10_t-OBOxn@sumit-xelite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aXyXtK10_t-OBOxn@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6G3mOpN_DY_Ig7HS_YWIN5QJ4IUx6Gv4
X-Proofpoint-ORIG-GUID: 6G3mOpN_DY_Ig7HS_YWIN5QJ4IUx6Gv4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5NyBTYWx0ZWRfX6RY62D7VcQQA
 8Z7CzjvzWug/IC+NONjXs8NUjXlIFdDUuup1i+y4u/3iPMfau8zYYp/N5cBQZpRZpbeTtwDVW9G
 JoMDbm1PnAh6NybN3Zf0EfhwV+TFm9J63FNC6C37G3IRDN/mQZKRGJfKKeTSP3qTo5Vt2lb2a6r
 qsss1rynA7+AyJjw8rgf351f0/VKzN5L/3Ugx3eXWjyOfeutUfjWhZKBb3Yhc1kdSnKkFDmnNJR
 5D8QuiXO6Ilf7DjIDuoRn4QrnKKt3umQTyxGs2mblzlF4hWrqdXr9Yf3AYTNrp73VAkJVJ8EsGO
 t/jiRXD8Oc+OQ0bm5DUGQIvYQc/PLFdAy/WfjOrfc1snZPc5jD/AEuYQkgyen7WaaJOZvkbRfM4
 9RtoUxd+4bn3SRTGhzN1sgEHbo9l+YXQgZG30gv1+/KpVonYYhTf6YM0O6eSXaM40YYn5s/Pt/U
 IGxzlNOLSQ2Z4RBFCaQ==
X-Authority-Analysis: v=2.4 cv=G5cR0tk5 c=1 sm=1 tr=0 ts=697c9c4e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9oxdx14C3Cyt1g6qQDsA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91297-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2595FBA3FF
X-Rspamd-Action: no action

On 1/30/26 12:36 PM, Sumit Garg wrote:
> On Fri, Jan 30, 2026 at 10:59:18AM +0100, Konrad Dybcio wrote:
>> On 1/30/26 10:52 AM, Sumit Garg wrote:
>>> On Fri, Jan 30, 2026 at 10:34:26AM +0100, Konrad Dybcio wrote:
>>>> On 1/30/26 10:11 AM, Sumit Garg wrote:
>>>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>

[...]

>>> Since qcom,ufs depends on qcom,ice via a phandle, so isn't the probe
>>> orderering automatically taken care off? Or that isn't the case here?
>>
>> No, that's guaranteed by devlink only with certain properties.
> 
> Okay I see. The other alternate solution I can come up is following to
> keep the deferred probing intact. Let me know your thoughts on this:
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index ab9586b8caf5..76bf9f94fbaf 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -559,7 +559,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> 
>         if (!qcom_scm_ice_available()) {
>                 dev_warn(dev, "ICE SCM interface not found\n");
> -               return NULL;
> +               return ERR_PTR(-ENODEV);
>         }
> 
>         engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
> @@ -648,11 +648,14 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>         }
> 
>         ice = platform_get_drvdata(pdev);
> -       if (!ice) {
> +       if (IS_ERR_OR_NULL(ice)) {
>                 dev_err(dev, "Cannot get ice instance from %s\n",
>                         dev_name(&pdev->dev));
>                 platform_device_put(pdev);
> -               return NULL;
> +               if (PTR_ERR(ice) == -ENODEV)
> +                       return NULL;
> +               else
> +                       return ERR_PTR(-EPROBE_DEFER);
>         }
> 
>         link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
> @@ -726,7 +729,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
>         }
> 
>         engine = qcom_ice_create(&pdev->dev, base);
> -       if (IS_ERR(engine))
> +       if (IS_ERR(engine) && PTR_ERR(engine) != -ENODEV)
>                 return PTR_ERR(engine);
> 
>         platform_set_drvdata(pdev, engine);

This looks more robust. Although the UFS and MMC drivers today check
for EOPNOTSUPP, so perhaps throwing that would be even better

> 
>> In this case though, I think it could make sense to add it to the
>> "suppliers" list in drivers/of/property.c.
>>
>> I don't know if vendors adding their custom properties there is a
>> pattern that +Rob will be happy about though..
> 
> Not sure if that's a shorter path as I would like to see fix for this
> issue backported as well.
> 
> Aside, not sure how much stable ICE feature itself is as I got following
> crash with QLI boot firmware on Kodiak:
> 
> [    5.172970] SError Interrupt on CPU6, code 0x00000000be000000 -- SError
> [    5.172986] CPU: 6 UID: 0 PID: 241 Comm: (udev-worker) Tainted: G   M                6.19.0-rc5-next-20260115-gc1a0fee87a05 #9 PREEMPT 
> [    5.172996] Tainted: [M]=MACHINE_CHECK
> [    5.172999] Hardware name: Qualcomm Technologies, Inc. Robotics RB3gen2 (DT)
> [    5.173003] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    5.173010] pc : qcom_ice_create.part.0+0x6c/0x24c [qcom_ice]
> [    5.173024] lr : qcom_ice_create.part.0+0xe4/0x24c [qcom_ice]

Could you please decode the pc value with ./scripts/faddr2line?
My compiler produces different output

./scripts/faddr2line vmlinux(or path to .ko) <symbol_name>

Konrad

