Return-Path: <linux-arm-msm+bounces-113834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B7qKNXAzNWppogYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 14:17:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E676A5A3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 14:17:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CXAgDelr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ILCjwc/l";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113834-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113834-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD2D9301907E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 12:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EAA37C11E;
	Fri, 19 Jun 2026 12:16:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2C6360EFF
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:16:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871379; cv=none; b=f0od2LgCSoEovp2M+IeBnJMEH5BPn4HrCMHCiq661Z4yQ/AgdX0xZC4Szki4CZAVnA0rnVNCl0r84XgsvrnZk7pTk5Yk6s9gWP2Z2iv3RurmOUM0LzQwMQ09h04SaUMs6g5CcJpThQyUx+vq2N1Nuf/V7v8lRq5rctib/MZ1GTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871379; c=relaxed/simple;
	bh=ED8GY2Ql9zXP3sXEqoGNm6cmV3nxLywmPPhdP7ZpBdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7EsOb9qXF45O3ppfXctk9nAfxjpKjj7ezpv5C2Bv3t4xD14iSkNk0DxGR3sDkDN0HxYQX4nCidQU+DleQvLqXve4WARmjkRA6tYIfHvbMKHAzBzY3v2+GoMwvst1DT2g7a2m+HJrU+SmHH83Qb3fnohypvhGFs6r00VAINTpWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXAgDelr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILCjwc/l; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7S7Wk4001647
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/JFdbm3jFGcHEjdKpE6xYqBMxocBBsAJf8vwRLPtbg=; b=CXAgDelrpdtRYTnn
	37LM85PWEl4djNE+sjEqRNMcv7cPtFFuqZyljhFUH0JyepCxgZuZY+vI60GYQEbX
	trNf4ceUKely2K6FTFy29BowW0W/YVvyNH4cBGZ70gLrwoItszovcKFZUFOF+IG5
	y7l/ymQj89yXdUvAP1Gkd0R/rKmeIg4EskRwwBqrg57OiGaob4epi7vkGeSsL11k
	z+Ss++Rpd8+ELmPRbt8YF1sMghrIri+2MT96g/SdxyX5B/anSKNg49ro4opPkJSC
	D8BMwBggKQWEvpIvUM8/rpR0VZ+yT85S3jBICH2w0iP6Tj/8960PDRqAkRSFLmju
	WBg3zQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evpyutv37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:16:12 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e713779405so3751005a34.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781871372; x=1782476172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/JFdbm3jFGcHEjdKpE6xYqBMxocBBsAJf8vwRLPtbg=;
        b=ILCjwc/l9hROzu6FsDEhprFZiCS9xifMamX5BQlR1NXNZQgtda9PRXqSBzJFDif58b
         RsCcNiNYhZMaQCQ0qwz004m8rYakxzGWxIroWG4Fdt8CPG7H9wLLEwBRUmtF82g3grzf
         b9brPY+E0pKV5fHAE7wtwJD+exKg7nr8o4QKoP216DnnDd0PyvD2lUm6c8rpIFTKbJLM
         AYVmhxbo5j2IY0IB3kjbuNTA3UAo6d8aKUdAVyX7CI7GOYFG1Y4debj537AANMalrzXE
         UtakjTKgxFY54eqqS8tJ2lsPqxUdhDtmGjH7Wuh1UrlqTnjR1k3faZeJL7kG086ifBZ4
         0HQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781871372; x=1782476172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/JFdbm3jFGcHEjdKpE6xYqBMxocBBsAJf8vwRLPtbg=;
        b=YQy1xx+L4do1Hbf5TiNL+7ykTRMIbiKveK2hcLf2JdGI0QqYp+tik12Xr6WC217ygn
         dJNCtQKuMT37zGueYWc9CVcZQGwKS3RyJCSPGiuu1S/gn1KKbvjN8XAyvnP2pKrOxmt3
         SOTJp79obDNxcjl8xtQIn+qmGuWPrCtn4w+98JdRWEIm7S25ueCrM7gT8hd5wjCqmcS5
         GoCc8NvmPgtJyJm1SPIDJ06qfb3Lq4w3kvsr8dI2qQQh6LJ+t0MhQG/UWboUmDD3JSU5
         ndU1wcBwUkPnAPtv8KLZJQuLnkhseUHmk/ZPN1o3IpcLDkYpp1CO2fNSp8UtSQrclv0I
         JCtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ph7cAsjdvS/RCSBxoWHLxG2rQMxDwXEg8BnRI4wa3YbKd4ZUHPP/4EOTzUB3IqHFHTaUTCWdio/JDx+8/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzllha0XclEvshXBRYYZI8bZIdPkbXOLQ+yoWCbBDTDqidmQQ7R
	4kcN4LB7XKSlZKio39DeRbnnanTy334GOvkrBJGecw4hGmjCjULyvjUOX+zixt/HZ1+/USC2SHV
	gizEVLEeohT82T7ezKy4RSaiX6ro4jvgOoVlw0RtFJ8mzRIetD14qWSckjaLNVOmJOuqV
