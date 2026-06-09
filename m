Return-Path: <linux-arm-msm+bounces-112209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZNOjOPIqKGq5/QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:02:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FD4661770
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:02:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PPOP6Xjl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dPojoQUr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112209-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112209-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CB46302572D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C189359A66;
	Tue,  9 Jun 2026 14:52:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647473546FA
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:52:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016731; cv=none; b=VPexwtshTLBFEJ2x0MH2fH3oUoF9wBQ4gxWIHg2UdmYCuPLAJKyYqzBQ5lQGYhR/Lmy2yPbloUWEU9xsDIXX8vv21gxsOZWD/lJQYOJuxNBAyGZ93sQWNwPxBlURBm1CND4TPfLxxkJboacgM6MNCXfCDEib5/eLlHQCjEhgvj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016731; c=relaxed/simple;
	bh=plO5hMcCF/4ygt4ohaz4T1j5So9o1YDIgKVuqScozic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CO7Hlhxi0VMfpCXeTFRrn0nnTxugCWeVZgUvdh9pT41zV0cABORVL/lCfCf/mYSiEtwkRjVJvlRS4jvd78GDuLz9/0dWS28H/j6Y7adu8Ey8hsyHk8OwQCFL/HOe5PHvFGQoKLF0pCUy8f+FEuk4qAQCPkfzBBxMTDFkKnrWATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPOP6Xjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPojoQUr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClWH22693966
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 14:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nlN7P1x6h4VlhBKargHVoeOlr6txo4uIZrHjud/cCzU=; b=PPOP6XjlbYdd83mP
	WtHj13CR9w7O2VJxwz2yv93wSYeH+S4hazLd7PZc3H6kolIRkgp3H5NDCltlk3rq
	BmtpYwuKIFR1HjtdXjzWNHywnX/vZpt89H6ULFRYVWOlOUyVVHfiTvgwR3htaLC4
	jeV62TyGek80DdZDdX4nzML1/UPypULiZhbDzezCONgTBeFNkokHZDAPN7kXOyA9
	OEKB3tcL9xK4WJwgJm3kNOg8WWkFxwgurab3HDcYuUYGF3OOIvae27JykyO7EdPS
	4DcgPDPoKVTmtk5H/84zXH8u0aVpW86GsM5ajnHO0vybAN4yN/IiHGVd7DlE14Mz
	NCY8TA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v1jdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 14:52:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9156dc90fdaso152036485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781016729; x=1781621529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nlN7P1x6h4VlhBKargHVoeOlr6txo4uIZrHjud/cCzU=;
        b=dPojoQUrLgAsG0PaRyS0Uzaoxcem4N0OGayBLfgrOhGT/D8+GZ5WVwzDw7pAT/+3He
         U8/IOgbwvK4Z8bdVK4lwXmm9V5FCadj/J+uFJelG2z0d/FOqYKQG4TJFItiyd/4aO+pw
         GgGBpfbRynLCG0nGSHdADJ+FvCEganIYWpAqDwNe2BJk+6dY6UJI8baEr+vbnlFBazcI
         LSU0Axv4ivENpn9cPqEeUXXxq/FCXeH0lBBsUYk7+4LbHE327PqxRYtKki8WCvP5OZlZ
         cM+fWj1TJyCQoQJSY8N7kTu5gW3xS0v8nB4xyoSsFiECuqawH8B6REsd5eMpJkhLMlNc
         Q6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016729; x=1781621529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nlN7P1x6h4VlhBKargHVoeOlr6txo4uIZrHjud/cCzU=;
        b=nIccakT5eMCAKA0jGuniGTBQMsVSEKW4sru/RvMWrVvw2hGsbWBdNHUEVjzc0THo5b
         Yob5DZRLq+4AVQrgPY7Nym871Wz6R97z3hbOOmN5ujlW/xMhBiVFbTguFwV5u4l5PNuP
         2mHJldCy+ZdO4cXjQPeT85jeM33xo8QlOHCLwtVAa45SNAahsD6MuGIEM7mQKTq/RfZP
         hX+zzsRveMI4/ZLSVZRtm0ckHJmHbfQtQgm6quTG9R4UpOIMZAXSmlbDQK8kN8x8h6b7
         njh3WCHuk2l+kwNBskhMFSM4OcWXBkRYAXM5PkpQ4MkIuOiw/jBpPsJveiZ0K8CtnIZ/
         nr+g==
