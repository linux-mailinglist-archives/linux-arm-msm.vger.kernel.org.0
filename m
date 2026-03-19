Return-Path: <linux-arm-msm+bounces-98713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CoQNR7Tu2k4owIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:42:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ED72C9A7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E256F30388AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087FB3C344B;
	Thu, 19 Mar 2026 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVYmaXqE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLXyOfW4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D837F3C3431
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916952; cv=none; b=uVA3ipBykTGBoyBQITOT7yYKodsyC7VP/kVJMmEFxXQIBCU4k6D1IEu+unKJhnc7KjPLdOfwk5eFkrJUpXJL+XuKKUGnHQVFk9mDiAkZZSoGefkoDMave3tIgkLH2U7+ARmZdBlscC/dOrTi8YpQdc+YmTFIlNGcDis7W6xRZ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916952; c=relaxed/simple;
	bh=9jBSf/uNRdw+jksEzFlUk/pU9SX+4YEraC7iWV0w5xQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+Mnc0y0NJk2Wr6MDcLo7liutO3I5UlYYyPv7q/1v0hcHiIb9AybmgKP29YDDphP3GHE1OyxG2nEjfv9GrSOzyGbu8CrLzEf7amOhAzJDbyM0nlqNR4nOl2JA0umc8Zr4q+x+ctLMKA5Oxy8vIOe72E/R+7n20k2hakPOpEGnHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVYmaXqE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLXyOfW4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J740qS2883726
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j6Ckq6EbrjkZQ8EXCi0UoQh+NfXwqejA2If5XX47JQQ=; b=MVYmaXqE+tZSlfgC
	/oQnNfAAdrsYvw04K0yLF4TxdGsBz5jlVwG6ZMIs+OxBBlqoBSKVhMwW/bwAHMfm
	dlmfogtfu8/B2E0rXiLd35RsyvjYJnif0KXuHvwwxKP9C4Keo/L6h98SiNkxc16U
	UgG/wdU5AsHjKO+uvHvh05+CXEAXKbjR96fCn5OyzL99Mut52CEv6a42xH8bUxc+
	wAAdQhLYp22Myv0LU7InAkanwHsH2gSPoSnBJOkAUBZlxwyTSRPM3k97LZRp9J6p
	BzmhjMXcBJyPVqYjed5tULZlfE8JQKaxHXmkVQMvy4qwjICT/zb9+gDGMKysAJbt
	I/vt2Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyv517-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:42:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c471045c9so6181866d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773916950; x=1774521750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6Ckq6EbrjkZQ8EXCi0UoQh+NfXwqejA2If5XX47JQQ=;
        b=gLXyOfW41LYQ9C+jSF5ffTeEFleCTaWKK32UhNQ9JLLsFtphJHgm4TdaqyKMAZUO1U
         91W+kKY/KwW3Jx93urrExEn4UCk5Q4bVY8sE4IfIyb8ygfKZ+EXAf4ae0+9H4BglRE9A
         BDfVyYRedI9UT7ow2ICCau6Gh4NUVPjMp0bFSOA5nx02Ie2nrTHyOutEUYq7mjTpOmil
         pP9UTbRQMZXL/KvTc+iRSXKSF+78/qJQr+P095uGthJAFb8sXi8m6xAepgbOlntQNNFN
         CqwXL/ffEQGi5ggvcY4ZdP0+GS8C7FdCxVCAr4GepEsS2kjzMBojzo2DMelvJbNlQZBz
         8TCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773916950; x=1774521750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6Ckq6EbrjkZQ8EXCi0UoQh+NfXwqejA2If5XX47JQQ=;
        b=Lx+lBl7kCe/XJIEkJEJ3ZbsmpLgLcr8Y6nc0KZe75PzDjFbYIY3FMS4e7UjIoLPVne
         hBV4Fbo3SRVpXMkTeBDTgAUPxoW8otWd7U+OrZbNrAAPdNBtqIeXZnK+F9aesYGv/6Zm
         v3ZBr4C3p68jwD9KC/n+mekVN8DhprcBIlGjhs7h67DIFTdUk7H3N+PurLxQlvJQENju
         usi9UTmLDVGAc3pxtVlsc/T9XWw5+xvdeXZaM3OICiJVG2xpEZFSKqG6jufnKVzcztfX
         SQQMokZRjY2GY/J8YbAbBRyZrA4M4vK17hyC457GQivX3V4LTquaVCs9rES2lrOEaUlg
         +OKg==
