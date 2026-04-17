Return-Path: <linux-arm-msm+bounces-103541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMKBJUtF4mlh4AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 16:35:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EEB41C1C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 16:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B3D7300406C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 14:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FE53B6364;
	Fri, 17 Apr 2026 14:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h20xq2ZF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3Q8Pvje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C923B5307
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776436543; cv=none; b=Nk0orcqCl22ReWslMV5Ky4uKNwuOUl6+7jXR82kph9hGDynimHSJW6t08IVgjxhQ+e5RwIbnLTXpHWmJw9+uq9orFYLjG73lszM8AQwDa6bc2hBR5JpGewVWSiQ7drR1rQziKDKoaMSmqePUtGLY3838uvioTmxSrRD5WVzi+mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776436543; c=relaxed/simple;
	bh=SF113oFF1sMZms+X7nrIwBSd1ktumh6AlyZkr3mVNC0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YOnxeQHNdVUISyoprOy2m4/vkqBfwiZcq5uUJCmW6iXKZvstXamYNH4Xs3mQJgvFDpgi+46hOc8k15ZWIseM1PFyvaknIeG8yZCIa5cnpdhH7x1EP0xOo14D202/jCIIPhbrFXD/3L+OOivouYV3My/taDF8M6Oy2PYUu+H2RIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h20xq2ZF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3Q8Pvje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HEWim71872491
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 14:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7akWR2KTYpymsLXO6H6kGzO/anuY1eZUeK21VlmDe+c=; b=h20xq2ZFJH7N7PSw
	QLzUhL7N+mcQaqrb2YuOHWZZRdCbAo/e3PkZHs2ijcVhfHFzhO/swObIVQMuIVR6
	gTZI9NkP6twpH4WAxrQLw+0w/jeXKDJL5ZCTQMPmO+ky/PHWpBXAYcvMAUyvocSK
	vgoA4glWUyJLS6jIdP4ZarszTZfCL+MrKl+z5uyv6onRxyiMxHhfhZ4QxNRBbda/
	b2xbnsPiURXxSlkvgK/CaBJwSSLCSugjOfvwdrAG9h0yprlvcNQHiNMglhBC5pEL
	aFR/oZOi3IuI2YrB2gbkFvGb0MS3aitBes9mHywxzs2wUNVQXRn+NcN7/4zeo57y
	FI1n+A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk2kncdbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 14:35:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35449510446so984984a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776436540; x=1777041340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7akWR2KTYpymsLXO6H6kGzO/anuY1eZUeK21VlmDe+c=;
        b=B3Q8PvjeSFUw33mR0+w193jMk7YP2p6VYbHclgMArO354s6g7kDu9NSPfmFeDhXfoE
         glSdEGlNGP0vlvQlTLhRsnNYfavw7ifiHpbAi4HuYpfvoWvPCFBPJXCyoDOuoupWLJ41
         yr+dqfTU19bIqsm7yqTbfUlFKi6GowAUtq7Hnb5etZ7P9AKG+eNSdgGN/q/hl64RtJVD
         ftV+XpsyFKGkx9uW5Y0mI5ccXx/Ijo1ZODV0FG0DatRhP8RSgS1NB1INKDwD+rXVrTMA
         3fZHKNeJkYvU/dPVa9Sr/bwqOXg/2tOfn2wsl+62UDSpQZKgKowogkNirHyzA40Ykdm1
         xJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776436540; x=1777041340;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7akWR2KTYpymsLXO6H6kGzO/anuY1eZUeK21VlmDe+c=;
        b=MdTPaAFAmSlmscPzUo0gOnc2fjc4SrJcdUCWe8ykzCZasQly12g5VQ7sVEK1+DC0Gu
         deqmrLcTTsXL06aezPWZKWePCSwlFGb5HV7Ip0b/Iwd0eMDh/nKvwvXt6TrGYGD6RWdx
         1YNkaNLe3AF+dz8/Nn/t/XavZShaiRavPM9H0IV6R/0fp5HDRYz/YQUeKp32oNS4cW6B
         PVhkaI/9s+ZUEci3elvjB2Mi5BEGKo106h0mhSaY7qYiB5KTb15LUEZ8dZvvf/SUE0fE
         S9AeGOmP8Qc/ElP3ZEeKcctruSKuafCp7Pdeu08j21dZL1k37rUYZST1gxCUecULnnPj
         1nMA==
