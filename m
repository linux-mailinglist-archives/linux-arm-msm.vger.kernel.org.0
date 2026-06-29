Return-Path: <linux-arm-msm+bounces-114889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uICHKx0xQmow1gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:47:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F2A6D7A71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:47:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="S5v1Oid/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dIRrnmqA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114889-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114889-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E5EF300B81B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54F23F54D4;
	Mon, 29 Jun 2026 08:47:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7623F825B
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:47:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782722822; cv=none; b=Y2qKCRUIADxnfX5n99Z3toBKT76UWu3xFe0NqRbiUyZIxkVgjUs864G4PVqGb8srCv9CsfU3VL0TYUpc1A9R7KiZhGNg92SY4WGBlo+iESSjI7ZaZOMvr7pZ59tLeAo7tZyf6BgNxr/j4f9NvPta0G+dK23f9/oW5BIzWAyP2JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782722822; c=relaxed/simple;
	bh=IZDSvvIWTvxeOc6vAT6CTmA1TxSwSVLPm0tS8B76Bdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFLUYuEw0ySE/GQCA6xlPLUEvCYLKqjKL/wjNO/eaex/40gi8GVhnAim+9tvFjjYXUdUUMolAa3XRrFN3AM650Y0f5UPj0rP9Cj8UV1NLuuCprMNtVEkNbmG1JI11D0E1Ll0lkQ6BsfwcH5uD1cPIQPnO7g0VWTvtaEipeASJ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S5v1Oid/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dIRrnmqA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7Dova2188712
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dsuvkNF0CRvWMwPOO/jhGrruMUfqUKJkLRonqqcBpsg=; b=S5v1Oid/YK8zkt6J
	2ItjNKJhX4moBJ+xFFnUfRz7spo1b7QPzxRTMwHqM6TOXp7IZl9+etshzKHNQ2rz
	i8xUonlPASvKY+E0gX+DsEkgdmdjL8iV4rAzMh/hFyB88f+QRqDRE/LLHLRQlLi9
	IpQcxAeTgjRc+k5mu42tticXPsqjKzVTtE8BYoA6yky3gI5xFv+Cqj6pu1r+A+gk
	rAnUY3QSJEYk4vDJnN8Jarv0mR/jFbeb4re3zvxWlJQ7g2jMik0hamPAGO168iyi
	ypMG0IKeeleScoOwHOtgelvOflQSlXJE5WE+2ubIBIOFSEzNDKahIp5iVb9gTuvB
	maH2kA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trcaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:47:00 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9693da3efd7so33155241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782722820; x=1783327620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsuvkNF0CRvWMwPOO/jhGrruMUfqUKJkLRonqqcBpsg=;
        b=dIRrnmqAmZAFh/JTe8mwXeeraf6iUNNYiep1apu4nERLncuLYtm6/8nI6LoBdg9YSL
         BHoOhY2M76hVAp9w28vL28Sni7MSjqaQKDeskUjdmFaIi95ODwGhmicc0t5xz6aB3PCm
         BOvDBVv9e7qMtLhh9SJAnj+/nmn3sWZ/jhfQGP2F31fF3aDbeiU1I6JALObWmhU+h1Xm
         0mIlmBO4loP5u4wvkYGoyekhs1uV0mRJeXIFe29oMfU5x8zbJvGoeD6vPLwOcGv+Qz8t
         16mHwPzxh7L5cnZYftY6VrfOdYR1dlIkdbpWu9sP69bQEJQWQS2FbDp+8JecPc+Hv63S
         Zd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782722820; x=1783327620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsuvkNF0CRvWMwPOO/jhGrruMUfqUKJkLRonqqcBpsg=;
        b=MsuXlxDYybO7BN53N2rYLPIdMYOIRdjlliNT6hIhAmeQ78e4XiEBQ6XU96L6lvv1yu
         00zXybsjDwAUGSFwDCNOiEMEv9XZJ4BfOE4CV05kDojy0Al+AUTAG++kNcXbEAO6QWRy
         2go/Us7oe2dnnNB8Gam8B5oQyMEcaRKJChv8fpmqFB4I9AJHrgJlbPy7MmbyL+7s+Izs
         g1yAX5QwuU+Ykz7F9Po9atld2P3zgyBSz2zQK/pjxsisgc/rJ2xa83AXPLH4Tpc3sOIf
         79Cx9jht4tbOcinFFLQpyldY6tSK7eDY24FhrWUWxzWLBm67SWWsl2l0xVB+DSGc6Ys8
         hz7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqlXvRUk6aNhg0jkmJZxFhkXxFER3qdXw9xwz1QO0e7BiACJ4462qdwr2AbsGgnrMyHRRpCgHZgQUYnBKgy@vger.kernel.org
