Return-Path: <linux-arm-msm+bounces-106582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH2kCVeN/WnWfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 09:14:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4A94F2DF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 09:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0CFA8301D5AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 07:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4596035F607;
	Fri,  8 May 2026 07:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNvSF2hA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iW05fjFM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305B437882A
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224466; cv=none; b=A/RKUN71T37f3NK6avQ8l4D8rK0knsLvsS8ChRnOwOdZO6LkKfT8G1VdpkmJMS7w9KfdvhfVbra0OAUwq2vLIfgT3Zaa1c7BQUwyg+tKkd9MWfKsCa9LVGBC35es1tdtS6i7zllRErklBlxTgh8q6zHLbnO6XF5O/fUjKKHXxdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224466; c=relaxed/simple;
	bh=msbctxBoZmuS/F4jhIkGgLNMRMZ7w5FEKCHPbLLM07A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N22/rhRtp+PAtgWhofAjPrSdUxm8e6ilyDJaIguRsQ0OsrXPDSXjpHWeR5RsCBH0QGOopcevbCNlIWA7ctvO+cNiDPXW6apQpoBRUjSXUfQ+M/mkMckCQ+is6XuAWvSuYAU0i7Y+lQTvCTNofwr3nhc57FunM5pbYINbxuhqpiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNvSF2hA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iW05fjFM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jJdM258202
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 07:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w3kSoJruJXLM8bW/sjer3Rq7RmeKRWg8kDV81DFxbUA=; b=dNvSF2hAOCPkxIfu
	7KNM2L7kdpiBpelwEKfIJ0sN8S8psi/efDbQFjzBkQCnrN42PQ2u+1G0Xar3rEY5
	jQeYlezhHGA5qxVz3q+Jb57lK/Kfe+MHDnCw6/qU/CPVoZY/8slQ94L/XZHTXm/a
	IjhwfBcW32S/Dd1ulWJASr0HVFXfFAjddz2hVWKFoBj0qVWmrEo2X7fcQVYVcwu8
	Jb4a48TGf8r8CU3uqGb7gRuTfPWsZCO8/WNTXH3aXxt7mPbIFW7E49jN/1qozY3C
	Ia0JLPh6siy5TnKEliRMZkyg/1XcUQ7cdTcjW3TsBTwZFGS+kRDt7kq9BVBDOWF1
	w0iawA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1aueg3dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 07:14:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2eba42b8dso19729045ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224461; x=1778829261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w3kSoJruJXLM8bW/sjer3Rq7RmeKRWg8kDV81DFxbUA=;
        b=iW05fjFMXMOMKK2jwV3+tFwNXjBaoLkl1x0EdoP15F3U8fvmpvSfRtbFe/I7pbBcUc
         r7CXZB88Pk/dtiZGqvp2yJ0ZbGicBuHHD2iTwYXlN2qE1itaFXir5ORxKMbneTdCQRHJ
         EEvc4CTliPVDzQFATw4YzT+YvHRfEXRJHVWhDFRl+0rbRpgl99j7tK5G/EqjIlmzROmb
         8LHWlavXY0bQhR16hnyw5G23SPpmpZFG++/T7xx1aGzTf2lPZyxUYxoBnnyxrQX99VnH
         ozGpSk8l05goJHfymk+k2iqTSavv4hNP+YEFpeX0mlwV/m9ODLPktSpgyh8J4MZoTOsk
         zESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224461; x=1778829261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3kSoJruJXLM8bW/sjer3Rq7RmeKRWg8kDV81DFxbUA=;
        b=XC05uWHfqTjGrt1fHaST9TljMzsj6mytiv3mL/TzoFknVdsc8Y/a+vT6B/L+kn2zqp
         rgagffo+xBji8fvSIWu6glGYLOBIwDDBqqTzFtsh9M28fQO5/jVjhrIZjVyh3JFltXej
         OtGtXMS348RGoH2Red+5gIw01/3jiqmcRn+55D6NVTlLOAPobyYjyE2LhajqcbnG0p2C
         LVkwqnphBD3+ieBp/9A3akAooVvVXuuMBxiU1eJm3rkaIdpT0DhWalTCgoCC1HaKxUEi
         dRneUIu8eabgz6l+bTjmL7588ApVyty+gafOjLDX8tm56qrkH8lM1uL7rsBGf2BPl/GR
         0yxg==
