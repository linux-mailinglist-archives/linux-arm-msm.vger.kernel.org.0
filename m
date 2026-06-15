Return-Path: <linux-arm-msm+bounces-113158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G1dYL9rYL2qKHwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:50:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB8B6857A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:50:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Iwx9c5eh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EKxkDM40;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113158-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113158-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 496143032CD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C46033D6D8;
	Mon, 15 Jun 2026 10:44:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA73339708
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:44:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520288; cv=none; b=O1y1PaKg2mMC9ar0fYAsSV61DW/sRoUT2+Q9DP3ANGBujbRgwUth/fxUP3nicUpNy8BzW2zR+7dWFcRc5REzIO8emSKReJmAuFnzbl3kgRmBzPkq1RiLqmNpeyF7sGpMKTGCG6VwWY45W/gOuUpvNTcJqpV5D3BseejYNLzx+uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520288; c=relaxed/simple;
	bh=68/HTyHPR6KVGQpmVIWbzZT7PDEyrxaPs8vAVZF28lA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KjMdLcp6DvhrJ/9Hk8OhGBRR8b+Xf1wHjMrdP8zxo+IprN0uMyEfMG4VO8VeSqAqE4a+bYWgiUlNyYo/HuKQS/3j48wsAOVRgcVL0qCiXs5YlOzytVSHYiFy1IN9chL9JIYVu3O+zP7KBjf50KKze5EZ+mk+NIITZlIhdZEeSOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iwx9c5eh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKxkDM40; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAId0F3813931
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3L1aoItvXKgSKcXjoUT8ZFQKPYF1tzuxSSufM8weEwQ=; b=Iwx9c5ehwf7NA5sY
	S2UVAgF9R04vz16jNYGptgnaZUIov2r5+bfxWaSSjZcRM5lQsgKkWv4mgcj1D/ro
	9LpOTTORjk1pB+ueUvI3S/0pdN2t6uJb2RngR/5EMYZvKz2/KDY48UvIqKuh9Xvz
	/2mpIep3hNp2XpiNoWqzWLBpvSwveu2V6R0mEQ7spq+py0B5/Lw7HbohEadhUenN
	DQp3hUUABbecLoTvqNDQuIWxIWwZs95FFpHdM/rS4/g5cKpAJoC2BztxYiNCQDVk
	pqdBYEGRvCahSEcVtNVAgZMbvzqRjNNT6Q0Vs9rU565iU7sxLvZIc14H+b7NfCke
	94Cwdg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjr9d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:44:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517741bcc53so7945861cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781520285; x=1782125085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3L1aoItvXKgSKcXjoUT8ZFQKPYF1tzuxSSufM8weEwQ=;
        b=EKxkDM40QleuoNB08yiIJfcycW7QhytnMlJv1NRJSbcihVGyu03CiTVPVbnde5Catx
         hS5KMu9kBJUqIlQFWzPge/tTWp4KVAHheuoXW+tvtNU31U6+U9diF3iuaPgP/bF2v9Sc
         lgI4p4T4FQRHW4JIZPgmmg2m6lfYxZJOXeFIY+9qKaipmBEHdL3AjJ7xDOMylIS5N6qe
         KLF/XVhjoq2oTL2R3j0lD5hL715SKAnLRev4RCdDVjFbopQMibRsNteR+252CqTP39id
         rATVkFHdJLhC+w5VxmTYeDYwLY00kqVpnMKELPnNx0sViHZQhLDENn00Ul3jx6s2wOja
         GLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520285; x=1782125085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3L1aoItvXKgSKcXjoUT8ZFQKPYF1tzuxSSufM8weEwQ=;
        b=oQbTGIYc0jRrNDIFSiMo8iYB84EvE14yJynnYu76DXiS7/VTgsorzRZ1GfqvVa6DpQ
         LzwQOxwtRZN5iDd2KXt/dC8VqeWaV6Xrxy9JMYJuB8C29S4eiwtHX5c/V/H9rkUzFPzG
         YGSZSJLfV6Iy6WggHyph3oA7JEUwLA3IZwjGpbkFLhcVC05TZmARw4kez+8Japc3pAC8
         n69qkUklE0nnplmj1+lOAX458jZGEm61UVcFo+b3bcbqM+iL13+tw3YxiVItM1rUSzzs
         nYxstoZk+mjuBYyWQJWBMcJpcA2IFpRQPAV9RiOxSZa28Wxc2zvQxipJ49QA758bMyP5
         uetw==
X-Gm-Message-State: AOJu0YzjTSIYW7XNosc8YGaP59od/9oFk+/oHG4lryFCEnrCzlwXkSr7
	ZceK4dMo/tLjS9x/EYwu5bvAu2lcOBdNSIIwgTnTGnliN+Z+D97J611hJXLB9dz2WS/pIcN+jhB
	pjZcIKimwKKgRCT3Jz5oKqXEcBP6hl8Mw3LU2J0CAV5Ak1vP7LzVQQpyUc2ao2rOoGLVg
