Return-Path: <linux-arm-msm+bounces-112005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +q+mCp2mJ2rA0AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 07:37:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DF565C7A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 07:37:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bVeOx00s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=M4F8AzK3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112005-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112005-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0C2A3018F7B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 05:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FD51A304A;
	Tue,  9 Jun 2026 05:37:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7D23C37A9
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 05:37:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780983441; cv=none; b=qSMYIwmiy7/MRU2cVzIxCViyicea5AVfAETTjK6Na/3zDyiH0pUBv/CvyBV2d9q1dNMgUsjcKWWwKupPx9GIfw3quXg4szoJdBisu2h6dVottTOcroYjRPsuPfOuwg+liR+Qjjsg9En4ZE0yWOmccShK+IVINGLtp6zlsgC0cAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780983441; c=relaxed/simple;
	bh=uugD+ZTT3EoWEOXwbqISV+D0swD+cMJ1IGS+gn868C8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AaMAvdTapNpS013Zm94+e0vUh214fnU3YrgejEcYj0nG83Q2NYN8LyBf2BDDYhahi45t4K1o08+z1brFlXNPr/7KT+pviunbTilPCVB+STRiEi4rr1byzWg0tO9uAZAeVCLWkasVxxXziec7VcOQM7YpT7mmy6ZvhAlcPRxd3Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVeOx00s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4F8AzK3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wsDi1061882
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 05:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PR2hiJkiUQvrfmG0FVY4y008fpQ+lbRvpnuUvQasTUk=; b=bVeOx00sUnruNkyL
	0n5nL7OW4FT6mS9hzPhdOu3hPkJwERH7eRth45itatpDzXferqMtBAUYXGki1MmR
	l0bJQFmXpP5n7AwoE8F93LhRCvLCdomCDNNeugyX6BP4LBeR4u7gpk5gXEAD5Uld
	HmhA5AzmK9YNaHURKyrwVqIYcfW9A4l9VEsZdCZ6O82pDuPZbfwKsBHdMW65VYP+
	Cd6mxvC/AOSjfjra/QYSbOXIkCsnZY5WT8sCOnH39s/HnMVh/4e/LCY4KQXx/TTM
	62DhaKAJmUHamNX6N7EIRsrxAM3NJiYn0KNgS9psvDjljJCtzNxtdI8lOOOQkVa7
	it4zzA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envajcap8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:37:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b982ec27aso3727310a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 22:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780983438; x=1781588238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PR2hiJkiUQvrfmG0FVY4y008fpQ+lbRvpnuUvQasTUk=;
        b=M4F8AzK3eRmkTjN34hQXK9bqACNIalscJM3kjSbl/LcvvUGgNIJxXYdIjtgVqDrKRM
         t9AberkoqctwPxhUGoNq76auCvvx700gFKJTuUY3IekmqD2Dl4KjvLW63GbEAuFRJ+TO
         KKfkV23uRtjRplyfdOBYXuxhmqHWo6tmTCm6dCrPly5IHKhpENvslmDzESMDHvL+KxXY
         CcV137oG3ke+0oaA8+VN0kPkH4SPXP4ROjtZyTuyk8CAwKUWmsTM5Z/jQsciYnAf1su3
         ma6qZsKznspsGY2vdfeGA45wCrRsSou4/Pk1m6IslDBspaM57wOp+GPRy/scVgT7lS8y
         E5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780983438; x=1781588238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PR2hiJkiUQvrfmG0FVY4y008fpQ+lbRvpnuUvQasTUk=;
        b=OYDkrSoHQ7LQtHowYesHnB4fWysUJucuVtDG/snBN4H4pvO/zVHIfj6ZhqxhPpJLQ3
         bwzxG2F+2Uvjck9L5R2Wa5eolxFalgXGsY57CjYcvQlcQld/+kc5RrZbLlNOfthVApI4
         zd6FSApEcJhZfbrIQNgheS9zSki4IJHSR84CiovfK1y1Yjo9oN75rJZrttVVSqs9XSAf
         W7Kr7zJlmB5ESX23QHpB6JdEH0etX1/1fnaR/rLPJgM89LQqGsQXbPURZDZSTU1GZf3i
         D4FWryT0PrSd9Zn3I4DcS5m0+uXvls6gmJkZQCK0Chj91K8jZ89fJVZLP0+IojzMtxXk
         /1rQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NHRI7ANp6cDsRQNUgtbc3fqGn7bJx4Y9BYOE5CUBXotmV0bzuhmayd4roThs9PIksKgwrlCE6timyRV0T@vger.kernel.org
X-Gm-Message-State: AOJu0YzeLN53FlwMUEdt2yPvLxrz549SabGRy/L0dbPY0ImimCEVhSLs
	7phug3qb4ckVW2XCw8hyzjfkoLRgjlBkoHxtS6uVmsqbz/rOTmC1AfGyfk5ZCcSDyv3QaaB0uuG
	QgygJwq68zhYrcqboH8c8PIU4/fgFG39GSW2ISwcG8703yVQk9BOCgXeGDPk2kMpv8NSh
