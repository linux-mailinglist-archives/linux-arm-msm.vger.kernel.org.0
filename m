Return-Path: <linux-arm-msm+bounces-90219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK4HDH5DcmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:34:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECB968F58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B964990CD22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB72F352FBC;
	Thu, 22 Jan 2026 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ut1IfzMd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOEx22MZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B863557EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093355; cv=pass; b=TEdYukwXgmFbV80oe/6Y1KCdI40fuNVdIiMXMq7x8Pm8qD9cPPvYbZOCQwQFbvegqNNUSbdKwr+ex+kjEANgvuMj/tllpuLfF8qEvsz1GVupPIn373lc98a6K7W5dSjlVq81Bg701MmJqcRPnNlzY02OVdCnEKoozabIvMttc+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093355; c=relaxed/simple;
	bh=Lar4HOB7e8VArpjbUfazpMYvEBId/fZGFosr8nw1T2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSQjRE9Qt+XPKIoX7kwSqqy0wiPVUdvYqePiQrh9NNyWslRR0PiguMeq2gF7GFJwXLPAEUt1Bo+Xu7HBuYYkedj0pocUW+ucvDTIzG/XmwOfMmdq0KARV9htfHXpzMFxrDag06+E5wkB4PjpW72FoWltJ6T4YUJoP+s6kd27/4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ut1IfzMd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOEx22MZ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MEk2ux816110
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=4ByJBYSv8dzNIIUkvQF5Zr5fcQD23vQS1U1kIJNce+Y=; b=Ut
	1IfzMdvR8WqnLjFGEe91Ra1O6lHEaaAyFCgtuHq5UTCqcigk/TqXGdR47MZQt+Vc
	IhZl7T0Jgledm1PLOM4Nt0gw4NveJh5QCnuGd3IPv3x/EWBBN7NHXe2qy8XdyJOG
	1RLd9fjE5hOjGpfJif27MdaywDAZCXgYAT/KCH2kHWd4taEfCvNwZevtPHGWznHz
	LjPF6iiDGyQeb0ZEVyOvUpIxs34Mpge5JUS6x4TknR3Qs15k8pBAZgDIqYKxPvuE
	t4W/f14VmHYx5NR7+X3YPPdLoEJ03nCqfo7rviS1+jLLC9AqtBvUWenVhFOuTNjN
	22lgkZwgVIPKOoBXY0yg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu65v2v97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:49:11 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12335cfaf90so186071c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 06:49:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769093351; cv=none;
        d=google.com; s=arc-20240605;
        b=fUI682KNR8Me11tLdp5CYY7LyymvtIFGJ5KhZmqLgC12n+I6q1HcALXR2/uc4I7a6W
         QCAUMneMwZtBBCDaHcSdr7PoN5Ns07xPl1JNUv8CgCe4G3qHgXIjnZ6tyODXE+b9rckj
         jJUME7wMa4iw36vgEG7h1H6rCosPLpdmiElDAywzt8/YJNqEyBlW3zhNEe7vxgm0+VuZ
         SL5I9kGgA0HEl5I9kXTBFwJFAZPc4tm7P5O4xenz5wK4quy52cgk0Lsp0M5JgdaauIzf
         OiU9+9bYXAN/0BCy/7qwPxUXxjBFSFywwzBtLENrxKOdeyWRHSglWa5KRsO1yhHSsiDd
         jMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=4ByJBYSv8dzNIIUkvQF5Zr5fcQD23vQS1U1kIJNce+Y=;
        fh=kOAEmKpuY4JJp1rWD1mYVLsnvTq0mnNeYnm8/zQake8=;
        b=cARDjT3jN55WMVi/LiJnS/faZ/PB2zwqyuP8oE8dI83A40XfTZ+fW9ZsJRrfueuxAU
         RWaBozVGAXmofRbxykd2SXFNRhwxUVYbAmJqOzrfejlp6uqAhne7DzQuuhLcAwP2Xs3t
         cDOS798Ea2R0ngEjOYHw0JK9JpCU6PBZ+UC+TAIoxfn5CBFj7P84Hk6FaxLoSFj+x3+/
         22m7JAI15KQDPtZvodTkXElk4ikt2j9Itdc156GOafGtzHOxPjmXOwPQF/eIW3Hnabje
         933uaEyifqr4/ibchu34xtnzAenvRa0NZLmWRYnaR3fF0NyreMe/XlrCd8CFO/n3hYPt
         3c/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769093351; x=1769698151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4ByJBYSv8dzNIIUkvQF5Zr5fcQD23vQS1U1kIJNce+Y=;
        b=WOEx22MZqm7lEqzY3HHDttKzky0ytwU9UJgzLeduXLROeaE3MyJJefQUQdaYODI9b5
         5msROJ2Hh2/GQUI/PuSf1WDgZkpwyBhV3PExlket1BdctWO0mYuNxDOl09kFYeQGGMQh
         x5KMKTpAiOWcHMXB6pUee5E8kThY/vxXpUgTobamiQ9yDGSP5q5JHDPJZGsXWgBZjDTY
         oCT1T14PLuXRdKyz5SgZSWqGkuqgcnM8azTVCG9DZKvOU4hocby/F2pW53p12WiYwX2w
         pkcm6bSBQdlgZOVbKoIfoKyc4K9wlzQOhTTRMJDw0OL9qT5cWl8YB++Uvc1yHyY6th3U
         WK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093351; x=1769698151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ByJBYSv8dzNIIUkvQF5Zr5fcQD23vQS1U1kIJNce+Y=;
        b=jMrcGRp41kMije9bfuJ/U2EuGT/O0ORh5M/HUmMvLSCvO0b9wr8NdXQEW72rDgIlhD
         H5U/x8RXJwMYBBYWQwKkw1gHvvBgRLy13PkkdQJSpUV72ybtH9Klr5bIMenCunYn2Qks
         WLROgHOJop3XFGbBfYP3NPncJ1Vnb66iJwnBZ09UheAGsSSaWR/xN9lGaJ3w+Mcd9/YJ
         LteJQiwOXJELuNVT26zhsX4qDGvxkpdX9Y4p6hzzzlbmOrX/B+kGxtZEfhJr1rJN3YRe
         QGgN7R0tyoQV6BWZ/ZUDJOEWta8DD8Rms3CwzKpZg4mSVfd9EPSX1t/C14ti3Nm8s++V
         lC6A==
