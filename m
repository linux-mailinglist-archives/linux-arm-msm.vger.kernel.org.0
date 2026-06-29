Return-Path: <linux-arm-msm+bounces-114969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n4+fBfFFQmrP3QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:16:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C30926D8C70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:16:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nsbxWSzk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iYN42hPw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114969-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114969-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A91E7301178A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765C63C13E9;
	Mon, 29 Jun 2026 10:11:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0624374A02
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:11:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727887; cv=none; b=icDD9FWvnwummL7Ht0llA4h8vvXgtunnBGrGXLF1Wdv5+9+FBGE4m5OrHmj96RxUNZ6lu6H67iYsEz8EFWfEK2JSM6JUaH1eNXyiv6l8G0Ed5PeBMnhIHFSvUzr3HYFMKR2+w9xtn9CFaO91szCAyjAc/De8+HH9iC3e91I8X8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727887; c=relaxed/simple;
	bh=KYymsWgZvfsa2Vf73oVvMIKmJDi/+uDmv+OT8hnk7hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZeru/L3JMoeAYwyYqGlIdRaVPgh9lyfg/TZlkrUkYg0ou2wBYY1WJ+ZWCGOGskrB2v+RGho/QO/BL34Hszfk3N/bN9Kcg0uNxHlOG1VQkat+DLGfk/3i1LGW46mkBSEimqCx+8btMXf5P3POYGIwBOOQbdTwKN3IDssj0AGIBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nsbxWSzk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYN42hPw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sNdG2143207
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wlXJMssS9Ms0Gy8FZlFlkBj6U2eJhiWyPzITidulEQY=; b=nsbxWSzkWFVVwFOV
	3gs12zCZbydLBjJ2r+sbn7rO3cZF6yxBa4OwuwGj6pcZNodG3C7M2g41UnJlw+Zv
	vWQM0Kll7R0FtpiqllsdCEuGjqk+xLxJWJyfIz+HuRALmrzyFv7l6jRA/Lv4cHYd
	fjR3PrZ/fKAGVvOYpR4lFqgMUWIBifrDmF4pTzt4pqvWCaf+plRBTr+UGQlTQ6Om
	gnkcvqdNFeCPv00iz2FgQ9W2T/wWpu7NMLVhKEbxHm3GteE6n3Oeh8cZ6LSdpW/0
	kSGDgEdwNStdcRcwOjEFuc+VEWVUmtlv7sztbmtsIk6hwNdSpjg64t826l52gc1D
	1Pyn4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8nyqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:11:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92a9777b04dso88924985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727883; x=1783332683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlXJMssS9Ms0Gy8FZlFlkBj6U2eJhiWyPzITidulEQY=;
        b=iYN42hPwTxu2XMNnwiUbNtBO6gi8CLZQaPRD+qnimCAc3Xo0t9TOy1PD/QUGn42mVx
         kaDkGxG1C/vjHaqMIcuyv8/TVXUrCZhGWLdrF6a/bqxBE0ylG6gVhQDRjFODIHFrnai1
         TSBHOQsiZHFeDqm26IHmtKk/L0TgKWRiDwhJTZeiiFHeM7mqhDd23pknZ3+dHN1v5pU6
         k9Sd/8UNQCWsaw5AC0uGTw1xSEPZgd0uxRBMN8QJwvUMjN61Ex6VRDkH/IUs3o7552U3
         XpRSIcYEe1pFTGHq0a4PvkmLOEvb52UAGru2ONHFsQ4jpyN1wVAeD0o2kvFrDoJKGA1b
         2bWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727883; x=1783332683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wlXJMssS9Ms0Gy8FZlFlkBj6U2eJhiWyPzITidulEQY=;
        b=QQwwRfL1YLCJ2pQ8aHMOFmjAI8Ji0ExqsKIDxbS2SmjQcTpVXwJwLhfrhUAPwHtoJz
         EyHnwNiwsUg4SzHv4OSGL12bo/9N6TKTl9T1jjkN6hRhVKBQ561GN0g4sBkBApnH7dY8
         jiJpFSWmlSd/h1fKMlAnff+ldkaJHCUfTyBa16SLsi+EhX6DqftyYxe20ks0aYKEzUhB
         ffV2rGA414T5R1eVGXS0/Gk97+Pl2M7PAU6/ABsePxQmO3LyJqH7Ewly6jP3c6ZMGFCf
         k/Vym3VU5a0Cbx6bij/23SnCmu4hqQw2IR41Trb9+kVzBxTw602beS54HDueyk5mggPc
         msEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+l+ItvgdhTkI/tm2slr5csX3shJ+eFFH0/eSO4FMS3MtLPlNF3yyquFkiCbcGm+wjpdrb45Q9vzvZjX49F@vger.kernel.org
X-Gm-Message-State: AOJu0YwRpfJeEc3/a9h/RyfSHNrrmUnA8cLpFf91IKY2WN/ZfeE1Q+Df
	h6Nt/WyllLXMIamW4PKjg2jbkc/Y5kpRAKv7qAmjdGe77Sf+rAmk7wyuLUd3dVYopm+9WVRfwoe
	4Qwv74zGF43U3kywM8gvTqSjSYbkqUWg90hdhPEQCn7bkkZLUrnUUH6PiH8opzKPQLJKd
