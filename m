Return-Path: <linux-arm-msm+bounces-118982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zyh2CPTsVWqWwAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:01:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A722175224D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:01:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W2spd5UD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h1wnvZOO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118982-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118982-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73D0B3040D91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E883EE1E3;
	Tue, 14 Jul 2026 08:01:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8282E3B8922
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:01:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016108; cv=none; b=ohjnNgs9d/eQc1Qw0zRk5WB2DFNC5DtNTR6jDR4sL7bvVan4AfxAvWs+i/BhDJdEfu77iAHwzBAhh/9lYxySmJXaNLaxYgMAKSlTq5/Iet6U2qVuZyGWsOlUJYYQSbG/3pIJqgeb1l6ifjxfay4J19P7hSk6AZ313r7Mg/tUouU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016108; c=relaxed/simple;
	bh=7b8uVwS6DoSbkWuLIgz17u9bSuJxmVMI4i3d1rdCqtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bo8+bnh9hWSYrY45V4eR/yXq1n67k24EeVIsuVRT999sbxYWuEwF+LUjHbn5mAc/EF6q4tZPqfCr33B8Vn4KuDy2aOefOBjXTZv9ZmQwKS+vYGaKc2BPbLxCZ2jDsdrP0gX45dgr05nnVWnZTFeBwq7Pp5HlI7GU5mMhTSibQsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2spd5UD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1wnvZOO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SSJE3743625
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ByEUKdaNv7xeQYWQZCJnefEOsRVsi2CBrBMA/VfCn+E=; b=W2spd5UDPQnpQVKG
	rhmL0yuR+ZfQwmzjzSRDIMPskdmmDRIzAc2za1AQ8W6F8Vv5tm6Rhxkifrd+brNl
	1M99ukFeaCDlPVK9ZE1UdauPXOFKWKl/gltf7DGsqRVIjXqIyv/LSbFS4Z0D8I5n
	ms0KiOVLzDzmlxeQkEKGX5HMfzpE0mqfVUUiK3/bhSBSgEJIs/O/yVDn1ofXRqOw
	kkDt2IVBifrE1/S70FrrKDijXZ+V8uDi+PFYMZJniWIDMF+hl3GdordWWHCNALDn
	GAzYdTDRbK/lyYycuX1Ke+sXuSVwtb63pe4vJcBHoZBNCmNgOHeQsMJ+M93XG8DP
	ug/KMg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p2nrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:01:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso79269321cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784016105; x=1784620905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByEUKdaNv7xeQYWQZCJnefEOsRVsi2CBrBMA/VfCn+E=;
        b=h1wnvZOOTQs7K+eIN60Zz+uFmH4Wj8ndY/Q3Wmw5uig7xrkWd4jE2+GlXwx8GaxNDL
         ATOmJ6i21lIRPvEuc1aE+k5GQ6kpe7XTz13EFJnu3lufnlxVpSD/88JiCXvvQgvqxcZp
         bRRbXIKWm0iHHaEdpmb9/BtduvL5/uCOTxKm68N6ILW+bMnMOK/XLX4pd9ME8azhC4xQ
         ovjYxPIqURNwfJYL3nGqwERauaJFEpYnKbdJFaTzqcTN28YG/kplfck6Fo1MfQSZKrFp
         dWtg6H/E7WEh4JQAJKj7LdXc+evb7le/JCmnPhww8MMfQ5gTrfvZgbI3mJy0Ch+yZAnk
         O+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016105; x=1784620905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByEUKdaNv7xeQYWQZCJnefEOsRVsi2CBrBMA/VfCn+E=;
        b=nuIJjtH36hIhzWoo5WEYTguwzKTjpLw3gvvZ7d7Y8RxSpmosvUwoC9yp/WrLPiZKRg
         leR33TSdyGnlQJMrK97g1cmh/Dkrc1sqAor60YgpnBi/vEXzUI2b/BoJISmIATIv7fMR
         HRpwo+tuOrXPzlr4U777bMgTkZuLZ9XXUEfwYTHA3TtZllJ4fvC+YGVji8lY2I6JuhdH
         P2e9Lur1xk+RjYwqftqz11ZAz3SAq3qcb4i636QzPhc6PqSiI0W31tMJaW13/6nFBqPl
         ynCub9PLoP1v7OXI4zG93zIAXJbuBh99TxM8KHb2YYFZsSg6xetVB2PN3h4pkFFKP/29
         N3og==
X-Forwarded-Encrypted: i=1; AHgh+RrbfYWeHnR9Laia/wE5+1wXT4Hb9+u3cVgFaOVz0VfrZWvaNG4hxMQ9U74Z4fdhHIyKx2mo7fFaMK4Xxn+T@vger.kernel.org
X-Gm-Message-State: AOJu0YxlguXnRc54tVfha+FdmIYcW0z74po2pEhKokG88oUEGNwkrJCD
	i5bdchfPa1O1g8EvsU1DlB5tGA31Acbn0zHSbTy1ylwe0Z1A879zAE/5hsJRIFUIl9nDCbQvxwr
	3tyNP04J/Wzcj4D0r28J0lfoXGBjo+dl91sT42ROSTzBUOzIDW9PAmsWBgoZufTyCmGkA
