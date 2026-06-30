Return-Path: <linux-arm-msm+bounces-115380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ggMqD4KmQ2oueQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:20:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8729D6E3849
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:20:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lypd+3tn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QXqj+dcn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115380-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115380-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3A1933B8CD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D6F3FBB77;
	Tue, 30 Jun 2026 11:09:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB993FAE09
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:09:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817793; cv=none; b=K21C9MPuTIO4RM9424GmUaD5kLvLxFMkh0Eza8DTgRL4vWn//0vekxQVax8h4b8A921TQmP3gxlZYgQcHjzLDqnqRvJ3ua31Dd76v+/WAoaU9Lxuw8k3T3m0idqfyBqQsDtbTHhEeEL+zwnoM8DFj0Vs+rqxJd9K9ya8jL2N5zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817793; c=relaxed/simple;
	bh=cRwU7NFBu34DY6s465Lfdt9hITXAUx02A/eU0OKwDn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DfTrQCdvaKltv6Ze8S+iNLtmfsvT+RONLrC+trzM+Bs9MQs+NNq6e4opW5eEPf8ZyZHlq/6yTPw5ZgqvXSwO6dy0AsWzVG6DT8/MZ89XjniXeVJXPHFt2VayqQFfShnKtvI9wk6fFFJdAsDhch5uE9JA6xHxIaYsRvzmQ645p28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lypd+3tn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXqj+dcn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n80x1605860
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cRwU7NFBu34DY6s465Lfdt9hITXAUx02A/eU0OKwDn8=; b=lypd+3tn6luViu5U
	4orYmLHMSdyPzJ19dgChuOQbXH6oiTjEszCBx3OkDppPwcWaQCsjJpG+eqK2uDF6
	SGQtoSzk+Ec0iOV9+jKjYgarlBBGIHHF2f+tpX499TnylMcaFf79S4Q9oS2damsE
	fahu3cdIbTDvslA1u2/zZhMtGCKMEcKHKQcEdZH4iaMhU0I8zYQAz8/hRU5+3vYX
	SSd0HSi4HTIpz9WfiXzDMHSUVIO3euQi7b91KE41V4Je3Qywfnbe7c1xtNeDgVTk
	lozTokxaj90vZQ38/0t11tqMyAo0WwqSMqsNJg4o3YjV5ipN3Y89SFYQ+U0SNmie
	A80Dhw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5t0ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:09:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c069f73e4so3225941cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782817790; x=1783422590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRwU7NFBu34DY6s465Lfdt9hITXAUx02A/eU0OKwDn8=;
        b=QXqj+dcnCFq2FXtojVkGhUaJDPuB6EHAXxTCYTSdfJYqrZ0nPd17Mixcc34qywreKP
         9FkTXQsdPmP6SUT8O/t9W/KHcJujaezAbiw4lbKsC0ofRQ1iuYYsCg5TnOXYpTmNt8JY
         +fw+mvI0pDbCRESZrF6YaOionoEl7zW+RFwl1xdArZ9Ql1vkYY362mvoGz+pVk1fTYF3
         N3xPi3G7uTnGGEH2fZp706MoET2vESRXs5+2YyELMQmA+CwGLv/vt6azsGBHBPnCzcKe
         LdYAj/C7CYz/3fxUGtLXBYiLFCFBU5pFuuBcH3NhI1FD1PX0d3pLSAFDNmyP8hIiP9DX
         Vj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817790; x=1783422590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRwU7NFBu34DY6s465Lfdt9hITXAUx02A/eU0OKwDn8=;
        b=GafcGbxFd2QyDKT100W7O8YiyoarQRmezXdJCh0GPbF057DhUKQGFuIpAjGmpJz60K
         N0BBt+BIJYvHm7/ejx8T5r7ScaFST4OVXv8XvB1UqB+ZcgkdxHnMlx3HQA1dSMmd78g4
         IfiBgPdARrgdhwjQiuJzCDsBOpSHU2TpvuJFWIGugUB78Ih9qhuFOVd2UO0vf7n0Ei8u
         LnexGLYSM4DXzKidQe3NNDR4t95GNYm+FhPQr4M0MTJcDX7TLvHLBVVdwRgLnbPi1z+p
         TSDiwRaDXDFiEVxCrfSy3yoNv0bxTBxclfdHx0GnXR4JvoRB0jx65jRYVqDqGwO1SUOX
         N4Iw==
X-Forwarded-Encrypted: i=1; AFNElJ/tOBbwDvcWkP18Ah0M5/c4TtuXJvQ9Amfa8Qn6R2lguyudQZjWr88nLBgbHtKEP1iOkhOpsSxciyiT23Oh@vger.kernel.org
X-Gm-Message-State: AOJu0YxSqVULKF4BmUnBv982rdIcKCW4aeU93eGN3j3EH1qtG9FBUmqx
	3yh/peuIzDJjyHE1ILN0iETLTwAw7OGHRHE4K7MF/V/3HSbz3qOuUCaeQITjrLAGjC9evYJDaXY
	SlNoBfoN/O7v77KVv0Yx+IMVX8ttdm00NmLXOEv4kEDEyXH6T39aKt8SCZoshCW9lRzAJ
