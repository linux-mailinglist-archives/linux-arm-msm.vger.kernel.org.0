Return-Path: <linux-arm-msm+bounces-94441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKsYHQWIoWmVuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:03:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DC61B6E65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 052FD3036633
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1668362130;
	Fri, 27 Feb 2026 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWlMliEM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtXqbUEd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8878B33DEE2
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772193528; cv=none; b=gBKE4Qtndox1T66XrvOmVcDIlLh3gZbVXvySPI0bZEy5PfgRLm1ZKCJ2MV2dKxn4i6aDvTbkzSMXdHWQkbnHO/xfIZIDZ6oM2z++lf7Stvkt7RRzFFGxPCsHSfm6kgRLYum1tlJu4nbkr0OXjH9OA3Q52Frz+FMzWlzgOiuYwDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772193528; c=relaxed/simple;
	bh=dv2NqVihq9/4pt17V0L7coUoZhM/pLyc++Jrv5RG44E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8H+yhC4kRQ+UIpSRqxQdzAan+3bUVI6hZjai77aED/xxHaXq/OJV0H6/XB1AN6H4M/sSWUeQoIJKu5PVzD78VK1VUZAfeUMbo86KjDywQjboiMlF2yGw6eggWv9BFVxXW+Ep90/Jna3tBVGUWb7oCDX2mwB9Q/HZV+fdYAaMIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWlMliEM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtXqbUEd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9vqiK1601270
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dv2NqVihq9/4pt17V0L7coUoZhM/pLyc++Jrv5RG44E=; b=IWlMliEMnR7Gj8tQ
	uY/cAVH0TsDCUczm2Zyf1APjrwWSJCBSWr0OlNpeL2GbGz06DTDVzQIIa3K/i7g2
	nlo+Yd2KUUr4f2OJac/Ae34G3FZhyXv6+CBjdjzTmm9FkFXrhmvmdC/YbuHgKAEE
	WdMEfWVRIvUpFJQIBJWkaX8bU+DLAuqsWcRdV8kfioMyeP6NbowieliD0Rnlf9et
	pADGmpen20NcPOSQcaeN4PamxQJ7g3TZYxNrGBgI2J+1YiHgLK72ape76Nzf/kgr
	gxWuX5d4b7C9I9coIkecEujogd8i/lBj00Vu8OFwHGYHZgElzuSn96hUB9dGht+2
	MManFg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99ueyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:58:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824ac1996bfso528103b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 03:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772193526; x=1772798326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dv2NqVihq9/4pt17V0L7coUoZhM/pLyc++Jrv5RG44E=;
        b=WtXqbUEdKVB0ZCE+TQZjRD3y7yq5bFr2qypUrFeHh22eQKGQXVEL8PggUOIMl7EGJU
         uhhBUa0J57hkkUgejlww6VtXZdzVKPIJHu/7vTNGkb3JuYvftGtW+ISZ5+5WwGKuA7SG
         229tkfugz9bOKZ4wPd/Kx47QmGUQM1EfBmsTy64drMiGpSEyo2iV+0JkwHItrnxi7Ze2
         eX7vc59m7Y6scq2sjET3GCTyrJXXGkuGcWNmFCGKae+tqpZxb0Fy3ju7JtFJVjiHMt2s
         H4Sj3mkeIrVRMkboyPF/J+8rtdNe4EFgN3p03Ytxeqtf5Tr1pm3Spxd0x0Csw89Z0+5X
         Yb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772193526; x=1772798326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dv2NqVihq9/4pt17V0L7coUoZhM/pLyc++Jrv5RG44E=;
        b=WdssGmAXkP3VOexCLPObKUeQalvxJUgEAyEfDvRdaEHtwtLwCgEyIu0ClQjM6m8PZc
         Ou8iuCd4yMFHg2gmOz2SH+0Svdh2YmqcoOw6HeBdvCDx+bOEXc56daeOc/311sdq5iyM
         ARM8N3a0aL3mHyZFTWjXQRAhhHo7ByPiHjpuSQZPJjGegXQ1yI6GrlnDEV9FQyM+mHAG
         2Y5+sB1spv7eRXa2XKBka1GYViT1VGZ1mSbqv5NJcsSQBajTncS4wuQGZYqqAJwrwbO6
         8DdkDPdwhsWNjZWTTkj2X7ArbRG71Q87SUGTUYONq4Y7SFhNpMGejC0v1c90Wl6915qo
         3nSg==
