Return-Path: <linux-arm-msm+bounces-115109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gt/pDo96QmrE8AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:00:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEF26DBABF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:00:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n4a2HQrN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=akAyRDSR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115109-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115109-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96F8732B0586
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EFB202F70;
	Mon, 29 Jun 2026 13:32:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FD421ABB1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:32:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739939; cv=none; b=C4ExJTMCouVyAKYGvW5XOLA4JTf4F3V5tc9ktD0CawKyWX0sUfp56l6IAmNvuDctKLSJcU5uqIWZqYF7GTuLTDYNaH9qx5G6FXOv6WKUAjtRlXIJgNlUWlDkc+fl6LCqYckdqVXNxKnkArQ1jJYj3iITDszY74C/JbYtTbssM/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739939; c=relaxed/simple;
	bh=b74JLjLDWqk4nSsYRgZYJTbHpFo81IIWs/OAbVQDBIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Csg9PetWDchGNSGI2cAbmtgwFGiid4cCEkyLX3hWw7aPRC3kRd9g6g9uKk/muF7AtHz5NI+1qZeeotbXXgaUjTG1OPXn3Atn55joCzo4UaB5+PEQqUHokOkKf8raFcCjjOZK1sKT9GzUcbWgJbQgyqZ8CLibqPUkYoMxusDRqbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4a2HQrN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akAyRDSR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT2SH2618764
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	udHIJPFN9+CZa2H7116UwQG6qq+UOMnDM0cL9UQL+IA=; b=n4a2HQrNBuc61hNa
	AW87dSWHcEbWWQsMytCixz3TLI4CBPM9sdXPcoIYpjwXUsiPwhpLhg6fMfGieGJD
	x/0vmEMSeO25SC85frhhE41QNmIo4jVzFgOx0gmjl1K6R112DAMU4nhkdVDJMnxj
	X6oti9mhuMZCo7QgKytjtc1skWIpSrr44/DODPX4ucPxqL9orhvjYoRHmP+uITQo
	00J/nk6LyL+KvFUmpB1PePufkMi4KKNBg53C9TrnikIWzIlRVOqLZ74WDDXrnVes
	+cTW4OoEaLOy5OJfPnEhnLfYUPpNRvr6Fi/tTHOBuWOLINGqfo4Nj9mSdzC879iq
	+TLy1g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkrtj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:32:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ca81e05bfso3289833eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739935; x=1783344735; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=udHIJPFN9+CZa2H7116UwQG6qq+UOMnDM0cL9UQL+IA=;
        b=akAyRDSRCKA8ppnXpfRqpRZKLZ7Ge2V8eDa7qa0U6Vk3Kx8s5jYXkllEvy5BuqnvjC
         XiLJghCDjmF2m9M89grKcxY9L27isQil13rBOfFnH286ktolG/2jX4TFlFiQtiL+nF/C
         gaqqmHURdCIevlP9B+9vcF8Lq6+/n0oc44En/crUphqNKfMt2lmgdphRiaUCDwY8plil
         UqAfQlNpJ1MhyFTS8DS17IV+D8Q2DrLK0WzJBjoar2CnH/Clm/n5741HiwyROXFd9M/3
         D77JdC+uMKgYjhoUPyBty8EdXFcSFZm4LZhknAAFdEWI9zfFjpdSVL9qep58GRetFxEa
         vIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739935; x=1783344735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=udHIJPFN9+CZa2H7116UwQG6qq+UOMnDM0cL9UQL+IA=;
        b=Cu6KSx/fSoaRIqiZDlJS+iEncXoNswfkgQDdadZ1F2ivPm4yNJUjmZcpj6sBo/tcWZ
         iPZJYLTVXrMRZz7COoXf8dlL5zDHQbFIZtsZuOT6AAZjLnZcQARHWwdUbTnevY36hfs/
         BkyB/JndcVKzBiuf5etq82ouY1P5HAT6QhKEAWt0dTDgPuxpfkQuPUUbbBDN6CZ22iHQ
         Z0mMi/H7ftmtaCfIlgO+GWxdCHfQZnVMw9GOt0Jq1lDXNlBHbKTbj1OXplSt6Cau3yLH
         GHA4VCJacnYhsmghCAuG+SA13DCBI9XJ6G3wbEmFNSYtXnZW36g4JEzLh7nw1wy1tAmY
         N6WA==
