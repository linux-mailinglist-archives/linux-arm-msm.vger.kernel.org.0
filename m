Return-Path: <linux-arm-msm+bounces-113855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mK1hGghcNWrptwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:11:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7486A69BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:11:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LYrvrngP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="CNns/B1M";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113855-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113855-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE8623016D10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A533B19B1;
	Fri, 19 Jun 2026 15:11:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AF33AB5B2
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:11:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781881861; cv=none; b=E4qcO1LnHEs617DG1UTAcneTDLEicrkjt/4MvfhDXW3bYegfS3AKmLfozOlw4FGORKKMKBet2gKfq1qnSadRkkF13rEDBjuC3g/b6NNDpUG3eX0b+gbEVdsDCorIRDSWQ7Oac8PJVXPMKGlb132Cx60hOQJDUzHj0lkPiig6Bfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781881861; c=relaxed/simple;
	bh=AeTKvPrDbvesHNVWMF3DDI4ksSD0iRPc+Zl0VyGY2CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFz+oHzn2g6VAfFrjtZwEHAI+5sAXtNM6LJ/ezDmGMwf73MM4JV/LW2xHV2+hVC1xbXo4Qfs18FAmmYsGzvFUFlmO/91tVxFJ8vpvpLfw+gnwRjhb59dLo4IRfOClMnURGc+D1Agww9wfR2ouTozuec9fA/LrlaCumky3ZFZMt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYrvrngP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNns/B1M; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDC84H759381
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oylI3EcfIW8Tcl4JikRd6bbkNKI7hxE7g3mATItpCUw=; b=LYrvrngPG3xIiT84
	mQQBuH5OzhQ7WzVG7Ztjrj1xj6MKPQ9ZbILfHiY9OYpaFteH+GpNWlwH8HOPfLJ2
	phQMAKhWzNRL+x05i+y43+qw/Ttlytv3QetcsNMNcuszuNc44E77GojfWv7YJr7I
	/MyqlhQwt9jSN9RDoNHZEHcYjDsnkWx6QVfj17nMtIbL6XA6een4iItMC684htcb
	X6egO/AT5T8UaK8oPi595GODXDsjxypOGvCFrJ7yazA/uzvBymb3nIc9zOHnImzp
	BpLDxCqmnxTs/btfnvcX1A+CnrM/xKiAND5ciuMw7NNgew3498VRnLbCP7QCVLU8
	nz9ApA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ew5hp8jr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:10:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915756c1407so28792385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781881859; x=1782486659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oylI3EcfIW8Tcl4JikRd6bbkNKI7hxE7g3mATItpCUw=;
        b=CNns/B1MWRds1FlWGyTzLf5/Vk8Y9qJyjhYJ/Pd/zSJe+pON61UtNZhh4vDIp5klsc
         kPFGGHlKYpbw2vZVRDwO4YUwrS8l9/ISV5EKWwNHDqdAr/jIr/+EiXvj+AzvA4ssNJeG
         YD3XEHXLllSfkCStUZfgT2NpjzgDrFILBOe2REu1MpgXOzz8uZbrl9iMxww5TVlDGxS2
         oZ/EQnKRCUiGCoVIsHvwPgZ75mtkzPTwBsDtTiJqaZPPdyakNN+wO+qWkgCpgPc8RHb7
         oQZvwcySQz9GzI8IPsOlNGGM0pcNsAsvVJgWGmKojNfoAZQafjyLPgbqKNJr2YBwf0yJ
         UsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781881859; x=1782486659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oylI3EcfIW8Tcl4JikRd6bbkNKI7hxE7g3mATItpCUw=;
        b=gHhAZwdcGirYGYkl87U/PYMhEMq4jwflrelWMOe9X3FxYgD8gGOTg7BKKhHqbMHrSt
         p1cUw1EFBxKTj7VwNP1/tVPYsILIcomZmnJkW7ansKB9kjeHI4vyWfC+5nvq7IFKzbIw
         dA7cThfm/DUCwUFAK5spzH0Jd7QhXgd0ChMN/XTBiBmQ2jkeOhEh8BtKumHk8/t28qAt
         L0MZGmZoBHqp53mL1kRcaIwFDavGGBwUDrTfdiLXrL3pp8hhsTLSaYBwLXBrrFyglI2G
         Qu6CUIWMPVkcpCikv6FynaNBQ0n/ax11ptKMlzySh8vMgH38T6HWH3rhonwGaoqrqxmD
         WpEg==
