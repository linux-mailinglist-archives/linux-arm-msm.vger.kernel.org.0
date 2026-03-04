Return-Path: <linux-arm-msm+bounces-95274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MZKGZv3p2mtmwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 10:12:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C3B1FD5A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 10:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47EAD30CFF06
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 09:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9E3388365;
	Wed,  4 Mar 2026 09:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="awZOxuVN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DI9QGZHE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C82E3542E1
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 09:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615117; cv=pass; b=B75x62vp0vgU6jpg91SXHjx+Sr1aue449kgt66HtcIOTqUl9JI63J/iH2Tq6mDb93J5UbqelRSaMFh5yujokgu9EgQxIxEISRWZFv/ID24SJDnhYuNvD4FRh0jBpE368HPGuqXVOM18IZNR5OP8kaC7rDYduETd5Lnfu2Xr2/iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615117; c=relaxed/simple;
	bh=FKLPownS4as4Rxizmq6wK7Bz0LkGYz79WGXPKG34n58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hsexfyj2HT3/yY+rDGMlY8il5vEmEMOjb1zqGlXMqzJarEzoayTVCcU3OxKGATdZJF/fhCBrTSWp3W4Asm23cmTz4U7zqkfKZOl1psDySX+XVO3hLAamNBRyQbHbql63mqZ/jVlSdXyh5kMv2jyJ4PR+Q1xD8bjxvKjg5h4MKn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=awZOxuVN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DI9QGZHE; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245ShsU1422295
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 09:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3ktBi77zfr9Ur64Nq/nwGV7YZKe3x1luI3+JOAKuMc=; b=awZOxuVNTvwZ2+av
	WPZlYoD53H5UyBDyiduxLMCXEcxjGmx5GoNpk1jU6aqt1G5kK3OrObXSXVVRzNte
	NOvxmwY39p2J7rOHaRj2/YYL4uy2Vlc74lnjFhfZ6qxVpP10jhmRJp6fA7mHq1Lj
	UZKYNFdbs9xLSI/lFPJCmgtVW0EqLgdJ9FeAQvwNKQB+9oZA9nHRYMoOVKXCfdAx
	Oilktxm5mYA6T1VApB4flJac9/Z3we3bnbuX49UsNQiO6yMkpw5RZ0vjHnfgoUVF
	3cDFYOSsZU5AJOzyCvUqVYv8CImCnGgVDrubkg725Z93ga8bmbchh3opmOZgZ+6e
	/1mspA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u0s8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 09:05:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a178d7270so84148726d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 01:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772615115; cv=none;
        d=google.com; s=arc-20240605;
        b=XHi36uL3eeiwdiRFXdapg8aAWBIEklsffZs47Y+kcmM5Mgaw+L3Jaz0HkY3BJr6FbX
         4aGnNNhaH0x1mxuzPp6qFtAEkGnpNJ+PmGdggViQ9wBipGzXeuNhcY2vq1lR62SDJqrp
         +HhPxQiXqWqhrObNyT3nliDkWeuYLxS5HiKy6CyfcHWZTFihl/EcY7q7ILcw0lIGr2pM
         8E+yhyCisq2e+xGQ+6uBcHQ1+FB3Gum53/9umwNli/XzHoz5lzAw8klJDW8TJTV/SrsP
         Xh7vgLtfX01pYA6n846iEnKjWHnv2XMnPINVl6lNwbtRaH1t2U6PoZu3tc6kxLGAVFfr
         gGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r3ktBi77zfr9Ur64Nq/nwGV7YZKe3x1luI3+JOAKuMc=;
        fh=SU9lVQmN0ceW8AKTuZLhXBThNFa58E/eO4eNnAAj17A=;
        b=MkJp4y+BAlgcqihUEyun8V6gYNTWzfwCgBRq1wYiuqsDnWQFk18ArKnQV/TRyi+1s8
         9F0dQ+4s54ijxRWMOCjjWiQsYZRPX+Ymvbp7mhLwiwUjlvRE1u97rmoSzX4gEFmoM7YM
         VbMezc+W0YIlI5KSPgv07vBZ9J5NRUF+u9ESXr5dxrrScH1aPCxYEJTksrAbsrjC5F/y
         7XbfhTb+YhEv1ysjhGiF40UVzq6MZ2yQrSLU3bbjYzyenNpa3bVtkh+Ql6tiICOV7Wk2
         0PztjL0MrEcVl1jfCoKXLYMy96peYwbMIr5+hWUO6/EWJ7bo1GV9B5Y0EkrO0A9btFfI
         RyHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615115; x=1773219915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3ktBi77zfr9Ur64Nq/nwGV7YZKe3x1luI3+JOAKuMc=;
        b=DI9QGZHEhcIqz6JrJzfhBLx3tJN91E+exN79NV29RYbMTORZpYFOAyY+zfs7szROuS
         1ShVJ/VB3KeVVvRSs1KnXfrd7rIPtQyAh0y48y8+w6u/QOUfejPUuIHoO2NPVTJi7cCu
         mU8yUKh92FGV/YDWftvEqiHc79qBHbAXNRKFAt7NzbNIlrXEuW9mJ2Ez69wq6zVKzk34
         ugik7eHc0fqG0h6PLfFUCpjARP6Op8EyQTHEoDxbrGhi36uZakuaQi0INoGJAXqxTgf1
         ztzQWNiysCo5XXAhls8iowu7FvHg+NCuoa8XNKWR4DtzNheVAXuStk2njofvjIYfKLd1
         PFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615115; x=1773219915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r3ktBi77zfr9Ur64Nq/nwGV7YZKe3x1luI3+JOAKuMc=;
        b=SytlOx12r0iinxutLyehS6sksxmoCbD6TAwh3JDh6fCg+EZtZmD8KsPk0pASep993o
         rgVxwVHZJxovVHWhZDWgCkTKsiCMndpZFEazpveIXB70C0tMCS9CMmQAiv3iV6kPyqDF
         KE2iP5NecDTRMn1PDkkop2O60d76Pb4YZ7eKk7aC3ne5lOufE3bE+l06MmQp9S4dWr6X
         qCDuBdtqhg3NIaSgmcIc2TP28cvDTsHdnhgexARGgrRN6AbA4dLnq0gosjqat0K5cfsl
         FdspdaMAjhgAzfiVg1+IWIq4hvSt8fVDQC7OmsejDfmD+yW3O0yUnpLQV31Oq9FaB0xE
         PByg==
