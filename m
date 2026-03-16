Return-Path: <linux-arm-msm+bounces-97905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBTzMc/dt2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:39:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D3B298031
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B93443015707
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9829417D2;
	Mon, 16 Mar 2026 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzKAgnIH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJ58h0dm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64531386540
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657503; cv=none; b=do5xw4B7m64NLTmgVrG8CZZ7Y8v9cFKmY5gz2RAhxTEIMkVC3cpToSt2yKOkosMc8iI++EwKnE5ijb4+n0/nRjboDaUl9tp0maXfxtE6fKDOyj3+uEXDXP5bI48mnXIxSnKW+TjEqHSnHBpvcx7jMb6HgpV2xp8/6A9AVa6hcls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657503; c=relaxed/simple;
	bh=N0ETczg47Hthwni1YXRrWbd0jR+hnMv9HzsCGURdEAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uY4xbKm1bjAuYiYNEGPm6db98NMYJNibXJz/NW6xd6i0+baswedlD5oSEYlqsojg/UStukPhqE0u3sbmKvlP79iC9LqagIGQn4vPUaafw4R5vrnCfc7ggpe7hWeGR4Fl1tqFLhiwiuD40/SXy9CM2vNLFisKdTvsKn7oOSVqSJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzKAgnIH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJ58h0dm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64gsu2672206
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALirnm3qVmuyZak9zQ35S0q/tHtzUERhG5D7Dbo0hbo=; b=pzKAgnIHrkOsZWEB
	S59RUnQKyn/HQ5klGqlYSvo9pg9gnc/+1PRVu11XTdbHGdky048gwuZx/4ABNmDF
	M06DrP4rbscBFV6cmQ5wSmYqZnPt5pYK6A7T4It8UrAbL1m3m5AlokaaQxywxfvz
	UFsyqcr2m/BPuZXedBTGBKZX9oeoyPev0lr80B31FEhQme5DqzzjFjowJbhKvz4m
	U1LC9ZKL1MrTNCFiitTXelvlGkr0G/ZTaTuEjf+Vdf2E79OTZuOf/Ni7yKsm7DJ9
	TAZjcaMs/bmjZpHdiR46XToSJtIe++GI0J0dMOqhxwYfEm7+XSib7OMvnIu4miQV
	sw2Ovw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xn9wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:38:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd97debc51so348627885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773657500; x=1774262300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ALirnm3qVmuyZak9zQ35S0q/tHtzUERhG5D7Dbo0hbo=;
        b=fJ58h0dmqPmE5Qwx4c9PgUBg9V44sxrn5cNHmRDD5k+ZtuVHOvvPqAkDytQZzplAXz
         qZ8Vus/fb8nbZTLKCeNQXVM5A3jrFj8ln7f1Ob7z4qNzgbxVyCX3avTahbRYURDDTRXh
         P9TSaUnaxZyYIxB8n0bc7rIRga6farn7P82QfbIJb2s4dPeV0AMw59xHgUrioCTCleCy
         g/7gDXj1Rql7Fhut5ayWTgCRd2j+InD4SWfE/hvphwym7AWQBSoQ4Io/dbU9A7GIrlhr
         v4B27wqDWnydZKkmoAS7mob0g9ALiRNpAArc0q9/k+6gVmWBrz/lKV14TlsBHtonLEBr
         ging==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773657500; x=1774262300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALirnm3qVmuyZak9zQ35S0q/tHtzUERhG5D7Dbo0hbo=;
        b=MFsqA6Uvt1UYDGS5vUetblsbV3dCYBBiavXT4ZPAa6xlmQ05f6rIYRsYlLT0MvJSQM
         RepM41qDP+6JkfKjQujp8dTjIplySrdMwOw0BJoDO8RoGzX4W5XMG7rqXhiemmQqmMsn
         HP1ZtdQBT1b3yyMPTfEu6v6WI6ZS6ixvnnh9mTBLspU6TTwCLrNvUGJkYG2/L4dqQlW4
         a2s61Wz1azWZfQ83jQNRNFn9lPx1BIeD0/GmgU7XTrgDdyyEOi0lxtdlzJnMl8NdCNbO
         RMRru+a3ggoDyleDh96kqgKfVWHGZ/Q0G87iIH3N/B2puHz8towb9io4bbQNv5+7hlPU
         9vNw==
