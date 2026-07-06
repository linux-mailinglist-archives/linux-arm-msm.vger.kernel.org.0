Return-Path: <linux-arm-msm+bounces-116999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Da7PNXHyS2oTdgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:22:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C84AF714737
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:22:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BGuy6TPF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Gh7Jl5oW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116999-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116999-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6CC8B301D23C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B361442089D;
	Mon,  6 Jul 2026 18:08:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3702F5313
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:08:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361282; cv=none; b=APoIX6Cd8Qj65nDFufk1jmgQljhkgGgqz2TWif0yDfnZTkpksjcstl/ZinayHc/gwg7XEpwX8YMjlNVC9QBa6O3WdKjPdT6eucIkQluAmkEsu88WyDIqmcq5CEmzf4m/VZdE7KHJSKMOgE9t19A/Gsf0/CcMrbeukHy7FsJ4scE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361282; c=relaxed/simple;
	bh=ScF1ZsN/3p1a7WMakTdPmE7DXNb9ruzMuYE6+2BJJ1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9EoCAXb6XyY9c8LgoGNk5FMu3n4VGsL2S2mh4VEm0x4FwfPyakhQXGSEyqsTbgOG5Ij1G0IlqO3ZUsLGAL0cW4BaB4ENDnkfM1tKTa78LTppv4IT8u74/LsVASBNDO0W0fcQAkQWCvadWn9KmIuuIBNkMMl/KhKwy/2Ao+fKyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGuy6TPF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gh7Jl5oW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FsbMn1050505
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 18:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DBczducbIXTUza0JpGU1lh9x
	H6Udtg+ESPxTMWCTd78=; b=BGuy6TPFuN3g6+YbhBgpL1RRU1rDzXW/RBdeko9u
	/kKrLsPvy8h9WEf3dLwR2MOHCHYj0EUs67bnTLxXiRW32SCtzfVG8lsPdiSjDq+j
	as0tAxm7di0Mc9vEPXgdTN4bJMhMdH/ZvOoWuCNvIfcPH8HwRerOmdRl4uUI4+SV
	ESVKSL7418F0y0Za98vhY/av/zzHMRB4Lpyub+uz1s1ZzNoVXvga/9iZltmD9EFH
	8O3uBeahhB8cBcXNFtNDZfc1Q3CcEv/0CL9VkdHlOFz6/aPSROnUV4lz22k1IkQz
	jK8QpSIIh0X9NYm6ct3iqRfsh03hUkFTvb83CwU5vc74Fg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw0mec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 18:08:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92aea0d801dso322060085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361280; x=1783966080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DBczducbIXTUza0JpGU1lh9xH6Udtg+ESPxTMWCTd78=;
        b=Gh7Jl5oWJ31i3AZfTtaJ1TdHo4b4Bp2ax5sp1GuiykxONPzRwdOLP7+7z8KMPa4VWH
         btiAcLml8axvM9SAaygqf6KSBa2cyMIy7IoGNyBOrhHaRBFAa06l8TYR8YXFC78VE4Mr
         89sdJ6m3Cc6/enALcEFCVdhD1kjFZtLf4XNdLK2mnquf/5tLDY1dCqYMHIfwTFBTO0OY
         8bMHA69wLuwfNKTeVJ97OlF6jVmjZbsdaA8PtwiEE+XCxgE9zj8BKWbn876JAatPTk8M
         QBCFtCQyrqHE62gizW68yN1HMlS9srtDzQ8XVfzetirAjVBGdwfw2AdOSR00676eDF5/
         vWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361280; x=1783966080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DBczducbIXTUza0JpGU1lh9xH6Udtg+ESPxTMWCTd78=;
        b=ehWxfRlbE66yTTulv2HEx1xhMq0M86JeoO8awUdkNMWMOSHuUcE2HYORoaaq7aoRp7
         yWcMgN/wK9K2Ph0Wglx3icLyASjS6s4cZ3JJFiOk/qn3hc3IhD9oGqwTPwc2jhhQU19W
         /Mo8Gg0MLr02RMSbHYaQOvkT1cgmvfcEdnjRGD7RV7OrkIbgo4u6UN+4Kw0pHiwPK5ck
         kc/7CyGmE5Y4QZzGlvzLNVA6cH+RWgQetNUBy3u6VDNrljyjNja83/xYba7kxjRcLY22
         /DsvZuEO7p3Wz+HQmImSE+hPYwINQoOcAuvo/rsiNqZLH+/uVHuYuvXYse6C+4khdxI4
         94Fg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+JH7/2I/TnZqoNTHk/TlWXOYsyrIbfkkdOYwpYssrKu+2v1mpny6/DxQGoAJhImu4wTy9BVyanOGRCMeK@vger.kernel.org
X-Gm-Message-State: AOJu0YxYIMnqlPNKlD62LvMtfeEANIjSysF5Y8ClvwFOX4wSCZIMqtPf
	lHwMceg7WXW/OX8peBv88SRuLXt1rmtmyoUosw15om4cdP3Uyw5enqlaVHCPe2iEvpGcgPByfHj
	m5zyP6bS1nJ2t7WdwUIahVQ0axnkybKZhf1Z4+z+u74YEZt5JKO2iRDx6eP5NGlgnpb3S
