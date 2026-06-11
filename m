Return-Path: <linux-arm-msm+bounces-112718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0+NjIzqUKmqDswMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:55:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 462B3671159
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:55:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="DOc9/jHf";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Lu7fuXO2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112718-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112718-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D09F93071766
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A573D9DD4;
	Thu, 11 Jun 2026 10:55:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44603D8131
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:55:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175316; cv=none; b=d3u1ICXApvEfvjo5ruDTwl5mHNALhzErrE5IRGHqmyt2hlv/2GNxLpLE78rZsxicZPFL1oNDH5QO4mefR799058tpF6aKfTOplPu0Q5NQV9MQa65G+0Oo4lwO+DW/Mw5L9k7V/AL3/hoX/BRTdJp2yZnNwS/zBkNc9vkcV+6l3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175316; c=relaxed/simple;
	bh=ir0S2IHNu325qUF6z/3Wd6Bqdq9SL5Fszc/vUycr40s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2knT3JFtzbgV5mDo6cYaGu57R7Yn5t5RKYtlPCRGtNqff+HowbPdoG+k8ljA9jTJerBoyDRKaQqpL6x2sl9X5WrI8kp8cUfnc6pgf5CM4amM066FnrlmqUJUZhNW9b7NNmCRJO7sc+cVlKa0sTAUjJJvj8+G+gtuIHOXfPv9qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOc9/jHf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lu7fuXO2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9x5Lr267506
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bs6iyuQkonYMhtr1jt8Wuq4I
	vNl34jXhaz18EQRcVOg=; b=DOc9/jHfdoUnMtuWTa/KyYyB+1IpWcYXQXIBSS0W
	R41e+4sP3sBHT8A/DIq0GJA69tazRJ90WXuk0jHktfCa12OgF3OciVifXUcuOPYe
	tP6jClD+NKSqx27k1NI1prV9it3hRo2gjLVvCdKEEHlXIaqLzUZO/ZzhTGB/E7iF
	CULfTloPrIH7A+tgNlbftnsGwUXOdwnu3DyIOrW2adCBHj9bcZzcxEogfTbGs2t0
	c1g5jiGLqgx1SeXdYdOQPnOPGQprbErssrwGVDjsElCJMPAwV910VD57s+qFjZoM
	6zzJeb/VrRqLrLaj8aK1ZMB3qtv4wThqSXpSHGT6UVgplQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u31k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:55:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423efdbe6fso5091695b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781175313; x=1781780113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bs6iyuQkonYMhtr1jt8Wuq4IvNl34jXhaz18EQRcVOg=;
        b=Lu7fuXO2ecScQqwUvrgKvdmWwYbV0lS9C9IaN+HgoBFltqyPTuY8XBjJu9TsGD3YJK
         FHPS7In01K5w3xZuCZaxAv2PLhH5hQAJkcq2SB4sbW8lZ5w/HAA8K/VDHTrXRVOEXQOd
         P2CRpFc+kMlBsQA3/AHe+KTa2TtxfjB63XDtK47PweYSXjgt7+zNTDAhCrC771lhTpbv
         N2jX975ZsgwcXHLkhykZVECLp9FEjhKda9PnKgwhq9pekHACFeL1qz+K3aVzrSzlE3WE
         ZW+C7YaUAzY2Q6bN/L0K2Rl59Nyrr6bIxpjS21rhlpIKFRgTZNNyfr9QcbklkvYvXT6J
         9xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175313; x=1781780113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bs6iyuQkonYMhtr1jt8Wuq4IvNl34jXhaz18EQRcVOg=;
        b=RZXLUWXNN1iaVhgCCu0qGZ2ZNMT5hAnj+WY5fyuP51F4uEMJtv7tnnwkoePFocoVf9
         xuO4Vr1Ss68elZ/MblbIm61/F0gJ+OpZQ0nkf0DcYwcXoiVG8M5DntKgRT+ZG0KpzKJ1
         zAMdR8lS6wPCgTFtrxQUwKMdK5TunM+7IOWTEqCm6aStWtMSHmKYH4BHzhqLFF9DjS6c
         ENPV/4/R99O4jLY8U3wt4aIUmoj4UICC0UqjSuujb/xq/wi6r5hZc/GZPSZLVJrsFjM0
         GQuLFoCbBLH3cAokuxHCRoEV6DvyEx9rAYnTt0w1llYuzjgptPs3uzTGWu1NxF8cpEOM
         zbXA==
X-Forwarded-Encrypted: i=1; AFNElJ8niAwci4hb2Fk0JHFk+C8L9lksxYYPx3fbeO1t16z/lBgQyWK0Q6kefz9ULKBu0UMALWKXobbg2UB5u3DZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7fTz1J7xHfsn2uZNpvSiBV31Bu+MU/Zo25oWdZKllpccPUmpd
	7TnQj28QWPAYxkdDVSrW68OJ14HGHO5OukPsPsfKIqQ6JMBbmfwUPk9miDyK35J65fidV5x2svo
	CvmPrg6BNjkDm+EPjZ60vo2ktNkQW8pAMuSWNWTgyRkhYhTR9kAyaIUZHXzzbjndbkX3F
