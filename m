Return-Path: <linux-arm-msm+bounces-114188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lWp+BQNwOmoO9AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:37:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B72B36B6C28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:37:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OetdD04s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="fhqI0p0/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114188-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114188-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E6963088245
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766D33D45FE;
	Tue, 23 Jun 2026 11:37:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7CA3B42D3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:37:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214624; cv=none; b=d0MQzpos7HA5vMpQosV7i9m6f3A3ovoWAjzUYhrx+Q+6Hbfk76lJS7Zb1GSrjJPSLIUYtrJKnwKhPmYprGGgzs801SnCyjG07UvBTz94zh1NtWXVxoUQK93Xf+u8Eq4C1ESVqhsEsRMO8LI7RN0D1kYgvEornyRvaxUOsF96zSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214624; c=relaxed/simple;
	bh=aTuVaf0nYfYAWfdJkxo7EvxAlbxCaffxQrDNMK/QZvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2BER96Yd9zAaGVqPVj+vf9/N6cL5DALHQGDfScleQs/DXXex5H/E8KPQUnaO5XCTUiskFnsUh6xh2LBObWYQ6dHH9ISS+4tkjPjOSNeEO63HzuVX245QaKD2GlSyKQUbhAlGSohtC0GppRM8kMk5iajDaD42HHnVbe4YSoHvx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OetdD04s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhqI0p0/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZdLt4052485
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXNsvpmExzEXM1J7XKQU25avjaUjuFbYf81y6omDQEg=; b=OetdD04sMT8BXOHl
	P0ZfY0xGtL2vRhpknWkdpuLX31ixTvC6kpV0E7VQdx0gj/pE8GCrCnomrMVSoU1+
	L2bCcW3nQ+aUWuIXihofuZXtk6g13KrVR2/2baRhAnB8pdxL1JML37cHNUuDwsL9
	5MVe6YTHbtX2udMawnrW7aZgXiGhpEAyN2hDgmAJLUOFX6tzvK3dZK2DqvRnWAbA
	ndKWhmmmPYlyDqb7nmieAixUTjlWqAOE0oPFv8GUUkOsTpEFyBJ6bbgzJ1gvoniI
	XyL5R7akeITlahYsjQv8hfHbBlRRM23j5kPYYklFHNfS/zERxNBB56rvyaxkX1YF
	GewvCw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9yr8gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:37:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5176891d0a9so13481611cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782214621; x=1782819421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MXNsvpmExzEXM1J7XKQU25avjaUjuFbYf81y6omDQEg=;
        b=fhqI0p0//S0ptLFS9q3SPgjA90L49YS8l2fOw8jC5j8LgGtMLdMKOAWZ6iT7/yZ4pY
         KqEbAQdVTqCEiKx5pxur0hNuQn25GetIndI9QLHFyaWNmw7eGbVQPHRlnXEjCTPGew5k
         43ktsIg4f06uv/jCEG04lVn8/BWElrFgvGq0Kst9Wuot33QnqUbGP5QhCHAvSKep+bxA
         qB+ndilPmKj/600u6wbeZTsLU6dIBb+QmGixrROXRYWyqW8KfvJdFtZSJlhd3FRNccwx
         3acF8jbosGBQ31sPp7yVY4DYuJWILNuXhWupEfAJ9ulS4euKMbuJY1Vntrf+IxwllmDQ
         idPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214621; x=1782819421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXNsvpmExzEXM1J7XKQU25avjaUjuFbYf81y6omDQEg=;
        b=Or2hN8AapQIus97ZZgpRjfqzwK/kCK+Lm5LdLOU6x22kKwMIdwd73O09wMcLN9QvK1
         skWQ8hSguTeh8ChNDiRac1moYEKDD3FKrxU8mazVw77tSFxStksn9OHLFU+tCwJz+smd
         HAAofzds85Hz60zsp8kk+9y99kb0epMBS67Fzi7rnTG1ogMXUZJCuQ9R0S8oLikEMhBR
         y3DBUtJkk+yhzCABrp878HflT7U1eM5JBZ9hBvs/jx6UAYq58OSwQB88svrjqpbQpOTG
         b939oR3M2Rl6VGaygXeQ0o2dOx796GtY6V7wiKXYQjROmpK14I8KdANUiXqi2C0Q4How
         PjwQ==
X-Gm-Message-State: AOJu0Yy8josQ1vGtJA3456gM3VDtMA4xncbpYZ7JEMMPlMy5YUrSCKdx
	eR0LFP5TSfqEGYabSa6ErY9Z6tpofeOp4msgKegGuRE+hNnUDCnS5c9HDmLwmxS1lBIQ2CFqJjc
	dTvozorwNEkz1+DUGUb3JhCla2jBmU/iHGEdUng102CbvXsrTTw8NNdM9TB/ictoYMLi6