X-Forwarded-Encrypted: i=1; AJvYcCVk41yN7A+ECq/qwFk9jXgv/Q5eJB7Yc1FzkoXqiY3jLP6P02RluYgNzFbeDyq0moWsy/r2lN9dGP3ezkGO@vger.kernel.org
X-Gm-Message-State: AOJu0YzvLXofw7C7Uowrn+aq7yEwTLlqsiHyxR3bYumabvTNiyE8Kh9t
	8mFKuF5gvAmaXnH+sSvOtOFfxgssrFyE1ako829so7br9AlW4h7c5W93LVoDji8JhfCBgu8bWPB
	RKugCjrVDSXKFWHdO5fww/crJrE9k2q2KAU8WUv7BJlLeep2LCc07l9nGoMAUw7GXCpZx9BGdY6
	IxVKaAHxhYH8WHu+uvA4eQdzdH0o43Qto7jRDEHvoGcHQ=
X-Gm-Gg: AZuq6aJ9Ctuq7YnPUu0q9VuLE4RGZMGO3F8IUqKlszBVVPc3sw6EM6Lr7RfypUbjM19
	R+dXuPeKTyjfwlotyXt1rpn28QtCmWX74r6Plhe6MPwQHcL4x2sdJZ3TINztQ3IHNc4oCr5iL7E
	2yMpwxodwx8FNAtJ9kJ7v0GhwJL0NEf0FbeJAPTJIJrONt6Mio1MM9Ai2+GO/1edT5+pmCfwxaI
	LsSEo7SYkTiDDzRK4pv2xHlAg==
X-Received: by 2002:a05:7022:e1e:b0:121:d898:edae with SMTP id a92af1059eb24-12476b20423mr2297853c88.24.1769093350568;
        Thu, 22 Jan 2026 06:49:10 -0800 (PST)
X-Received: by 2002:a05:7022:e1e:b0:121:d898:edae with SMTP id
 a92af1059eb24-12476b20423mr2297823c88.24.1769093350042; Thu, 22 Jan 2026
 06:49:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251221164552.19990-1-johan@kernel.org> <aWdaLF_A5fghNZhN@hovoldconsulting.com>
 <aXDt6v_iO4EFCqyw@hovoldconsulting.com> <CACSVV039g9CcAKhtMAwn=hH4hMT2nV77vxiasgUSFF-sn=+JgA@mail.gmail.com>
 <aXHwrnMS2aj_PYRj@hovoldconsulting.com>
