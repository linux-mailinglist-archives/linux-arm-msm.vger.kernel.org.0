Return-Path: <linux-arm-msm+bounces-94185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCUkIVJQn2n+ZwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 20:41:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C7819CCCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 20:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E042F3047BD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 19:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538743EF0B7;
	Wed, 25 Feb 2026 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bb6+ZXg4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/vUdoIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131553EDAD9
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772048462; cv=none; b=C71G6fh5dKKdfrfKsXjWxVQ+m52WVwgP2ukhb5OaKFUQKQmqyG9mzyXeYui3t61OkhrDZ2jANDQF0CzoQpWJeGTXJtAQ1rtL2beM/gvA0acZQZKv2/SBGu8+4GJMqErvCNntt3snbmQ08cuf8z1AATy6NrLURoqJmUdeZYZtUt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772048462; c=relaxed/simple;
	bh=FCb6qRsffNOFquP1zsdT5LrT/xxl0ASJ+i+C6Ffk7Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDAqY5v5yu5IrEMYa4EYldRgnUffIT54jpCpkV3H/a2xsu3oKQy5QTFxFwnUAg0ZqaiKsNOt/zJuI8JRWYzFOBWU5HhNPm6OIRav3aRVXstXDVni8tX2Sy2xkrlaNb/nbidoy/OtFGql2yUHqel7gdUjc6kUKCKDTvJEQQ0EwbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bb6+ZXg4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/vUdoIy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PHqwi23056467
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YldBZQ/Jim+tynF85y7k+vY7BGkAqZn1hJiK/ioWbpQ=; b=bb6+ZXg4Bc21i6nI
	8YZgTqmAMOzl06INuTbAreMHrTwt9uIaIbxUXWgqIj90/VMFd0maXT2OFDW6JYg7
	K3KWk+18VoLozcITPhcI2VBzd8Jt6u+Ef5fWU2aek2C+GgEj0WeSlDu2U+sPmyz+
	ZarHADoXvpftmC/fQPY6EXQ1mpg8lOnG+ylhPR4YMQOiaktPAP4DjVzUByvyKSGn
	BYSLMygKkC/C6+JJ+rq+7G49iysdZhsU/lUbJ66yKZeB755ABxZKg+A+HuhWea99
	2ITdBRgW+YB+i5N6/3IJLENnIM5CDJqAsLjX+m/S9G0CYsbM0RFhTzgFxX2tdQ5n
	0JYRPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39j064-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:41:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb390a0c4eso3525806585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772048459; x=1772653259; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YldBZQ/Jim+tynF85y7k+vY7BGkAqZn1hJiK/ioWbpQ=;
        b=L/vUdoIyFGQPpW8xYnU5G/p5PnQYcJCPjjUyyqbV1sTGIln4inIaApcZsveoLFWp2p
         kLd2cPH2n8sWK33HynmHNipGU1EjPPrRuq0UZvAfKTwNsLIhfaCkC3RcC1dLbydTWGc4
         1g12larGiDAATSGGYyVKwmiaitgQIlvXCEXu5alhbZwGGOS8nHeYeB/ebRpFtyPmYAUS
         DsLCijKW+hU0V3o7Jy9gF8gg0yti1LuwEtX40yJqR7WDn/j9oz0CZXlzCVc4pIvCrqgq
         YdAftf78ptXvKIu8lTMd+1G+Ku7cpXLv5URttArLhwVfebLlDnmfYmG71ajI6uM3wBwU
         dEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772048459; x=1772653259;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YldBZQ/Jim+tynF85y7k+vY7BGkAqZn1hJiK/ioWbpQ=;
        b=xSeeWdegA8+6tcKLUdQr8pUupMeIzcM1HhLabYGvT/sRw4jz1N18UVRZO+z1vVn/Vg
         6Yeaiprzz9Io9yanYYDnAt2mtPCUI/A5GZc+4fxXSICj+nhmh9kz/cdybg1cRUgoyvEc
         sOcelGmmJbeFmYJmR4ih9W/t/MECPZ6o8m+J7ltQSwxZUGMt6vT2PyWNOgPS7zCA7MUQ
         bSLN6xygTYBoz8Go54K6GAt8noII/535m3Q/dd5VEQR8+6RSl2HwI6v0WlsK3MWArIRl
         IufbBr0OwD9ttPI21f7U77pdULz6n4ufs23TlSTXkMzqjwcppv72EnZbGJv5XPls27fD
         7leA==
