Return-Path: <linux-arm-msm+bounces-116961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SCvlAMr2S2ogdwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:41:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2013F7149A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:41:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cXPwd6zl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="R+L/UE7C";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116961-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116961-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB73732A9DA5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BEC3AF64B;
	Mon,  6 Jul 2026 16:53:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F586BB5B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:53:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356836; cv=none; b=i+bkHxwCLCDpbcOvgJs8ClMIgMkpDwAJs9JTuWtw4HjV69yLgNQBIw4/1rNZN+7xspys9XFOleyl4iv2bxk8LhqqXXAd2vVahLUJhmBeU2wwZIS4pFDrMTApzSbK5riB3VVwNr8yP58nHpykycliUILjuu/EYel97DcOts9Fcmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356836; c=relaxed/simple;
	bh=dnpu0R/fSpmvEPD4L/8wrbkOZ/dKR4ml/eonMgAgoxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lF1WLGKkkzcL3sEive9dZLnehTiJ+CP70tH4GGIHwr4XRVU4x0cPumo1C2Gm6hbWGc5vyTQBFVoTMRu+5+GIc+RQPx+r8BsRVHl6N/P0AOY2pDT2l+YeYMuHoDjxiVm7CtM70RtvIyVkGfXPSANp0KBMZPBzsuofX8yBAL2xo8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXPwd6zl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+L/UE7C; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF1ID980532
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 16:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jdesGLrzqRFvK6uMhNgG5Rmp
	hukyOt5V1tRBckTS4no=; b=cXPwd6zlfVmw6Hg9q0l5C7RijywaZCnQNnysMEt9
	VeV0zoMMI6+7jXmN3alspNPjrFVbFdUS0tUSTcfY15slX4/j8Kzew2tMMEwXFl10
	cE9qf7FuNbhUKaCfKpFO4eTcGZUUNHv1J62uscnlJ3GgzKMOA2+k4xqWmydfMSby
	ZF9c+ZhimPVjg8om5o4xm4RNyM4xC73CgLKh8d94tKatRZzj7jGs/xXqKb1eVAk8
	GfD5cx3rCVez3CLS4+HWq1C05Kh4ooWpYz7bWxXwfcpDn2Bz0JX+rgpLz1krw6Or
	8HC6s2q8Jp60/oI2/nLs891UEOr/ZNa+XRoa1gYXQUUdvA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgt3a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 16:53:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c916d17dd43so5110528a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783356834; x=1783961634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jdesGLrzqRFvK6uMhNgG5RmphukyOt5V1tRBckTS4no=;
        b=R+L/UE7CiKYpJRTkDinxNysT0CQ3A+qJ2mDhk6uB8DUPk0yeoufaMGWrMGnqCWq+sL
         Pf94TnsShs4hK70C2KO+IY7fLyt1prozNse5I8tCXhxAG3d5enarv5W8MddnUURdnC8R
         c1BpQPG6mMCRwowK+DGkb0uSjvStaAXiSPcKZ7iPUcn/eWIr2VJwkL/kp/z71iM0kaAF
         GLqpnC6v7tlvrjAx+IWQobNl/0iyJlIVFLp7jXgfxwlnnp523xG7umU/rUkG/Md1u0D+
         3HRx8pCReh1OvfzFIAb3UedURnd7HQ/tZyb5NURDVxAd2TI/MKA7ND5N9+WMc3d0pCe4
         OQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783356834; x=1783961634;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdesGLrzqRFvK6uMhNgG5RmphukyOt5V1tRBckTS4no=;
        b=rm4cHJqHVV7WHcvmx0Kw9rCEAKh0ROVRsvTsi89DJ0CmgdNMe0FKBxWrdda+LQi3FU
         p/qV8Iw0mI9wduoF4wcDiW8rfmlmckdPK8abt4h0eoL+zkjXbkeOwEfRoGdTDRHLIoJR
         atn2SVqJ4CLRz2c17stbTIDG3uGqxynzIPzWhfEJua+r1+lRBwJhXyKxoYi3hmYs/QMO
         HMl9eCJYQ7roADsQmJ0031ak6NuLqoeHIgL11igUDOVsZ8WmOEgsom4E4z0OF4mBMXJz
         K7IheMo5SDGUCimEhl8X01O7dKQU1KqnAUpKDAPzHwf/yuknQI6+iWv2fhQKHjIpk3sk
         s6sA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7xhUL93Wyuu5ZgFV3t/odUrE1vod4iCGXjP2OVCHJmPKcyEjh28bwDrg7cTQK/hvGjW77ESyP867Zdn2w@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn8ZT8BGOtmOSvtpIpRkarbyEp1xPs0UYEC2O8w9hLpJtFQzjH
	I3eria/n6MnbS9tBp25HwERoRwCV8fBPpRQ3dIU4UfM9eT1gnJ/geWbkKAJiyI8mNUHMeMiPV4w
	OzTDdZnnFiIUcwYPSFcV2pPCCnZMH7rOG2+CLIaNRAEjp+grVVt2ASl6otAL3FenyF7Kv