In-Reply-To: <aXHwrnMS2aj_PYRj@hovoldconsulting.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 06:48:58 -0800
X-Gm-Features: AZwV_QjkYdq6c3XPgpYIaf_pN0lJpl-wNv-t9mB4a402BGd58WCopYg5GIRuDVY
Message-ID: <CACSVV00vk95aYZPrVThoAnHzBUsCHXxnSoEHJNaoLdyJJBOZzw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
To: Johan Hovold <johan@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: zuW1iOzE6euLgYIHPgeSzOhGLLJeN_4U
X-Proofpoint-ORIG-GUID: zuW1iOzE6euLgYIHPgeSzOhGLLJeN_4U
X-Authority-Analysis: v=2.4 cv=J8qnLQnS c=1 sm=1 tr=0 ts=697238e7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=V1jUQ0fd79-Hst1t40gA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExMiBTYWx0ZWRfXx4jLl9LQzhqB
 MrVzabB5u8CVGAMPRKGMPV/ABqQH3Sm0zLQdulSAJoZpXbbSYjHHsUcLP/6We+/UVgd16zTCK4J
 WXdd+ZUJ8ECBoWw2w8kQ+ZcIptHMMl1oYuWohvRkT4hRSXd8Mwiuk9RgJMcA34lDPMhxSVu2ukx
 tuoNA6OUP7VTzbt0C/2aQSrbU54CPGyKDRR1IUY3iobOF5W+vGTi0wh9x4zuq2IXwMFfZa+CQ3p
 IgSXD1Wk1iiDVlqigYUdeirMWDtWQgYIu2dxDMIGYNDTI0r2XEWfpN/uQ+6JaVVDWFsGXnxvoED
 /espLfU9LiBW0xj6HUh6aouWhQoD5rNO+QXetyGbsSgwsltQrJVp0kbzR9FFOVkGyV6e8SxBDvo
 xjnhrvhv5I+zGx8nTTqVqLtgDYu6Xmif69FjDdsxFtAICtMm+3llOksbiX+q96zyhPecTkBes1u
 AYp//9rLgQbIgqMZZFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90219-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org,ffwll.ch];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2605:f480:58:1:0:1994:3:14:from];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[52.25.139.140:received,205.220.168.131:received,74.125.82.69:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 9ECB968F58
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 1:41=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> [ +CC: Dave and Simona ]
>
> On Wed, Jan 21, 2026 at 08:59:51AM -0800, Rob Clark wrote:
> > On Wed, Jan 21, 2026 at 7:17=E2=80=AFAM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > On Wed, Jan 14, 2026 at 09:56:12AM +0100, Johan Hovold wrote:
> > > > On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> > > > > The hw clock gating register sequence consists of register value =
pairs
> > > > > that are written to the GPU during initialisation.
> > > > >
> > > > > The a690 hwcg sequence has two GMU registers in it that used to a=
mount
> > > > > to random writes in the GPU mapping, but since commit 188db3d7fe6=
6
> > > > > ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a faul=
t as
> > > > > the updated offsets now lie outside the mapping. This in turn bre=
aks
> > > > > boot of machines like the Lenovo ThinkPad X13s.
> > > > >
> > > > > Note that the updates of these GMU registers is already taken car=
e of
> > > > > properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> > > > > properties on a6xx too"), but for some reason these two entries w=
ere
> > > > > left in the table.
> > > > >
> > > > > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> > > > > Cc: stable@vger.kernel.org  # 6.5
> > > > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > > > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > > ---
> > > >
> > > > This one does not seem to have been applied yet despite fixing a
> > > > critical regression in 6.19-rc1. I guess I could have highlighted t=
hat
> > > > further by also including:
> > > >
> > > > Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets")
> > > >
> > > > I realise some delays are expected around Christmas, but can you pl=
ease
> > > > try to get this fix to Linus now that everyone should be back again=
?
> > >
> > > I haven't received any reply so was going to send another reminder, b=
ut
> > > I noticed now that this patch was merged to the msm-next branch last
> > > week.
> > >
> > > Since it fixes a regression in 6.19-rc1 it needs to go to Linus this
> > > cycle and I would have assumed it should have be merged to msm-fixes.
> > >
> > > (MSM) DRM works in mysterious ways, so can someone please confirm tha=
t
> > > this regression fix is heading into mainline for 6.19-final?
> >
> > Sorry, mesa 26.0 branchpoint this week so I've not had much time for
> > kernel for last few weeks and didn't have time for a 2nd msm-fixes PR.
> > But with fixes/cc tags it should be picked into 6.19.y
>
> I'm afraid that's not good enough as this is a *regression* breaking the
> display completely on machines like the X13s.
>
> Regression fixes should go to mainline this cycle since we don't
> knowingly break users' setups (and force them to debug/bisect when they
> update to 6.19 while the fix has been available since before Christmas).
>
> Can't you just send a PR with this single fix? Otherwise, perhaps Dave
> or Simona can pick up the fix directly?

Maybe someone can cherry-pick to drm-misc-fixes?

BR,
-R

