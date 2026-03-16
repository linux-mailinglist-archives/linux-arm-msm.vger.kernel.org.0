Return-Path: <linux-arm-msm+bounces-97830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MWTiCwV4t2khRgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 04:24:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAFC294648
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 04:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF6A0300850A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA3731F9A6;
	Mon, 16 Mar 2026 03:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4LgyMIH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9CtwbQq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1D1182D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773631486; cv=none; b=L+9jmvsTWBLpUa5n1z4zd1j/TnUwUqdYvtBEwFm2rhD+Qcx88lTkaD1Xl2clm+DCoLzONYfcPLUzTjZCA3fD7NbTPzJg1alDgHC+gTD6K6wD2c1jRMmSkb+pr9MnMK+q9C6TT3AmidvYLCTY4ryRgBUUexJ/NiVRGm2E5bdUM9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773631486; c=relaxed/simple;
	bh=5Har4ISH5e2gUyGYuqYN/IeZmOULl9egrJ9KgsQfKbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZV+cyWn2ntEg+qsNOajVXq3MhlCTHEBv/HGP5Wzz1O0SoFBHcGmYiS6BQjsHYzUz4VCfMWcaqSo8gvGgsYGGizCQXxZjzroWqNy9RJ12IpsHHMigiXFWC3kvbNKk9ZNwWCfEVN6uT2tLFj+HWIDJ5DkJLkFxSemn7UunUh3RZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4LgyMIH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9CtwbQq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FKv3V04125193
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x+7MaGjLd+vSRSDnStILHVrm
	2PQxEhWXJkJc8OhBOCU=; b=k4LgyMIHGFHiGB8DBE5dIbWvqhqTk/OpWMZ3amBs
	SCFEbU107vJM1bqN/qIWC8D/J/pfnXEwg+gUdxRxHiSg8oi+JQlLqYWTjvfpybPr
	GlIzpux4BuPihgOQKXaGfqfRWffp2z5HBugZRsPBgLWSCxk387dsxSq9MFTARGZ6
	1vwHj1Mj2M2iFM9RkJqlAPhQU6HnUrFrX4hDqdgy9Hnab/guULfY5H0B8yHVOBfO
	DGpdPKAXHP7hP2kK2PcUAihFHnxDUbMNAeRU43LLTB/9Oz1Ew8AXYliFQItGlnNp
	HXcTYfhgWMj6ZhLqdzcgEjstE8Z3KRe+89dS9k65sOLYXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw027c106-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:24:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81506677so2721144185a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 20:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773631483; x=1774236283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x+7MaGjLd+vSRSDnStILHVrm2PQxEhWXJkJc8OhBOCU=;
        b=Z9CtwbQqRdX96yidlPExommJ3MdiBfl6g8XFNSUAPZSe+i6Lknh6oNVERWa5IytRdt
         V3s3AWojR3negBs5PdM0U4+Y80mmBDveafLZagrUvPKa2Eprb2VhbKYIk9Nf3qDlrwXd
         aJE+4B1SjY8frrfMI6BpEsuOn051A4EPvX0LuzCWWr3SCyU8JyHPj6RFfmKtJuAiBhMm
         nisKc/Y46Xs7B0Hhmzl3uBbA5IRb1FPdo5aJUsiNSu/K7A3uOJ78VI+HOH3Z9/4INbXa
         /WsdWJ1aULpWccXhg1Nvg8FbS8VkKGgjQb0GRV1LnHhUXROVJgS3fU7ScUD0mDdmyEFY
         2L3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773631483; x=1774236283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+7MaGjLd+vSRSDnStILHVrm2PQxEhWXJkJc8OhBOCU=;
        b=NRlsYVe3CM3xArjz01uCusxsPA/uHN4wjkrVosj5dbsC+RtdGFuUtT7fxHmEBmK6As
         9Nw/0453L2o8LSVd8lPevFxaTjO2DMLgEw2hyT7xbBNZlwnC+4GcUKozTS/dpAa2T6pn
         j59RmKTuP6jYLxH0hG3ttUf8Ld5b1fb3ZazGk5UOYjK4a7ILMReZ0rIFLNSt8ZfLeWJ6
         PQfRgvBw4tPfT6GInbU47QeQ5/3xmpsFUXb1p+1LcOsi8DXK5L7DQzDmPiSXOjLzLoMG
         LBqkMFhY5unhRTWXbeKHEbHS+c2p/13vq/KUMwoVDsLra5Pa3NxpdcGGkD0PdpFJlEiW
         tfCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw5ZoSiN8zh1oMx6JRhr1JRY5UBvouc8t7YVPJaA+8OgjABWbiiX5Icg841F9VmgF8Vdnx2KKUrI7gP223@vger.kernel.org
