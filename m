Return-Path: <linux-arm-msm+bounces-103256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLL1HKxY32n1RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:21:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D504027F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6DC8301CFB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44609257844;
	Wed, 15 Apr 2026 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P554oZ/T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7GIuLSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A699332919
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244711; cv=none; b=Xm96CqhSW9BYHM7oA4ueD9zmIknDy6tm/HtRj3urooPAF2VvUL0uicO+uh23pTgZmKr3J2v+pkY7lLcVNjFbUrvlp1+9vDmPiTJIF54enEVWi1h32u6bSwgy2bgKECsORqh+uoEFGzDjEgRXW3A7AqOjv27XU++fZ9VHEIJRbWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244711; c=relaxed/simple;
	bh=JNerf3URHKNFdqGqNd9J1Lav5rcxIB9GNWFOcsXCZq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SbXiM30xWO+6F2evK74Z7dfUT85f3m5SmyOCW7h1Xmiq3z1N/EM/6IfapsG8L+WzUmUGTO77kAyIUELTSD4ZLRrm2AdWZeeoabbrFjLANLCX5oTJjsklfJDTkD+938xNACKBtpnrchQtKO60x14t+nWY3C4r3k9WekB72f78CeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P554oZ/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7GIuLSm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8NUew2972152
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pPIrCVGV4RXinbcPuALJen8mM2Fqb6EIb1Pv2wz/5ew=; b=P554oZ/TjMjSyb93
	E/eV6pKJak2MNxsqQV1U/W2O5V+qANgI/tucV2EISndeZKE+lRne+l6RnMOFxTFH
	1kdfvAHMjI9Vo8G2NLoDbz7BWJhysvzLPIgxcN4pDHOsxqC+rJ3wXBLlZpwHgCJk
	q9rDzBi22cb91qEzZ1rRHtN6NYYIuy209hdntvagqR6Y+JQYD4dq54fF0P1/4qyC
	p5RnrmPN1jRr8XtVLxEOB196Bdc0pDDpDConpXfgvi2p1I166Cgdufb3jSEEAzER
	QXp+avDhJNetL4MLZ9GkNWlVngszBl5Rez8t0Nld9O8UW6nJurIlk5qEQxRhPN0l
	EbG26A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj74g868b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:18:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a5bf7ee420so20887706d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776244707; x=1776849507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pPIrCVGV4RXinbcPuALJen8mM2Fqb6EIb1Pv2wz/5ew=;
        b=J7GIuLSmRmTv4CVc1S0ahAFa0B4whBgHONDeehJmLeQ8YkLE+gxPpMDTFwczQ2jV8g
         bmq8dgfMu9vqSmMxt8A4N0ocj/FzA8P4TaW+k34T3JlIKSHCAxt+16qQvYeaZ4lvdnUS
         eMXNOKUO6grUNfLk7vJL9hslM3MKDK2Nkd0QxRYa23aUbcQ9CLjZOeBY+aAO30AiDOJ6
         OJLKml7PEecDSoUAvKPW3VjzTUTkFL7t/t0DAIgJlHyce24gaYvwTT/4NkbbDBbjMMjD
         /CMWAs64a5XaN94azCGpNLeYcyI1ug6T6BWO7i8swprsXb7uJUpugSUYFcG0vqFW9qBU
         ljyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244707; x=1776849507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPIrCVGV4RXinbcPuALJen8mM2Fqb6EIb1Pv2wz/5ew=;
        b=MRUoSsqUDp+rwukZ2gd3+cpIQ97WQMI/oGCwvpSv31QhSzO8tWXrCw9OifDr1Kp6H+
         bHgM7mpVVhqqHHvsGuJvSr8FrzvsxC7ePo+KI135/imC+BdefAtBuW+UXPSrtvar8yi1
         lmDaFWEgcFvpWQlu4UoQS0sV5Vtud2IXvQadJh8WFwWelPWrpztFkVIa16ssWpOJxLTI
         k1+plSot3rJ7SsZ2sIW0aUsG3HDkQtooQO4JL7acZowZKYWCfnvWABEtLuz4QTOB+XXj
         aCXgFWwBF8nZgQH0ES/26bv/SSuFS54OdVq3jjt7T3h8O71os7TgtFNw3KXcF6JnlQ6W
         5J0Q==
