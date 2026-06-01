Return-Path: <linux-arm-msm+bounces-110584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EL+AHi6AHWpZbQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 14:50:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA34161F8FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 14:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F3973051CB2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 12:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BEF282F38;
	Mon,  1 Jun 2026 12:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6DgpAca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cT2RevEZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09893378D98
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317556; cv=none; b=T7ak7ftEnIG29lCLOm2HqNdLlMt1rAUCGs29ztQgLlQEZuGfuhF4frSGrqQ/KXeXg1Zpoa24EuFeSRXrimr3uO3fspgiWPqZbypvn9zc96zZehzxT6tx2zquZqNA2kuvWlMjY4CUnqPf29P/ZbxUXvfy5N+g6hqM0o4R9CWz+JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317556; c=relaxed/simple;
	bh=uZKAlzf7H00gfTJ4zkQUHuksFx23Biv8PA7xoypBD84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcJEnJJcdt2dnYKFnluypyYBYAJfC2wBZyLcXK46MdURCEjZUrNsLNZzvTHMoHWJMFbomz34/5JpjVsCXjTgvZ+ACDo3/Ubc6Vh9QyVah1JrO0LaF4fQMVOoWzBb6KOAsIm1rQwVNrwtg4N4FPlvi1tVSLqRfoqvrW7lmdzuKgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6DgpAca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cT2RevEZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fDRA1257485
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 12:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JRiALWW1q4VYFGDWLlQd3Ej64Mgp/dDEtl1c9ayDqEU=; b=C6DgpAca07JGRfj0
	YSHsXLqytPOD6Mr3amFxTGlYV6lEFh7yJ2F7nfLAAMoPoztiODAXI93CY2EXGSoM
	oYNXJDgfagsgBqiNV3OOOB2+ZrLnXJytydWv7lqOZkER7qZ6n1TkFNJPhg6zG4tm
	SnXANb/HMfb/TvYaYRlTOPhzXPcdDFbcMG//fHtz2sgWucp5+v9pUAhAc2wF9HcZ
	2TcKCglsm0GS08bLFvxZza0K5W0xMHf0g5RRDON+i3ZiauezmLk4CfQlMtLGXlPC
	P4RqCvkieHscuXlF/KRPPyR9VDl1HBEpfVUNpbcxVIiLolzcSbh3w4PFdKKAMaHj
	NaTtkQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6ssrxw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 12:39:14 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963a02dca36so2962642241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 05:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780317553; x=1780922353; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JRiALWW1q4VYFGDWLlQd3Ej64Mgp/dDEtl1c9ayDqEU=;
        b=cT2RevEZCqPU+BbEyVVj/z9HK2d2ZkZi/gefI3J7IBDB77VxRD5MYkxB6RuDI2Gs8v
         Qs2U8efvxmr3+PhIKXMi+Lp07zEPL7dJk+V3K0OaLkMnJ39JGhOKRj1r2X0GzP7sDJ4L
         pX5ydntbS9z7nyccOwsmSAb5hJxGGgUcggcLiH6NlhqAXoYuuDPYRe4E5vDY19Se45R0
         l2H/51KqTgyeZrupxxH/CwnPEFlqWm7u3OXmU5IcCwT+tI3IuKSdJe3yAFP0OSX5mFqT
         DnT7MW37RmoVxG8LJqaiKXRJCLM67Ft4P9ISAhWwFx79Uaqwnkf0E1UQi8c1BmD8p4Nk
         a0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780317553; x=1780922353;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JRiALWW1q4VYFGDWLlQd3Ej64Mgp/dDEtl1c9ayDqEU=;
        b=RdzLXncL//zR7q6cUm1ktAFsjGubvmP/XYu7am/O/krzKDBV0tOtoqGSjDqo4qc++m
         +hkbiFkaISrdc2sQRlkL0LuI0dBbD9c7gTtEX5AJv7X6XUKovSSXL29q4EYZKrySpurb
         k01fir7DM5IQT6yAaUHorlnZf/zvqJRrKSMDlBxGWcSr/Oq/+ZIfMwgEyHSmEDFjETgq
         UroM3SNL9C9BOmym8pnDg36ZfuGxPaygU1hplBUhR7xnk21hiDJPzECcG2ro4wUC8ORX
         nPBfML56afkfIf8NCdCL5/qW4AKbBZRo0hGkXLvfgxp2tedQHS6EEqH43r3VTi0tfmEG
         1e/A==
X-Gm-Message-State: AOJu0Yw+IQUsAA11SY9yBNO+h26qhDYNDbg2UIB0QTd4Hbpjdty6/p26
	17gy/y2i8robyMduM2lAd8pdFfmUZsvMw5Q0KPe2QyLaRxyWqUuBaSfM88OB1GY+OzOQIT9U1vr
	p2SzRpB6LAz850pm1xIVQ/odKV9+9ugFY4QnfE2FbCLVeqy52CyswHM0Kk1fFg6t+oBxFt4MxwZ
	Ta
