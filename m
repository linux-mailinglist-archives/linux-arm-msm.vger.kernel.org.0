Return-Path: <linux-arm-msm+bounces-108923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMgdKvKdDmqlAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:53:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC9D59F3F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B543330417A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5452F39060A;
	Thu, 21 May 2026 05:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwYGetel";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BvK9LW/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380C3356740
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342822; cv=none; b=VflXvjkW8X0xlQPttzUeLXg9YPA66DSohI90fuSHjTFRgsdWp1aYruwhRVjf1nA/uQBaCoVzSwTxoQyuAWo5IpTZizoDoS1vjvncnv/eWZE9u/Fpa1bA5m53U7bmwSpntNY4MVJNOWoQYJsirBrPHA7SVGP6Thr77A3TO4pS6Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342822; c=relaxed/simple;
	bh=3oDwb5w6Kcn1iC27F9/0YKdMNP0AUUAkuVWfjkztGbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GE6bW3Ylw1bTLGUgrMtLGLx67MP7YdCtj3MzccKKrMtB+/8GNUhUt1wLuwdSwS6wsp3PtXZSxleN6v26ssklWkEjKW4Rz66t4Szy7J/ZxPq44/U8s6dPl1vy6rIYqVinRlZEVBboSB2GU1KGY0GSHuLrfx/uyiGx8JzQvKgLMNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwYGetel; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BvK9LW/5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KMMbv5963689
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ER2p52NaWry4ImHlbqb7bLd5OjEcMWE0dHx/7wqlgSc=; b=dwYGeteleGgBVnpx
	Vzek4+Ti5pRwy+aciNTjDzB2s/gUKWoW7+yBJ2UZ6Ehn+pWV4ehsEbE5tJKW4NzO
	rLjj1oDKwJbtmL3oTfi7TZyIxKUuGzXHgtpF8aDLPj1ahrOA4oX7H1d3HlaialiT
	7WG2kqF7EipECXhZkNrcdlP0jB4zkHSxdo+LA4FZ8rSoRy8XRrQcQyxDzv0kXjiO
	YleFmbqZvzruQWQaOPnxZY1IQMC60KLoxK9me5c0MH2u+zrkiGyM7o8Wjh8Bc069
	9JBHFQlBtwac+ZcxJG08FWHemxshYJKVne1urSDPd8w2Fl6ubcPYO3aSEHtyCzXK
	bTfhVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh38q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:53:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2babc42244aso139358815ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 22:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779342818; x=1779947618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ER2p52NaWry4ImHlbqb7bLd5OjEcMWE0dHx/7wqlgSc=;
        b=BvK9LW/5yXAEl11z2y5sUFWc3krytD0bPZMQZSXgydlYyaoXpC1/GkkP+lJ1Bu2brG
         YhkRPTJE1XEiRcDzs49R/sAj45Uo+Qq6pIQlMJ6GvFZolrDXi+7I+oMl5v+Ie/JiMqWf
         i1YV4MF0Ugca7vh9XCsue66AjJfN55tTAeSw95ScqiYyMPYK3qZ034dh2s93dvLkzY96
         fBTwPsqyAzeGuvoKW03mIINGO/vSkVnmAiYkQ5IRSxQ6n41m1LM4v/UIc97D4YEThJ50
         UanC9e7FtOdX6E52lQFqd2HVSkEMNz4sqq7GUU6Hp94ImwL80IPkiOPax0v7yEas+Gy/
         fiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342818; x=1779947618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ER2p52NaWry4ImHlbqb7bLd5OjEcMWE0dHx/7wqlgSc=;
        b=cY3grr1N9YwEKR4R2Njbl4ZUlwaD66GipNaBrkcE/Kwqp/rNyaaNIkKIie/9wzKegX
         bc82RR110WwchJa4QnIP9FMN1c4IEc9ybpAZw8GBNR3rrcR0AmcyKeHayNeIHQdyFpgL
         T05NlnsHPxrSz5SX2jVgIxenT+G6AJ7YE4KNZoIR+YVeWa1UQ6KHo7rMDfvni3iYBUfh
         CvsDED7wMECYAb/aPpOlz8aFufj1O4EojhbZmqfwrilWR6bELb2E1lrCqSBWq2i/31tr
         APytuKysjnQcFpj7eSMTJ9dYVoVqRv11VDc1IT2mTALkYhp3gweyfHSDHLfp6eeiFBwP
         Dj/w==