X-Gm-Gg: AfdE7ckEo+tROUcnjCnztvmqwojCT3nohgGnQndsKWeTsVKVK5MTCNh5ZzotUpceH65
	8y5a5plrHHfN55vT01fFF7YShhE4BBAsKc+0z6pHrltMJ0plSpTPYY/YWWvmC5XAOuSvU2wj1nF
	QLba0hXZBwlRjO/anJ0q8NF78B70Z/H40YlVF4vGrs1w9avJgzIASUMVjs2rMIeal7M0itiQRox
	wn29BPuaQ/TD6PWXJAV5VOknp0NOHTwsL+CjNozZ7KmJfGy6mezyBhBhdMcEIwm7lQbcWF6BYMB
	8EEuObuwryLEdQNhu2v5/ktXRW7upPsDWgw2XRUwVuJ+JLRp+SIhq6P7OZJT85rcdfww4wZq1jj
	9X6gTfDVbn30v+aheYmkZR/YT8WFPhHLt9Vo=
X-Received: by 2002:a05:622a:144b:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c108c7170mr26921411cf.8.1782817789759;
        Tue, 30 Jun 2026 04:09:49 -0700 (PDT)
X-Received: by 2002:a05:622a:144b:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c108c7170mr26921141cf.8.1782817789233;
        Tue, 30 Jun 2026 04:09:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc89sm106550266b.36.2026.06.30.04.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:09:48 -0700 (PDT)
Message-ID: <c9f7b597-f083-4438-bf9b-a19e2f39436a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:09:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        William Bright <william.bright@imd-tec.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ram Boukobza <ram@imd-tec.com>,
        Tendai Makumire <tendai.makumire@imd-tec.com>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
 <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
 <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
 <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
 <00643a25-040a-4bec-8324-f52b30d84f9f@linaro.org>
 <aivHs6p28uN3d6TI@will-Legion-Slim-5-16APH8>
 <aca9bd93-9dff-4493-a1c4-daf9ba27aad6@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aca9bd93-9dff-4493-a1c4-daf9ba27aad6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a43a3fe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gNcS5RXMAAAA:8 a=IaU93oFJTrkeP9POlkQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-GUID: yUZUBHl3zT1MMyaDd3EKOUah2SDT_4zt
X-Proofpoint-ORIG-GUID: yUZUBHl3zT1MMyaDd3EKOUah2SDT_4zt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMiBTYWx0ZWRfX/KFhwlVJ0rb6
 AuecPhayC1phfnDzJSY36XElkHeCiRVjp+YS3eK4QCYaaIFwdprQez7ewFBz4qt52/KtH3cfKns
 DPr2nP0fNwqNZ72Z5o2IXUThT5/AMwbS8ZaXmpgFEVrmH0Sr+ymjFPQ0/aEhcUpYgxLQx99glsw
 6NoVf+r1T8+PBl8cfpzpIZozEz2G1BeDhIqbKyRzCJbbCgBCUYwPPCSLhJkVYKT2JPJcQlMil6+
 V9t1l7en/Eg5CDLHyODNu6p+ttRpfVE1UoeN2mdp1YhZqI6mkA+YF90USXBGHj+cHYt9G0t+ZyG
 db0Ct+5+YplR4pP6JKyjdGNHuGC70QC4doIc8m7USI+KpTSZlBGRcXlbdemfvpz3PrvB/QGg/zW
 dffpXPItq6i6I1XRDCXxVRt6QeorRILQE2GBiYfqiZ4NTtY+lTy7agr9IR3XJNVLFjM4v8a6d4V
 Y1dgAKofRgfBPY3ixGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMiBTYWx0ZWRfX38NVKlhJj8SL
 tWuAyAhKlpVz7EJdkc+7iqQoyvcfGTRl3kBfyc/Nvlpe4h2tEWfZ4la8O94ZyANfE/WeX6HEu1Y
 ZJktHZp8GwQv9TzvBugvFJngOssIFX4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115380-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:william.bright@imd-tec.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ram@imd-tec.com,m:tendai.makumire@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8729D6E3849

On 6/12/26 11:11 AM, Vladimir Zapolskiy wrote:
> On 6/12/26 11:47, William Bright wrote:
>> On Thu, Jun 11, 2026 at 10:48:34AM +0300, Vladimir Zapolskiy wrote:
>>> Looks like the SDHC driver behaves expectedly then. For me it's hard to say
>>> what may be the rootcause, I believe the lower bus frequency should be fine,
>>> so it sounds like a hardware issue, but could it be PCB/board specific one?
>>>
>>> If you find a chance to copy the SDHC driver (and its small dependencies)
>>> from Android and test it on your board, and if it also fails, then it might
>>> be well concluded that something is wrong with hardware, still it won't be
>>> quite convincing that the SoC SDHC is to blame here.
>>>
>>> Hope it helps.
>>>
>> My colleague Tendai (<tendai.makumire@imd-tec.com>) had the same issue
>> with dll-tuning failing in SDR50 when working on the downstream 5.15 msm
>> kernel [1].

I have a "feature table" and it says SM8550->SDC4->DLL [Y/N] -> No

no wonder it fails the tuning if it's not present (or that's at least
my interpretation of this doc..)

There's some notes about the frequency being limited to 75 MHz in
SDR50 and to 37.5 in DDR50.

The supported modes are DS, HS, SDR12, SDR25, SDR50 and DDR50 (with
the caveat above).

Konrad

