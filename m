Return-Path: <linux-arm-msm+bounces-115066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /oAXOmNqQmrB6gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:51:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5606DA8E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:51:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UAQbONyO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iYxDCdZd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115066-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115066-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0325E317DA87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F000401A06;
	Mon, 29 Jun 2026 12:29:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1FE4014A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:29:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736175; cv=none; b=bA9bgRMebNUXCQuJnzyt8YGxO04/p5DANePLLEFsh2jnY98MoGhvEMduj/zEBiPH6K9MRsC9gHmvQq7rhQQ95zrOoEvYI/AxghvSMN7+VbXGa+/PQvDlyzyyJ5kDjnrPDGwEEsyJ2auZBGyiZbQottO9ZATlyVUvWNoZarC9VmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736175; c=relaxed/simple;
	bh=3wkaVyo8f9C10ckpDW8FQOs7mVt1PctZ4+KQwkKXBec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uehcb1V7Nt/N+PDoddpQicdpNsrDDlMHYdYZ8zN0ebMI4zYVVTi8hZpm1UDi6IGGYBTb7wG/Xx9+HvZUIoG3ccyWx+kStmxDplSZ+prduBBrLI2fEkVNXBkkgx2wSgTLTjOAwXH03a+8ceEecHjwZxRgSSy/ZQZNxhM9CZP4+2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UAQbONyO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYxDCdZd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT2b12646894
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8QjTG+MobzU76SuZmdM098g+XPk+Q3XuBlOoWFGPaA=; b=UAQbONyOcBavg6Vv
	mnuHEm9D2HiR8cx0XlQWUEjb0sFuSGBvK1jTyCylrAezm/9/Cd32+aLQ0l1Eoe7b
	IP3s8NqUlmI4ZE9IjZjqzu+LAe+q4Z9fzzB0XyYJ1huwhw39cs9XLaFA6WbP4yuK
	55OvsWBWq0c8eztsDcQQsip8ZFFkFIKfuWPZzWfpIwJ7AnXk7c4VYy51p4IKHjQI
	H4QVZIMgmIOAZ3hW2hGmMguehm15WcgE8VnoXJASNAtdBwWprlErpiYZgVSOGm4/
	s6xLfmk1luW6ZvIdzQ501TEk1988Hz+1+ASQTDrcmTLh62PMj5q4oHEHxBrQwuB6
	CBqJfA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4ts7uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:29:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf44cdae5so313041cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782736171; x=1783340971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8QjTG+MobzU76SuZmdM098g+XPk+Q3XuBlOoWFGPaA=;
        b=iYxDCdZd60ZuFnZj3MgublrfAkYI17T++8LK+4yPuaQp4z0LP6WKdAisgymlXyQalO
         VnvMKx3t+8flF6/vZpV5R1/RqgkOZrmELPY+h48apNPJ1skEN3CPNHuBKZ7+h4+JQyRD
         Ecy96WTLC1uUhOr0O9gjfScu45ybOI9sl/tcBtuDOiVuDojia1StOBY2H2nH+x+3l8Hs
         JS9+ZXU9SPeQLK2OzyoprRHAW/a2UZxRoP77VKo8sNtlchVDVu4O/sc6VojVrxCx5kgK
         UvqOup0jP8TFM4ZASbJ4rzloResEjzw7jIPGpZk6smV3GH+s41NScu8DJFZpKwsp3BsJ
         Fyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736171; x=1783340971;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8QjTG+MobzU76SuZmdM098g+XPk+Q3XuBlOoWFGPaA=;
        b=nTfxWeIu5mwfK8HfIreXMSXrhpFVPZnzIYpAbSdG8fTv+mDoDS0DY90N8YWluID7xj
         HHhLcxOFZPENPnY2A2GYL+bVQ497wnLFq17IflgMfrLtm1MvJUf/p4hhLVbCq9gzFanu
         Kde8S1dvGlqJN6QGkkMY4nhifJ3WluZAB+4015jc3VMXriJP2MYOBh4MhqNzMMMEXrj4
         NorLcJMhx3Y7CBZ4iy5R0fgnIRdIGuXI45kDJ7GwJztoXEJkEcb8fGWFknfCpXGE3r7v
         Zid2Faq9ZVsxH3asTs3juzBl+v9pFwaO+9wNkKyR8VuhToTOHhAf723oLmAfWrCSzDQK
         X5OA==
X-Forwarded-Encrypted: i=1; AFNElJ92A+Ty9GBQVhqImZuTHlKQ39HRr5u/SF5bv2qi8CdNj4Pk03Ne4Ww4I/PTnNagkgWHY0EB0iUb/6Et5RJb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw17dX3Kw7lGyaDYwp2fn+R8JkE+30E/QCSkKY8Kycr9ZBQIUIb
	G+/lXyBg6GP80SPDWKqEYKRlpWEZhpqPnNoDlBrygJppzIEK2OT8GQIKpG+NVzFrwx+rvZcj/Hv
	DZchNDrDn3B3aDOLd0kJOtsbc4C71qm30rVuN6QWpkwkLfoMAKPab3EQ5r2b41xxlHtlv
