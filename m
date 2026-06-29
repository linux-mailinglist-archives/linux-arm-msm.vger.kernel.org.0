Return-Path: <linux-arm-msm+bounces-115168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UKurMDSFQmr68wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:46:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6336DC36A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:46:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NNkQ5ZFN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="FGy8KJ/7";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115168-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115168-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D923230B98C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AB6416D09;
	Mon, 29 Jun 2026 14:31:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EDA416CF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:31:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743495; cv=none; b=XtqUXLWYUgyqJFRgB49soFJVqzFAIy+81wThqDGZyMKyc/e6fJB7ahIDkv+PRTAkMRy/gur1lCfaHlUfZiGrR2ollToZRFuiAF66Uxl+iOACcKbgrfZi06V6B7IceKnKMZzO0T8IItpEW0rvFWTB3mbZ87YliMva+q7JQNoSaFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743495; c=relaxed/simple;
	bh=OF9snRn31X6SmMDY51AcTh4zJejisfuf2S1w2Lwkwb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqNCl49UHvJiD86pcHGqZdO5zdAXOhpFqg13S/FHvEgGLlRpXlvSB6s+2k6sTarC7Kp0MpGPtfR22Huqyp+J40N3/7NgnInQxgc/shAPJbqTh51Pfp/F8w0hhQw/zNB/Sfcx817Ua27Ct6sVMnU31nV6wSpx3ZjbS39r3MO7/xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNkQ5ZFN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGy8KJ/7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATAH02627980
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILMGERo87mZLBWnpMSdXvTEPn9IRdnOnAq56ed7EjMQ=; b=NNkQ5ZFN1afV8iYj
	RCTq21Vqme0yI5XrN0ItxKFWnpZAzzUnLLJfa1r8ZI50Z1ctP11PgiyQA/QeQl/n
	6ZNYFOtQNb8JVr8018QV3PhNXZ2gDLJh4d3Ps2f/ICSU/8sQyMpf9zjo/gViz0FC
	HavK9AI+IW5gpJOxJDQoBzHCPZtLJI4OeruldFD850pGshpptnOKwBgfAKXBh9vd
	xdVZi283+kjZFJVdPrfLpzu2fDEaop/YOYjKly9PI2RsD1/eQoMp7zuIUuzhZBqD
	R1R/NJt9qLZLvNJr6J4HJeF7mhHsZHxKhjDDsqXa8iG7Mc1/rwcpq8EMkpNvY/tv
	3CYMfA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgsbs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:31:33 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7392d893428so65840137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782743493; x=1783348293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILMGERo87mZLBWnpMSdXvTEPn9IRdnOnAq56ed7EjMQ=;
        b=FGy8KJ/7Y/atIhqubjCIE20d1azikb+pYXjTf5amxOoxNN1ZrNCrcERf8QYv4GLzsW
         aTJweSmMiz3/OpCAu8A4SAVIWciaUr8zasat1/h3alq2aweVjSxPpif8ZRk5kdwFt96U
         eabpU1OgQYUQLF71lzmUO0m7Nux3CXnZDQKvJ5cZ0DtAcrfp2XCGQONW64g6iF37eyH0
         1DtetvlV/c8UlmElEf95JXA8OZQWhTFJYdwe8yCD3XVGLbSnjeZNkA6lDKownNj1f9x2
         UVGgA+xjvPdeRflQoHBji8jl+48vnnIAqhhEGUsRGNlPwABZw7UpspAiKPe6w0oszbUk
         m9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743493; x=1783348293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILMGERo87mZLBWnpMSdXvTEPn9IRdnOnAq56ed7EjMQ=;
        b=qTorTMOW7U1GVNNJlx50wc9w9hr9UJaIV8Nr4nA2OY5eu5Zus0SryL8bdh9CMrk7vg
         3AyjUGUtjzQxM379+ucRCKhzwvXl1qQQL4QeUSvbLKBNqBr5AcOZZFVG8loxQLRjEV7j
         gOkMjoNqELfrERklwAl+L/Gf6b+kf95nzcNcatZ5UA77DoR82a4opAsQFjXw7aOwbN9X
         HBoF3eL6rLTSBB2fXxA8G35fvp9PdmEypW6SqxG444GJUrONUfMIUtrDWxJn2swENTEd
         u4HQCRwMEwEa5sxFZXOB0dXEwad6msMNmbN1ikMB5VQ5LsU2Cl2rrreRJi8Kt17vHd9G
         vc+w==
