Return-Path: <linux-arm-msm+bounces-114587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7ZDJN8L3PWoI9ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:53:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A10F36C9F77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:53:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lUWiWmDA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jO+wthng;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114587-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114587-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AD923051FF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 03:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB1C3A1A29;
	Fri, 26 Jun 2026 03:53:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E392238AC7B
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 03:53:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782446017; cv=none; b=stVcITw3veWbSFiXH/Jn2YZvbbeGg3heg7HON8PPvMT4QdWJ0euz1QHehtSyMfV3wBxrN6OD5OxFBrcFm5TVEQED0/FvYLwl+JssLmWoYdYsTvtBWu976RkYEMzUtYSULh5WIzs/zNGvj8nJ2hEH1Da2VGwv5fMYEcmxtydfXxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782446017; c=relaxed/simple;
	bh=CtUrWQjJwDKAm5zH8OeftD7O5o96WykL4x21dqOeChg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iimNre47hx95AEMopmigWhhBGojhIT1ywC3P7mFsKjQquMlntpyeFzt7BI+vD0RFAhpi3eKw8JXT5Jn7mRn/sdjkI1ltllFGV//u2xdCz8Eq0oJ93ciuBeb1SjAXW1a+XJFj49JvUIbwUqPc4AZJtKDS/OEi8e16SX+XVhfXJC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUWiWmDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jO+wthng; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2ifqH003349
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 03:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgRFN3X+rWMxLV7t9njatT5+WHhcPqBn+C/O3EaWSAs=; b=lUWiWmDAEIch/rnG
	giawvv5I5QrfmssYErDnGQFsA7dfNgUlu6zoTRbIp96iauiZvi+6cmuBl4I8z/ux
	wvjTdoLvkpV0ILrjms5twf99a2CAu5pXBRCOcovMQFqujufwilCf599v/MXZRRTS
	0JGrRxL5KeKTzhOhiWTiL5E/7fsDDgs3CnktF0JN4uJX+8gC8usD+4MV/5INgxr7
	h7/BLuUWkvwgE84d9Vt8fkA3ppXpMnQA9zUmx2Pio3oDpK7LlINBZaN/K1G+cXXS
	mzVFKGi2ovCnBpiQkLOp8zxHOHgm4Nq1JIjq5MConjGOCWBgR3KJi710tUkwB1Ry
	PK5YeA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fct8g39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 03:53:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ca1f74cacso31733eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 20:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782446014; x=1783050814; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dgRFN3X+rWMxLV7t9njatT5+WHhcPqBn+C/O3EaWSAs=;
        b=jO+wthngWnXTPiCPw+yaKOh2xZ9hfwxhInzUhet22E0Zth9vi/aCt2hP5TNX3PGfJU
         Xb5JVDN+CitWjhQlO4fB5RK3NRFx3tHXW2KqyoVPT61XaF2WUrX/cL8I29R9MxR3lBGf
         FH7kJAmZwL61O6G6kvGduaRXhkiGesbalLNEKLcJm+6oXDRZ0tQSY8arTliobq9bXc4T
         gisKFhUItWboc6M7hWzMH6AAvinP59a8zT2RhLCgcKdbd6e6otwCtNEFphvwVVy0IMO3
         sWeSmwLy4WnXP9Df7qTpRnTCsM3R34i4XaClVzYjzbF77CJKrlaREXGdw/4iHNsN2Hmb
         8UVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782446014; x=1783050814;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dgRFN3X+rWMxLV7t9njatT5+WHhcPqBn+C/O3EaWSAs=;
        b=M37GAa9jzO9/vRIQTpQ1dn6aZDDxWMQkyJRBEfgTPiRecWWwKFLPRL7s82DiL7SuBL
         mqxarMbuIDmEf+oXNPHouuSzxB+N3NLL/4TpvnJkZG/uab1wnjfZXzb6m2ke/g00KpZE
         5hqUGbOBh5teS2ZP3oiOY+z2xhwDxwrGX9WFsWtuLVRdK9soOk8yY7gPhxW2gvKwdiyJ
         /f0ZCZiFS5Z5vX0DAmk2S2LBVG3bKaArJj4iKP0J+1DbBaiJVpqnaLLhbOM+sk/FuUDm
         BUWIUREg0r6VDxQZ3c7c8OsG6gtS8TRlOXEWLP18eR+51sHFR0qQrImZh17nTHtKBilZ
         XhcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpb7JywXFmIKEbzHrm6rLqqzChLyvavw5g+XezCeZqEj0rDv4FDKd52B+L0kKN6bQ7nG6pohMTu2TMTYt+o@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9nWtyrVwqMEOlBmgVqciT0/xr5N2MM5URkfAhVfB865FWG58Y
	KTGuPd8HAS73IkFIEHm5bYqrdS+aXAECllf7PIqbYsW+3E9YThRhkb7HjUJP69F7a8+NqAje/9P
	k33rBnQuMXQmbHJen/UkmcTFnTMEzg2VAeRjbPavJRYYrjGQkjiNIYbnyC0wDigDedlXs
X-Gm-Gg: AfdE7cmNaT5i2do1VcSGYFHkDbjpDMnHcG+mLjc16n/f8yMYEtUFLvqS7qEQOeNHeHj
	SLaqKCeO/O2C0z8Qusbhw0Q4RCnFuTzqsD128TcMaLbi/0I6Oidwj7l9ol7jJUkhtk5+Dry8r4K
	w69mFwJpIrCDh8M8zY3WDZS2rWZnIy0SDOuMJMMHr+s4WEza8nADjw90uTdXr3qDhGSK8Ghwjpz
	dZF+frXMaRZ7srzrYXDG9vRUqKGSmr3S795PtvcErOEyIvrOQ/Tnc9zC3bDx1gcZEvf9t78mviB
	3IjOetRtiZ1GDdY7wj79tX7EIlTdw8DA6/7mE1PbPVqE6OfPcriPVJTEZPIi6r4TI/+4vEoH0Cy
	3jXCpIMvtQtASL3hDbcB0yxd8Q2f64w+/Q9YtSxG3tTdN6ay9pgvokwTF0A==
