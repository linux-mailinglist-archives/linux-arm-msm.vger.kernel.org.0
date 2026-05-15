Return-Path: <linux-arm-msm+bounces-107770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEA0H2L2Bmo4pgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:33:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F2C54D64B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94AC8302FE96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD3B3CF664;
	Fri, 15 May 2026 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kx8BpcW5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Liwwskkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161E843CEE4
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839810; cv=none; b=oYVgrVHd9ufetKOnTwAogtgHVLQH2lYX9o5a6rPG5fFC+yhvKWCEXuZZPeuss6XguD1PMvIumlfgr5Fyo+TFPbvLCKsammfmPIt0ZJYlcddtMfeSHkC3QmR9suBuKknbYi6qj9SUrNSVzdpUKoxSbd/Vrx9DwzlVjwegZ5Ml1vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839810; c=relaxed/simple;
	bh=r119k2qqSvMGfTsUYPr/T3TtmvauMbPiahQOfS/2/Cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KnV7IPW2dEU/1gVatKyTevCl3nH5iPY2K54mttebdkW8zZPePvGOE+fmcxGXzIezjcnIxOPEMmVDZI+wgHiTlhokfb2fJuFfhk+A09JVoYnSwx9urEFnXnONvUUTwND1h7VEJOn3iuSoyN0cztcoUDVC03tPDQZbUxc9yN+KWVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kx8BpcW5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Liwwskkb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5TMIL3200288
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xiB3OnvSBLF2318DOoqhFlBDTm1gOmHvdH9fY8XWtYM=; b=Kx8BpcW5CCOyLqn5
	qPVO3Pg7IHdHtW8U9cVrC00Qqi8lDAW11Q1Hf5QcoAHzFatSVpHpoI+Xmo0KhVjs
	vcjKuzpNo+SqBVRHKDOopfcJePRTwrDy/RM31PdKkR5oWqT2LLpazXl350Gri+Li
	n6HCFyBsHP8Q+Nn2yjQ6286mdc+UC5pACubgd14eZQiDJAjj4J+0/SsSO1EJGeKx
	+SUBIlxr3xdRNKFPLe1Am8QwA9/mgtPaxC0hCNwPQ8SR7FTZSB8dfMqqBuJR640U
	wiBFXt+eT/lbUzO5IQFbu93ouufb70SBr9wxurFHKYLTOSoWwWQNHAlUVxhvkpVs
	TyXKGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtr2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:10:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91056376aa0so58474785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778839807; x=1779444607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xiB3OnvSBLF2318DOoqhFlBDTm1gOmHvdH9fY8XWtYM=;
        b=Liwwskkbz4JRu8CuBB8Skq2nYGMPR+o5c4brv2Z+Xsjr2JkJCTGlDAp/LQ8aOXNBOP
         sB7JDwZC0hG97Xm9Red39sR0wT7JRJvxwUvRzpVEY9Y6v2qumhfNiTFp/EHhBRW67UJJ
         sie2cBurSXkkr4QNeRhLjZ7yOkxPDNAYwGg6pVufC32hEdzSxni4gMH6Pz2QjzfLe6g3
         yto5mnFn5ggD+9R6xxomfWXuKlsdKsCKPD6wm91HTjQ98qJt9U2gm3D2jMHjf5fhegpj
         CXWVu8FJkqQyha+J+8EFwha3RAeBJ7IRluyxOcXd9YaTeTIZ+VusS0+TwOUDGV5bhkhW
         p0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778839807; x=1779444607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiB3OnvSBLF2318DOoqhFlBDTm1gOmHvdH9fY8XWtYM=;
        b=RdiIFjR/jn5uaUjNjTl/QtL9q9Gi/vQiebeZ7q7ooKpZt7C5G3rp06b/kyNT87s8/H
         6iLdwCGs0iXMHh2bq0pkX4eoFjquuBrCXcJwd/wU9SQHl5HlD5WKrJsX/YtpGO4Qe3K5
         T5Hee7lNPflK/7+laOHEsUj/81TZ12j6hzrUZ0XEzWFOO4f4iGiK6R8fp/umxktOHA8D
         8bWojB+8kB3QjqwiNJ/zauOAJjpbnSk5mC8hix1XNKBiQ5d3aQ4SlyOy1Lq1M62KhKhz
         Ri+FNaBRQC2bDmc/APhHEfWxosV2CO3zbHuDSFTZ9FeybZkynEE/KI6h0QiQZGD1ZDmH
         SfOA==