X-Forwarded-Encrypted: i=1; AJvYcCXUmSBawC9IINzDRXWc6aW8DUAFr1TF98hrIeNnsDbrX4xAGQzDZqz5tXO81vPF4Xms0Bn8zeO0a9u9QxdK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx58cYo3uLYBG9Lhazg1AWATzLqZX0qCt7H1XrIZ4STcURLMAwW
	eNgVySjBj/9yhLiZAslyXlne01HXEqrELgKO1wPgJ6MlO+ciUMPFCwn2Y4z+YoFhsebauhviYFn
	YWtNRCK079WleQPpiAHiQ5g9syNF7pN2ixEbVBadtZw04Cen5wk7KY0D51GVIUhxzOCAV
X-Gm-Gg: ATEYQzzHtbQlQEEoGOzDpzbIylagzs7iHxwHivyh/OHWfMJwMCaSdMhhM+5I1h2gEjM
	L1PvKUSHqEV4OPcu82wC67lS5C2c5vfG74tMhByOMSHgXaAaFADJwg3h/vkdUr5wY8yf4mab4mc
	UuCs0qGXHlrObUudTRajLagXc24oe8epptLr3M2EheBcT7I2oHYoO3WsvPbfwim4JMZgjJtCUcj
	LZBaJaZU3kbZOEYvVdolVCkD79VbGVXON19nra/f5nOyzSW2Ps5y1oVGk2GwMhIKts8wGPUplEo
	kRtN900Bk8zMjJO5oW4YdGqVpuc5zqlVGD4Ad6me2uaSxP1P6Ltci3rGKxFw4ikbnwKRBR0Xr0B
	9yFjsisR/CMNO9LTU0sXS+fy0/xfCPP0DxdwOAs5xu2QI
X-Received: by 2002:a05:6a00:2d85:b0:81e:baa3:1fd6 with SMTP id d2e1a72fcca58-8274da3a595mr1608544b3a.4.1772193526192;
        Fri, 27 Feb 2026 03:58:46 -0800 (PST)
X-Received: by 2002:a05:6a00:2d85:b0:81e:baa3:1fd6 with SMTP id d2e1a72fcca58-8274da3a595mr1608527b3a.4.1772193525720;
        Fri, 27 Feb 2026 03:58:45 -0800 (PST)
Received: from [10.231.195.100] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a081a14sm4593796b3a.64.2026.02.27.03.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 03:58:45 -0800 (PST)
Message-ID: <8c18682d-18f4-4fc8-a3bb-5abb6303ff66@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 19:58:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable bluetooth
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226-bt_glymur-v1-1-838fcbfaa767@oss.qualcomm.com>
 <65d15750-64f4-4abf-a62c-519510ab3968@kernel.org>
 <a2b64ff0-38d6-4153-899a-b1e5a620eac2@oss.qualcomm.com>
 <a72b1f27-1bea-4930-a8f5-b0ae22675920@kernel.org>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <a72b1f27-1bea-4930-a8f5-b0ae22675920@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a186f6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=yWs33O5C3Npa-eM8Fg4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: k037glCKbbNW2Sd-0yOKC6Q8P69vjqwJ
X-Proofpoint-ORIG-GUID: k037glCKbbNW2Sd-0yOKC6Q8P69vjqwJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEwNSBTYWx0ZWRfXzb5s3irAB0Xt
 w9iY8Ts2zWaHlx3T5XOXL03Iu7TB4ESMXY29KGpQdeShMZYZuR2C9pI/AP+zH5zUhYMgR6pjmhi
 54EARQGvyHBbmiX9c4U47EofxycCPv6MfIt2sLJMauONIZGoIKhGo9myzRaGJ2bRsppuke02Eb+
 eTkVarwaVY/YCVbdjesy+mKJs5rbaFEpy2ssd4VSq2x1ND5AkoL69uONk29W4uJSH0xK5m3KVBB
 kYlE4b3dPYwqH1K/0E8H2l30767/D4ght4vb3v250EoFIwx3br5MVSINuJ+qHTn3kZWmu4v0mVS
 1jGW1QWWnKq6KI1mQbxZLWrRgTwX3q/7HSEIby8xaRk/d6vY5s4lQGY5T+gz4v8yBrQfoEReqx8
 /YKMe4As0JT1a8KGXtgmQduGG0SMy5S2IXAOcoxqXhLFAB2QOMEkliltb49u0d1+Ob+nBL0QEHW
 xbwPUxLo8sYRvOeykHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94441-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7DC61B6E65
X-Rspamd-Action: no action

On 2/27/2026 7:43 PM, Krzysztof Kozlowski wrote:
>> yes.
>> the git repo is a private one, so nobody will notice and code review it if this change is not posted to https://lore.kernel.org.
> No, it is not true. The repo is public.
>

The 'private' i mean is that the repo is not mentioned in kernel tree.
so it is not known by public.
> I am asking why are you duplicating the work, why you are asked even to
> work on something which was already finished/prepared?

actually, both i and many colleagues does not notice the change obviously.
so cause duplicated effort.

