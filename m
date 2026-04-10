Return-Path: <linux-arm-msm+bounces-102588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKp6LlON2GmMfAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:40:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCDB3D2588
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FF313009CEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9259339B3D;
	Fri, 10 Apr 2026 05:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZecMkZHq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAWGYqyZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7150430FC23
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775799632; cv=none; b=A59hFuRdw0xLAZAHaipMnhK6F6uhE96iUx4WqreKxa3NBcCzVSATgLSx1O3+9m4dvAmu84+7OJQYZrcy48Lo9ioWmFROC38kpF9BDUl4dzFUAs3veQeDE5K+oiVZxBs5LVE3b8ZkJb45/45R38zoEe2awdGO6bmZ4/Yx85qYt4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775799632; c=relaxed/simple;
	bh=TP9W1/vr5g6Ajt9WHgalU9mKPslVHZAMY8HCinsiB/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDDxXz2t8WvU2Pxifs2Wl1wIdj7nQj/KLlAfAvAxBZUPYlr3UIfMlWWoDmS2gBUeN0/zvi4ff11DrO+9XqeuGofwlGhmW3h8TGFbVAaDHq82Xf3x6h9mNjdOTD+254XcbPs41x20L3PzlHDCL2xbhZuJ8LTbPlpkzqFSNqsfQTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZecMkZHq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAWGYqyZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A1j7A1115045
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DcNacFAO9bIM6QzaU9Jv2x9Xq7zx68ZMs6W4qHDrfsQ=; b=ZecMkZHqILLn3LPt
	ooHSjMQVIz50mQ2we/rycYGl3BCvzfgYvb6P9BCNAjRieeCkl2AxWDmkQQJwtIEA
	S7Fsvanb3uzugSZ5/fKNcIohDmtPnFQ+NcDvRuYuc/jy3KaKhmeKlr4fQAy7olfL
	XGZ9mRFSN6lCqAFg0kMdz/CC2h7x/8WVNmSEWAonrLvJwDnelUlWSHYU8dhg4Wjy
	MLoF2ITu46MWioQixJR1Kc1arqZR6eAX5Xao/iMFlXIVxU8fdNTJ6LAyFOTLceEX
	vSlDpYeOOT29KYGrfoz3+ADgXO9FhRlUwhrgF9BtCDvtxm5sT1d+1lGQpJ/+c7PH
	QAtedA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dee8xafc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:40:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so2180853a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 22:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775799629; x=1776404429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DcNacFAO9bIM6QzaU9Jv2x9Xq7zx68ZMs6W4qHDrfsQ=;
        b=IAWGYqyZZ8NzGriCt+z9kIVcHeMU5YvYATiKaJUCAR+bcwovPtjrPYF6TnWvr8XqVu
         c9pZjcBI6sbX9nynfSFg/3mkfbKVzA4dHTUabL6W/5MnOtkniEXM4ykJ6W4W2RYIbWTy
         U1sTYtjuohqLjKLGAWhJKwD4irjXdJ2HAXcjCJti4FtKoVkFllhNicKpJmg9N0q4Cti+
         vYSoiL6oIDPIWjr+wkD6RfQtQqNsaIE11m0l+90AVdVJwN7/mqxLTqziGCPuFFM7VDyL
         WNU14aKGpdJXzZsli137QLlFvXchC8XV/CNToavx0G0cUHMqGipczJt4dpIGph/q2TZr
         ALeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775799629; x=1776404429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcNacFAO9bIM6QzaU9Jv2x9Xq7zx68ZMs6W4qHDrfsQ=;
        b=PsTmuBh19/+NfOhx0WR5TeBDyIpa9S1weQdxLuNynThOWLkzPjy9S3/hERcu6Yv3F4
         zcaJmg66nJWmJKl0TmpoiVNZsiEIEe/Ri8pS1WCj68nLe1n1fKAfedCl2qE5KONOvXm9
         KNEfwA3X8Ef3SjTczNEyTaZIxEYan/UGYcT4unGZjv9tT4sFPsSYQHd62kALixPcvai6
         8vS9h9h1fkkqCAEon8kzit4LwXfb7nl6Y0f0wrFMl+JCU6Q6NaLdsOzJsLVSi78LsL6b
         e/o7fd/pM4h2rs9cqQD8UOHFsa9aYNukKT/HXUPecOL03JWXpi2fFmx5M0ztoEueCrXz
         3d3A==
X-Forwarded-Encrypted: i=1; AJvYcCVNDzN8kNCCNwFGC+ThZfjDmmz9HDo1THglqQ/EjrX+dHVboLbQMqyO5XAPetkERocX55oKsuChUZd0pYno@vger.kernel.org
X-Gm-Message-State: AOJu0YxkhY9jYBNSyms+djvRUWqaEld3/Ssqlh/wxHc6emUliB5Rsv1W
	H+wRAj+UC354IolbmabYoN1jG+rT3fU7KKnN5aWtJJWpLXBH4kx1ds30ghqxtVq2SWnqnp3csVQ
	2U/tFyzxNqw6LWHyfzNzgu9DfNjjhggd9bLiRypAGMn3jS5W0/08Ypw9L3C5vtYo1ob+E
