Return-Path: <linux-arm-msm+bounces-96800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDnyFSzIsGk8nAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:41:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7E825A723
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3D033150188
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB3336DA09;
	Wed, 11 Mar 2026 01:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkAkIWNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QJaYViwR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E735F36E486
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773193255; cv=none; b=fY7EV9EsnYvaJIcCwhuhOztsJsR9UTqnL9kQ4O+k+gwIISHHcfTkI8A0wY69PfIfErqyyhyh7jxG2mVdI1Ajxv9YDFt/qRFaXVwM12IAB1L+Ak9uTjVIMZVap+erwY/0Qk8N7rQEVyM7YdjyryedoOkOG0KTIsmkQFgvhrpKJj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773193255; c=relaxed/simple;
	bh=vCiAKWhCgsidC7oek9Ay9QTc4sCKED8hU7eeL5sj4jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0V9oHwF8I9FnN6CHh6g/jv2oIBnAEdr/2hmBwFZT62a40HJu4kkdzwKGhFUSHTrpyQFfVFvSXV4rFTA5gkP49p3J2B4OFLgFrdpVitgPAJY31T0BYfaHKu7lNmZXEvikfRpmD2Zd95gwH/RFEase/a5kJbsuSkA2LofQvKntKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkAkIWNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QJaYViwR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ANoGAk145072
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Udn45LWFERaEd0YZfIKTTQo5
	P/rO0L2SyvgS5xb5cQk=; b=RkAkIWNHggzFlCsmUHBWOtt0Fg5XOY8XPhTqjKQn
	TCfnuInl1Dqk1FOxv77nzqCcyXKdlNbvDbynoOVOjGpkTO0KEUScG5AkjiAMIuHr
	MIxKE5Qf4ldLo3p1k5p6xFmy/Rk5EPLTMjKz4pK4OFYxGXfvvxeteY6MaS39GQ9t
	XoA0LccKZYAl9p2hqJoLtvecrV9o1qJyQlqST6dNqLaAIYn3aEbYzPNmpzoUaBjs
	/hEXnJ0FnT6XnrhIaS0IunDfkT7wYTudN7wNPh1zjuQ9E9EbsvDl+UXHGA6L8Hjh
	J3YYTMwC2AGY2l+Ynp1taxOLUJ8TE7zZrPSst+x8VqoxnQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctwav87y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:40:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffb9a0bf22so39905051137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 18:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773193252; x=1773798052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Udn45LWFERaEd0YZfIKTTQo5P/rO0L2SyvgS5xb5cQk=;
        b=QJaYViwR2jWpBak0+cMybVGtjU2viiplTApMwRMJj0eX+WAv81JYgQmzbzb3muvKH7
         7pR2oGNZVMv/Ll23reZKOKFgw+XyUUEDHEalI2fb+k56Dzmm3QaxUN8Iadtw/8wj7CRt
         FqZdUSNd7Cqe52ssnh2+gYSvVp22VXzLQMeGLFuvhmhiRSubbW4m31pSy2sryNG+VWE1
         DNqrFcqf1IAG/Zqfm/hj+6/awjBqfazJKnk4l1YqBdN+3C9ApBJWO6MKZsn8KicfMNYm
         +rb0HQgzCqbG4Q3uGqJwEcbha3s4cXFAvEzfqEQ6zW9z5196o7ogcFBXj72ql2RQrgcT
         Q63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773193252; x=1773798052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Udn45LWFERaEd0YZfIKTTQo5P/rO0L2SyvgS5xb5cQk=;
        b=OyVDPnITmwLiyVl8Q6n76F9/rfxmY1nEP+qlugZ+VV7hRmTRjoFwi29/y81/RPjPSY
         ecw7ClfME7GIFAgnnz22d3gTdoRFCT9ibkcFBMv5k+nN2B0oV2fKYG6YN4LNDw24+IyB
         1PPX3TAAF+n3Cst2R6vpY3+te/1hjuInyNJity1t8ALLCvACyxFLURpGOGhN5jkeIRE+
         s7bi2pwS9cp8KeuHl0agB5/Cr1dAlsVBUit68w+sC8e8VFjtegmPJ4Z/Nx+hz5/ATRck
         qi1vfe65NeSeEYqLy5ftC4rxOdUWuwvaDJZJbJjXgVeUmbyxV2hXiq//5QUdPYQSSmjl
         Imww==
X-Forwarded-Encrypted: i=1; AJvYcCXaE0+uUZkm848fO9Ic5mNQEUjW7flDYwpOOTVg/Nfa2vUogg23tnWlJjVfvLydw4pfgeFzXnU1+oHCGlsv@vger.kernel.org
X-Gm-Message-State: AOJu0YygPDFaL7K0A0VGP+FjCVzObJRxmr6OrEop/cEY0MNWyVtU91lv
	K16E6J0F7w5s3Scq5WEbNzkcw6eSsp7y2sco8M2fFDQFhEB0F46m8HyP9N4D+aAju6aO8nBCcFV
	D+oGj83CUZYNxeL4chRaGE6vtrc57bwjPc1WSEFY7ZnwVz0p9xHJJcZkZ4GzUBg7jLDXRr5N1sq
	9M