X-Forwarded-Encrypted: i=1; AJvYcCXjDB2HqVL2cOK7BBJ60qrVLUl3wndyWquZ14QbiA3DHOJsqrxZD58tm/uKKeFBBC2snTy4hCRWgdJe7A+6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmu3HxrBu2sBrhv9pUMG3zvj4O14JeqSqNf0RT1J3llsWc5Pjr
	4uRjUHqQZt/leZRn9GkG3/X3q2CDmX7GS/75vcVc5ja0jazbgb0prbzbu137VSMjjI3VHIwWSgI
	Oc6O997w45hDQp7iky1rA17QkYzNi4L1T5bJCIJxXs61njVu/rj/gPPM2ccfJxG75UhgP
X-Gm-Gg: ATEYQzzLJdgIIQlvNMfoFqaMtIxrTC/s7cQmcGiei+v3GuPhoc6ax+98QlxF7Z9tlC1
	ddiR/VgspFnf6yqqVrJRgzItUiGDFFY2xpj4NiNBQzAIbazpJh1IPyPeO7X/x8DUef1Cos3P9Aa
	LrkPFqwCtp8TAkm4U0tzrcPJ+1YvBYeLbAwVd6AgrGIRd5TVW6m7EqeYUaDzKAIkS6f6AJ6hbL4
	gv63lr3Z4If0xmVQbEAIGvV0hhouF1LHrknt5ncbDE1eZOmyL4aDU2SmsBK6HjcpGcTW0wzXCzP
	svItRLIQz/pncmum8K8DZ0aFf9CVPjBNd5CPlv8sP/b/SO0prsbGQ3A0wLSEu4at8gKVPSG4HRk
	miA6iVNPBD6fmPm2+850piKBsDLYywlLaIN17YdEpDMNu3DF1lpxzgyanMuA8mTYxCGud2opIe5
	uPy+Y0zzkYUt//ny6T4st+j2eZUw3NbIOsJUs=
X-Received: by 2002:a05:620a:294b:b0:8ca:fdc1:cc9c with SMTP id af79cd13be357-8cbbd07f3e0mr229589685a.76.1772048459326;
        Wed, 25 Feb 2026 11:40:59 -0800 (PST)
X-Received: by 2002:a05:620a:294b:b0:8ca:fdc1:cc9c with SMTP id af79cd13be357-8cbbd07f3e0mr229583885a.76.1772048458831;
        Wed, 25 Feb 2026 11:40:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f21a4293sm46201fa.39.2026.02.25.11.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:40:58 -0800 (PST)
Date: Wed, 25 Feb 2026 21:40:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
Message-ID: <jmv4jkwku5x5acxno3vyar4cozl3makdz6vzdyjsitf2vtyhp6@cxtl7zmaayvq>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
 <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
 <5a278b02-f2ad-408b-b0ad-f2297817bd7e@oss.qualcomm.com>
 <opjniedtfhkv7vlb57g3xyikcfkxelthx3lmspmypws4vxz4oc@4uypmmf4t6fb>
 <4e4b50fe-1091-451e-b854-f7b061ebd88d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e4b50fe-1091-451e-b854-f7b061ebd88d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE4OCBTYWx0ZWRfX+OSSmH3sr0He
 w2hhnB2y4ZZNHOFrgO6Rdd0pMb7mz6HJW6aVQZOLJtMY9zKfKU8bglvh7PNnKHHwP7lkJQUkLcH
 YJ51dbp74r0dsFlhXe2K7qjhT3OhWNB1Z5lY9OIFVEh71DKNsQ1Zpgo3q3+lJ6WBNQYDTMw8+ze
 CPXiV0DJ1G3iYZZJaUPvkHfJ7CI/2pcEfuCJM/X+qdBO/TJtgxhF0/dg0CtG/8XmrBXDGKWMYXr
 anVDGkNiG0hpuKImh8Frpk1Q7wIGEce56EzoV/PycHYawWMdiDI2gyMUQ1GCf/+muZgbABoho2q
 KYgbRDemW070SX6p677KDZVgryZZuXRtJgNK8CeFia5oROD2P/sLPFr1qdd+yhXu4bj5iX18ClQ
 55xT0SOCLUPb3uOo4su3fBaZQEFyru/n0STtHZoqhgdJktX/5KVdejJwswdXG514wsI/S4vNamw
 HgGnzuE4P87KAva9EjQ==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699f504c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=eG7pLEoM89m89vxRJVQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cvN6eJV5gxt7hc3QM42lw9J1xU24TXqc
