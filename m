Return-Path: <linux-arm-msm+bounces-113858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0yvlJbNdNWqjuAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:18:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0841B6A6A26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:18:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k6daGQ22;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QqY5ZcSf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113858-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113858-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 092FA301C11A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB5033D6EE;
	Fri, 19 Jun 2026 15:18:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A6B2D9ECB
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:18:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882289; cv=none; b=LCijyb+wh3kv4dzzzi/tSphNGupYlUVO5gaJ4/o+r1pvJW47R+gjH/4//j3qzyZBp9qYRTo5K+yk55RkGa7/wW2ZTy2qwTkUXXGZwHktd+hTgdPGQZemWZ8/yd2BxEWkuCwslRWrh5WrBDOnU5n3auobu62R5ph188i3U7Na4IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882289; c=relaxed/simple;
	bh=0isu7k8QoU3EYwpbyHH0frM3gtEiN7Bu2cLz3LRpid4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PVzL1SnBOih8MbqOFKfJntuYDGYT93vckVL73OVt9XSlJAZZoYze9mI8zQjDzkDALESCL8uESGkUhC/APb7Z5Q7KrnXwHqRHsRglv7H3mlx5RMFitAwDgztCcrBbMUMBTvE65diEAMGTcDD+DRzMCy1G6VBSy/OZiUEfAEG7qP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6daGQ22; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqY5ZcSf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JD9dvW3005477
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DyjGj/GWGMzcQ/T0hox+05airFz+ODlGWKD6lOY7/lU=; b=k6daGQ22Mykhsd5c
	Ga20DPvkrLOkkMmBqLF42YqZmId5X5ykjYBWRFdYCSWR0Z9RUz8jCzwWFyvB/jsr
	2V2Ph5at+eXa6U3qbdyAE2CEKcIpNfegSQPWGJFmJGxS9wUpktf1nlgD3oeunxW7
	WENKFPK2bxG77io4rjHqYHMtxMxgFrQXZrzUGUYAPseo5EqmteYrXE9PmY9bgF59
	lSixK3iBXvOihUOjNw+E4g2+oqZdg/T8Q42SYmPpMUj4PssZPtX7pr2abmfdnVFm
	Aisrei6Qphd7wiSv9ugWuri4re6w8HD0b2ZGfQh1/x+aN+/HWVlYzMInHIIcFG9R
	G7/SqA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyrc1kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:18:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914b9d0162aso48513585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781882286; x=1782487086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DyjGj/GWGMzcQ/T0hox+05airFz+ODlGWKD6lOY7/lU=;
        b=QqY5ZcSfmKHifiVAn4QbrRimQVlth/c8EMgZJ5hX529lihYFpxbg2Rx/StszBGqF9T
         awTN0CHD45nFUFIz9h08yVXD2EBTQ7pUVcSWjAuxDSqFhI5Imz3WWnd/2ACrkjMgXPNp
         HG5gzpt4tksuOlE4Aih4wUPBeZpd6wvwnGnUBmHl+8KfGTWqKO4uuee8m+ABO5sTNUMp
         6g0OZ8Evg2BiqKQlqhQTDzK19wbU3dYEHnDlTNdiUb87U6SvtnaZz8NgkjPmURGot1/J
         WNIWWImeWFxXi5caXiTW+sOIAFbUX4vLC8f8FRcZbyxZPfcWEsBhWqGDL1CnsnkH78MX
         lLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781882286; x=1782487086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyjGj/GWGMzcQ/T0hox+05airFz+ODlGWKD6lOY7/lU=;
        b=nh1ao7MOyF/VYGsiWKD5/4pcnwYqLFPKA0vc99yw807/gUJ1GM5CpDZACXluxg0+O3
         NAZqW2i6BsXKI5NMpKwQQbqETC6kRXtVkHxIr8GNrApJFqCU4G66ENyhdyxT5YLPQ0Cf
         DjUNN7BXBGIfCC0qaTDkXf1iHtn8FVBCSwiXWC7YZc8wANR6dHVslKw7JJt5OQSYjV8o
         bCCkwluxFC1X5fS24J6jg5m9aPloVHjE0YIOahD0v809hVikbpiM2NYa151ldTg9MPlk
         XdLjz0UN8LEmjzOwwCpXzgZ9oJFypKEXC1DlROSBpXvCcKjcdUSKEcQo2u0ZXlh2FygK
         XuIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qhrkD1dfHFCrHL6f/8U+TyRlC4HOSCJoUc2JlEBR6QPoYK4L3wEegRkWQ5nMgbpooW0ifxmMH4hEkBEvb@vger.kernel.org
X-Gm-Message-State: AOJu0YwbKkgSozZC+xlmFWxgqramKnwxt0FsfeYFjr4JANV+cDtN0PAP
	1LC+UbbbJJya1CiUevoZJL4oueY/dxEuX+flkmUP3D7lWHodawlaVErGm/pDgIj8HcgKLzgI4zF
	km4sVybyrN98uxESz+CHD+DZVtAlEsw8Ci8lCFuibHmd01R58sseduEbjAO6qul+tZSTs
