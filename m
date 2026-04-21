Return-Path: <linux-arm-msm+bounces-103889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEnBJOgp52mo4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:40:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA60F437BD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6865530036C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 07:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8201A1FB1;
	Tue, 21 Apr 2026 07:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LG3mgwLr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BU+/u14g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339BD31F9B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 07:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776757175; cv=none; b=LtxYhnah3oQiSI1sREW2fRdG+rLg0aKzI5Ai7hV4WISezkYOG3U/ur6MCwenW24Aq+rUcUxXGj9fIahc1+nJZOm/XEcW4uj3ITM1XU9hurMUMZZyaqZSNkzjVLrg68QNtrMkUFF077m9c96zRCaB1y8ZmANmmw6T7VyXBgkS9vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776757175; c=relaxed/simple;
	bh=AHVDlaiPLZGv5Nr20tU+e7aqoJ89J/Y6fybbRvNtqW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgbRcz2hGryXxoBFdCUFKzAc927/+Xw/mC3S1SjkFC6uBWdHVfHRpIcXtnvx3/uP888evOa3bwQ34gS79HvHtN9xRWzGDjzm6lunBPVzAY3tcbGQjzBgVmm3t1RtLYW1v2t4zLLSMcVTKXA8WdAU8oLWy99/oE6sE1oh8QlCPi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LG3mgwLr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BU+/u14g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L3PYmL4167771
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 07:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YFMzs4xFzTFlKpkighB7F1f/
	Iyfj9GNd+fbtaY4rXjA=; b=LG3mgwLriOYT87TGWJpBg3Ydwc103wi13GWbQfCY
	qWuNmFNj4LGx1WPFQ/9K3c/NKCA42W70t7IThEbsK5l2nache5POPYe6qCyhrbX0
	I/juHrv//VoJ1algfPd1+bzgfQHkdmIL8qrVwtrvZxOcioxyvw8eLZ1rGnc1iuKq
	BFN1STChaGSx0QIfck6cDKzzobeAyZzkIQuD0TPMVXtJ7DfjwKhqkarj+1kGwSC0
	/XvqMNUWJ6iIk3EzDJHdpB/b8dOUZC27K2o4qSiQzlNViwnuhmx8OfxEhM3TjZ/Z
	g5GAJ0HSAdCW5rK7Rty8H/fcgXywyfSDsrndEcD5GxFuhw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp1au0w3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 07:39:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2dd6fb4c867so1680778eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 00:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776757173; x=1777361973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YFMzs4xFzTFlKpkighB7F1f/Iyfj9GNd+fbtaY4rXjA=;
        b=BU+/u14gzSVJk9CR2tEYp+a+W2abOXOXabYXcZJ4/K89dw3qtPN13bfyIxHJCNKhbX
         XxFPmKtCYI/n8fE/dUnsv4mUku0IPFQG2w7goETbbGfG+BUPkpBh0JLnrRa7XVKsRVqG
         Ow22BQsSgZWkf0bJOz/qZZjQSCb4nugemfPQPOYwmEYD2iX9K2X5yMyfqh+riYCB7eio
         wwvUlf/iQp9ek1FqZFX78cpd3tW0R/9ARO4zjBHR7ZFT1fFUmktbvqlJMcGRHY+aZ6V5
         B1AR0FMw1ktjQSgohuDEeaiOOsbeP3NMKsSo+XrlCuj/0hkmMhFZFBiQegfl8j4vgznQ
         VYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776757173; x=1777361973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFMzs4xFzTFlKpkighB7F1f/Iyfj9GNd+fbtaY4rXjA=;
        b=Nz8S5zBMVAmyF78ocRXYGwSYq6CqOiJRRF/q8Yc22Bi/KzQDboqcFEJjePP1WthDBL
         vjSJ1wldueRPD53lzkgjlnbH6WNKLxszkGoEgtkCE79GmqUjLtdG6+QAUUDl7QZYhrlL
         L7c7ZqfJAT5WJxEtHqzqISpF5PO5/ugsneS2l0l5oWT3VZxmhIAOSQGs5U1wowdO8o5u
         GoHANs8aRnxLwUKteeDZritOHfGVbLmYy/vHRjK125QgG8ZfbMnhIFRIsHta2t+eSi36
         PfdE5JcFFyYEBQOjN0XMewEE8TAsTJ8V/O6GurtuJxMPBN9KwZaZKVojsUSmqx2RY9Cd
         Hvqg==
X-Forwarded-Encrypted: i=1; AFNElJ8PeXR1oKBTWbOqzLvm7aNL7N1Gw15ODcV4GxttO8wG4ZGiHyeTwCDcs4zfVqG2xNoA89DbZRNl2cjOEvPT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv+d+LHy900qtQGFtNNXTWQoDjsb6xrgsed1Yjeiwg+H6jRbg+
	O3gld0EbARedoeGlM3yb4hDWmO6uG7flLlyG5Mb5dFmHORnHafCN9tm1WwtadG/2hYB5Ew5WPm0
	Gp6vybFCbRVIvDgqfKdGzZB9Gov88t/zNncmSCCpISvUo2WApeUbnaAQ+tZQLwwSooWd4
X-Gm-Gg: AeBDiesBoCkQS8JqbC3b1tyndtkQjI8o5Gzo5PNRjbV3o9Z/iERGtTpA0jPOLMHlav8
	bg7XpNPoaA17E42aBdyLOq91XrN/NIGiWIx71OhLD4fBk/nM1BEcm0MjRPMtGsw+Bl5EERN0kAn
	YJi4txfYUvefTyIy9h1xxG0cZYx4fcWhQso2F/F5pGuryYo4Yz3nct8OPRnD/8D898iqWvpOKMP
	iihJPzXTPtT/uC+TFr+U/ZZwSLz0ldaqjIaO1nCmfoEOKKs8GgriwfTrPaNr+Dpj48+5w4OPbVA
	qvJ7AjU6ZmUVBlASYwQQJsvqO6UW4jq250OE8RFEcyIK5xjQSxwFbUz+nfm5gyrNG37GupyOfy7
	sA4D1l0WqnR7vo+0qPgyz2P1IHmrD6zcRuu3vAuhqleemxNmAOAuhNXUfq2y4Ey2a5SjupBxwxj
	Q=
X-Received: by 2002:a05:7300:dc05:b0:2e2:d94d:6185 with SMTP id 5a478bee46e88-2e466044594mr9276958eec.4.1776757172729;
        Tue, 21 Apr 2026 00:39:32 -0700 (PDT)
X-Received: by 2002:a05:7300:dc05:b0:2e2:d94d:6185 with SMTP id 5a478bee46e88-2e466044594mr9276946eec.4.1776757172170;
        Tue, 21 Apr 2026 00:39:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53dcb487bsm18275263eec.31.2026.04.21.00.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 00:39:31 -0700 (PDT)
Date: Tue, 21 Apr 2026 15:39:26 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] mailbox: qcom-cpucp: Add support for Nord CPUCP
 mailbox controller
Message-ID: <aecprtAMplWlaiBI@QCOM-aGQu4IUr3Y>
References: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
 <20260420034932.1247344-3-shengchao.guo@oss.qualcomm.com>
 <43db2263-0dab-4652-ae1e-f827d1dc5c28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43db2263-0dab-4652-ae1e-f827d1dc5c28@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3MyBTYWx0ZWRfX4zu0VEk/e5YR
 LL9KtVDAdyHrSmXtsSJjuLCxzDOG0tD2dpUSLSnl+cTDvzq0EsDYYAO4PvhYCdAyp63+MTJJol3
 8NjrEs6SxXEGG4np03r9hkSY0Tk65upUDyXgH06CrA6egJK/H98886s0oSCQCx/T2gXGLFIk1Em
 ewMrLVGtGUsjGVgR2Zb1Lm0uyYW5Bk72UYk2IV4zUlbqH1YVeXN0A7tumvJWjnYlBFiZ49/ta5Z
 NFOLzKkKnQsRcZnTjIV2KY/cAyt96353ZOzp8HR8Ovw26/Ytg9X4eEuCW/TeBINSsl8o5a3lsL1
 /VtE4cshFoqyDchQHM+LzlP2JsRiFk+2YH1tkzHQ5ttDdw5ZWVK9Ua4KzIohcEUh+WHHyLXnh9R
 YDfRfCRn7UKv23o66bAKtmp81CCWFWmOYh9f6FDu7lz7YOrsO7Ak1PBaYzLg7upq3H8DYgQY+DK
 2w5XnkL88KomAxEIC8A==
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=69e729b5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=INs1rN3GQppflMMUrBYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: LhpEXFTtjP7UTwvyewKBa5QypBMR_NA7
X-Proofpoint-ORIG-GUID: LhpEXFTtjP7UTwvyewKBa5QypBMR_NA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210073
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103889-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA60F437BD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 10:22:59AM +0200, Konrad Dybcio wrote:
> On 4/20/26 5:49 AM, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > The Nord SoC CPUCP mailbox supports 16 IPC channels, compared to 3 on
> > x1e80100. The existing driver hardcodes the channel count via a
> > compile-time constant (APSS_CPUCP_IPC_CHAN_SUPPORTED), making it
> > impossible to support hardware with a different number of channels.
> > 
> > Introduce a qcom_cpucp_mbox_data per-hardware configuration struct that
> > carries the channel count, and retrieve it via of_device_get_match_data()
> > at probe time. Switch the channel array from a fixed-size member to a
> > dynamically allocated buffer sized from the hardware data. Update the
> > x1e80100 entry to supply its own data struct, and add a new Nord entry
> > with num_chans = 16.
> > 
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  /**
> >   * struct qcom_cpucp_mbox - Holder for the mailbox driver
> > - * @chans:			The mailbox channel
> > + * @chans:			The mailbox channels (dynamically allocated)
> 
> I don't think this line is a valuable change

Indeed!  I will drop the change.  Thanks!

Shawn

