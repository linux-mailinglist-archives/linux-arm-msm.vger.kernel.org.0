Return-Path: <linux-arm-msm+bounces-108410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id my7LL/gkDGpWXQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:53:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F46C57A8D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB241307522D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91217394788;
	Tue, 19 May 2026 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m1P5fMIo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krk96jBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9A23101B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180404; cv=none; b=YXSoqNxuJBDm1lFd+IqM42X4XLpxKh1yo7lbaWR/GzwYLHwkA7fYhqba1yZxGkg4U7yyKCD4ru0rrPMH4BwSQNcqLVJU/W+bFfriUI8imIkRHn2JDuzmPbwjnGeQuZ964FKRhQLvSgH+PguVJNEMi1oBvpWRGxZoQiVxjZH9ZBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180404; c=relaxed/simple;
	bh=EBaHQIAJuVILdNhAzgVxlkgAGQP5kOdYvt6/uiqvLL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgy2Jq7gxaYyPEA0sFZEQ0yhHeVjJYIf8JDJbDXUgnrOwyQB4nGtLlT17oCyxTWGre6F9Y/cohege9b6vqChN4eSsMfN8Jk4phB12ujp+PGKJM9ra8eohxGcH0XI7wU4AzFdl5U2GnGX8sn9AE9dYKO092sJOYydAemygwcPOw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m1P5fMIo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krk96jBT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J7cEKN1146729
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hCZMgq9t5NqGZfPM726jbwBP
	EARH5j7MI2OBBqd1/24=; b=m1P5fMIoYh7zCojQhIOESBWr0Put76/oSIUn3gss
	PAdZlmcKcL/jnCol+PMsZStAjzcBubiVq8kb+pRt0FWhmlMGHuyTZiZwJLq7MP4r
	+NKoxZnRCKBBx2fAEGW0619rY4fr3sf1YG417c2/1BtYyZMoNKCuc/malv5kPiPL
	In2Yjzh3ms1OI0VrWkm8ACc8/mEWR3yUHCI3mMl6Y6aKyJ8+yVKeEKYN52xzdf7v
	ygqZrnRR9X7WP2xpaBJQtU6yQQ2D5pMbtzlvXzZXlC6uDqSdjISQMjlgifYTOwmi
	tLOZxLNnPhEQIZUpN6kUCWuSWsztXrd1bz3CnnfDFcS6lA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7ehjcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:46:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso2224644b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180401; x=1779785201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hCZMgq9t5NqGZfPM726jbwBPEARH5j7MI2OBBqd1/24=;
        b=krk96jBT7mzHtAN5vdEJL+Bl/1DZa7C8BuP4q5EYa5AYyxmF3nfcQferSNAnikraeD
         5gbAmrQiIcum2xj7epSkLDXir/kRKwQEUmg231NexsLHobhHtsGeQZ5KBf8W/Z9ul0WX
         LjpZSptT3+MEVWundVCML5D+qutBXvAQqbW2Lre7gGpXtc9fN3C9O+Z7LnwfIWb6BIpe
         OW0mhASK7MIj7Q++ewB3O3GG1RcnIY3nR8H6EsLT1LdJ3mL8rqnuUgNgkJfxYxtNncJ7
         TN3m3kg38fp/Kq1d36FVwV/UjbF9izosdrPGr84jxUXv3f8P9qd3q6PB3PLPU1HN2MIh
         mcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180401; x=1779785201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCZMgq9t5NqGZfPM726jbwBPEARH5j7MI2OBBqd1/24=;
        b=IQJcT8XjO3/s//C4DQoPX6jL/yoSsnxNh5jHYdBhMPyXk9SPmEZJhQMo0iF/dCwINj
         Ve7rn/PkdUO/IjoQDrhuDqtq3ajLRfFlzo+I/8k6gNN9EqI4aosYgSUd1PeTKE9bzbkf
         egSfKn1TWZjfCU24EJ6X42xj/PixncJKd1Bl7FhZtP1pbcw5TsshHxHfSOl+JzXqe/pf
         Aag28LzfoU7vsxCGgkCDP4weJZGS8HrILwcw2kemR5IajcHotGUREVNfqD/vyR6FpsCW
         pRvHiPjStuXZDCejoAja7Z5s2S/ydbBaSoViT4OGHHV9t+5lJI3po4V4jIp1WQPayoUv
         qthA==
X-Forwarded-Encrypted: i=1; AFNElJ/f3X4Xox9BRAnFpreUDaASzAyOk8lryTuRW7zk+72s3/W1fL+A3egMCTDWr0obMonaTNHrP+bkFKt0WYLW@vger.kernel.org
X-Gm-Message-State: AOJu0YxaDHw9ccLWKczjIKH//TYr2g8QIRIPGgLp+0xO9ZBomIDmnKml
	rqUiEZVjcuibJBv/1nq21rHvDriQzWUoTxWAHt11S0AK69oDF6rcbhdSLV6cBJ+Bc9PgNv1cZPm
	YcGWgmRAOXUTyEs0oAms0k0bxqVbenPr+rpfHRF/dS6vySqdBRSvZ09A2kHtwTpFBcO9p