X-Gm-Gg: AfdE7clEu4ivu6Sv1vep+EbNDEmMnpQ0Q/5yHx6hq0rFEaWMcv7YXBoVFoEB2WwDCVr
	1L7ATNdM+aJ1aFIs9seYLa2ogz2Xbjm8asMO8QKsQ71z2hppkmdMi6c2QYVZ1Fi0dtinwrICXKD
	oMqyILVPwhws/mgVpWJIwuiIssC1nE9hrz/em4Q25D2VpaduCdLYMfy2gKDWOv9aAV6KmvzwPsj
	/xU1+XcrH+i9GG2LyWfTO5T22bDZ66TPh0eW3nvsPqdccxDKirufrWCbxnR8kvWWXFMfFPYRIAW
	nW7ajydrGWnkMrzknwzCex9laJli96LJY9J/WoMHlqSNSebTAVgOw5vmhOSHzFz+yEHicVCTmvz
	S/9Bfx6NI3pdwe7VBjkquSwBF+CZQxHj/iopY0Q==
X-Received: by 2002:a05:622a:4c0a:b0:51c:9c2:99f4 with SMTP id d75a77b69052e-51cbf2bbab5mr119189281cf.64.1784016105277;
        Tue, 14 Jul 2026 01:01:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:51c:9c2:99f4 with SMTP id d75a77b69052e-51cbf2bbab5mr119188931cf.64.1784016104831;
        Tue, 14 Jul 2026 01:01:44 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-69cd295663esm968385a12.30.2026.07.14.01.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:01:44 -0700 (PDT)
Message-ID: <88171d36-976a-41a0-9cc4-70a8c3be6a6a@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:01:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] ASoC: dt-bindings: qcom,sm8250: Add Hawi sound
 card
To: Mark Brown <broonie@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713180907.874954-1-prasad.kumpatla@oss.qualcomm.com>
 <d67a4f47-82b4-49d5-b851-d3388651e660@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <d67a4f47-82b4-49d5-b851-d3388651e660@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX4oey9Cwevbrs
 da/o6A3K0OSJnYPkrWpzXnAN1W5ottwaRc2GkKvIxOfC4ndls5KDM0kaAu5JMikVnOMoFsii7gG
 ooii3IfYkPwVqGP9jcbg0S/csJAqAZ4=
X-Proofpoint-GUID: zeRFPTh7xCPjRb6k1281DasDZ43vJoAW
X-Proofpoint-ORIG-GUID: zeRFPTh7xCPjRb6k1281DasDZ43vJoAW
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55ecea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KJAHXRm5T7kSH1rCH1oA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX63MRnFQAYH9o
 WqZ2kEA4aM78xZKg1rnjCWZApyLuORq16EkMHswhS54HM99LRtmVRwfZHM7ioZBFuPNHWhqxTyE
 n6tFopKE5ZdPA5FJzJq9oO+pgtVVdHA5j3hRRHu5Cacwo2uwAZ1p7sjNLMcc/jxYG8BQeGIuvar
 7k7dFart509/YB7maRFg5Mb/PRPzydOyoNF+3qKi9z9PyxAx/7QVEEpObWlqbgjTsmFXVMb6JWR
 3D0AiZ21tOqGqDFX1llpF03CAfZKW8eGSHtXSIU1Fw47Xo1+kRvvBst8QzNmLvXnBtKOnwEzsNq
 4tsF9t7hmFwq8Ij2Yw4huBcylrGv3gDky2NJ5HVlEZu9apu908t6rvGEIbwjjdiW3haDaWvSIHa
 Wu5ifDGAY8FtGsP69Zr/lDk8xi/CgDwldV8WZGJyOv0U8lQPtEl7KSaQW/21Esvrwk95ITs8eVo
 EAnWzD0v+BLIgvhnHwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140082
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
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-118982-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A722175224D



On 7/13/26 8:22 PM, Mark Brown wrote:
> On Mon, Jul 13, 2026 at 11:39:05PM +0530, Prasad Kumpatla wrote:
>> This series add support for sound card on Qualcomm Hawi boards.
>>
>> This series depends on:
>> 	- https://lore.kernel.org/all/20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com/
> 
> Which is a not directly legible link to "ASoC: qcom: add AudioReach TDM
> backend support" which itself has a dependency on some further in flight
> stuff also specified as a link to some random message ID with whatever
> pile of problems that has.
> 
> This isn't directed at you specifically, this is a general problem which
> seems to be getting worse and worse with the Qualcomm patches.  There's
> multi-level stacks of dependencies, the dependencies are hard to follow
> and nothing seems to be moving at any great pace so I'm ending up with
> my review queue clogged with things which don't even apply due to the in
> flight stuff and it's hard to figure out what's going on.  Can you all
> please coordinate with each other and try to get whatever is at the
> bottom of these stacks of dependencies in?  If you have to send changes
> based on some in flight things specify those dependencies in so they're
> readable from the email.  Right now it just seems like there's a
> constant stream of stuff being thrown over the wall without any review
> going on.

Sorry Mark about this mess and I agree with your statement about both
reviews and flood of patches with multiple dependencies send by
different engineers.

I will try to fix the review side (bring in more people) and make sure
that some of these series endups in a maintainer friendly way.

--srini
> 
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.


