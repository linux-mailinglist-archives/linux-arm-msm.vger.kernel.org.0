Return-Path: <linux-arm-msm+bounces-113991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lFQoDWIvOWp6oAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:49:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B35726AF8E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:49:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VrA9SgoS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZAphlMpX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113991-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113991-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28E2E300E024
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B09A3ACEF9;
	Mon, 22 Jun 2026 12:49:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F25D3ACEF2
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:49:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782132574; cv=none; b=DBjYlcP1yu4qRhFLObHqUfUqM4aMOFOYrD7fD5MOujSaj+Arq3GfmWBFY6WBZArUNj1eC7LQL+6plN3x81KiVEGl+sAoQeJW5mk/t2/EAjdztqwuTLVIeIyxzAkVzx0Xl52HLjTQEEuxuWXzTWhtGyIrWG2q2EHu3kZpcwfQmMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782132574; c=relaxed/simple;
	bh=jNMx3iwvsbfpD5vQQDO+RS21sWblQ8a23Qh7gdZ0oLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rO5iWtbI7ae21eCxncgMJsgkj8vS1Di36/DuXqxC+B3CwlfhyNRqiMznH9BJl/uCunfJMdV8Kl1TD+FCetaMU2lDYMGuPRowgjWBisnF3CitOgokxrb8Ev9SHJwn+Z+Ec2NunAWdVrHwz8k6ZdBv7RrBG4Ud0iuOz2uoa0ztiWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrA9SgoS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAphlMpX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAoFTU941026
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gBgL71/3RmD2QYBALbwcAC5G
	yQQNU9UzYK85MCGr084=; b=VrA9SgoSW6PR2KrK3hJ5bdc+NBVoG7Ja9yzOw3d8
	ghLAxRdgPCIrruRAbbXw9boz4IEnitKpPsTPFqo5PAsyhvisTqP0GwcGKIHRrx9E
	Ecvi1w1fTXbSgqQF9w+BWU5+8Nx4IdexE4jbMzMQtO14rjNeEz2IW7UdpstfNTtl
	SFriAwswDsq2mCL/5vMK2O4yz3teAms+SXmAzP97AIykSQ8CW4wEMZ/ZR0pj1qLf
	8dELuPgck4SyUHR9Lb3Ee/sIsz4wClflQnnEGBuiZGSBAfUVp1VbFvRdEQ9KzdSR
	4geleVayiPs4m4/bj0EPAfZDFjv44DRlCwxqg5EvBWuJdw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb8djs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:49:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bccca5620so5810670eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782132570; x=1782737370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBgL71/3RmD2QYBALbwcAC5GyQQNU9UzYK85MCGr084=;
        b=ZAphlMpXIw7YbfEtoppaptOXP//CJixG3uvMv0zUIwmKmOXXCzj//BcVH7cR8BS53H
         TrDLoSYOxljr3Rc/cz20DbyXklFVzrE9Qll1c52/YCeLJOd2snjPycgl6/Zih1ZsCeSA
         nuFO/Y0UmYWwEzJYcRiIR1+9BtF3/sq4Ms7tf53E1zkKutxP9IfKvE+QytFouWAki73d
         1VcoYy9weuuRq9GaMxP52XkvRnVBduLXY57O9lwqkQnc5Uz2UCECKwJXPV+E5+U45q2H
         9LXjjcqctKT5qqaicMPlmkF9qnh6+oK6EkCinR+1zWphbU/ltI7EwFashLV4vwSMNbqj
         f4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782132570; x=1782737370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBgL71/3RmD2QYBALbwcAC5GyQQNU9UzYK85MCGr084=;
        b=GhmUJ0SChJqAEe8+JM34NDbv7dmDtKWpQ5kGQYrYwDJrVrwsVtPl5fXQCTYvHQvkRl
         ytvBjOvy+Z4mKc+g+mq24zHk50Fhkip5WfT2R3q2BB31+NM2OeFRCx1R3UEAzaGqzUyJ
         IE5yOdsY+pUdQTWtWqNxku6uI1S5/j/EneG43nrbDMsqmV02zE/PAvAwJZ/icrnkWUzY
         rbIDAPowEOEa+cZzlvkB2EZqJlJ5TzDaRdMcsZ0Aneiaw2u7ntceYhOQ7GnhmOaubR7A
         RIJMUv9E6Kx8PNtsUJXhDxPHVrpBvtLXbRX+I9Fh5gv2bVUTLwlSlHxt1Co/rGc/HCYs
         vW5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp8MVJIYUo9B/zw7XrrZ1glwXuWA0KbvII9LylGmqvGrPX7adLSZ/a+mjJZdM8vfmPPBkCkw8qWFBI/EESN@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3Y6UXqgM75ovCbs62Kv4//ylimiKlWy/nr/Kbo3aDzDFcJCY
	h+eTYsN8qAhAzBpRiE4XSn9fQp4YKhYOe8gKLgOw4I5mlt1AEcqQSiP128fgAyF8M9mPS27hSbv
	akX82GDSY96r0COjnM4aknuh7vIiouPjm+Ccw8WPQe78p8OYWyNfHUMlwz+BCWXYnKAhU