X-Forwarded-Encrypted: i=1; AHgh+RoAwlKywEutnG0wEl21/zcyt6s5qo+Zgn+B6jYxookz2wg8ovuSfMdCw1ZFczWVwICwl+Bq11IXtFD8jVAW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmvm0AI7ODt84CLVCe9vbSgW2jUWM5Dobfkrt0uVhy6xf1vwOS
	9Kk97IINeu3I6etaO24gMMK+FS1FARW+eMGvot/0sz1uUVRJVH9x4Bqb2YETm81TYwH9CCMiY/7
	sGuOOXfDbTAKf2ub5gSvK+y9Uc3kb0zJEL7pRn5twDOinA1S91Nh7NDMv6fkr0waise2U
X-Gm-Gg: AfdE7clBJvur/bGGmFzFVjOBxTbDDEbgqgy6wtSz8s7iuuE+L/5D3/TUBNKtRoppEiI
	yWcZoOdTEKRdiE35xjXBvwy+cAXde4kNu8xN8JED1W2yISVvGwXrgiPOVtrUbNjTRhXj4ZGVqTe
	nfudi8l1JZXHafe2DLyuSTeDm99AC2i305Xdbb3VJdEPWqTxlvxldfrU5aEUqntaxcTHNylAiRO
	lLDUUw+gQimrJ/kAqCSY75JYwUgCoFeLiEb2v+OfF+52+mqYi81M6COpIzJlb0uyjAxB7rXTpd0
	N34mKJWghJTnmhkbKBRLVjnAP2e8QoOFDdTQ/kX7Fc4rkS+De+NeRe+vZd2APYpXrI19fSAUl/1
	/FzKaytpgUHBA0OpV74He4vdQanAWloqNIzA=
X-Received: by 2002:a05:6102:1607:b0:739:b6bf:bc9e with SMTP id ada2fe7eead31-739b6bfbe2bmr287674137.3.1782743492732;
        Mon, 29 Jun 2026 07:31:32 -0700 (PDT)
X-Received: by 2002:a05:6102:1607:b0:739:b6bf:bc9e with SMTP id ada2fe7eead31-739b6bfbe2bmr287559137.3.1782743491515;
        Mon, 29 Jun 2026 07:31:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12678c8863sm194348866b.20.2026.06.29.07.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:31:30 -0700 (PDT)
Message-ID: <1a5232f9-9d28-4870-8600-da221b88e4ab@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:31:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] media: qcom: iris: use disable_irq() during power-off
To: Hungyu Lin <dennylin0707@gmail.com>, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610141511.92352-1-dennylin0707@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610141511.92352-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K6xtqklpjwdbG707jR2VtUgoztE_--ms
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a4281c5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=zWOnxM58HoCMSUmL7UMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfXx/kmrH0OOjWA
 qDuv9XjgXJv1j3vvM2Sdj6TWC2jaPSL939Se+Kq8QiWPkuJFDbf0mt5bwi5XBvVAJJPkLdkwUci
 Umk64rJQY3sr2zfgjZfujnzf2WuATkk=
X-Proofpoint-GUID: K6xtqklpjwdbG707jR2VtUgoztE_--ms
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfX/NnypJCq2sld
 4wmw3duyyS4KXmAXXChQERMdJb8GJrMoAjYHlmxIcnZ0cZxQ+3wpMNqJZlWDOCpAe7dGtMLKH1H
 xVG4/ExGtJbpDWoSgzUbaU0C3g0yn7R0AdKibcasMAllOzUA9fJXKUQa3OccbFDSDmubx5z7Ui4
 X8/fyXp3NEZTtlnEXwP+rXJqTECuhEBBZ3zLzKockP8EBpLt60g8vf3k1gFCvqrV2x92s+6K4wz
 pXKUTlgKTg7EQaBVYOlfjbwdg3tLCiedVa/h2DI2RweJ16VhDHrFoFbDENU4FI3GQOJnV5BidDn
 9uOsWqTsVoTeMg19FdUi+dg3IxeSohBbPjL6rVNLSgVB1Ye+ZwOy0ZfNNi/6UGGMJvApoBuRlnW
 ziK/RH7xsIEGDM1Go+7y/O9yAjM7O+D3wTPHgXb360c5+ymVEsYtUTX8ppip9TlFsfAxPz3mJgm
 almW4bMCSFD2t/SHOTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115168-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE6336DC36A

On 6/10/26 4:15 PM, Hungyu Lin wrote:
> The IRQ is registered as a threaded IRQ.
> 
> Using disable_irq_nosync() in iris_vpu_power_off() does not wait
> for an already queued threaded IRQ handler to complete before
> returning.
> 
> Replace it with disable_irq() so the power-off path waits for any
> in-flight threaded handler before returning.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

