Return-Path: <linux-arm-msm+bounces-118646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E95NKpWIVGr4mwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:41:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 400C97479A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:41:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EauNT38i;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kZy36Pm2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118646-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118646-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E440300B9E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D66338B14D;
	Mon, 13 Jul 2026 06:41:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A36386562
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:41:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924873; cv=none; b=tpNDn7DtNg/EdkLVphA0OtlOV74z2IP9SZG/4otBPDT3ULSBOfe4cGl5X2af+ctBEwxTVEF6XHm6RxpiRJK252oOJURwectjdgH8itZMSdndvZlgiezxq+nfutUp6uoDbNcfPVe3176y/ENQfQ9ZuTThxIdGvHl2SqerjvDEzWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924873; c=relaxed/simple;
	bh=w1EeN7yuKxxX4jk35szs0By6nFu+1JxWUhYfjkQiDbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCcplpEWzM/GpKx9R17yc/+BA7T6v0qdk3+2sjiEMaKjXmQuNL29oc7ElqG8BVTNES04EdWzvl19ycG7exCG9Pr1kdL6i8aErRWRA7hOCt5wSw4Z1+IzUZSU8nIzHvjmliqfaydR30fYO9rQNlxrU+zlsE+MEh9yoKN4xUzGvqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EauNT38i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZy36Pm2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6OOIw692560
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w1EeN7yuKxxX4jk35szs0By6
	nFu+1JxWUhYfjkQiDbI=; b=EauNT38iv+UQBiWNFSTAyMON3D9efrbxEGbGyGYh
	Avcfb0Hwat+wR+hBpyy5MzXS9w8zoZ5gdDVHW1SYs6eloPyuQ4KDLcoLm4yXYoZ3
	t4go4UKfOywBr4wo+xq/0VFNQ+RmZzZUIOC0B6BotLjedi+ucSQ/5NjZDO1ZOMNi
	lBuL9wHhzmauIREJUE44AUGig4fS/TjfghMMqBJM4z/ABaoWiQDqAvu7sUPaFuvw
	ibtg+O+rUw7Ek8az/saZN8M+EG62b6x2IAnEFsTfJJDGfshQjqNjFbZ3z4uF2eTu
	IKWNVcMFzF8uQ6B08C+BUftCYPKzpZBGNa2wGCp98I/nOw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9hmsp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:41:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so3748641a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924870; x=1784529670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1EeN7yuKxxX4jk35szs0By6nFu+1JxWUhYfjkQiDbI=;
        b=kZy36Pm2BLMxdZvNBT6X1T3ebL0C38vzxCcZ2J8P9R5VO/7NRn5FHHvEArEGBD0sG+
         YC6ApKeAO0pRSSQOv//iFAvMkiYeOR2JMMSrgb3F7MXeWgyH3R+t2FHHkKpD5PprZTqy
         d58AW/t4PF6W0QMiKmUmhtc1eoynoQ4ZLItqjSBMJgwcfJZ1nyx8iZD4PrsZeoG2HVK1
         e8rhNK4P8b4CG7SMFaqvxm0WmeZ3vEpji5snqK60zZMRzrSKEw5EzUwtEUJyfoPV57Ue
         DoQCXkVMO3Hel8QdvuA28uIM0TUT67mPjTuigzL72Wrnw6ZooFzuf/cFEhS89Takc2ns
         KvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924870; x=1784529670;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1EeN7yuKxxX4jk35szs0By6nFu+1JxWUhYfjkQiDbI=;
        b=g5LMN+bD3SoeXLIoc5EGEQTcZL03uIhZcQJypGV1OnOjw170+42+si3jjfvnoBch2K
         30/YHVEMTlLoi2i8I4aNqEZUTHYv7W6bBbbktFH+WdjS2KQXyDoh0S6SsxjN+t3VlVpG
         26ss8akekYVN4JQUCrTqz/GR8VeZWR7tbvfLCjU3zGS7+ri2/z0ERKOb+JkpH/6B8CQS
         2tItQZJGuOyzyE1fZDZFreuqAyZVKZIK/VSjIErZIbXs32YCE8xc9ADpj4zCFT3O8Y/w
         9AiVc5ZwZu7Xcax5i6gTaHv+sUBiKorJhRH9btZk77WK2U+pdg7Ky3lpM/Gj/b8c7Fyb
         Qb7Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro5TK6bFzcfOYntzchdlSh/iKrW+CAw8KKAuCwdXnSDzISZ6LWn/IitsFMZBvmSTAlHx+nWYs28AUEfdj2j@vger.kernel.org
X-Gm-Message-State: AOJu0YwY3pO/+68kkkPnmdgPNGdwMGmI4jgEUdDW+mHYrLS0QEM190Dl
	53tyV0MWrN7JnHMuLWtSAc5axKFYxoS758lhvr50A85LW1m5Oepe7nwuSlZv6Tu6a9G1DlY2RRl
	wpWRe7bd8iZMFYLdx4wVcbH5ph3QdY3z9LGwj0cE2D34fSiVvTVMZFQFsz8b3mxpG5LvB
