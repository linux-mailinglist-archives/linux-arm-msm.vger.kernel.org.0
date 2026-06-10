Return-Path: <linux-arm-msm+bounces-112295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4A3gA6/+KGpmOgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:05:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3B866612B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:05:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="CZOxfa/c";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PSA7egnv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112295-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112295-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56F2E304C054
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 06:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38163438BD;
	Wed, 10 Jun 2026 06:05:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31602FFDE1
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:05:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781071531; cv=none; b=m/QY3gf4oDDaJi2O16t02xnbY3aphYnbweBcjrh3DG4IideGoq3fDlnDVC7E4GIsVK+q1kO5zzk8S15dFvTtowEsu/UZBPxVIjtdt3geuhf2cYghJhF3lYGeqwsPuGUnIIvaUpjLVPEeboKqpuqH3Bigq6P6T7gnLoiRfn7cWKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781071531; c=relaxed/simple;
	bh=3wbXNE/jKiGwtk/t/u5lJ6UhV/FA4ZIibVf+CObN92A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZreqW1KlI85T0xhYXZYnrlDWOCurKtc32LISzY/WNhAo6Zz6DYN77SOqhsftoVAyB5MQvMLXz3n2q68rxwfnhSjzR7lgesNZqBsJ7Ynb3NNxd9B5Z6bLN86XDkSiHr58si6SFqmotlOujjjDEWHeVHbjc30owaJxI91Azfd5iUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZOxfa/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSA7egnv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A46g3a055868
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1r4emBkmGL9huta9i+cxa3n0uuqwoffvcDXFAAyEnQc=; b=CZOxfa/coOxnYYgt
	QGAC5WmT6NYP8bcSvy520TTcNC5eMRRKsefE+EdYO2WLrHycpZuB/rFIS7nJNkNp
	uNK511RiyAgETqVE8JnNcmAeT4XcsgYakA5mYGTdALeKe4qP4qUKQ2iAbAfVFIDH
	zJm6PAecz6bwEpQKAHFJsCyxiigZ7v64n/uP10RgWxVnu2QhZ4E6lqy74FBCyMwv
	wGU/Gd1j9I0ozidFVoKuisz3a+yQYNVEsGChIpEAO/4+Gm+xAQazBEXmaZRrzawV
	j+0/94l6IuPPOF1cvNZz0ww7ATAdtazNLXQtekHyAPXyJ/6y1fhOAwRfjfmbE64L
	q7roGg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1rbhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:05:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so5617394a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 23:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781071529; x=1781676329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1r4emBkmGL9huta9i+cxa3n0uuqwoffvcDXFAAyEnQc=;
        b=PSA7egnv2+9dEC5awIifqPCxbPSsnqlfjS/6qqjBZRde4OE9ovjUSzzs7CEr+5rBz8
         sMCMuwH93JkBBkPAQZhDurJi6kZ6EFKA2xY1NceQkzzxjYmC2sKVRaVlrkOIdyaQrCC2
         lP/vZClsZqapjVvCnJ7FL0E01tEOmPzs2S/T1LT57JMJcH16eyKU7dNhP0gEQ/venZ3b
         22XmlkPFs1wB2owl/8Xrx9XTADPGfPjfJ2MkSCJPX6oV5RBSCrNDujAe/5zrPWgnwfrS
         +m7NoRk39rReATnMxRlA94ksiag1MMLqq6+LXMuVjOgHTilcAJZymuwjZyZEyDgvY8uo
         9THQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781071529; x=1781676329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1r4emBkmGL9huta9i+cxa3n0uuqwoffvcDXFAAyEnQc=;
        b=L/sczxkZ9X/lUL5t6jopEA43NxWBMHdB+eJfQEfn5iKrDJcBpqUsCIjQLr6vLm/irk
         XTa9GYtwgV6YZ2jyGVUtMslsSReFf/Wm6yRvkpX0rFmWPbLzvmkEtJz5lIjsZxKqX6ew
         P30afr4cK75xBeuNB8/OrgNUe8BKQhSywZX2xq5M2QH5JlU09/FVaT7J0BQaWtxSkO5M
         vofWbi/aLWbKpLj2nleSMXuo9JJGEf3bTLNddyNHjNGo6O3JubN0C/CjcURiwBlaAVOf
         z9muuStPfuz0veufbfidPDApYgaDgJR1dfUgLIv/6XLBmOeGwgAxXKpAgRwl/1NOBOcP
         kkYA==
X-Forwarded-Encrypted: i=1; AFNElJ87Ws9fOXP9kBFyfVybvKaqyXUS/PK+zxQspCDINJnUwFFzOwMuNxKvHiJ+zppjTNZDJ7XlHGPfXRZ4epQ1@vger.kernel.org
X-Gm-Message-State: AOJu0YwwJa0QxfDqBNHb9vV6iWHT8syZVEc6llOQiGFT8eQMDHtAnmG1
	3HFzMHVpkEEmGbyOWoYay11sZPHezp2OyWGd08vufHMABCaG36mbcc1CVt7P218tRYBWHP8aaep
	84hRLrFFZkl/ijsAu3svxY0Bll5PJUHRWZiLi43KG4+GIMcoydRNRWL7kJZI2/Ik5U1sg