X-Forwarded-Encrypted: i=1; AFNElJ+3Y5rrS5DioYw3oKzwIe1KkR41BnJ7i+k9zkja1MgpwprKKXYtcXogMSxGsn0MwpZschJBhF6H7vSeVIF/@vger.kernel.org
X-Gm-Message-State: AOJu0YyDOlefQtmT4Czy18BASTwSBSU70RWq4ZUhM2it2ETEdI53+JYn
	Z7WynDnSJ2ryBux3PlHfiSOpgFaA1WffRKNO8pKoGqE1HKwHvwlDMII+SOvFfKHwN7EZ9/BLGLk
	ZD6wHLMdbuIfxqIh+QX2ozZJr0t+J7mfzop84zfqu3UOvywDrDES2jC+GkM7Bb/XxJCnG
X-Gm-Gg: AeBDietVhIyCRpHdZ0alA6m36GXcvlvTLcQhcWfSWGjSnS1okdXYGIykhb7bUqig95N
	gun2f/79oQGSBqVPIfg2Zh+uBLhxNfKVXKpwq20jVb498aunZpVzwyBBgk3RiIyV/N1tarzDFPG
	pQNWNQqnciKR2V3dkTd6y9C7ONYj0I8jrbGiZZNd7i6oEXDI7I1NgkY/v486djIHwSCtiSLWgEn
	6HM8UpAQPzp3+msIFeaKtl3QvdWpTgZm2w0A17RsnIMR+JUfFXIhCAQnOzu9QSNcmYTptOk626F
	0+SAtU4ftbP0RkMQueo71Ibu6JMlDejXe2ibDgCxJeNcgrALx9J9V/wYrDx7oWNALz8R6ZZD2zM
	DpxAnG4C6IxkLFD1OJGChWR/Pw63LIXN+I/mroksmvrvwqE+wQ+Ys3xIM2Qetdp2A
X-Received: by 2002:a17:90b:5543:b0:35f:bddd:3860 with SMTP id 98e67ed59e1d1-361403b18f5mr3379897a91.6.1776436540218;
        Fri, 17 Apr 2026 07:35:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5543:b0:35f:bddd:3860 with SMTP id 98e67ed59e1d1-361403b18f5mr3379859a91.6.1776436539609;
        Fri, 17 Apr 2026 07:35:39 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361419739dfsm2325369a91.13.2026.04.17.07.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 07:35:38 -0700 (PDT)
Message-ID: <5c04e57a-efc0-f5f9-f53c-04b9bcaa1c8d@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:05:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 06/11] media: iris: Fix VM count passed to firmware
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, stable@vger.kernel.org
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
 <fe1e2ef2-dece-4864-a89b-a311b3ddbfcc@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fe1e2ef2-dece-4864-a89b-a311b3ddbfcc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yI-UC6jTtTUVzZjlND8sjtl1X5WGHUU7
X-Authority-Analysis: v=2.4 cv=XNoAjwhE c=1 sm=1 tr=0 ts=69e2453d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=y21pM0OG2rRs8fqayMkA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: yI-UC6jTtTUVzZjlND8sjtl1X5WGHUU7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0NiBTYWx0ZWRfXwJBnjwF7XfYw
 F7AvLBO+dJcB3RUXkHRAqI3stfOKStkhFPVjriCfcWf0ogyLdIoKxFGoFydXE13Kl97RxtTwXjh
 604jzpVFQNP63gxGGPs1K74dktwGtia0AZqvuOhEjumZSqPhywl5PJvad7pe8Y0xnrvDoPSWowQ
 kPoyihkWINWRGo9UniDQ8dt8cCawz2xju93CjSDr4xbCoaX0YcdsfSInkrds55/IvEJbr5tQsi+
 QNrGy16cLl/pwFeP1W7pWKd0tvxn+Rvc/2t/K9IFWCi0K1QbKzmqwEi9CV4anDXf6DevX6we5hf
 UQ2uWtS8u44UqdtlXwtGlG75kxlarjuFsmjnDorxNXUuUnW6WE9Z/6JBtuz0O33btYLTMbAUtYX
 tkLFi07pqy0O7xoi8wh7YPAzpozu4ROYCyG3Zo4JSecxwEClWTxO8vsuP9OEIDpzunvvAHq/Inv
 dZrgxkuMfThaeLZ65EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170146
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103541-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96EEB41C1C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 2:59 PM, Konrad Dybcio wrote:
> On 4/14/26 7:00 AM, Vishnu Reddy wrote:
>> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
>> the number of virtual machines (VMs) and internally adds 1 to it. Writing
>> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
>> remove this write to leave the register at its reset value of 0. This does
>> not affect other platforms as only Glymur firmware uses this register,
>> earlier platform firmwares ignore it.
> Should we write a zero there, then?

zero being the reset value for that register, I would prefer avoiding to 
write unless needed.

Thanks,
Vishnu Reddy.

> Konrad

