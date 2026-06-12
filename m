Return-Path: <linux-arm-msm+bounces-112865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q4lREWi4K2rOCwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:42:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AADE967757E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:42:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZXTju7jJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Yo5yUxAW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112865-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112865-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2A9D301A412
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6263D75A0;
	Fri, 12 Jun 2026 07:42:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E263988E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:42:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250149; cv=none; b=pr8SbG0e2PAbFM0Nh+tRd0mKTlciZcp2xZgMk7ntJM5p5y9EviOi1tJmujF+Q/hkVw2kak99XVeGz1LMVqPCXHmXU45BYBkK9TDfUcEWnaRGBOVQtAqixCzfp6c5IkeYUlYR+NhkPgQ8pldc/c1lEkVUjCVPFs6ZnB/JSA40NEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250149; c=relaxed/simple;
	bh=8MADXtOGV8KF/kqzB6Db5Pes2x4RwhCItEQeJpl/zmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lknCTDIJt7tnmlnav/ukqJyH+ojXtzw666EiXHXvY85QUHMcAJtUlQR7zKxlVxhvA5JcYtzowMQCe17UzE5ed5S7wPjkn4Lum5t1xrf7zULPsgR087MECRxqKyDEU138YQggbbIzLwJaA2s8A3pm9DWtE7KyzR0F+8HToCWfOi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZXTju7jJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yo5yUxAW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Bgdw2548500
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wqpGE+ezK6pliN8Wm+4US6Wkt5RGSUX42MuglKBmfmc=; b=ZXTju7jJkPV7uPln
	egVHuyspw7m5CF8FU7GlgpJ6ZVImud6QpcZ36XaK+bYX9VTDGHpVeuEsrtqLk4zF
	4OrfAIGV5L/yrUn1LVAbhUV1v6IkPK3U6IIULFaL6G6Tcl3x+I54IBNBFPOxjj/J
	s0GWumcWopGN2WMBVa6n8g5Qu7uiE6heC4d8zA4DEbvxlzwPqyDt90txp4Hzr/HG
	R4O7xtuqdV2YwCi0Ou8S0TSGM+8an2VuO5E69u5ABsH92UwZlbJoNUixlxjnLRiX
	A0NFy5eTsXobq4rtJpKM7/xtaYRZKO0XHI1pfb9+lr1cTfnPShreh9Cq70NmZHzc
	vsYW1A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29ut7fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:42:27 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso274317137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250146; x=1781854946; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wqpGE+ezK6pliN8Wm+4US6Wkt5RGSUX42MuglKBmfmc=;
        b=Yo5yUxAWKhMS8XVbYOWZ7NRQ/Ppgh/oyf11qO6esshnqggWYKo/6nokwChrOgX2EYE
         45FxWtgMjKGz7hvg7raZ2E7/GZyKF5Qj+r90YaBoWoAn8ewhKdAhR7D3FFCyN/ZE6J6s
         tJDgQWD3Ruym752j00vJGOVs42PsPtAXSJa3PssEvqtcFivrXOrv3FyYi/heDHaT9k6h
         gwdM1CpCywW4Amxa7rSlIvugp6hK1nkqewrCmD6UlLKrtjHlRtHa1DM6WY4vAF7b2OjV
         l8/VyKv8lXfZa2UlzWFmLgpV3/vwaSJ+ZefTolPyHmTD8OghZmqxZ31AfM1LnYAlIxVY
         /HNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250146; x=1781854946;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wqpGE+ezK6pliN8Wm+4US6Wkt5RGSUX42MuglKBmfmc=;
        b=kRAxAdEX7OEcD6PVJu2TfXXQxJWnLMoDkqIqprV4Dj8VeR3goNyMCnlF3GQnrabgxn
         RfhPXJVpb/cGE1sIwI01UqAivPoVKTil4Vx2bgCWO5zjh0yoF3N9HOJrbwHSYzojmxnX
         kH8TKyAE3bZb2o7UMzn6pqfYsmL65f532chSC7jTgugTb+Escvm/s2SMLXpIXXzsslTW
         e9RoRQ+hVGH7oldsy25xMEzP631d12GP2Qk1ujWKSxjGY746PJ/6bIPsNQ3iBS7C8u8L
         VNnlSgHWpCJvsh5YjUlcAnP3wm+o/2oChdM3nz7kYOxZA3iawwrBFClu4V2QocPaVQxU
         W4HQ==
X-Forwarded-Encrypted: i=1; AFNElJ+401Zph5KJUHRJdQIQPjYoPR2e1IgBv6JNl9k1axmBvG1swDFFbs+YKv5VpvTizgkN3VN1nvR1hMVDEAtP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz28Teajl07C8rNm8uDeu2QF1CldWnb1BxO/tESfCkVf/l1WZjl
	1wy9xLk64qFf5VvpYh1El/YVBGIsK/p89gka31y6ELmYXPRiPAT2YMi79375Qu92gw8JcJCBkqv
	2PTjcTt3zusc7PXAjFWWZjNDczn5h6SDwQK4yvWuKKzhfjw4U1Jxkm/Il/NIRNMU/ic2J
