Return-Path: <linux-arm-msm+bounces-116435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /GT9L61OSGoaowAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:07:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DF470632E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:07:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="S+43f+T/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KQHxQrAz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116435-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116435-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E2E36300F7BC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22A8288BA;
	Sat,  4 Jul 2026 00:07:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9443217736
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:07:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123624; cv=none; b=szt420kQtib9sB0c8A2YJbQGMMsWB48bSiMTvcU39ps8dSJZi56JwgVUiADKJX404uAy/lhW/w942wb8hcBxNksb3QqwuEqLnGpKkmvPR8IHmb4Zv2oILJvpJ5gpJP8OUYDjdj7BfaiFxA+CgJUuAQGCTMC/fCNbYl/uNXos+Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123624; c=relaxed/simple;
	bh=BEogSRGJNPbF8wmvoZiqLfnguBw9plhyfs+jR+zpRe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HD1ws10HHLJ3z+p4y9+NL3L93a0mqy8PLGc4C03AY+EU4cv+6jYltdtfQrtoUrozI0WyzbsRaq2QCxaIq2F8JJjEX7ur2yRt2nVwsTOoKwy342x1kTtIgjcgemuX0po6lemVNDvN8dwfYnYxFQ3VAs2MutA2PfPsGs+zkJQTe+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+43f+T/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQHxQrAz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPQi41021404
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f3Ta+pCtFjN52t4dGBtiweKL
	a21WuFYkkIm+cxb/tHA=; b=S+43f+T/KMK7tDli6vInt18Owr8e9xtn2v1C9kC6
	wS8wVfGLuR+S84IUdklzv/ZF8r3Q7YbWPjm+DaaSbK0JGJg680rSioI4T9wMZIGp
	o95SRBOIMkkhx0Fsw2sr3CvFcIy6cGo4cmrc0bPdK/K5BdncNlv6+S6CE71W0ubX
	p6VI3feGE/jReb62GTUM1idSigOMBbLgr+u0/WMfslbX6e2I6Zc5xSnhvjYqMKsW
	9H4PyYsXuSmau703ySxYmXVeqcxkZipaqHPuvFes+IuN4TSNTu47xGz7khMUbDgp
	7Y/cDUVJQsyHvzBJGPuflD4rkXSqqfxAgzw37A1bmnN19g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u3345p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:07:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e538afe65so104464785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783123622; x=1783728422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3Ta+pCtFjN52t4dGBtiweKLa21WuFYkkIm+cxb/tHA=;
        b=KQHxQrAz1uv9AhaO0HVVrgo2S7L+0tN/y0dJDGEjfMhisANoln0T4Qj92LMYoSoaow
         O1Ar26ip9lhhaRITNbokuHW9fvvuYztWfD8gNnEvU80vF8PAkxqEuFYhCFZ6AEElIjcp
         ESoMYSfZ/l3F1fCOZbrSMjPQK+sR3G9kZ90NVGnhZFLNrCqj6Wki7JYpR52vdTDnCGg6
         keVKmb/ImoLYHt0iOKdgBaD0DlKL+zQcCrMS/BK59zvGWkGQsxG7bxhg+Dq3t9ThSJYM
         RG3G2Vsp3N3VVFjPMXA0khv5JX/YIrmkoj/sbeWCCYjbfFlVeP5XZRgk9/1jsQ5henH3
         wE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123622; x=1783728422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3Ta+pCtFjN52t4dGBtiweKLa21WuFYkkIm+cxb/tHA=;
        b=O7zTLrb0XvB8XEKZv06/ADJLdMW8GY7pBWj5H5zR9L3SXwO8br56j65BR4VG1FFn7o
         5k54m6zlw+mO662AgZU9KjM56lemJf+ZQ3n7oQsQgJfnzcTGCVzRu4WT1x1DkmTaHzzA
         g9ut482VoNeUAFH78FEvR2g4N01gTCTO0Z82DELwx6Ug55b96JLKYjk96fykPXL8jZrq
         mKhUPA+hPDczwQZjEBGPaIut+nI7zFeOzSOspnb7enMkH8P1htAVtwQ+7piupQrhBpKG
         6/6SQ0RtIJXG6r8N7XID7rNNlBVBk5cgKDIwcSEu6logA8PbihImVzXRhoE6lwyYgmVI
         ANAw==
X-Forwarded-Encrypted: i=1; AFNElJ/Whe4cjh8VeAAhT6CHCoRdwX9k/KPvh1tBQk0e7tAZupL/NH1igfL8lxGpJOqOyn+W3oEH9CVvbCUbt8kd@vger.kernel.org
X-Gm-Message-State: AOJu0YzChX8CDNf5/O7iEKTyHUZ6I8SvDdydgtV3H3JkmDD6y5/LuXS1
	1U23lLJNc3YywGEJAnbGz84MybVoV+INmFy4WeSzY0CQ4daizmTQQQirW3sOBlUD7+dq/B/2cVm
	5xtmB0CuSS65gzLQgc26HHV3JoULk4usV+KsvtoajBkqAAcUnFRntytnoeNWfq6cWOeVj