X-Gm-Message-State: AOJu0Yxr/3saC/xiTouzfSHhjPm8KeSu5oSbcOE3WAzTd4kdvTF+jnhd
	b3+XwBpu1/f6GOeJMwfhdXFzIyoej6Ke+EuJykwGzZXLJe9/7CRZ2t7BH3i8dSqm5+Sh8UxBrmx
	BMF3BbTh9nWcYwTCcEzdYrm2DsSN90lsBc/eefkZQADhBjSH3jSPYeVA7TEUpFT/OM5Cp
X-Gm-Gg: AfdE7cnM3ulAdmDNwBvlKtjXO5NYdY8RlAFCNzH0+S/O2YuP8tAN/+u1WNB2EtBLMZJ
	njrJXsk6crrJifpOkHp+evN3WDnHzdpI3Pvmhta60t/zLHEM73+oqQ4sGCbg20rKk3dJ+kev9Qc
	dC5ysEmqm3fQpMTNqgA2BJ08TyNcbRIZM4XSIBMIZAIXfIojrjCvNbYyg6lPtI/de7i+9owoavm
	E4ddYinC1meYN5+gxhmItZQ3uujPG1fIhnLgmVuA6LpvooeofCkbDPAfYL8Tbb7yfjq7EsmC/a1
	83tj44EaOWMz3vAcK9WWavRfzxnwr9jADN+tfivfBim71O9heWOUGSV0aUAuBTlZ5MyFC3ydGuF
	iQtc3dIEF20QOdQHOvofxLoxoDXFTVT2/NyM=
X-Received: by 2002:a05:620a:27d5:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9208d5f227fmr353729085a.7.1781881858558;
        Fri, 19 Jun 2026 08:10:58 -0700 (PDT)
X-Received: by 2002:a05:620a:27d5:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9208d5f227fmr353724385a.7.1781881858021;
        Fri, 19 Jun 2026 08:10:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a84efb7b4sm94628766b.28.2026.06.19.08.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:10:57 -0700 (PDT)
Message-ID: <c4a70b1e-ea48-49d2-afa6-639b73983729@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:10:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: add panel rails to
 simplefb
To: me@samcday.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-sdm845-oneplus-simplefb-regulators-v1-1-1db1804acef6@samcday.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-sdm845-oneplus-simplefb-regulators-v1-1-1db1804acef6@samcday.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BhbFuL1FwPvKY8vAJR4MLUoy1JYj25uX
X-Authority-Analysis: v=2.4 cv=aOHAb79m c=1 sm=1 tr=0 ts=6a355c03 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=lKQ-AihTAAAA:8 a=5egyQXd6wVIim8t2i6sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=K6G5NyU7usMl-irPePdK:22
X-Proofpoint-ORIG-GUID: BhbFuL1FwPvKY8vAJR4MLUoy1JYj25uX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NCBTYWx0ZWRfX06N4pqGYjvxv
 NbpYJOrTixcM1Jmlxh/ls4zmguTRkPfic9eTSjWg2/QciQ9QbaUhk/64Gv8GvAGb1s9NPq/+El5
 yOipvVQn7mSyNSzKxscHZ7A7MKP2Sb0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NCBTYWx0ZWRfXxQAEQlhC8uD9
 yxLEhN+1SvMwmKBDfZtu5l0eYNIpzdmHL7819OWTKzUPJMaT6CryozE7ROSck64fH3XOApUoMeJ
 zeCla00qZoLSXrvQyITOLnFMIqA/5fpuZUQuQQAm2P5fUIlQqGvdr+fT4OnMW+DP7BbCyxR4GgO
 FiebW8XX93vktPaU/bB1ABB0dsqXegNm1NjCdCIsFcct0gI0ZbBvM2eHBJ/zrB7BulNMgcsQtzo
 8zULz+/NV+gjGgMcr2W0ih+CKAJuvBGt1x0fczHifgBl3QVkX9GHo+0BRX+3Sgcy+yLaoUIdXEH
 XKjD10wnDnlmcasOq4q7uRA/t2D8oJ0mYKX3ITc/LhEvoah7BRN64hQ3eT9hjHdag4OFI4kwhJH
 ppsq8Y7Yp/fB0p37id849PLoGogOpfZlyT30tFaJ0J3la9xuSSfXZa4o0ioP6WZfF2LO6E1LCLr
 8IEorE8VcRMcMblsIyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113855-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:me@samcday.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD7486A69BF

On 6/16/26 7:27 AM, Sam Day via B4 Relay wrote:
> From: Sam Day <me@samcday.com>
> 
> These regulators are marked regulator-boot-on, but that doesn't
> guarantee they'll stay alive as long as the simplefb does. Adding the
> explicit supplies ensures that booting with MDSS disabled doesn't
> switch the panel off 30 seconds after boot.

Why would you boot without MDSS if you want the panel to function?

Konrad

