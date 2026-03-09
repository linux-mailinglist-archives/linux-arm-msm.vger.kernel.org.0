Return-Path: <linux-arm-msm+bounces-96112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA5MB9xWrmmbCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 06:13:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E613233DD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 06:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 594FD3019F01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 05:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36942D5C83;
	Mon,  9 Mar 2026 05:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ivvsFJFo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8o/KO4A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B6E27816C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 05:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773033171; cv=none; b=CneYNLiTQaCxM3qq7ZN05tUxVqbcZ8IZ/5RaTTtTAkbJ91wDZgO5x9lamvD5EuL5gSi7GZNAGd0cCJm5V1njlh6aQdPLwUsHA+KKftwTvbrdiVRvy07QT3zOUyOuXSdRYFZK69hPHVul1PWIegzWZscpE/p/gxyOPXWayQHPH7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773033171; c=relaxed/simple;
	bh=oWx7RRG1m5AcqND2F8ZlwW1HBlD7BrS6vCGSTyqaDRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pj32nXR/rAm9yZ+3LfcSVe4/aMher1HIA+1zC/NI3C+Wh8Nierv2K23ebsD1CVwHgzIN9/WBUvnGuYy27Q5mFbQHa/3af/7vuQxyE+0v/3YAJ/GHSuTCpwvV0AvWxpRBCmucKzhNXCaonyY0a2DltwPJ/KKzhOHGiyr5FEqndaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ivvsFJFo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8o/KO4A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628MxOru196574
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 05:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RKuOK/Z9ewWumYHjX9jmi6qJ
	5KK/ehtHNSnD0EqSR48=; b=ivvsFJFoR3ORmo15BqPkdA5fQwVIkOt0GIwapQIY
	cLSmEmlG2G+HbCMJQGZLT+h61JNcc0E+rc/WO53M6CKY3FEx5fu4RKJhDbTNxNGu
	qXY6Fh9GbswrGBoJ9Udj1yNvcxYyJ6cCJf64s53VNV4GlohgFsF7lSHLi4umBPmp
	PHQA4ZWAq7mLaTozeOjAYJhchiPOUi1alpPVvLchQZcsWvx693r71rZ/IvFcAuN2
	Qd1sfo3p6+l/4jTi7RVxq+D+Anx5Bd1lOjmKEDSvttvf23qbcma8m1gJZCdQmZTJ
	jQRLwygSIsmk1YDqYQVzwzvlHqX5NNieFHdV0UUFZUVVwg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vbw80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:12:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77502295so999821185a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 22:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773033168; x=1773637968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKuOK/Z9ewWumYHjX9jmi6qJ5KK/ehtHNSnD0EqSR48=;
        b=F8o/KO4ATFHY8KqE3DghjAtK7a5E3yM6X5iPTLSieHKO5Iehpz+yNa0aYXShlz87De
         3AQ0SyAmZ78naD+OvAohCIuM85K4jD+LKKJHppFxgJ3sMwcNsV7rhKGGD8+l000rJgIc
         ES4ZHTeKDp4aEvPgEQCEQ6kc1N5c4j7rkcxFcbwkbbYPOqly5nnrY68ZdNGQy7jRYDoq
         jQiv/G6vwK1MAAADcRt4/HvU7a3jmP8AfYbl3dnuxoyTrsBi+IkkQ6i1yHi4Fd8YfQeo
         T3GzEthqQi39SoyQbC05o+Gbj8GXSj5RYSRSqCx6f8c0E0g6VH4uW1eqzxhcBEj4pBrP
         /mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773033168; x=1773637968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKuOK/Z9ewWumYHjX9jmi6qJ5KK/ehtHNSnD0EqSR48=;
        b=pZ0ZSfm7N7UPILcDefoAuCGFYwM2VLfxHXDSsAMPuuzEguckbyT7ccMpy+Jy9Wkrpv
         cJtpqJwBuJNM4RLrV9HA91lnYPX3OWAZ6pfBeKr2FhgcU7+cQmnoXILSvuYO+KV9qz4v
         1cQ9PXdwtNmkRonBQRpnOutErfxiQp7O31qZDUYbv8fNyDtR0NYShGbPdyD949IENG+L
         rss+KgsRfYHLiMCWN992WEUcvTOAnzipmF2iCZIqFU3ll7zyY1bbarqqcRJofKB8CpB2
         2i9YLrMU8uMjSHNLlUhmQyEQKT4ZnWk53zD+pOE4aR91YiL1LarbW4PUVb8oY2xCfdG4
         i5QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXgrcPFKBuzVxEfqXJcp9eTP+esiJvZ2feSdK9uSrb+C12Pb7VEN8Asnu7OwGLb4EpO148w2Z7kow6WbGv@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ5+Ss0F/f25mb3R2Z5x83zBmSxkIJ1eLhlShdzO5Doz5AAnoR
	cBdkBZNjQPb4GEvVrQm3J3gtHVyX6NSRHAm2uprLFQjJsDM0Ca5thzTrCPFtIhJ4SQQwx97RfM3
	aBgr2qtkYniLSacSAFr0lgawQuMGLCCswwTiECBP55tcuur/nYKo5VHV1mMyGiLliUODT