X-Forwarded-Encrypted: i=1; AFNElJ8Ql2yZlxEHVOHpVQed+ZBQG4Uja5IBuVo3P/iypY0YPhPYdkk02zwODw/rr8Y7XwaI+EBdz9iQc1eOijvG@vger.kernel.org
X-Gm-Message-State: AOJu0YxrU0Z2yGAjnh9d7/XQirFAVh39F1lPHU0yRGpxC+PNy1bP2mwf
	qDbiKtVPjMyV6wCK0enAyv/97Ksdjj4K5EzzdCP3dVmTetPYS9aGIGL32GZ6YJa4ob2Qo9Dl9PX
	MGDdhsCMHWuJUjuFlCq+NnCqq5FUAYMopEb7Jr3mZQwpti+8RT5m+8nYQFDdw0FnSD2fo
X-Gm-Gg: AeBDieuLVz8DTuUovTOqxxzZRwJ8W5x6+15gie60weqNkHuMYqLYaEDjLQSUaeGOTib
	R7CixZqRRdDV5yhyvbt/2YWmYmOCSlAedaQ2p8glbepw4Efh7rz1NYX3NriappyxtYyPvRhrA9Y
	QGzRiFIzwTe3sJc6jLePo9vXZom0gVmgjncKY5FReDhDm/ircHBE8hIDgzsnti1Egd/zl9A4XaL
	jzFJGW870BCTfOlsaJIvMwLCHmgbTKyPNS0iyl7/eVfWxFxyWK8aba5/OV39fP7DaQEX1zX8uAE
	eQlt3+70z8LVFvjwmGh/c7rvleGR49WvT+ysiFfuL0n8O5rdi4k+hCPJoG5QQXJ2GfCQkQCOB5k
	EW0ohMwyh4kboxfrKUgr04bMCsPFTRY8+B5wAKL08pNFDf5EymmyTDixuLe7p
X-Received: by 2002:a05:6a00:a203:b0:835:4447:69d8 with SMTP id d2e1a72fcca58-83cf6a3a65emr1825148b3a.30.1778224460544;
        Fri, 08 May 2026 00:14:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:a203:b0:835:4447:69d8 with SMTP id d2e1a72fcca58-83cf6a3a65emr1825123b3a.30.1778224460001;
        Fri, 08 May 2026 00:14:20 -0700 (PDT)
Received: from [10.218.34.110] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c86b3sm13798490b3a.28.2026.05.08.00.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 00:14:19 -0700 (PDT)
Message-ID: <1560253b-bd4c-493f-8ad8-3e3be3f49f8d@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:44:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: mailbox: qcom: Add Shikra APCS
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar
 <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
 <20260430-shikra_mailbox_and_rpm_changes-v1-3-61ad7c57ef27@oss.qualcomm.com>
 <20260504-mighty-fat-deer-fb7ec0@quoll>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <20260504-mighty-fat-deer-fb7ec0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MCBTYWx0ZWRfXyTVmcTQ/uE+X
 j0Rs8SlVzbACqJQNjcnXY5whmSn4yo4GVKsvTIFe1fDtZ/1hOuAdLF4E+FgFfUcc/2XkSA6OQPS
 vuWbNPoecCTD7wIsj2jldXumKGn8Q3pNWxmCjKV/KGZlyzgOa/eGyq4MNl4q7vHGQISI7hoZFPr
 vV1QrynQJtuhDAVSOXPy/U9g7zQg7n3wyRaq+9HPQfPRNZ9yU6oQqgFdIzG0vDkw807JyTpFrvn
 MBdpxkrZT+IDk7ukTWyqEkicIYKG8hk9Oae9+9kdOmzZlGusbJOyBOtr8y8+hZUpo/rC7MCAMJY
 Ce2nDpIeZ2fPM18IMSJrcJD489xQ9B6YZr5arFpYb0s/XruVRteSB/5bM/pvxf+PRzxpCnqf5y2
 cO1LcV8xtVsvOsLHsV1ZJBjtq63IqjdmXUnTebiUflYPonAfiOH35EkQbEj2CVOWkm6bB2LSdoB
 Pzf8NNmVH7sv6KnoJDA==
X-Proofpoint-GUID: qFGHScp-i3BeTAGtx4LvShJBJ4Lm9cHE
X-Proofpoint-ORIG-GUID: qFGHScp-i3BeTAGtx4LvShJBJ4Lm9cHE
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fd8d4d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XHbfe-6sOlyKm2BVlikA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080070
X-Rspamd-Queue-Id: BD4A94F2DF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-106582-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 04-May-26 3:26 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 30, 2026 at 03:14:58PM +0530, Sneh Mankad wrote:
>> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>
>> Add compatible for the Qualcomm Shikra APCS block.
> Here you explain why it is not compatible with SDM845 or other variant.

It is actually compatible with it, apologies for the oversight. Will 
raise new patch version

to add the compatible under sdm845 group.

Thanks

Sneh

>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
> Best regards,
> Krzysztof
>