X-Gm-Gg: AfdE7ckJKy4mHO7B+FH2cT3B5X06DiznOQr4dpmq9Pco8YaTKVLYOJ5yr6KhLDINXm0
	3w8ANFbpRexlGAmcVhODRQltQQptfYHrpPjhP3vPYpR8w27L+0FfvpWNBb2N/uq8Ipv0cFJ4ZFM
	XINopmwbn1cA3dO70CGTv6nLONIEqa7NSr3ppB2bMZCfF4bfgMExP6NEHO94C4sZnI22OqjMfq5
	CNMsC+gjwu1ohODChSPP8kR+muUmEVpqC6hW3epLoWKR3bdaomr7QXfjOxen638SiTfqP5Wq0ZR
	8y4318kExqTwI/qMZmoTEv+38ULvFsUvy9EgAiW60cqR5+vLy2LjJB1mfvN3YgujE6cCnA4/gtQ
	WU7uPbVZZORSA+HvNxv4ETXLWYnp8GrM3MBp5r7SHweFSZN59+MJm+7TyWdIHR8Ie8Mulp/0=
X-Received: by 2002:a05:6808:10c2:b0:485:a99c:cfe3 with SMTP id 5614622812f47-4896acd3ea4mr2993186b6e.42.1781871372095;
        Fri, 19 Jun 2026 05:16:12 -0700 (PDT)
