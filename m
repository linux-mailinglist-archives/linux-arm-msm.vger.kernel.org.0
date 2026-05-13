Return-Path: <linux-arm-msm+bounces-107441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLAdD0TMBGrMPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:08:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 927125399A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4C00300B627
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC303AE703;
	Wed, 13 May 2026 18:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+MR1Z8w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gHN2U8EV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F94E3A875B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698472; cv=none; b=t1kWcDlQ7dwlHFUTm+x06tlGQx74hnfgzfQe8sAfKL3BVW6cuX5YDUlck3EIh98Zs8IhcSp1brh/XfPITw1D7saCs+QZjzhcYIn/d3fsRB5nvskriyUkNNLcLOYY9gQfRzmTqbRAS0v+qaN1CB0iUt0bxSJO1A/nGlnTOXgq3eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698472; c=relaxed/simple;
	bh=xCtdLJBrpeaBbdoeA7fDJP+UQEBaql6EkAQTt7pLWDs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DPy/rCR9Rt3ZB1YgIy0M8gQ6iRA9UDagiKGAIgHXXPgBiVfcqLOaBPJd8ixKUyZsjVerpoaemTBZhA65X2Ui8HNxY4d4wUTeSxp3hoW50yzKhWDXz9XxXIT3a92nhwnGOvRR7qLn+AlT7asSU9wrzyqsW6WegSeEun+i+mKxuU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+MR1Z8w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHN2U8EV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF9bma4159600
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5+9ABfiTgEviLVxCigpN8KMZUuZ1D9IOP8UqN/QTG0=; b=T+MR1Z8w2Ehco19L
	k8W2WZq+8GiMn1b3IoiLpIPIOvz8w1hcEIai1BzccQwRor0PXvnh4JOTM3ARB4y+
	vKa/zmLtIjLP2nzKm5bO4nIw5MlY10rsoLF/JUPYzvWgrkq+AsrS3wk52erUuw6w
	t+cGtN6VaxGAkUNZtaT6+9YoIzkb9xhCQEUxKW4MmoSmMIhkZ2RhVmdqjPWoXC26
	y51yVbija1Fr2m41AsPffN+nnDxUueROIaaPhhM9UbCV350PMdNEMRNiY3W2T3Ra
	fA8XObv24Z9g7WXpYCaDyOsA+cT8aKs7sNeklLUTN2HvGyWo1hNZ2P/1O7ldcV+h
	smrO1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91tdvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:54:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662990c03fso4954908a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698468; x=1779303268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5+9ABfiTgEviLVxCigpN8KMZUuZ1D9IOP8UqN/QTG0=;
        b=gHN2U8EVlrP920+NZ4yAb0PnrKt0jDu/L9g9t4w2vH21fLKTxLS29VyyrK0tB2Rnl3
         dZFbTGL7VvyNqKfccwaKC3MuyMAHkskWpmrL7a1Ab8mw3gxrSpLTTIbMRlcxru81Y3g7
         hgIEaoSsf8koVeqT63Yow3swxRLZjkeH+nPdLo6K/VxQbx2NhcDIeytmzRtpCPLlM0J2
         QHs836QO0Cja9Z8XTN60Xl42ew8veMfuhHIoiDILaIJqWv+XDydRXFeopelqda/dhhtE
         NIvXgQiAiQ8C/v3G+NgUXbZGPsMEwtxfFsPPD7WKnCucgN/bCCzOGL7WikpKUNZO6dvf
         z3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698468; x=1779303268;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5+9ABfiTgEviLVxCigpN8KMZUuZ1D9IOP8UqN/QTG0=;
        b=DbEBpIKfSMS7BJY6gweYeT7n+3C8SAks4Wrte33D/3ZdM7oiIi+fo8qGFXTnB9yMWV
         /+zoRwGCG86X3ZevVXu4CSH/qZM5MnvoITjnt3kT17cGuNn+lnivlk9eMUW9wZPvH8og
         8Q3iziipa1bIZCwrzwwb/10e7WIrmm9idGr087o23xt+F0Sgfa47ARKl6N3vecD24U1E
         Lp6lCNwrw5C/R9iSRelEjOpaT2UJEk/fG8J3rYvPkqzlvfthDfppWjOX/ULphc9Vo0Rh
         ZQSURYMznqYCV56wlJr1dWAgtlPHHbNf76qneIGl4fBDCfTQ4xmQsE+MwFNC13cxRvbS
         SLpA==
