Return-Path: <linux-arm-msm+bounces-97692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAdyIGsntWkSxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:16:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE928C4FA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5FC05300B9E7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 09:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAA52580EE;
	Sat, 14 Mar 2026 09:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phL61z5W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J1N+EvZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6781D7404E
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773479780; cv=none; b=Scfk4RO5Gm18ZjWUQ/O5YkwnJz7OWaQfJ8cJsbwNs7DnLPirs/Y7qkmx17xP1X9T3NzSrdMSdkpxBY3FEtWjaM/6Fh6JvvuCa1+Zx+4zvbmKW1F9yl7xElYimXS0f5z3k3ZY8qwHNDjtU7twIc0KKaedqxaRzdvqZmdZ+qbsddg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773479780; c=relaxed/simple;
	bh=Is0ypUoWrA7ofOzOusdGxJuQTT65Lj9RRfaajIC/kK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=St5tg/mz9ohwnfIorjayjdnk6LnCFyK0FkIiLy8bI2GSxPZBtEEIy324gVjyMW2kNDQwC1OmEATWjWoDAlE7OPxc8UajfhjvPMw6fZy6PbF3UnOo7Frn4MqxqWRknUg0+qhaarC7a+6SKsxawzVHo0l8tgHWgVguNkJqkxMfhAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phL61z5W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J1N+EvZO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E4dKKx4128008
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 09:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6QZSlYjY7FUoTlmFUn5G39wa
	7XITUwMGaj1FXZhuVSw=; b=phL61z5WPZLLhlI5udYKD0e4DH7fW46qdKao2ht7
	tHdfmq9A6NLfDr3bhzWcbZDsn2bOTCg3rQGocVKigpDQGkGtu395/pk1sohVMqlA
	uM9RkFBUXdIhhqXphWSzJ3mSS2Oryeb+exSEKEJSwqGFnliJGZQP1hoaTozjYjLe
	xtMf6rMtk9NQndaZJMEw1dovTwxLKHuivtn/ziiVAJj4Q22WRfbkjNr1Ty6VJs8E
	pVPJ9S/Vldqj854xFWpm3Z/6XKzJi3Bqrg7qPcuYS4lUBRbz3AXGO1mtxK2FFu7J
	UCngyyEkMTR0C8p3z1ZLptGIZH2Yxls5BUDxxjB6hQ5Bqg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udgd4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 09:16:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091f12ed3bso222541471cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773479777; x=1774084577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6QZSlYjY7FUoTlmFUn5G39wa7XITUwMGaj1FXZhuVSw=;
        b=J1N+EvZOCkxvsbzkWTvVYALG73pPSiVH4md7DfeQu87wmrbesD11VP04jWc+0gLEj2
         AF+suBa30LIdt7zXIY1QVXlp6LvMKGrEgkroMpFAR3YmAPW3mffeOpj7E7X5m75s+frD
         Gq4MD3U31m/7dvl/RVHi5Q7Bq34VGeDjUY2616Q08D+NNwntme/XsWlzk754SDEg47dr
         bsVMyyG97cTVAZ1UGJTNkK81ah5Zbjo07aqpYP/ukp6P52o+o3LvD4nKPpwx0srH64EH
         ZghWT3TqsaeyH7fY7lAYSOYgoj6oIY1JKEJgwYS0/pVfPOdJ+N7x2VuEGLrbu16E/uqT
         Rs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773479777; x=1774084577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QZSlYjY7FUoTlmFUn5G39wa7XITUwMGaj1FXZhuVSw=;
        b=Hm17GdxpAbx702GQnM1o8KK66PIXL5C1982C9xRWSqksNzxHhvhDRJd1MWPOEr3p3N
         IuTK24rKiVz9f8fs1s3zgEYdyXKzG3g5YqGqRxudpvVf6P33LeWdHhRUtzX2h5IIf0W1
         7I0ZWGcGcxu/0Wg1LUIc3B5s8hqb6YVG035oMNvE4IqjI1bnIH3/Z037J7FBqCySoGYt
         CmoFOdjEnxxrp9ekhiY+ETgj/+Hupr6oz2GZ37/A98H0xr5q4lwpMmfI7jPmgUg/o0d3
         /UVr9PCDDzVybjfJ0uo0dLioMXHr5m4eHrm3s2vjkeU46v4btR87+SAV8GbvrSUPmvVB
         hRYg==
