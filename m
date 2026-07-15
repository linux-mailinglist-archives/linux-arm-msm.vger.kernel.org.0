Return-Path: <linux-arm-msm+bounces-119188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y1qZOONRV2riJAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:24:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F5F75C6FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:24:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lMo2bfBE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EU2TMY+2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119188-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119188-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B2F03001FA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7DB3F788F;
	Wed, 15 Jul 2026 09:24:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8C142377C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:24:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107474; cv=none; b=KkiDY2A/Z3VOyW+ZA2/h8fheEj6IbRxyx8W0o0CS3lcKGSzKStFAfseQ01F7DdGuagd0SMkpIXq6ACD4cCNZdCDj041GXP4D/o81QHEmce92gO/hzmrv05zfQdzKAttPzfF/KSeD6Yfcg/quFQEaePvo346y9zIriurZrmzfjkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107474; c=relaxed/simple;
	bh=F9I6nySpLAYBIrwNwiXbqQXlhE3Jd9+XHW7KFwnC0eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LYkfQNun3domlMoroLR/ksl4rwHBX/7NrPo43Az5/wSU0jlruR791PpMZSpGrOsw0D2i+FOjJ/HQi05pGSCjvoi6XDy3fexQ1HWoDZkUExYMxhaWWz28r3YmIXQWeS2lxTa0utOdG4WCnfC4o/f2h3OJvuQey4uYuLdD1R/vPUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMo2bfBE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EU2TMY+2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F7n7F93144189
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K0qsXlsk5JCmDH6LIG06w9L926cTJpNt6HXx5DBOd3E=; b=lMo2bfBERMxnSQ/3
	lVHDzbFfRI6kMf4CzLDMqmmfOOvPwifSxB/C9STQmiaFuens3ojo+A+c1rO7FJVA
	YAgy2r/dC82Tn6lIqMIT5RymU3QHbYjgBlOP7+lKRxNWgKZeUCdjqNkJE2/DNvnA
	AQJxnIuESyzhJi3ip2yTBiefvUskRl4H4gQMZtKMLsFGLZ2QE79ei7vNnf7fV4WN
	bcVKxql0NhR0tcjSfyQV70Y2aZVOHX5t1TPo93nLmZe/KXSFv/pEHZ8SVtu0qPb1
	MwURfHO1NnK9IKGwQeOPhlAGcEtUlKj1oFmMH4bf+O3sCoStpi9mhcp52NjQ3vXh
	i7J3tA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe6528bd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:24:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e21552dso69770485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784107472; x=1784712272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0qsXlsk5JCmDH6LIG06w9L926cTJpNt6HXx5DBOd3E=;
        b=EU2TMY+2ZhIXC4EJZtRMPHfc+oRF83unCeLGty0aNK3MjaIPiNFaQRI49a0REi4+oc
         b5XzxrgO1w1rpraZn5nZ62vcoF5/SDuGxtnExqoUrjn0VkB96PREGa5qlK8K9Bu19AMD
         paVHnSrVcpCDbmpWy+Mu2SQ8ugaYIVM6tJDVdLabfzwa9TIpNjQhqSTE06NVs2KPxdFj
         KhC/dFIy7C5EB3zDn9w+WhxAN5j9Pvwae9NxLsvMAH59j8ODXsPDbjWIJDzhcEyftlFm
         jYc9s31WVkWxPYvzZoDhxygm2kRVQQi77CkRXjUvDO5lEj2bExRLRUAaUADFS0WYF9ys
         KEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784107472; x=1784712272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0qsXlsk5JCmDH6LIG06w9L926cTJpNt6HXx5DBOd3E=;
        b=D9gZLabkELxy6mH9m+z/p+0/4yICKt0nBQl/ZWtXEftnqmw8/635bMU/4roDzrMUZU
         EuQW5gbS6MIm9Lo1sT025/8eHX41sjjGdqx36NygfhcHND6Njt+N5CRzNy1qtl2uuc9a
         GHQZsDqQzAAvOGeDiKA1N9bT5ZTcpyfII0jnrmlisYsa0F5IrsOhggqTPbvGoKahGtYx
         8/5JhPY0tKBJSEvojuLDWvAkCC3jLVJ5JbTAex5d3hvUCTO/tIFzZvYuIKZMhKTJ+1SS
         wFlegwcFahZbkj/KyRSHGjlANtB24ASFY48/ywux+vFwNf9cEVRSmOl3by0M8Uz5Hv4x
         Ervg==
