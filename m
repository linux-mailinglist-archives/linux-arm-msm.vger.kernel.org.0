Return-Path: <linux-arm-msm+bounces-109390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOxjHqGZEGoMaQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 20:00:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F83B5B8B04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 20:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D48D13053CA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D334357D0B;
	Fri, 22 May 2026 17:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PShlfu9n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LDRMXh3V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961D3367F26
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471743; cv=pass; b=Fipn6pyckc5vpUpq4xRFr8gVYFECCIizBIDZx7CpYQ1t4hDR4E76FXsFx0oZ0Z1O7VQQ/8uRrQfmQH2Li5Lfm4iCSGJGnFl5f/J7/twtAIjAbvOh1swr8GPs8JgQNHN27ILEfcTcZ5k4LZTz76U19WM3kucSJ8ePh1WKzLqQQC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471743; c=relaxed/simple;
	bh=oXMv3F3/C7jcdAkyz/ILkcyLj9Hpg2wNaYZUR91nrGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWQO0H33cSx7xA+tci0wuxSZbo2xXbwHb7n6NwzwxA+rSFvPe3nhvg/ETswo8SDhCkp/Gwzbxeh22zCI++Dfq2DLifA5ry53W062byulYvMlmuxITG9ynwmQn/LN0tz8ppVyTvv5SJAlgPWouhDuVT3xsTKBmXVt9aOZe1F53F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PShlfu9n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LDRMXh3V; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MHg0QF3601949
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=SNQk7VFC+yr2lz69rbbAAuhRoGnK8y0rkA2N/S6BXs0=; b=PS
	hlfu9nEHraA/VQ4tjaR4AI9cmDLV4K5s10rpIFSxWKbsF7eRKlWJdI6xqjh9L4AF
	sAxz5gtYDX+sYi/HxqhS3JkJIKjiHOfk5PoUBxaIETy8Gzdl08JsfzrJSukblbIK
	ycaLN5hJk3JMeKldpRBQb121ZxsW6qt+Ohqs+j5u6GO5Y1FkEQmPWkeVQagQzY4Y
	ZSkV6T/gkozq7rrfb/DU1RP4SwcWLZUMdl2LLsZzUgl1QZiQSODyL3ytykeEjHte
	d9m3izsnbQu9NVic1sq3X21cfqG+WThZe9eW8gQ2IND8t4pCiWLD8LEVHN4+/uZZ
	fcFSKdyu+kkY9dLIJfuQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaury003m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:42:20 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69d874805edso1015845eaf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779471740; cv=none;
        d=google.com; s=arc-20240605;
        b=WnJeeaydt/MUs+YqAm/ypO784GNiFnG4d2zC0I1tIEegCbkFwEuSpxZS8IWq7XdJYx
         wgqGroqeVmmzosfY84mR9cBdeF8ouY8un4aBnc0C3XemxJAilGwuisMqQC+K5y51+sIJ
         pD6y3Be0+QJuFG1A6LCbQAJf0G2pHx4gM9AqVC6Aa/RWsWv/AM0tXKw0TT/0qSHKgIy+
         Ai/4Y/jnH0WS3k4V5+y0VYj65pdV1M6wNhYf8qHO835/DTwJY/7SNq6exoNspzKma+Dj
         FlInEyd67/CyNiQLi1ADgFlwQRq+tB+7BK6LHPj1GhOsPuzdxtg+slsPToJR8TNF/5WM
         0YnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=SNQk7VFC+yr2lz69rbbAAuhRoGnK8y0rkA2N/S6BXs0=;
        fh=SisEafq4r0S6VZ0UhOgHvxqiowBua5Zi1sCa1mJlKLc=;
        b=cQUQVMl96nWyIxDZKpqZAi5sRGET+hnhaihqJsFjzmlqYG6diSFXGCdX+Vyhe59wGq
         QkzJCj0UFBv76UsfmU+uwMprYv3Q3kvJ98Quc7RPiWt6P30tTz2qR6Q0aQ0hRZndU6ZV
         EF9bhb+0QDi+ixTwvj+iSiHPtpVZU05bHfSf93v/Tnsm6KyT0R2TtuXaK0a6XyD8Pig0
         FQag8N/srKSRWkJC3ozAXkYjPXRHjXQ/kYjYq6xdKjhZ3QC+hn4lzYXfmbAhVJPqpAfo
         H1t+bBXBN7LVYUOyFzqlanjZbvgwSKNHUYXXyC5HN88liTkiyx2wVr3SrgZ5iNahCXQh
         adCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779471740; x=1780076540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SNQk7VFC+yr2lz69rbbAAuhRoGnK8y0rkA2N/S6BXs0=;
        b=LDRMXh3VXG3beoZFr7MCRHmf6rsI0/4FYuaEgaYeeq64zc8heBwi5BRxK/WYTPP63J
         WbT2neHCZJeViFj3FqASclwxz1aF/V6ThGIRGEMga7IiJpm3WxJchN9HYSc9Dv1/aE/7
         CTYeyNZOwafEbb/E8oBGCgmdeRIKMitAyDPWbSBbqaORiiGWJ1K8oMxGx2hygadJbavj
         Xh9s4Mn2QFcnSyD2hyJiNLA13k06WNaqw/ps26L6c7jqm7RnkqCJsa/10Z72dhxHL/1U
         LEoqnpKZ5brbslVx8BGM7Qv1Gi4Q5SeIGvWezlC8yEmwGvP1EZVPMOUHK9JeR/mgPLc3
         h57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471740; x=1780076540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNQk7VFC+yr2lz69rbbAAuhRoGnK8y0rkA2N/S6BXs0=;
        b=da6uD+wUzez3N+n/tqWqpoKJgnYfyGRyTx1Fu1DGHcX+N+AJOBIaAE0IAZr9UWeyEy
         m9BVgLNiMWrpW6Zs2SxpOdKTI6Dfy8ZmOw6UzsRHPCEHRKEMqBDImlyhgFwYH7XNERXR
         FJHAj4rGHqUj3XKehiM/GCMH982rlH8fzecnzwg+ndhpxsXFkAZ005D4h21fi7AmYnHS
         ZALC7F1+ZQR1nys8PaLCWvnSTp6FhizCtIYc7zdCReuuj8QyGdjDl4FthJH95xWYDSiw
         YiulK8PqUjmn5lmj7WzY32IygRMQLj9mY3wMpqdmY3JX2pbs1fGSUdVhgspyzvgzExS5
         lIbw==