X-Gm-Gg: Acq92OEFnwLPjQ8R+rKVnDuwvJvSy+H29yXk5XWl1O420JF5p4W7xX/iTtcuFIVQwSs
	GQwwn2DeGNze8B98YKUnB3TpbiBGZtK1rnk0DU2JJBumvlUT5LblGcYEP031++eWrH2ZZa67u6C
	hWAgEWIVIVcDdfJuKns/GcIS3QqkrQz+UnQm6jz61NMKqv8zqFlln75+GNMQb8lACB4sraT8Icz
	hzWXANSuB+Fvyt8gtagTs3TBgUa2sMalAW/sVZACKVQSh1QGAKg0HrbSBGWFiBpHho0w9bsEBAy
	wPBiiQ4h2A9TitpjLRwxwkXQbo1RrcSsrH0ioRJyMGGVCPVMxIMrYSQCzxA3J2BVsKTlfyUnCvg
	CqED1dgwEc/NKGPMvbdQXu4yZMaDUZrs+33WKgiZnDvdg17fmUguaENiOFy6A6pOsIH54cAk7rI
	31OFT6ZowGSpSkpTolGMbFs9+FVGa4hrSdB44=
X-Received: by 2002:a05:6102:5985:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-71e888cbcd9mr558684137.0.1781250146512;
        Fri, 12 Jun 2026 00:42:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5985:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-71e888cbcd9mr558673137.0.1781250146076;
        Fri, 12 Jun 2026 00:42:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c2a00dsm3925651fa.7.2026.06.12.00.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:42:23 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:42:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Subject: Re: [PATCH v2] Bluetooth: qca: Add BT FW build version to kernel log
Message-ID: <ofpsjpkxrnzbnfza2emhli7xp2gwunknywbig6x7pzhis7yqyy@5z75psmjf5s6>
References: <20260609075417.1160702-1-xiuzhuo.shang@oss.qualcomm.com>
 <20260610064232.2385866-1-xiuzhuo.shang@oss.qualcomm.com>
 <CAMRc=MdojC6T1RuqRNE-ssoRw1pKyUHyOS9AD0ROfCpPPOqw1A@mail.gmail.com>
 <c0eee7b4-50ee-4635-b8d6-fe9cb4ea05a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0eee7b4-50ee-4635-b8d6-fe9cb4ea05a8@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OCBTYWx0ZWRfX63tqyxT63QM6
 MnTffVAJ6QH/vOF00scx5HuSHLOKEACcIOkpgKaXE5oOQ/cTRxBm+kH+ZtQBCwa0cPCSvd6rPjM
 hXeReZu2KGokA/LXBQwaOS/lmnZaLIs=
X-Proofpoint-GUID: 8o8OIFzW7S-zIuwJmwXA-A-6rohKUIgn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OCBTYWx0ZWRfXwUkRGeR50fHW
 AkEpIt3raUbu3cph10I1e5rYAwouzC9y5e/q8asVeAWWLJwpnWTwhVjSzuf9OqR6iQ975+jsp9C
 M6OqrZ0/4vuG3DdorJ+PvKyGp1ggrM6AFsFSUf4DioJKT4iWn0DPTU8ZJSOc2mEUJDFZ4rb2T6j
 I5vkZdHZ6RmF8shumSi5s5Qb1t20Tx2zXFzunfcsaAV049zhtIVIwlM7n5q/lOuH4jrHdkORrqn
 pLcTD8I5b1pX12LYTlPCgg7iQxaAKdS894xmVE1E8Uh3q9UInpVfDpB1wf/Nsxe0htsZtxBWi2b
 a/g1oChT6YTkVmM7363K5CdiPAP9BBTv4keRwPcQ7CL9VuMGvkniSryGVc1iNh/onn2NTg8GMS8
 6WCbMNDRfxuV2OFFPsGRJ8nPrFZVLoXO8VspKCYncjFHNkkZAwZv2fi4wuK+rKYHknxC3F9wx3g
 1W4cu/hcHrxu2zNFwMA==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2bb863 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=yzKO1qJbFRXFCGg-jfsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 8o8OIFzW7S-zIuwJmwXA-A-6rohKUIgn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112865-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiuzhuo.shang@oss.qualcomm.com,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,quicinc.com,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AADE967757E

On Wed, Jun 10, 2026 at 03:36:46PM +0800, Xiuzhuo Shang wrote:
> Hi Bart,
> 
> The main change in v2 was the commit message — I added the motivation and an example log line as
> 
> Paul requested on v1. Carrying your Acked-by (given on v1) forward was just to avoid losing it. So
> 
> v2 wasn't sent solely to collect a tag.

Please don't send new revisions as a response to the previous
iterations. Also don't top-post. Responses should go below the questions
/ comments they are intended to answer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> 
> Thanks,
> 
> Xiuzhuo
>  
> 
> On 6/10/2026 3:07 PM, Bartosz Golaszewski wrote:
> > On Wed, 10 Jun 2026 08:42:32 +0200, Xiuzhuo Shang
> > <xiuzhuo.shang@oss.qualcomm.com> said:
> >> Firmware version is critical for bug triage. Users reporting issues
> >> typically share dmesg output rather than debugfs contents, requiring
> >> extra communication rounds to collect this information. Log the FW
> >> build version directly to the kernel log so it is immediately
> >> available in bug reports.
> >>
> >> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
> >> ---
> > 
> > Please don't send a new version if all you did is collected a single tag.
> > 
> > Bart
> 

-- 
With best wishes
Dmitry