X-Gm-Gg: AfdE7ckcueksFrUsbVj4dVD+V8sDVcKiMBl9NVhvARqFgGT5UzmaaOSKAo7k3IFIg1f
	tynkMxXUPTMND2Mhj1hPzkA8Qdh4SXBWy+bp1tQZWiHtir7qosiuOvcclb6K6BpRuvEGP4HGAWA
	5lAcqyqfNfQaYUsibLcJaYN1GhMNW4/DuD88KTrnbUCYrHdpPKIX2DuO4qDaFIDgcFveYYEiMde
	vN3J7Xjbd12SKLjQ+BdeNFEjBTy7IyF7N/M/Q7g1ybYqYzx1fBaSm9+6b5GI5/TbcCLh8BQZxFa
	WFtIyaa/9vEJspnkvsfx9GMsqGlhIP4G1PhOqxcUijzrp43PaviOOimKYkt7bAJfp09+EfpGX/V
	DoOGQ747b99auuaQorBjkN71GZBoe3FUlvMAZikeLGW8vmpwdZUxekRUwiiGRAsG0/s8ddDRElX
	uGicoaj0E4quNYvydsHr07XYy2
X-Received: by 2002:a05:620a:29d2:b0:915:9de3:2260 with SMTP id af79cd13be357-92e9a3cca28mr230200385a.24.1783123621650;
        Fri, 03 Jul 2026 17:07:01 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:915:9de3:2260 with SMTP id af79cd13be357-92e9a3cca28mr230197085a.24.1783123621256;
        Fri, 03 Jul 2026 17:07:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8d0esm863792e87.84.2026.07.03.17.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:06:58 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:06:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/9] Improve Qualcomm EUD driver and platform support
Message-ID: <2r72aodgl3ff3gts6nwdmvujluehmuhlpxnvvyzshgwcvpmjiu@77iff5kuyo7k>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <35348aa8-f878-4ee7-bb96-a1d9203bca4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35348aa8-f878-4ee7-bb96-a1d9203bca4f@oss.qualcomm.com>
X-Proofpoint-GUID: JbgLUhoXCfeYRwPkd1bI0NWIDzNZyyHg
X-Proofpoint-ORIG-GUID: JbgLUhoXCfeYRwPkd1bI0NWIDzNZyyHg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfXw99hUUvVe/D/
 LGE3J9z7Y7li8Ft7OscCnhfzUtU1RqvZtKtk0TbHVStsSbJs0/IOeOvptVaYtoZXIMFj/sv7tIs
 W7zhQj9tFt0OjaRATRuXNTRf6xZpLos=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX3xRgPVGcpeH8
 EzYpOOM82c+IU7u05kfyeG4DNZPscldgLzqMkRo2jyYlOsPmO/y9p+zzKcn1yAh2E0BIXkWcVQW
 dsPtlHUACUnry6C+Ms7ER+N2BFYeA95PXnS1Na8KDZ1mZP+/umk+JHHc7Vt6298sQD9ndbWCFFx
 Os8oLnq4FA1S5gWiWjqmsi1HwYnbb95Zu/FOgDuSVME0wjyMZXEy+aWIhMrFeO80xb5pQfZcCLx
 5W5PIICKogHsC0jXfp7Kq4aMIojwUUF1gZetUJVJBqtokBAuvjNcwlYyHnfPb8tZp7h5StsgLQD
 zMo9z2f30HKH4yDLy7AVwbtOYymrvDA35B1FZfe+lcKcxBUbtuC1/vPbJMaFJ7AQiTcoWQ4dXv8
 2w3I0ph01bFBjK8ASDn4nCoNBBe384OvBFZEjmWatMkNpM5D/C3krZre4i5uOVUUPmLX7BGW4No
 D7W7bDdHpyUZj6NmkHg==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a484ea6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=whWooV66aUwbJ3_LvogA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030243
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116435-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:elson.serrao@oss.qualcomm.com,m:andersson@kernel.org,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:quic_schowdhu@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5DF470632E

On Mon, Jun 29, 2026 at 07:48:42AM -0700, Elson Serrao wrote:
> 
> 
> On 5/1/2026 10:06 AM, Elson Serrao wrote:
> > Note: This v4 revision introduces a design change compared to v3.
> > Based on discussion and feedback, the binding adopts a child-node-based
> > model while preserving the legacy top-level 'ports' property. The
> > child-node approach is required because EUD needs a separate OF graph
> > per UTMI path to accurately describe per-path role switching.
> > 
> > Link to the discussion leading to this decision:
> > https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
> > 
> 
> 
> Hi Dmitry,
> 
> Just following up on this series.
> 
> Could you please take a look at the updated design and share
> your feedback? Does it align with what we discussed earlier:
> https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
> 
> Please let me know if any further changes are needed.

Excuse me for the delayed response.

Yes, it's better now. I've asked a quesion regarding using eud-path node
vs having more ports.


-- 
With best wishes
Dmitry