X-Gm-Gg: Acq92OEj+kxVLJp9Rpge9YDvI2D9bYYvTIdqi9+1eYCr07Bm/9J9M0CSSU+GaVGjA0T
	i8l/fhi4NVXUBQhU4y4XtoavETBzF+3HZzgocrU24COtaG9lOv7hFa5nuYhkGzE9ZOkrT5y9C43
	Y7sbVELP0sI0HCp9XGhQAvIIfGQL6Cfg006S8/bVl8ycalQLsmCSSuJKAMW+/WICbZtIBSVZoBl
	PhxOq9D87h7raeooHP3GQB3AV0Rf5tSyj8/KQ/ccoS8v3DUZYvxQGnkrrdLKyw9W6hwpnnkj6id
	tb/N5nH1wmVgeNlQonRVO+6DcOby8e29f6WWwd8o+aX3miyEfHdm+dQ/I061PP/uZ3kTSOPZJbw
	KkY2MWFAv3wA7CBBpeeQJDJnTrjzQehDoJoSTN2yxTPN7S00Zav15JngZh5I=
X-Received: by 2002:a05:6a20:cc8e:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3b5e3423497mr2785542637.46.1781175313274;
        Thu, 11 Jun 2026 03:55:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:cc8e:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3b5e3423497mr2785490637.46.1781175312705;
        Thu, 11 Jun 2026 03:55:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c865861242bsm1588153a12.18.2026.06.11.03.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:55:12 -0700 (PDT)
Date: Thu, 11 Jun 2026 16:25:06 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <20260611105506.llvya5tda4xsd2lo@hu-mojha-hyd.qualcomm.com>
References: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
 <aiqF5mh1PvWpH3L5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiqF5mh1PvWpH3L5@linaro.org>
X-Proofpoint-GUID: i6ej3sMi3a09ZubbVWZaSfposL1dVHJH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwOSBTYWx0ZWRfXyDrmj0XegUO4
 D/QkOKWRUdmTTlT2Ixky8paJyAYr0IoDt4AOun7+9DTY/Zu3tyBCtAWGYhsgPNtMg7fKbsf3V4G
 P1IK83Dc0SYi9BJDFw6sM4Ao/lZCfug=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwOSBTYWx0ZWRfX2EluCGJu6fZO
 SIV7EPrDkTblymMJyd9CXsaERqQuloVWWefhHlUkrMqOwfX7NDPef/pyobii2QamNRA8OvVkZrk
 bJl9J4AmyZWTa0Cj9mPJ5s81wdscfWgRKc9EO9WtWX3hZXF5dxyt5y0APWPxX8rTClw1jEqHvLZ
 wN4UvnjR33ZmUVX5iL5vv6GMlWln+Yn+6CY09xzzL3P4dXFjRJcCNz8jdOV6ievUnvm93SSSc84
 X/o+KqbbQ6Kex/jvIZTjN+kat1dOCDcLk/J8VADylI6QZua8W068YS3vslfudg7TZoe7iBAmcLI
 HH9vjyvSHOKV0NjNLCrBVU8lxZLiK+5dQFRde3IfNJkyEZ1vYCpG5l2p9hUcJ6lX4/7Drl4HCCz
 cnoHilng6fa+ZYoWf/uVwxiRvb4UNB2yzZUxSHivxuFtnUfbzPXp1YFjMfgeYIB4oatHiq3esno
 KQ/UDgAcuSffNeUA3fw==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a9412 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=84n_F309gJwyGcasrqEA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: i6ej3sMi3a09ZubbVWZaSfposL1dVHJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-112718-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-mojha-hyd.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 462B3671159

On Thu, Jun 11, 2026 at 11:54:46AM +0200, Stephan Gerhold wrote:
> On Thu, Jun 11, 2026 at 03:18:51PM +0530, Mukesh Ojha wrote:
> > On Tue, Jun 09, 2026 at 01:43:17PM +0200, Stephan Gerhold wrote:
> > > On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> > > > If a subdevice fails to stop, it indicates broken communication with the
> > > > DSP. Continuing to stop further subdevices against an unresponsive
> > > > remote processor could close rpmsg devices that could remove the memory
> > > > mapping from HLOS and in case if remote processor touches those memory
> > > > can result in SMMU fault.
> > > > 
> > > > Change rproc_stop_subdevices() to return int and abort on the first
> > > > failing subdev. Propagate the error through rproc_stop() and
> > > > __rproc_detach() so callers are aware the teardown did not complete
> > > > cleanly.
> > > > 
> > > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > 
> > > But what would callers do about this? If you abort the teardown sequence
> > > half-way through you now have an inconsistent half-stopped state that
> > > neither a new call to stop() nor a new call to start() could recover
> > > from. That doesn't sound much better than the SMMU fault. Or am I
> > > missing something here?
> > 
> > SMMU fault result in device crash while other is non-functional remote
> > processor. From Linux side, we do not know the state of remote processor
> > when the timeout happens..cleaning the subdevices can result in the
> > debug data being lost for hung remote processor.
> > 
> 
> Ok, but how do we go from here? Do we expect that the system would have
> some userspace monitoring daemon that would collect the debug data and
> then reboot the device to make the remoteproc work again?

I would expect the manually collected crash dump in this state to find
out the exact reason for remoteproc being stuck instead of ignoring it
and claiming a graceful shutdown.

Whatever we do here, the remote may be dysfunctional without a reboot,
but cleaning the rpmsg device will clean all the required debug data, or
at least if possible, tell the rpmsg driver with the rproc state that
shutdown was tried but was not graceful.

> 
> With these changes, I don't see how you would start the remoteproc again
> without fully rebooting the board. Calling start()/stop() on the
> subdevices again would lead to crashes because some of them are in
> started state and some of them are in stopped state and we don't even
> know which one is in which state.
> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha

