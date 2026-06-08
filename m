Return-Path: <linux-arm-msm+bounces-111787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T58mDImRJmpqYwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:55:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3D6654C38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:55:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LNPZCTzX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cYShVi+w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111787-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111787-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13AE530056DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCAD3B47EE;
	Mon,  8 Jun 2026 09:54:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065822F261C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:54:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912463; cv=none; b=U0d8j0ocVwiVb0WvRqERftOxAAtWFQ0iGvF7YolOOYZZZcXsJW2m4h2Dhxs1R1jMGGi/inoKmRPA0u5Zthg+9z/vtAj/8cLtevsCuD2yh9Ja8303mCrIAwX0ZIC6OcPojk4XYeoNk+G6l6SJpSHYJSz1/0odihCoV7R3QN1FHHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912463; c=relaxed/simple;
	bh=vsKka7G3UmX3nzKB76Cu1Fakbt5a+HQd2kFbP9s5dNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIDqTpteYBEnAbIvwRkyOJOcXzy0byBtB+VOCSDyMoTUoDt8Qncb4DTnScjJ6LjDWMNi9BOfyBnIuYSyHOGxK84UOFgVuo8u0dwl4k4q1yiIYn/zvo6uXpxCOL01INYT5CNZwwIqngzNo6ScnYf8yryRhfZ9U+zNm9xereDLR6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNPZCTzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYShVi+w; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Oewr2385849
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Uf0btmHOdUL8kHEgziQswexx3pz/E+zEob8tZKq/+A=; b=LNPZCTzXuPhZKgwN
	LWdoZSqKJY+pA57plhC8H1zPKUTiJqYskr07jsFA+ethhPM/jI+d2EC3Z77vem+B
	+CEirqmLUW0KOr6sGth3k80oH4UZleEhS8G429ZKepkZL6B4DZVi1P+80x6jw5Jy
	EzDHaN9oQtxmTEUj2HmjEwOTGR2QLKWkh/rNSA6VTQB0vwSDnmHqE5BP9CVqH615
	VkdI1Spvh85Z/417lqis3ZjGdOP7use5XVSvmNFM0pq2JJAJ3MXnLRhUqE2qqF4F
	JsPqssmj1pRBXFRrxbcx9jxn+5LrUPkPXGappxISXb8HDGezLSWS/sVX+j0EqrMF
	k9tz6Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8y0tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:54:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915ccc2d4d2so35148285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780912458; x=1781517258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Uf0btmHOdUL8kHEgziQswexx3pz/E+zEob8tZKq/+A=;
        b=cYShVi+woA3zREEjZOPN1LBdNBj9RMNHotGpvvj2S2dkeCmZXEiRgYCFJNiJBMnflJ
         HKYGLgwPokaEMSFFuu6TV2CFVioyntHu/uX5FITN49H+Ewp8QnuhjTMlIEbdzVn9wBEU
         HqRjNBLaiVhricOkcSHnyviyKXZ08umxj6a2Z1xcDeNyT/Jniu4buoPUt4yszO4dlvDi
         DKB3muwfWsws1xmjQ/VkINvq3565tx5kCjlQ9NIjq/B+wuSyGBp3qQChi7ClhCmAakUT
         jFk+xoF9csKJnO+xHyIN8vKf9MXyOmG1Nk/tveAqSADkhzR3BJuPldG0O5y4Mt0E8pMr
         MKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912458; x=1781517258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Uf0btmHOdUL8kHEgziQswexx3pz/E+zEob8tZKq/+A=;
        b=Pj1J+pfZYFqFtOdIGL39DIvgA7A+fSlDHtvdeS8MAT5z6/BqYE+EZXFNqlgGnnDfKV
         G9Yu6WnQ7Y3Xrj2dcaoQ+cyKJVEFRbz8oAZScW26xq+y2Vkr1oOTIU4XN7i60eAZk1Ow
         NIkRSSpJ9B8yYCD6kRIe+vrC91HPOaprddQyIyf4Bcl2DO9WYO5BQv1e3cTjrMbhfC7r
         1EsMu12rYHYQDbwqOZ7zEl7+ThJadnwMLlNpkYAME63Rp/TNJqSOVTxc9V29oONLMpzq
         mrFisEoT7jisNsYFzcG2skE4C+FyfNrusvr3PGo+SgCK1vkzEipO1lKLn41VPHORXvNo
         eYww==
