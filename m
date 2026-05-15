Return-Path: <linux-arm-msm+bounces-107787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SByCBSf8BmrtqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:57:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E99354DDF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6680130DFCD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805273C2764;
	Fri, 15 May 2026 10:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJyvMM1M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpjeT5Pq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D8F3AC0E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841131; cv=none; b=gRBYC3wZvIKk6SLTGiqXylmgcq0flg0R7qSylaO+qkoRRxwp9K8mgxC4/jIbCMEyp2wuz4zv7taiUer2XAd2ek8q1ClPDxRXjPneCUs32oswDb+KXWN1xS0T8NKr/6Uy2lD16LW6tVsYkjp7XvCfQ5AIwi6hWWQWiPScIJj/uoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841131; c=relaxed/simple;
	bh=LaqNkBsC1aPqGZMmd9r+EzaETwzayMdcQqzUGkAYZx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hzHYbkTneQ8lTYsdWWw1aJCAZ1/VhlY2VzKXva4u03mDLq9C+6fk0wkr2B2yKVv5De15xk+iZkq+mkhUZYGDvYm4rqAWh0t1rAz2+CIHtCGTHuJ8THrQKdQ5k1e1v5gZJjeZb/tzQfRNI6+NZvuh9WkgIirIsBaxl/PZ1DYOtAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJyvMM1M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpjeT5Pq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5H9UJ3670425
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7P5tIwdg/rLa4pPJy9f6dOdgWa9waugHsGuQ8JjtvLw=; b=JJyvMM1MhhPgRHma
	u6YC1THsAyKMKFu4juyXz8tWxEMCBJgCsohNlcAUWrvAUkG02qKj88x8jgrnAbuQ
	iAWc3YX9CD5AGjizW8WiR28hRDznmBZ1zxJb2UX1aa+2a9TkCvV9m4/dCvAhzXR8
	/85EG4NEuHqGZEbyKykf/wwGiDbMJfnQlD54A66ngowY+5apLcLnKWnqIe132gRs
	IYd0MQljCmNQbi1SpihvNQss9W565IMEwOsFr1kEMzZT8qQhPMjbgFh0YYqL6kWV
	WTxS/62TuERj34FMWWyyiPpWPIYuqO13qaklvmh96JiZoRmNGNKRSi8x+EVzAgjQ
	SgNmBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2whb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:32:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90fef17f6f5so66088785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778841128; x=1779445928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7P5tIwdg/rLa4pPJy9f6dOdgWa9waugHsGuQ8JjtvLw=;
        b=EpjeT5PqIGG6WpjFj1QJ1nv3oNk52EtUiMWpYXMeERodPxbnVan5m3FPMC3vaVHfOh
         kr5+yVBIQB0y1C9ygSxf5NupRxRyIJzNeWRRbFGtjCkZ3dCyVLWZvoTiMaSCRA1OKftn
         WfT0l3AoxddpTusC10wqqGZcpes7ezomEunB7KsJ0ICQwESRq07VPIBtk5zBueKlVFw6
         OQioOenOcXmpYH95lRssixxUkn0nRSneXKH43xKzY1kJZ92UyklwnwXgbhI3iHGXd7/n
         QlVJ2Wk6BRPNREOHPXiJYY4NM/RMQXMh0iusjMgK2dL0DES84BCNYmxoVvXyDSruAhzl
         eS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841128; x=1779445928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P5tIwdg/rLa4pPJy9f6dOdgWa9waugHsGuQ8JjtvLw=;
        b=kGExt3eDu/mEMvg3Z4V5ZdBXelJNDpBhYkb14XOXhfhmkJ3DPDCLsNHCadpf0buevo
         WDf1RNYrMMMI21tR/3gGcjgXdojiO8COhRAb5mJymvY05hKnk529VHS8fmCIiCawgYTR
         XHqHg1W9w1BRxhppUWpMfBOnxQNWeGcw8s+y+7vnlxGLnU+K2qovlkAqFz0YjgQhs0Rf
         rIZscFao9flqdQUkNgYPejhHtyWSf0xEuk19np+Pg6e2tTb0hKkHQ91mmM9ccFB49t4d
         y0yFCBFYx926PVoitPgp9z5RfX9xu/I9klpDvKnBQAOTLqfFXuZEpEiM1Tyo5HgxpMnp
         0zhg==