X-Gm-Gg: AfdE7cmR4s045cVCMKOfEQDgr06ArFIMmBlZV4sepfwaAHlIxC8WqpjaqTyUw3vEeyi
	KD5SN4P0NEz728e32QklSQdrpt+mzECwryguv7AvuySkwz2IMzTTmvGfSCmUJykrb9F30wz41ke
	LAyh2TsMZMOas07vNa13EpJC+QpdBxhaDartPpsR57qq58cDJZFn//fHg7XAvpExA0LYh8cKq4z
	W7h3JWfNp33h6oRPqutHbQR47QGqCgM6Z+Tg9lb+qRuc8zcQrDhl3mV0p0IVBNTpL0Pwvdc126W
	WChy+Soyf+G2W8UOYUVZZMGG1qH0qIcOlvWS2Hk4SBY3gnv9tCa6XykUZQlS9ZSoCTqi1oS8Mo5
	UkXNILtFvoZHL4xYfdH7+lJ19zoP+boDOIqCXSeICC8cuSGw+msia9qmRmzE/v+46fB5nTKanXV
	fj6iLL5sI8nPFkSECFRslTDQ+V
X-Received: by 2002:a05:620a:2725:b0:92e:6637:db5 with SMTP id af79cd13be357-92ebb4c7b4bmr236543185a.16.1783361279725;
        Mon, 06 Jul 2026 11:07:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2725:b0:92e:6637:db5 with SMTP id af79cd13be357-92ebb4c7b4bmr236538485a.16.1783361279265;
        Mon, 06 Jul 2026 11:07:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad1890asm20599981fa.3.2026.07.06.11.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:07:58 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:07:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 4/6] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
Message-ID: <5uniamhlwdbnyjs4looanxy5i6pqcbj7r5r7dw7xjrfs2tqs3w@ggvgojc3ummv>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-5-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430191253.4052025-5-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX1PFAxNVuahIW
 Vzb9aao5RDhZr+BMeTlxbiEslEY+8sG6VW0vVhYuoAUg98fRAkPYXaN1TRNBsfrtKBmdf4ErPGP
 QlkrqKuYgd9n90ZLm5g4O86mICWnDtg=
X-Proofpoint-ORIG-GUID: 3mhhldu1ow45CmTXPcADWErpAIzBl3Sz
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4bef00 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=SXALPXzt-6fgG3gb-dIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX1buw4R84DDHR
 WRaGm0KSXR/QS6Se2vUFnp8Ce94lsuiQftrapPH0KNdxZ2yIbTp/sTmH1cxLtSGyO1PSL0fPCYr
 80ZB+DG98YniQAy+5GfjKSbbalywPNZ3oSmdLq3kFEJxLic5f0l6GD2W30vVQRlmvwZzKQL31qC
 6kS+9fPqw1DuXIVIE2+C5lPyRPWpLSGdTgyhY8uK8Cn6hOgOjrd7KeOftIFNJSBd4fl76eCjqg7
 djrBCAmMe+d9WWqHwjFSeUpKRepF+s7lOOnOxEltENO002p2WuvVU4U/P+Xx7n0cGhfsX3b6j7Y
 ZOPZuUo7pDSqNe9JwF5PoW2FGyCfnq9FpykKa6SvcKO2GXPDeQyU9uQVjp1KfkFxNvetI36lrES
 sxFr5gVQ/SbQEsJpnJTAbAkUO0WcbxptH7l0wtA5YCCpfJMwwDp28ANKywfD+Hb3b8kFTez5VG9
 q/UDKMsdlvfd/qsJiqw==
X-Proofpoint-GUID: 3mhhldu1ow45CmTXPcADWErpAIzBl3Sz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060182
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116999-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ggvgojc3ummv:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C84AF714737

On Fri, May 01, 2026 at 12:42:51AM +0530, Mukesh Ojha wrote:
> Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
> Peripheral Authentication Service (PAS), always map the MBA region before
> use and unmap it once the usage is complete. This behavior was introduced
> to avoid issues seen in the past where speculative accesses from the
> application processor to the MBA region after it was assigned to the remote
> Q6 led to an XPU violation. The issue was mitigated by unmapping the region
> before handing control to the remote Q6.
> 
> Currently, most Qualcomm SoCs using the PAS driver run either with a
> standalone QHEE or the Gunyah hypervisor. In these environments, the
> hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
> Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
> reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
> violations cannot occur.
> 
> However, when the same SoC runs Linux at EL2, Linux itself must perform the
> unmapping to avoid such issues. It is still correct to apply this mapping/
> unmapping sequence even for SoCs that run under Gunyah, so this behavior
> should not be conditional.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c  | 45 ++++++++++++++++++++---------
>  drivers/soc/qcom/mdt_loader.c       | 18 +++++++++---
>  include/linux/soc/qcom/mdt_loader.h |  4 +--
>  3 files changed, 48 insertions(+), 19 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