X-Forwarded-Encrypted: i=1; AFNElJ80fpEx7Bb5uZUBVy+UPC7ey2NqylyaIGRrEMeo8uZ+/jzvcuYi7SQpLKbt87cpfMMPq/+rZ5CxjDEAzovB@vger.kernel.org
X-Gm-Message-State: AOJu0YyfPctl8yZ9tDuH1eJO8fv5AHtZk04/OMRsAHi6WfjSvFyfV9Ng
	nhW+qDOg96QwN1+rnp5kXBwvshhhbfzPqNn2weSW21FGWbBi97mPDe616NYADXHX1QilwDj2s5z
	dzdZr1k9C7h2nNFVLzzB4/lMEChkUnVOrMPM0kEZZoBJ9I/Q6prmOmN3ZzTjt6946gvJR
X-Gm-Gg: Acq92OEJIMRagHUGuuH4iJFfISPJ1kekVQ4gng7Qw1lnPU21IJ2ip5uSvlRs/HEKQtJ
	nDEi3LNxEyt+/ajw2arFsfq420EPPipgj59km5AoIDkZ/r3SjhF5VfFYaHhudQz9SDeI0f09/jN
	s/C4SssP7pAw0szWBGPgcnHkqIr7VX+t+4hTPnQOWe8wmQs/0jKrzMdPNITOd3YUgjjHxvvIyey
	89eTopol3X9t4lBUjJBRyn4hqSBz9cYioHOkecdiNztkC2qQExFCwqf1hvO1n+4/n8soH7CTemX
	8QpixHo3jhnvsqaZBe8s6vVEo2fL9A8Khmj6aLXy2soDRcKkejCs3jveKzj0dETJmbDVd5Ua5ac
	8apDuXpbF8inR8IFdWv+PkieOxIfQSYzEiuxPWkjrRYDR77jY+4Fa
X-Received: by 2002:a17:90b:3902:b0:368:7d4e:e778 with SMTP id 98e67ed59e1d1-3692384ef65mr526983a91.11.1778698467698;
        Wed, 13 May 2026 11:54:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3902:b0:368:7d4e:e778 with SMTP id 98e67ed59e1d1-3692384ef65mr526949a91.11.1778698467148;
        Wed, 13 May 2026 11:54:27 -0700 (PDT)
