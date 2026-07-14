Return-Path: <linux-arm-msm+bounces-119013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0DvnEKUkVmqkzwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:59:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AB7754300
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:59:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m5nFkIn7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N9nNMVWv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119013-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119013-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BD1E30269DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 11:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B09381B02;
	Tue, 14 Jul 2026 11:57:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A64379EC6
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 11:57:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030239; cv=none; b=c0f7E8MuZzkABjSnY3R+rdYpSMiiLoCL5+1I8MGpTP1b0be0CZGdtfl3L8gytkDrK+ji03x2P+VzB1vRKoc+biaAqY07tvqRID3TF5xsnXQAl25e5CvfTj0qcNfR6sbjT6EigFEDyP976ofyB4kmO2I1Ks2c5W2eSIBoF/nEhEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030239; c=relaxed/simple;
	bh=2+AAB9ojmWH2Lt2acUSHVRK1Gw6u3D/EWC7gt2Xgakg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2DqVXNvNqSyhyEasl82/hyLL4uJqlGy7Ns5wKApJqA0LEZGCbEBFCk4OotblBgjuxGZH+5i94w/ewmhwbC2KL2P9zIIc+6peQ8hAXvCu4+d/FPVtwtX3INxnoUSAZRhy681DZ+VcG1T2qUsZLphbjnqN7oZD8mLejkdCFJTrdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5nFkIn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9nNMVWv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBO7j9108249
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 11:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXPywjyACU/KI48Qc2v9kds1qdzaQAU2wEA0rakHjIQ=; b=m5nFkIn7jw4pY86o
	XH+kZrndhUfAkBZoFK1jFEdxHs0iFR7rUlLEqq20liXEzv1qnExr3eK5d/K30GPI
	i3FW9yoDBVR7mXbLpXJOYnLQA/nFj1mj9Z99FnWIVGc5xcyYT5JHkD/sJ3UCOerx
	vRjMrV5qQ/EV3ecfT77/PY8Gas0ZoRZ6PFfXirfrTkPOW4qSMamsZk9f3woL77Zd
	v5p9yMbGeLtbmbNdAmWi7l8G+F0MI1RtlHCNlKLoApNw/gOM4GdHOZxnBE27HkqG
	08tuObOScjmEBijTnVt6PrwqTuwMRebr322rCRJbFQ94BS9S+l2HxB59jLKVXalh
	w3Zj7g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdesa9eru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 11:57:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3810960140eso4897383a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784030236; x=1784635036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXPywjyACU/KI48Qc2v9kds1qdzaQAU2wEA0rakHjIQ=;
        b=N9nNMVWvzkhoSvUjYH+IAiJddLm5xGVp8HLUTFZQpZMGgaq4hhzt9fu07uffRJj8Ng
         XVBffr8QiM+EmlktHWY9iP1Csleu7gZwD/DXloD7ISnb3VckdxXCcdr4wfPjWTUNNLxw
         HbSLeP3B/NDi0CMIFJKqKvhxq7vz16rivQYVd4es5fVzCsWkLGpwo2jM5yd/nKw+VC8b
         6VO7GUt3bgOHEitxow4W/Brtk1FPeCHKA6ymTfoohB2rvgNPvxYEdqcVcY6ZpnaWNs3T
         aV6xcVw9D2whM9CaI9ytdFGZphEuWBRK3AlVu36Ho93Vte7QuZW4PvOZW6qt8Jl9tWE1
         og3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030236; x=1784635036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXPywjyACU/KI48Qc2v9kds1qdzaQAU2wEA0rakHjIQ=;
        b=A3uR2+LVC0buua9jOXwblotiNRlLEVZ6C0oH5i76Iy7RyTF41F2hrhTUkSrOXUKTVJ
         30BCUsAIgigvca65Dbczb9jC1ntPwx0Cbx6bePAoPqItiB9Wm/e3foBd/3n06oJk49zb
         oCeksuY4EZa/UQV8zC6oyyl2jXykysfsi+B0ehBeqwAoEctxt5ZApXdzLATAHqirk2ke
         ZiwT3Q1lr7/MZb5zkjus5K1/yt/f7UI9gqG+yA7+TPVy4v6eapfqWrrsKq5D7LTtLEV5
         5RN+cZwISpmt8YJu+5/CEePi9kNYTynlY+r+hTz9ZbTG7c9lMpALD7KfS9i2OnlpNr4n
         ToQw==
X-Forwarded-Encrypted: i=1; AHgh+Rodobv7zjuHo29fywZxXrH4ShRT+U0tistuIIR1sjkvOlSU3p7Y9kwLaKqFOA9fXHQH2IEf0yx2nBE4KxG1@vger.kernel.org
X-Gm-Message-State: AOJu0YyGz4r1KbnpLrUBTyOBhiwcB2xCCzZawoRnmsnoH9abWRyCubAN
	7VvDXnBDOTl6I2w6uaiMFskCV3xOqYIWiQjpOSGlvwpGyIlSJtB1XiO9+6u/TPeAO8OYsRO/fNW
	QCdvVhM8fZMtKncp+fruyn9dxe+G1fVzl5uZ+qIr82wp7Ot5ZDiW2+Ow0R+bSZXv+bUbA