X-Forwarded-Encrypted: i=1; AJvYcCWq1/kU7KR4aPa1sr0FfDC+8hS5DHI6MCTe0J379zy8aIEpFARPEOuoDAEUCofiOe1E8jwuVPJzsijnCy7y@vger.kernel.org
X-Gm-Message-State: AOJu0YzUelp4s1C/fj2gWe8CxOD0l/N0XrM9BUEQfJG9Q2L1KHgATDBR
	Pi9EafUICST6Tda6fcAcXHKvkFGNOCitRikfgAPOHEebEoBBBi8Lc6tN/h+TsHpIDPPaShAa2X5
	2r3h13uoneeKTZqPYye4hmkq6SiZVPVKHC2b5O+z0o9w0T6MtuSSnLLyJvqELUOLpESAHOwa6Li
	wc+cVxEAkmScuAppeoXljCFBk02DZ3T/JjjZbl9/PULkU=
X-Gm-Gg: ATEYQzyoffDnywf+i1ahJbAQ6RLhpKlu9FaxqnmmoGkFRzSr8D3zhmt1eWJ+36k9cZh
	mQu6GwFDglgxskoXMYgECqqJkwaKLIAspPTfn0XJPko09XSRyMwoamHkt5IAMmn6rzBxoRaUbAJ
	eFXH5Wu6567AIL69g3nAriPgMJfxnvgenNrWXJllqHmQhX5oGmuTDOriZaHThZn9zBQu3WGpW4N
	Z7xKEsljzbHp70dDUbeP0XtGeF6xj5oeKiExgDO
X-Received: by 2002:ad4:5cc3:0:b0:899:fd1e:47be with SMTP id 6a1803df08f44-89a19ac3694mr14701966d6.30.1772615114891;
        Wed, 04 Mar 2026 01:05:14 -0800 (PST)
X-Received: by 2002:ad4:5cc3:0:b0:899:fd1e:47be with SMTP id
 6a1803df08f44-89a19ac3694mr14701676d6.30.1772615114437; Wed, 04 Mar 2026
 01:05:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 10:05:03 +0100