X-Forwarded-Encrypted: i=1; AJvYcCWfTLHnEmBAuzBF/cGDwiNa3T/eZeXva9gCMdUxt4tx/kB1nzppT4AwnGuXxNqy3Xc1ge98jIjX7Y1RnxnH@vger.kernel.org
X-Gm-Message-State: AOJu0YzGWHjpHCNj0xo2yOlzPo9twWwwCe36+0UdfXG1Hsj4bTMcGYE+
	TFC1AWtezZjevE5vk/7E8YNU/SmVvjLDajg5rhHZvvu6BfFb7knwXv1evMQSj4KzqPUfhZDSqM6
	SQjJLnaqTykXNRWRIOdw16IubPjHJEVwSoDEFlYVL9TB8+FPEHjeiNND9kir3jpT/Sdv7
X-Gm-Gg: ATEYQzyWci8Q5yI1ViXT7YFASOgnfpnQouFxJmJD53TGGP6Ak2gqysqpdMFLEF8rXb2
	FB5lfmcHiLqhfTDZmVrCMrHjG/ScfIa/nkjG2GOeuxDn7mofboPQV//V2oAswfD4MUfvOX8cueM
	GiHag8cDJ72vngA3qqDAUBsysFC+mKlL4kQx0U/5HqgcxPMu9sd1CGkeSm7m1uAXau6ZM9YmOWZ
	6wvvWiDvpEcEzF8GSvtvAfkpEq/yF45iGz2SgqqE0fKfzU/0Nv7ZgqEexut3F4MWP+MtiI0gJBt
	Lf3yiR5HuvcxxuVDXbmhaauQ49RRyzTlLCWgmIcEs+iFezx2v+IjUth0jP5H7kFipYYg6JbwkE5
	SiR78pIMj9m9FOmiw2AOJKgMhFj9mOWZjzDsg69NpMS1kkHzvzuuK53OTdPupZ0rOhzaibLSbcC
	CyM0w=
X-Received: by 2002:ad4:5bea:0:b0:89c:534b:735b with SMTP id 6a1803df08f44-89c6b4beb0emr79650316d6.2.1773916950049;
        Thu, 19 Mar 2026 03:42:30 -0700 (PDT)
X-Received: by 2002:ad4:5bea:0:b0:89c:534b:735b with SMTP id 6a1803df08f44-89c6b4beb0emr79650046d6.2.1773916949616;
        Thu, 19 Mar 2026 03:42:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1686b7csm427117866b.31.2026.03.19.03.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:42:28 -0700 (PDT)
Message-ID: <c9056612-8944-4bd7-863d-7632be0ed79d@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:42:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
To: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
 <20260318-rimob-new-features-v2-5-c1bf8917449e@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-rimob-new-features-v2-5-c1bf8917449e@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1IXko5Pl_jLd8NhEB5kE_Hwrcx6gMY7h
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bbd317 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=FcDylz7_6oNKbyFHn_0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4NSBTYWx0ZWRfX/4YWQjRU/R3y
 sWQ7BpE+RTPvEjMoZzPrFmbhTWZumaTzk9h7KRFFxX9BS11sViN3qGswmFPt9qIlcOK6T570QfZ
 CaAafd9/wXCu1WScOK0auSweQkH7tNkbC2fec3bNHfUa2QdnLviUiFqjMZnHFdK3fEDKyVK9bPj
 vSNB5Rq8oGF56Zh9pHSzdRGJttpir8596psF270wYd++iA2gxT+oaxZh4WY3VuAHI0r74Uug2Hf
 jIb+3b2biZ+P0fcEbX2/GD+5Dw6oLaNLUV/cXit0JkqLzmJJHQXwIQUQcCz8tv606WFkYrWwYAT
 MjX7nFhdIsgtEYAEZbfmWwszpcx0CZ3huZ97RLH+AWsxa+ST181s1PFSp3fZGbAQQqbLLjwLmvO
 /QbhQnc+GwVEZt3LRqaRC5Ji4y41fVFVl0JNyyS7Mv4qX0BMdxmL2SdMK3eoo9J12tEQOb/kmCN
 iuF2GJy7P2idonNJilA==
X-Proofpoint-ORIG-GUID: 1IXko5Pl_jLd8NhEB5kE_Hwrcx6gMY7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190085
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98713-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[protonmail.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0ED72C9A7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 11:28 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> This device uses a Goodix GT5688 touch controller, connected to i2c_3.
> Add it to the device tree.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