X-Gm-Gg: AfdE7cnX4xRO/4cA+wB3eZtn870TxrYLB+4paqSP6vBlNIx7OtHxVaZD61PNlf7g7LU
	NknhcuKC0GhRMRB7eRIa6o8+W2hTmXnedcFk1AORQZJ097TJyfa3D0k3OAt2YTsLs+M98KDyUKa
	p+Q4uD2fTkeqUB4WTMVSwUHfID3KIyiB8NNTYeVG43OwBvgHqf22Jzg3IuHg+KSVcT3COUBSGv1
	l9zbb/DZ4kHfRCMb9BqK9WcZbJAeHgZ3PrKWDYaxgQ3A9ZAL0dHwve6meDut0Z/V8V5MaSQu+nF
	rBqlX4knRvKNf0rnIncSNnXW+W3nQmHlYZyNc0ndzHp7yYaes8pSKm2wgFlLiopuICqs+HnrIm/
	EC2BAp8vo9VtPXNj6JMSlmPQhKTqZnaai0C4=
X-Received: by 2002:a05:620a:6409:b0:915:7d6a:4f99 with SMTP id af79cd13be357-9208d0f8dd5mr326166185a.5.1781882286165;
        Fri, 19 Jun 2026 08:18:06 -0700 (PDT)
X-Received: by 2002:a05:620a:6409:b0:915:7d6a:4f99 with SMTP id af79cd13be357-9208d0f8dd5mr326159385a.5.1781882285483;
        Fri, 19 Jun 2026 08:18:05 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a844f7281sm97731466b.6.2026.06.19.08.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:18:04 -0700 (PDT)
Message-ID: <60f18b2d-2481-4266-99d5-e0373345d993@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:18:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SM7225 (Snapdragon 750G) Mainline Bringup Status & Blockers -
 Motorola Kiev XT2113-3
To: Angel Saucedo <anyeloxd13@gmail.com>, linux-arm-msm@vger.kernel.org
References: <CADi_M0x5BnGamkMZ4oZFZwj=m6Cw1s6vn74VqnSuk3nGqfhM_g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CADi_M0x5BnGamkMZ4oZFZwj=m6Cw1s6vn74VqnSuk3nGqfhM_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a355daf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=i-FMAmYbcFIxwJvUZAkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: GL07J_mDS_I_P2glNEdi6DwfWMrFXcVn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NSBTYWx0ZWRfX7B/ocjraUIri
 Qlfvt1tdCzbsV5k2Ytb/mAoWuwKBQR4gbuH6diUmPSEvHD8kpxnRMAXV1ooRTw5BUx4zGmlckXc
 tOlKOR9/bBEqPd94nvRx31O/I47B2gdyL0IIz/6cTvnDixsz7cHbZsqnF3qrBkSJqZnl6RdDLwA
 C1JWL5t0P6XtJt3jW0WEKooovIM4qqrn/vmZCZfKBrE6apJ0/o8PllcIMFvI90iAq8NfQHGvh6Q
 Snx6pN8/jJ/Gc6unre7VwFTCarTdXgdgu34+2HPGP0zb9vYusc8A8etFLjRftxWQNknAH3TTScB
 ljVnKbRiQX5SIvrfvvNdqAdTCULSS3lzTB2LLWsLU4pJaoWPC3iwUBzRI8TGjpWh6+wMnkuvB3o
 hBeefN/yp1r/x76LaQSiD5I0DMm4QskaI8vLdO5m3heN9BXz1Qvd//260COraMLexdfJ+SnMX9w
 pHCXMGhfmLMglZIY+bg==
X-Proofpoint-GUID: GL07J_mDS_I_P2glNEdi6DwfWMrFXcVn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NSBTYWx0ZWRfXyDNzktTolfq3
 jFDu9pyK4Jcj9LhSwsEp8asrYiwWGY4qvqA2+lhub3WB2FT2KKLTfE2wsHIgH1Ffzw3cUl/ONo7
 3yjfMobVmaWzn7iPDOQggbqVRJa2Wz0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113858-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:anyeloxd13@gmail.com,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0841B6A6A26

On 5/26/26 7:43 PM, Angel Saucedo wrote:
> Hello,
> 
> I have been working on bringing up mainline Linux (kernel 7.0) on the
> Motorola Kiev (Moto G 5G, SM7225). While basic boot, CPU (8 cores),
> UART, and UFS storage are operational, the project is currently
> blocked by two major issues.
> 
> Current repository: https://github.com/anyeloxd11/kiev-mainline.git
> 
> 
>                                                           Key
> Blockers:
> 1. USB (dwc3) Timeout:
> The dwc3 controller times out (failed to enable ep0out) waiting for
> utmi_clk. The QUSB2 PHY requires specific register overrides and LDOs
> (LDO2/LDO3) to be set. However, forcing voltages on LDO2/LDO3 from the
> DT causes the RPMh PMIC arbiter to abort  (error -131), crashing the
> system.
> 
> 2. Wi-Fi (ath10k_snoc) Crash:
> The physical chip probes, but a fatal crash occurs during the WMI
> handshake. The signed Motorola firmware (wlanmdsp.mbn) seems to depend
> on the proprietary Android qcacld-3.0 implementation.
> 
> If anyone has experience with SM7225 clock/voltage sequencing in
> mainline or firmware signatures on this target, any advice or pointers
> would be highly appreciated.
> 
> This is my first time working on mobile SoC bringup, so some of my
> assumptions or terminology might not be completely accurate.
> 
> Thanks, Angel Saucedo

If you want the discussion to continue, please reply on the public list
instead of in private, 1:1 coaching doesn't scale

Konrad

