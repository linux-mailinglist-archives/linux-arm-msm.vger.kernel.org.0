Return-Path: <linux-arm-msm+bounces-97907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOL/FHbet2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:41:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A69902980DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B9C03056D94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740D238F935;
	Mon, 16 Mar 2026 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5c+IPVN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="chlPI7Ml"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3989D38425B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657556; cv=none; b=BK+92XzR+zw2dl/hVppug9j6KJxp38cdPvApTPKMDPW2IoKqva84q8N9TF6PMEGj8uV+QYpkqaqob3/IVvQV+aajNT3xzgo6lFfgUUjhn0h+7STW1+xL68yCOb2GGMouhu2hJwN7LIrCfjCtHDEY9aya/canvBLbl+LxbuARnlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657556; c=relaxed/simple;
	bh=AFfI40R+WNVkpDzns7gNsGJaNp8GbnCbR28Yd0xU3A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajEUAXO/QjhoHrb0WuhCmIFJwv8wZUAlJjM9Gp5EWddWAQfJmnqNxyVZ401qDq/85OPXNfUnbI+LZh+/Z0SGfjbw75WroXs+dI3GgzFcIuRJskcAgzXo5+x8dDIosa8EJC38JfMMyyxfxmGRyZeoqKWrGLAguT1MvoNZBedZ9CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5c+IPVN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=chlPI7Ml; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64eqk1282063
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t60rKOeCZ7se+qnknJ2HOKTEie+XoswQYPSGTZuaCxs=; b=b5c+IPVNm6vW5vHO
	BdMQrIw2kIeyoo+uyOhWkAiQ2E2wHqOiVPYfzVCgMGXEGOCTeQMSMjAjskYhcppl
	WjGwVMaxUHTk4Slzds9AM0tibBTqqqKIyd6t9oSBPFNHT1YIvi5tZxJqy4wtopOF
	1d1QxPnAuO7vLbdwh1b6KT0tQyA8nY4zqM+avcrWJKRf31cFcuS5Iq9Pmuq+nEB0
	tRSBt9vh6PuYGBrW3xS6GBVKr/v0f1WTPJRgsIiA02ge3DDsXVWVLTbBSh/uxwqo
	WqMx7W5dQty47gMUwhfq8vHtuXC+jF4+1C0KmjBbmH3/Cow7O5lpQPR4zDZpqdgZ
	cGgVsA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc561t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:39:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a081737bbso46536776d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773657552; x=1774262352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t60rKOeCZ7se+qnknJ2HOKTEie+XoswQYPSGTZuaCxs=;
        b=chlPI7Ml4oOxMuJj4zaz+VaUGxmvdlkwmIMsyizieufl/2GTbre3TrZP+CJMrnEmdm
         WxVVmThMeWS3UPbl1kRvtQBEvc0+y/4XZiuoAM0M97Ox6Ixkt/6tI6Ojjbfi3CMht3uV
         cml9wArBB/3pLrdSz5KCCdaX4kJYSju1sV1wcn46UPHhKIU+jUwjqAwvjKV9q+IAPnLO
         TkWTLVWX64OW5CV0CiGZvgmPm7IQ+mrvmt5Cs4p59a7j9/pwCfFmONjGxMUHT7ncVGBj
         PaGYWN2cIsNkMnM1P5pm9oxRlzcoOZO1pfsgcPSVKh91e2ZSZWO4lZV9FHCHXnwBnHIZ
         cbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773657552; x=1774262352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t60rKOeCZ7se+qnknJ2HOKTEie+XoswQYPSGTZuaCxs=;
        b=DHVkkljh53aJJwFiR07eeF16L+Nd/XdAdmUHBu88M+t4MO6KXRFH2kh8goEMOXnynj
         vAnp5xRqZAe2xcXdFDL/UClJJr32RjARitj6O+rvY2mN9lp/FMEdHGj9kRLr6kHaMhls
         8dHeH8ARVqeltFMKEqna8RsiAeAcfUyuz/P8eLrj6MCRnouRzbzGIaM3adoXSny3LsNd
         iSIlkkUryLp5nSL1+eP8UeEG/U2Jpq5UUGnJeboWOf/9nx9BIIw5x6pVwpnR0A2Xzs6P
         Uxvxl5tt+AkxPxNQDKrN03maV77bLxXIGblIJTTpG09bgRWiyyTs4R2OrVTPeFygx5yx
         9Ckw==
