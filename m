Return-Path: <linux-arm-msm+bounces-117945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G57VK4d6T2okhwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 12:40:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2498372FBA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 12:40:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GNxW58ap;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IPNkG7r7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117945-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117945-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1B9F3092FDA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 10:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BC43FE649;
	Thu,  9 Jul 2026 10:24:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE98B3FC5CD
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 10:24:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592662; cv=none; b=Oc3+eYi0bE3ue+LBAxoycKO/wEfsA1rjvLTwKqNdTV2yJxlmdBl9iZ/pWOBKVhuOnWiRwxJb9H4NBWeZ2n4kTOM5UHL2mz1tuVi7FrSco2iKemL5GyPleb5wqIqTIQLAYXQCPidEfjPTPqwacIdtP49uPPqoDfq73eF2Z9eQXXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592662; c=relaxed/simple;
	bh=zToVtsgCxCMPYVRioLeAclnBcQbq7OYF6zfr4jb3MpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOg2N8TxgfAQnVx3pNeQtRgettb3f+aptvw0sd3vSVtyCTugmltCHiS68XTbEvTYAOh8Np0Gf9nthD4rKq4BDCnPw0m8Ah18zo2KrIEPoBfUf/8UwlK8gaTYNRR2XS2yfPrL+ZMNK9+xtRCrwba2L1pwWajpra/pAIg+Ss9JdIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNxW58ap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPNkG7r7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669ANS7M1533636
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 10:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4Pw9A3R37LzZiXhg2G3UEJEcOVQOeZrAuzBQeaT5jY=; b=GNxW58apUmk/1FwD
	2B8qkYTB1bSlZhO9R3FMRjP0QkEDhVryRfLX5QlnNsCrNDwcqdq5dDG14YFrwERg
	8BFMooUuos4u6bAosyTgRrPbYbKWhBgOwmmT3EWJ4YrpkFQOjhyotFHgq4x9s/kL
	F4fBQ/hbqUYn+Xg3Op0xTboHr14H80JelLROzo9+z3Tjuk0/DKiZbFJ7Zq2jmj4b
	4OoZyK1uKJJdId7nEYRstpW8tK59r72dCPsHeiCtzhaWjOjWAlrrLQ7OL5QXBn3k
	c8y1Ynvnjn0CHhdN5Y8w7BchYUWU1IepsPjdBh9ZXF80er4am+rq/lhVQejBpHLF
	cQIv3w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418hjf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 10:24:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fe0d9ba59bso3109566d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 03:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783592660; x=1784197460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4Pw9A3R37LzZiXhg2G3UEJEcOVQOeZrAuzBQeaT5jY=;
        b=IPNkG7r7bf+IGLVy1Jm27SWA3vWwUnjkcCD3ok+4HzzjHsl11+BMzPoD22qjrBajUJ
         qL4S7N5s2AovkQeClRbRg1FT40i8tOw7iJKQca+mtHKfglhDd/2ddmbXofIRduaw0DV4
         g/uAtQW+9EePjwlLJaRniidJkh2YEIjnzzqDI/Cj28oif8aQjEGOhoPMAiOLyFKqE6nU
         K6NIVj4eRImIV+jJZslonTK/3pZxHuNJ4kBsGRLopIgBoNxyLS88oZQsmMsqa5rgk3gf
         DU5wGyDiYNRVN+jlo6rta0gqtylo71OmDbY9sH4KByI2+gC8H0WtutgPbaRHr5ZT1hfs
         8nfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592660; x=1784197460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4Pw9A3R37LzZiXhg2G3UEJEcOVQOeZrAuzBQeaT5jY=;
        b=fkWAnbCzg3UsRPxgqfhxayrfkKPkQ0dTNg4GuKf7ubY9PTU5OLi2sdEJOL1KZtjdGT
         Knr7+jjHRL+B1MbCGIW29nm2oISmX5Cb6KEl0aXznn0SIwFnFN6YdUR3yOCBWzu2dmHN
         4C5Iu5/JkS4vAu4Ot/VTP49HWyVfPw/YKBeOSxzwGddZ4W/o2iVXYlDjIo+MwLf1EsXs
         TgViznwv8MQU26q7CK2Y0f1Gwyfkj0WFLUIbZnH2PNy9irFTp3AOenoCItfQcvhY9wBK
         5KuVNwjRxm+S9MhEgP1s9Szl/7qPX/HhCWo9/tIaynkqmdZONU0K2PuyEwM707xsITl6
         ATYw==