X-Gm-Gg: AeBDiesH1zeVAQ25aGU+I5Mv1RfDTTgRjDzTshLYt5Leq8uTw8EOJv1IWqP4/NYHf2/
	Qe26UwyjENye04v3V+HtXDAD0zr71cjFmeV2x4TTCtZ1dgjc8WElQnwWRM74+VOllhX0bbJsxXJ
	KLAL8m2gjvonrHCwNsZhGb4cMkfmEQZXE7bkssuWntUVpzfmxagJsYjVvEVreF3yswzLb/gMSP9
	OlI9Ef1w6NJWCcfYPPvuUlE3CL8GQoog1pO0aI7AqB1E1QmaikZDt1YG/XzHjrP6IGq+gqe0pas
	qiWiTMU01LVYGl1uDNKwwvmKuK1yvWGFAr7wBm2bjjYyVn7tlGIbieG1gVBQ71nmwpPKxQQscq7
	KSfe+iASzlJaCuuZzI5smM36L7JJ7wBsJhaiwlQOL6Nwbhg==
X-Received: by 2002:a17:90b:2e84:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-35e42768bfemr1877311a91.7.1775799629414;
        Thu, 09 Apr 2026 22:40:29 -0700 (PDT)
X-Received: by 2002:a17:90b:2e84:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-35e42768bfemr1877286a91.7.1775799628889;
        Thu, 09 Apr 2026 22:40:28 -0700 (PDT)
Received: from [10.218.15.94] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e41345f63sm1765599a91.16.2026.04.09.22.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 22:40:28 -0700 (PDT)
Message-ID: <8d97669b-7bde-4a21-8131-0907554f534e@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:10:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
 <fea78031-e570-4348-a4b3-d113b5749fec@sirena.org.uk>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <fea78031-e570-4348-a4b3-d113b5749fec@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA1MCBTYWx0ZWRfX9Cc19TnrgZ0A
 hJoObTBjXM/W6vTC1k8Yia4tC5J08h+SOEEXuwsWtnVCb7Fv5QFUzvJe+e08blgBsYeZjypqlBR
 EHcRJdjpM7hg9m/CS0GyCzSRIkREo/NlpftQvs13Rsjr5+PRonhpux7I8sa8bZyznCaWEMQvIWb
 O4cL+E0Z2rV3iycIEzrljza7ivqoGrQBlM5PqQgaZp7EL82NodIhN0ZgQVM0xV+KxmskKP9IEPW
 UnRJ77PQ9s31rhmBhnmGCgPLxYMialgGFzvWQpfRWP3XAuR0Vf7QgOHo29lnPK33C4QvpCCbrwu
 oP4o9XFJkmtmyfO4brLDqaeWpK++JoZ7wsN795ln/oYInF7zJ62o31dk2ex2XJXrAcskS/fVw56
 FEzkenWLjSACg3MvuDeZqbrtsPGVX6X6SrLFC1KgZk+o1H8X9vNUrwDiW9nsDsxFinjZQy/OW4/
 W3JmxrLXrhHjDYPcsKg==
X-Proofpoint-GUID: b-qzAcrmONJj4ER-eKgGXpTqHZ8AH3vB
X-Proofpoint-ORIG-GUID: b-qzAcrmONJj4ER-eKgGXpTqHZ8AH3vB
X-Authority-Analysis: v=2.4 cv=O7YJeh9W c=1 sm=1 tr=0 ts=69d88d4e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Tjl11wupZS1xL07QWgYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100050
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-102588-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karthik.s@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FCDB3D2588
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi @Mark ,

On the indus mezz skew, The codec rails are distributed through fixed 
Vdd (3.3V supply). These rails are Board‑controlled , not switched by 
the codec and not power‑cycled dynamically. There is no per‑codec 
enable/disable control exposed to software.The codec is wired to rails 
that are always powered when the board is powered. Hence this justifies 
it being handled as a board dt property.

On 4/2/2026 4:53 PM, Mark Brown wrote:
> On Thu, Apr 02, 2026 at 12:52:56PM +0530, karthik.s wrote:
>> Add has_always_on_supplies for managing regulators. Indicates that the
>> codec power supplies are provided by the board as always-on rails and
>> are not switchable by the codec or its associated regulators. This implies
>> that the codec supply regulators are always enabled by the system and
>> must not be requested or enabled by the codec driver.
> Same issue, why would we want this?

Thanks and regards,
Karthik S