X-Gm-Gg: AfdE7cl40lkho4v/0TqfwF4VZUu97LxyfWsCitAhuYyxnVfuSGZfK2qhQ23RJCkFE8M
	KG4wnRlK29fy0DbMkPbpl4gY7S7p0/gzUISJsbZmo/Kmnh5xnmTKsq2AsAM5hr6b1gA4oQqLSq5
	q/v63zM3op+BpSwAbHVO8QIP50NUW7n9YgY0Oc5Pp/pjp4wmJzIiaGKiyMJQG2eH6PYAh/5l6RE
	p0VqYMOvfnIhIP6z9WxXVLQ0nAXnpScqLnWa51LiVSCeufHsgSx62r1P2hBHATF81PuzsF6Jjr9
	7Axjc5XMzyKbVCN5002pYb3YLDtGBLjZ0dj920LYJf2EAO1Z9KN6MJZKHbKBgVwSmQyHRIiBKNt
	O7jO75OQDbFxBpGi8bvwxMKnpD+Rv+G/46Hc=
X-Received: by 2002:ac8:7d49:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51a4f380d0dmr47487281cf.0.1782214620869;
        Tue, 23 Jun 2026 04:37:00 -0700 (PDT)
X-Received: by 2002:ac8:7d49:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51a4f380d0dmr47486981cf.0.1782214620409;
        Tue, 23 Jun 2026 04:37:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be498e4sm4536670a12.20.2026.06.23.04.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:36:58 -0700 (PDT)
Message-ID: <4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:36:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] phy: qcom: qmp-combo: Correct pre-emphasis table for
 QMP v4 DP PHYs
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3a6fdd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=N-WSo6sfiX0bQk_JYPcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: WyOX9IrA1SbCPERrQpmPpq6l3qVTRM1O
X-Proofpoint-ORIG-GUID: WyOX9IrA1SbCPERrQpmPpq6l3qVTRM1O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfXwGiJ2uIbUUt5
 n73aOc7uNuchOBuxcp6jIQ1dT65fOsZ/qg63t+iTF55Aigr+sVceQiTqAlwU0aCLhnwQEZrMeHK
 /bDw5RPpB+8xMy8jSnxzhiRdtJE0d/64bUwbUMDSzRLXUDKM7J4ZqXxo+tgdm1JZyM5WsC2u1OQ
 olKJsEY8yV0xpAY9k1OXzC41e+dZ9juNoEPqlM1t+uK6akbfFl+AytFRMdhj1UOeLT1b3e4/oxt
 qwMliVXkUHD/Du3/yu7adFxGIYq+2mLPOpeSfLlmKPr9QAmsdzgveQBxDO4TS5JLbKf6eHWNkRb
 /sOqYCggwUdPTjRqShrvWK0ZGfakMjVHfrbazKxEIt3+/Qbb25LVD0i+83JTtWLhixCH3lcsxWV
 z3Xw4pKICVjKyrOad+GrBh2EdiZeluLmufEgZCStiJLi9sZTzvUoJvSBVBI44Zkmu1WKLMEcGDg
 hR6L5euohX6U4iQbtTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX5d0NJ1K7aI2W
 37T4ji3usBkEHbDsokAaQfQYupEZ1hnAOZYlPcFgVwFCrl+2n1sOn9c4QB6+ek7DD7Dtid8Gu6x
 9R70I+W0GgOSkwjQ3z6lfOQfeO4ZQ3w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114188-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B72B36B6C28

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Comparing sm8350 and sm8450 tables, this seems to be typo.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 9bd666ac2c49..5b278fd54a16 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2108,7 +2108,7 @@ static const u8 qmp_dp_v4_pre_emphasis_hbr3_hbr2[4][4] = {
>  static const u8 qmp_dp_v4_pre_emphasis_hbr_rbr[4][4] = {
>  	{ 0x00, 0x0d, 0x14, 0x1a },
>  	{ 0x00, 0x0e, 0x15, 0xff },
> -	{ 0x00, 0x0d, 0xff, 0xff },
> +	{ 0x00, 0x0e, 0xff, 0xff },
>  	{ 0x03, 0xff, 0xff, 0xff }

It seems like 8350/8450 should be using what this driver calls
v5 tables, with this fixup:

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cdcfad2e86b1..63a4f2127e3c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2134,7 +2134,7 @@ static const u8 qmp_dp_v5_voltage_swing_hbr3_hbr2[4][4] = {
 };
 
 static const u8 qmp_dp_v5_pre_emphasis_hbr_rbr[4][4] = {
-       { 0x20, 0x2d, 0x34, 0x3a },
+       { 0x20, 0x2e, 0x35, 0x3b },
        { 0x20, 0x2e, 0x35, 0xff },
        { 0x20, 0x2e, 0xff, 0xff },
        { 0x24, 0xff, 0xff, 0xff }


+Dmitry please confirm

Konrad

