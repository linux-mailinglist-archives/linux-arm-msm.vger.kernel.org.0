Return-Path: <linux-arm-msm+bounces-116752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jPo8N3WFS2p9SwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:37:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC9870F44D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:37:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L91Bmjwj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gqh56VPl;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116752-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116752-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19A7A301F6F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78BD3C65FD;
	Mon,  6 Jul 2026 10:37:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEDC3DDDAA
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 10:37:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334229; cv=none; b=EW7bg7LECCJHP20fme+IJ5OSKVnsl7PgYZo65Rje/mQonszzsCOIIHcC9ho6L2yVufzT4bY2MUvgBJKIJLfiv+2nsQcfZ7+a3IZ1cy7QAZ7XglUQ3lOt4B5h+/RsTbOyW3gz9qPQtGso5VNQ4bxj6jdL3yt0gcHWgj49knqpr3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334229; c=relaxed/simple;
	bh=chib4Wmg4NNOhfRRVVf8fIUKZ9B6vaZsPTvrdjRASog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mUMMpSagsoN38PEJn02gfZL4/msqU1oR6M6zaRBWxFfxNInyKuVKTPNxYX3l69Mlf1MM91vT+iNzsr2QFzGyW2hkWj9cHn6/GR972RBPridLNRhunNKSOJguqGC7rJ3DAx0s6M+oLs6Cs/3YHW83IlRNeilTZBEs8EoSeq65uXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L91Bmjwj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqh56VPl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666940O0109200
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 10:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdiCMuLc38MUQcjEkFqoC4yvkqdVQieeoQZppe+XN5A=; b=L91BmjwjN3S3sbBM
	0QkVH2/17oIauo1HMdzbXHrhkvgNs4Yt1JUTRUSOR4ClanB05qcBf+UIGVggpqoB
	wGQzMj3mwp8OW9QQ6C0tS4NhfbUGlKKA7MJXTFRpVeRYOG1JY6swuYcoS4MNdpWX
	lZ7Jx0L+6R9HMFXMwwUOrDVr6nxzyP6gQEYndfM5dXbc5J7wieT6uOmtMC/Ao2M5
	Ou+HlVqW3pjppktmFezr9nUF5vaSNkLUUeRuDs6wfjzJDz5Lo1XOQs8aBWis3wrw
	9P95SwEKq84pEKWhVarJ2q/nE/VrBStmSAhQlSiUUgzY7+6odhIKKXDEBK5mAiit
	WroWIQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h98m7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:37:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c27616421so11137141cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783334226; x=1783939026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MdiCMuLc38MUQcjEkFqoC4yvkqdVQieeoQZppe+XN5A=;
        b=gqh56VPl8x4kYxrbDUenG1aerRZ2f0au46RoSwsFYj86H9YXy+XOA1EaIOdVp4Hd6A
         j5pl7gS5nOOd25kU1uwYxwbR7UYbh7aqUxOpgP8KXJxx5IWd2BeR0uLl851NXXwAUlZ3
         dTAlwPpWtIKAPsJiWBE0Bg4rXxqhBYeOH3YoRZgocFGAIj6Sxc0NGnM5pUsRiG8UvfBV
         TLXpW8UfFgEm5JR3CCDnP++TujqQK76Mr5WVTkS2bqtsgy3SqbZCG7rRuBbhVTfKrr7z
         CWMQp8Mgu9Yz6dsK5bn2pbjz5Oi4ax0uf5+huL51j+fQD8l5TeSkepjsF57q65AZIA00
         WXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334226; x=1783939026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdiCMuLc38MUQcjEkFqoC4yvkqdVQieeoQZppe+XN5A=;
        b=MlxBdn880ZxNfzCVKB1iGByMI08F2MXX/4FdYwkACIArcx62SKOAHHbMulXQH6pgIJ
         57mnn+m6+8N+ncFk66l2Rs326K9F/ybley6TyUHAq3Fh9Ji55xlp7OBGPPbg67MBFE9Y
         20yFMAXdGTMCLsRLYfg7ILVPen0ab0iv9b0rFUBfHAiBQl3ccMbJjRyDZ0sPExDqYUWu
         8DAn4C1ALjv/++0Sc9LvNfB5EZwvQMwLdDZp2uiXR3bTzVXipcFNWHkGU1KhvBTjOWou
         La9RpK6PRUOqRAfACIyRVGmGktZTHI2XEKpTQcLvT4/4HdYtGov4haK8UFlb1AMudpyl
         34/Q==
X-Gm-Message-State: AOJu0YzZN0r5Jo/T853kdH+1zyE44Z2Rv3Xb8vPM13H1l2a4ln5XIBnV
	8ZvWf9QiPCFlXYlGMhMb+MxAgDmdNv9fFLmn53e9lsORuw4pR4dyrdbl7adHeetPeu3Flq++ww2
	/BQlQslwD4Y1lCWZQrAY6QCtL7VBPGUHuqvokQZdSJLLkY0LJQ8NGoxdqzoOFSDHuPZTI
