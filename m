Return-Path: <linux-arm-msm+bounces-92295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ck7NjzeiWnGCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:16:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADBE10F844
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CF283007F41
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 13:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2B53783C7;
	Mon,  9 Feb 2026 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAmBs/pK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTvA+BES"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766D7372B58
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770642929; cv=none; b=tFD/EWJnKZ1+VBav7RXPSAC1/t16zzHfr7wv4O1dAoDa45tncZeMBN0m1XP3yO5gAIkwM09Rb0agcSheQc+cWoQ4bgg7cMNB6d7kz3UH+BrzlQKjFXIOZXqLQCDFsCSjecTCAKYeRmW71/iRVX+tft8ph1HK35ZWJMFirorUXi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770642929; c=relaxed/simple;
	bh=LwqbVhq88t8aBfw4Xxul28v3S/ybA2Mz0EZOwyx2I5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueQHZxd0PgXbnZ3H5Xe60pVB6MqmfG05dmOwpGk5XeskQQ4I+dXSl0R6A6L1k4gyU1/Uzcyyaw2A+Y5gCfBZU+QdRG6NCrZCr/cJqM1CMzimvPwEvkrN/k0uFzqeIwzwZbD8IUEJu0ETM+bdu/ebogPDjhNbm2+EDpgYhUwgkiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAmBs/pK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTvA+BES; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619B4lrU1923235
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 13:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yOUpcXxCP89PrI+tA5PEAS3X
	FB2GxlbHv6pOAJPowUw=; b=hAmBs/pKw/0T1w0TAjjC/FZEN5R6YPH8wY26Anmj
	EVzXxnMInaTQWzGOBnNdWjcF6nI7Iefn/bB/BKwv99KJUi+ABNvlz53HTrhTvGsk
	XakLx1xEYguhSvhvkkc8RE/bizD3G4iC1sSag8LYvsw3PTXtJ24JTgdydf10B7aA
	ysBRoD/31O0A4Do/RbR7p3Aq42fSgwsZhrs7dED9vWrw9gtl8Ru6d6EA6hg9JZdK
	3B0OZzh71e5Mf5vW8eIgnImFAK++Rip9c7djPtAlhmjZSM+SukodJ2tdFk0RBd2G
	TR/5Id1a27RzU+7SJ6tvQLGAklZOUD/Z3/lxV9s1EtVekQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c796kshnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 13:15:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b4058909so1175528185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770642927; x=1771247727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yOUpcXxCP89PrI+tA5PEAS3XFB2GxlbHv6pOAJPowUw=;
        b=OTvA+BESFGPZFhqWC2AoL1rpmDuhUfPcorfLHEToIct9f5P+wI/XX460/38boZfNwI
         3L2mJiEwFd81Fa3HcSu2dZojDtq9oLDKFRapZfLzNH2m9LsHPapkm/lKoIVnPjG20GIZ
         vSnKToGbo310NzKIsw1F5fx/E103lp9dLRKe23PKLOgBYSLO1wmXVC+C1eSUdrpR3xq9
         FZD6T1JpuxK9hP1PcCT9vB7yqfiwEjDtLlwx9aGZwxTCQcCeHdzPTm8H9TYDPPIdy7Kx
         hvjEHcAg7BPW1o5sBsgjZSLeNJPTrTx2uYZjwf1gbJIUb1YCkbY25CeXLumryxS5TSRe
         gn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770642927; x=1771247727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOUpcXxCP89PrI+tA5PEAS3XFB2GxlbHv6pOAJPowUw=;
        b=bNfg+sK4i/mGYdxYMNfWFYiQzEVMjAYVjOos69MeaQBb6j0m5Ie8aUgTXz5HyaTzgr
         NiGpkWYGmuGmpLJhApJg/MPg/zupkZCgAjw4zHPW8eEw8ap9kEKmhinRSyAuaLmHlfM1
         QLs6V+r3tIKxhwO2QihANEC/e5MOUE/THew1UN4asZjOuSA1IlrBgcV6xtP6c9Zcvci9
         tnfj9q/2JHJTrp/GuIwQwaRfhidOKqScMzbnOcg6lNGaIWFOKx2qeg38tLcexTXid0OZ
         3OE1ZyckDcbQ4BYWVIx6sjFqlvNx+Jiu0pBf6VPC/bi1lo0GcDDnpXPdmq3g1EE2+l75
         vFgA==
