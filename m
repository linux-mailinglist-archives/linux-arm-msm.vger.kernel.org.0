Return-Path: <linux-arm-msm+bounces-112737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e/b2OW2dKmqntgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:35:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EDC671620
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:35:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LOwpVAWa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y0o+dgAV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112737-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112737-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 380973034642
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145EC3E451A;
	Thu, 11 Jun 2026 11:35:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEDD332EBD
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:35:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177705; cv=none; b=JaMF/EoLhtVHThSURpC3J1NSbEeVgZNCoyjPodvmKVgvc2Ws3aOPmtbiUaAarMAO4GR8s2VIxu+mAEiwEZzW+bmSZllcKLbRyRwXPB65/qoelKzMSS7LDjBBdiq6vfDnaWA18Jcf0nY9a8XVXivSM/I5lY2mz+KGqSn/c+pWqfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177705; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzbvCerPkYosbeSq2rZaOISksxywO5LtbLso/CyE47LgyrdE5w39xmz4iTckGARF64WEKy5GOv/ey/rAp28T47WDFQWa18lZP9PuVGU3FmWB1Pov4ITJj4so0w/vravgV+loiOd1Spo2DL41v+UkXzEF3tW6XaLfVdIiT421/wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOwpVAWa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0o+dgAV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xL6R2890671
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=LOwpVAWaT5qDtsmj
	ouRTr5mhP01dad4X2ha0UfOIp1Q62Sjap8x+GUxtsvEyKQTyCaaNGIHOGx8Di2z5
	Hpqm1lxrTz8gMJkZIE/dBMDLvTOrNBzN7TL6qIL6XLF3th4qD9lElDpQ6evM7Bts
	SgoW+zIG3vAhDGWskME1lVW8QL/smJbZSKCmi+lbvitt/cbnbj4m3CknsTB9KZsL
	VyBvmOkRI0QU3ztr17qxgkDevpdDrr5p80zfxgl63YZeUjuD13IyZ/8BFqSYI3hP
	txbxHa0O1kChAPodqot0nS0Y5M5wyNlpmllVW4ZzESXYgz5ky++ln5BKN41n8cF9
	QiMOnQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79k4m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:35:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51768e1d798so20019511cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177702; x=1781782502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=Y0o+dgAVLK72T6aBgrDidSv0XzyXeNLX4hNpXdAces0mV8eftHXpKmeq3mpuG7RiJF
         VBMmUxXPkygyg5If0yN6VzarEctHbC6isAkGzpBJgVDaU+OJkSBf9EPc5HRDgF70cITE
         6q6PbCOFNBO0DzR+0EWn17wysm4/3rAs1/VZ3K0Gb7JWX6cgILNNJfinCrnFELezK0sF
         0TOqczQzExQBpR5rolwWMIKt3DvnaG2P5WUTylWDNwEm8/qoIymEx21uDlwi5HLKUjA2
         MtUPIjm0MAQbuWurrozqPAEa2eXWoEp535+Gp7wbsdevUTwnEAq/5JvyH/aFUzHoo/RG
         MVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177702; x=1781782502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=mxC1kUafRQ9GCPGN8+7bjeQ0xMlk/musX3DJh4m3pg+cG0pIGrhojWWn7jznG9sMVz
         3Ywr1M5u3dHJvU5HcmEwhC69weUv/ZaVCQc6N0hBBcZOMvAmekmTMXb5ZVFzHgKenRVj
         /9wG1Gva0dWIDqwl/KZNJAiRhNS9V/olcmW6bGnBuRBiLbch7urNTFpuTP4tHG6oty8S
         ogLXL2gtXTVdKGLN7QCjF0sIZjool5kzQXWE6guk3pjgNvWBFwlNB8hkk9wG794m6PBw
         009aFuIDRDt+SG/VV9FbTQ9u7mjnPPx2pXSLVT/d9nAUD72MG2uAMg7aINPgeo9xvQNz
         2Bkg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZUyvSsK0PX3vXwDjFGVevU9WouZCmlqybOLsulYtsZ6WBywAuvEbT/jtU1yniN2qZDt9UwUA/aOwZONP2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8JLgMNiBFiQ3dZKcdTyg+HRyONWFlTc9C4ti5qVi+Qa0utT6D
	nk/6zomT6cLy65SJ7CeBPzB1de6yiQsBe2n4kJuO3Vr4i/xTCLe9BXcg3ILr/NGyWEiqs5prbsR
	al1X3tcsesN480S+dcLsFyejw9WyyCkxNM+uS6r4N9qaPa7HNVO3VwsA5dqxdaHyY0mEq
