Return-Path: <linux-arm-msm+bounces-102433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D1GKP1g12keNQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:19:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A263C7A7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C7A73002526
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6113A4518;
	Thu,  9 Apr 2026 08:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XS3FDH0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GV0a4DQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721223A1E8C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722742; cv=none; b=UVOsjglL0NLk88AbFTQSTePCdb0d0/dzW/skMyi7df+5RnCH2saR9WyGaEpyb5VjnFdQtxEkjSNcGmOwGw4feQ1lEf02q8YzumrwanV33wiIPNIHlp2JskzeY7VY3XKh0QCteuGlLoLaZI6oimnMlxpqkJBnHR3NviA5Hel92X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722742; c=relaxed/simple;
	bh=6mMHTYpg3tnj80PaMkaXbeENESN9DNQ9bb2lP3rCcpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WwS3o/O7ESKhbeB4odLkFSZos7EB6lpusLkZ47FlPiQUz+MbMXhoxvyNSqOOL+bw2XaDrNZiaYjHTNDiDqScwr65CDBcUFNX+HiMdvF1JSMwY7UJT10I2qmKVTqSoIE8YlYRIhvZT2kfQUFWJ3Wvs4WLIJ66xM+pLggHpUowJkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XS3FDH0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GV0a4DQY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394ZMeA2618200
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 08:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	142GNnYSU6d3FVCHi/ShZiVXXO71kNyAO5uT6ivLtnI=; b=XS3FDH0eci9v8mGt
	KZjRkIMheID5X211cvA8p8TjqzVqq6Nvt9TN8YmqD9UZGGA0CPdpBnZUQVemCNDB
	FFZaWapSS1imgxFH0lIBZam36/HqMsBQQHtVEndWTlN253sPjTEOG0Q1G4EDs5Oc
	pfwoH5t+qB/nR/R2tFPcL1IIlIvV0HMx6ZIZ0qEgLmqFWrmkrO685PjHRcoIqfjt
	ZWruGu/MCMdMrnLamqaYYlplbZ++GmrKVnSVWAC7REWBnpC7k2gqUBJukkrl1M1/
	19uBjB1iTGqaLSFq8IhlVFw2a3aBKtTdGoE4oCRD4TEmrSO0TNliOI3z4O7h2q9q
	LkB9xw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt28u5su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:19:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d45ebdbc9fso8787785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775722740; x=1776327540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=142GNnYSU6d3FVCHi/ShZiVXXO71kNyAO5uT6ivLtnI=;
        b=GV0a4DQYLXW6IiRO4FM6MlKXYZwSjCxu/TaRLInEtwdNDNZB85YOvUpLGIQLgZfE6Q
         a4vImr/Xl9lOYjTuqQ15lB3JtKKATlZ7hhycHVL2GB2snINBILpWnMuIEte/zyroqf3m
         Rr0NDYXym8+88UZ1dGAihFwZoE6BtSVNh4W4b+3n9OhNADtV6/q4++ZkbAwVBOC8hAMo
         08xU5ePE67/uNUwJf2qpquXRcUlmNL/L1qjrvxtGW1Hx/sSVZ/XKoZ79MYhpEObma0V3
         KJ9I34Q2Yxs4zWlraLnWsUr+vxkgKlmjS22Vg/6x1A/jjwWSnLdel6c31OZpyhYLptjI
         MfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722740; x=1776327540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=142GNnYSU6d3FVCHi/ShZiVXXO71kNyAO5uT6ivLtnI=;
        b=UyxXd1bwwF7SVf9aEFBnpnb1lQWSHnX608aFKpL3ELzlGWXZaM5cyKYrFXHE5Vjcu5
         843iqRrTh9D+su6MJNU1SWpAjfnDZB91mR+VTFQpEZ7lDZY9yDdo1ztr7XZZyBaBTUHg
         glvUMVEsm5YymPhPmYEBh9BTWVsPvrmJSYii0LeX+SLOd2EOWSb6uCe1HBFzdHiM0/Gp
         HH7F7HWEq8pkbuFvwSvNeOtLHh4SeQCEy6iP3LOU75OE6t7N4InQ40YjYOIt0lE1L6gl
         ubGtmpigXRkVp5uB+yHKTigiyeS5X51a+m8iruUqJIKTwspMw+Y39SJ3H3ZA2JqBbD6c
         fcvg==
