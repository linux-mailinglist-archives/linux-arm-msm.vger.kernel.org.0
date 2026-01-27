Return-Path: <linux-arm-msm+bounces-90652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMP6JZVieGmrpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:00:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F33C19090A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D5B13031CF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 06:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7597532C926;
	Tue, 27 Jan 2026 06:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+gM3r1g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7tBsW3B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C888D32C92B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769497159; cv=none; b=mYdz16TimTjrpuanL7cZhLlZfkWbi3uIsBPOHLvsyzkZu6bd1kjcyk1ADq/j+UhO4vmzySG+QLiHFui0uhKBTZp1oz7rdLiDryYUgAA+a96qJSLZDFWHTXxGJPQvQsILSkzHXiiQiEqWw2fTqVoqYGuvngZmRgrrbErVFSd3yeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769497159; c=relaxed/simple;
	bh=PtBldIo8DvR300YnmXjChMGVRwDuAyKmH9grvcK1H6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OB08H1sUH6DJGQeHLIm39kcVRJlkOivoqtSQSDJkUMo9U2wsZSTY1cjUBJxV50He40uB03d1dfdEL4KYN9RKacgPxLaAn7ZTUYxW2S6iXcfgP3qPlbIRmfaLRS4nqgIZrrq8cA25GP0fVv4PklCPQ3BPHHrHoD2y069N6udg65Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+gM3r1g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7tBsW3B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4TxYI786325
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ftd5aHd+Qxgiy0Blyy9D/0Wb
	cslzuoi/6m4KczOx7Eo=; b=K+gM3r1gOtRXoJkuH4ioeOypGmVT4SDXesMq3bZb
	5QPfqIT+aLPjmi6x5kfxUHYNRM01irMaM/3562pw/ChVVL473UryfYZ6PSo+QWpo
	Gp5XLrkaALJbgWsgXRfV0yBNZ5hdfIWrIiuvF8PaFt+hPUpzXbuJGOb+GI2grwDb
	wdes4DC4gnlhQYk0DAJB5j+fJ3yVQ7GauclOKp52mE0Fn2Z4c9UFrO0Q7bxdSiSm
	AdWjH45nNYXU6nI8H7wzBIaKsTLkydMlVgkfzhGzIDevAj3Mb/yeoWtYm0ByNVIF
	S520VnfuSCtL4IGrrc/3/iS7M8UMt8FKjx0uoVCpoda1Mw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93he9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:59:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b738854780so5856115eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 22:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769497156; x=1770101956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ftd5aHd+Qxgiy0Blyy9D/0Wbcslzuoi/6m4KczOx7Eo=;
        b=V7tBsW3BMnSe9mORlNu3oihtHmSpxMLmHmpbyGu3k+waW0WqHH6SPTK80SJkSxgChc
         uk6tnlW7kJENJncHDddt7ytT6Xgz6HIzFeT7ZjWwppQHYKqD5Fvu6zuEilZbhey0mK1Z
         k9B9pE01exvtBkp8f/v5ULfqeQdelu1S+QR6nQIv8LsMtcwfzHpnl4NzjEQ9oGW2QxUS
         QFqB2pEwTIWIyBz8IBUtQL+m34tKnGbBp378Dv+SUporB6iJgPcAQqNSRm4W33LCFFoU
         LSYlYHUL2q8wcelHmGHnQdbGNItGob+TXF10XHBosgW9h9CEQyf9UFDmMTJmCOwMlzFM
         XY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769497156; x=1770101956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftd5aHd+Qxgiy0Blyy9D/0Wbcslzuoi/6m4KczOx7Eo=;
        b=hOF3h0S/PvJxCfYPSdVQB2ZEfyp4vx9Twx/gbgajh6oGk0KrelhYRR5I7KeZ/7AOba
         GgrmzypHKyR4GYufzVL2NLFdvBFF+HxCErHEZgdTSsWbfiZlu8zg371gycUXWPM0Wq76
         Dco6lfHUXC0jcyrnFvz0nzknxbGDNoqqcNG1oLk2WmI6f5uEaI+k+GoeFNA4lN/GxAuw
         bonRziHI2HqwvHJjQVKGz+Rn7HUGgMHndb5jV0JHr4XfOsC8oH0x9Ig/G+Ji2eSwrAcO
         tiRCPVBbssa73DAYEftzV+onsq4dL+f1fYAXy9QggiqFRamviTGX4eQNNJrCgQIX6K6+
         VMWw==