X-Gm-Gg: AfdE7clnUwJkJgym897ckD0fwMYGGM7t+4jL2xhGkrHofArBc/cvDOWkYqgHrtTxRdI
	zyew6dKY3wRIfDKMlAi+HR0LFB5LKjQAPbIoZUt8kC6YS2hQDhM7JBvTP0Krc6hlbQtKeVqeegX
	3cidCOlO+ltVX70PkSl20mQ01IScV4+KdkIhQ+RlklqRwksmvtyTQnQ/8oXIDRZPC2JGoPG/D6n
	0Ei5dPs0ZIOgDreS6UkEachU4uPesPlsvGrh75G82lOVk9zSC6zjtOI63gIcCHiZUg6IjpqusFB
	nFAH7pCafAnUm26u8fLA4mBIvKHKIm1ZnJzdzz1N9RVOVKrFKkwAtsIgVeyGHEZpQNzhkbXkAeR
	cioS3MGqM6Z+XL1VFmbBl6QJsij6Xwdyl504TI93HmICJ2TlS6Mb2t+jpKg==
X-Received: by 2002:a05:693c:42c6:b0:30c:1b70:896d with SMTP id 5a478bee46e88-30c1b70d9cdmr5364493eec.31.1782132570493;
        Mon, 22 Jun 2026 05:49:30 -0700 (PDT)
X-Received: by 2002:a05:693c:42c6:b0:30c:1b70:896d with SMTP id 5a478bee46e88-30c1b70d9cdmr5364453eec.31.1782132569728;
        Mon, 22 Jun 2026 05:49:29 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1f0a9sm10322450eec.2.2026.06.22.05.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 05:49:29 -0700 (PDT)
Date: Mon, 22 Jun 2026 05:49:27 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF
 regulator support
Message-ID: <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
 <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyNyBTYWx0ZWRfX4sX4NC/ulcgh
 8oo822NR/VLJWPJ5xwFRpSZ8El317SXp3rSgnn8sf3uUXuJlfNwb+IWpYR8UdqrGZW03uHy3osk
 dHtbqH0+EGNJgpuGz/+B4g9Csky8ikw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyNyBTYWx0ZWRfX8PdaoIcAYvbx
 P3yItz35QHru+l9KCLcPguJmezPR2+2KjzSBL89n/9pi5tQyC+phJkqVwlav3VOw/Vf9MMsuhbn
 WEHSUAKZg6GsCk+LXIO6tk9x0rWzZdSuVfKY2sH4yuC6gI6DVVDMPP8sY0IDwaUy3AP+TYubgTy
 cUJuyjzGI4+jFWSFQbgGiwmxVhdvQA5qpA/sxS3hEcYbB8/YKN24LiWt1fB0tPrOMKR2MzbStQP
 5pr6zCRfL27hI5R7Grw/i9VxLuLK+T0oHBO0d8nrFpHVT+1QbKHlpe2oMWCHxOuIq4aRMbDYlm1
 +QqkBF2/yFLT166Cw0TfcFTbXFTWmcLMupsb54m5FO1HbarAProxc35BwqKPPoLJEZd2DYIhS71
 SAjZG77a/i9BPr+dUZvggY5gzFO3WmgsuiHI7boMv7YIjrxRyjX/3WJ8FQYhfipfWWtLE/o2i2k
 VdSR1c0/Xte1Qt53+5w==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a392f5b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=a186fHh2H6T-cRz7arYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: amDk8qzZmOnzKdH49z6grHSBN7qv1vpB
X-Proofpoint-ORIG-GUID: amDk8qzZmOnzKdH49z6grHSBN7qv1vpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113991-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B35726AF8E6

On Mon, Jun 22, 2026 at 01:35:45PM +0200, Konrad Dybcio wrote:
> On 6/22/26 7:11 AM, Qiang Yu wrote:
> > Mahua is based on Glymur but uses a different QREF topology, requiring
> > distinct regulator lists and clock descriptors for its PCIe clock
> > references.
> > 
> > Add mahua-specific regulator arrays and clk descriptor table, and use
> > match_data to select the correct descriptor table per compatible string at
> > probe time.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static const struct qcom_clk_ref_desc tcsr_cc_mahua_clk_descs[] = {
> > +	[TCSR_EDP_CLKREF_EN] = {
> > +		.name = "tcsr_edp_clkref_en",
> > +		.offset = 0x60,
> 
> EDP goes through CXO1->TX->RPT0->RX0
> 
> > +	},
> > +	[TCSR_PCIE_2_CLKREF_EN] = {
> > +		.name = "tcsr_pcie_2_clkref_en",
> > +		.offset = 0x4c,
> > +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> 
> this is apparently for PCIE4 (the name you used unfortunately actually
> matches the register in TCSR..)
> 
> (ok)
> 
> > +	},
> > +	[TCSR_PCIE_3_CLKREF_EN] = {
> > +		.name = "tcsr_pcie_3_clkref_en",
> > +		.offset = 0x54,
> > +		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
> 
> This is PCIe3 (actually)
> 
> CXO1->TX->RPT0->RPT1->RPT2->RX2 (ok)
> 
> > +	},
> > +	[TCSR_PCIE_4_CLKREF_EN] = {
> > +		.name = "tcsr_pcie_4_clkref_en",
> > +		.offset = 0x58,
> > +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> 
> This is PCIe6
> 
> CXO1->TX->RPT0->RPT1->RX1 (ok)
> 
> > +	},
> > +	[TCSR_USB2_1_CLKREF_EN] = {
> > +		.name = "tcsr_usb2_1_clkref_en",
> > +		.offset = 0x6c,
> > +	},
> 
> (usb_hs phy)
> CXO1->TX->RPT3->RPT4->RPT5->RX3
> 
> > +	[TCSR_USB2_2_CLKREF_EN] = {
> > +		.name = "tcsr_usb2_2_clkref_en",
> > +		.offset = 0x70,
> > +	},
> 
> (mp0 hsphy)
> CXO1->TX->RPT3->RPT4->RPT5->RX3
> 
> > +	[TCSR_USB2_3_CLKREF_EN] = {
> > +		.name = "tcsr_usb2_3_clkref_en",
> > +		.offset = 0x74,
> > +	},
> 
> (mp1 hsphy)
> CXO1->TX->RPT3->RPT4->RPT5->RX3
> 
> 
> > +	[TCSR_USB2_4_CLKREF_EN] = {
> > +		.name = "tcsr_usb2_4_clkref_en",
> > +		.offset = 0x88,
> > +	},
> 
> same as eDP
> 
> > +	[TCSR_USB3_0_CLKREF_EN] = {
> > +		.name = "tcsr_usb3_0_clkref_en",
> > +		.offset = 0x64,
> > +	},
> 
> (mp0 uniphy)
> same as TCSR_USB2_3_CLKREF_EN
> 
> > +	[TCSR_USB3_1_CLKREF_EN] = {
> > +		.name = "tcsr_usb3_1_clkref_en",
> > +		.offset = 0x68,
> > +	},
> 
> (mp1 uniphy)
> same as TCSR_USB2_3_CLKREF_EN
> 
> > +	[TCSR_USB4_1_CLKREF_EN] = {
> > +		.name = "tcsr_usb4_1_clkref_en",
> > +		.offset = 0x44,
> > +	},
> 
> ok
> (although there is a comment suggesting this may be NC..)

I checked ipcatlog, TCSR_USB4_1_CLKREF_EN is not in used. I suspect this
USB PHY uses CXO as refclk. If so, we need to remove this entry. 

> 
> > +	[TCSR_USB4_2_CLKREF_EN] = {
> > +		.name = "tcsr_usb4_2_clkref_en",
> > +		.offset = 0x5c,
> > +	},
> 
> CXO1->TX->RPT0->RPT1->RX1
> 
> 
> You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
> which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2

I have removed PCIe_1_CLKREF_EN in dts node because PCIe5 PHY doesn't
require QREF. So I didn't provide its structure here.

> 
> [...]
> 
> >  static int tcsr_cc_glymur_probe(struct platform_device *pdev)
> >  {
> > +	const struct tcsrcc_glymur_data *data = device_get_match_data(&pdev->dev);
> 
> Please null-check this
>
Okay. Will also add the regulator list for other instance as you suggested

- Qiang Yu