X-Gm-Gg: Acq92OF1jjxGgJXGY//pxWhmUJGgfL5JwtaRXw0Ny6E62p+UbZYvKKayQ4obGK1JEoG
	4gnKRI1/PmK0AEiUWB6FpSNk957DO46N/KBRyeA2Pl+TC0w/9UOZhBmtwXwd7c7WkNyqKpH2Tc9
	cxjx9fMdoRTcVQU6+d8ujcfE5Yx4FxFQYy2nO21cHqqN0udrAe1Z3uRFUAn7ooAAbMbLChjLPMs
	OEA07DOcVnV4D4fVb9Pon0MTmE0jzkPj+AYG8fLy6FhfS7/5HqQ2833TZO7ZS74OuVTQ/obXY/a
	5avgDcxvO26Pl7WN9ZYr92JnNxsVMe5VFpHg4txIM4dn8a+nrFwPmWbJp+hfc9Tm2S+n0QJttdd
	PQ4/VjHZrjLIu9GXkF4+btKn9xHo1nN2Ac9IunEGiysCEjai5zLxZMzE5Ej474rE=
X-Received: by 2002:a17:90b:5210:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-370f0967012mr19947167a91.19.1780983437851;
        Mon, 08 Jun 2026 22:37:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5210:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-370f0967012mr19947132a91.19.1780983437420;
        Mon, 08 Jun 2026 22:37:17 -0700 (PDT)
Received: from [10.217.222.59] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6d109dcdsm20019455a91.9.2026.06.08.22.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 22:37:16 -0700 (PDT)
Message-ID: <26b56175-a83e-4c3e-a871-28fb3aab0725@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:07:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
 <20260521-shikra_crypto_changse-v1-4-0154cc9cc0de@oss.qualcomm.com>
 <20260530-spiffy-glittering-quail-dff199@quoll>
 <289a5bca-5491-4fc2-92d9-1102aa664021@oss.qualcomm.com>
 <844eccf8-4ad3-46a2-bc8a-67895d629c4f@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <844eccf8-4ad3-46a2-bc8a-67895d629c4f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xAGWjHRh6RWPIEW_JAq6Besrn2wORDFm
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a27a68e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3IJvv1DdaQ7zVQMhPnMA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: xAGWjHRh6RWPIEW_JAq6Besrn2wORDFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA0OSBTYWx0ZWRfX0rxyODZJo2Ol
 tcGVhKCNut4tHTl192uDB5UCTMhniyxSeEnYTru0pgOeECrdx4ZzjfuV3aKZxUT3wuEsRsg1dT9
 udipZtFKZtKpal9GShxIbtH7AGuas6T9Ij1+iOrhjk2iLxKxhWpMgx8k9Vq7uh015cIlilwvF54
 vcgOvPDm89vciqK63x9+0HkGQHndTdJzLZmlFhVq5MoqDyP90W745yokQs4VEW8ptuI8Xv+TjlZ
 pX8uQWrQ554kJEPuF4odnR+B/DjRc4ikPP0nW5ss+uUh8iUKooUknpQI2jlQezLgpE13Xvwu5Sg
 h2cXu4Bh1pM156HQVsiKGaY0z/btmhtDWIVSmQyVPWTQMqjWULSg6U605OWdzySS1Tn9VIhkPzb
 1sgjiDQ0PhQnQmPoo7sKH197LfzilDYgi8+oK6awm+V8HWpJGxGpP/QNJ2a3XD+KslCwDv1uluj
 Pa6pg4H4oHhzBXtuz4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-112005-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:vkoul@kernel.org,m:thara.gopinath@gmail.com,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,devicetree.org:url];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: D4DF565C7A4

On 09-06-2026 01:19, Krzysztof Kozlowski wrote:
> On 06/06/2026 22:59, Kuldeep Singh wrote:
>> On 30-05-2026 16:09, Krzysztof Kozlowski wrote:
>>> On Thu, May 21, 2026 at 06:47:11PM +0530, Kuldeep Singh wrote:
>>>> Shikra bam dma engine support 7 iommu entries and not 6.
>>>> Increase maxItems property for iommus to pass dtbs_check errors.
>>>
>>> What errors? There is no Shikra in upstream so how could we have errors?
>> dt-bindings updates are prerequisites for the DT changes of ice,rng, qce
>> and hence updated bindings in patch [1-4]/5.
>> Also, the commit message mention about shikra and DT change is also in
>> same series.
>>
>> I hope this clarifies.
> 
> 
> No, nothing is clarified. This commit msg is just misleading.
Yes, I'll update commit message better in next rev.

I specified error observed after introducing qcrypto DT(with 7 iommus)
for shikra here[1].
Sharing just error snippet:
dma-controller@1b04000 (qcom,bam-v1.7.4): iommus: [[31, 132, 17], [31,
134, 17], [31, 146, 0], [31, 148, 17], [31, 150, 17], [31, 152, 1], [31,
159, 0]] is too long
	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml

[1]
https://lore.kernel.org/lkml/11c2d639-d2b8-487f-b627-f507bab25d60@oss.qualcomm.com/

-- 
Regards
Kuldeep


