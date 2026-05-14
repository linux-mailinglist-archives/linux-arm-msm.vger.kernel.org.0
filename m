Return-Path: <linux-arm-msm+bounces-107607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN1vCD3SBWpUbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:46:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A17542780
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F9E7301584E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369B03E63AE;
	Thu, 14 May 2026 13:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elNFFXFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vvamf/y2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CE93E5EC5
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766382; cv=none; b=askSQRToJ9lEJitZcJpwarUMFaHTmz4RExWf7fBie17oYLBIf4RlgYzZoh9a5imPtwPqL4jrtwAWlOPHstxsB3stQ/sVtpATKf/iTe1pl07pwP4LxX7W8VLlgUn2oJxgzcvtjZHyH8+87BT/sjdGkks4IxdiB9EwENo6Q0sDmKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766382; c=relaxed/simple;
	bh=VsA9lueNMHM48F0fD3xvnEuJPObZVOCK+bsvecXebxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z75f2qE3mYveZFqo/Wf3nX63lA3vW+8Sbf4MZJdgn5Ydg/sfdE0Vy7H6FUxKz/8L2viK7BtoCkVpxACIj6ZlvULfBoLWa/+3bwclCTPJmum291oT1PgeZzk+wHak9CmMoqoCA/bGSyAuBgW9JA7Ot7EQGGagxkyNWVV44Y3w//w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elNFFXFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vvamf/y2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBecWS2241828
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cug8KrkR2YvO8/2ON7zyAWQ10fFSToTK7cXF0zPI/zM=; b=elNFFXFlWruyOno7
	FNmut6yTawcSU1LqOR4jkhVWuoHyVzZDOyq6qWfS04oCX9QkukdOGZa0fdqpBA0d
	Ec0aF+SVex92CZE1PbNM9WHWbUY/GR/8RhpwPVHfJmatYgtqiTYRcti+V+HbYVGl
	bFvBSnBalkxxLmg1lmIU9zPz3gVkMlSmkWJIGJ1l1F1wuU2jkfA2zVQOrsyi4RhA
	JoS/+K6VLqvl4rjB1A6jDFeTdNwz+3GD/v/aFzaz3vpZAo/DciNdnU/I3W7hR6rZ
	qyKdx2ySvRlpRPVkrxhkAE5xuVZUSKH27B5fFGqV5coSOPpH0OHtA+kISKk1XQ8K
	OAtbTw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513gav0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:46:15 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95f5663e05cso161208241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766375; x=1779371175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cug8KrkR2YvO8/2ON7zyAWQ10fFSToTK7cXF0zPI/zM=;
        b=Vvamf/y2AJqwgpqD5x+hx3XQetk5CzBeuybCjx788P3EN1sgV/hE0mqyi58EFzI8jb
         a4QHwGXk7gLNlhvBEJjRp/r4mu5Q3ENwfzNASjn7xKkkAUNS8wRPBiFG4qR+LzSOH9LS
         dhphZGZLDfG+VFNMxgRb5Vo7XoknkVxm5jUG9hF8NPxvBjre/psKvNaygBZa8ZiG6zi1
         qkCfOVovAXvYvwvPiC+7GbMxMtNGQEe8PF/QjUTNG0nqUNzNenfnZR+LblDcNPRtwrWQ
         FSt//henq7suowuOww2rbez1Y1ya58pTe+sC4KEx1Kah+As9mOynqvlOl1BNai7VAN4o
         upig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766375; x=1779371175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cug8KrkR2YvO8/2ON7zyAWQ10fFSToTK7cXF0zPI/zM=;
        b=F2oDS69M4+BcEkU2MxPft3XgkVNDDiZHRuJo5xMF4iAUt+zpE4Xk4YYb129msqV+sC
         1QghZmuZBx0eoHGFrsUWk5mjAWsh1p7+iKGvpujaWAaCBuBNQzQ1o3napS6569w0HKKa
         K8gSKPaIje1/DQXDaOC3ngZ9Lgzbhf7RaxtsEd0/qg70YrmYCODTTPRpQSEzw9KQYT0f
         2lKvLee8POZw0Q6lYMDWXt4+oiW6JZvOSgR1jQas6PfIkM50uxG08n8bBoakrCWIL6Co
         CUUsUAhowUwALsdQMvSyPgRRkApVE/QIyRe0hCrwbUuj+khLgGk8UmqBdk1+FmKp6MrO
         daWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/r5NrtRKIFSC/4bIvv6ZyObj8xRLHdOq17ERxZzr1o83VVfD9a+aVr+4EjMVauuWzN6rrECMssduxV6XvT@vger.kernel.org