X-Gm-Gg: Acq92OEShZyuy+sDokFBx2lDNi9OmFkv9ixPnP0X7jTZAZK3f9RFppEUm7+yCb16yAp
	Z6zdA/Cf0VwUDlnqd+n+PqWTqvtfxkGzp6xFrB8XiDsE2PecKOlevp7cYT6PhlA+uxg6h82DKo3
	J59CsU7eKuX2VK1be7fw9r4OP2Go03isBWgSJjXnG7JJ4W9y93tUQPvEJIoHbJWcKtnjKBxHOnG
	9lMA8DMwQrCuS+yJTHQx7lquMUP/kY05U//8PclZDfttjn5Y8VkSg5OSip2P9idAfOgt5eg+ISL
	h0ALYQ/yOl1if8i94RRVHaXh8/XZU65FFSPn3QRiC+mOHlMJ/ADr2MrVthXUW/fpW/M3wiFTRuJ
	LEvMN3WE7HVzCGIGdI+m6Rld0fN+aLM64Kd7zC5pmiOzDjeGSaPXmS1AtlWatpdhs
X-Received: by 2002:a17:90b:280c:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-370f0480da0mr24854466a91.16.1781071529302;
        Tue, 09 Jun 2026 23:05:29 -0700 (PDT)
X-Received: by 2002:a17:90b:280c:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-370f0480da0mr24854418a91.16.1781071528869;
        Tue, 09 Jun 2026 23:05:28 -0700 (PDT)
Received: from [10.217.223.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e7b53sm21653462a91.14.2026.06.09.23.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 23:05:28 -0700 (PDT)
Message-ID: <e83853fa-3bdb-4bef-9953-19e7ed96b000@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:35:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add support for qcrypto on shikra
To: Bartosz Golaszewski <brgl@kernel.org>, Eric Biggers <ebiggers@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260514194735.GA1939213@google.com>
 <d4d35e17-84fa-4c95-9bfb-abfd25ea7f4a@oss.qualcomm.com>
 <20260522024912.GC5937@quark>
 <c1697372-54ec-4f57-85d9-ad375ff1a44d@oss.qualcomm.com>
 <20260525142843.GA2018@quark>
 <e49c4a45-6455-47f3-a91f-c32c1a0b99be@oss.qualcomm.com>
 <CAMRc=MfC6CEwOXYttsav3mwqyJ2F4sburBj+zNJ25qMoweyL-Q@mail.gmail.com>
 <lj7geczhthury476ilkjym2k5fblo5pqroefsbdfgh5jcf7zy2@qrss5xc7umn3>
 <CAMRc=Me6cqasdBknbAjUZ5BqcpERYwV+NvseRJp4P0aTSYAMUw@mail.gmail.com>
 <20260528175214.GA3936298@google.com>
 <CAMRc=MfY-tmMCdw9FVBgfkX-FvB5Nx2X06S023GhASenSCQSNA@mail.gmail.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <CAMRc=MfY-tmMCdw9FVBgfkX-FvB5Nx2X06S023GhASenSCQSNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1NSBTYWx0ZWRfX8YRa+ZVQgqu2
 zJJcpk0SO8U679D/ym6x1h3u/xaV73xGcyPeHKZRHaC+rIovx9ByxFDYvAQLnjiK0OPSM0MudBQ
 J38EvFbzxWR16D3vAAeJ2I4RzxgpC0xRsCRcelsz9KlzFpabetpa4uzmFM8bu94pPFEBykDr/3X
 x2RTIzyRs41phsHPtKaxjTt1WcbJrj5gSfsFv2WaumZK9w41ADCAGjrmbr0A8HyBMQRt4iE+uKx
 LtbdKDMVGm2fl3uCy+M6opikmRWlK16zyHNeFjR9MH3BM6BtRSFpHHpRI/fSbaH88QXYDog0AIf
 1T8Eu1D0ZNKCJ3RtEqmHtHf1GUlyfQQGeEHGvJU6xnLOJKaxBaUG0fXc3W3Mimxj1+Lh8KGeCxj
 lACN4xNd1cdJcT3QSZQXnDEGO76N67ldeEouJUKSrBorLI0FE67Pa2f90svqiWhilriR6+aQK1R
 /dcc1DXzES0VOBonWZQ==
X-Proofpoint-GUID: oHEtlGfYEpfhuZofC0N3NLd2LDZNj6Kf
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a28fea9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Jq58CcIhlmqOa3VSBlkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: oHEtlGfYEpfhuZofC0N3NLd2LDZNj6Kf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100055
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
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-112295-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:ebiggers@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:gaurav.kashyap@oss.qualcomm.com,m:neeraj.soni@oss.qualcomm.com,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 5A3B866612B

> On Thu, May 28, 2026 at 7:52 PM Eric Biggers <ebiggers@kernel.org> wrote:
>>
>> On Thu, May 28, 2026 at 11:13:47AM -0400, Bartosz Golaszewski wrote:
>>> On Thu, 28 May 2026 15:50:10 +0200, Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> said:
>>>> On Thu, May 28, 2026 at 09:13:23AM -0400, Bartosz Golaszewski wrote:
>>>>> On Thu, 28 May 2026 13:54:51 +0200, Kuldeep Singh
>>>>> <kuldeep.singh@oss.qualcomm.com> said:
>>>>>>>> +Bartosz, Gaurav, Neeraj
>>>>>
>>>>> I know about the self-tests etc., I will address them next.

All, kindly help in reviewing selftests fixes for QCE.

https://lore.kernel.org/linux-arm-msm/20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com/

-- 
Regards
Kuldeep