X-Gm-Message-State: AOJu0Yx3o+vyuQhT7Wlk3zURxQ+qF6NmFkYllTG4qEmi8WpXrPmd6Duw
	DVZIQ1Stk6+cdwKWQFNP24mqXgQIQMfwp7JV4gJ0pEmmCW6T7XBef7a0YeqZ29EJisj++DBsh1N
	hwBIx9pc/7zAzD+EMOvWXWdzuWJSOjqorJ2p7rJrUoVaVTICAOU7bsGtkHgbm4u+BovGa
X-Gm-Gg: Acq92OGnaaI0hHvxxHQPib952yACJksr8yWHfuYMVSMEXGsjRq78Rbp/ANYexB+ndnd
	Epugc1fbLEASQMbe/cc3lCJZ1W40laB3/7kkvUDedLeeI+utq7/og1S0tXCX2xRXKLwzpe4CPlC
	CBqeEYJMi/UqEhy66njypEoijIcmDGMsTueDy1sbwsKy6aKo3zxmqMku/2nX2IRtzHe33MsJ9jx
	W7QC7g1/6XunUBntriWhhn/wHcum6wnT2ZJbT2ojNaDaZN7FnWFSMCsnmk8dgo4LL3PMRVsS4ig
	0RNe39arD4t25r8Uv5EBjlYRgmMARfUeeeGSFhr4+tIXhNLUkDuBra13b882QEwBLUWtj5pV5lU
	Ja3d/gpqKaerxs8/m/vu98PnNcjWicNEGBG69Naojz7n8SXdyiqEj+aqYuQ4iMm0S3nwEUGuEOO
	bTBV+dVYRByklm1g==
X-Received: by 2002:a05:620a:701b:b0:8d7:3f45:b95c with SMTP id af79cd13be357-911cd9560b9mr374351985a.2.1778841128197;
        Fri, 15 May 2026 03:32:08 -0700 (PDT)
X-Received: by 2002:a05:620a:701b:b0:8d7:3f45:b95c with SMTP id af79cd13be357-911cd9560b9mr374348485a.2.1778841127788;
        Fri, 15 May 2026 03:32:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b4069dsm1798256a12.1.2026.05.15.03.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:32:06 -0700 (PDT)
Message-ID: <7d84ca2a-9bbd-450e-a531-a9b2bc227cf2@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:32:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260512-shikra-pinctrl-v4-0-b93c3a2e4c08@oss.qualcomm.com>
 <20260512-shikra-pinctrl-v4-2-b93c3a2e4c08@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-shikra-pinctrl-v4-2-b93c3a2e4c08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNiBTYWx0ZWRfX0VqWysNMufd6
 Xufpqb2FS48s8bRHxinbnl6GcvrFgw/jZqAWyclGYnz1FSTDgDgUEgB0QvKUoHEWFXYr1ZrXuII
 PifzgO7jMN3GkFhWTNEk9V82nJsuCbgybrNfFAV1awQuzUFnV3K3z5XfkE11AHs3/BetwNn+YJ5
 dJRuTVsUbcp7nzZjmB/gGEaW5Stlf1hVakKmplT+jxsk8QPCYFHPozfdCJ0Q4NpJj5p24ePIGpQ
 +n+hE2rtmxrTKQhEYb7krIIImVcVGYuUWVR3sdzKJONFAXjWL76emSNmo660dyLrgx8wvMdF7W3
 HqIDI8qb2uavQKEjnd2INW5ZRGfY5ru8UJFwkydv8yFcuC3KAlgQjaC8Im+bHH4Hp1ImCzTdZlI
 PIXbZ2y9UewZd7aPSNQWrS0RaxUlklkhlt+iZjIG73+jXF6jxSrd+D6204POjfBlJyx08n2rEw6
 cDnffOkuBbEqkiMVqtQ==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a06f629 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=NVK-j4C6oOT1ijtQxEUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: h7-oL8ExIrds5ayl0luKwiBEfTDAFjcr
X-Proofpoint-ORIG-GUID: h7-oL8ExIrds5ayl0luKwiBEfTDAFjcr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150106
X-Rspamd-Queue-Id: 8E99354DDF3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107787-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/26 3:25 PM, Komal Bajaj wrote:
> Add pinctrl driver for TLMM block found in Shikra SoC.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