X-Gm-Gg: Acq92OGaKiJSDAMn2x/xYwXbLVDMIAhzmw7ZeHMGKe24UhOgdiX2pW0iNarHIHJeJNm
	SFpNxL8rvKy8xD98aQ4OnW7Sn+7D944kSIDUv0WuFutz/SaA+anmEo2fJz+W7BxzuWcIuTsQKS0
	a8cHVtTVBxigIfWK5sVQIlPRxKkVsO66vChpmqC33CQVFjnv8CSZ3RQud+qaAdfnUOo9Pdee6xk
	01ON53lURByp98G15NjoftU61AcK0TQSDs/Dluh0XHTRf+rOxK+SPBAXy0muVbCoovQxVCddwHs
	5Y7PAMQ8w4gSWhJZBDrxYs8S0t3yyy4eQ1NUxm8rwav9nLfSvXW37SJ9CDeuqs/dJT3nNS5k3Vv
	U/Wua4KIvVTOA1pPAI58oDKOs3BAuuhMmFLT7cWLpwV53G+PUWzCaRsnbqW0imNi7ESBpY8XtQx
	b42PWq7+U8RPgf/NAkRHxtc+dNH9xtVpm4wA2506L0ZL8s7A==
X-Received: by 2002:a67:e717:0:b0:613:e996:3014 with SMTP id ada2fe7eead31-6c687525a35mr3992796137.20.1780317553276;
        Mon, 01 Jun 2026 05:39:13 -0700 (PDT)
X-Received: by 2002:a67:e717:0:b0:613:e996:3014 with SMTP id ada2fe7eead31-6c687525a35mr3992785137.20.1780317552813;
        Mon, 01 Jun 2026 05:39:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3968a6389besm4815341fa.16.2026.06.01.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:39:10 -0700 (PDT)
Date: Mon, 1 Jun 2026 15:39:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
Message-ID: <hrqzdro3s75sf4tfphmbzswiwquflrj2krm7e4bkohn3zd27rv@mra5xbg55qqa>
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
 <vvnecdwfbpzeuo2zjk7ajkfwaay7dexjncjuuhiu5ldqlp62wp@ybhqbzzj6x2f>
 <CALC2J1MXRygj9oRwEBsSPfhLjpRZi1T=_E14vkbOkGKKTCz7cQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALC2J1MXRygj9oRwEBsSPfhLjpRZi1T=_E14vkbOkGKKTCz7cQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: D-lOll7JqQRC-gh1dz5HitNoeQjGJ17r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyNiBTYWx0ZWRfX8J/1zOWxv9Tr
 vSt94MQbkN9Yr0K8hgGkFLBD9rlCLbPUPFn7zohml4CnGOz5Z5+27RW2+UY+9nk0HvdeLNTUg6F
 A6SroV9YaaGnRWgbxzWdwB9XfyLrSo15Boj9c9gHHDKvSdcEEJmp1B3oEgvP5R8IewKarKeh8Xy
 vqzTPuNLrjkJ4w5cwfVmvUeWDQdz0W7TfDX0pThS33gtDisQccW4pvR/mpmbUQtuS4FawCK17Bu
 xfZmyr1m+l9baW4PIhgw0TXPmfdpciQzM+EUEdsUH+syZWr9akXXNbS2xqP0uYhxrKfdWiAMpzR
 OdVQZu66xqVhS7PezJ0xTeoHDqV+0EjvZ8oiVxNlvkpe8pH94BN6WNw0dy3eqTAa0YjHsW8zkhq
 aXAShaauGHCNZcsCCFJ4ssbi6G+wyjGz4g+7yqBYJDP7VjWDxJEaYkqFXTZ7sX7Z4Cc1BS7sGm+
 TmAgJj4TNfSijKm3x9g==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1d7d72 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2XjUwd11z6YVZfdrUykA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: D-lOll7JqQRC-gh1dz5HitNoeQjGJ17r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010126
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
	TAGGED_FROM(0.00)[bounces-110584-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA34161F8FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 07:46:49PM +0800, Qian Zhang wrote:
> On Sun, May 31, 2026 at 5:09 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sun, May 31, 2026 at 12:44:09PM +0530, Qian Zhang wrote:

> > > +
> > > +     wcn6855-pmu {
> > > +             compatible = "qcom,wcn6855-pmu";
> > > +
> > > +             pinctrl-names = "default";
> > > +             pinctrl-0 = <&wlan_en_state>;
> > > +
> > > +             wlan-enable-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
> >
> > No bt-enable-gpios?
> BT is enabled in node uart10
> https://lore.kernel.org/all/20260429103537.1282497-1-shuai.zhang@oss.qualcomm.com/

The BT is powered on by this PMU. So, if you are adding PMU, it should
be used by the BT node too.

> >
> > > +
> > > +             vddio-supply    = <&vdc_3v3>;
> >

-- 
With best wishes
Dmitry