X-Forwarded-Encrypted: i=1; AHgh+RrMu3d547zAE7LRfNbm71uxQ9Ccp/RyqLBpgEaW4r5IHWUbGz1CZbUZ5AgYrFp6sv6USwSaP0KFwjIUVycf@vger.kernel.org
X-Gm-Message-State: AOJu0YyLodivnV1MRJP8gGbGZMdZMnNeIFl2WzjhcRNZc1j9oCUqKuRg
	r67qNaPUfBSxVA/uPHALJFnULGzt6dh5VvqUb2TQU51OaJQfzBL7YJJQwC7H1m3GV4T+Ag5flrt
	xBvgZnIrxqoIQbPaJwOxMEQ+GzLGuavgYYeQyILIsBB6drbSuM+Eqj8uOUn/W9cCbBytx
X-Gm-Gg: AfdE7cmtb42sJn2/KDOj45wOeOpyMTsCk6ikSVuO84A9qN1fZAx/NXq4VGcgsKjkG+k
	pWhwrvY+j3mxVeTcWUjY4mX3zGV2+CvBel45hfHT9ASA4ZeA6dyfdLnF7DBPBlUoNIf8wAzPLJB
	9iSCQfIDZ7ju7zPzKkghpVe6Nzjk2INRblmgNf7qdm37fDOiC7nRSOULS3re1TtGxJYWQiYIDtF
	kx00+wYllUJXVZWBvjtAW++LTWheKgUC22HVLFEjt0mlSlZmnpK34m1WUEZhGP84WWgLGk6kKs2
	+IPBLr2YdgtsdIH+MeO3dMqPN0M5Pgx9DKbKi556nkZcSb+8HjMLzw0u6dEpGLPRWYIEuDZk0Tt
	4KKfMqpl9R0MQbwdNzKcZ/ovRcNmqQeg0KCB2dyIjSEVjs6kFqZRSIe1SIQ==
X-Received: by 2002:a05:693c:880b:10b0:30c:b0a8:c9b7 with SMTP id 5a478bee46e88-30cb0a8cb0bmr5980123eec.41.1782739935021;
        Mon, 29 Jun 2026 06:32:15 -0700 (PDT)
X-Received: by 2002:a05:693c:880b:10b0:30c:b0a8:c9b7 with SMTP id 5a478bee46e88-30cb0a8cb0bmr5980101eec.41.1782739934422;
        Mon, 29 Jun 2026 06:32:14 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm60819417eec.7.2026.06.29.06.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:32:13 -0700 (PDT)
Date: Mon, 29 Jun 2026 06:32:11 -0700
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
Message-ID: <akJz2xNeuzIiE3Vc@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
 <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
 <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
 <cd7619b6-a428-4ad3-9926-52b846953634@oss.qualcomm.com>
 <aj33ujz1m9qYOcRs@hu-qianyu-lv.qualcomm.com>
 <c6df90d1-bb3f-426f-806b-9f31840126b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6df90d1-bb3f-426f-806b-9f31840126b5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a4273e0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Qo-gMjb1dFaPh1ck9-gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: _4IbOR22VlFk3m2OePDIbuLPxZUK9XOz
X-Proofpoint-ORIG-GUID: _4IbOR22VlFk3m2OePDIbuLPxZUK9XOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExMiBTYWx0ZWRfX8TuU5Rar9L7n
 iSlLhoc591PuNGFwJ8K9aEyF8OqYoNtzYHUjYVZfvboeHPJrmZjz6lTN2KeXQCLzAt9YSmHGMkc
 FGmyN0qw/wqsUzJ3NzMlds9hDbem6G6T6Pei2GKCPgb3tQIbCUcPB51vQSwagGAyJIqqofwGzaT
 Yp6lrSgePnxzIIA7a6vMa9TNk6QFIdXtI67g8WnHgzaUcblzPFzMpIHxfW+voMrgDRlKU4S1Bdm
 1Sy/esxCkVvlU70K86Gv/1swwQqYx7zpUoOCTBZsHRHClJqKTcD4MrQepW3Q9lQYkr5oJIMwJQc
 qVBSPnz6yt996Gj6ZEBXRjQ7S/9mZsA1lDbhJkYob8N0f+VH90wTBjhc6CCgEce6sA2eWNz9hPd
 Angm3XWiPTlPVrrKfIZjBuzvPqxDJBIhVOBl8iKxhPH0jJoIzrbB78v1ICFfHe5leVx9X0OXBuf
 C+FUpiwugB/zLm1CaQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExMiBTYWx0ZWRfX62hwsfezedgc
 mSPNKfCa5jTmJJA9ZbB2kc+Buc70RctX4odSRxA+VdEUDpsQmXwOl4UojdFeOb+LprwWYxvMc3S
 rCWB7Epvg2LjkljaV6PICo9ityL5+Xw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115109-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,hu-qianyu-lv.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DEF26DBABF