X-Forwarded-Encrypted: i=1; AFNElJ8afBu843Fc0RsYFiosOg3V1DE4Kz/rRl0Umfbp6xbfqGDufBUuqfru/r7VrEv+i+Uv6OXBYnuqsXtxx+gu@vger.kernel.org
X-Gm-Message-State: AOJu0YxUCFsUTz/yq09T8EDGG2I9QLlK0AFzLvNsSmQNuv5jPAmp6Lzw
	MoPMAz71TGfg7PuWm+Hm4CBm2Qi7gDXOjv+A0bJjXqkUX05upahDJvnQTTZZnoS/SgWn1n4aCEF
	H9SIQdSwTAxnBsj2zAkuc9gR/UBO6qbpQTvdadyuHhlxkqh/l+hQab6ORiyAVDns3dm+8
X-Gm-Gg: Acq92OEq2L0IM/FRnf6i2hZWbgjtWIMoI54ifauPgPmwHhXrbrMP+Mkx5v2532t1W3e
	kEgzRbT9o2vwrPrLOsxXWQLjbi9FfzfGhTRDxeIFbdR2eB2qtnh8bwHJuecWxHbxcSrrPedjXuD
	7KhuL+T5WSjY3w00V4ttygNUhQrd68aJiAFP9XOIjJe+TRJMtU5bmsrIgjHZtocTLG6e5NYhheB
	RikIy0o1JH5Z5wCQVYUHkTvOP9wszJG/m6/ILFwvw5ZMVZ2vPKNGzYgqgINu++zwKPl1maDMvDx
	i+ReaSSVvMBz/6JJws7jMfdBDDdFP3oRFf1GQyJEneDNlU00BFlF21uTT5XTztk+8uBEmZH/ext
	7If2JMfzSeFmimuk07OiTnaXQBySikAbYr5KtAVLiaSy5FqECtOT150wd
X-Received: by 2002:a05:620a:458f:b0:911:295d:59a1 with SMTP id af79cd13be357-915a9e00b2dmr2044040585a.8.1781016728679;
        Tue, 09 Jun 2026 07:52:08 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:911:295d:59a1 with SMTP id af79cd13be357-915a9e00b2dmr2044038185a.8.1781016728225;
        Tue, 09 Jun 2026 07:52:08 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2d2bcsm8765718a12.10.2026.06.09.07.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:52:07 -0700 (PDT)
Message-ID: <52a26036-6ac0-496b-8990-8bef0ea029b3@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:52:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for
 SC7280
To: Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a282899 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=0fbrQ5wkLIivLQXGzjYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: HVrV1cdhiYojacSaIaQoBvwY4CHseXch
X-Proofpoint-GUID: HVrV1cdhiYojacSaIaQoBvwY4CHseXch
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MSBTYWx0ZWRfX8yfW5JMENeP7
 gEE24au65uHkAGCBX9oN37Q1bu5E5+w2uGtrn8jeZ24YfmxiIFky4doDDISqJFplzCpeTom6c/X
 HroHSJcCAXs7J1Km0rUT66AI5X59blosE70bD13iuSG3KBlB/NhCcK70erBxBYfWiBHYn2yIvUC
 Nkvj/51X7a8YLofM1IgNw42T0QGgiTupn3pspCgX+P2YIDBQhUO/QxgSiDjEslb5CvI8vLMG1Bt
 /8yd7D8DGDMK6odkiWoiSU50NG7rdxQhTtNTPNm/9CXeaRPq0SvW6fIvy06cr6MwMiJ7AgUURIS
 D6W5IqgIAb4u4TT7gskyT2uoU9UVnDuvWhQRh0KYlMmB0yOyi2tmPJCCA8nDXA6bxlIO/zekPto
 lCKJbObqX+62o0iZmmuoRMggq/1rLipWFYhFJlTRw1hDE0eCdIID+ZclI81JPN6tO5lNRULPQe7
 XYrNRxUIL2WwrrUnbaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112209-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:lumag@kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-arm-msm@vger.kernel.org:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89FD4661770

On 5/26/26 5:03 PM, Luca Weiss wrote:
> According to both the static definition in downstream...
> 
>   yupik-audio-overlay.dtsi: qcom,bolero-version = <4>;
>   #define BOLERO_VERSION_2_0 0x0004)
> 
> and the runtime detection:
> 
>   CDC_VA_TOP_CSR_CORE_ID_0=0x1
>   CDC_VA_TOP_CSR_CORE_ID_1=0xf

Some page tells me this corresponds to Bolero v1.0.0 (as found on sm8350)

But maybe +Srini or +Mohammad will know more

Konrad