Received: from [192.168.0.17] ([49.205.251.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee626a04sm3662992a91.14.2026.05.13.11.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:54:26 -0700 (PDT)
Message-ID: <f1fe6e8c-9a16-3103-fbe8-de772bc4728a@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:24:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 04/14] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-4-7fbb340c5dbd@oss.qualcomm.com>
 <35zfskmyogpazxy7wsw2jg36fvpnnc7hng23j4heq2jy5ookai@q7d2vl7nn7ck>
 <fc188af5-ec7e-bebb-2654-62312d79e60f@oss.qualcomm.com>
 <kdbo5d2wibjfnchfw7xn3wcgcp5r6ff7pw3ibkpbqzjgfhkovp@v4er4hdiytks>
Content-Language: en-US
In-Reply-To: <kdbo5d2wibjfnchfw7xn3wcgcp5r6ff7pw3ibkpbqzjgfhkovp@v4er4hdiytks>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wHs3XJUyO90ulsXHA0yk6LM5VEUHsJAc
X-Proofpoint-GUID: wHs3XJUyO90ulsXHA0yk6LM5VEUHsJAc
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04c8e4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=UdqKVphAFhxg2bWZaUV5ew==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0w2scXXJ5C5TvUHAimgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfX0BrkbN6zhHX1
 wXw9RZsLjKQtJV30AUe49e5QCpc7XgPasodf1sg3XgM9FUUR4Q6l2d1hQbkD698FIM9XyXtorWn
 ZLImZKWtmMn0/WOeZxQvkrWhgth9HdpPzEX9HsHU+EV2GetU+aZfRpswmK43G20K4ZmySfIrbhW
 J3aRr2LneuE/HJtD5ZXlTROU7E1GU7Px5pF/v4e2HE+qckCYBOWTV+kBYi4Mm3IB1BBAL0iVpkX
 OqMrSlj2es0xRZGO49S4RbYc4qq8X+VK/dcLyzRiL+CkN9TBSkTwrfPPPZibgtEFaGh0RuI+D2Q
 46E4dxtjJb0y3zaLnVShm/TIeUmDsLZG/gSRrQht7Oz3t9/C+K3iRws4/xvWr5soXeoUtgfkloZ
 g7AaeML7DgaogpaXHO7xKqA4Y23cHN4aB9+h+i6ZXAAGNBw5AG45amS/HigEqCtQwkb6S++8/jI
 AOygI4zzFwT/eHvBVHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130186
X-Rspamd-Queue-Id: 927125399A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107441-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/13/2026 6:59 PM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 10:34:15PM +0530, Vishnu Reddy wrote:
>> On 5/9/2026 12:52 AM, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:29:53AM +0530, Vishnu Reddy wrote:
>>>> The common schema defines minItems and maxItems for clocks, power-domains,
>>>> and iommus. This suggests that the number of these resources can vary,
>>>> while in reality they are fixed constraints per platform.
>>> It really doesn't. It provides common definitions, while individual
>>> platform schemas tighten those.
>> If a new platform requires more resources than the current maxItems listed in
>> the common-schema (e.g.,Glymur due to its dual vcodec core design), we need
>> to keep bumping maxItems in the common schema every time a new platform exceeds
>> the previous limit. That makes the common schema a moving target driven by
>> platform specific.
>>
>> I am fine with increasing maxItems in the common schema instead of removing.
>> I can set it to a reasonable value (for example, up to 20) so that it
>> accommodates future platforms without frequent changes. Anyway, each platform
>> schema must define fixed constraints, since clocks and power-domains are
>> mandatory per platform.
>>
>> Could you please let me know which one you would prefer going forward?
> Just touch venus-common when new platform requires bigger lists.

In the v3 series, I followed same approach — bumping maxItems in venus-common
schema to accommodate the Glymur platform while keeping fixed constraints in
the Glymur-specific schema:
https://lore.kernel.org/all/20260428-glymur-v3-2-8f28930f47d3@oss.qualcomm.com/

I'm fine with bumping it only when a new platform requires it.
However, I'd like to understand your preference a bit more:

Would you prefer setting it to a slightly larger value (e.g., ~20) upfront, so
that it accommodates a few future platforms without needing frequent changes to
the common schema?
Or
would you rather we bump it conservatively each time a new platform exceeds the
current limit?

I'm fine with either way — just wanted to align on the preferred approach before
the next revision.

>>>> Remove these constraints from the common schema. Each platform specific
>>>> schema already defines its own exact fixed constraints for these
>>>> properties. Additionally, remove these from the required list and update
>>>> all schemas that reference this common schema.
>>>>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> @@ -64,10 +44,7 @@ properties:
>>>>  
>>>>  required:
>>>>    - reg
>>>> -  - clocks
>>>> -  - clock-names
>>>>    - interrupts
>>>>    - memory-region
>>>> -  - power-domains
>>> Do we expect the platforms with Venus / Iris not having either clocks or
>>> power domains.
>> All Venus / Iris platforms have clocks and power-domains. These removed from here
>> and added in each platform schema.
> This is a sign that this is wrong.
>
>>>>  
>>>>  additionalProperties: true
>>>>
>>>> -- 
>>>> 2.34.1
>>>>