X-Gm-Gg: AfdE7cl4jH7D3KhCyFlPwodq8XDxoYAGVegxJvN8ksarw2T+swqYAOGE1iRxZgd0OUS
	HloTFxvG5iOTHuKLTTX4sY+Gz8q991aK5nV4ztbWrFB+bSwCXnxWtVJNEZYPI2+lPb6PVF2qLpC
	Cauzv+E/alGrFvA4D0/S8OqKD1PIeDG5rdErzk2R2EuChavHrO1CfNFpp2jpuTVG91rh1kkEUUw
	76vOiFBnWbq1baQHZSbFfMezvfmvu/sfBZO7EvEhwN5wPKq5ZJ5O57hHOkNPqtyEUlAxnSb9zJj
	xzioHyz7KqBJjfEObgEHE0JMvKS8Pqj6mn5zaJ2Vuc4qMJnyhlsQEi6rOZR1xHUnpn8BvKtmYni
	YuJQqHGpr7JLSrUzb1UHM96tkIxghnyn5+k4=
X-Received: by 2002:ac8:57c2:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-51c4be98625mr92163451cf.7.1783334226634;
        Mon, 06 Jul 2026 03:37:06 -0700 (PDT)
X-Received: by 2002:ac8:57c2:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-51c4be98625mr92163261cf.7.1783334226158;
        Mon, 06 Jul 2026 03:37:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1370110sm2712752e87.9.2026.07.06.03.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:37:04 -0700 (PDT)
Message-ID: <4e521d62-9dad-4f51-bb16-1119dcc22056@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:37:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Acer Swift Go Pro
 AI (SFA14-11)
To: Kaipeng Zeng <kaipeng94@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
References: <20260702063156.35169-1-kaipeng94@gmail.com>
 <20260702063156.35169-3-kaipeng94@gmail.com>
 <5791feda-226a-4a22-a79e-e6b72be141b8@oss.qualcomm.com>
 <13138cbb-815d-46b1-aa82-cca6e44878a1@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <13138cbb-815d-46b1-aa82-cca6e44878a1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8TqRxIYOxrTFs0aqOf9f4eiDJDUrMegE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNiBTYWx0ZWRfXzU7lFqnARPiG
 UkXMVDepkuOotZBkmePt/wNRdaFu5N7zb6grWP+li48aIlSMZ0nEAfsFnX9MCcHQrbo9ZOJ/xlE
 ronMcYZCfFZnj7zGZDQFffYhVVFyZD8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNiBTYWx0ZWRfX6A/B2skzQ8uS
 bikbQaywEZN3PCMXOpNX7ZoBSdiGEH47EwR62VVL6CnXOzJvXIHYTnxrbhRGv3JQZWSi4EVyOvZ
 7oVpCdDXSeOrtQ5mm/3iK0dCgmDuc7mmJ2xs8rn9eVIJ6crmojvRRmov1keCjW2CspaBDb9ZClb
 CkHAY8H1GCiSHos9mmuaziP1il7oxHNLt6y5eiRdx7v2OnLn//2fasCm30EHMcFg4EpGcGR7dRe
 CadNiDeeaLVqVs7NZfr/bBQH6G409NWYsKyIUWLAMxYPJ3n8aXvP1e2P0hdIWk7zMjtFKDB2NM0
 wj9i8joLN0l9DMjxJ++Dmnj3j08zjl0gtAbHfGjZyWTPe+TNWEg4fCE2VSssw5ERQYReWBXa/pf
 K3JvVbZe95Om1uQM5misNmyBl73nVdrV3IjnmpUVWmfKKR81gYpt4zBJvuxctd6XA97CT7ipk4e
 sJo6Le+6FVlf5V86eGA==
X-Proofpoint-GUID: 8TqRxIYOxrTFs0aqOf9f4eiDJDUrMegE
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4b8553 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=5NA_9VLdZ0rIHjdVIKYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116752-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kaipeng94@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EC9870F44D

On 7/5/26 5:29 PM, Kaipeng Zeng wrote:
> 
> Hi Konrad,
> 
> On 7/2/26 19:45, Konrad Dybcio wrote:
>> On 7/2/26 8:31 AM, Kaipeng Zeng wrote:
>>> +    wcd938x: audio-codec {
>>
>> Nodes should be sorted - by 'reg' and unit address if there's one,
>> by name if there isn't (minus some special cases like GPIOs), see:
>>
>> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

[...]

>>> +&apps_rsc {
>>> +    regulators-0 {
>>> +        compatible = "qcom,pm8550-rpmh-regulators";
>>> +        qcom,pmic-id = "b";
>>
>> Have you verified this against the DSDT of your device? Incorrect
>> settings may lead to hw damage
>>
>> [...]
>>
> 
> Thank you for pointing this out, I had not verified this before.
> Looking inside the DSDT, I found some "PMICVREGVOTE" packages that list
> a value as the required voltage.
> And I need to check if any required voltage falls outside the
> range set by DTS. Is that correct?
> However, some PPP_RESOURCE_ID_* seem to be mentioned only and lack a specific voltage.
> For these, should I retain the original value (from x1e80100-crd.dtsi),
> or is there another way to determine their correct ranges?

You can only reasonably-safely copy settings for L12B and L15B (they
power always-on components) and regulators that supply the on-SoC
components (like PHYs). Everything else may be board specific, so avoid
if unsure.

> 
>>> +&iris {
>>> +    status = "okay";
>>
>> You need to specify a firmare path
>>
> 
> I will add a firmware path.
> But since the firmware of this device is not archived by linux-firmware, is it proper to use "qcom/x1e80100/ACER/SFA14-11/*.mbn" as the firmware path?

Yes, it's still useful if you e.g. keep a local firmware package, since
it allows for the same image to be reused across machines (you don't have
to overwrite the existing files)

Konrad

