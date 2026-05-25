Return-Path: <linux-arm-msm+bounces-109584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHQrOHgIFGrVJAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:29:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4225C7C4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 942373015A79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8407233939;
	Mon, 25 May 2026 08:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebFSXMox";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORkthk7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6772D3E170E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779697734; cv=none; b=AGIYOq7bJ8u3geIC+VziF1RtB6zEz6rp9M6BPzdTL8sZp9uAkitHLsDmEXU9GzuLRMYStW37URtBWwu6+90Ig1PNxil/mw7Y3f+ZBWJw1Madv8Idv6Hv39hAWvyYT+Fnqha1TTYJ37SASIcx9U6Ox1OGLnk+HlRRy7+1zl4Q7k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779697734; c=relaxed/simple;
	bh=si1/nSGN0fqcvGfYUGuXhveAipIyMJwRvw7xAz2onlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gO8cSNYibWfUyQcuXHcnlQRNyxJaS3ecYJZDu40O2Wb90GNW1xZpuNm5Sl03d0SHOGsWSbIGIv02Vr3sONLkDlCvbgZNKxpJL/0qZx5HqSdxOvDEtbMt4E6zZZnFlsF58/tNmRMCUf5KJ+miM+VdGUW+MygByriCsO8EgUCsBLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebFSXMox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORkthk7f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7ZVaT1927545
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BLppBFkkrTJ9DihnX0lJj7ir
	Oe9XAXyw3RAwRnSslRc=; b=ebFSXMoxFbFObAypkDqxQJPVzyAx8JR7wzI3jplF
	PIYAc9+s1D7EwDMUA8CZP+50b8ogDG6WNtEiVVmMZmki+xDwixDm48OtQHfCDPyB
	+t+xFEjBcZ42MFfo6tKU07K2HSHY3PNuagvPGcxL026BTDIAJJiGegKJh2Uqak5w
	x4a1hBGVnh19zhBB22cad6uZZJYZ0DPw+5Tlr7UIoEZOJy4lbB78Wvu/3b+5kD4m
	G7k94LxqmSFPjMKjLGAa1fhftEK6fo6sU1J2Awjk25zoz3Va7Geb1GrCfrtb43DX
	sMICmizXhAFgDI+YC7nO0jDmEie7pr0sZoIoHpY2Vs+jmQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0w0kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:28:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d09e77e6so72486571cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779697732; x=1780302532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BLppBFkkrTJ9DihnX0lJj7irOe9XAXyw3RAwRnSslRc=;
        b=ORkthk7fXrmjm/PtxoBLzM9zx8tvLEG+hHSXBAv0GC0+9EM463mNbXXqjRbO/U5yrQ
         ZwowRjJm24jL5QSk6wHkFj3imv0BrqqIHO81J4x2sJ9MXk5wWLdRioFJIE+5MCrO8AN+
         a7SDByQxUhreVYaTVbG0djkrWO2ZuIbgA1PoHF3oH0UYKVEKPz99JbopIMgAyI8CxF+3
         410pHlpJFXcs0t4layllw7d7uIrOFUdxtzClHs+Hyfh/3IPikfibRl/Pbjefny32Y8fb
         3xBjs/humkR6yAaWvCzgjeKNJCs/wd2H844cvX+mA8LRjSdYvsdFtZ0VhXvBwWF1Euka
         fUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779697732; x=1780302532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLppBFkkrTJ9DihnX0lJj7irOe9XAXyw3RAwRnSslRc=;
        b=iS7oW7aEfvER3npE6MVy+Wt96x58VfTi+jvP9JrG+AY1prEIK2KAV/M+HTaz0GksSf
         jCFF+afrDu/4d3uj0oAbQedf3iqIjg8U2kD+2oiYf+HGQIAT7myVkFnfi5l4S+qBzsK+
         JFIDwBAwtxmebP3YoPWDGshEtLH1ig6TYHw/fHSTLO2mb1o9rl64sp0YZ4z9amRNbZv0
         Kywfv2cyxuZrJvwx8eWZhnr6KbSwloRonKbwU8i30sGzraPrzs1mNc/U+jsOOn7IYhNR
         tuW+0t9Ew9cLecCvgH1DGQL1UQ34MTso3FdXsFlZvF0G06/x686hB4mmM6J4gFH34TVA
         6ZJQ==
X-Forwarded-Encrypted: i=1; AFNElJ86Hsobwx7pI+WlWw9Fe8IrbPNvVq+SmZ8QvAPfIzZgANLKRcHqeKE4TNxc2racNoEYtmvg/kHLCP37lp+3@vger.kernel.org
X-Gm-Message-State: AOJu0YwEyr7jdC4+gW5ZmESIik9tyRCGiSrW6og0lwzEKtjlmt6WoJW0
	vO94FI6a/8rJmvKUqwAfczcoSy7bYyi8qEUUF/atEW5OtJ86xLefnJ/1BHQyGkhN3RGEss1VZ2G
	sOGbRbAEMM+nZ3ZgOebAONbT5M+KNAa/iSLs7ZvHhi43vX2lm9ne5YetBNFklrONspi6FPxfRKJ
	CvLWA=