X-Forwarded-Encrypted: i=1; AHgh+Rrsei7n9/beX+kyLNhlHYz+AijHELYQhDSepOOiI+SH1gqRTHx4bic130+47IzAaWNGqRy3uwlM52/ESH6O@vger.kernel.org
X-Gm-Message-State: AOJu0YxlQTdVGamwfL6aF3ZHZX/FKvRvONhwDhdXUemMglXt++ct0s3r
	L1V9OJe06W0284gu30DnuiUa11lyHq/x5MvbzXHrHqqlsGjrsYDk4LSNIvsnSgqijfqix6aXv3a
	KmcOpef6cNExDQnq2DehYalsuTgwPTgiVAGFOTbAGnAX0PaLUtNpdcW5a4AUwDv9xZsJT
X-Gm-Gg: AfdE7cmuE4NLwpSTgPrH+93Zwt+4eUc6MwSTlrEVeLFQuyM4GPxt1glvGRAdF9qEQL8
	gUCxSvMwNnhqqRomfkU6y8Z3CHRZWXiXPcne5/dL1F47MwsTubOrlRT+NjgYflmabn5dpSGt5ma
	GtJpEsM/K3zs2U92DxbOq+6QgdCx9LvU587ilj7OMrIlfhBUKY9kCCZd4JiW2/5G5YTYOBjoZ9/
	ts0sKL5z3djDcKN51Gi9KtTMoBFP3aMTEiXyeRVXSuC+O7b39VAzpk3IWkScy145uV16JXZPiyu
	nSN1g0iJCtlh0isFUDOSTmNev74WS7yb9L0fccCCkuFpouhU50I3tVpOY09KQZvsvNhK61M23KR
	0C8aFcUQgnLePqSjw7n/fSPpDuHzBpLMfd2k=
X-Received: by 2002:a05:622a:5c8:b0:51b:8543:cbbd with SMTP id d75a77b69052e-51c965f4e62mr29853021cf.1.1783592660147;
        Thu, 09 Jul 2026 03:24:20 -0700 (PDT)
X-Received: by 2002:a05:622a:5c8:b0:51b:8543:cbbd with SMTP id d75a77b69052e-51c965f4e62mr29852791cf.1.1783592659677;
        Thu, 09 Jul 2026 03:24:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c63c04fbsm285215666b.23.2026.07.09.03.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:24:18 -0700 (PDT)
Message-ID: <97816639-68db-400c-a5dc-2e5c32f64bf0@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 12:24:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add SoCCP for
 Kaanapali SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
 <20260709-knp-soccp-dt-v2-1-6e2bfca96088@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-knp-soccp-dt-v2-1-6e2bfca96088@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f76d5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3-YoKPAtwUcdJlF2dtsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwMCBTYWx0ZWRfX42iPO+G5dOgC
 4pzftoB83JyEP56ZwUkrSyIkB/tTf2xrYpziga/CQlKncbG/WOe+xAZUPV2SMxSCvGVw/If/UP5
 2uNFdwytVST6XfPHEaePdGdnQ6I5JvBz1YoXhzdevnXROByp83Q2jvKqKsOBP0aDAgOKT4TB54H
 kRQb7dqela1RtZZjc1KdiKhKW/lXwFYvtLkIeJqQvBfr4zYeLp9Up0WomryWkqXqlgsC1AtcFYn
 FdBJIZocow8ms6eo3AQg7j79idoVPRvK854dK2eCs6ZS45LHQaa+qPh9bv4N+EzkCQtwqX0nnoe
 vpOhMF1DFU3czP8Dw6qdIA+zF8OUOjPITGkRtkGWE5PRu1ib0UmmUfqfIRTkBhTEwoAueIQgn1O
 4OLZCGCnebp8N/JSFe174P1YRasC0/xxRmb1fWmL/P0mi8cFfG7dDg7k7bYIaxL9wMWUQQC3YN4
 UBEHYG++4D62Umd3OEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwMCBTYWx0ZWRfX5P1gHnggNPwJ
 rIR3echrA9sZx/LfQ600wHuf21xw43yqcxCM9XmJmS2N5vlEWEhd33LEQYaWMh9G9x6dnslN+m2
 zzM+xlDl3wBEJhFb+DCuzxkQZ93IMHo=
X-Proofpoint-GUID: 92gHbnmDdKDmSUubTbtCTTSpqa_TlqGF
X-Proofpoint-ORIG-GUID: 92gHbnmDdKDmSUubTbtCTTSpqa_TlqGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117945-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2498372FBA9

On 7/9/26 10:14 AM, Jingyi Wang wrote:
> Add remoteproc PAS loader for SoCCP with its SMP2P. On Kaanapali, it is
> brought up by bootloader.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


