Return-Path: <linux-arm-msm+bounces-93395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBg/M40Rl2n7uAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:35:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E31D15F1DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4E5A30160CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F6B30BBBA;
	Thu, 19 Feb 2026 13:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4z9GCJn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQRvx1uo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0846F2FD1B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508107; cv=none; b=rKSU+Q9aMhzk5oe3EK65ORTIF1t6s1DlC3sDDVzCdmXjp/IBG1lYPuSqlS7wOLVjNOb5A+/iSzUUjg6ydcG1qROA21YoaISmb7x8/WCyJmbxE4WxI0J/xhnLibOCL+Yv3i6G5P0jFEeGBvVQLNI+tbp+8B12rN9Y3N6Qiu9J8o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508107; c=relaxed/simple;
	bh=Zroplj6cKweV00qBUf/DfTbYNXFxZiO96V0pSI5AuTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gWssxanGRuBqiVVSfZHXm8wsRwWegfEnIuG//tamywvB3EFdE8NL0mN4//eRtaMQsuYjNlOoxx5mmmtKmloUvFXadb5NOLJHAIl/mqYoslH6jGTRtDxbY+Q1n1Uw01yEidGkXnv8U55QMYcz5ONK3KoqsuIeuKY0/oH+AaDfQSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4z9GCJn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQRvx1uo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCOVtI408590
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uC7s8FOKOc4QcSg/6dSZjoiAxg49acrq24OqsiqPGu8=; b=Y4z9GCJntT7Upwi9
	2gxU9QMbAknnA3JdKLhsH2LZjLkIGWWLsweitBpQpmz+fHNlG21GSVlSzkJAP2WV
	MPPVApekODBuKVJcxLQRkjKogHFRiQ6a5LSAvCIlFdTPdBEn+WehhktCKlqwNv+c
	RFq8nNnD+esrQsLf4vUtll8xUKDTs4u+9YwdwK8s4mvyfLOkO23zhASPqXagtDGw
	EjDy5r0/cU8R+ZfsDD32PLlcnfKyWVuaFVWWGpGusqHTV5bIpTtutf/q9QhdTF3z
	WlGJmdbRnl0vm/7j0aaFw57GbLC1riWL65Xekujzj/u8jD0vyesDlomkgVhOV+ZG
	jHpy5g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce2geg6gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:35:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb456d53a5so85155185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 05:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771508104; x=1772112904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uC7s8FOKOc4QcSg/6dSZjoiAxg49acrq24OqsiqPGu8=;
        b=IQRvx1uoKnlU6b591TEF+rXRYBNpdF2zuUMlFQGtMovvvH3dEmy8wpxbiv354Aerap
         a6Tlk97O18tbLIM8N7JQgkM9KGA2dGlz826JvjzFEguj6/toC+YxytKT7fo8WNsuEtNf
         0oUI4noyheHEFogitMLKKdOlsgKPnTxoMXO9y5NKiCFIOoFE9BKn1ayVe+p9c1piaiTu
         tKurJtqBU41Pn0avW/xs36nRfmqNMMmE6ON4O+LyaBsquNdN1I0C0gQSYmuTzyAA1AH4
         5wcr2Zrqd6L6XtoAf1v7lEUv0v7pBcf9j7gfH3O8Rmmytq8VfJsJ7mZSB99QJShVdJiI
         LtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771508104; x=1772112904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uC7s8FOKOc4QcSg/6dSZjoiAxg49acrq24OqsiqPGu8=;
        b=CQhLryIiDO2S+GvB+Phy1YzvgVDSg2HSNOFKUDnyMNCJwGcwYph8jDIra1957ge75f
         eySS31JCyW2VuJEXqBZ/kyrVcl6UVSl+Bl42ge7a2Pe58hzI1+WU58bIw2uTMYerUO1p
         yCbv+w7UV+/iy96YekE1Fcjt2tq5al1EJuwvxS4XYpMa+FQijnYbhlDEIFy7k+c3c9Dh
         bcelDy1K02rmtaE21vSikKaO7PDLZ9zcVeElhMENKA003YZU6bqHBL3yjoDT/dqBeNi3
         smSkTw4KAP8he5M0rgLVvP0zPBW3B7jZ1g+DGi6SHvXkE3Cdfj3J5s5PTuTvx1MJt9uW
         HCEg==
X-Forwarded-Encrypted: i=1; AJvYcCU0MF/GX5Dz/qlaz5JFg0PCAppTM3x7q7FKoBHNfnmyfGQ5Pz7xWMIyeB8tHq+LPlv1kHJpv11Ymo3sEn3B@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm3j1w/58MTRPtzTr0ZUYtuqbGCOLuhbldyZkorbKOEIJV9+kw
	fV374amXHzx+mcQe2axxCyliC2W25gW4fEnjvQI3KSXC7g/LFsqNczpYsG+MGnaB7ADYVLD0Bus
	Ch+eJFy093qR2fXObSvwssJt/DDTg1cBSKEmNNaaSctwkQ9m4Z2d3wzqa90XnjNUNIxtv
