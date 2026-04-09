Return-Path: <linux-arm-msm+bounces-102564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SqVeO2wa2GngXggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 23:30:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAAA3CFF40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 23:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD248300B060
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 21:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E5C33FE09;
	Thu,  9 Apr 2026 21:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQsTYY9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxN9114Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434552E8B83
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 21:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775770218; cv=none; b=TvuG2oFdFk2/nCofFHYLJAp11wh4KxOIe/3x4SxXl31yv1uw8bs5B2YAoPJhsnDbJG29DiBm1OZCL51vonh47bCDbz3d5lXjw27JqL4eTtEy+GuA59islS+qtc8fJjGXo5Lrlq1VemBV2Two6qTFJBq4w/kpJShTogWsofmN7OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775770218; c=relaxed/simple;
	bh=j9h19QOrv8PK1vNFujX5jiDuQ+LX5W8uUSmisFX6Pqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIL0f53w6XoEpfGBhMB4TXkZQIL2RkvWglsPJ9WVXamYhIzvY/HL49ti0FvVf+iB1be90J7NQ81iJeVT7JBQdToHqh16L75I1jRpShgynV2JJHHgk67vZVDDcevytYEvgSZxXwHXqb5rkjBldMdZO8qVRdqr004ZSoCVVRqm2ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQsTYY9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxN9114Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639LSTOc1972717
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 21:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yJUSlPXdrskJ2du69cuI9T1hyf/JLg2i3zoHSaY314E=; b=LQsTYY9YG1LiN2f6
	AcYXaYl40pc02NldjZy1HjUy84wgOVHriWiW1lPzmSIFiimB0ngLTW3mJYj3VvYX
	jtTc72gyhi/ljCR9XtIIjH9/XDqVIqS+yfa7lSgAWKpbthWfeo+YgiDFa5ftI/pN
	jKJKrZjSaaysm5bt53/sfHoLCQe8i4N9hee8XdkKERSxzXQFbrTi3mT+3lCTS8y2
	ZQKI9FZXSZ9E0+g1y9NexJEk/Vr+7hhlZQWNOQdTMowEIp66bQFBz+3wJwHouwE7
	U/BmcwEVg89X70bpDzoA2df1RQ2Ji/iIjbsJAAuvaQdPTtZTHj2lDjMlb/TujzB7
	7W+YnA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms1rbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 21:30:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2d443c3b094so1889162eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 14:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775770216; x=1776375016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJUSlPXdrskJ2du69cuI9T1hyf/JLg2i3zoHSaY314E=;
        b=HxN9114ZQbfDGDfpsE1Mhxk1PXDTrL06VumoUm5NWyX1b/y9pUOeHOhkOf4VEIeUXh
         5KtzC0kcgpnZR+HI0kcw3BNP81DPd5c1WVEmR3o3bRvkKD0FZw7C9tgqgx66oEUrXXub
         Qq/Xl6ZX6Aa9+c7LF7lk8kZrJzYRzaEH0m+H1OW3/gAl7VQRjzRzb6IhB6EEzUhkBSxr
         f9zVIjSfvtStTX5Ji1lBh3pGxjyAtEsHwqMLP1mYZQWu/CpfqY4shQe22Ss0QQ/ef63R
         2zjJDKeQ0S2q7o2CbWTDJ5R8cOV9fB0sv+SvOtAV8JDWQRwVyZFFtTsU0RtZQ5atmBI+
         4K7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775770216; x=1776375016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJUSlPXdrskJ2du69cuI9T1hyf/JLg2i3zoHSaY314E=;
        b=oZVZe1Bp2ghTkQ+UoEh4wHLKc5AzCY2+D91kMRo6Xshk2tDP0LWMo/N7YoimU0ssWH
         G805T39VX5KlM0CHJKIMCdMSIdxU+d1eF4jONpn537RLsn4TEt0gvH9pOgSFohWgBf0n
         1IgFOT/G2qxrQ0F4LIdNJy+whRRTAU8fcxtLKhe4vENt7P1mL96uX4ir09UlNUWB4bv+
         tN1QJAuHSNwDBpdY+HPiE6Fk+Q6rljLyul9nkS0d96d10WVm6C1WzFbhklogPE5U/GbA
         R+Ous/Tk0IAqvQ4LLwt0lU0OC8EplDxBGX83g4IJGTOxvkHbuMXnPdf+jTLAveqCBCLW
         sTtA==