X-Gm-Gg: ATEYQzxlKM5YOn2XXBt/wtOE1vHukTAVhDaeuzuMSqRtNb/pBW2qjtSU6A8Q8rKNudF
	2wY53jSaBO3DAYHzxrHQQ85gYvis6dJdaA27OJhZLl4CfdsVciwtXXlcyQBw24KKJ03dXk6mdLw
	6WF+zuafOcdwgb82/LIGyFkjHfQFuL5qlUDB1t/lBfEIjOV7TV4LiZC158ZK/LMMjiBnI0Z1xLY
	DPr84DD9Aw0qbCEzSRy37TyV3FOwS2i4uIOG+bjfAfz1Jc0t/0fivViVi/2fFD7xcO9hph1dK6I
	UTpBovC4nD4mdaecbKOmkXCCIi+fQVbvcPeIkGoXFwnkEAT15CbK2HaHtXrkRUTpAQqn6Ppl2Gf
	+7tJ6B/UyJGEtAdbqPdPuq5SGYeUfqE2WNL1yNsfIt3Kf4mrmXb7lZbPH1kIaWT++UPVXOHlkWV
	L3CdYKhAm36yVuJbAm44YMRMK+MaPgpIQBTvI=
X-Received: by 2002:a05:6102:5113:b0:5ff:fbe4:8a8 with SMTP id ada2fe7eead31-601def30c8bmr363078137.25.1773193251735;
        Tue, 10 Mar 2026 18:40:51 -0700 (PDT)
X-Received: by 2002:a05:6102:5113:b0:5ff:fbe4:8a8 with SMTP id ada2fe7eead31-601def30c8bmr363067137.25.1773193251329;
        Tue, 10 Mar 2026 18:40:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ec94sm1001861fa.22.2026.03.10.18.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:40:49 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:40:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/7] slimbus: qcom-ngd-ctrl: Fix some race conditions and
 deadlocks
Message-ID: <noodhyin3en2l5xravmt5l6dslcz74na5akin24zod2zhmsevo@pqtxi5ydbidx>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMiBTYWx0ZWRfX5hhymI39OqdD
 +AkAH1RgcV6EDiD/EuGaifMekgwCvC0Qe7OzuMJhaI3iSnCkzqgG5qpbIuWXM0NGdeZTtITr5hI
 Jn+mUljooCb/bdUHn+G0pUApsmBXqCLbA2olHP5Xca1EiKb67mlfusRarhbRaaO+VmfOai5bV5E
 lChePTKxXoPXOSCn+TtRgEwPNhAPBSpjS5z2HJdWOsZyh7L+RRQZFm+sMb79ToaZslfpnqFpD02
 HRNXzUqtEx6z3s8Bh20F+H56ZrCiRbJTR+fUr2jJRIu83Sh3diGHg8q7EprTi/Qwt6j79Lgcgd4
 tTe3OwGIPqaWeBwebK5YxFxyyXA4NZnIdH3kdkQOMVqrQYNmNinVlxz2MH6pfom+FCRrepRKwji
 o0mS5SO05D3r9zFr9UyEvug/sR11xu+uF6TbVLG6hbpWsySdPcDwr0un8V4UfwMyvLD7j90a3Hm
 WvOgi92XE8k/uKorf6Q==
X-Proofpoint-GUID: Yecx2pmzKG0l3YTvivKMObiUGSKc993P
X-Authority-Analysis: v=2.4 cv=K/Yv3iWI c=1 sm=1 tr=0 ts=69b0c825 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=yjtLm6vEFEQHtkmbwRkA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: Yecx2pmzKG0l3YTvivKMObiUGSKc993P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110012
X-Rspamd-Queue-Id: ED7E825A723
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96800-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:09:01PM -0500, Bjorn Andersson wrote:
> When the qcom-ngd-ctrl driver is probed after the ADSP remoteproc, the
> SSR notifier will fire immediately, which results in
> qcom_slim_ngd_ssr_pdr_notify() attempting to schedule_work() on an
> unitialized work_struct.
> 
> The concrete result of this is that my db845c/RB3 now fails to boot 100%
> of the time.
> 
> In reviewing the problematic code, a few other problems where
> discovered, such that platform_driver_unregister() is used to unregister
> the child device.
> 
> Lastly, with the db845c booting, it was determined that attempting to
> stop the ADSP remoteproc causes the slimbus driver to deadlock.
> 
> Note that while this solves the problems described above, and unblock
> boot as well as restart of the remoteproc, this stack needs more love.
> 
> Upon tearing down the slimbus controller (when the ADSP goes down), the
> slimbus devices attempts to access their slimbus devices - which is
> prevented by the controller being runtime suspended. This results in a
> wall of errors in the log, about failing transactions.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
> Bjorn Andersson (7):
>       slimbus: qcom-ngd-ctrl: Fix up platform_driver registration
>       slimbus: qcom-ngd-ctrl: Fix probe error path ordering
>       slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup ownership
>       slimbus: qcom-ngd-ctrl: Register callbacks after creating the ngd
>       slimbus: qcom-ngd-ctrl: Initialize controller resources in controller
>       slimbus: qcom-ngd-ctrl: Balance pm_runtime enablement for NGD
>       slimbus: qcom-ngd-ctrl: Avoid ABBA on tx_lock/ctrl->lock
> 
>  drivers/slimbus/qcom-ngd-ctrl.c | 127 +++++++++++++++++++++++++---------------
>  1 file changed, 80 insertions(+), 47 deletions(-)
> ---
> base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> change-id: 20260211-slim-ngd-dev-74166f29f035
> 
> Best regards,
> -- 
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Bjorn,

While you are at it, it looks like there is another possible issue:
ngd->base is set after platform_device_add(), possibly letting NGD
driver to use uninitialized base.

-- 
With best wishes
Dmitry