X-Gm-Gg: Acq92OFFnrmLbwu0hEzcwcqvJeWUxBYDdjFXI/reQ9821cXNLY8CvS12u9zPgnsfwW2
	7T/1A71IzA3cjCb//GZwYwYefOpSTQchTmJJ9P6uRNY22HMbtrUxwey+IYr0KTZYBrpknobEq49
	B+5W4jSxq2Phsq/IxS+bidwtNQmtV7+M/sNfEyccl2lx4QIxEJtd/fFTM5jMsvedPltGhY2jMna
	pt60Czj/yeOOlJCmPrR+Wd3EhiZgspNUZOGL1INJL9+lEnL8lile3egcj/FotsEVUos0NdcfILa
	0M8mP1LX5UdOlv5eZHePINfJ0IDtpIsgJTeoZmJsX5MONLDt8xOncPjIYihETIB5L+qJ4sntw+8
	Ksrr9Hp9yxGXcVQhWg8AcOCWvetx7F4W082aMqfteTMTlprt+qcEoD/LROI97TJe9eTfGZqAjiX
	Z/oiYcN4pwjW4294GtSritUdYT39lOXvp3E4o=
X-Received: by 2002:a05:622a:6115:b0:516:51da:ae52 with SMTP id d75a77b69052e-516d43cb30amr179921171cf.33.1779697731653;
        Mon, 25 May 2026 01:28:51 -0700 (PDT)
X-Received: by 2002:a05:622a:6115:b0:516:51da:ae52 with SMTP id d75a77b69052e-516d43cb30amr179921091cf.33.1779697731225;
        Mon, 25 May 2026 01:28:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc4446asm21334871fa.39.2026.05.25.01.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:28:50 -0700 (PDT)
Date: Mon, 25 May 2026 11:28:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, amahesh@qti.qualcomm.com,
        arnd@arndb.de, abelvesa@kernel.org, jorge.ramirez-ortiz@linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: Re: [PATCH v5 2/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <wowscekybeyxjgoztvwtgls4s7pbwciiztsizyc6kolxp4g72m@bfy32b24zo2s>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-3-jianping.li@oss.qualcomm.com>
 <xnkycubizpoe4rmhc3jt36ulx2fb3tubjybu3djovafkqqttmc@o6vw2so5ctxr>
 <37146a3a-b18f-40f1-b95b-0ac19bf6c07a@oss.qualcomm.com>
 <2026052211-pavilion-compost-5fcd@gregkh>
 <d9248bf3-ef48-4c04-ad7d-debc8854bae5@oss.qualcomm.com>
 <2026052541-moaning-dioxide-d5c7@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026052541-moaning-dioxide-d5c7@gregkh>
X-Proofpoint-ORIG-GUID: _pDu5QDX9nYAo5NI1oBAmgF6YF2HX0Jv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4NSBTYWx0ZWRfX5UTLdFl5B23w
 8SfHXlqycLPiuMvqSfX6OhbvO8sgl+ItYxLrWe3bIaw3keMsBpmmaOMdCpJ0DA0ABad6WB9GaA6
 Fo8HfygK00r2AmNhuqqz32wR1KSQD7JkuQN3Xj4zcDL8SKzRK2bvwZlip7Au8yaiyCxg1jgNwan
 jslbwDWASml3hYs8xisAYXdVPlGkneW3siLfrMTM99K92zPp7DiR/Gy7b5kLkHO/TccJo1SXJKV
 QgTYPf7vtQ5KD+/M+303wxeffwNlEKlCDyrFsfqCr7z6xP2SaJ7l2UYJa/7z9tupeTCPso763tz
 bFY0402Pq/yFejAvDFiEtfTX/uzxAQzFMhgXv/AZKFoSydufnqYFvEquLZYQxZc0+8Gf5kE15rS
 TTACJWeqXMiDe0yjYzAxuxvNStEGE+rd95ck6QMuExLh3P6NfAcJ65lmAaxC79r+nWvqhT87BEE
 aX8y5FzQmudMtT2mv2w==
X-Proofpoint-GUID: _pDu5QDX9nYAo5NI1oBAmgF6YF2HX0Jv
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a140844 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Wl0GIK3KD4wLFu1QXOQA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250085
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109584-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B4225C7C4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 07:06:37AM +0200, Greg KH wrote:
> On Mon, May 25, 2026 at 11:30:43AM +0800, Jianping Li wrote:
> > 
> > On 5/22/2026 3:03 PM, Greg KH wrote:
> > > On Fri, May 22, 2026 at 02:55:29PM +0800, Jianping Li wrote:
> > > > On 5/15/2026 9:36 PM, Dmitry Baryshkov wrote:
> > > > > On Fri, May 15, 2026 at 08:42:14PM +0800, Jianping Li wrote:
> > > > > > From: Ekansh Gupta<ekansh.gupta@oss.qualcomm.com>
> > > > > > 
> > > > > > fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> > > > > > getting removed from the list after it is unmapped from DSP. This can
> > > > > > create potential race conditions if any other thread removes the entry
> > > > > > from list while unmap operation is ongoing. Remove the entry before
> > > > > How can it remove the entry from the list?
> > > > Multiple threads sharing the same file descriptor may invoke unmap concurrently.
> > > multiple threads sharing the same file descriptor is a horrible
> > > userspace bug.  If you do that, you get what you deserve :)
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > I agree that concurrent unmap on the same buffer from multiple threads
> > is a userspace bug.
> > 
> > However, the fastrpc driver is exposed via ioctl, and any userspace
> > (including any random apk) can map directly and then call multiple unmap.
> 
> So there is no userspace selinux permissions settings on the fasterpc
> device node at all?
> 
> > This patch is not intended to support incorrect userspace usage,
> > but to ensure that the driver remains robust against invalid or
> > racy inputs.
> 
> Isn't control to this device an "admin only" thing?

No, it's being used by normal user apps. Also, there are systems without
SELinux being enabled / used.

> 
> thanks,
> 
> greg k-h

-- 
With best wishes
Dmitry

