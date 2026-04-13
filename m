Return-Path: <linux-arm-msm+bounces-102955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HSMDnHk3GnBXwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:41:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A113EC15C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08549301D6AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2BB352C29;
	Mon, 13 Apr 2026 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGM/QJux";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NoXGhLDI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2012D8DA3
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776083820; cv=none; b=UtWUc9ZuqlQeFIWsZXnZaMT3DtzPBXux9zMmygHfPEhFSbRoT96XlVfScN4wSBc8Lk2dapBDXtQRxi5XPvm3xt0ZG4x4LOlabgVXJKqRBjjy0vJ4tQJfYA9D3fWbSTk0r4WG1UOQWDTl1/j6mLfLkxTwVPpJxI6rjIok5I/zgAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776083820; c=relaxed/simple;
	bh=/snRMPZQUTYia9zyrQ2fRUG6JW5N0Rck4kYn1k73nGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTQTc3xPkvPWOI0UDONa7jz1iYBiohPHfRZgzGbEmqWokDnAe3megAkg+N/u77Qwnyo0U4LgeKAbV+LfzDn/A+1UqayfhSkcUmQhdtRZp3Wl4lRtnuAkJvVHKjlIGjkCOVGRHb9r/pQaA90d+lhUhXNZFQM7xLu9pibrelCCmPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGM/QJux; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NoXGhLDI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6tV9e3446582
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qCV7vtqko2k1ACwoJScUtXw+
	Fbqe1B3WisXDKH89eZY=; b=bGM/QJuxEW9xYxx0wHEdOE+kV/1uGY10QyjRe9zA
	oClU+OPQBrFWbD8Tol+zGmkOBO7gaLfL+IPMpYG+f00QeYNC3stpoEPvDfsdEgJI
	F2NmJTqgKZexklSjLeEq7SqNg5OXSaVM+08wvvCcaJBFuLCxJlruWUbQmM8ONwuw
	egB7nZXm292WNVwMLruvpoAHq8fYNQS9bGKXPpQhzkf9jKpuYC4MZwb468LNbLWl
	bZATIVA0uFUCnJyNHn5tP3boxGgHVBJWzguwcHnOhFmxo5/CLmslxXyJW3q58HnL
	nsJPIXix2gvdnpFQUIj09D+DmfWboQgVjfzkxRmw2vHCag==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpcy1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:36:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1273dfdaf5dso4174409c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776083818; x=1776688618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qCV7vtqko2k1ACwoJScUtXw+Fbqe1B3WisXDKH89eZY=;
        b=NoXGhLDIq4fDrGZRvEMKSNxd1sSl+GXqDex5gyApnrKsfqIPh88tEhCbu54+/Wi27+
         VGrtxM/u5y9AIOK1LJ1TPADvvczfa/8pO6bNedQdyGuIp8rejM0RsgeNx+fmAEdOxLwu
         r2DTvUECKnCsfQklyPcur5GBS7+K1aovNqL1SEeIXzHqm0sNMkGgGQ9wtRuTyDZjsZVI
         nfbYbAzc1I3LTzR9BsKWBEXP4b8WP8DWiHScmIkSyJEf7hHvYDViAiO/lMW8Oz6cBDZ1
         DawlBJ2R2xYTOOHLqwm7Msvso5L9fxO/BddG+yb3DmuZo85JnaB3VaIup1u45VzkL2wV
         m1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776083818; x=1776688618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCV7vtqko2k1ACwoJScUtXw+Fbqe1B3WisXDKH89eZY=;
        b=ZQASQwYYtRtN9jhLeM5YwfglfIQJSBVRh5fSyrBt9vFPkG4MgUZDnxp104Sia8OCe7
         jXvo9XGpqZsM4vAX52abLgKuEy/arkolIwRsri5c+8TFOYRqwupmewdSst1aaDJwBvwX
         tHg65OwDiYh4xaaiRABQCMHSHT3lfqTYlvXzC2T+De+YhkBsYg9oM3bKKzRCz+byAI0O
         1ZRbIsG8favasdm1HdlOv2ktPWcP96nkUZgRj4y4jUmESIs9g/qYoYItYXEuJx2a7rhn
         ZP2kbelwA943NdLVO5CKmqFyr4VjEMFjIdQJoZk0Uh3LLezcJ1krMQ30G0KFOy3FnYU6
         nl2w==
X-Forwarded-Encrypted: i=1; AFNElJ8sNVpuUyQgSHFiLWdpQHhY0uO/ja3u+AsZ4AVQm9NNmN5yNyg4FuHSqOoVliVzp1QlJvpE6lo1/EvAT5p4@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz+shzu7J59KCoKEfn+HYZUjA+j9t/LdxVhwpismj7NxPeedRC
	6R/ohrbO3VUU5fwvgQ6O4wvh2QIKIv1BfvEF0cQNJFpVh6yW+XYuuf7P+5rSFby5VV94eJmPJ/k
	fWD/o6DufGSy4H18PNbUwqOECigt5hndwatwuU88PxstP+9Mn6TDkTmpipUFl9Rc1SxNA