X-Forwarded-Encrypted: i=1; AJvYcCUQc923mPhFu2vbYKjy1Q5BfBSoVOtmdmuvUf1RlLInw4cYFeqLYBQSJ2j41mDsya/geCil+fA68CLiTZXO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9SvFTngG8zZfdk0z1knqYbkY/TSKSEF0oYf1UqS4WK/pMgou9
	Qv+PibZr23QwUezH1vGJJ/7zI/MvhcOiW9fpeeCPb4xXDYpF8/Y33y2rF7gz0yveGMKVUM9/u1n
	bKdA8xr7IyctPcPV/wTDpbpj27SQHI44TIrzn8pC8QKlegmjsnsRRq5XTzzSMrB3DEQLb
X-Gm-Gg: ATEYQzzIbY0aIygJx44VYUdgwmqe9+VFxIKp0d7fNSi9/eK6FQ7z+WBlr27xqKXj4t4
	l20I1zzW/7FGzCAfx7KIxfquTpjBxivAOBlDfAktWFXJuOMO3Zkue0NaWjTSPRbMgFNo3MrR4i/
	jl8u8IfvfZjpPjgD+BLmBuT8iSv/hHzHWrOHHzYRinQRQ0AxgzC6DshWlFbjGywu5acqjSMMCF+
	NHFyvE5mvghbx1ttL/sWuBJTOvHrMD25teFSP7QejSq7WkEHQsP/5BNrpNSEHFIguXhdpzeShBi
	H3SOAON0lVc0zZ405IXUiZzH4/PPdiD/ybOcDfZLKJC3y6y8P7LrUsH1589C63e/n0PKxQvd6kL
	qMxP3SU53mLHxP62/t2rh7AQ73UW6CBIc0Ca4hxV4LWKfJkckyvEnOVPgnSmlAklpDEJVpKhq5A
	7Ov9E=
X-Received: by 2002:a05:620a:3193:b0:8cd:923a:87a8 with SMTP id af79cd13be357-8cdb5a2d141mr1275005685a.1.1773657499693;
        Mon, 16 Mar 2026 03:38:19 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:8cd:923a:87a8 with SMTP id af79cd13be357-8cdb5a2d141mr1275003885a.1.1773657499223;
        Mon, 16 Mar 2026 03:38:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fbb9b24sm4875162a12.6.2026.03.16.03.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:38:18 -0700 (PDT)
Message-ID: <a87a13b0-2bb9-45bf-a3d1-2d08aac2a171@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:38:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: monaco: Add HS/SS endpoints for
 USB1 controller
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, r.mereu@arduino.cc, m.facchin@arduino.cc,
        geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260313103824.2634519-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313103824.2634519-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MSBTYWx0ZWRfX+PlYdJq6jZgP
 rmdZH08H6PtT0wxY2FeNbOn8CTdN1JwzUjB2zoMFuWipEw9knq72zYCwSZmca3kDitSN+iTdgTH
 wWwERdex5ZxLiKsarPi/eIOOr0VFlfwDIJ/efWGdnuSIxI5xVn4XKlbQz5M/l1T2SvbeWeThmVg
 f5XK9XJKEmuCOb5zNlbElPzl7DcKiThQ/VHIW1VwmSJ9Pf436qvmko2FfoKQR2/XpWdtYwkHT+o
 SGHeE5mwe+6XSIAdQQjPP+P7evnfcC+OYHT/JvorF4ZPE/atyKRzavtB0iMnRyoNTBOzYGGu60x
 bDbI4D78Pa1YawiV0hBqVddyVyISUTkSYQfpZAQmZre5LGCdQhEjwno2E9BU+KKFhJlo6uxEcXw
 Jq0cgyydtXsnh04CyY+7uQy/rnj15EAApJX8m1Yd7BxphiF8AivIxtSXho/YM19GjhD3GcnX3ZN
 kWqa99ssVHTMP1wxzIA==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b7dd9c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=od1gnLZaB1Y5O4OfTGMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -Z-w0GeDqONy2Ro1an5DbElfCOv5SiRN
X-Proofpoint-GUID: -Z-w0GeDqONy2Ro1an5DbElfCOv5SiRN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,arduino.cc,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97905-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 74D3B298031
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 11:38 AM, Srinivas Kandagatla wrote:
> From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> Add a port node exposing the High‑Speed and Super‑Speed endpoints,
> allowing the USB controller to be linked through the device‑tree
> graph.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