X-Gm-Gg: Acq92OEYw5Q5cU3T5HkLS8WZEG6LkHIm2LKt2owrmNg3CArNYWa9lDzVsrjNXgxTNt5
	dPuKToIn1CSJouWcoJD+mNGbrZdRoCmi2ec6GB6yir+EiJCOESPfV3HVyehrqZ3BmEzZSbAUa17
	RuWpaWSoDHN/XQ+e2iYi8nKpKPAGAQxsT4/ah5NgXIxxN8wE2X4jwamzhmC4gp4z4BrIvNc7VAR
	QarhELvgb03pjpBv2L2sb1IEZjcnUt8Tbqwxf9Cb+ekmMilhC5g1z9jq2sl5ZA2cHo2z+C3r1QU
	51MYfO0ERsjZNjujIj9BIZpU6kCEWi05aEiQyRgT148vspmxEHTbLsIQjhb1maAptwmtBWRxG9P
	zF+hYT0bCdqHDpun+UR51qLPPn1epNqo2G7d/JwA4VX/1gw==
X-Received: by 2002:a05:620a:2892:b0:8f3:5988:f97c with SMTP id af79cd13be357-9161bc9eeabmr1256415685a.3.1781520284832;
        Mon, 15 Jun 2026 03:44:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2892:b0:8f3:5988:f97c with SMTP id af79cd13be357-9161bc9eeabmr1256412585a.3.1781520284254;
        Mon, 15 Jun 2026 03:44:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8341ba5sm444685566b.42.2026.06.15.03.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:44:43 -0700 (PDT)
Message-ID: <a51b6333-cd5a-4a38-b748-b6623c6a1078@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:44:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] phy: qcom-qusb2: Fix SM6115 init sequence
To: Iskren Chernev <me@iskren.info>, Konrad Dybcio <konradybcio@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
 <5b474af3-f651-4a64-a5b9-c18136e589eb@iskren.info>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5b474af3-f651-4a64-a5b9-c18136e589eb@iskren.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDExMyBTYWx0ZWRfX088MZbyKzQgZ
 qE4mLrls/on1ke6+3yCkuq6K3R4uv5xmbKI3sq64OBCzfmmi9ogp7l3VkJO1kJeAxaBdBPEXWDr
 E8Ic0qk3QPPmD0EHUSAoZ9W67QudVgmkm9U92A5baHHZgATnaUvBHXcI0U2Nbz4g6EObONM2noA
 u+Uz0RYI1p8Ieme8qKRGdb7MFE2A3jbycpIUT6yWijsiV85Q6vpegA1ib1OtBozZcEw7r2Z1Kyy
 CCDHXCAKqtu4hkKgEBdcaG8Dpv8pJd1+H6/wFVmcCHUJsA5+/N7UH26D1nRRqe/4IAb2FJT230d
 k5QN3+REaQV+KpP+JWscQgiIZTJJqEIezTv2rjpT41TpUh7A7CiBp/vhM6DBWOxyhfkMUBwbDIq
 MNt5pPi105Eh2HSVA3ouMSQS8eAQsuv0DfhB2OvV+CK7dD71A/i2ic3JrczwTiuPVjD9yGmRGZq
 /6YXCRsmlKuR/EjsV2A==
X-Proofpoint-ORIG-GUID: IDVcIB5p41MZUxlSdzF3Vt5cPTkMcHib
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDExMyBTYWx0ZWRfXxd94tRZ4A/xr
 JhvR7z5mMZEQw7I56nrTS2lkUiyuwgeHEVThXkRw2des6xms1JOf91VKqXQPJHkHTEXzl5N/oKY
 04nbktnml3BdHyEIo+IsuWsmnMCijLE=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a2fd79d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=H8nO66aeAAAA:8 a=sh5-wexBAAAA:20 a=EUspDBNiAAAA:8 a=MyJ6PO3ExZ6mTeW_YjAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=29nWO70QIcuf0NxZitda:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: IDVcIB5p41MZUxlSdzF3Vt5cPTkMcHib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150113
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
	TAGGED_FROM(0.00)[bounces-113158-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:me@iskren.info,m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mainlining.dev:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	HAS_WP_URI(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CB8B6857A1

On 6/14/26 2:29 PM, Iskren Chernev wrote:
> 
> 
> On 6/10/26 3:04 PM, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> I don't know where the existing one came from, but it's apparently
>> wrong, according to both docs and a downstream DT [1]. Fix it up.
> 
> They came from DTB extracted from a running billie2 (OnePlus Nord N100):
> [1] https://mainlining.dev/wp-content/uploads/2021/02/03_dtbdump_Qualcomm_Technologies_Inc._Bengal_SoC.dts
> 
> The phone was bough early after launch, so it could have been wrong/updated later.

Good to see you're still around!

Looks like vendor tuning. I see that even the initial commit for
6115 had the init sequence I posted. And the OnePlus sources have
what seems like a project-specific local copy of the DTSI:

https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250/blob/oneplus/SM4250_Q_10.0/arch/arm64/boot/dts/vendor/qcom/bengal-usb.dtsi#L145
https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250/blob/oneplus/SM4250_Q_10.0/arch/arm64/boot/dts/vendor/20882/bengal-usb.dtsi#L148

To support that, we should add a new property to override the TUNEx
registers - like e.g. qcom,hstx-trim-value that's already consumed

Would you like to look into that, or should I take this?

Konrad