X-Gm-Message-State: AOJu0Yw6TGGf1j3amJbt6WGobjn7FYUE5mQQGQbzdOSct43HJTBL1ZXX
	d97p/hS6bt46jiZ7ESnpNpicGhw5anjd95EbNroyGn0lipW1XeZpH/1RdVpSklS7O4I7IhyDVFW
	S490EGwq4BoKNgr92a3dGxjtoHNc4PpL4AY5YwwYlLF1i5U/VEXJ+WVeMAUInU3Y2kJba
X-Gm-Gg: AeBDieumPsDQC7Om/Y/OROqNNcVfgsbdiIvfjzE/1QH9gKYVzKNVUA0gebEOihh1i+J
	jAvXI7EOlC212V5+6fFcddqrEgkYsCv5aDHKQ2j0rjE2OrrVMBvDMuCn8/u+e3AMlYB37QXW3n+
	Ko9TR0vWn1icsaU4fTKHNFiVYaG7U1cdCLxR9GScI2+Kb+I6SOaW03K54Rgmf0f2sZtg6TwYKWp
	RrHazwYPyjUFVeoTEJyXJcIHUHgr2imA2AdUjLJASBhZCPBUNYCX4yWY5OI+YmibKz8Y2qTOHnL
	Jnh/L8h+zbLV0SNVS3KJyo7XEOO5mxU70ModdP6+1xicOgP2A5WTrI6kXLo5Xkrv9u8HA+JG2ZJ
	7KQjilwPCvCH4es7wUYQAoN3NDEFxgvnqkJ8vNpYYfyvhEuuZnXFzhRGsbGotmreI9prssvix7W
	dyKHw=
X-Received: by 2002:a05:620a:460e:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8dadc4dede9mr743429085a.0.1775722739927;
        Thu, 09 Apr 2026 01:18:59 -0700 (PDT)
X-Received: by 2002:a05:620a:460e:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8dadc4dede9mr743427985a.0.1775722739511;
        Thu, 09 Apr 2026 01:18:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d37620sm5500422a12.2.2026.04.09.01.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 01:18:57 -0700 (PDT)
Message-ID: <0bcb76af-35d9-49e7-b3e5-32e62e897211@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 10:18:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm845-lg: Enable
 qcom,snoc-host-cap-skip-quirk
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260408-judyln-followup-v1-0-823467519b59@postmarketos.org>
 <20260408-judyln-followup-v1-4-823467519b59@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260408-judyln-followup-v1-4-823467519b59@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 82PPsM_kyJ4tWcfVjzCB7GtqQCo1Woob
X-Authority-Analysis: v=2.4 cv=fIIJG5ae c=1 sm=1 tr=0 ts=69d760f4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=yndPCfnnJPvdZL5cpNsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3MiBTYWx0ZWRfX+AoQIXQ+R3Ya
 2XyaaPlA5DNwjp12XT6uqzRVMP2jaUmK30EDVQNYjMrwALbiuYNlLA6PQXvn+dDpDm/BM/d7lG7
 Zji6VBo2LJ9mbhe4ROGdNdAftKRLVFviajosNcjTIYuDrTjC6F68s12BfeSfTsSSZF4mWpIC7/o
 YqaXEw67T/P2bv80uu28zFLK8LyKGEVb+gTV6rvujU9e9UP9UTlgXzDOK8QJ9Ku6SmFq559qeON
 ZymUAt+1gEgpze3B5VghblIyADQmxcLiiRA+MxgZwGp9eCcBRw9gNq3d8d7nMZVjtnHz6eUEksP
 gdWB8VjQ3L1DAXwK1apNJfV8B8r/MoPjYjWHcLS9ajRN3fU/A6Ul69YIiOdX5W2Y0qlkPp6vNag
 6yF7j5w3er7qPSjtKhE0Nb/7sLu1N4okuOX5TETiibP/LiT2/kFurnLsRlxQanGEbgqUXUik1wg
 w+r5S1EZXSJxy5RXjZw==
X-Proofpoint-GUID: 82PPsM_kyJ4tWcfVjzCB7GtqQCo1Woob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090072
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102433-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,postmarketos.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94A263C7A7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 4:41 AM, Paul Sajna wrote:
> The WCN3990 firmware for judyln does not respond to the request for
> host capabilities. Add the devicetree quirk to skip this request.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

