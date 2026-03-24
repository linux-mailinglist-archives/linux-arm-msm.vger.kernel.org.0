Return-Path: <linux-arm-msm+bounces-99595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL+EFA9fwmmecAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:53:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B892305F3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 91958301CC52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D58438BF91;
	Tue, 24 Mar 2026 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWzCjR/O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQNVLEtH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0DE202997
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345325; cv=none; b=CdajLr1j1cqGw6DbA4GGNgXFI2OL1Fej2Y9NmlLVIvNfUIpHWWHEdnBYmOjFc718r8wjHe1nKrdVHlgxsbEAdCc2l8nVOBneVSdBqvHUhxETajFsMXj01zI7mJXJIFuBgY2iU9NOeAoOXMZhqfmp115S1Hf9dIoEkUVBvbc5fyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345325; c=relaxed/simple;
	bh=yYfYa0Ulu8H+nopgk+n9awaeNsR1DO6zHOpNvvw9NXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WsKmCZstYCjHRel52Yfm5jnCwn7TmpTM9GXKP+YY4xZ1PSj/b6Jbi1wo4U7irS7t5GL1fdubRdpfbW9qbdBOs/COBN3d2Cm35GrpllpC/l7WL4y8OSDJJnfYevWUIcnH2kyJuEy3MdfyjKw93RXZh0eXEuWHXSFP0YbYnSiJAl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWzCjR/O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQNVLEtH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4FX3V1910072
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5RZ4GYuvh+6bLS2CH+VBbgVN7UFKGCV6+Omn03Ufz8U=; b=GWzCjR/OrbINmbZJ
	6MOknPUvnd1eshXqPPUnmcBfnG2WVZmSf7KcqyL/OX9L6HBJopkJKyox037aSvHT
	qKDp7TdaQ0yrC4hQnr+ok3/lFlWQlmcppcj2qMCqTbEakWkNWce8trglYrzAAJmJ
	MxZ4UvXAIWvw3AM6yRe7jkzYXJbpJNfWrENT4iM2ViwH6XAO4yoXyrqqh8Lo8XWU
	GFV4PlCvbFlodCFMUlGoDFbnOw1dzmVgvZxbNO9ANzme/OaBhFI4Ju5VIhFFOv0x
	NR59P3A9dwhAcRGJjGL+IPNF22Ac8qK+UJ+fsuc4x0QeLB7HXOqLWXbimmzqlys6
	36yyYA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awytt2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:42:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31f391b8so32343831cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345323; x=1774950123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5RZ4GYuvh+6bLS2CH+VBbgVN7UFKGCV6+Omn03Ufz8U=;
        b=BQNVLEtHKBVDuiRHFI7FU++QSsy9+p2EWvDhLob8fKsnkq5PDrGzvLODlyLaNuxxRN
         Y0nrxXndL6cwCGSsGaq9l/3hzaIWSCeZo7hEEKTYHTGY65u+tAM6BOjzYy0Zq9gK3vDS
         dSZw4f0xQoFj8TuambOCK8oxI7lNBXHYNJwZ0f47t/erUyTat4vFit9W7unXbS8MjezL
         DiUjqE33L9KVG7xVgAv6cyIkWO1/qRG42jMEJVFAJfXw08xTkV1XdbN3ejsANRLmiUBq
         IfxybhEmmoEsD5sFjR2v3ps9IsB7ip+v/BBG4oCE9OvdQ2v9PQDd+RoVwsm93CO1Byd2
         xs9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345323; x=1774950123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RZ4GYuvh+6bLS2CH+VBbgVN7UFKGCV6+Omn03Ufz8U=;
        b=S9zUQ+yWN53xOkpkvxhIIA3KznG+QiI0TgsVWAfXFW9j0W0qzF13D6ETBJc2Plssrz
         ZnmpvvXEKayo6vdueeIn6M4ts9UxBkYHiK5UKdvjfdYp3NjgY2sksPF/sMI2kY7iMHWW
         yzXajL1k0ScHbsywglskHw4jgNMQswkoeaGAQXN2rN4gMPYDT4xDKel1MZojGm1OGS/l
         0fWhLdtrjo5eRd0Y+Wn4rtaxOmkphUNDDmmfv40Kik/NK57SeK1UQJgRqeC8IWs/SGHZ
         WnMUvTi4YmJ/RuINc0J2NkyVjXE2tk8WagqXMdBcKN8bVYg5VLU6Xirc5HVFM8AlBmzi
         B2LQ==