X-Gm-Gg: AfdE7cnhSV2zd62Am5O1JtPJPV75kHwEfI2otrEoY+9IsMhGLh1ix7UfW1niaM8nTCa
	16xyuxzt0zo5tLhKvv/0dNlRkjoL+/joUi3Sv6LiJcFu6JcT0GhKko9GnOiMZYJ3lmvC2j4Bczb
	yNacBpD6SNU0UNnvG5LIMDbpI2ngdLAbjO/PdNfRr6v5Q5guvt+lF2lzhidy9vvBagFNIDPMCm/
	p6npzy8DmIIk5ks8ubeL7M9TGgLempVNXGBlQ6j2I6IBq1MgWuHK/zUgYtuNuccDgTuybLe7iTG
	P2klXbmEcBrfFb44vhMm/2B8X3l1niVxFL+R2E5iwjAL/tWzR0RZslpxnyPFcla4zrvfgqSEXEQ
	7LFKhsOjea9VWgk8imN7RIqt4KJEFyi4RKwvLW3iBeoA2
X-Received: by 2002:a17:90b:54c4:b0:37e:2053:348f with SMTP id 98e67ed59e1d1-38e17e4442cmr2697091a91.25.1784030236469;
        Tue, 14 Jul 2026 04:57:16 -0700 (PDT)
X-Received: by 2002:a17:90b:54c4:b0:37e:2053:348f with SMTP id 98e67ed59e1d1-38e17e4442cmr2697064a91.25.1784030236041;
        Tue, 14 Jul 2026 04:57:16 -0700 (PDT)
Received: from [10.219.49.235] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4b97661sm48263936eec.7.2026.07.14.04.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 04:57:15 -0700 (PDT)
Message-ID: <6ce00e9f-66fb-4c45-9a3d-f442aa230951@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 17:27:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] ASoC: dt-bindings: qcom,sm8250: Add Hawi sound
 card
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713180907.874954-1-prasad.kumpatla@oss.qualcomm.com>
 <d67a4f47-82b4-49d5-b851-d3388651e660@sirena.org.uk>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <d67a4f47-82b4-49d5-b851-d3388651e660@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyNCBTYWx0ZWRfX2qJuDuuddfUT
 OEMagzetl8OB/pL6uI9h6I7YZeE3IQXf3EbKPaeqw2LBd0TYpokn0WYp4KSVJBWcgRKV8YhXs4i
 Aoy69ufh5e7nNzsR3vE88+NMZdBwPqQ=
X-Proofpoint-GUID: OhhsG68tXNRQFELaQzFB8filWoLxm3D2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyNCBTYWx0ZWRfX/uJJqOkMenZb
 BHBIMKHipFv8TL5qUb2okioiCj/HRp3qW5oNLI7W7x2L+uKYUjdI4KoYEHFKgPPvP74zr2xctUU
 3CPC2mTdBbX1vuDxtaNshEmDE4phcd58xyIbX9/Vous9DVELtaVBwTYuhmKk5nwmgJtGYLh2RKz
 qxEfeUuF3AUkKKvzEi3imOAhLGzRAuCAxtKHgTmsKjAuDofePALcWRjTuocxqCtoF6lFgjrPX6s
 yrXOxPtehJ4GUYs3OiyKFBRKk0DylgOG9URQ9s9/OFvBXD7baB29PLvxOTEuUrtuRavmGXCAn2D
 82IRoFrv0wSiuOnCEu6Buw041pwd4vkqnNwZZm0NlJ4zTUuPJ4ZMvfObnRctJOFr4yogy5dbwhC
 XRWcgvFs9jjNrqKSFSJ4M39zPPxWoDGiq2/uJVhHXncNd6nQXd+jUreXBaiAA07I6/m+n7EgQmg
 pTpMaSq4hQHivZLwS3w==
X-Authority-Analysis: v=2.4 cv=PZLPQChd c=1 sm=1 tr=0 ts=6a56241d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KJAHXRm5T7kSH1rCH1oA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: OhhsG68tXNRQFELaQzFB8filWoLxm3D2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-119013-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: A3AB7754300


On 7/14/2026 12:52 AM, Mark Brown wrote:
> On Mon, Jul 13, 2026 at 11:39:05PM +0530, Prasad Kumpatla wrote:
>> This series add support for sound card on Qualcomm Hawi boards.
>>
>> This series depends on:
>> 	- https://lore.kernel.org/all/20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com/
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
>
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.

Hi Mark,

Thank you for the feedback and for highlighting this broader issue.

That's a fair point. I'll update the cover letter to include concise,
human-readable descriptions of the dependency chain and the purpose of
each prerequisite series, rather than relying solely on lore links.

I appreciate the guidance and will incorporate this in the next revision.

Thanks,
Prasad