X-Gm-Gg: AZuq6aIcBb89ZASJhFwQX+8CfABcQ+S0LJp5q2mM09+9OVPsiAvkZmzki8p5M0NS11B
	970alPYb1fjeliNPRa1GeseV6srxr9BWEL0Hq6ke9MGEqtCgZdZERKIuLnNOvWvKXH3v6ShrUcv
	qkeBTp1Jp7xhp8RCRlukm00m1wN5EL94+D4r/Ab2OPd9sWD2DtZE2bGdoBMjKjMnMLFkhkBlmEL
	aDV+OOcpELORkPu/mic3GXdeYdP3pjtlPaNJWyu0+aBvhsPTkwbSTObpV2u95HUkVvD8O2hSWyr
	30EN4lDHtXH2b5qKxN9rkqCwjsSTAA+3g/vX5J1EmKliEiVZGP3M82w5Xf0v70wu8TXRyqOYh01
	63ow+3kon/Ucp3qnGfMJ2AKLvdVgRMdgRtQ3z7+xGa+di+9vHzMq1zPQ6o1eRcn4aK0l7hDWGxt
	PaD5I=
X-Received: by 2002:a05:620a:708e:b0:8c6:ab77:f95e with SMTP id af79cd13be357-8cb4091adb2mr1953559385a.11.1771508104319;
        Thu, 19 Feb 2026 05:35:04 -0800 (PST)
X-Received: by 2002:a05:620a:708e:b0:8c6:ab77:f95e with SMTP id af79cd13be357-8cb4091adb2mr1953557485a.11.1771508103863;
        Thu, 19 Feb 2026 05:35:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76c6b8bsm552980666b.65.2026.02.19.05.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 05:35:01 -0800 (PST)
Message-ID: <3ee0a0b8-7070-4317-b8fb-20cb7ab467c0@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 14:34:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp-ufs: Fix SM8650 PCS table for Gear 4
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
References: <20260219-phy-qcom-qmp-ufs-fix-sm8650-pcs-g4-table-v1-1-f136505b57f6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260219-phy-qcom-qmp-ufs-fix-sm8650-pcs-g4-table-v1-1-f136505b57f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z5/h3XRA c=1 sm=1 tr=0 ts=69971189 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hrNMlQYg83u7S6_LzQYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: FKcgum01HWjBXQe242Q_yTjDJ6QvW8kM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEyNCBTYWx0ZWRfX9ZmjQzXq7egD
 XiwId9ixA28//gq4WDRcubhlxV+j969Bz17f6kpKmDuwtNSbZRE7RvUpjq+Fo0stlce2Ni124X1
 +iQxtuYVSoXJ+7qoJLFm0BtlJFd0E0a+l+p4zSgBCrRO3eU7ZLKYE7WGxQFNqm7sIZG2ou3OLLx
 m2op4UMAPiH1CQb7rddXmeBVq72T3aS6eDlyfCJYKD3RfZ5wT19AXytWZ0zwgeamWK/r4n788n8
 eT/SQ1wKcU1/iwdwT5BI4ESEKCEwtfsEBiqe0yJyxL5cZV8UhX+33ibOcinW9lZ4ds70ZxY4fkg
 9d8XUYkDoe+HBq43A6OlFzXnMNFcOot7Cj4IdxGuXk+cTafrAKllrJ6k9j8lNZj6/Yctz2lWmxY
 /q9pULrIt0TQf7TUFeSZPLQeT5op1Dif/WDPEHdvigAyBgHC5za43M7SmOnJbcT8OGTvpA1aAdP
 TUKYmRgOgyurQf+iZlw==
X-Proofpoint-ORIG-GUID: FKcgum01HWjBXQe242Q_yTjDJ6QvW8kM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190124
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93395-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E31D15F1DF
X-Rspamd-Action: no action

On 2/19/26 12:11 PM, Abel Vesa wrote:
> According to internal documentation, on SM8650, when the PHY is configured
> in Gear 4, the QPHY_V6_PCS_UFS_PLL_CNTL register needs to have the same
> value as for Gear 5.
> 
> At the moment, there is no board that comes with a UFS 3.x device, so
> this issue doesn't show up, but with the new Eliza SoC, which uses the
> same init sequence as SM8650, on the MTP board, the link startup fails
> with the current Gear 4 PCS table.
> 
> So fix that by moving the entry into the PCS generic table instead,
> while keeping the value from Gear 5 configuration.
> 
> Cc: stable@vger.kernel.org # v6.10
> Fixes: b9251e64a96f ("phy: qcom: qmp-ufs: update SM8650 tables for Gear 4 & 5")
> Suggested-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