X-Gm-Gg: ATEYQzynpH0PEh+NImxiTzdRo+Rvueve9Z3JfxxZEuxTZVpmAyCZZgO8q5I61M76z7f
	xwnF8aAa1Npb+DdwbCdnU3g2WyY/HetUeB7/FMAx+wpt3Emcl1hWxr7UvEeAP+SCs/5N81cANMp
	6Mtkfe4sfZ/DpocgLJeP6socBSzSFy0VuK9WuJG+U4bXY6/0I00cdvuKh1HfoI8ZuSWSDE24kVm
	1R4+rpMp/Fr22EUUr53/l/JX8JSTFzjttdRdtouyeoq/YJjs9aBg7VcV77GhIncw7/b04BnHXFm
	rG5kXcmAojvLenT2RW+nSloo7qoGz10vOUzHNIormuC+qHmAV8cS8Np1cglW7n2f/rVIdV0qv3M
	oIhpcOi4bShCgOtUxL4KLivQni3RNNeV7wE+2I6AJ3YSMrIXyR9eZD0FjzlHPtrQh3UtqI/LFQf
	OC7QV6IL7NHhe4v8C4nB5DFvhHUDKFtEkEYWg=
X-Received: by 2002:a05:620a:269a:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cd6d4fcc9amr1249962285a.77.1773033168463;
        Sun, 08 Mar 2026 22:12:48 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cd6d4fcc9amr1249960985a.77.1773033168085;
        Sun, 08 Mar 2026 22:12:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e0e6sm1953869e87.55.2026.03.08.22.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 22:12:47 -0700 (PDT)
Date: Mon, 9 Mar 2026 07:12:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: add ADSP GPR
Message-ID: <rv3p3xhx7ge2cfn2mefad6joffmvqhp4yta7yifzufvv53hs3h@qb2le6csplir>
References: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
 <20260306-milos-fastrpc-gpr-v1-2-893eb98869ce@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-milos-fastrpc-gpr-v1-2-893eb98869ce@fairphone.com>
X-Proofpoint-ORIG-GUID: F_kFKHldg0dKqDXbvowKlB6J1ybJNY1x
X-Proofpoint-GUID: F_kFKHldg0dKqDXbvowKlB6J1ybJNY1x
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ae56d0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=qELz02of8CWT8vQxZsoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA0NiBTYWx0ZWRfX0L4Iu41LoKFB
 r53Noncbng/Xz0/1j5GH5hqvyrTL7TJc3x0DWVWtgHhVWVhWx8+UN2KKo2mvMZAWO7nN4jljMoS
 xT8UkxUC24cjS0Q3BvHOb5brm2UBsXE8bcoICC2LpT5yx7A0KRbFSMf5GbqWoF97W5kP3n78SdI
 5ym1uDl9Qm5LUzbdirlANyNdZ+332f6aBJnAh/FTaS5EveO/oNq5uPHA1eAP3lnbMtc40yaum82
 VZwOK6FvBFHSUZhhQEdR7Ja5hunmiD0nXLPjPS91G5R9L8mBoqB2SaitgSF1EJCECOmT/no0oVY
 9/HVe9LjBeQl0QcPIHP3q+pYCESh9m0ae8rxKpY2y1hFud91t1d35YMREeSTTttNV3hwpkX/4jt
 aSTN5vX2RDRGWfWVvgPhiuhSqoJ8j/m7x+AzG4nqH5+g7uuVExRljkBD5POEawu7ZdfQflY/DUV
 M0cWdhtsyxeyDCtiPIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090046
X-Rspamd-Queue-Id: 7E613233DD8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96112-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,fairphone.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 03:01:20PM +0100, Luca Weiss wrote:
> Add the ADSP Generic Packet Router (GPR) device node as part of audio
> subsystem in Qualcomm Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 41 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