X-Forwarded-Encrypted: i=1; AJvYcCWiTkXBA0P3VYEgoVIWBvCZYp46f2OaStdhohrnSANOVmUL/C7p7SJgI/mz1pSW3gobJWfzh2v11ktvWuPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwG2k0PCHXazvzRns4TfPs4q3o0oqnUNEDWY5y1GDBT3BFcbyRA
	1jOesQPoCKXHSgeMZXWgk8wwv3DHwQrc3vfUpyhQcF+//4QMv75cWkANCRrp2kgYbMRp70iPCw1
	FCSTidp47SVZfqTc98W1q+y2YbfVUOot+rIdfIAknbAHuKVVvIt+cgJhem4vAM3uaA7rKu8KqEH
	0Y
X-Gm-Gg: ATEYQzxq8IT31MEly4iC3DF4tIh6vRn8Ei3R54tb+eSYTMuWocgbSwnKhWokZ/vMqgr
	wstnJSnFg44XOjE1ub0Tv8Tfq9HpfwHSlrqS4XjwFH83kPbd54CodgO4llt4gz+c19gv0cVe7NB
	o9HseEkumXN5awoGgMQ20IDyznrhcxdodZ6gXo/UbnRQfvJukksUhVPbxRCnEMLgRmWtkABJNmd
	2+jTNgJjGu0AHqpWvtQYeJoyYWpnBT21yOWxuPHZNQxj5xyCPv+mgKJX51BRFUFRRLUF6f6j2Rw
	sMFQDKDrMSohJuNSEnsT8Pq4lrWheVMCPpGVbVM+jwxprgLrTQfXAUpZVVCdd8h/d+upvxvTeuM
	fSwdva7iLmY3KClYgWhrbc29WF63njgpNiyS0b7JifzWK5Tqrr1xIEk+SaM7J5Zbq/hbG30u2hr
	vwHQvlYbWagyEG9dWDMGMaeNP6R2X6y+uCvnw=
X-Received: by 2002:ac8:6907:0:b0:509:58d1:71fc with SMTP id d75a77b69052e-50958d177d6mr77215941cf.69.1773479777559;
        Sat, 14 Mar 2026 02:16:17 -0700 (PDT)
X-Received: by 2002:ac8:6907:0:b0:509:58d1:71fc with SMTP id d75a77b69052e-50958d177d6mr77215771cf.69.1773479777132;
        Sat, 14 Mar 2026 02:16:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e60csm2096116e87.33.2026.03.14.02.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:16:14 -0700 (PDT)
Date: Sat, 14 Mar 2026 11:16:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 3/6] phy: qcom-qmp-usbc: Use register definitions in
 qserdes-txrx-v3
Message-ID: <nhsqgpaiqtipfqcbjtjfps7xmhas7wfwhqq2qaa2574dzw4w4n@gkjl7rcgdf7q>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
 <20260314051325.198137-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314051325.198137-4-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b52762 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=OGSOfDE9ixvFzz5TOUQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: zNisQlQJK1fuRGb2MfZPagrcf3Oybddq
X-Proofpoint-ORIG-GUID: zNisQlQJK1fuRGb2MfZPagrcf3Oybddq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA3MSBTYWx0ZWRfX7d5fBMUkxuwV
 G2aCAZoxb2GBWSnbcBMz695ExgcXy2ImHhmYgMf6Ep7HoRUBs/IA1S6JqoXMJ6ay6yncj8g/2CN
 mthj3Denof4CyknMfM+R+gfcgOqAYkvCv1wRXX3r426qU+TfsqEKspwblZz7qg6xitRSEogZ6uN
 262kxOXyGCqwzcVRGIt5Iqdww6ryRKZq4l51stTDzr1imVbBQtguwHMsnk6pt303YICQoK8rT/6
 In8JPtVRoja7VRgLVuOFKPuiLaek6zOXmnC9w70EXFJKHm1HKqxi4UwAInKvMN7ua3NkhiUFDJB
 B4p+gAgwd/FpXFy6RD+yV9unNWws2QS1o4cYZLNGES92iEkrug0tQqRQK0NDQDMSyq6qcFU5qIA
 K+wZNW6fbRygujmknYUocIEyLfyYvFbB9dVfCVVqd44Tkno2OtyQ1HtzXHlQWNVyDr6Gh4REnLK
 nZHnxzhS3uk8ifSXftg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140071
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97692-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 87DE928C4FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 01:13:22PM +0800, Shawn Guo wrote:
> The register definitions in header qserdes-txrx-v2 and qserdes-txrx-v3
> are actually identical.  Considering that QSERDES TX/RX v2 is already
> defined by header qserdes-txrx, qserdes-txrx-v2 is really just
> a duplication of qserdes-txrx-v3 for QSERDES TX/RX v3.  Switch
> qcom-qmp-usbc driver to use v3 registers.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 64 ++++++++++++------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