X-Gm-Gg: AfdE7clvg+x9EqsNH8lvwZo7qD3oJlj0fHV9qWm92VGoTbCUPDPU6T3q5h1uTKNNJ/9
	DpYj2Mjg3LSVRqMdruecIdbu+HjweQkJpdI59F8fVIXZYiacH6RrW4vmUc8L4lBKe/Uu6L1v1sm
	28lOwc32+eTyaOSes6X4bTseJl7qp4RUuhaAR2Fp2AJtard+EyzsIqXqPGMzUqgFUdZ8mugJb6m
	970Ji9rEGLA1oqZdnay/MOvR9AmNynnnPn3Nsnf7LEVfBPhvw1rrw/bL++9lZNKEabmeeEnbW6p
	HpCgNytpjfSmN4lx8N+Rl8ICHph+W9LhVC3FLH6tLTeyTG9zo5Y/TSOqN888wCwzkVA+TakFlsx
	SlcBt4qZ6yVgLOULr/v/d/y3yTYMoUItKH3U=
X-Received: by 2002:ac8:57d3:0:b0:51b:f9e7:7fac with SMTP id d75a77b69052e-51bf9e78346mr27350231cf.5.1782727883112;
        Mon, 29 Jun 2026 03:11:23 -0700 (PDT)
X-Received: by 2002:ac8:57d3:0:b0:51b:f9e7:7fac with SMTP id d75a77b69052e-51bf9e78346mr27349831cf.5.1782727882440;
        Mon, 29 Jun 2026 03:11:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12660ae60esm151121566b.17.2026.06.29.03.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:11:21 -0700 (PDT)
Message-ID: <fea9665f-d134-4b11-a936-e1f265858ce1@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:11:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] driver: core: introduce dev_add_sync_state()
To: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Xuyang Dong <dongxuyang@eswincomputing.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
 <20260626-clk-sync-state-v1-1-4156d8196dc8@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-clk-sync-state-v1-1-4156d8196dc8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfX0AlRVB1fcTKK
 q2CQzBE/cYg+03riyiSoK/blAqBpPWjRIBQBaYNtKc6al4AFnQEtUJo+Q+U1ODjy5SnH4it/lg4
 PTW5pXs9tWcWUbbyEd6AwbjMtMS2JIA=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a4244cb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=QSepnEzQFVSc_k0dkj0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: y3rEanNqMkWNAlVl6Bn13IZqyP24-j7Z
X-Proofpoint-ORIG-GUID: y3rEanNqMkWNAlVl6Bn13IZqyP24-j7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfXwwmze0rteVR5
 Lgf3eEUxXB4GtjbdxTR4r+W54lxZulX2XpP1hbW1GGRJ6Sd/UO29Q57DZaoZfvvAao+Mwq7QDqq
 bbGhLgg/swlHiqNUzbxlMhVbTXidUdnGG/044sHpkw9dNRS7vLMFP7onnDsiVvIb/TOI45aHoaT
 z/W8DfaGfUq68G7dS2yZcBdX9UBZFWBW7Fvbpwdt+sMQ420mg09pLl1w4dYPqyc8TmJM5PwMjNl
 mBEXLBJE3iUrFZc+hH6uh6R37QJxAi+ADU6v2hvGWP7PIIBwt5xo43I4veJEt96bOGTCvNGxHBX
 Yfh+qJN8O7uNV6fXJXBXqAz8t8URUxveGXDkP6ADutpHt/hytIWocS8Xl/vL87XTmM8/TcRvX90
 THEuMjP+clqrDVZFyKu/M0W8G2GGM8QT9yCEgSQUa+QkX5SAoLNRqnb8+vfwJvtlqZJkIRrG6O9
 9aeDjWW0QmzGmRX9eiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114969-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ulfh@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:neil.armstrong@linaro.org,m:dongxuyang@eswincomputing.com,m:jens.glathe@oldschoolsolutions.biz,m:johannes.goede@oss.qualcomm.com,m:mripard@kernel.org,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C30926D8C70

On 6/26/26 6:32 PM, Brian Masney wrote:
> We have cases where a device node represents a provider for multiple
> types of resources, like clocks, power-domains, resets, etc. We
> currently have dev_set_drv_sync_state() where a framework or driver
> can set the sync_state callback for a device node, however it currently
> only supports a single sync_state callback.
> 
> The pmdomain subsystem currently sets up a sync_state callback in the
> core framework, and the clk subsystem will setup it's own separate
> sync_state callback in the core framework. These can collide with each
> other on some types of devices that have multiple types of resources.
> Additionally, some clk drivers already have their own separate
> sync_state callback already defined.
> 
> Let's introduce support for allowing drivers and frameworks to add their
> own sync_state callback via a new function dev_add_sync_state() so that
> multiple sync_state callbacks can coexist.
> 
> Link: https://lore.kernel.org/linux-clk/CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com/
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-6
> ---

[...]

> +int dev_add_sync_state(struct device *dev,
> +			   void (*fn)(struct device *dev))
> +{
> +	struct sync_state_entry *entry;
> +
> +	if (!dev || !dev->driver)
> +		return 0;
> +
> +	list_for_each_entry(entry, &dev->sync_state_list, node)
> +		if (entry->fn == fn)
> +			return 0;

Do we expect this to be a valid call, i.e. should we WARN_ON here?

Konrad