X-Forwarded-Encrypted: i=1; AFNElJ9WxLCFzaV0VXwfH7ZTu6udbu1vPoxyJZHt9z6tLjIHM3AYNhW9L2Hokh2pvvaqsFbKXTCn2W8X8o/DVYyj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr4FuZHG9Pwsh8wQ/AbMDrX0EyTHjnw/ion5p4r7Vw/BCa9Fus
	ejb7Ba0H3h4dY6fVeYqmz7pkbxzE5VvQX5lIg2wYtdPP0QLCDKk53DqSH4JqgKFO2ib4A3tqt+N
	vJ20hTgTIHAWJnSugNWlv18I0Ri5cXthWjtoP4VeqVgJW3LHalbhRDuK/fGNGwwIBEJN5QURiLB
	qz8fKRm0GuD3oBaBzLVTaXeNXc9GJOso6/ykx8KxpPFpsUry9sQBM=
X-Gm-Gg: Acq92OHtOCNxESDnwagHpIyK9DyjJU7HiCWdciqph5+f4PkSL4CzDukrZCtpOjQcKIw
	RMf1NblhaoecLyEJBf42y0TgYrD1pIQABnXoXV9KKVhRa1eMTZnaWDh02dawSh3vkP5koJ+rJrn
	XcWZ7FBEzk7IvIKpiG3fpddO7F0hLc4uNU64N4LU2ExyKXDSTdUbsomuvz5u40mUkUR4lFDmkrX
	9zwVJRlV1cfNAode9p+3xvFrZ9NaqqMnaAExw==
X-Received: by 2002:a05:6820:c95:b0:695:a638:c6ba with SMTP id 006d021491bc7-69d7eafdf79mr2473681eaf.7.1779471739781;
        Fri, 22 May 2026 10:42:19 -0700 (PDT)
X-Received: by 2002:a05:6820:c95:b0:695:a638:c6ba with SMTP id
 006d021491bc7-69d7eafdf79mr2473650eaf.7.1779471739286; Fri, 22 May 2026
 10:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-5-mike.scott@oss.qualcomm.com> <e5b40f3c-25f6-401b-84d3-2fb96897d936@packett.cool>
In-Reply-To: <e5b40f3c-25f6-401b-84d3-2fb96897d936@packett.cool>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 22 May 2026 10:42:08 -0700
X-Gm-Features: AVHnY4I0siniFNARRZUvZAYX6iou3EkipwuWUwmBSRJQLSPUMmCVdlbdpra87SQ
Message-ID: <CACSVV02itF8VWQ6y97mFk0pz7a57c6247CuReZzzpdv7LJ=d8Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma to
 256 MiB
