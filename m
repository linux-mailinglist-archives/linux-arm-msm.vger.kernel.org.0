Return-Path: <linux-arm-msm+bounces-114298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JZbEIraLO2oiZggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:48:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F366BC4AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:48:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BMGb4dDH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C3qN80LE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114298-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114298-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73C5630414A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8653932C9;
	Wed, 24 Jun 2026 07:47:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE79395AE3
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:47:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287244; cv=none; b=Rj37eUxJoV23eTuPCJseqnCZFzrEWIcKWJIEBNI5r+LWNjW/I6cz71Q03dA02prwpLXPmSe/5d/d/uvnz2Wk5S7ha2AF03dnYkkjzDC0BtCAw7m5xQSgEHqf9Pq9Ykbu8u550+GPVxACc+pU27L62f7mjtqSwqxCrhJPN0GRCjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287244; c=relaxed/simple;
	bh=SubK8zh8375/xh1JLgTbSXAfRTQrObsHSJUFoEOOZOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5pNQOvR7z4vKx+zyBtJcI5c8t4KCYbwUCXn+bawX5Zif5Pq5nmzfAxTHTzo3d+DefXu1358UwW2oRR2zOjIoVhHAscL3P9myhdBhgwnFBmkib4x9LuRqlduVqEle9Z1myR/YQJYqI5YZTOD0xsEHkXeaBPys+c4HtrdBVJNTK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMGb4dDH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3qN80LE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O7FiLd2439301
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/g4fRALXysleQymhzTRyHSwPBhUJqCQ0cZjYYVP6ilc=; b=BMGb4dDHJyH/0WEN
	v8/5eV9pYq5LZDPtvFoG8vxESxJYIDq7nrMFWDwlW98oXAUncUy3amdI4f7Zal7s
	ABE7HLm8xtm3iW3pyaoOUyfYERJhUpxIjtduP0bSyNtqHTLGFE7B38+KnLkTk48r
	N4H1pb8BfiU89LfCVNL5XdFk1S5rs4vHPp8BsCEnbXggr54e41fLs58v0NGKj+Ww
	Veavpn/+RBGPde6sv2G0oqjCpULKNFUut+OzkqKrGnzstWsx33tzVALLzpyKTtGG
	o6wdwwYSObBylDHYWHDjedLHHFfxHqqCwh+qUhb1KgGxUyAwN0ABJYMFk/azSm4q
	FJXG/A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq03se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:47:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8dd10a7e0ecso2567676d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 00:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782287241; x=1782892041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/g4fRALXysleQymhzTRyHSwPBhUJqCQ0cZjYYVP6ilc=;
        b=C3qN80LE3PZ0Ab4yqxa/eObUcZQgRCZBXoYOyyyaCjmu0zk2GcZrV2qIHzlI4OFsu2
         QWJ7kxDQNHg+jp2kyMt6Gc1SrOB+dqHsvfLVnt919U/qC+tPtgXL91d6NH9tp0ll+Ttt
         Ijxs7sVbDv6Hlil5DrHJqFxE4bT279QSnKf+svEhp5/hdymoOpHhlP7+HHdl5zoasKxd
         Cvoqg843McSHJCi7Jxl6mMK/hkbyiQyVIuZH4lG1BDzfJCG7jJltcUmX4+OABqFWZ6v5
         xeoMrJsMI6z820e5Hq/XNbSevJkSpxdu5I74iOWp6P4S+KAueY6LS/CCvl9xXST9sIoq
         E5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782287241; x=1782892041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/g4fRALXysleQymhzTRyHSwPBhUJqCQ0cZjYYVP6ilc=;
        b=MriQsSRyYcEQP6xIBK7Z7+cO7KtjXjfCnEXRangaBGLixsozz2KRGZJkm0B58Y6DS/
         jS86p4Ra/HNcsfvHHz5UADlju39j/alH4rQpzlmId4DWSbvx6bezce8lTM0t/ZI98xCc
         7WCpSUR7INfKr2gULv0GRBPPtU0w7dnX/TDzjazN7vTfVU47pyapZrNjunM8FoqA/ZUG
         wIrUB+IpT1dd5Uf+KCbIJSLsnW8u8n/BKlXRYeoop3xGOFJeV6YrB0TEk44fl8LRMmPA
         XVfP4Qg1GtfmZ5gvYmyIosa7AlhGY/L+PO++/NyvdIYq1bfv36dVsbHLnxsup5E2eTCN
         v2aA==