X-Gm-Message-State: AOJu0YxbR/kSV1RwRPiGFuQmyWb4EvKk1II+lD9TWOhid1i4Qpcw79rY
	kDvkU5vukQ/rUjuSEI1iKSMkci1KuL0Obz3QLbUlWHGC7XSL6L/3B4nTkBFrdZwmD6NY+Y3zCxb
	HdFNoigAhy/xyp4qw9GJ259giNo+rvjaB6xprC/t2x3Bm+BfQluC9bvnaY2RAaRg7DiCD
X-Gm-Gg: AfdE7clT/9qM8hr0dwQ5ELGBgdOhuM1OjTArAylcBnGdx8PtomcxSnd3P3j0C9tschY
	kwGmuPwVvHugTuiB41Wee0RVuw74cKus8QbFqSLDjBw2GMC7um2pqVwzuK34RtP/P7t3w7kw5IR
	FoGki6wcVSCF9GuMsmAkZv359ix/udOzKCpSHy8jPuvabLpdvJv+NXkr/dQ8isO+coVqeyCtzyG
	8Oy6B0IV27ieWf7yo73MMrvyOZVWNy/UouOqXdblkh9c9ioZ7Ckt9iGQFry4c2IK6uvZgVy3D9z
	B8niNA8JWdlY/OB+Ha3CFMRoMTIqgep+Fq0oUYsWGP9CK+VniuuA3UZOIepf2XKHwC1FOElE+he
	w0IpZEkZARVk5q7NhtfjH9UYZzcD4fFnwrM0=
X-Received: by 2002:a05:620a:1a15:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92ef2bdad05mr1352798985a.3.1784107471797;
        Wed, 15 Jul 2026 02:24:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92ef2bdad05mr1352796685a.3.1784107471376;
        Wed, 15 Jul 2026 02:24:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d3e54e83sm1074289966b.42.2026.07.15.02.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:24:30 -0700 (PDT)
Message-ID: <624005cb-d527-4bab-9ec2-3ac5ada313a2@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:24:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
 <20260715-shikra_adc_support-v4-2-5e07b6d21429@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-shikra_adc_support-v4-2-5e07b6d21429@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5MSBTYWx0ZWRfX4Zd9s40aQwcH
 HWAXe9pwjd7TnMhhSQ/0GaKQOKOM3W4R9XKJZOCe8LUdjDNsKpPq17kzXHZV2dcUNTyUlXRLjH1
 t53d7VJ7QvtL8RxEEDTTEZNO+5UR8ANGY4CTTCdUkfEZfWK71iKq4pbojT0fU2B0U2DhpzUtQyi
 E13Y69oiGl0MLXHTwenNaRLD33OFVoZ4w3raNijydx+layAuTbNx+h72a0EZF2LcgSONMkS1noQ
 Ta8I8vS4WqLQCOCHS57EVMomDh3YrM2sYpmQ/ymLiV5i0ss8fFsW4A/R3cxpQLBAMhNocCVs6n3
 JsjaDJ1K+xox39fcG7k6cFjNYYOJ0YdKhXinL+4yNcHLjPKPkJFdGRMsCFBHYPZPjiF/+lGXGxw
 zCnrK9C7OVVUJzXRmGXn85EZvtW0mh9JYHC6Zeny7ucp3WD5zrMoBZ51aeK5jW1Bj7yche6gSlx
 M/geZACh1+Ff4HehUkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5MSBTYWx0ZWRfXwwqorY1YGTzQ
 cy6Dy++wFT1Fs5ZiYpREai7leW1XtB8vKzMFoXrzWRzHQ1CGKv2NblZtnwk2qkoui79NcbdKBVq
 PO1y9DzgHNjtyn7/tQleUySAv4y/SIk=
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a5751d0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0iEBmV3l9DZ82o72BXwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: mnheEcTF_-Mv2yRCLXrN4BtdYbW1WZaT
X-Proofpoint-GUID: mnheEcTF_-Mv2yRCLXrN4BtdYbW1WZaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119188-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7F5F75C6FE

On 7/15/26 9:42 AM, Jishnu Prakash wrote:
> Add temperature alarm node along with thermal zone used
> for PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