X-Gm-Gg: Acq92OGZ/6bG18ywmIe9a85g1OTiqRq8OZVh7f6eH4Jg29R6+Fq4Fy2tfHXw3E9Y2zE
	3z2WemPcZ60d0T0u0uNIQfY28riETSUI8Qug5/Vec7xaAUKH/yeE1J5qOtjOy0/uUg/h898J86i
	Pv7DU6eFRvwtK9X5JjNIp27V8POWfq0NtpcVGt4Pr9cnEauIkoSIwswUE9L8zoiAHpbloJTGb52
	Tb2uYSmYvPsG1+1jrV+kQhu07uS3xAilyn381R/vZOK4qbecR58aRRgTe4gRb+XUcGqUYNQC4n9
	XJVqUoDoHKedgHU00+e+4LPzzaKrR2N9/ld2uOP+zzHVoGUyU+nRV8/Lz06EBkE3UIN3MRZSCj4
	7RO8kTrDKaw1YnQFWeDKBL9c+XPVeQSUzAjAg62pskYrYPEjz
X-Received: by 2002:a05:6a00:440e:b0:83e:f228:b112 with SMTP id d2e1a72fcca58-83f33d4ed63mr17779613b3a.34.1779180401112;
        Tue, 19 May 2026 01:46:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:440e:b0:83e:f228:b112 with SMTP id d2e1a72fcca58-83f33d4ed63mr17779588b3a.34.1779180400449;
        Tue, 19 May 2026 01:46:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f79b60sm18804905b3a.52.2026.05.19.01.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:46:40 -0700 (PDT)
Date: Tue, 19 May 2026 14:16:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] firmware: qcom: scm: Add minidump SRAM support
Message-ID: <20260519084633.3pkfhw7x6jkxv7pf@hu-mojha-hyd.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-4-mukesh.ojha@oss.qualcomm.com>
 <3m2bwess4zw3hw2qlkwnmhtclk6ofinxekxfqz5otw65hd6d6q@lfcknrfkacy5>
 <ba499581-9cc3-43ba-8b28-6f984d2493c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba499581-9cc3-43ba-8b28-6f984d2493c9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c2371 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=z5fMQXc5Ym5buCV79EcA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: CzRYEYDseL8nMxFAPNqarHa09cjMH2T4
X-Proofpoint-GUID: CzRYEYDseL8nMxFAPNqarHa09cjMH2T4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NiBTYWx0ZWRfX7G0NFHMA0Qu/
 UPzPnCTIFBgvhzTVmPt8gV5XD8czIugr5aMSLyTS+YMvBVvhYlKz1tmq+79MAPR09D/1wiNSsQz
 p5S8tBTo9qxaWLVBXwdFl4L03AUa4bmLtKt+NhJji+CjFuAgD/JqV0tZJDizSN7/ykn+NUodgNo
 phy+0TNm1PC7G8jhiV6HtcvKL7raJxkwZgNi4QN2RdackJIElVHGjhyR5KOr17FipCFUbdFoYmk
 y3+1yJ12K3P7yJEB1uaO0vXg7V6d3tZi0VNinYzZ2nraNitNnpt3LSF4T4f0mNoWOMYUocfV4qV
 B5tKlK+JSdQvlHcT+cy1h32egs5ZQBK0m1JJFAW3Me0y4/ossBzLUNbE0QlicZ3uBBRsXcxNSfJ
 hnz7OFU+vHIhkl3rsGvRTBtu4QNHiLKy4ip1lnfB/Nqh7C8l0XFJFoGuLC5qGMYYHR6PGBrDzBS
 w1jhV1+xRXKpqazyf5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108410-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mojha-hyd.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F46C57A8D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 08, 2026 at 12:40:35PM +0200, Konrad Dybcio wrote:
> On 5/7/26 3:50 PM, Dmitry Baryshkov wrote:
> > On Thu, May 07, 2026 at 01:37:19PM +0530, Mukesh Ojha wrote:
> >> On most Qualcomm SoCs where minidump is supported, a word in always-on
> >> SRAM is shared between the kernel and boot firmware. Before DDR is
> >> initialised on the warm reset following a crash, firmware reads this
> >> word to decide if minidump is enabled and collect a minidump and where
> >> to deliver it (USB upload to a host, or save to local storage).
> >>
> >> The SRAM region is described by a 'sram'/'sram-names' phandle pair on
> >> the SCM DT node. If the property is absent the feature is silently
> >> disabled, keeping existing SoCs unaffected.
> >>
> >> Expose a 'minidump_dest' module parameter (default: usb) so the user can
> >> select the destination. Only the string names "usb" or "storage" are
> >> accepted; an invalid value is rejected with -EINVAL. Changing the
> >> destination while minidump mode is already active updates SRAM immediately.
> >>
> >> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >> ---
> 
> 
> >> +	if (of_property_match_string(np, "sram-names", "minidump") < 0)
> >> +		return 0;
> > 
> > Do you actually need sram-names? Just to verify that it has one string?
> 
> I requested that, because SCM is a very generic node and index-based
> lookups would age like fine milk

I am going to drop this as per Rob's comment. Let me know if you think otherwise.

> 
> Konrad

-- 
-Mukesh Ojha