X-Forwarded-Encrypted: i=1; AJvYcCWsakpJXfft+tyMJoUxjPEF2tbKPdagJSavuGcuv2bDHJnF116+X6HBDbgUVuAqgh6fCdFS8Nt3VOK+PCIW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4O+OXZir1sBuYRuKqPtV+UXvUqgKrj52pZs6adTDVN1LpfSIR
	kq4A1y7UXC7DVQQPuKaCwj7UXz1Lhi4KIZW+LNemAdpWyzvftufEiRBKFjqhOITcgfQc+5lU/J1
	zd10KszXtkNj7iANUmYjmwBAZ1ruep5M9t4W/HA2mhFyjuaAqpuQBpP1gGUBES061RxOZ
X-Gm-Gg: ATEYQzwQORU028UEmWDoQckCj1jZYmG+aX4FgM4o516mrsJYihOB2wAa7CY1X/l7BCE
	hO5YAzfTRx0fFSurlxJyWm3Hli+4ZJD9hyUwOkfSMHloWTSw/IsvwVeg5UGkAPmewBGe07hH+u9
	BzSeQATYJ2m+T5v1Tx0+ZC9+NzGS/mudG7+Z2217IFmi/TgU/uya/IyhbOBqcCzT0g15115a8C8
	UamT9unCu4pebUCqY+W12XcWDb4BimkMNC/oImIh3Zel53X4GIR30bywZJcoOpIt01M83sHerVv
	zs2ftSjVP3Di3sa6EVTpAXjI4mJ0GoXksaJpYGlCvxRaubPc1sA7ChGABuxJWOFHnZ1g6EUiSwF
	g2kW0igiZHX9EcwOBEFsMtqv0J2hT4NlY6+dLnl+aNqYyX3d9ku+dSCaeMJEdtONou0J3dK+w0R
	l09gc=
X-Received: by 2002:a05:6214:4c46:b0:89a:4fd5:6998 with SMTP id 6a1803df08f44-89a81ccc828mr123393416d6.1.1773657552423;
        Mon, 16 Mar 2026 03:39:12 -0700 (PDT)
X-Received: by 2002:a05:6214:4c46:b0:89a:4fd5:6998 with SMTP id 6a1803df08f44-89a81ccc828mr123393176d6.1.1773657552041;
        Mon, 16 Mar 2026 03:39:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cba6eacsm550572066b.14.2026.03.16.03.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:39:11 -0700 (PDT)
Message-ID: <7e575228-60d0-47dc-acfc-90489a702d1a@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:39:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: monaco: add dt entry for lpass
 lpi pinctrl
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, r.mereu@arduino.cc, m.facchin@arduino.cc,
        geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260313103824.2634519-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313103824.2634519-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7ddd1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fNMmvbdrdlD2suN_VgQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: guuyTD6GKzl_O2IWLEfF3yZ_OFl_3lxe
X-Proofpoint-ORIG-GUID: guuyTD6GKzl_O2IWLEfF3yZ_OFl_3lxe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MSBTYWx0ZWRfX/eyopof84++/
 a5uFk+C342lrdb6FsDzmLh82wbDtav9qq/rA1GFaE2HxgaCQ5fjT3mzQAZk3DMZPFaohlXN4M+H
 cFtKNLBAk9L+qkod+dRhEDwahWApAoMt2buBeVMBUFYKnhppwZg+jdUj1MBMX2y1r8w8aSqJ94U
 APW40GcR2wg3Ol5KbzzDaIznWGNja5xTv3LiJ55vEzvMswzs4kHwLCERPYB4cuXiThGEKdM/9W2
 o4QvCFQdGEx8ycYwWaURnrFzd0C1pE9JUg4ZjRraYntve7ifHSQ52mDO5gHLmYOrsZVjO3bGD8L
 JT99dBP/b1lSWcP/am2ciB1I+prEgL1n+YEBpVhGNaj37lo5LGQ5bnOu616NGJizccXLjtfcyZ2
 UIhPRIhQPZz+kDofp/ajCd1+zIqYncXgGbX7ozvsy8mQg4A0p3hx2rhM23dGcwQFKAxnQ80Cas/
 tpZ1FFA5X+GH8q9vCwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,arduino.cc,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97907-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A69902980DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 11:38 AM, Srinivas Kandagatla wrote:
> Add LPASS LPI pinctrl node used for setting MI2S and soundwire pin
> configs.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

