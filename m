Return-Path: <linux-arm-msm+bounces-116707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HmsyIER7S2qjSAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:54:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA52A70ECFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:54:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Axhgdy3T;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gRZ1kbQH;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116707-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116707-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D61D3659DA2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996E34252A6;
	Mon,  6 Jul 2026 08:59:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244F94C956A
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:59:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328376; cv=none; b=eNhMV93Vzwrq4b+BMbVqH4TMM4vbbBHsSItu2dCzkNIl+8tpvzb3saIeN593Ok6kDhUyKGMM5H7Oq5krEs2alSQW/VaIpl/iEHcZ3GR5ay4/v0MKMq+oQMvy1j+5UOLwmNwYTRIejrhvtaWJFEZZigqfU3aPxpTfsq106li5xJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328376; c=relaxed/simple;
	bh=VdMEYEfujKlTpTeNpLjtTw6Z44BxQKvYppPb1nAG52w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kpJCeLgfX8oqvV/FSDyQdxgzASL0zb0H2lMDmzflu7K9SZ1jcSdbjdVfhv/m9R9LeA3I9mvKLvlMqttlEoH5h4D/hglXcIhbtoN/7tz56nQF0g2LvBLbe8YNRIrUExejhfKlmsa2ZveT++kpFz8F+zexMG3HbX0sQIq0Ggr+Ca8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Axhgdy3T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRZ1kbQH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641cp33615546
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERl4wTZyWv1vQsjv06YEWQxA6mOQp5u853Smknj5ows=; b=Axhgdy3TrH2DtrJ8
	weETRVwRSctUP3G+Iqa7U//pwX5JnIoG6vEPa5wrZuq0Wy3hmcKd6l8MXeOQj8bu
	WdMq9zkrIgNO66vIBa1vGQF1hlRBin/sFhk5w+wzn8LYN0PL0rD3yWNukq3C2IPI
	CG10qet/6xYlsfT0CyRbbPB5ZfRaXXfThWM7mQ7BnF31txQMtZ6dI/Chd51ZZIRM
	pILhbWV6PNLv3b9rQ8Fdm8Bia+o9612oGW/zVoCNVSAloq7tuMnCDl3YqDTjvPa0
	6vEmuQfc43TMpZTsNxr0OrpJdtW9A+Gv/k31WFpv8Dw/2MVHGEVdiWp3CziEmTEV
	twlSKA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3dd02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:59:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e777a15so5366891cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328362; x=1783933162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ERl4wTZyWv1vQsjv06YEWQxA6mOQp5u853Smknj5ows=;
        b=gRZ1kbQHdlim31axhD/94OXzrAToTbYPL6UZikC7QpS4rqE4dIG1p5SpWTFtI3c62R
         oARqtJb49hmP+e65iDB2BAG6A3tHua84IU1WzDgw8x+kZQ3wrAdTq0X+uhhN1vMbrNgV
         3oIIv9fCYAnshI4epOCXGId/ZLQsg6lSB4lyXfKCSmUmVBnbpVtQnsCemBoKXGEerL3S
         7OiyuKqYkXHozaTkxgfKONa9GcIXgtwpu8Ui/DoKEdpSsKdYSFCLMXr4V4kbpcCH5qHm
         kIR1SraRQUBZ7UbpWvUAUw6I/Cji6RNru3NBmj2IoxFnsd+pNaK7Z9G2x2U93b9LO6Sz
         7ESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328362; x=1783933162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ERl4wTZyWv1vQsjv06YEWQxA6mOQp5u853Smknj5ows=;
        b=Jh4ArfD3tpceUqF6hhHB8lOg6RQNMXFGxpjveh7DWahOrKHm3FQwELW9joCAdiR7K9
         /X9wtIZ78aURUF+42hdqghRfpoUNsxE2xiVHNta0fUiSadLXJIiAX4dnewaHlQXxia4e
         cwJ73oK0lIHHpQMKGoivbnUXC48nqswFfcdwGAMnXw2c+8hjODXob49o0KiGTShzkhPE
         D4sepaPOmVOAh1UaxoLwrZDvNTVBSAxwTov3Y85KnA9v2uoRpssoNxPbSOrbaZ0vXuh6
         E/EP6krQdkkqwBUnDEew78Mt+fctmRjJ6IfLiuzmnRvSF+FZfc+Eoo1ZlzL1Mc1O1uzW
         joJw==
X-Forwarded-Encrypted: i=1; AHgh+RrdJ3nDIhNog8Dz+QKu8flQoKVIwCgzK7S9CVnaFb9fqJ2NJalvbj+Ep5oyZEfoVwe8HAmnr6wZcM/33JWw@vger.kernel.org
X-Gm-Message-State: AOJu0YwpfPIjlf0tu5KcN28EtixBrzgy/qeFVBCxAUHhvqfMsFHrV/4d
	FAq6Yhs/8fUsSB42+7woDl/BoMivGyGqMca8hHp3PF5QROsAp534I7qY2ZfMJT/+NTt2aTIE4NC
	bevHdr6IzKMQfpgKydncEC8bGl5CKIjDHAC8OgkgP+vbGmA4UtDEe4p5i6a8aqF2nqiQO