X-Received: by 2002:a05:6808:10c2:b0:485:a99c:cfe3 with SMTP id 5614622812f47-4896acd3ea4mr2993143b6e.42.1781871371612;
        Fri, 19 Jun 2026 05:16:11 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ebff:f04f:848:859b? ([2a05:6e02:1041:c10:ebff:f04f:848:859b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc428d9sm7619400f8f.27.2026.06.19.05.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:16:10 -0700 (PDT)
Message-ID: <05abd4cd-8ce8-4ef9-9dbf-4eeb9a940a1f@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 14:16:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <hebyboondtxyyetwuwggoiysurz335xzn7asf6yit3qrexap3x@kngk2m5xum3x>
 <93e7251c-c75d-4e43-9ae2-bf485af58de3@oss.qualcomm.com>
 <mp2hl67rupxrssa43dcy36m3dwatlxsu7n27l7qdqsguo5i3bp@bo6sdzxglxt2>
 <dcdfe9f4-aeec-4d85-92a1-a42592fe11c8@oss.qualcomm.com>
 <4gs664zboaqgpok33x7bgorfmhh3f2fahjkt4jjl6fbzpwixnm@hxzz2xeogd4k>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <4gs664zboaqgpok33x7bgorfmhh3f2fahjkt4jjl6fbzpwixnm@hxzz2xeogd4k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExNCBTYWx0ZWRfXy3gSfk5+ERFx
 WN6oTCKAEn6L4R0gaO7LzvK0Vvp2JGond9rlPvZKT+IEl2ZGkmt1Oo81taayhF2EeUCpDkdXqo7
 EtmAczWM9G+4IfbPZMGGbqJzMWbM85Y=
X-Proofpoint-GUID: tr7g92ItnMHuZMrWd1FjUel_-Jj4bSzd
X-Proofpoint-ORIG-GUID: tr7g92ItnMHuZMrWd1FjUel_-Jj4bSzd
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a35330c cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pTuXCbNxmSvcstPj0wYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExNCBTYWx0ZWRfXxEGnMQEN8y+E
 L7RvthzDUFgYxfK8DsAg3f0PPVNudpqBxlr2KPJ7tk2XkJntYltG403zXGfINw5Lqh7ks1l2wHb
 81ThEvZBU1LoAIe5bLbHvTnPs4T7+BzQbVQkjl3TwI1gIdu27XQIj43K+K5o1v/893pg62JdqEj
 xlzqFVkUTg4pZOo9qVXKNXZzx0SyT/e/6FUbZac5nB89cTQ+JXGkgbbF7xlrFPfhOjXTuYb0gNF
 LJlH/hEuUAXRh7plLd6GsXWpW4THOKbbWiDWN536d2DAfQ62Qrl48zeSVM2U9rh7NOm+wjcYWlM
 y5utp2qJUjN0cfzCzZVu1fHm12zbDG9xXOvN8oyHaJZJQMIuNpgAOY/VeZ0e/bviAl1J3nsBOjB
 AdZn5lCPkEZ1Cfuog9szPQWF4tKoRdnHvshcW2JKGO6bezuM6tfl8DFQgF5SyUmyzHPsh7ThGfq
 QTxWd1P1EcySxcZ4+Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113834-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72E676A5A3B

On 6/16/26 00:15, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 05:33:15PM +0200, Daniel Lezcano wrote:
>>
>>
>> Le 15/06/2026 à 17:14, Dmitry Baryshkov a écrit :
>>> On Mon, Jun 15, 2026 at 04:33:38PM +0200, Daniel Lezcano wrote:
>>>>
>>>>
>>>> Le 15/06/2026 à 16:11, Dmitry Baryshkov a écrit :
>>>>> On Mon, Jun 15, 2026 at 02:30:49PM +0200, Daniel Lezcano wrote:
>>>>>> Hi Gaurav,
>>>>>>
>>>>>> Le 15/06/2026 à 14:12, Gaurav Kohli a écrit :
>>>>>>>
>>>>>>>
>>>>>>> On 6/15/2026 4:04 PM, Daniel Lezcano wrote:
>>>>>>>> On 6/13/26 13:05, Gaurav Kohli wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 6/13/2026 1:11 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>> On 12/06/2026 15:52, Gaurav Kohli wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>>>> On 11/06/2026 13:12, Gaurav Kohli wrote:
>>>>>>>>>>>>>> Why? And where is this generic property defined? You cannot just
>>>>>>>>>>>>>> sprinkle generic properties in random bindings.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Ack, will add why part.
>>>>>>>>>>>>> These names are matched with the thermal
>>>>>>>>>>>>> mitigation device identifiers
>>>>>>>>>>>>> populated by remote firmware over QMI and define
>>>>>>>>>>>>> mitigation devices are
>>>>>>>>>>>>> exposed as cooling devices.
>>>>>>>>>>>>
>>>>>>>>>>>> No, -names correspond to values passed via DT, not
>>>>>>>>>>>> some remote firmware.
>>>>>>>>>>>> The remote firmware should give you interface which
>>>>>>>>>>>> is explicit and does
>>>>>>>>>>>> not need such properties.
>>>>>>>>>>>
>>>>>>>>>>> thanks Krzysztof for review, We need tmd-names because
>>>>>>>>>>> of following reasons:
>>>>>>>>>>>
>>>>>>>>>>> Following Daniel's series [1], the thermal framework supports
>>>>>>>>>>> mapping multiple cooling devices per remoteproc/device via indexed
>>>>>>>>>>> cooling-cells.
>>>>>>>>>>>
>>>>>>>>>>> 1) The thermal framework's cooling-maps reference
>>>>>>>>>>> cooling devices by index (for #cooling-cells = <3>).
>>>>>>>>>>> Without tmd- names,
>>>>>>>>>>> there's no way to know which index corresponds to which
>>>>>>>>>>> TMD, as firmware
>>>>>>>>>>> may return tmd-names in any order.
>>>>>>>>>>>
>>>>>>>>>>> below are the changes post new thermal mapping changes:
>>>>>>>>>>> DT: tmd-names = "cdsp_sw", "xyz";
>>>>>>>>>>> Firmware: ["cdsp_sw", "xyz1", "xyz2",]
>>>>>>>>>>> Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)
>>>>>>>>>>
>>>>>>>>>> names property are not to instruct drivers to register or not to
>>>>>>>>>> register something.
>>>>>>>>>>
>>>>>>>>>> I don't understand the problem and explanation in the binding is
>>>>>>>>>> basically non-existing.
>>>>>>>>>>
>>>>>>>>>> Remember that all lists and indices ARE FIXED, so driver knows exactly
>>>>>>>>>> which index means what.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> thanks for review, shall i use driver data, which is basically
>>>>>>>>> pas data structure like below:
>>>>>>>>>
>>>>>>>>> static const struct qcom_pas_data {
>>>>>>>>>         .crash_reason_smem = 601,
>>>>>>>>>         .firmware_name = "cdsp.mdt",
>>>>>>>>>         .tmd_names = (const char *[]){"xyz", NULL},
>>>>>>>>>         .num_tmds = 1,
>>>>>>>>>
>>>>>>>>> Is something like above acceptable? and this will also help to
>>>>>>>>> filter tmd names as well?
>>>>>>>>
>>>>>>>>
>>>>>>>> How the thermal framework will bind the thermal zone with the TMD ?
>>>>>>>> (node pointer, id) ?
>>>>>>>>
>>>>>>>
>>>>>>> Hi Daniel,
>>>>>>>
>>>>>>> thanks for review.
>>>>>>>
>>>>>>> With id only, in this case instead of taking tmd names from device tree,
>>>>>>> qmi_tmd will take tmd name from pas_data(driver) and register with the
>>>>>>> cooling framework with id only. Please let us know if this looks fine.
>>>>>> May be I'm missing something but:
>>>>>>
>>>>>>     - The QMI TMD returns a list of names, not ids
>>>>>>     - The QMI TMD may return the list in different order than assumed
>>>>>>     - The cooling map index points to the name of the TMD in the DT
>>>>>>     - This name is used to match the name in the aformentionned list
>>>>>>     - The index in the list and the id in the DT can differ
>>>>>
>>>>> Would it be better if we define standard indices for the standard names?
>>>>> This way we decouple the actual firmware strings from the DT.
>>>>
>>>> I don't think so, it seems to me too fragile and prone to error.
>>>>
>>>> It is a remote proc, an external subsystem. The contract between the client
>>>> and the server is the protocol. The protocol specifies the identifier as
>>>> named strings, the TMD names, not numerical identifiers.
>>>>
>>>> When asking for the list of TMDs, we get a list of strings. But as it is an
>>>> external subsystems, may be tomorrow someone decide to send list ordered
>>>> alphabetically, or per number of states, or whatever.
>>>>
>>>> With hardcoded id the QMI TMD clients break
>>>
>>> I was thinking about something like:
>>>
>>> #define QCOM_TMD_DSP	0
>>> #define QCOM_TMD_PA	1
>>
>> Ah ok, it is correct if:
>>
>> tmd-names = "dsp", "pa"
>>
>> Or
>>
>> #define QCOM_TMD_PA	0
>> #define QCOM_TMD_DSP	1
>>
>> tmd-names = "pa", "dsp"
> 
> I was more inclined about having the standard indices for the standard
> mitigations.
> 
> BTW, I checked, which mitigations are being returned by the DSPs. Few
> examples, just to provide some context.

I don't know if you are missing my point or if I'm missing yours :)

The QMI TMD protocol identifies the TMD with strings. There is no 
guarantee the ordering is kept if there is a firmware upgrade.

The ID is to connect the cooling map with the remote proc node index. 
Its only a thermal description not related to the TMD itself.

> SC8280XP, X13s:
> 
> TMD service: instance=0x01 (adsp) node=5 port=9
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x53 (slpi) node=9 port=9
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x43 (cdsp) node=10 port=8
>    3 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
>      [ 1] cdsp_hw                  max_mitigation_level=1
>      [ 2] cdsp_sw                  max_mitigation_level=7
> 
> SM6115, RB2:
> 
> TMD service: instance=0x00 (modem) node=0 port=20
>    9 mitigation device(s):
>      [ 0] pa                       max_mitigation_level=3
>      [ 1] modem                    max_mitigation_level=3
>      [ 2] cpuv_restriction_cold    max_mitigation_level=1
>      [ 3] modem_current            max_mitigation_level=3
>      [ 4] vbatt_low                max_mitigation_level=3
>      [ 5] modem_skin               max_mitigation_level=3
>      [ 6] modem_bw                 max_mitigation_level=5
>      [ 7] wlan                     max_mitigation_level=1
>      [ 8] wlan_bw                  max_mitigation_level=1
> 
> TMD service: instance=0x01 (adsp) node=5 port=8
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x43 (cdsp) node=10 port=8
>    3 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
>      [ 1] cdsp_hw                  max_mitigation_level=1
>      [ 2] cdsp_sw                  max_mitigation_level=5
> 
> 
> SM8350, HDK:
> 
> TMD service: instance=0x00 (modem) node=0 port=22
>    28 mitigation device(s):
>      [ 0] pa                       max_mitigation_level=3
>      [ 1] pa_fr1                   max_mitigation_level=3
>      [ 2] modem                    max_mitigation_level=3
>      [ 3] cpuv_restriction_cold    max_mitigation_level=1
>      [ 4] modem_current            max_mitigation_level=3
>      [ 5] vbatt_low                max_mitigation_level=3
>      [ 6] charge_state             max_mitigation_level=3
>      [ 7] modem_skin               max_mitigation_level=3
>      [ 8] modem_bw                 max_mitigation_level=5
>      [ 9] mmw0                     max_mitigation_level=3
>      [10] mmw1                     max_mitigation_level=3
>      [11] mmw2                     max_mitigation_level=3
>      [12] mmw3                     max_mitigation_level=3
>      [13] mmw_skin0                max_mitigation_level=3
>      [14] mmw_skin1                max_mitigation_level=3
>      [15] mmw_skin2                max_mitigation_level=3
>      [16] mmw_skin3                max_mitigation_level=3
>      [17] mmw_skin0_dsc            max_mitigation_level=15
>      [18] mmw_skin1_dsc            max_mitigation_level=15
>      [19] mmw_skin2_dsc            max_mitigation_level=15
>      [20] mmw_skin3_dsc            max_mitigation_level=15
>      [21] wlan                     max_mitigation_level=4
>      [22] wlan_bw                  max_mitigation_level=1
>      [23] modem_skin_lte_dsc       max_mitigation_level=255
>      [24] modem_skin_nr_dsc        max_mitigation_level=255
>      [25] pa_dsc                   max_mitigation_level=255
>      [26] pa_fr1_dsc               max_mitigation_level=255
>      [27] cpr_cold                 max_mitigation_level=3
> 
> TMD service: instance=0x01 (adsp) node=5 port=9
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x43 (cdsp) node=10 port=9
>    3 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
>      [ 1] cdsp_hw                  max_mitigation_level=1
>      [ 2] cdsp_sw                  max_mitigation_level=7
> 
> SM8150, HDK:
> 
> TMD service: instance=0x00 (modem) node=0 port=21
>    6 mitigation device(s):
>      [ 0] pa                       max_mitigation_level=3
>      [ 1] modem                    max_mitigation_level=3
>      [ 2] cpuv_restriction_cold    max_mitigation_level=1
>      [ 3] modem_current            max_mitigation_level=3
>      [ 4] vbatt_low                max_mitigation_level=3
>      [ 5] modem_skin               max_mitigation_level=3
> 
> TMD service: instance=0x01 node=5 port=8
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x53 node=9 port=8
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x43 (cdsp) node=10 port=8
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> 