X-Gm-Message-State: AOJu0Yx1zbArukUS4cNcGH2IP7Vpovrc9l7xbRy9En3LM0j91eJfAkYn
	KhwT52G/IvyZG0jygXYkXfnXBt078eBv3xo1tDY5SiNEuWdhkB6gRYiOP1xE+3HiyW28vfnDxz3
	pPpzBofJgt2nClbMNf5NUFJWDKWsObzQJXUnp5CrylA0yWnxKp9we9JNVDOa3TTZ8SKxg
X-Gm-Gg: Acq92OFlSwIEq8rAnj0paFmgRxgrfp4923HfippGCGe+GsVBMjTlyrPrLKa0BYmDVQx
	QLTXFmwcgpGcLrDRla0i6SK+/Y2mzIl1dSz2EhzpZ9dwspFaFBK1N5AzkG2V9cGihA6s+F03udI
	wkIgWgSQ8fKDFIw4lueNh/wKkyllVlk24ebC/f5hwz/NqrKsyj0bIcBUeZxjHB6r0Qoz9dIHVXB
	wXrLOFxJ8v3gajMzR9AkkQnQhLGqjNHZUyrA5L27qurLSOHlfADD+sxrAUHnSaVtvlzwZO4u1Em
	xbb7sgc777Arq9t8ir2iMHTEmq+UEIx54VtpNmbJ2Uan+75bNysLAZMy9LVOWngBs9KIyfLAz6g
	UyICFLg+LIMtDiwb97Iugd0CjJfVdmVzmqET7h1GQMtieK9gmPtKayhP911nFdLCr+P0I4qigrG
	ck5Jg=
X-Received: by 2002:a05:622a:111:b0:509:d76:fe73 with SMTP id d75a77b69052e-5165a0dc367mr28650031cf.3.1778839807334;
        Fri, 15 May 2026 03:10:07 -0700 (PDT)
X-Received: by 2002:a05:622a:111:b0:509:d76:fe73 with SMTP id d75a77b69052e-5165a0dc367mr28649781cf.3.1778839806902;
        Fri, 15 May 2026 03:10:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311879bb3sm1812289a12.26.2026.05.15.03.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:10:05 -0700 (PDT)
Message-ID: <d41015e9-c31d-475c-a88e-791351ed243f@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:10:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] interconnect: qcom: sc8280xp: Enable QoS
 configuration
To: Xilin Wu <sophon@radxa.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-qos-v1-0-15135858cd98@radxa.com>
 <20260507-sc8280xp-qos-v1-2-15135858cd98@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-qos-v1-2-15135858cd98@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06f100 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=NfFXuZlUh8PrNxB2MeMA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: 5-nCsmL5IUp3yx7PkGgeVM_PdCQcjwHh
X-Proofpoint-ORIG-GUID: 5-nCsmL5IUp3yx7PkGgeVM_PdCQcjwHh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwMSBTYWx0ZWRfX3FlanROEWHA0
 FXtRSoC5qTdKiwPlH1yhviOcDnAmkpJ9RlZMsSfdS5uw2amBrjFQLN5eTK196AIvYzancjFU+af
 oPXrzPi+dWptehkbcmHbBybni/D7TPrKeiVu5MM5YpPMEPNpVyHvFlyKNR6UwOouOcDLNJ9olPN
 vXPcJN1A3LjmyimZ328Rs+ZAzY+fPH9ovIDZvSAcHXuA2PKVVcU5I/TEOB1rDZhGyjNA41PkCym
 h55VKzlq979aUTnygogtpbfyryv3IGyrVBGy5vcKLTXLGb26Ib8Qp+kZz1l545bwHLKSn8hogm9
 3U/3CJaL8z+QXnSSX2MhtEA2GTKMHdbICD6kMKPNExa4Doo63mKdWvVzKz6z+F1G90AyN9PI1eV
 uFk5d2U3qib6MFwOYNJsysR26UbkGFGabxygNiFrQst0GABXJS1bwzVZhQzW5vGU9/1YiJ1EOeO
 LRhbsJ/txD7EBfYxb8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150101
X-Rspamd-Queue-Id: E2F2C54D64B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107770-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 4:25 PM, Xilin Wu wrote:
> Enable static QoS configuration for SC8280XP NoC master ports with
> predefined priority and urgency forwarding values.
> 
> Add the QoS box data for the SC8280XP providers, add regmap configurations
> for the real NoCs, and mark only aggre1_noc and aggre2_noc as requiring
> clocks for QoS register access.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Checked the QoS settings, they seem to match the info I have

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

