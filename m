Return-Path: <linux-arm-msm+bounces-107307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEoaOE93BGqpKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:06:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2381A53395A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C85732797AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C3240759F;
	Wed, 13 May 2026 12:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDIq/Rxu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhqhFQ5I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1C5402426
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676699; cv=none; b=HrZoqjfV9yZBFJCo6exYfYmYe2XcxqSfv/Wn5SEjWocEM0N4ee1b6pHKGWSuWP6ukrGHmaSkmDOSiqJcb0QQPIfRzxC26CglUTAQbpagPkKO1u7oSypBIWvdhdaAm2+cKk6Sn0aqV/AAN7KjEgvkOe4uv/4bk8qHIu8+NM89u5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676699; c=relaxed/simple;
	bh=iZ+rhY6naGHKhMzrP8QxXXInCAg359+FOPwWyqsge2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRkon76LhiE2Q3NDum2hi9Oprm7+2UeshhkP+/SEI+iZZSxxpL2wcXFcP61JzycCL+EqicedKkXbstk09ZfeCr6AtOpfsX3+e6EBWQuiBlfQ3Tu8w9aOFAuYcuPSksoxWz4RYAzHqGiopv4BXm1aF5hLDpiUFyrFCiaU0SeCR5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDIq/Rxu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhqhFQ5I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8x1Uh4159972
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kn/YRSmu1AmAJzx11ds2slyz
	figdFYuhEAsgIp4NDkU=; b=NDIq/RxuVg5XYMINy06ojxe7GwBFB7L7J3aXz/LS
	4emn1bqc/pRI6ToX9L4lwDJwgUt6vbxim4gCk2AIEDlFZQvQ6TUBHY4thmHCxASD
	ym6XNRfqdHyxRo4FQpiUWfyItlAKntC2C4kkTD5k0Z2PM7SNkf2/ByUFma3Jqize
	1Ncb0pYX0q8xmuDu+cDbTouWdcmoVEW8EURr5xqU6+rLI4eWLeHzHsYWuuBidxy+
	wDFS5jsPP+y06x0dJaUVop3oixYvSVLo8VdtwrQw+sEexabiF5pKWJPaF6Wbqif+
	DbsMwbXCB8zFCJY3oJjMR/Q5axe0njkSN42RdqPk1OUHsA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91rtp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:51:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso8424499eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676697; x=1779281497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kn/YRSmu1AmAJzx11ds2slyzfigdFYuhEAsgIp4NDkU=;
        b=LhqhFQ5IIB44hLTpwBNbdhscYptc3t4HxPbXz/76ykTBR4Tw4c6PHKDdezlKRXUAf3
         fGTv9+EaiOPSl2T/q4UcJXhSDmT8c0srS2tKOof2fzExME+n8HNX/35yZKWuElueysnC
         Rk2RkOOOBobxWmaWNtxn0qqztPiRAXCXr650ynAjIncISeEg4zLtafoF7mDJ9rcKenwa
         LC6ELcJEGlrY/XIgyTWsey8VebkC92+RvKmWjehKJTeeA/RugjG77NY73iiUY6IfZQLT
         V0s9rr+/hT/VEr3ptFAGMM8VjmxR8sGOaSQewTUPHBHP2mGg6ZM6CzHAgy2zNimXEWuD
         hIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676697; x=1779281497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kn/YRSmu1AmAJzx11ds2slyzfigdFYuhEAsgIp4NDkU=;
        b=C+V/BG0D8ThVeOMKuYE8Vt16Rjn76qqxb3GUhFgNv1fEGloLvSZUpPXKJ/PkrAS9L3
         e0P3dBNOvKtl2oN4XWwx6xPuD/w3y+eOXz8xPjBFtyRRokXd3er+0VaVH+/T3WVdP2ky
         TUGKMCUZxj341QljRONMt3D/In6CSWZkAhQEa49LATQN+9bnykv9L1lWwsKGbqsqOWcn
         yGSaAworrNbILYz/c831UhVfFFa9TNx/UcqjMhlXGq0AJZCzyylkgKM0tavVffwuE72r
         3EFrcqjJaJN9UN+9xhpHkBSi+vaT5xKVwOEYxvr0KI6ALw8R1aAq7qRm51o324cOnaRE
         misQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uEoFnZ6p16WcbwEDoxbd5XwgkCU/Xu6nX/iiD6pSoPGfhUh6H1YA7LCx2zfYW1X5CPOzvlTWHunhOKXi+@vger.kernel.org
X-Gm-Message-State: AOJu0YznwwwlstYavWVCIXX0uNi3eXx7sBnB/r3stcTX3NpUlKdajomx
	cNuv5Z0QKy17PEZw8oLkin+xMYGk9HEk0MLy7PgXn2N1kbl4uEHldLAQJhpNIJ0ZBkP/GSYyQ1l
	vIycypN6M6OpcnFvNij/v2Yn0p6riDEY20IBgi1lHCUeUQ5yKtQ/JrfjJTzqWIuIGV1Fx