X-Gm-Message-State: AOJu0YziDuJmATp1gNou2aHx5rcUSZcGBR6+6y8fZkrDg4JjAEmST+Uo
	9+yLK93MToY2RTWueaz/ec/I/7LhvBZjbZOZvK/K4tN+6zVUpSX2XNUnmNk1j8ol8iuOjjwJxVY
	0iddt2q38dN402cpy4bLdBKZ4PvaR0F9uN5j4SvyK/pDWJBdqPkaeKjbtLAnZnXJB10Wm
X-Gm-Gg: Acq92OGjbdAwqCODEjNxY4dE8aXUx1zePP2BWrMqnTytQgaEeokBKrprqqBbEIvVYz1
	G26H4a8ZC9ZdUBIXaSktEudncfDkYNAeyMZgm0fXi2eITaXrbU3DdXnl2N1idKQ8Mkb8yPdB2KY
	AA1OcuiPVjQe4LnNMB6H5dL+PN+sN0qBVSvYqH1MI3yEqnksp+BtQG2YqyoYiXO2p2zIPZ9Xgth
	WwoEJX7l78rBGCOABRTdGv066jSuATj0ZBrur3QhtSK7r9TmsbeaxmE/shZfBWb1c5iRfeLdDU4
	EWnOQY/s31brZKg7kKfetOeEiq4LlVUg2IepCQ2Ws9Q6rB+FzoesIQezQIdRZlLwiX+RnsUDV+D
	sYku2e8eA9zzAMNeWM8efmWCo+z1cOwGEEnS8gYA16n8AIHiunKSNU6/NRJLncP7s9bvfu3q8yY
	3ELBk=
X-Received: by 2002:a05:6102:3111:b0:636:c122:8583 with SMTP id ada2fe7eead31-6377615bd93mr1142089137.7.1778766374940;
        Thu, 14 May 2026 06:46:14 -0700 (PDT)
X-Received: by 2002:a05:6102:3111:b0:636:c122:8583 with SMTP id ada2fe7eead31-6377615bd93mr1142065137.7.1778766374512;
        Thu, 14 May 2026 06:46:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164c5497sm501819e87.57.2026.05.14.06.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 06:46:13 -0700 (PDT)
Message-ID: <4b3da6fe-a5ea-4629-8f60-a23e8cf6ab4a@oss.qualcomm.com>
Date: Thu, 14 May 2026 15:46:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] interconnect: qcom: eliza: Add SDCC1 slave node
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Georgi Djakov
 <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-0-13c03bc890cb@oss.qualcomm.com>
 <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-2-13c03bc890cb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-2-13c03bc890cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzOSBTYWx0ZWRfX6cL6K0YKzKib
 x6IwsNIp/HONnoeOToOMdVv5RyQhcAll73z/IrFc2I8xhP0oNSaBTmNhNskC1Vd37zXIB5oqyL8
 MTPKLa5JuhqZg0crCfIz0EXE+oaqb/u+ctGFtsVsJYhxOPvrFEIf4KtJBC1fTLrorNQaB1Es6uS
 ooUE6ezE7xS0Q7P1pd7FnVFEzR89jFuYoUT9geYYr7W6DGrX08Z6KPk5tz2KGxl1Vou7+31uHtG
 UiPpdpF1GnncRGd2Dk1g0HOJwLaxDbwHIHKbrJ7XwugmYCH/zoZ7a4lGDMBq+Hlv5VmaKK6YmwP
 Z1+5MfP+3YAyAJal3+EHe082FnTMJKUEDJU5vP0UGLHQT0Vd0FN7BmZpKl68SIlGkbXi5sZBlHZ
 LQOSVQIblj2DFEG6M/jZ4976sR+r6YQjXrH0hWvQE2FoLLOA4DqwApy0SKNCtk3WDbs8D1uzDxD
 Eam7uXoKbkk5ESmOBug==
X-Proofpoint-ORIG-GUID: zvdW0q4qTJ9rImYNZ4rne0wLSTfcsxvT
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a05d227 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zvxfrTDFQEmcjWDhNOoA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: zvdW0q4qTJ9rImYNZ4rne0wLSTfcsxvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140139
X-Rspamd-Queue-Id: A7A17542780
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107607-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/26 3:36 PM, Abel Vesa wrote:
> The Eliza interconnect provider is missing the SDCC1 CNOC CFG slave
> node. Add qhs_sdc1 to the provider node table so SDCC1 interconnect
> paths can resolve to a provider node.
> 
> Hook qhs_sdc1 up to qsm_cfg and CN0, and bump the corresponding
> qsm_cfg.num_links and bcm_cn0.num_nodes counts.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