X-Forwarded-Encrypted: i=1; AJvYcCXHvAqvh9S0te3b/vVxMvuqak1vOgKzmMJNK0Ab6+phVIv/DSgF6TorKh2YwwUFPSQMqU61SeTg/ueqljWb@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ3hNwBZENlh9VL5TKyOdBBlJ1qJu+CcJh9KYRu9wth1SJgDfr
	q42z03YgK9n6ijAvAZhowygnFwEkhhCUAvQLeCdgL/XJMiyiNjsLGwkdvAMesgBGYZHfULg4L6t
	79sPlsQNOq6tqIWxAIFZ1svWG0sQvhNT6tebZbR+5hP6LxbTrYGJJp32wCzHlCBxw2q+k
X-Gm-Gg: AZuq6aK888e8ge4WL5lWG+qW7qy9sc6elQYWwcajUrJtNJDXhBudSRKQV9Fnk3j06+M
	DenMU2CaNuibuH4LGVHKFmqp3JpsB7di3a4YpGrkgKQSxZOGODRlhZmg1Dvz4tCgrldApZOEj5h
	Sj3YVGypOmzicHOU9GhBByvgR/ns4g4WV9+pkUKZdKDBWtFnaEEousEDS3eCDNmUs5qF8HWM08n
	8J/Ot/LK4IYK3Ah9kc2a5zFGRFqMjS+NnJGFf9HFTXHatDup5Io3QQH9i3LYNooKYJ48VwOJwrI
	O2N6M1td4jHVYKcpCCq3TrKjYVT09Vreoi1/43wY3Wr1w/hMYrkqh6+bNF+aDo+5NhQ7iPchM9y
	gklco1B0a4D4j/yofQELq4oaQogh+r1lmzSLXsik57VCUACzsgTRzP5kezXhZp9ul5HPlzklt2q
	AE2ramipbH2RtUpIYYVHehog4=
X-Received: by 2002:a05:620a:1a20:b0:8c5:38d1:7734 with SMTP id af79cd13be357-8caefeb517emr1356021685a.54.1770642927636;
        Mon, 09 Feb 2026 05:15:27 -0800 (PST)
X-Received: by 2002:a05:620a:1a20:b0:8c5:38d1:7734 with SMTP id af79cd13be357-8caefeb517emr1356010885a.54.1770642926741;
        Mon, 09 Feb 2026 05:15:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44d298cdsm2607750e87.52.2026.02.09.05.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:15:26 -0800 (PST)
Date: Mon, 9 Feb 2026 15:15:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add vdda-refgen supplies for
 Glymur
Message-ID: <jvitdcolh4naqjdahaajlzdctcmp3sy5odiheeqacps6pcbg5t@zx3jliileazg>
References: <20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com>
 <20260208-refgen-v1-2-87ca84fd78b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260208-refgen-v1-2-87ca84fd78b3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IeyKmGqa c=1 sm=1 tr=0 ts=6989ddf0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=aHvCONSEC-igqZHWBgwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: P0pRAeMdwnsc03Jq4KOWlJSSySHJ9oCi
X-Proofpoint-GUID: P0pRAeMdwnsc03Jq4KOWlJSSySHJ9oCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExMSBTYWx0ZWRfX16DpHo4yN4+o
 M8POlBehkkOe24ruYq/+IzS4WurCDWspPsh8tymnAil6+/ZbFcQaanwq8ALs98Yc+JUoMiPh/Fn
 BmVK1YMuEyYbZmcbvoekBR+UkNY+D4AM/vS6bEkMkFUdUj+TQCmICsEHHhxnP5JR+OsFT1fG5TS
 ZyXl5jhIwkERPkvGxpguYYtsktUPH7C9vGMXO8jB3bbrnuddAykEsXZMwIxzOFR6Z3CcDxGXq6k
 Rp2lE6M+58DXJvLq8ljWVrhZDNxSszTIpjnVfdYKTmCh1PJ48ERAA/wQrZcrQyHQbyKzCmflKM+
 +0Uoqkniq4embSUcKZKLB4eveNgQA7LXWn1gIWPEAxLRDROFUVKeN2iLKuAHFYOzx/WYLhtMYKa
 aBouM5U3mUCYhowL8B91i/dSJKLgM72GPU0KUaJjnuafjrUEpKPtXc6grB7ZWG0EepXuo0env4P
 NQyuPRQdBjVfSC+cl1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92295-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3ADBE10F844
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 08:49:40PM -0800, Qiang Yu wrote:
> The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
> two power supplies independent from the PHY's core and qref rails. Add
> support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
> glymur_qmp_phy_vreg_l list.
> 
> Update both Gen5x4 and Gen4x2 configurations to use the new supply list.

I'd ask for the DTSI patch too...

> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry

