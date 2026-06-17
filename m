Return-Path: <linux-arm-msm+bounces-113622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ajjyMmiLMmo31wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:56:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E34F69958A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:56:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=c8XAmmUX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OaqSLzKx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113622-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113622-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 417F73131155
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883293EAC8B;
	Wed, 17 Jun 2026 11:34:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735AA3EA955
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:34:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696063; cv=none; b=PsPDLnNBuToUTYUNN0D9Gfm+slP199A5jWvt9J0jW/klp7vNjyYn4rodtwJWAJLnW48/YmXrVLovG8jGHHqGWstQefno031pqjTxVeyoXBVfBdfO6+MChnxVlIqyr6e/TgKcOsO06TRswtSqUyuEZUz5yN4QkUup7HiCyRXEPVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696063; c=relaxed/simple;
	bh=ZL6NzegjaQYk/nqnKbONUU0+tW/kHrBfXeGyEtWiwpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y55VjyNmJ+ZSxRbbl3f9qC5XU70kyw2Os4RUn9e1VlbPKWIrnzyIm55pDfuJJxurfu0nqKqctbP+sjYH4dZC2xId7JCyUkt2mg9XvHLItCEi9HFxUz7UvlMbSIoDIlrUJUuQVaVz8Wpe+PONFMT7+dl0YK7ZKTCs8DyPbyVErKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8XAmmUX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OaqSLzKx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8ULeA239815
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3fJNaZNbVpx61MjZen3xJ80Xr0pmnhphRl4LG/r1wo=; b=c8XAmmUXUgoaaBnw
	c3a7aAggN+cpEBW4RLlN36Yc245I46wDmKLeBy1I7yIiOARyT8OU7fUpMBSWH+PA
	odXVxuHY3BuJU0fn7eU9/ciMFTRIruBEa6RMUQWLPGpEBgs06Ann6MrL9wyjrcO8
	uec2HQkxuaN+SXG+2yBxKoL4UE8A7uYL+oNwMqkvceO34oPFdclur0D47TIgtlz3
	UYx1uS1wll+w6nPmlPr9Ac9A9+YsoEOmV5peFpaxpCZUSNOlCmgXXSJGOD2I43PQ
	mXc+F8JuuRklniUJSWkKN3XuIZ7hikhN2bUphSY2ro9zAQ6BG/O3DpSdajkFiT3V
	ZmwNsg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueepjteu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:34:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9160006de85so145808785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781696060; x=1782300860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3fJNaZNbVpx61MjZen3xJ80Xr0pmnhphRl4LG/r1wo=;
        b=OaqSLzKxeuZofLWj2+n3Dbagtv4LsKQZ8HlZfUgpa3fJ+vCMVzvpAcPawPrVXFqneB
         oyKvPNyTu0tjvLfFKO5DIr0CZ4o92dKSgyKe/5I7w17epNiHoUxB3PT+QlkThXZpsRT0
         /nYNoWJ1hpoPMK1mKPrHGbGGI0MBzvHsTAtB5okMdF6tYLfrs3bSQiq69oE7/UHoAM2U
         kzNaVjXSgBFk99wMsUEYv3KEl9mGP97INvxJAZS6eP0+xhj6xD4Ncn3yLsBNE1LPn0QO
         Lo26y82rMnxc3F38J1VQgkuilYMaF73sXmdedxJ/0CTAcdIwKVpCyK5Uuhc7c0WVXgwM
         lGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696060; x=1782300860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3fJNaZNbVpx61MjZen3xJ80Xr0pmnhphRl4LG/r1wo=;
        b=bvk4auGb+lpx9pyZCXOJk+oWYMh5tTbpZAMRSNxpHwX1YOoqYpUrRQL4Rf8j3n8weB
         9OQQdAdNsKbiTsRUvnAfgh7U3smSXEeFZpd9lUcdlgC3CYdBNF+CB1yzEei3upWvSWvh
         SFyBPh0XBVHYmP0hi+yEOv5j9e+bF9/Fp969b9fVhVswiLG0nd4MyirDRVYJKXfqFvQy
         I/rU3qhQiHQTdzyAkJlA6D6CdhohV5gPg+FeGHpRn0XANUjGhnaiON58zraPwOm3ooj8
         6VP/DG1v/37mAE7oNBp3Gae3bSJze1Wp/coCQgqAQ0aqrZD8jk43XA4hw1JH7Qe1HC4F
         KfSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0amyxdaviasmUPnhbkkeYXnpD5oHrTJyt7qomVUXfjn4qdLWFWWk3muKWrSIFHlsdfd3oEHhgWZo9KF73@vger.kernel.org
X-Gm-Message-State: AOJu0YxdJ4/I8kDNSU8kNDGpqbzbOWAKBW+yZ3ZDfXJHNyTjGdpan6Kk
	YIwWB5tJE3Rj37orWpUGfzkOid45pHvwZLfkM/2M40mdtf+I6+OKnraJov4joa4CZC6ycswIDPZ
	xIyRCOPiYe/BlXVi7Ac8hn7GjIQAvnt8qic/atrmrwQm9Pqhozhmz5ORxLNiv31LC3dmO
X-Gm-Gg: Acq92OEcytgFcKRhPwT8gVE9hgMBx+zZM1BKT2aXoUa0rVRceDfsgVTrtAhq1T9xEs6
	0+8ciI+jq4dSqLpWmS5EqN8yoEdjbtsxq90/2mh9kxhWkBXD2hCbVkBC8/9020ltErxsomkXzGp
	TzfXs95x26xBOi7RMei0+qlO0/TPzNTre3glyKzPXVnBP+uD8MWH2fqknTRom1/OVcPWGY6VP7/
	w9di2/WcdJMxrtzx3XEJCfz10iGhp1wPySMi+aJ2KOavD44aqh9VqfwT4Ru9zn4hdu6M2xIQRy9
	cyZwekN/nDpqYN2UnKXdKDy+gYNsvB3qhPrNpXovthtqDtUP8Qu3OH7QNRoypPzfdiSiL7XpKQb
	LwUEgReJn4dwlX/AiBZ6yczXC7t90K1JNMSQ=
X-Received: by 2002:a05:620a:4155:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91d85442f5amr358101285a.0.1781696059632;
        Wed, 17 Jun 2026 04:34:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4155:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91d85442f5amr358098585a.0.1781696059108;
        Wed, 17 Jun 2026 04:34:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6dc48sm803810966b.36.2026.06.17.04.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:34:18 -0700 (PDT)
Message-ID: <3f850fc1-f116-4799-a489-444703314a65@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:34:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: Add EVA clock controller driver for
 Glymur SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
 <20260617-evacc_glymur-v2-3-905108dacaaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617-evacc_glymur-v2-3-905108dacaaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AY+B2XXG c=1 sm=1 tr=0 ts=6a32863c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KhKKGY6azsjSgFTL2HwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ol-XvIJof9V2twIq1xPrPut6QkQfksfI
X-Proofpoint-ORIG-GUID: ol-XvIJof9V2twIq1xPrPut6QkQfksfI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExMCBTYWx0ZWRfX8oBUiHSftgHL
 Y8puIAt8ljVRGuzGzsvk2Sle5NKVwIw70ga97zhvQ7si/Whle94QgBl5nFSUXXAm8SQGolkj6M+
 tFdxSTw3+6pIntd7KjTtUOPJP4MBT3uKvR22kBTBqKQSQF31ID1HcQAAX9asY/aOd3cpGN4HRvK
 dn7ctbz6UhaIwdUjMiO9P+T+LtAy8hDxgVkIGIX3VcggDNep8SfvXlN0Ynq5UVBGEELIrOzvrvG
 S66UB1pFGvavPjv7I4zmIbwJfkB4HIWZO+f4v54+oUhf7HSKSOZINA+LtjEELSBVDPqxScTvehR
 Dm2R/BWlxMBvOAV+3ztbktNnk9gQidL08nUGScP8G8ARPsOLpOQWfVaQCiWi+LdL42UlRHhOnRh
 nNu8obtZGG+SkTQ7tGrrT166knsUIN9l3tz+gDiD9YHc26+Bz9Akv0RRJBRo9DXk5VxvQvY4tAp
 Xx+e7QH+HDAc+o5VPuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExMCBTYWx0ZWRfXzPBHPMmn6l3n
 f8CBB8l8ltB4mLr9lP2/01oUF1rarI89/RkzeO1l8+vM8efIrhapBhIPsAVh/bYwDxeio8/vSGG
 ucI11/OdCcgDHHGRNvjCySVdJdbDAho=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170110
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
	TAGGED_FROM(0.00)[bounces-113622-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 3E34F69958A

On 6/17/26 1:07 PM, Taniya Das wrote:
> Add the Enhanced Video Analytics (EVA) clock controller driver for
> the Glymur SoC. The EVACC manages the PLL, RCGs, branch clocks, GDSCs
> and resets for the EVA subsystem which handles vision processing
> workloads.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