X-Gm-Features: AaiRm52GpPLERaXH_bo6QPLSahmWGlT4Y_NVOOLhpNvAEmeb6xiH53K9rnhnSsA
Message-ID: <CAFEp6-0ik4B20cRyid9w0f+UgibGciPof9HCWTJ=uBOPvHG35Q@mail.gmail.com>
Subject: Re: [PATCH 00/11] char: qcom_csm_dp: Add data path driver for QDU100 device
To: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 3AvJecpUmemWpdHp4jUz0GM-TTlnDH1X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2OCBTYWx0ZWRfX9mMUdPLJUUsS
 yILKc9sJsEHVvVQ0IvUnXA5xudXrGkka5k+lQIFOr0obCyEYg550FF8yaVTOSJ8XQmovibGZTlr
 Tm22CjeS/9YjSDtnKhsnrErYKkAI2Bea5IIsQD9CLPD0KjC1Auf7yxYd8zfylcJ5AXtEWv4LCPW
 7oYRo7cMSLMZHGkB6DUTMbs4JCYHLb/c5OAl7Zpr4e/uQx5gY+26z6bSXscf6c6pFL1fuCGbCHA
 VKi1NoOdBMGHkdxYsC1DEGPYvNmhr+PVyoJM2ccf49n1WVBkkjQRq6xBfA3hMxo6TdSwpqVZHEx
 i54RnTbS6EcImZRxRzZFzQKT6K+j4ruxxcH8mpAxOXUCOb0Q3nJF/qFMeMCKsycuu2dBlmZxbDW
 Ll3AvmMvv7ZXSg+T/K640eFNjCppgQAFjHDHqfGdnKN0AdvppVFWRDVF5EIw7GrHKi5B3QKxFaM
 fUOs96C6ClBbAc0qdKA==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a7f5cb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=1qH30nBXnUapzXPqwXgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 3AvJecpUmemWpdHp4jUz0GM-TTlnDH1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040068
X-Rspamd-Queue-Id: 04C3B1FD5A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95274-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Hi Sivareddy,

On Thu, Dec 11, 2025 at 9:07=E2=80=AFAM Sivareddy Surasani
<sivareddy.surasani@oss.qualcomm.com> wrote:
>
> This series introduces a character device driver for the Qualcomm
> Cell Site Modem (CSM) Data Path (DP) interface to support the
> QDU100 5G distributed unit in cellular base station deployments
>
> The driver enables high-performance communication between an x86
> Layer 2 host and the Qualcomm Distributed Unit (QDU100) by

Why specifically a x86 host?

> transmitting and receiving FAPI packets over PCIe using the Modem
> Host Interface (MHI). The design targets low-latency, high-rate
> data movement suitable for real-time 5G workloads.

It most likely belongs in the WWAN subsystem. While WWAN currently
focuses on User=E2=80=91Equipment/Modem=E2=80=91type devices, there is noth=
ing
preventing us from extending the framework to support Distributed=E2=80=91U=
nit
accelerators, including defining a new device_type or other
abstractions as needed.

>
> Key features
> ------------
>  - Provide a character-based interface to userspace and register as
>    an MHI client.
>  - Implement zero-copy using shared rings and memory pools to avoid
>    data copies between user and kernel space, reducing latency and
>    increasing throughput.

We already have established mechanisms for this like dma=E2=80=91buf, udmab=
uf,
io_uring, etc.
Is there a reason we can=E2=80=99t leverage those instead of introducing so=
mething new?
Also, AFAIK, MHI is also already using rings internally for transfers,

>  - Expose ioctls for memory pool management and packet transmission.
>  - Support two DMA channels (control and data) with system
>    configuration ensuring correct channel assignment.
>  - Add SR-IOV support so QDU100 can present multiple virtual PCIe
>    functions to the host, scaling to up to 12 devices with up to 4
>    virtual functions per device.
>
> Userspace API(dp-lib)
> -------------
> The character device exposes ioctls to:
>  - create and manage memory pools and shared rings
>  - enqueue and dequeue packet buffers for TX/RX
>  - configure control vs data channel usage
> dp-lib: https://github.com/qualcomm/dp-lib

Since FAPI is a standard, could this be exposed as a new generic FAPI
interface/API?

>
> MHI
> -------
> Add support to read MHI capabilities. Initial post of MHI
> capabilities is referenced here:
> https://lore.kernel.org/all/202508181647.7mZJVOr6-lkp@intel.com/
>
> Add data path channels and event rings for QDU100 VFs. Disable
> IRQ moderation for hardware channels to improve latency.
>
> IP_HW1: Control configuration procedures over the L1 FAPI P5
> interface include initialization, termination, restart, reset,
> and error notification. These procedures transition the PHY
> layer through IDLE, CONFIGURED, and RUNNING states.

Why calling this channel IP_HW1, and not FAPI_CTRL...

>
> IP_HW2: Data path configuration procedures control DL and UL
> frame structures and transfer subframe data between L2/L3
> software and PHY. Supported procedures include subframe message
> transmission, SFN/SF synchronization, and various transport
> channel operations.

Could it be a FAPI_DATA channel?

Regards,
Loic

