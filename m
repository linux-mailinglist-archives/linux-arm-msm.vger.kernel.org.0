Return-Path: <linux-arm-msm+bounces-108446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePhIMtVADGqqawUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:52:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AD657CE01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5065F304C9FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AD7370AC7;
	Tue, 19 May 2026 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8J5oJUy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvYVAxVO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6F5233955
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186956; cv=none; b=aMW/Dzmmiz4N5UJf11neDNggsMz8ZqJr12WbThuSTONHef5VXMFKe+yhcHL0YTZX4AsAxzsr12SCWoUIYqfIMJI3l33O266txl2zbEpLpd26EadB0RuThxPm2YO3lCxrT/KHGUHGwstY8k2kE7TeJo1XA8UOAH7qDt+qFdbza/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186956; c=relaxed/simple;
	bh=BJ28QJ5EGSf6/hdTjCUG6rChBi+ee/XSn/fFhwIkwng=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DfJHE+UV1Vux41abZgt8a+Nk2JWaDxEeQDspIIdQXogk1Y+mAAnKYhdCYQn5EqAF/dhUN0ghSt/pPaZKU2F/kSMW3O036jfY4wORdpZ0S+4gYnLRZG3KLRBNcEWvM63bWhO4eGLeNra4yARChQTK3J1BxNh4cL15/vcozh+Gmfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8J5oJUy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvYVAxVO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9vCk91054939
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFJ1rbWn+aj570gFCWE8mOVRecu5EAmldLFu6NIllxM=; b=J8J5oJUyPx1Zo6rs
	HOm0qgMVulhJ23YFOWOQjwv1m82pb3hz/qFIm6Pze5wfY/C9q0D6DnJiBBTlJfIM
	rpmZSs5buggTV8uSmLhrIrN9+LvB0ZCy7kmmGAKumrQKrny1FXD8kGXW15kNHgOv
	bfsbVemUkjAVMCe83RJznDE/znbt5eJ/2imYAWCkGlQ8gjQNdOfQE7toD2FBsf/r
	OfBltj7P9HoBxJZ6e9XQwWSdBtMGS/jFZLFPTSdQP5kaycuT+bgTsIFNJqJVMjVD
	2hxiODFcEl27C24gLyyJPuci/B0WFVh2Uz30UMebaIiZaFila4kdwL4wtYEtc6Ta
	MLF9Wg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8npar4ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:35:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d840206c3so11719241cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779186952; x=1779791752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DFJ1rbWn+aj570gFCWE8mOVRecu5EAmldLFu6NIllxM=;
        b=PvYVAxVOpAbg9ul+CBWwcTsV1TKTEbQL6pLbswarlabPfScrLRuHCZtU/OQlF6VuO4
         5CmKof8CzT11fFGFXO59Mc7e7BFgtPrNqshfdvSeCf4VECXXOxyPlx/Mq54lWSikj3jx
         3y8o9yqb0JV4loUegl4x+8v56/fgsn3MoANpkqQnrRXTKKrFxYFYVNQquqNh6UqLCkxc
         RZMumsjALf5BKFjsbyVSC2dCa7LR7IWsc0CIJcqJCsio4cAPWVnhEHezml/BRMqIM3Zz
         UaBGy2ffDKE8SQ0wUc22D9Z54CBHcO9BCWyugo/GNfBznEWYKqJHvnleV67nvfmdrT+/
         TkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779186952; x=1779791752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFJ1rbWn+aj570gFCWE8mOVRecu5EAmldLFu6NIllxM=;
        b=gve1wsH5M5Gh9zhCgFU+0uCZr9yc20OIQn0OM7bVVNe2xozbtmwc9704KUQZF7kMIc
         HKwIuFkdM285cSDD/r9Teg4dAtIzDSTNSshMKNjwDavHenHvpc4LMFdMPDofVxwmlvua
         1ctkyKu455yeKvd6LuQ+rOX9HtlTdeJ+Ukv7KKzYElD4XkFAajZFHbxZnrSj5a0oNiFE
         ynnJP+gMpSLkxZYltWw70032m1enHIKLhWPtoQ/7ZJuOP6mRn60LWPMDyXUUZaC5PrDm
         50PMgnSg3A/B6BKlzDZLvOFLgrV04rlRFe7ITT+A2RTgJ0wjbeRaxy9EOfxD+xwWftSJ
         7F3A==
