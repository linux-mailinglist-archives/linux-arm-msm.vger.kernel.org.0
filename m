Return-Path: <linux-arm-msm+bounces-101082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF2VFC/jy2n0MAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:07:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0156036B6B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56B0C304C50E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 15:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881FC40242B;
	Tue, 31 Mar 2026 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBeSD1iT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YwNz8w1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43108401A3A
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 15:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774969424; cv=none; b=QdRdBhbe3ztQqfe34XiWCuNLINT2GrF9t2nln4Uiy38omEtL1B3cBOSY+iJ2LR0Xu58CiZs+ji4pS9kIGernd0u3DNijRCDexRSf7jYRVY0BLOCXFM8ItX8ZgQDyxsXvDZmJGfgGSAA1pcYk8Xt7ecGPuhofRVHqCj+pNLrI31k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774969424; c=relaxed/simple;
	bh=w6QD941esx7LyJ+VMbF+nqp+RsNrknQkB/VMJUb79Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDJ159//s0tivKOUSnFRLafsWwHcgbTbPrzhcBnECxkd5Z+Qe2Schvl2w09M7UprD7gK2dhYUqm9z17MTkxTF4/+4a7bgJRHKqdSG3w3H6jdZY57cUj/xLtuBgSXfsS9fU7u1wI37GhR5TLpuoyqiBWCUDUk4K1Wd2E3d4Tx8Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBeSD1iT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YwNz8w1s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VBZKNZ1842530
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 15:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x4/VN9KIRjqt9HfZlwUk1P2QbGIevJc/ytb+pN0NAwY=; b=GBeSD1iTdQydDeOj
	M9v+sZK2X6pBotmRs1GyQZSGKTdSk33gPNfzqye75fT7M2ae8bBsdCFmOp5HDQCD
	F161X2m6beT6OV9zftNv3VFaK+YcIBOdo5y2U1HJg6ZGx/vFp1o4nxLNVnJMxTAN
	nvHqbyXIpUVGB5HYAVQvvd94tB67Aff+D9nLW8utSyIC++cr8s9Fcr2j751sbz90
	/3x8adVGEEaBlGYuVQltJhWCSHyilZyjYgb5OHRfIMMIJ2XD2moXZPApeSmmzDZz
	bcXMi03wpwlNfsrdF9PR4GbIRUJ2+UcpxmDd4ksIyIPG/7ja51HAtRm1Qq0qQn6p
	v5t3wA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsksfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 15:03:42 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-604d532d35bso165082137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774969421; x=1775574221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x4/VN9KIRjqt9HfZlwUk1P2QbGIevJc/ytb+pN0NAwY=;
        b=YwNz8w1sAQAIG9a2oU3ACcc7ZQxLpr+nsJNmlVTIeIAH5tivS3MI/pTrJXi9DIwstN
         qQGApINhvR3nwmcFZagAtSePWiR/woLeWmw/M0x1NJSCTcsHMspNTds+/wueoAhXvzNE
         8AVa4R/vKK+3BTv8WjZuY/h3XW/V8kM2aICDg7Z++VCXv7e6Qw3yG/h7Y8J6vTqwY755
         BCwh1JaAHAFXs0yz0NqrEFouFkzwARCAtexDGjhvyIDqJfTn0WV7A3zB/9WMC8DGpHgo
         LIH4Bznq5qmo69gpMQr9Ea0lW95CWgQV89LFjbNUvUJ3DUNFSDldMLXd+RXaCKxWs1iZ
         ooVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774969421; x=1775574221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4/VN9KIRjqt9HfZlwUk1P2QbGIevJc/ytb+pN0NAwY=;
        b=CvQf6+HyfKDA0/TRfPsC0M+//hyr/UZpYdcgdh8PofsoWAn7KRSmPpC4V4Wlxvm5Cy
         d/b48rnYiXxyp/VE0L773r60xz7a0Kw6WwAbfJM6ib0ExAGiOyWqh51HY7xkLS+bdn8X
         lTC48NrkD8uNFgLBnnRpk+j2y/5xI5doA7KyYsE9nnSzMUfzCnBKDCk4HpOQg6Jf5QYj
         6UD4CcTqITvNz4GG7THFqbVlnVuUC9fGQ3bVYOJhK6zmRNvS85a60iLI2Jk15jq8bDQ2
         3ofMmuckl6KWzKojp+C+HW5gcOJuQtE7mOoMezBzlu5OqMJLBAa2qCmb/akiPsMTzPxd
         6uTg==
X-Gm-Message-State: AOJu0YyfRK76HlSmWRwgSoU2xynrNlndGCypvRF8PA/GiC6gJUWEKU28
	oTcv7EyEh55DQ2bGPvjTbXbkNmoEsQ4pbYSTZbR0uuvnGCFWYtbeundJxoUwzKqRSBVA4NEuno2
	ZvYQZfueUrzWecvWr7vvHt2Wn7CX66X+W7qaEYweWAfcH/llk0Ingw/dKqRbIAt6oVfDf
X-Gm-Gg: ATEYQzzXKdaDOLSlrsg+yrI4aoguSKpeEv3u1LqCOmVc1nwV0zkgpdNvXLhFCylF7eW
	1+OllNjr88VaHs0+F/KLOWnprTSmLnMlcAJLitdJ+wZ1F4YWpRak7qAA7ZIg4itXz0aRELJBfC+
	KrV04tMPU5ihd/OAInoSwd+eKk5g1eiGK9G/vOxHUHAw0rkoGG3x2J8rNfeIwYwQA+7efEQkq63
	TchFxupe/AieIuAhHE4ybOu44h/RkhE1UC6qT6v8jJG05q+yHs1oNRDjBVxQ/4bEBdUARvgil+Q
	HD4sGl5WGkzKCGsYG9KXUIo+/gOg8llghHBPx9mpBhKYTinE+UY2GGUbriRrRWsQ0NgW9TX8sLx
	tilb0YBsRTDk8eCnkqqOzwakimy2g0O3/qAeNQmA/OCq65pLB4qRbnzRjOV0A6FN059vTWvhj24
	DVqc4=
X-Received: by 2002:a05:6102:441a:b0:604:deb3:6e2a with SMTP id ada2fe7eead31-604f92960c2mr3134791137.6.1774969421496;
        Tue, 31 Mar 2026 08:03:41 -0700 (PDT)
X-Received: by 2002:a05:6102:441a:b0:604:deb3:6e2a with SMTP id ada2fe7eead31-604f92960c2mr3134759137.6.1774969421013;
        Tue, 31 Mar 2026 08:03:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b22530dsm416060266b.54.2026.03.31.08.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 08:03:39 -0700 (PDT)
Message-ID: <f4ee7476-74d8-4e88-b14f-64835e6e7fbc@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 17:03:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] arm64: dts: qcom: eliza: Add display
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
 <e4cad76c-09ad-45e9-8725-ec156c121bb8@oss.qualcomm.com>
 <b3b96c87-83dd-422b-a67c-cfe41ae94a35@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b3b96c87-83dd-422b-a67c-cfe41ae94a35@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JkLwx88BiXJh3TetYdsZz-bodKHEmmxx
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cbe24e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fGO4tVQLAAAA:8 a=BFScfxxKtYKQDNOg7CsA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: JkLwx88BiXJh3TetYdsZz-bodKHEmmxx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE0NiBTYWx0ZWRfX6vdEBbUr9k3w
 QsFCWNEHPpkDSuiQXq4DhB1gMZfL5mlZTFie9EsTrxUhnttkeRlT48wi6juWlszzijjSMiUT/oH
 bp7E3tjyFEkoQvLZw+qQhOQfK247lnLG6rryVPTg1PMOvh47S/r1LB9B3MTL4qKOzSReWAo8fHW
 7eF0BwWY5mQukXHhHp1cQuiLrn9e9kdhxXtgZzI7V3mQASfyFI3ILx0hRkGzKhZCt+xNjeySw6X
 6StuS2igRPEBmnp//4ZdGHry/C/uZVFs7BNGuWC4nXw9+QRkLR5CBYArWXp7Au4cDMsxnBQ4LUJ
 PRRxmQequuSrolDyFNo0FCwKGKE2ZfZ7Xc5SLXT1SpZPB0JSaPYdcpY1sE0dAtIbTmSBSnQ5Nkh
 FUkqrJObCVe7fzNpgksI+5mW888D38crBqRzfo9rdnfx7wY7beLrq1lUZZkq3QiHhUWMre5yu6N
 02AAVsRaFyOMelHEQOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310146
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,pastebin.com:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101082-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0156036B6B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 5:01 PM, Krzysztof Kozlowski wrote:
> On 31/03/2026 16:49, Konrad Dybcio wrote:
>> On 3/31/26 4:02 PM, Krzysztof Kozlowski wrote:
>>> Dependency
>>> ==========
>>> Depends on USB patches, which are being reviewed, therefore marking it
>>> as RFC as it cannot be applied.
>>> https://lore.kernel.org/all/20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com/
>>>
>>> Unmerged bindings used here
>>> ===========================
>>> dispcc: https://lore.kernel.org/all/20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com/
>>> (DRM MDSS bindings were applied)
>>>
>>> Description
>>> ===========
>>> I did not enable DisplayPort because it does not work on my board and I
>>> don't know why. I double checked QMP combo phy and other bits, and
>>> everything is looking fine, but still no USB display, so maybe I miss
>>> some other dependencies as this is early upstream.
>>
>> What was the furthest that you got? We can certainly try to help..
>>
>> Got USB Type-C mode mux events?
>> PHY initialized and configured to 2/4-lane DP mode?
>> Are the AUX transfers failling?
> 
> [   43.975329] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_access] dpu_dp_aux: Too many retries, giving up. First error: -110
> [   43.975410] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
> [   45.780383] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_access] dpu_dp_aux: Too many retries, giving up. First error: -110
> [   45.780463] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
> [   45.780521] msm_dpu ae01000.display-controller: [drm:msm_dp_pm_runtime_suspend] type=10 core_init=1 phy_init=1
> 
> pastebin: https://pastebin.com/BVXy3Qeq
> 
> Abel pointed me to the phy problems, so I focused on that.
> HSR says it is exactly same programming sequence as SM8650
> and such was used.
> 
> Just note, that we have ADSP remoteproc up, but no audio including USB mux,

Are you talking about wcd939x-mux?

If so, you need that or the lanes won't be properly connected

Konrad