X-Gm-Gg: Acq92OHXnS6xd/RX9ny0AyMTGpoUXoV2XLf4/3Jr3xNEc+8fDWIJ6cFjqbqta4Rewgk
	ZPzNk1OG1L0biNOrINt0A5wI14k5bc/Oekj95l+hUgiyIsN+3L2OcbY3xcN6buKi4sa0eTCi+AR
	GTz8qA9kKSbHS9Y8sN+Upx1WQN3U1Re7V5ipy4RuGxNqpBf83KBLxqh8Ttkjp6aT5F+RBPWFpFk
	uSGQD4sFo4D+DFF2CIr5JBCf3v1pb47wa6ZUons8534iEqqI6kEbHh+7O6XhbCslplZ9u4S8Z1c
	/iKadFJze2l+zxjJvXwNGsAJT6qBXWnMP2u3NLVIvAgZYIeF0Av/PNTVGJv6fsdCd36+6XhcLd0
	24HVIJb347KvQwlaaf8TeLFJVv58HRgw+0CPP2mhHerr3lyxVubU/40Bd3Brh6U2Q
X-Received: by 2002:a05:7300:e7a3:b0:2f2:8857:180a with SMTP id 5a478bee46e88-301541afabamr1201361eec.7.1778676697409;
        Wed, 13 May 2026 05:51:37 -0700 (PDT)
X-Received: by 2002:a05:7300:e7a3:b0:2f2:8857:180a with SMTP id 5a478bee46e88-301541afabamr1201342eec.7.1778676696838;
        Wed, 13 May 2026 05:51:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm26728284eec.21.2026.05.13.05.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:51:36 -0700 (PDT)
Date: Wed, 13 May 2026 20:51:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <agRz0VSlRYKiRtxJ@QCOM-aGQu4IUr3Y>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
 <adm37MruBfXAjLpZ@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adm37MruBfXAjLpZ@baldur>
X-Proofpoint-ORIG-GUID: YabakaMObUEnFkfAENz8IHbaUBHZg6k3
X-Proofpoint-GUID: YabakaMObUEnFkfAENz8IHbaUBHZg6k3
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a0473da cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=j6KSvuxjzLO5aVo6jmoA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMyBTYWx0ZWRfXx9QD+XkKQ1Oy
 ABrwUTL50Codzeh2PSkIvSOdV3v94vAeuVxzMYjbWEKKobfMmiMCEgj7SBoYgNm7a7nKB7KS+Kt
 DRijfSt09cxWVxIiPrrQnHApvgkU6t0dDenkedU7TVyKMHewEOKmOVAJfSJ54t3vCLbCDg3o1Rt
 AIaaUIz9ijXkbL5e0Na7VcdI13XVeGLa31vPjM0wm/Pm8IjyPZk+l9+w0PrCgjfD2Yqnj3X2mcR
 dGExpd7cIk0ReOf8Edd/wVvTsBO3FwacaMPNAoEE7Da4zG0zGV2+XbO/g1u7wRhOCUmsuYsQqRA
 8jNfb5bjUc6NtYofNidq4R5hcS1fwme+CPxIHVQpMkPYWY+M7lGyN2E/4SnyviXDttE6alTf4d+
 AFEb2cElz3hz655z2WoIW43V7vbfFe0qtfFhhqDspa1SFgU5nOsLsQBTeLxRxCJpbzUl2K/BIBr
 8FMLXaGjUTsshgAj93g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130133
X-Rspamd-Queue-Id: 2381A53395A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107307-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Apr 10, 2026 at 09:59:44PM -0500, Bjorn Andersson wrote:
> On Thu, Apr 09, 2026 at 01:52:27AM -0700, Jingyi Wang wrote:
> > Subsystems can be brought out of reset by entities such as bootloaders.
> > As the irq enablement could be later than subsystem bring up, the state
> > of subsystem should be checked by reading SMP2P bits and performing ping
> > test.
> > 
> 
> I still don't understand.
> 
> Are you saying that devm_request_threaded_irq() will succeed and then
> calling irq_get_irqchip_state() will not work? Or are you saying that
> SMP2P driver isn't reliable and we're loosing the ready or fatal bits?

Hi Bjorn,

After an offline discussion with Jingyi, I understand that we are trying
to provide a stronger check (ping-pong) than SMP2P ready bit to make sure
the subsystem is alive. SMP2P ready bit is a pending state which is not
necessarily reflecting the current subsystem state. There was ever some
corner case seen on production environment (with downstream kernel),
where ready bit is seen but the subsystem is in an abnormal state, where
the subsystem still feeds watchdog but stops responding to any SMP2P
request. A ping-pong test could help detect that.

But since "pong" is not supported by every subsystem, e.g. ADSPs on
Nord, we should do the test only for subsystems that support "pong".

Shawn