X-Gm-Gg: Acq92OEhPAhVsDljF7Ntf4RotcemFv4P37bXvyIXvDHF7mbhf/DrwQSwfP+J/AwkfOQ
	KynVY2wuTCHSRYgrLsvcBh4/nYwh86y3A6X0weFiLXeB+NLWVbbKQR8/WCU5RyVZW0QGmnYdLYU
	jjm0XC66Bcr3Pqerr0cXWfiM277JEWwzJ24KOmssUg9ySAmvn6HTuLRnUFcOCVD7gGXriwrNg2H
	dkRqc2lZBm1EUE/hXJvt79wGuVytjYyf8wl3buNVBgrBOVfEiU55/cuWaqz2FY6Xl28Mj4rEXsm
	vW7LVbFLeb0uKLhZ3F/Cl00U//ayuvsSeLiH7gr+D34hOas5/18DpMG/UPpguX00xDIDcmBgAKg
	Z3NslQ0GGhrAM9ZsHjAdGSx7lazfBfmWiJrjbBa9Hkp/yqnoeuXNmJthD
X-Received: by 2002:a05:620a:2729:b0:915:769d:56e with SMTP id af79cd13be357-9160ab58852mr212225085a.1.1781177702486;
        Thu, 11 Jun 2026 04:35:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2729:b0:915:769d:56e with SMTP id af79cd13be357-9160ab58852mr212220785a.1.1781177702002;
        Thu, 11 Jun 2026 04:35:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb160916esm53023766b.22.2026.06.11.04.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:35:01 -0700 (PDT)
Message-ID: <48f6e27b-f1f0-4eed-b599-c7fa56b10022@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:34:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/18] arm64: dts: qcom: sdm845: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-19-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-19-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jH2DcOpaPXwPgVxch5j-NumBBgtp4_7x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX8LO9zITqoTOT
 ro/eHF1QvhUPLUT9dIXU3vxDUkYflZy3bc5mn7fkgA39QuUq2XVdrnPEOi1vL+Xomc4h7vN0Kff
 YJ3OScUJwuO4NYAdE8a7vZmiuv1hP+YC6MoJKnsiz5QpJLMtxgvmAgHzkz0Nuxsxrruj/t4ijof
 MtC/dbld1bFuT3cDaI3V5Sa9aEGtgpiLRhXOVZHPaslxg7s/zykk+L057gdrer5UsF2JmkEDVK+
 bwzTb+6FavOMTH/q+/LfSKtpRZuiX1p15mdkR0914y9q0aToo6HEkMI5E69WAlmMIysDFKmiLj0
 Pl4BKrdm9CtnCSvEMiNTSaFY7lKjFuX/w+NMb+o1lWjzbyJn3I7agCOd8SHaVNcGjEtmvb8tik/
 nZ5iutoFzPfuaIuMPPXEpduRlIo1b1gkZ+/UnAR4GuLHDt13xZBhyMb7+DSprZH6K2qfQK1S2r9
 zRzMzJDNuoEn4Ew3lQw==
X-Proofpoint-GUID: jH2DcOpaPXwPgVxch5j-NumBBgtp4_7x
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a9d67 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX9T0/NIr+XQET
 tJSXk1Ivh4OcPYcWMzZVtZWd9tfXRXj0UWsuGtP1spIAtrooRS6QWUp1Osw5Sue2h0npxmgTsMs
 CJMbyHPCrENoOSqrWWLu6eddV3mp53I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112737-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41EDC671620

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