X-Forwarded-Encrypted: i=1; AJvYcCWI6cbXx+K0gvOmdAZvfZPqowg5EpGJOH+09C7F4yfDTfgWeDNnawTMGOAwzG0vi80VrY0uYFKDWNxgMW/s@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5nw9cGtcjboEgyO7kAy378yhV1l4uEhDkhXGDNHJGPm1J3r5l
	4cSLRZvCsoLnJsz4YRxGaNxhnkpqCTDsPvCXcJsvsYoJgWtdnE23DpoGSLakbKAetrQYdMeTwwD
	Hqdz7CDSNSHgm7e32LNF8pUccIoWw1lzT1xHSGFFpOW78swXwB4pPp3tmrcvFGCpQmLMk
X-Gm-Gg: AZuq6aKNCiYV/qwSNL4L0J8PXNstSWTlXcyMEBRfQbC8eEd9UzmN2VOLhjwFkJ/KnT3
	bZOM9aPsIRvBR40WYZIsHn+hehermDUEdrAmzXikdxRPfeA85Ml0cSMK4G79RR9JRCeQd7QO07t
	snQDOB8aUGKhCGpmxjqPZwezO1pCFZE7uud2aU2xP3VppqCoWJStCSeA2tbK+YQWiP/lba8yifx
	6KxbjeR+OpixrCKLd2VxBpO+Sep+8WpsfD1oI1zi4rxaIGkAwUZUOub+MTFOf+LPMO2qySZAt67
	81eZkrsLF9oPpYi87s/uzG2y+s2De7P5Yll+VDkw/uVpKS5jOSGfPFFg7LI1HMNZo6hXsYKx+U3
	o4A7KU4m+LX+9X7y9Jl6B6LBp5GkElbYeyCqLB3lSuVxX1b6ItAefFR4XsvQ=
X-Received: by 2002:a05:7300:dc8d:b0:2b7:3782:fe60 with SMTP id 5a478bee46e88-2b78d9191c1mr533259eec.14.1769497155548;
        Mon, 26 Jan 2026 22:59:15 -0800 (PST)
X-Received: by 2002:a05:7300:dc8d:b0:2b7:3782:fe60 with SMTP id 5a478bee46e88-2b78d9191c1mr533234eec.14.1769497155039;
        Mon, 26 Jan 2026 22:59:15 -0800 (PST)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a692222sm15817425eec.6.2026.01.26.22.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 22:59:14 -0800 (PST)
Date: Mon, 26 Jan 2026 22:59:12 -0800
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: sram: qcom,imem: Document glymur as
 compatible
Message-ID: <aXhiQB6oKHXPKPB_@hu-anancv-lv.qualcomm.com>
References: <20260123101501.2836551-2-ananthu.cv@oss.qualcomm.com>
 <9febbe8e-3060-47cd-a1e8-5ee2b4de952b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9febbe8e-3060-47cd-a1e8-5ee2b4de952b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA1NiBTYWx0ZWRfX0OW/RNjTXfUi
 af8m9nSpa/IoZ6q7KUYriwbOUUiR7QaZjdOrFSTjrLPJLbXKhCNLrcPYtY9yBhWicftvGrpMarU
 FyYQAlVecYjmT9JG1dv48jquiTiyVh6n94C5kr0E71TZagV7gu/9yLsUiYwR8Ou1D2z0ZAPJDgL
 Y6REopCE8PJuH/QEBxnhPua15yGlvNowiEe8OBtoUJcd9DXoIbAKCNxFEzmXirdWACuBk38tW7q
 IWQqMY4NbUpd/yQ8i+TQsyUSB7zmpl6EJ+eYunpB5FtkWWESoREBSPTiCDpO0aWixvSzqGqk0ad
 HV/6BwaQh5xhUWMhMs3SQGfoiQxFA4P8kA7R3SnCyoBc1ykqcow/lO8jOF+oAbzMgzchYshP9Wp
 E6FtJg0WajepL3Xd6e4e+aQ0KK7YO103g8PRxc1CtKOGjlkD32GGJnptA9KpQzzzELST2rWXGAA
 ZdXbV/iH2cBUHkgJNLg==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=69786244 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PGMaQHpP0y1B7HiVbAMA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: uNxINcWYI7ZUoVPJ8LGNbqY-imAuNphD
X-Proofpoint-GUID: uNxINcWYI7ZUoVPJ8LGNbqY-imAuNphD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270056
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-anancv-lv.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90652-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F33C19090A
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 09:57:18PM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 1/23/2026 3:46 PM, Ananthu C V wrote:
> > Add compatible for Qualcomm's glymur IMEM.
> 
> Shouldn't we use "mmio-sram" binding? Please note, starting from
> "kaanapali", IMEM is described as "mmio-sram". If we need to stick with this
> binding, please describe the same on why so?
> 

Great, thanks for this review. Initially Krzysztof also pointed out in v1 that
the placement is wrong (thanks Krzysztof). But I couldn't find internal docs
regarding this and since I missed out on sorting it, I thought that was the
wrong placement. I see that the kaanapali imem binding thread has sufficient
info on this, so I'll test with mmio-sram and make a revision if that works.