X-Gm-Message-State: AOJu0YwV2ruYl2TErt5SdgfZEvsaq56XrC8Nm2McvoZbScbj7UYM9o+D
	5rE8eE2SYLdB5PxQhgv+Lv+xiCNOIGVS9kjfuswDUSIPbGYE7g7uxUTqwCU5lXYitq1Sso2wxJt
	f5Lb3N6Yzq1dZ1L+X8TnhM2wuhjhM43+qzRj1xaeVLrvNa0mXu+Mb3HGdctBxWwsg9I6x
X-Gm-Gg: ATEYQzxDKtvl88pXOymj6DwO8V7+dXWC/n5iH9eEImZOHF2LbjHtbsf3DN0QyY4t46n
	MgiaXB0r48nFx8gneQwRTqzJLLJQW67dnTH5z+f8LwF+iv3toAk9Rp3oIPK6IcqrYuABmpzoHR7
	hwgnsWLGGZFCzwtHw5Zk6aaH5GyB5MbD5vyfVPCm6HAEj41G+rBhjS5ahNhEFeXrphxRMs37gHT
	5xWktLPYBgZZadV3XQZmjd/tKJqcgizIPNNQb/6J7QBNkow5tIH7qJJR082yBTCkiHIefrw44pk
	ayx6KMtUNvYSIQ/EI7zQESAHDs+BnYztIe0GFGFFegPGnKSbM3hcMOJnlH/lmJaP7DtpwwJ4MfV
	NrqIPKekiQRWwM24oN2ioV6Z4103al+wwpFNm4Exp5TLkyYi8qw/lYhPyvNmL/X108Kgznl0UkB
	itPNJxn5i4wqoexAkWXHvrBcWEjMy7gsDVaSw=
X-Received: by 2002:a05:620a:6919:b0:8cd:8938:f01d with SMTP id af79cd13be357-8cdb5a54987mr1761854885a.3.1773631483273;
        Sun, 15 Mar 2026 20:24:43 -0700 (PDT)
X-Received: by 2002:a05:620a:6919:b0:8cd:8938:f01d with SMTP id af79cd13be357-8cdb5a54987mr1761853385a.3.1773631482833;
        Sun, 15 Mar 2026 20:24:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e67836sm28357531fa.31.2026.03.15.20.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 20:24:40 -0700 (PDT)
Date: Mon, 16 Mar 2026 05:24:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT v2] drm/msm/dpu: enable virtual planes by default
Message-ID: <lvgrkx6ypchqputyzgr5vlugjxsnifuoi4gil2vjpv5wut57ps@6z7phvhzmx46>
References: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
 <776a18d5-9d7e-45ff-8cfd-4823522ea375@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <776a18d5-9d7e-45ff-8cfd-4823522ea375@packett.cool>
X-Proofpoint-GUID: _8VzOYdr2FkqzToVjh9UfK2KSwYiWDmz
X-Proofpoint-ORIG-GUID: _8VzOYdr2FkqzToVjh9UfK2KSwYiWDmz
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b777fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NRyVjlmX0iHkmRb3oaYA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyNCBTYWx0ZWRfXxQQqGRRTRNet
 p+1dLtVWkxHvizN+NS4Hn9DC9fPenbpO15l7MKgdTuZVc/PBE0Fn5s5X2R1Da+9IC88TqKgNXXL
 Zm+Rmb9JKnQvdJeBfYT51LSW9Ys6EpyyNzF77CsepB+Qqmeo/A9ImwXTkhVujcmf5RcborXC7V9
 3OVqvSCXjh/qHJm+2zi1X/P6NrX4i5iETTA0J5HBU98wWo6TCvZg51+4H0MMgnT9MApkTt3vZ1T
 KX8nmvsjtTbk8pX+Jts0xVcZBRYIkEk8sWEqiREIKN4Tr6XsGfhLbPY6Q7pArtyqva4m+0ZQ1Nj
 fzqtdTdw4CjnOgIMGKThQoJ8qNK5eJnDhTsjXeq6vqOaRrm5pmdgZNhM5/MUN+bZ8XUzFCfzdoM
 6f/Bl1MUtXNGVxnbhgG4zQIl9D+w8oaw0YO/YJ+icuX1WOToXJF7kTZfTvoiRAjh6WdUQ276uYs
 TZ/uBwTG4Bu4e/vzQjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160024
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[quicinc.com,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-97830-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ABAFC294648
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 04:06:37PM -0300, Val Packett wrote:
> On 2/26/26 10:49 AM, Dmitry Baryshkov wrote:
> 
> > Turn on the switch and use virtual planes by default, enhancing
> > utilisation of the display pipelines. It is still possible to use legacy
> > implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
> > parameter.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > This is being sent as an RFT for now. Please give it a test with your
> > compositor of choice. X11. Weston. Sway. Wlroot. CrOS. I plan to turn
> > the switch for 7.1
> 
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455,
> with niri
> 
> Running with this for a few days, seems like no change, everything works as
> before. Any way to confirm virtual planes are being used?

You can compare, which SSPPs are used by checking
/sys/kernel/debug/dri/*/state.

-- 
With best wishes
Dmitry