X-Gm-Gg: AfdE7ckZdFBraAqG5Vi/rI65TnZOGOwbqRfYB+nmRmpx+k/amvw27H5qrxOn+FxC0rq
	537Dzfrs5NjbOkwy2r1284s/WXQGpSqQbI+00HdqQD9M7WvJvMJiXqZyhR2oWxzg1a3iwrNcTiy
	W+ZsECT6YouexTJMspVXYO0QrcmqHnmOE/cNMMcrrqWpi/LJ9BvOOt27H5HzNLCmasSFHtCqwgs
	FRIRDCCzuc1Y7yGkBwk7z9W734L8/oXcdDF0T2vZ9XRGoLi/pCD2WiLvmrctsuTFuubsdCSoo6A
	+VsVfZVXPEHSzpxGWn6lXBErdJARWT3kj11/5ZB8ME0up9j3uJn8QthdDTUYTvToLEE99J7Xkng
	SPwBP/8TtKN5ne/RIz///csiCeJ7Vkt2+wlJFWg==
X-Received: by 2002:a05:6a20:3282:b0:3b4:6f7e:d0f9 with SMTP id adf61e73a8af0-3c08ec71673mr1732947637.3.1783356834057;
        Mon, 06 Jul 2026 09:53:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:3282:b0:3b4:6f7e:d0f9 with SMTP id adf61e73a8af0-3c08ec71673mr1732896637.3.1783356833486;
        Mon, 06 Jul 2026 09:53:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm24317500eec.15.2026.07.06.09.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:53:53 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:23:47 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Make ssctl_id
 configurable per platform
Message-ID: <20260706165347.zslrvhdyginswej6@hu-mojha-hyd.qualcomm.com>
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
 <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-1-f59e728af621@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-1-f59e728af621@linaro.org>
X-Proofpoint-GUID: Dv67AD3eZeU0oBxmjo75GtquWTkOR7vs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfXxEfWETRipCfw
 QfIQb8AoMBHd86KQ81p3f26A13V7nbjxZBTl4xHczJgomDuNdv0LcfamMC7oKXkA/czQL99+Y8c
 yzB+UVlFrubltVDOn3kI4/qiYXHxoQHl5q0C2EnOVhHuJEEAkHm2VmgWuiiFgH0kEWBKk0QQggM
 t0Y+wRw5TiXd5IZnm4x6CupwDVElLPd78Tql7ZN204uNmrw3KVX+jy6j8MyOa7IPotNgQ8eHHXm
 LT1WVEnFgB7+WxuvQ0v3+e3CiDGcHESxM1ZfTVZm3vqRAHHy8hUzgWRhU/R7wYCyF4kgZCCXyJ0
 gz186PlkjFMrx06cCnPzC8ev42aGn2DMMvyyj1uNz1GHM81wO9+U1EyfaiuyQTYC9N0XuqyDr7p
 D62hmzcQ++rOPTXExSaUWb7TDiJLI7cv+d+1FATzRWxgyMRnAEbA3rJCoFMLY/T1Guj8kLD9fEi
 Ml29ZQLEs+9emvFX1Dg==
X-Proofpoint-ORIG-GUID: Dv67AD3eZeU0oBxmjo75GtquWTkOR7vs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX89Ie3LOMadqX
 GT1uGqOvZ9BtEaOU//uuJ4h8pWa4WJLxnL+4Sab44qXif5+o5/qh4cWIhyNe8F0JlurQ47zL7nr
 xRexOdiPT5GzseJzCEjKfyNTk96LlxQ=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bdda2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bjVS6o9MGAhJDIbh6jUA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-116961-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,linaro.org:email,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:barnabas.czeman@mainlining.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2013F7149A9

On Mon, Jul 06, 2026 at 05:37:16PM +0200, Stephan Gerhold wrote:
> Currently, qcom_q6v5_mss hardcodes 0x12 as the instance ID for the
> subsystem control (ssctl) QMI service. However, some platforms (e.g.
> MDM9607) provide the service with a different instance ID (0x22).
> 
> Make it possible to override the ssctl_id per platform by adding it to the
> platform-specific rproc_hexagon_res struct. The same pattern also exists
> already inside qcom_q6v5_pas.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Yes, 0x22 is for all the standalone solution while 0x12 for
integrated SoC.


Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