On Mon, Jun 29, 2026 at 12:30:37PM +0200, Konrad Dybcio wrote:
> On 6/26/26 5:53 AM, Qiang Yu wrote:
> > On Mon, Jun 22, 2026 at 03:03:39PM +0200, Konrad Dybcio wrote:
> >> On 6/22/26 2:49 PM, Qiang Yu wrote:
> >>> On Mon, Jun 22, 2026 at 01:35:45PM +0200, Konrad Dybcio wrote:
> >>>> On 6/22/26 7:11 AM, Qiang Yu wrote:
> >>>>> Mahua is based on Glymur but uses a different QREF topology, requiring
> >>>>> distinct regulator lists and clock descriptors for its PCIe clock
> >>>>> references.
> >>>>>
> >>>>> Add mahua-specific regulator arrays and clk descriptor table, and use
> >>>>> match_data to select the correct descriptor table per compatible string at
> >>>>> probe time.
> >>>>>
> >>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>>> ---
> >>
> >> [...]
> >>
> >>>> You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
> >>>> which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2
> >>>
> >>> I have removed PCIe_1_CLKREF_EN in dts node because PCIe5 PHY doesn't
> >>> require QREF. So I didn't provide its structure here.
> >>
> >> I don't quite get what you mean. I see that it is there in the graph
> > 
> > I double-checked with the HW team — QREF is not required for CXO0. In TCSR
> > HPG, I think the QREF components you are seeing are in an old version
> > diagram, but it says the QREF for CXO0 will be removed. In the updated
> > diagram, PCIe5, USB2_0, USB2_1, USB4_0 and USB4_1 PHYs get refclk directly
> > from CXO0.
> > 
> > In theory, we don't need to vote clkref_en and QREF LDOs for these PHY
> > instances, and I got confirmation from the PCIe HW team for PCIe5 PHY.
> > 
> > I also compared the description of the TCSR_CLKREF_EN register between
> > glymur and mahua on ipcatlog. Unfortunately, only
> > TCSR_USB4_1_CLKREF_EN_USB4_ENABLE is marked as "not in use". I believe
> > this is because these registers are not documented well in ipcatlog.
> > 
> > So I think part of the regulator lists you commented for USB instances is
> > not required, and their dts node also can to be changed to use CXO as
> > refclk instead of TCSR_CLKREF_EN. But the mapping between the USB instance
> > names in the QREF diagram and the TCSR_CLKREF_EN registers is not clear —
> > I cannot find TCSR_USB4_0_CLKREF_EN_USB4_ENABLE, but there is a USB4_0 PHY
> > in the diagram. Can we leave the USB regulator list as NULL or we just
> > add them as it is harmless?
> 
> I believe the internal discussions we had indeed point to the TX/RPT
> elements having been removed somewhere in the chip dev process, so
> the regulators can go, in my understanding.
> 
> As for the refclk toggles themselves, my understanding is that they are
> still meaningful. Although, we should be able to just smoketest that - set
> all of these registers to 0 and see if the related IPs still work normally
>

As internal discussion, the TCSR_USBn_CLKREF_EN to digram instance mapping
is:

TCSR_USB2_1_CLKREF_EN -> usb2_hs
TCSR_USB2_2_CLKREF_EN -> usb2_hs3
TCSR_USB2_3_CLKREF_EN -> usb2_hs6
TCSR_USB2_4_CLKREF_EN -> usb2_2
TCSR_USB3_0_CLKREF_EN -> usb3_ss3
TCSR_USB3_1_CLKREF_EN -> usb3_ss4
TCSR_USB4_1_CLKREF_EN -> usb4_1
TCSR_USB4_2_CLKREF_EN -> usb4_2

I will remove regulator list for TCSR_USB2_1_CLKREF_EN and
TCSR_USB4_1_CLKREF_EN. For the registers, we can leave them in the clk
array, the driver can still vote CXO as parent of tcsr_clkref_en and the
register setting in enable/disable is just a no-op if they are really not
required.

- Qiang Yu