X-Forwarded-Encrypted: i=1; AJvYcCUr0b5a+2wuJV3DfO3Fnmud+FS4dqK7UE/HvJ9psItxOYrk8hCn6cIcH0fscddMACcK0BuQ+bxeLG1ieZX9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4vr7rcD6E4SSydxrwDxLnSCeEbWvf5iO9fRqAZcAjTMvMKG7B
	/klraTQeIeoLR4YJFnBH6M9lNe1v0Z+fUTn38g7WzV+d3rH1Za/RjUTL836BO7z2VkNnwKOLVDf
	DXKJBp5SRw0JsqcJnVtA5jUfXQDEJSWibsHQY3EwVP+Gbe6uIPtqu6T77oaJGRUv+INbY
X-Gm-Gg: AeBDietO+3b10THlLEt5OrzIVBXWdvPq/ujxr8PCYuTCxCTiKSAZUNoEjgFMaTk2HwY
	OyChTGbGT4g4+ABA5u1fN/TnCtGc9s8lfyTgjqscROMXVKn0wgXkluAHpoCL8af3w3qRpEsgXLc
	iaPq8VOvtgGpYsRDdn9aiNYg/Jixla/uk4BwSe5evXxhPDq+AVZIIh7IuBp4zGLp4d10adQT5Ax
	q1Qy4khFdlW6zbo82DV3Dr1Z6wD8keeqTBn9XKiWZvatkdKn3RoDI834Ux5XOv8HmvPyWeVtkdC
	/hlFiSj1oVxuiZoO0GpgBJvEpA7cq4MvRDbAyZYV9rmRGNYSerJapLyF61efVmpLVKpC3pLC5vj
	Tpafiu6UArUReJrDld7nxTxBH+EKZ1c1UgrjfXstRD6egvf9D9Kxd9FDCbhGZo+QWDYVLpVo3Jg
	8=
X-Received: by 2002:a05:7300:2156:b0:2d1:d434:d022 with SMTP id 5a478bee46e88-2d5832e2f63mr507970eec.0.1775770215619;
        Thu, 09 Apr 2026 14:30:15 -0700 (PDT)
X-Received: by 2002:a05:7300:2156:b0:2d1:d434:d022 with SMTP id 5a478bee46e88-2d5832e2f63mr507940eec.0.1775770215088;
        Thu, 09 Apr 2026 14:30:15 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db64c4sm1357061eec.27.2026.04.09.14.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 14:30:14 -0700 (PDT)
Message-ID: <4bc1363d-5785-4214-8057-4f2a75e0f8a8@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 15:30:13 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] Documentation: ABI: Add sysfs ABI documentation
 for DDR training data
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RaqqDWdmJNkap0hVOAf-msLnhHtFcEzw
X-Proofpoint-GUID: RaqqDWdmJNkap0hVOAf-msLnhHtFcEzw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5OCBTYWx0ZWRfX5wElL7t8/a7S
 7ZNaaKpbj1Ru8mMkwdPJKPYeXguav/1KENgFPnEjEwafgmHo/Kiti2U6FohsyKVKkBGWXEsyu6o
 PDsB+q1wRsbQuBgYNph+8486TJFJ14YXgSfxMSD3HEfxpI6on1k+FT7hZLUNdfbn8GsL/MkSqZo
 iIaNUUJAzIcZ/EMGq29AJx373EptOwrmEfYB00pvzMdvMxDVks6q9CPDhbrrqsPm1zcHsY0Jp96
 vLtLu/tw1F+N1oaMhsp3fOW8O6Bc1PVnK5U/NDKa1wHzKcZFJQB/EI02h1NaGWj3KSe3CqFjnNA
 bSqBgdp0hj48NMaxYbLtaliJSvH+woKjkRZjgw22MidZrSCgPjfoHZayQepv6ihJ5ckrLVKdCuw
 ZtUEhVA+7MoejDFdGdST7FZurqQSMEzSyU2HuSNEb9zK3UhHH14A35crQVwDLrGfAM9zbR82dYG
 sbq33oDfoOCyMxOK3zg==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d81a68 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=DdBerv_ObsJuwx9ejj8A:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102564-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EAAA3CFF40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> Add ABI documentation for the DDR training data sysfs attribute exposed by
> the sahara MHI driver.

Sahara

Also, this patch should be squashed with the previous patch since that 
is the one that adds this sysfs entry.