X-Gm-Gg: AeBDievAnLQ+40oGMPrchjujBQ6CV7GE9E0jDRhUAaAuohA6TLrcZNYd+sVkle1sWvs
	nnNWTELabuRGZxJFMcrAly59c8LtmV8WsxA/RyaqwnRGubkK/995+ivoi3V8t3vIr52T6P3B4ha
	6fRl5WqhYn7Qoew1aNQ9c+qF7UlX2wjg0gBNONcNXItCA+fs3Z3xbM//FPwNfbgOFti3Qh28UjX
	DMc9xy0eBF/AzCC2CmWBYY+euVSb5Ly2DXPSaVYOk4yk4j3XJG5BssqJcCoy/FhU1ZwTqjuTkKQ
	a5sz0BsRVzvh6mM9VcQGjLWaUTxihuOhbFdIv6NrdoSUo6gqwhFibW9f/yhoqBtmXBD8qOaIlkI
	eBna+1A6fsliSxWB9gkNQt/jvcedz170xnJisavKEQUrkaTp0kFSie4EmzNdwdqxJ
X-Received: by 2002:a05:7022:4381:b0:12c:8eb:80b9 with SMTP id a92af1059eb24-12c28bfed17mr7513691c88.6.1776083818082;
        Mon, 13 Apr 2026 05:36:58 -0700 (PDT)
X-Received: by 2002:a05:7022:4381:b0:12c:8eb:80b9 with SMTP id a92af1059eb24-12c28bfed17mr7513666c88.6.1776083817555;
        Mon, 13 Apr 2026 05:36:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb031sm13257691c88.13.2026.04.13.05.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:36:57 -0700 (PDT)
Date: Mon, 13 Apr 2026 20:36:51 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
Message-ID: <adzjYypJciYFLT6F@QCOM-aGQu4IUr3Y>
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
 <a1f8cdcb-fddb-43ca-adbd-07e36949eef2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1f8cdcb-fddb-43ca-adbd-07e36949eef2@kernel.org>
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dce36a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2q5e9KA1SS2KkJZjfoIA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 7ZOtB7qAaxDx4AH7n8qjY9-3AJ-4vQfm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyNCBTYWx0ZWRfXwzDEG1ZVCi5H
 d/g8dfjeRWhYSDxbwEnDj8k+Mzo5hvM6scL3RGX9L44AZmt/vjYKVRI6T01iOjJZ4yPhrUSJaFj
 /Xo3v2FJwx9/Rq6U8pbFEaviTpCnyPWTisMq/anX7XEbMb+ruFdvzhsoVG1c8sv4H4Q4QgTBMah
 NXo1Wq19rLAaaRnuog1RBtslD1AfnfifOlZYDrHVv83bG1w2Xe2O5w/7/I+/BWRh4qkOGmaB7td
 xd0Y8DVQF3PzJJLv8oS2LrsQMvmHCUAvDfaNIXC7nNlgvukVM87d9BGENhC8VvIJoKreBxGHX+V
 SWR8bHIKK+MJxfC5y1psOs0/0S1CbdLpRBwAgrpaB/iSeXwkWHNlzrEKQLv2C5fR4KdJWQyNFxt
 mUis7OwH9ch5M6kSBBv7BZHU/pZG2FBcLNV9ZXgX2wG+ykYTQYhVKyUtsv7mN4gvRQrzDnhTeJ+
 t78sw75JK1gE7k8JRew==
X-Proofpoint-GUID: 7ZOtB7qAaxDx4AH7n8qjY9-3AJ-4vQfm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130124
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102955-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90A113EC15C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 12:02:48PM +0200, Krzysztof Kozlowski wrote:
> On 13/04/2026 11:16, Shawn Guo wrote:
> > Qualcomm Oryon 1-5 is found on Nord SoC.  Add compatible for it.
> > 
> >   $ cat /proc/cpuinfo
> >   ...
> >   CPU implementer : 0x51
> >   CPU architecture: 8
> >   CPU variant     : 0x5
> >   CPU part        : 0x001
> >   CPU revision    : 4
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> 
> No. I said many times. Bindings come with the user. We don't care what
> is in cpuinfo of some non-upstream board (and lack of user means it is
> non-upstream currently).

I was not aware of this requirement, and I see many bindings that
currently do not have any in-tree users, e.g. qcom,oryon-2-3 in cpus.yaml.

> Please organize your patchset correctly.

Are you asking for a big series that consists of all the new bindings
used by Nord DTS and DTS itself?  Unless this big series gets applied as
one-go, there are still chances that bindings get into a kernel release
without any users, e.g. subsystem maintainers pick up bindgins being
reviewed, but DTS requires more iterations and thus misses the release.

Shawn