X-Gm-Message-State: AOJu0Yzi6/ZZhWV/lB1PHnmBk6uOs83PIJNNMKETUoabUVb/nhD0wuhL
	CVBDVO5W0TWH4dP/yK2/XiZQv4BYFg45/wq0UC8jilOgt2HBYypFRDuZll1wnW+PqiOPsWvUvDb
	V/WXXURPc6nXdxR1pg9w2MzvPXZJpzIzPgSZhnB5Pc4Vwenr/s6nWCTVuslfOssjZNGKF
X-Gm-Gg: ATEYQzyFAm1supGIbeL5Z2kaNRBUBb+vzE1sqOQ6QLqa9KjcqxqD6lDddrOATtM1zqu
	Enbrw4KKwYzTbi/fCkAW8r3+3MpzQcRGUhuD3sliqb9Q7QQyJnuejxYUnfL+KEw93dnNT35V8kF
	Fz7ecnoMHaMPk1vPKGXDWU378dMZqjnSIok4mcY0t9OCwDqnNtpvAbWgpM7vaoxkcDZS+h9Ayum
	G5GkEDHEZTUHFNv0STiiXbwpXN3WmT1Hkh95lplyoDsm2lHBJMiuPL6wkelXBlszImjKOX89Lth
	Oo/Axv8sMC1pEz+XxW0zeesv/gUg8ZsjjiN4QxF9b2pdsYla9xh0sOyEk6AJZjyBffkIfqNIzR7
	N3lmFDHimTgil4tROFBlcTF2omcupfNV5HR5cQCSZm93H4QKDs3liDxtLRTOFAghTRpld1ZQsu8
	Pszv4=
X-Received: by 2002:ac8:7fc4:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50b37425de9mr176705431cf.2.1774345322794;
        Tue, 24 Mar 2026 02:42:02 -0700 (PDT)
X-Received: by 2002:ac8:7fc4:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50b37425de9mr176705261cf.2.1774345322306;
        Tue, 24 Mar 2026 02:42:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43ae8sm616743066b.6.2026.03.24.02.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:41:59 -0700 (PDT)
Message-ID: <3df24e4f-afba-49c4-b9ff-62db725ff0a3@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:41:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: keep copied arguments inside the invoke
 buffer
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, srini@kernel.org,
        amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260324014459.93364-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324014459.93364-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NiBTYWx0ZWRfX9+Yys/eWk/Hz
 RmvXri90VXHUTN85mEBL7gDDAaUaEMz3mnqYJ9AkCbk6VkIC41p9sXB9FSlLtiHjUoIY5XwXniR
 05YN44meU3sqOrcsUQh9hPJJDNCVb2mVmZ10e/tRqCUvlgRfBWOK2emh4v/9INOeOXocU4PXKWV
 iVUk+R+h4++wSOegxuBWYPe6wldrERk8nkr67TV0uU6TBy+hTxn/3OLkKOpnzhuSsWQovtWmqBe
 ZqAj1YluAVDcCjyVfc+ibhkk9s7Dp6Gr8sJzxEEiLHZiOOnVUyocGO+uf+UtHb7Tm2h0pZkTLOt
 7Q9Wib67EqElUQQq0cSthJAT3WLpf+KHcBQzWXB+c2oMGK4ogW4Bohi0zbiUqobBe3QAAHaNwiv
 1dRMuOHqReF92QCnq17Tv+srLytVxnRwUVqyufK/VD7XMoiWucMHldyB/foQyUlaVGsQGgL4j8+
 Q//rDxtdk9LBBt9jvgQ==
X-Proofpoint-ORIG-GUID: uDDpYPgUrcduw8t-0ZifE47VVurDPkKn
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c25c6b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=H0nZvlvcKp4VijHwmHEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: uDDpYPgUrcduw8t-0ZifE47VVurDPkKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99595-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B892305F3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 2:44 AM, Pengpeng Hou wrote:
> fastrpc_get_args() derives rpra[i].buf.pv from the overlap offset that
> was computed from user-controlled argument pointers and lengths. The
> resulting destination pointer is then used for copy_from_user() without
> first checking that it still falls inside the allocated invoke buffer.
> 
> Validate the overlap-derived destination range before storing it in
> rpra[i].buf.pv and before copying inline arguments into the invoke
> buffer.
> ---

Your contribution lacks a DCO:

https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

without which we can't accept it.

Please run ./scripts/checkpatch.pl on the patch file

Konrad