X-Forwarded-Encrypted: i=1; AFNElJ8KzDJNmNBkchxExB9tNfBkttJyCFY8E0C19ROCfPLPBJWe9pZmrMdjVQazmbciqe51nquEWsocpkSXF6Rf@vger.kernel.org
X-Gm-Message-State: AOJu0YzmxBbBGiP/e84bjt0nbF1zFAoYZXevIGGz1vScRNw9lN+0h0Ey
	0bEoe48jBETChm0TYnkZHD/5BaTZ4hbyk4zf77WZCNtcnA7krCs4BH1fJWQC/aFIAnVKRp3IxEU
	IU3/eyWw/sAdiFwgCWHIA84tpz7HQ+JEb4XlIWMfzswSU6xZkRq7yZaO7xfR4ysTqb9Rs
X-Gm-Gg: Acq92OEV/GmYILypcVGX9QfRr7nNElFRFAiw7M0X7sytm0h5R6E91wX1BiXy+nmr/CJ
	r8wWY7AHwRIrm9S/cXqaNQYGqlctLyZ906oOiVXvlFEtvvqMzStadvuzFe0w5NzEBhMclNwjl7o
	bQrYFk56DFGKoBf6MFrDyBupdiVFqAj02s1jAjTNt2Tp0oRuBvUdZEGQjMdnzkSprafdh81TvDS
	7fB276phbQY2ytYpGCXp/lNPZgH+hORlGzzWK2bZSTurKKvbfNqNbwkMK6lDdycClosbauiPKtd
	LZ+qrKDnhMb0MCoRSJEJ8l1lEo5I+GibFDD1S0Ejrq2Y7nk6c8Og6ETcMhd1zG3VPTq4Eyc07QS
	u+oqwmQLJohnjSzRL+t1QKJVhxJEetL+t0TEK03RoRKSZKNLwr3NGSMbIePxVabvLZ6ovfhapIe
	69ZDI=
X-Received: by 2002:a05:622a:4a:b0:50f:a53b:9cf with SMTP id d75a77b69052e-51659fadfdbmr200593361cf.1.1779186952498;
        Tue, 19 May 2026 03:35:52 -0700 (PDT)
X-Received: by 2002:a05:622a:4a:b0:50f:a53b:9cf with SMTP id d75a77b69052e-51659fadfdbmr200593031cf.1.1779186952067;
        Tue, 19 May 2026 03:35:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c31494sm683369066b.20.2026.05.19.03.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:35:51 -0700 (PDT)
Message-ID: <7c1156e4-a5d1-4914-8b64-b1b54686a9b2@oss.qualcomm.com>
Date: Tue, 19 May 2026 12:35:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: typec: qcom-pmic-typec: Drop redundant header
 includes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNCBTYWx0ZWRfXzVpgHd16vuI1
 82nfVE4F8+3GBtYUIlYGnEVtUi13HSokpnadZ87NuJXrB0fPH3VoTNK3HWG2FcWpsCWClGx+D1B
 qgpqOsFx53jnxxDmiTJYB6PTIr9AiUCUh/bHBtDtXUJuL0XE9ycbIi9OP+Brz1iYbNq+HZrchDY
 8pp15QmNYwB8887cWUKqypjhJ57rOJGJoYIsQRUUf0y+VuvLhygxLIWxA8TimhhN7x4lox+YH5v
 NByRpuxny/nGTLLkWIDg7+mBAtKtG3aMsakywa8i5ZMjqn9gOlgAkyJ64IcJ41niN//MPa9iIXn
 MEg6QfxdYPkjKFhy6A5DSbEYgi7gT/R/PktsgkW1Lg1trQc+Kn/0ch7kL58OD3lodLUKUQChZyw
 yBjSrca8wYURDZWGXTGjDifkC+XwdTn8V9S2BJPylpDn1Zs41RQFEB2WE1J5GA5+UA7rLARrpl7
 7mjNB5tU59o21ffJuOA==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c3d09 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0HbNSHcTcvsgiZiMWyMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: We13k0MbvOKu-2mXh_GF9Q5BVGX5Z1kk
X-Proofpoint-ORIG-GUID: We13k0MbvOKu-2mXh_GF9Q5BVGX5Z1kk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108446-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48AD657CE01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:00 PM, Krzysztof Kozlowski wrote:
> Unlike other units in this module, this one does not request interrupts
> or regulator supplies.  It does not use OF graph, USB role switching or
> TypeC muxing APIs.  Drop redundant header includes to speed up
> preprocessor.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