X-Gm-Message-State: AOJu0YxyHF6EeoQ+WuLD0Bbb7qQ1dMHWScfSg6OHxSRBdqoSQcjcQf/F
	TRRl7FxAXH+4E8lOiwOXbkRWsUDrZZZvfA+pK5Wu22pWnA1pjb3jfOzdIaHq27HTgQpRvBAp2/s
	ARcfgePc2MRmlfV9IQ06weWihsVu3+DG+Qlp0axQeCssp9P1wXZqdQjikx/e8TLxMus0R
X-Gm-Gg: AeBDieuhcuJ91mBJukeDlnxGwl5ysW5Qen8B2Lxb+NXCDYa6FkhT23u3zzh40sGwi0i
	r0l9O3C0/nENniWrV/zee9sz2E9Cn/hWkhWAIiJYMuTzerO+31oeTikW8awTyLkmUpZbeMmCZWn
	gajDjJfSoMLNzifUCm84Qod00kQc2j/6dSBMfOz8G4j6kT/KjcROdYqzkfIwMATMhs4Znd+zjL7
	MSMtWLSYWS7rD8HpwhzNFs78JqXyhuMMKuCLyPf4cn+hNFgcNQ0UpT+Y4V86i54yOjtbiR/9g3b
	VYxMvsqGDcG9Qd/QdBQa7yr1OCETM9IO9U0L2424LjKy8P++1+rKIACFtPQNJ3B4FP1tYtfzCxB
	BA71/O9uw2myYbGHwHod/IWH1Oq7XF5FHcownF/fAEllIgRt1tIXijBHLQIwHCrfhI+vR0ZGYFW
	4ipVvmBFPfcPdKDQ==
X-Received: by 2002:ac8:5f95:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50e1a7bd8admr14840841cf.8.1776244707352;
        Wed, 15 Apr 2026 02:18:27 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50e1a7bd8admr14840681cf.8.1776244706931;
        Wed, 15 Apr 2026 02:18:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba177fc1a3csm34573866b.58.2026.04.15.02.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:18:26 -0700 (PDT)
Message-ID: <d2f40335-1ac7-44e7-9f94-d0f012e6a350@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:18:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: glymur: Mark USB SS1 and SS2 as
 role-switch capable
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-0-409e1a257f1f@oss.qualcomm.com>
 <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-1-409e1a257f1f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-1-409e1a257f1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4NCBTYWx0ZWRfX4d8yQNKpmJkj
 EjHAbvZB97oaLRKAuHedtcS7GBuufXpJFcYnN75F/z2wbxtEp2JADdLElr01iuw81me7iHUj8YQ
 5+WmrQXvyiAkCrZFA40Do9Y0DLH48Wd8tHiepiwI/DhcYTHx6o29kNQzt893pbu25xxbglht22r
 afy+CKG4Tze+6ld1/50egObYQRWai+lPsDWKoaZijbLUQ/aE1Rj12yuGltupmWIw8efEntH4QGO
 jRpoJMvfPEK0ytyjKYF9sKmvvDUkODApEd0S5Tbwm/ih5v2WLsJlMCeBVqSXqXiUBlwjIKU5XWT
 rZng3BQfiGRRth4rwgGT+3ue8Z28yudXlnaXqWBQsNK3mCaWCB3nQR2nLYD+eFwiUnY8S1Iazrn
 YLR3oEcS0clZV3KH1CBOkrzocI6Q+DQ++7Ln01ZfXvnoKQwnfeyzk/Fi6ait/d1sdhJ1AlFnIMJ
 77CADyj1glaG8wV9ZyA==
X-Proofpoint-ORIG-GUID: _S91t_bLPZsjjnBoYdfOyhVz9biV4HIr
X-Authority-Analysis: v=2.4 cv=ZIfnX37b c=1 sm=1 tr=0 ts=69df57e4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zukAUv9Ucfy8tcaBEEEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: _S91t_bLPZsjjnBoYdfOyhVz9biV4HIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150084
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103256-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C3D504027F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 9:52 AM, Abel Vesa wrote:
> Like USB SS0, the USB SS1 and SS2 controllers on Glymur also support
> USB role switching.
> 
> Describe this by adding the 'usb-role-switch' property to both controllers.
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

With the patches in this order, applying just this one will break UCSI,
see:

https://lore.kernel.org/linux-usb/8fabc049-7fdf-498a-a3ef-6f2570d510c8@oss.qualcomm.com/T/#u

(if you want to make the change in the dwc3 driver, feel free to,
otherwise it'll be somewhere on my infinite todolist)

Konrad