To: Val Packett <val@packett.cool>
Cc: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        bryan.odonoghue@linaro.org, laurentiu.tudor1@dell.com,
        alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NiBTYWx0ZWRfX1y5hNPBItWHS
 B4kP4OJpwSvYPk7EuBZ7vLisCDhEvxSjZ945zLfcDhBefNk7AwScS0u8LH3LNIOuDLlWSFtgIpi
 Yig99dhJcHxN7f1EtXnjNRl4oFduZO3DmNGWtQ/UVs8So4FvR4K00XqDZsRKS06PeElNzmmdWb+
 eMFZZVuWRusGgJmhQNB+ShNzoCb5xSBEx5bNRf5nQi0zsA3+acfp5VdIYpFt3jE12GGS2E9pe5G
 FXUPYbF/fWpZKSb2a94Ct9KVhRCqn/fDVpa5OXOhvrR3ocgBtwjYUCRAzqLuu+oJDcMaKhkZsxy
 XK2yZ8taMh1SFq4sztdNrpFgPvz0BJU+npApcARiPCY6YX31Si/bs6hl3VfRk7B/cAdPP/dvhCv
 kFRWfT9bO5avkDBFzEk/ugtiYXQp4TLETdG8x98JXzwK9QM/MmlAW1yK67heTRj35b15wfJz52W
 EzYsJoBwA0c8FEJhk/g==
X-Proofpoint-ORIG-GUID: syTfQGZStsiPJsSNIu7tK_uNDnJvw24w
X-Authority-Analysis: v=2.4 cv=d8fFDxjE c=1 sm=1 tr=0 ts=6a10957c cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=bUDvy5jRn-tkqcjj8-cA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: syTfQGZStsiPJsSNIu7tK_uNDnJvw24w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220176
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109390-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,kernel.org,linaro.org,lists.infradead.org,dell.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.10:email,packett.cool:email,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7F83B5B8B04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 8:55=E2=80=AFPM Val Packett <val@packett.cool> wrot=
e:
>
>
> On 5/20/26 10:09 PM, Michael Scott wrote:
> > The 128 MiB linux,cma reserved-memory pool on dell-thena is too small
> > to support the camera pipeline in parallel with the normal Linux
> > desktop. On a freshly-booted system with GNOME running, the typical
> > runtime consumers =E2=80=94 msm DRM framebuffers (Wayland triple buffer=
ing on
> > the eDP panel), qcom_iris video codec buffers, qcom_camss VFE
> > pre-allocated buffers =E2=80=94 already occupy ~100 MiB of the pool, le=
aving
> > only ~25 MiB free.
>
> Huh, I'm surprised that drm framebuffers use CMA=E2=80=A6 IIRC, msm drm c=
an work
> fine without a cma node present at all.
>
> Indeed, with a desktop on a 4K monitor I'm seeing..
>
> CmaTotal:         131072 kB
> CmaFree:            1704 kB

Is something in userspace allocating from dma-heap and importing into
drm/msm?  We shouldn't otherwise be allocating from CMA, at least not
intentionally.

(I also dislike specifying CMA in dtb, since that seems more like
describing use-case than describing hw..)

BR,
-R

> > The libcamera "simple" pipeline handler used by /dev/media0 on
> > dell-thena allocates four ABGR8888 frames at 1920=C3=971088 =3D 32 MiB =
total.
> > That request fails on the fourth frame:
> >
> >      ERROR DmaBufAllocator: dma-heap allocation failure for frame-3
> >      ERROR Allocator: Stream is not part of /base/.../camera@10 active =
configuration
> >      Can't allocate buffers
> >      Failed to start camera session
> >
> > resulting in gnome-snapshot's "Could not play camera stream" and any
> > other libcamera-mediated app being unable to actually stream.
>
> ..however I couldn't reproduce any failures, Snapshot started up just
> fine, lowering CmaFree to 300 kB.
>
> I have even launched both Snapshot and ffplay with a 4K AV1 video
> through av1_v4l2m2m, CmaFree went all the way down to zero but there
> were no errors whatsoever, both worked simultaneously just fine. o_0
>
> I think drm buffers might just get evicted from that area or something?
>
> > Bumping linux,cma to 256 MiB (a 0.9% reservation on these laptops'
> > typical 27 GiB RAM) leaves ~150 MiB free at runtime =E2=80=94 sufficien=
t for
> > the libcamera buffer set plus headroom for video playback or other
> > CMA-hungry workloads in parallel.
> >
> > Tested on Dell Latitude 7455: with the 256 MiB pool, CmaFree at
> > GNOME-desktop idle is ~150 MiB, gnome-snapshot streams the OV02E10
> > camera cleanly, and `cam -c 1 --capture=3D2` succeeds.
> >
> > The companion board files dell-inspiron-14-plus-7441 and the upstream
> > .dts variants inherit from x1-dell-thena.dtsi, so this changes the
> > pool size for every dell-thena-based laptop in one place.
>
>
> In any case, that's not an objection of course, just wondering why it's
> working fine for me and not for you..
>
> Acked-by: Val Packett <val@packett.cool>
>
> ~val
>
>