X-Gm-Gg: AfdE7cnI/XQ7vvd4gIYaN7Q0c+mStPB0gObtuB7LeOCrBxyXWzkASsY+sDKCOoDZBdg
	fSAfjuRPFa61M5R7lnSqfpzoQg8Lrx2XYlNgD9AkO93hR4jvpxnqnzbneIELr72YJ2Z69W/zj2x
	ZAcUY1px6CDP1a41KVMv84j0oxFvw0G8lC/jyV5igN3p/XV/V9ij2arc8aCxwrOpX/NOKeo5a0V
	67ozgsqvXFjzzFvSSe7MOBuX/1Imrv7Hkv3olDnEBDLLzvstDpQQPLrZG2J3NetSISrqge9RiS3
	ecRMHO9UawOdNN2xp1k6ydxH+2hcAGvOIxcrOxubfTwmXvWrart3IWsLOOu+4WH0d+1w0TvMuZq
	3VKPAwdVMbMcR+v0qEICK8xr3sPZeZ0hiOTQ=
X-Received: by 2002:a05:622a:244:b0:51b:fe41:4764 with SMTP id d75a77b69052e-51bfe414b9bmr23414711cf.7.1782736171470;
        Mon, 29 Jun 2026 05:29:31 -0700 (PDT)
X-Received: by 2002:a05:622a:244:b0:51b:fe41:4764 with SMTP id d75a77b69052e-51bfe414b9bmr23413151cf.7.1782736168361;
        Mon, 29 Jun 2026 05:29:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b0a53a815sm8454541fa.21.2026.06.29.05.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:29:27 -0700 (PDT)
Message-ID: <ba7ca0e1-2e66-4355-a8f6-fcd65010b08c@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:29:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pmdomain: core: migrate to dev_add_sync_state()
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
 <20260626-clk-sync-state-v1-2-4156d8196dc8@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-clk-sync-state-v1-2-4156d8196dc8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMyBTYWx0ZWRfX6fHYezdL9VQM
 BBph5iwt1wclLyeU0e28Fdr7M5PhdFW2DQZZ6Nh0Wq10kp34DmhVgKCTpYjpaIrY9ITHxx9pSsB
 4LrPPiOg3UJVlJuOUvA46Y+ANwo+M6RsBLHj0Qw/GvHcxrhFekdPW4K1lOSNhrI1wewyqEeJEqb
 m16d6Wwlc6jXrVGpFS0rIXVx9s8babActUbpgpVOhpXiVHeRBKLTS/yoctOlb6d/aHOOCUiIsTl
 0qkpUEwvuCS/i/4TuE1y1kFsL+cQx2s1kBmP8WU5PvdMwWVEYFPU9uSQmIJodlJFsbjZTit4/8J
 iKcmn/Kk05X0fSSZv6VhH8YzDqP+IrIIjDf8JoHpnaAt/kmwQZGEH9WTLac4erJNcPCch/1LHmE
 EdHjMDwDxJpieKlYbu/y0gDWCpGSdx+rCwixsh5ZlwYzM5G7QaoYc2BJsVnIRpunPwz7OulrI9K
 k/3hbDYDQ5nIkD/vfUQ==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a42652c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=fDt9MinM2cAR7eUiMvAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMyBTYWx0ZWRfXw20uR1UIeImJ
 PAUMIYUp8O8WvaaTK4KVuiJVzaiHZqdzB3zDdC1we+T/CyeZMuVUujg0p98V+ImTiBUZ1YPxT2k
 PiFOnrW+Jjltw5KA4y7xLGs1havmd/4=
X-Proofpoint-ORIG-GUID: n4rwwzp3dgTSonkRKiWBt4eNXQTcZHwW
X-Proofpoint-GUID: n4rwwzp3dgTSonkRKiWBt4eNXQTcZHwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115066-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ulfh@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:neil.armstrong@linaro.org,m:dongxuyang@eswincomputing.com,m:jens.glathe@oldschoolsolutions.biz,m:johannes.goede@oss.qualcomm.com,m:mripard@kernel.org,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B5606DA8E9

On 6/26/26 6:32 PM, Brian Masney wrote:
> We have cases where a device node represents a provider for multiple
> types of resources, like clocks, power-domains, resets, etc. Having just
> a single sync_state on the device is not sufficient since other
> frameworks will want to add their own sync_state callback.
> 
> Migrate the pmdomain core code from dev_set_drv_sync_state() to
> dev_add_sync_state() so that this works nicely with other frameworks
> that want to add their own sync_state callback.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-6
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

