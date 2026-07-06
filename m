Return-Path: <linux-arm-msm+bounces-116734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2CywAJyYS2rmWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:59:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 508B77102C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:59:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gkKoo6P+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LhMBEn0z;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116734-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116734-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB47A3850D11
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61916432BFD;
	Mon,  6 Jul 2026 09:40:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCD342B310
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:40:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330818; cv=none; b=ay2p5HtjuHl+913b1iagSzPB3QDFs9pn6PUwj3PHP9zHzIN68iQT8iGF7jmJdsbxXYBWv2wTzX3G1rdPEnCEs+TG3W094yRy2co7FUs1hNTLcLPoVTystLRIyDVL1j9Kr74uwFpWK4jbq3Y4P6FS9eqh3X0Fi+MAHRn98QRABrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330818; c=relaxed/simple;
	bh=/mGvhP+bM/UE7zk3QUuSnK0plHwAziRdFpYlJdVwdK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ngcRLCgSb0Nyp7hIz2cX9Q8sAxTPsQbWOQqHfGyebeINqDWbo+6Pk9zJZq1ZQtGAfjnz+1gajkkhXe+AdjRzhW1mYKVDzb+uSsZO6jIOLu1QFQL9gQtR2UVk/8gbLdHpaH7d7Nk0Dh0Fuuu78SOdU2/WD6rup/gY32jLF/xaP9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gkKoo6P+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhMBEn0z; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693wDc107718
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ut+TLtnWZIvlepOTyMstyRteyQgk6ZW9hRzle6ONrB8=; b=gkKoo6P+MsiYfvVT
	aGNasdm0QPQYJinayQVEtPkSO1T0jI3VFfioSA3AQNpd8fQgzbmEBKn3b8Q6/ww7
	vAFW21F5jz6MaGtb6V0fXlR1JDQ70KAbVf/vDbxiIlLxZuO8qiw3l+tm2GZJe6vw
	aQRrzDmJx9TAvUxEu2Eja5UC6jTzT7qku/mMdkpVYd5prABCk2NgFYoKgUyDahuO
	6NGYb5nubl7scvyy00uameIM8+ltJ5nTvxKLzZ9rDp5vwZQ9QjC2kZL31KxKWZLU
	cPCnbqwuw2ToWLcyYAGyMfVdUPLnRYOnF8kCRxgMK5PKiA2Rtm0071BS+w/HYEX8
	fWFuHw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891ur7kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:40:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c267931ebso19305201cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330813; x=1783935613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ut+TLtnWZIvlepOTyMstyRteyQgk6ZW9hRzle6ONrB8=;
        b=LhMBEn0zxWA1jTroFpXPsjtMVnGwPuxb/EBRZdSm1b5uVqxcbZCEm4jerQ3K6f2swo
         2uRSohYd5Sbos3+cSAVTaIWL5L2YHbMfpKqB4NxnqZJ0n5LRd5m4fUefZ2ldjKuwDvd2
         kyEk6j92DFpYz+7xiBJZy2P0CW2/Aqyn8jegW7+768LYpPJ8rbgCNVRg1+sxRR13HIYa
         hd33q6yRQIOMh9GAfAxgoqdQ3tB2WgGLDj7eFfb3a0f+2tMdGzKNdcnOj8jBRjPeDAge
         T6OfnAr4qFpmWaqoOdVcYqgJ85T8SG0o9f9TRdvBglUIAY8Qo6TpT+XCaFEW6/khBv8v
         Yubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330813; x=1783935613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ut+TLtnWZIvlepOTyMstyRteyQgk6ZW9hRzle6ONrB8=;
        b=l+pzPkWy8iHdM6hU0D0eo+IrsWxbf5x0nhnM+hNqKPc581IW2buLvVt6MjJ0NlHpeo
         FbTLhLNWwEwM49wAY9oeEcFqNV5iict/sKYgxHS/TguVGJLsqizIj96YqQ4YHrgwj4NB
         RsjBxG+Y7D/poQiLSiFsXbzJlULem17F5HYJPE9nLcj6qQlaDVugOnlZns1EG2opitv2
         cWvPBu1wlqx4kolTXrGYHusoMrtXxFXKf1zEplaS7d0UjeWr6vHgVnv/nifkWVrwbXTI
         6T4gSJq6GxGv0RWiTVNarPEUVnzM7kdcVDZLRk3KbX43k6cnNvrR2XoVFXz+wLbf1Jgx
         EZng==
X-Forwarded-Encrypted: i=1; AHgh+RoaiPmCMmFwqBJVwQfxNlO52qwv9lN006bcvZaChS989mzNZztXkVTD2wQax1OsL21MgemVHqf/pgATfOzm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Ei/0MXj4dHu9SOzSxjL4CpPjgbdCAC/81uXj2QsC8Inw3UCm
	qLYanEksf8Dkq+Tr47xuaIAlVksf2vIg2b9kpjJeRmIuJntQ3imV971erqdHQguj6qC0oc4tVXT
	+BLA5CK4UdgsKjHL6cVHlz0xALvjQ0n/mr1oek7Y1Xo2TsBJdZO1orgPvBQMp4IQwxLXa