X-Gm-Message-State: AOJu0Ywkw83qrNE/Iit4DaepjohYYV09JpgMYp5GbRpxGkamOqo+ZaPm
	jFBgg6uQrdbGVPHuKoqaD4wZMq4m8jaDtMEucLf3WbHzR4kuKn4tA4jq5qJh97XLYB5pM29iZHy
	lJmvuvZwWgTb+qcUszc1eDQe+7pyeIcqXEaZMURypahm4lPkU1naZfXe7N8WEND28TM3/
X-Gm-Gg: AfdE7ckVFPrWYslS2SRfvWNvX5aYDVzjFFMOOWvKnf/0+tghCZNEY4og7UgvHuJkxfh
	QstolR8+xhesnZGkDuP691gZ4uFmdfeMnPSY5x6tAqn9JhFbKeCzh/Gn87mFyfdVtteBMrLbSvD
	ANjK2c6Fo+EfHMDT+oSSSWh84hTLzWpN88gTKdGKlCJ23C168kkiMD3spME6WFBmuYnS9Rfg0mG
	iJ+WsJzxAA8fJ8tjSOtywR2A4PiGRL1KrP9scAcOQ/tOHj3oDDTw8dMnbii77ZJpJJrk3zEQNg9
	QEWVpamZwTuI5iseazO/MPoaqsOqj2FDgoPd9e/0pTaiQdHwiiWo9IT2BXb+vKffIaGJC125EN4
	hTXiijK+JytIwctcFHplyDFFUyZNrdAaRstU=
X-Received: by 2002:a05:622a:b:b0:50e:487a:bfef with SMTP id d75a77b69052e-51a60d5ecfamr25152961cf.2.1782287240960;
        Wed, 24 Jun 2026 00:47:20 -0700 (PDT)
X-Received: by 2002:a05:622a:b:b0:50e:487a:bfef with SMTP id d75a77b69052e-51a60d5ecfamr25152801cf.2.1782287240551;
        Wed, 24 Jun 2026 00:47:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e498cf8sm603381966b.13.2026.06.24.00.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:47:19 -0700 (PDT)
Message-ID: <4fe3e01e-93f7-4832-b93e-d006c644b3ce@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:47:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qup: Propagate clock enable failures
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260624055237.29977-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624055237.29977-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2MyBTYWx0ZWRfX83WeayFODTDy
 551xuQgcPSNyF+e6jgJwu2oOJWmvtYAg/A+qGhAwr/IolkOMe1/sR77K5R7nqUBNf4yEChgHA5q
 c/aWve5byd4ii5swHMrcVvQP4Qf2+8I=
X-Proofpoint-GUID: zvlVzySOm-OGvQfG4_-20FZZHbPrmTJ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2MyBTYWx0ZWRfX0Z/DJ5vRjzux
 lf41Xmo95MtdNQNx1P9CTpKXIlE6U1ZBHNUd7hvTNrf0J68wLptokZh0jve/nt8YYUzcLFSW+kh
 cGTmQp3lTsagpWCVcnzLAz/z2QiueoXvgIx+gwekb/bQEhp25rvROwXE2VIDdn8mCh6hOXXmrjg
 TP88LElBsGvABTr0CWJhr4ALUsPIacYki7ZEAayeQ+dFJAgnX13qUxLsOMfnM6DMfdqbQLL/FJa
 GjhZF6b1YTaXk+WYNk+ZdFiYVLiZprEJ7L5wOW/2EWuS1UaYV1Qi/Da/jAHPBunaucMVmlQPxST
 RdY1A5Hunmi0ZDJ3PI2NABdaqt81H7k9Fr7bA4rxHvfc7zL/lg2sXI/zVWJQV/iGVIKSbR3z0EC
 QgE934iWYJJAciiJwHK4BZp9j4SYKg==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3b8b89 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_6zfsGPuifU0wGZyNaAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: zvlVzySOm-OGvQfG4_-20FZZHbPrmTJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114298-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iscas.ac.cn:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9F366BC4AE

On 6/24/26 7:52 AM, Pengpeng Hou wrote:
> The QUP I2C driver treats the core and iface clocks as required
> resources, but qup_i2c_enable_clocks() ignores clk_prepare_enable()
> failures.  Probe can then continue to register the I2C adapter, and
> runtime/system resume can return success, even when a required clock
> transition failed.
> 
> Make the helper return an error, unwind a partially enabled clock, and
> propagate failures from probe and resume paths.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