X-Gm-Message-State: AOJu0YwAYRMHPIFMcST0CmwMtUg60C5LIWoBWJwiBTW+5xtggCvsaOuC
	d0kErwe23+5vX3D9jcvLzm2xiL4vIHT3/ylZ0HtFG7JGbAyDsCjFsrodPJ2esvzrmY8r3Wt6rsD
	PZF30HaDWCLUYU2gCDQc0914/bRk1lpXu6/Pdu0QMgBxsXBfUgyGbKPp+9blxxZLMcXZ6
X-Gm-Gg: Acq92OFoMYbaOg5JfWWUMPml1wqKCs7r/8AIrro85zmLmMo2z6hqpL9eTfsDrIFGpyU
	jv/8ETZ6Y/bbIDDBRZdhLBJQqNotZ78ob4JF24f6UO1F4HT2rk/iYUIKM3fa8TQLM1doQi93hgx
	7Td+4bbNREu1XWEfVpAmYYH7WmcpQufiUQmd3pnR7OJRKmmzWV58ww/LtkcKvDhvWFQOlggMAKw
	jY2Du1JzNAxGD91A10RIaCuZdMBy664llWdzrW9bjO8n0vjLFpIoy+XRmPYzH/80bobxppTQCV/
	KrTOR7K5CHw7ysYMoPH6jRo3CDn+nUjOP2LTsdOXLQd/ynS3skSpzFOQqoHrKR063NGOdaQMl+T
	3uA9YT9Q9KVHSV6symKUdrwFfN3IUGLYNXvA4RhgsPK9mw9kKdP0=
X-Received: by 2002:a17:902:db04:b0:2ba:85:5827 with SMTP id d9443c01a7336-2bea33906e7mr12904335ad.26.1779342818189;
        Wed, 20 May 2026 22:53:38 -0700 (PDT)
X-Received: by 2002:a17:902:db04:b0:2ba:85:5827 with SMTP id d9443c01a7336-2bea33906e7mr12904225ad.26.1779342817709;
        Wed, 20 May 2026 22:53:37 -0700 (PDT)
Received: from [10.92.163.96] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11d659sm237756365ad.73.2026.05.20.22.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 22:53:36 -0700 (PDT)
Message-ID: <86829112-1894-4ae7-9e1d-42f3b5b64b88@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:23:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add TRNG node
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423-knp_rng-v1-1-9df6c0391a8f@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260423-knp_rng-v1-1-9df6c0391a8f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0e9de3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VQnp4Hrt9dpzAY_ZiikA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1NCBTYWx0ZWRfX43UF13G3kP12
 6Y/w1Niq8Ws5YuGn0M81X1m/MSv2s9w67SjqxmNwM6bS8cslkiyyfjjxlFetXByms4JfC2VODxm
 sgRNJqh29f2I7Lq0qyYRTEvDqUn02xILiDiQBI8tO+wnR8zQXxkmTB1/BzassCASPQE2n8jo/Ms
 i281cFvGe/BsS4frWAVSE+vHEZj9UVLFjM8OmtW/sw93n4IzstPB04w04qN/oeCk/+NPDEoeCGW
 G0B9xR/2FMiyqXm2SWPGvte4x1QFvWDxbKlSJy7CHFHVYUe11evc0mF5DBFF2kr9FIa/K7guKsG
 LWQcja00rAiFMGWmOEfMcwjs6jhQoPeupx+LXtWm1nk9IOBEQ3oBWfJOgwyzUXRmL4HyG+3FO6T
 hD4RfYwdfR2BDmm4jMwF1CTCMzBbwCsUoNoX0n4qZX6es95p1ll1znbMEu9v3r2DCPydxsDxZNZ
 zSiy1siN/CLNQqS69dQ==
X-Proofpoint-GUID: v_JKPu0tAHKGh-gx6dep8mrLz-0OO8lT
X-Proofpoint-ORIG-GUID: v_JKPu0tAHKGh-gx6dep8mrLz-0OO8lT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210054
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108923-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FC9D59F3F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23-04-2026 18:55, Kuldeep Singh wrote:
> Add the kaanpali nodes for the True Random Number Generator (TRNG).
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>-- 

Bjorn, kind reminder to review/pick patch for v7.2 merge window.

Regards
Kuldeep