X-Gm-Gg: AfdE7cmsYGiPqHgdkjv8LzFelkVF28ESThwAtiiNI/TlmrKEDL3fssB9JZAJBWz8Npr
	XIhxUXmWgwREjaTn3CoAh9QITOYi4EDBKXS8tc6RKBKj64nyvqR6GCwZ0ta7DKTc2xOcJVT0/Sp
	xkqU58fCGOAq/fL5oGUVoCo3od1iZxU02NyQZPZ4bsxDwSlx25UwVtb+rS46I/++vGSrdJTQpXm
	osVRPFKuK5CSQejV40U7YpX00q7Vwfzi3yZR2U5/ou4H0BEP6ApJ4+DPKHcHfgyRkHVQZIiKgEB
	pMX8FMNyDCvp8RNd3QY0tnQChg3NWFznRdYnBboaRaL3+UDItb3OCAVfqoGb0pHq3fQ3vwhVAsp
	X9izf2raPii2KwR+xvKRnOznoP9g1IkHt2k4=
X-Received: by 2002:ac8:5989:0:b0:51a:8079:795e with SMTP id d75a77b69052e-51c4bd8eb68mr114023161cf.4.1783330813247;
        Mon, 06 Jul 2026 02:40:13 -0700 (PDT)
X-Received: by 2002:ac8:5989:0:b0:51a:8079:795e with SMTP id d75a77b69052e-51c4bd8eb68mr114022901cf.4.1783330812816;
        Mon, 06 Jul 2026 02:40:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c16fsm728351866b.37.2026.07.06.02.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:40:12 -0700 (PDT)
Message-ID: <a1ce3c2b-4a68-424c-9aac-6cfaf6a98a24@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:40:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] ASoC: qcom: sdm845: use DSP_A format for TDM
 codec DAIs
To: David Heidelberg <david@ixit.cz>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-2-3b66f33859f1@ixit.cz>
 <15493c41-51ec-47f1-be1f-d211a970e487@oss.qualcomm.com>
 <f71e9b9b-a023-4d07-a6ca-58714ee22d06@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f71e9b9b-a023-4d07-a6ca-58714ee22d06@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: He1AKGuDor4s_qQtDRmoYMycT4E9VyjI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX1FR6YEVGTh74
 OXcpdImPKIeNFbSWDHt7fh3wC8GDiIkn/NySiJeknh/s0pEmKKogRqnl7C4fTOl3DvcPrEnsfbK
 W2kOc+v0jHCXjVsgJDNWeZW8fOqSL+g=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b77fe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=widc2lmKH10sdeCS_vkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX7wqp7XlGg2NN
 GDqBxthQsvMKTlJ0OrnGcLxjF3dNzG6EmgeT6Qzsamv9qkDecZHR5+d6xG4YEDLAMXgpvPMHQO+
 Rq/xyVzH53L1J3N0qIqAcvdpDLeLYnZhrnC8azOTUj3q9e+Gan8PN7R48u/rO9fwHPCmPiKQcfy
 yE9YhQiPs7eOWw60R6b+BTGRdgjWsLm6tiLv5I3Y1ptNRm3q7Y7XmmZRrzMKhjdH9eNmFNOqZd4
 19BUOj31uXhX0uUauzliA4MOIa6DyrycWb/9JxNYrh21+TVvF49xaxL4jRpG3WDWppabRRkv7xs
 E5soO8CQraPGsdciVTp/T4Eli8feQFCXCBxdpyB0HLrPCD2AzUrcQCeJ4iRYYExvcNjPw1axqaO
 5R1VOfn6kJsGEV4t/yHuZlHldTyUF1u7gs53FgGAZ4F5WyAkjK2J5hz6JrMDxaOb/uCpc8sFI/5
 nG/T+57IVB4cE7T4+OQ==
X-Proofpoint-ORIG-GUID: He1AKGuDor4s_qQtDRmoYMycT4E9VyjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116734-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,perex.cz,suse.com,cirrus.com,opensource.cirrus.com];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:drhodes@opensource.cirrus.com,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:devicetree@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 508B77102C8

On 7/6/26 11:15 AM, David Heidelberg wrote:
> On 06/07/2026 10:33, Konrad Dybcio wrote:
>> On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Before the DSP_B only worked because the only close-to-mainline consumer
>>> cs35l36 codec was patched to map both DSP_A and DSP_B to the same
>>> hardware register value (asp_fmt = 0), which is inherently DSP_A timing.
>>> Use the right codec (DSP_A) which works as expected.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>
>> Fixes?
>>
> 
> I was thinking about it, but I don't see any mainline consumer of TDM within the sdm845 arch.
> 
> If you think it make sense, I'll mark it.

I personally think Fixes makes sense whenever the code is fixed,
not only if there's a user-visible bug. Up to you.

Konrad