X-Gm-Gg: AfdE7cmhWiD2gk8WxzqDrFG5+dqRhxMZg19Scwd0booTrOzk+X5V+R6DXTN6/Iyd1x/
	rTOxDRMmTZL2GDcGAMUCCViVlWKPkb1vQ48FUOz75Cqik6xxgcbuqEY7ekY6DymM7QTlchB2eRG
	/y+HOsI6ZkBTB+zD78grNMV8AyJl2VHeb/ZWt+f0oMgYT2+KPJJR6NFFpG8X/XVSn26Cu7J7jpU
	zv7McZNRjpIhLT0WilB05GRA0JOYpBmp3CZW7jdm3v4/y6fvBkjXU/Ubhi9BAqzen0c6x0FXMWF
	cg4NwetE13VCWtB71m2u0TCV+IUWraibx98QEAEtHeFF8iT9za9+wpEE2qfdPh2kyXkErvtdbyM
	4TEpMlnZyN1nZjm8KcCR5Hn2J5kJ54ouzrNE=
X-Received: by 2002:a05:620a:4405:b0:92b:7420:bd58 with SMTP id af79cd13be357-92e99e0f65bmr827906885a.0.1783328362381;
        Mon, 06 Jul 2026 01:59:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4405:b0:92b:7420:bd58 with SMTP id af79cd13be357-92e99e0f65bmr827904985a.0.1783328361880;
        Mon, 06 Jul 2026 01:59:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60550desm702417466b.7.2026.07.06.01.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:59:21 -0700 (PDT)
Message-ID: <f1d1db6e-068d-4b31-b53a-02bdac9d945e@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:59:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/msm/a6xx: Add Adreno 722 support
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-3-c9f1354dbd29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-3-c9f1354dbd29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX1ywiYda6OgHY
 ge/9Hx26vX0M/4QFtgm50T/xnsrhio4Z6ET9XwwCfBvrLalUmIn97RdsYLj1UN4UEt3VrsstEQP
 4GlBUoAqECcMkivCFDQbLQ1m9LcmVOg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfXx4t1R7AGNXtb
 qgpeDRrV5QbK9kPwcKyYVy4KZgC49O22EDF+O5J9MiXtF2VtSsfIP1gIhK2zXdma9GCusk0lJvd
 wf9NxgA6Jv8wKuIqfJQDBf2MpCLWBAeBUf0S6oQsy2icyrNPS/kNRaS/lDeeiVjEMQWDZH07ccq
 6MOP/zeGrXxtj4hMB7aa747lEBvi9bkeDuhppVZX1ms8wpx90nw5rIiu63B5rQ6c/3sGHTb4LNx
 nry2o/aKutuLwR0Sl+3ogyfBtDEyq8NLRRBiMB+6Ie7Qo8VtP9FxNYwjM6BRgjm1xoVDYJQx+hv
 3x52YOGRB1LRXaYJYMTv87vndudA51cnfRCg6n/zvAE8AtFU+8iOhDbDbfZ4bqGhjucnym5yNmS
 V6zu61RWiFrhYMxCOY+SAesR2QBqMe0L0vCWv8JHI1XOr+naazsvVrfBWkJbFWa9eHeTriqcRa0
 nk6vx3ZWKWA1hJ8u6mA==
X-Proofpoint-GUID: -cp11vDW77J6a7Npb3hcCQMfi51EkPZv
X-Proofpoint-ORIG-GUID: -cp11vDW77J6a7Npb3hcCQMfi51EkPZv
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b6e6b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ErYzCqf3RjAp607u9I4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116707-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: DA52A70ECFD

On 7/5/26 10:14 AM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Add support for Adreno A722, a member of the GEN1 A7xx family. It is
> derived from A730 and shares the same IP-level configurations: HWCG
> registers, protected registers, GBIF CX registers and gmu_cgc_mode.
> Major differences include lower cache/core counts, 1MB GMEM, no
> Concurrent Binning & LPAC support. Some of the peripheral blocks like
> RSCC are from A740 that resulted in updates to RSC layout.
> 
> Add a new entry to the catalog to describe the usual configuration and
> few additional fixup mainly due to missing CB/LPAC features and updated
> RSC layout.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -710,7 +710,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 2, 0);
>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 2, 0);
>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 4,
> -		       adreno_is_a740_family(adreno_gpu) ? 0x80000021 : 0x80000000);
> +		       (adreno_is_a740_family(adreno_gpu) ||
> +			adreno_is_a722(adreno_gpu)) ? 0x80000021 : 0x80000000);

This is a discrepancy vs kgsl (did you look at gen7_14 instead of
gen7_17? did you test this on device?)

[...]

>  	/* The second spin of A7xx GPUs messed with some register offsets.. */
> -	if (adreno_is_a740_family(adreno_gpu))
> +	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a722(adreno_gpu))
>  		seqmem0_drv0_reg = REG_A7XX_RSCC_SEQ_MEM_0_DRV0_A740;

Likewise

[...]

>  	/* The second spin of A7xx GPUs messed with some register offsets.. */
> -	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a8xx(adreno_gpu))
> +	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a722(adreno_gpu) ||
> +	    adreno_is_a8xx(adreno_gpu))
>  		seqmem_off = 4;

Likewise

>  
>  	/* Make sure there are no outstanding RPMh votes */
> @@ -1100,7 +1104,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>  		val, (val & 1), 100, 1000);
>  
> -	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a8xx(adreno_gpu))
> +	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a722(adreno_gpu) &&
> +	    !adreno_is_a8xx(adreno_gpu))
>  		return;

Likewise

You also need to if-out concurrent binning for this SKU

Konrad