X-Forwarded-Encrypted: i=1; AFNElJ8mBaGX7MbfYzDGRVDJEaVbw2yCPqYem+BMKAYu4ezQ5OIBGM9mTx44Q4yTY4ig8BKVazeyjdcC4BptLAZP@vger.kernel.org
X-Gm-Message-State: AOJu0YwJB3v0BIg6azA1NoRhetRKL7PWHVzkffbqYG9DYXpwIDuDXixh
	m8mNQODgvDnNUyMz3tazOV26gqmq+3HhnQZYWO7QusHZTmS9DwQrLHjC3dQeiksaTUMOK4BMiTb
	ZjRRFXVwkCWCTR1VfAhp1N0lGv27uurU+9VTEM24kvy/RHTAoGYABKUvqlxxO3044l6lF
X-Gm-Gg: Acq92OE0R9g3bwMjxt9XoHLPwr8Ri3pZ47STsdC9k+ZMuo8u4ZQKrNT67T1bDZqGVte
	fWz4F5ObHpW2gIzggHTTmDHOrN5QbieN4Uz5XRMwwsrXOb03pEOoOd1KYFx2yAZeJy9JFMrX/0a
	I1blarQ1OEsc2fKyM7kSGNzu4HgS5awmE8M9ZC+9HSQ1hIWEUOZ53N2APHcfcacYLcLwZzwaU1E
	N5rObUrWcR2JI9Qy2ybX1TFyIKODAcdeurFdfXNlYj5GNe5mV6CiPFsUzfQCP09Dt3gkCHOT7bb
	1dI49SRdd3tQOTnqa+rauTX5b5nodQE3ls7I+/YYeXTIfVulIsy4Mw2uSGWsUsnFkiMKPm/eV5b
	MVyThrHYs3bmLokO874AY8/3VNGTjPi+WmOYqj6J3nEkS4TIoNqvjPySt
X-Received: by 2002:a05:620a:4145:b0:8f1:9e59:2208 with SMTP id af79cd13be357-915a9d5af7fmr1416235885a.4.1780912458316;
        Mon, 08 Jun 2026 02:54:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4145:b0:8f1:9e59:2208 with SMTP id af79cd13be357-915a9d5af7fmr1416233885a.4.1780912457931;
        Mon, 08 Jun 2026 02:54:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051cfsm848509866b.38.2026.06.08.02.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:54:17 -0700 (PDT)
Message-ID: <f9136a2d-9556-4d5f-9e26-70255702b6cf@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:54:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: Add support for the USB3 DP
 PHY reset
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
 <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6vcxknnHKIAuaugqXf0lzdLiHoJytDdB
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a26914b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MiBTYWx0ZWRfX2KX/djVhqyPY
 1/vUeYnxMQl782/GkOUQ9+nzrDbrKtArxzXdU0XEfMzBA3j7bZI3sUR+mKrTG2sxF9TgWIy+fKm
 2R2kN1BLEi8iOHmOg8N17aD0qyPxtHf903TM3qx5MNoeHHQgtGvp8N+fI9KgJALltQY1zVd8OTW
 /k85Fvud6hK0hizdKBp4bM1ZZ1v3aW+BdH1jEtbiFTpPZj4q5OOl18W36f8oGTllPIVhlrNXONB
 T2b3csywAnqrIdTx7yTokLEThz+4lhYUp3OarBMitggmIs4J0M3ScnZYJsZBGSS2yTPrt5UFwcW
 O884Ekbds/9MBwAylXb6Z6Ba4KrDj8soZ4R0KYfYFLWAuXUwjmssSf/TT8e3UXJBnfqv2rG4V7G
 1NpbyP1xSsmucr9SNWlOJ1qz4QCgLdytW+TVdE96WiFnB/WX1hVkYQ1jx0eOAT9ZMpUS8nFKIeP
 3ttTLNxYLrIIZBFNqQQ==
X-Proofpoint-GUID: 6vcxknnHKIAuaugqXf0lzdLiHoJytDdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111787-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F3D6654C38

On 5/26/26 2:54 PM, Imran Shaik wrote:
> Add GCC USB3 DP PHY reset support for Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