X-Gm-Message-State: AOJu0YyRGQLF545c0LV1n//At3jYGhEXWe71GhX00APZYXa3S/wNjG61
	vPbyz50zJZWLt3xGeSa6Y+tFCN0IieWD05tkM5F7UYuqHBbHOa912LZ8H2gzJd8fnV2WC0C1iXA
	b/vUxAxGNxTqI2ghgm8tgPNhewctql+Se+wL+0gzLgsWGrs40uRple3slNlR9Dg7Y7Gvv
X-Gm-Gg: AfdE7clLDwo86wmMy/xwXjVRVrUQg2x/tXXoHLpZ+tmAv82DxlFE3AocTF26Wu7MUCm
	16uXG0kGddEQtn48B5Hzq/srwrIJ6rB4hKuHG1dYdHCMwquBqxJIjD6dJyqlG+xaqZq9/YYlsEo
	CeFsx5Xep/+vauJq+rMQvhlnmGjbbaDhIiwZfHXeQya13q4bkT9kIO2Htlt+lvMvnSlzotZ6Nre
	cRhj0OK0uvLXw9/zOZZVxsQToUnBK7wH+pBkVL3J+ude8G9vQh+3ceYuV3fsSFlq4+SWq6mtemy
	mzEsyzI2c/Fk5uv4/ArM2cG0OTZuc965LTsdeH7TCg0ORdZC7QtY7pfJBgLYX4oztndpbsuPUsu
	YRe4OwaTVbBbqw5CjkGgLvdMY5zpBA0S5kSc=
X-Received: by 2002:a05:6102:6c5:b0:738:4343:fba9 with SMTP id ada2fe7eead31-73843441853mr493671137.6.1782722819886;
        Mon, 29 Jun 2026 01:46:59 -0700 (PDT)
X-Received: by 2002:a05:6102:6c5:b0:738:4343:fba9 with SMTP id ada2fe7eead31-73843441853mr493642137.6.1782722819368;
        Mon, 29 Jun 2026 01:46:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698481d0359sm3009277a12.30.2026.06.29.01.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:46:57 -0700 (PDT)
Message-ID: <3ac0279b-105c-403a-90e8-822c28a6dcfc@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:46:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: shikra: Add Adreno SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2OSBTYWx0ZWRfX8NNq7pt2w2vk
 9404s5pBISocqZ+KomM8KJnPqzOt1TgwmOMque1n8HioQURqWxBA/o8tuREK3MfBvJKCKNP+OOE
 LgdmwBuwb3Fspd/1OaorbG7KpUZjoRAr0XDNh12vyNaEmF7XSUwbGr6cra/rOCCMPza2t+50J2G
 pcAyETZvyeUtFD5GFVmAk0Mn69xnl611ZbOZAq+OMxbp5Q4HC19LOelAsYMTGtD4D3YtVpRiFFC
 tk+saryMAQ8z1wnbP8xhW7qxj3hgFo9nrpOYjMepFKzyoIexvP3uFzV+hle4zxKocblFfWz8PRm
 AhSAiDclllBk78nw8aQvouKeDE3MMnJ4UOVu7L9z8yHcXpC4AURbieUUfuprEBQWOHNW2wMaBwN
 GW27GLL+hJsnnIoflbcBsBA8XZUuDXnF67CDvrUDQ8cMkSisB9WAoloWK6PDM3sXeTe6Kxw0wX/
 DO31NV1e01gJ1HnqcmQ==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a423104 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CtAqrJV6yErwifH23rQA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2OSBTYWx0ZWRfX824cOhh5a7p2
 x5Y9P3WWUCrYjzERYcC56cS/VqAbJ61+grcMsZW34EwJF+NIzY79KycfOaJEiOdgam/i+K5cEVs
 mxAmxu/jVBnvRxYYiZjy8EkbfZ+Bq94=
X-Proofpoint-ORIG-GUID: AGsETmX4PzX2uW7iNypkQe8nm2r4dNPt
X-Proofpoint-GUID: AGsETmX4PzX2uW7iNypkQe8nm2r4dNPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114889-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:imran.shaik@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: A6F2A6D7A71

On 6/28/26 8:23 PM, Akhil P Oommen wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Drop the sign-offs that don't apply (presumably applied as part
of shuffling around the handlers of the patch in the in-flight
tree OR missing c-d-b)

> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

