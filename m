Return-Path: <linux-arm-msm+bounces-97599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N4RG7xHtGk4kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:22:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A69288098
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5435132301C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A963CB2EA;
	Fri, 13 Mar 2026 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lb9lVsQq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FV2pLzHi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3763C6A2C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422259; cv=none; b=h5EcxUozCRYUw9fWgE0VxOfpLCsbNbPOhBTmHk1urgLsbsp3Tz0zPeN2k2NCM2QKtuAbxyFznEhVst4ADf51g8kAwiINtOuEsq0i4/iPGcSYLevagULEOqZ9rHI2XiJwsW5dErxsz+TBDz3b2v4R4wHMPpOUzlfuAheowcUIesY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422259; c=relaxed/simple;
	bh=4kK19L+oEXhz99tTC22LyoVqDULChFng/uYuJ48vnUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkB45ow3rJzU/8d4T4J6khsBP5bkWqYD3jgHezaBem0fgmLrOVUe6pHgJFXb75v1QwKm4QfbSOLdmonlL1Ix5wLUqNmKmNQ7pIh2dRA+9qb1XhmqNCpf7xqTnIOia9c42nCeTXiTfA51/7o4tKJUgt6GC26JQE5M73lURaUYCD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lb9lVsQq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FV2pLzHi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAmvod2391114
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/vh3LYtVXjYBd57znGWiCW9ksY5SPB92ANnoZ24/pfw=; b=lb9lVsQq3tFEMg8l
	gbivZ4+l+do9gs6hvwgNA/JWaZRW4uBr/fW6TUS1tP2+7FeMWBIad3cRIBsFgve/
	LzdJEHJzxhZ64odidmJA04jYXHTO/hNjW+cYNCdWglFiKsx+k3ZoHUZU4tdJsKBT
	vOmQdYNfiln2ps1cP7i80p9LDcZm97a11vqXKwb0exmN4trBADE43COdNmqdnGjB
	nH8YQpDqSiNQySWd1QY1AkJFTXHoYxQqmdWQJi5ouXxzKYRzFMLUwPcLYTco6oOD
	//B/jqxB/yEZ+TbTidf6dw6f9c9fetSn53ndY9cup+tt7fDPD6pP6zLwuxcSfK/v
	bbdilQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5m99xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:17:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb52a9c0eeso2255918985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773422256; x=1774027056; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/vh3LYtVXjYBd57znGWiCW9ksY5SPB92ANnoZ24/pfw=;
        b=FV2pLzHizsVGTPFGQxDn7kC+N7IelIpB/nd57cl1xWOdR9tNz1rfjQCiTAkXAY9zsS
         lcKQB8GmLpp4AQzaGuItVO6bd4ItE1stVfbSeIN8TdoNOIgEq6O6OwRwfPncsI+swUSJ
         HNuOTzjNpB0po9ZZYt9K+T21MqtejVStNoEyKcbUFcA1QNSYWgZqk6hpRg7N8rjp+Idf
         T9U9Lfk9okfYlFSBIsdKm0vJ6XmDEpuCWvIz+PhxuXjO94z6m3IwDuWYciNxc/b17H9M
         d9L7DlLqEzIqULlUMeyB8WAPmxcZ4cY043DItkK4iAfveE4wNZuC3I00GIEjBryDG7Ef
         3etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773422256; x=1774027056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vh3LYtVXjYBd57znGWiCW9ksY5SPB92ANnoZ24/pfw=;
        b=CEdCZ1rYErEsPgdHPSkn3VWbW9VIMt+BedpXnY+TxEDrzXATcItUs6q74gkiPfgkme
         omL31yjg38S2HzZz6tFuCm++0mr0B4yKFpBhfDy5Bk5+h9OKowT+kMq6OY8eB+xf0MOF
         MUH56CHcItXtw58l/1CbCSindgIDh01mqGmqVEIAi6TL36M+a0lPb1poBUKYyIOBlrIA
         kOh++nar9wtmLzRJdwZk58gV8MxlcbaxpcXM7/zGpiNm57RUa3AXfUWeQIXdLS2EzOur
         cGwVMG/aklaH9gQ0MY5wRdyikgMVs015GeVs+G6FqH7GNNe2Leg9D8TMONaRkH7imqFa
         N5oA==
X-Forwarded-Encrypted: i=1; AJvYcCV64IJeWJwFpHSzdzFuirGbZCbY8J9CWESEZLnW/bHMD8UmoMExQYQft8ToH0UvCKriSey8jS2jmyXgYn1f@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn1SheGWsxr5g8NMjrD/mypQrvFyElallVZoA3gajaKTuuDU4T
	fbBSgeTeZEZiMFEWIch45z39oVIAu7qD3y2huKXQI9H8mpn52DNNdf6/0xVQSLSeCNjMuyQzfXj
	UR+cIOXWpyZOlRz+2Ewqm0PlAVwVpONwQiVfOiYtfFV/DBcNF8oZ5/WgPkF18gT8rJI/T