X-Proofpoint-ORIG-GUID: cvN6eJV5gxt7hc3QM42lw9J1xU24TXqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250188
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94185-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,quicinc.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F0C7819CCCC
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 11:16:26AM -0800, Trilok Soni wrote:
> On 2/25/2026 7:12 AM, Bjorn Andersson wrote:
> > On Wed, Feb 25, 2026 at 07:47:08PM +0530, Ekansh Gupta wrote:
> >>
> >>
> >> On 2/24/2026 9:03 AM, Trilok Soni wrote:
> >>> On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
> >>>> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
> >>>> integrated in the DRM accel subsystem.
> >>>>
> >>>> The new docs introduce QDA as a DRM/accel-based implementation of
> >>>> Hexagon DSP offload that is intended as a modern alternative to the
> >>>> legacy FastRPC driver in drivers/misc. The text describes the driver
> >>>> motivation, high-level architecture and interaction with IOMMU context
> >>>> banks, GEM-based buffer management and the RPMsg transport.
> >>>>
> >>>> The user-space facing section documents the main QDA IOCTLs used to
> >>>> establish DSP sessions, manage GEM buffer objects and invoke remote
> >>>> procedures using the FastRPC protocol, along with a typical lifecycle
> >>>> example for applications.
> >>>>
> >>>> Finally, the driver is wired into the Compute Accelerators
> >>>> documentation index under Documentation/accel, and a brief debugging
> >>>> section shows how to enable dynamic debug for the QDA implementation.
> >>> So existing applications written over character device UAPI needs to be
> >>> rewritten over new UAPI and it will be broken once this driver gets
> >>> merged? Are we going to keep both the drivers in the Linux kernel
> >>> and not deprecate the /char device one? 
> >>>
> >>> Is Qualcomm going to provide the wrapper library in the userspace
> >>> so that existing applications by our customers and developers
> >>> keep working w/ the newer kernel if the char interface based
> >>> driver gets deprecated? It is not clear from your text above. 
> >> Thanks for raising this, Trilok.
> >>
> >> This is one of the open items that I have. I'm not exactly sure what would be the
> >> acceptable way for this. 
> >>
> >> As you mentioned, applications that rely on /dev/fastrpc* might not work on QDA
> >> without modification.
> >>
> >> I was thinking in the same lines as you have mentioned and  having some shim/compat
> >> driver to translate FastRPC UAPI to QDA. The compat driver would expose the existing
> >> character devices and route the calls to QDA. The compat driver could be built via Kconfig.
> >>
> > 
> > This is a fundamental requirement, you need to address this in order for
> > this to move forward.
> > 
> > Which makes me wonder if it would be possible to reach an accel driver
> > through incremental transition of the current driver, instead of just
> > dropping in a few thousand lines of new code/design.
> > 
> >> However, I haven’t encountered an example of such a UAPI‑translation driver in the kernel
> >> before, so I would want guidance from maintainers on whether this is an acceptable
> >> model or not.
> >>
> >> Regarding your question about library, all the APIs exposed by github/fastrpc library are kept
> >> unchanged in terms of definitions and expectation. The same project can be build for both
> >> FastRPC and QDA based on configure options. So, the applications using github/fastrpc should
> >> not face any problem if the libs is built with proper configure options.
> >>
> > 
> > You're assuming that the kernel and userspace are a unified piece of
> > software, they are not. It must be possible for me to install a new
> > kernel package without having to replace the userspace libraries.
> 
> Thank you Bjorn for providing the inputs. 
> 
> I also foresee that we will be stop adding (or already happened) new features
> into the existing fastrpc driver, so calling the new driver as an alternative
> is in oversold category.
> 
> You are pretty much began the deprecating the existing fastrpc driver, so let's
> just mention it if that is the case and provide migration/shim path so that
> existing binaries doesn't break.

I agree that we need a migration path, but I'd really focus on it after
getting at least basic parts of the QDA reviewed and agreed upon.
Otherwise the shim layer will be reworked again and again with no
immediate added benefit.

-- 
With best wishes
Dmitry