X-Gm-Gg: AfdE7ck7wyTuBGA+Ssw5kLfQpGLPXICYLVd3gG/aTzTHkFP3/5kkvizc5zIV6fdhkTZ
	ZtyVg1PmFWMkKugLL1C5bYUOCnRkHU5VLH8xoQvzxIzKKCdacXn+YCfE0WdVSn5fMKtH6Q7Tt/D
	byzJjVfvDzhQmR6RQ53uBbN8RckVlSsxKs2w7RnswglcuIeUpUYLZzwYgySG7zJVgNiqmk4+8Ag
	kvpeDe+skeiYjGuVQBFmNapNcTotAU9OPHl7zLscKVmGBPUb/lYHdBdmsuU6auHVyacVCdN4cyz
	x1mkB1pcFfH4ImmK6/6gsApf7uGg/yyBYuCbEJSPk/KB6HeYHKMrDtSSjYgfTaFc6OYRoi9AFLJ
	bWT/IBV/Ks2SDLpokaOzwtsX3PhDqR48MaZiR4qdCBkpz7Sk6lakYfNXGWiP7glQd5VOq/C5+Uo
	qVrjBPnZf4u1jw1DcBYFj0nDIVh9hKnkaEQTI6+r3J
X-Received: by 2002:a17:90b:1f8e:b0:38d:eb10:6f01 with SMTP id 98e67ed59e1d1-38deb106f50mr3869029a91.4.1783924869538;
        Sun, 12 Jul 2026 23:41:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8e:b0:38d:eb10:6f01 with SMTP id 98e67ed59e1d1-38deb106f50mr3868999a91.4.1783924869097;
        Sun, 12 Jul 2026 23:41:09 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm45465060eec.6.2026.07.12.23.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:41:08 -0700 (PDT)
Date: Mon, 13 Jul 2026 12:11:01 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 0/6] Add new driver for WCSS secure PIL loading
Message-ID: <alSIffOraVCzfboW@hu-varada-blr.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
 <e6311e97-0a26-4412-bcf0-d0313bf52c01@oss.qualcomm.com>
 <4a4e0e9c-8541-4fcc-8019-10a576840109@oss.qualcomm.com>
 <alAEKQzBXqjESAbo@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alAEKQzBXqjESAbo@baldur>
X-Proofpoint-GUID: KsLIiA7ftT0jsCD0u07qEhXBhjT-d_B8
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a548886 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=giEOzCuHGsYyuyZPE6MA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: KsLIiA7ftT0jsCD0u07qEhXBhjT-d_B8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NyBTYWx0ZWRfXz8b90DL2KjHI
 9KTsXIGgXUfnW+v7hvxb6XMXO1195uK5VSHnw22hvJLOBobmWKSC6tjVxrGgmTu7h3kZ+yWkjK1
 qbnTnbKXj8H95kAtqX/Z7zYXPirTEyltSxc87nnkIOlfqbp4mqy8tckSrTg8KFhWm5uPqpxuo2n
 FfIJJIxZRt/yssvOqPXMNcTV+BVhzzwKcYbPhP+0Mxy05DMUJW8mTARm8VsMGrAXvkMfIiOwcE/
 noFDrGCl18Mzn5S8oDTEu4yzNI/BRwvMQ5xo/F5be2yg5NYlzSeK5zgm5mc/37eYvjtBVK54L+J
 RRt/BaxPm6S2gF+O4zehdrtBahCNyQ0kLfWfzQh/mJhhRUOIwaLK63aqiJmJ9Wqmh5JDx5Ve/W/
 mVDzWyFrwnxSIodMYS/PmGCHhx0dva7AmyUuqP+8dluyR1Y93CInr9jxyG2R7orjk3ArVuRT0Qy
 mZpI5Yyed5W3iqnNbLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NyBTYWx0ZWRfX/7J++GqIrFKy
 SBLyN8BaZUyZAlmy0HhlqXldT4d93pCzK3G/kwyQ9n+1bIPqI2UHD4djP0XGp2LA8r1eWog1JCn
 bjnRXQFOIekLp6D2EeShnMSQWM8SExY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118646-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:vignesh.viswanathan@oss.qualcomm.com,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:manikanta.mylavarapu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,hu-varada-blr.qualcomm.com:mid];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 400C97479A1

On Thu, Jul 09, 2026 at 03:31:15PM -0500, Bjorn Andersson wrote:
> On Thu, Jul 09, 2026 at 11:25:17AM +0530, Vignesh Viswanathan wrote:
> > Hi Bjorn,
> >
> > Could you please help review and pick this series if it looks okay to you.
> >
>
> Sorry for not keeping up with this corner of my inbox.
>
> Series looks good, please rebase on the PAS changes that should show up
> in the next linux-next.

Have posted v13 - https://lore.kernel.org/linux-arm-msm/20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com/.
Please review.

Thanks
Varada

[ . . . ]