X-Received: by 2002:a05:7301:a84:b0:30c:52c5:6e5b with SMTP id 5a478bee46e88-30c84dd56f3mr4635432eec.29.1782446013641;
        Thu, 25 Jun 2026 20:53:33 -0700 (PDT)
X-Received: by 2002:a05:7301:a84:b0:30c:52c5:6e5b with SMTP id 5a478bee46e88-30c84dd56f3mr4635412eec.29.1782446013099;
        Thu, 25 Jun 2026 20:53:33 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm12919939eec.5.2026.06.25.20.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 20:53:32 -0700 (PDT)
Date: Thu, 25 Jun 2026 20:53:30 -0700
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
Message-ID: <aj33ujz1m9qYOcRs@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
 <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
 <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
 <cd7619b6-a428-4ad3-9926-52b846953634@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd7619b6-a428-4ad3-9926-52b846953634@oss.qualcomm.com>
X-Proofpoint-GUID: -Zt51q34Bz_Eq5i1jpSy7TtmrnRr7uL4
X-Proofpoint-ORIG-GUID: -Zt51q34Bz_Eq5i1jpSy7TtmrnRr7uL4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAyNyBTYWx0ZWRfXzpVBTmxNLIjh
 9rezcrCFsPj233OywaeIweLdvys4ash6mSOPOW0f0iGTpYbk0BZg2A3KY2YRgLVrW/1FEzFdUeR
 jnlY+7yrttj5V6fBg1BtHRmVJ3rVn/jxjk5rXLmomYBiDS+0AFGKW09IZNP1465NhS2LfyKWFA0
 MwwJr6FWjh+JPKcST+gyg7/TPiMjSrEUqut8DjD3S02C4ZiUEfM7Hn07RSwHaLQUsMuYQ12RulJ
 PRL51ZrYBdQ/G3SmQb0lgQxRGCNG8PBiUod1L9lGWgspbDsnXLC+s8DJUipspr1nZ3sdAvXacaH
 p4llk3qq+EvaVB0ztz1fwUAWeFEgsP4hQin4mRL1v34Rym13jH7cNmwZ4wVXmsLPuhdchA6PNjH
 Tjg1OP+fGPfR6d9qQvEASmnukcK5LdFsgz1DYXGF8iVdAoiFhBbAoQIYSvKS7kEcAXOn7208xVg
 Cd+aEvZpmNttxPUOpxA==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3df7be cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YMTeiiCDW-xPtgyhEV8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAyNyBTYWx0ZWRfXxmqzVzur/4rd
 7uhfslLu6mKDRPv/liWvJMp0QpKbQCSkPeJTGsYx+mQG8b0th6SDZt8WNZJ3seUvHdK/Uua1AB/
 57XcexbpQ3jCh1hZrtDdHpQzVTJF/5o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260027
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114587-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A10F36C9F77

On Mon, Jun 22, 2026 at 03:03:39PM +0200, Konrad Dybcio wrote:
> On 6/22/26 2:49 PM, Qiang Yu wrote:
> > On Mon, Jun 22, 2026 at 01:35:45PM +0200, Konrad Dybcio wrote:
> >> On 6/22/26 7:11 AM, Qiang Yu wrote:
> >>> Mahua is based on Glymur but uses a different QREF topology, requiring
> >>> distinct regulator lists and clock descriptors for its PCIe clock
> >>> references.
> >>>
> >>> Add mahua-specific regulator arrays and clk descriptor table, and use
> >>> match_data to select the correct descriptor table per compatible string at
> >>> probe time.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>> ---
> 
> [...]
> 
> >> You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
> >> which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2
> > 
> > I have removed PCIe_1_CLKREF_EN in dts node because PCIe5 PHY doesn't
> > require QREF. So I didn't provide its structure here.
> 
> I don't quite get what you mean. I see that it is there in the graph

I double-checked with the HW team — QREF is not required for CXO0. In TCSR
HPG, I think the QREF components you are seeing are in an old version
diagram, but it says the QREF for CXO0 will be removed. In the updated
diagram, PCIe5, USB2_0, USB2_1, USB4_0 and USB4_1 PHYs get refclk directly
from CXO0.

In theory, we don't need to vote clkref_en and QREF LDOs for these PHY
instances, and I got confirmation from the PCIe HW team for PCIe5 PHY.

I also compared the description of the TCSR_CLKREF_EN register between
glymur and mahua on ipcatlog. Unfortunately, only
TCSR_USB4_1_CLKREF_EN_USB4_ENABLE is marked as "not in use". I believe
this is because these registers are not documented well in ipcatlog.

So I think part of the regulator lists you commented for USB instances is
not required, and their dts node also can to be changed to use CXO as
refclk instead of TCSR_CLKREF_EN. But the mapping between the USB instance
names in the QREF diagram and the TCSR_CLKREF_EN registers is not clear —
I cannot find TCSR_USB4_0_CLKREF_EN_USB4_ENABLE, but there is a USB4_0 PHY
in the diagram. Can we leave the USB regulator list as NULL or we just
add them as it is harmless?

- Qaing Yu