X-Gm-Gg: ATEYQzzSfjOonemhYwNrDePmtvX3/eA7VZEt9MoCr2AHDbzxDQIRuMpvtCl+ByaMIRQ
	evcyTyklW2IfEFvmJhss8O4F5JaAj1SspjkoP0Yq+Mozp9v9JE2RM0SJofn+8HAwune8E7DzDXZ
	fzNrDeHxg7X2iObnJqKKOTcfQiD4isYNj8h3gwKRgAjULQHlIR49j/6PZP6GnCBjOmFIWHkzOu+
	2XJRszAegFcOyotHS68Shswg/jIY37iFn56SkrhbITdL74InTiKF5nANFY7wIPXBWYd5kaA5AWS
	7flfNYV9llgskXmtm0qlk1hOo6Nvz36tRQ50KmlDboORAu6T1vueHTV64k5m+lEwLIV/be0zWBi
	QzhY1myfrJ/juVI9TZKCZrkeFcV1/2WBaTGqpaZ6jGmIcxEZUcRC+ACqDdMLiNheQVICahx2XeO
	dGim2lfKoG4E6fcqz+aJv1AROQe2MtmoidcQY=
X-Received: by 2002:a05:620a:4892:b0:8c9:f996:81f5 with SMTP id af79cd13be357-8cdb5a003fcmr602540085a.3.1773422255974;
        Fri, 13 Mar 2026 10:17:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4892:b0:8c9:f996:81f5 with SMTP id af79cd13be357-8cdb5a003fcmr602534685a.3.1773422255437;
        Fri, 13 Mar 2026 10:17:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e5ffsm1682714e87.29.2026.03.13.10.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:17:34 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:17:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH v4 0/5] Add driver for EC found on Qualcomm reference
 devices
Message-ID: <azoaku7s3lxgcccc2rrp2bljbvqeitax2bl47k7eemy6uhcr2g@kveqod2tstgk>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <132116be-2964-4b98-be2b-1baae5bfb58e@linaro.org>
 <19e8837b-d711-4d0e-ba9c-e9b2c8330969@oss.qualcomm.com>
 <aabf9bfa-aa90-411c-b9f6-706f963a5ab0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aabf9bfa-aa90-411c-b9f6-706f963a5ab0@linaro.org>
X-Proofpoint-ORIG-GUID: b8NL8RnocyMUG4dTWygTIyoNpUMSzhzx
X-Proofpoint-GUID: b8NL8RnocyMUG4dTWygTIyoNpUMSzhzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzOCBTYWx0ZWRfX4idbcxMFdJLE
 S9mZUwVvo+Br1RlZbd/DaAC0CTv/9+lLuJA1jCx5AQJvONkJ70JNaV7b7HAqluBMocoaK211aYx
 nRaDwXEeZnF2q2CORQuS9dq6dNX8aj9AIhBJZSt3JmXEiXLJmA7o4tAG0WD/+PYC/UaYECKP65y
 CM4pppHUxIR6jONJHxGYZe5kFbv/3K9l7RArv+sVa4BVNFhMHcFkRKIri1+vKcISB5EVVA9I2ME
 qY/T457nSbSQSklV1+IqLqH4jGBpmpwSm9jLFJwud93BGj00WZXR9d+7/frlz6+usk037lykNWS
 vsmlC1xwkAfBCHdKBiIHrLTnIAXusQL096ws2L2mPhN9OqbKeKDOR7R+/nM5gF0acFYa9MS8/Wi
 1x97BQlaALMbR13LSNrnuj0XIXU8RGy2N+jWF/PjwNxqsEK++EP55SWP0MfxTVdIV04xvUoH3kR
 oEGkFVCANNmAKEbmnPA==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b446b1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=D2q40PupL0JkXlA-VGEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130138
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97599-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 12A69288098
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:26:16PM +0000, Bryan O'Donoghue wrote:
> On 13/03/2026 13:15, Anvesh Jain P wrote:
> > > [   27.311768] qcom-hamoa-ec 6-0076: Fan count: 0 Fan Type: 0 Thermistor
> > > Mask: 0
> > > 
> > > ?
> > Hey Bryan,
> > Thanks for trying out the patches. CRDs typically ship with
> > very old firmware, and updating them to the latest version
> > should allow the thermal information to be populated correctly.
> 
> Sure but looking at this we still load happily even with all of these values
> set @ zero.
> 
> Fan Count == 0 || Thermistor == 0 => error and probe() fail.

WHy? EC is still there. QUite useless though.

> 
> ---
> bod

-- 
With best wishes
Dmitry

