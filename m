Return-Path: <linux-arm-msm+bounces-112207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZnGnGfgrKGoB/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:06:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 642BD661845
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:06:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SzIFmdHK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ff2k9l8Z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112207-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112207-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 283A032888CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CF537E2F2;
	Tue,  9 Jun 2026 14:46:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D2F35CB81
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:46:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016396; cv=none; b=nN+dDLnlsZnernWbCk4x1MbW/252F+FnM4NAy0p5TbdYZT/NPHzD2k0rV+IhvrCL2Hkf2rzlvih4itPvgW3Uz6d2JHfcTRR9L+eFBIYg4uIuml+gBLAws6Of4eXjuXKlr5PQCGGrz39jNkw/eZYNIEuUv9oCjcaCA4pjAVS9MUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016396; c=relaxed/simple;
	bh=tvwVRyA5cl0JVgLnJayd3vSic9Y3HITqHoxjoK0cvyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=s31sIdPUqLFPIPgLYzabGqxhiDv+mkOmGfOoxZuYGRX2+iIaLYUD3rMkKZ1aDN3yr1cE9EBYi7FJWaWe9UGz3P4Dw8QP+d9/r5gTFnB1wz9BADkDNwVER69jfQKiiIw7fZWPxuHtpennNTOQrtLL5XEqjqMtR2fVG7QFdg1raPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzIFmdHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ff2k9l8Z; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClYG02706226
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 14:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZwi3TJldUuul3/U51ZEntUzYSLYU35ViiOd0AsBRRg=; b=SzIFmdHKBVSoUczh
	+734fSg+HMUt/3xTmbxPLWVbzq21t1v++zSP+NV1oBqIC9bZ/LspxLBmB5OUgQxQ
	4yJz1vz3Yrs8W5EkTvMNPUEtaZbH7b8PspS35bneQUALFVxk6sVIJ3A3wPaTRake
	U/dop/rTyO/MAg/FQOZ6T+oE3LOuY/rPD1Ux4Kd7V0t/5WG0ArE7oLyXsPLbKPES
	nV/7ELL5Gn+jbBXaC+5pVJanFt5JdVywwJg5NzMK5SEqQcPxwRmZXNBTw6fQCugb
	Fc48a57Iwd+kEu7wyYKiVvZ00duDJG+o5sCqA6Dx/AipW/MYv8palEsM9BbmaWHU
	oXaCRg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt1r2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 14:46:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c53e2dd1d6so248885137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781016392; x=1781621192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cZwi3TJldUuul3/U51ZEntUzYSLYU35ViiOd0AsBRRg=;
        b=Ff2k9l8ZTm2zyhbeZYxUovTR9gVpVX5oMtL8yMIHiJkpeloxJRExydeZaMh+0lufJE
         LBrz3YmpzLKRism03kbtQEnllehpeIXOJDoeeyc2Vw1NKIzH2C1+efxjR2wOPgbGWszj
         o38BL2l8iaoKhUYPlHrcAVetBzo/vgDSfeLrOLI8McbbRjqHABF31+39B5wOrsG4yS3H
         +vOZZToe8i3ozOd910jmAeqVGP5Xh/GOGWHeCWwmc4rIHtA3l1V3YCRTA/af2tFReLIB
         V7KOtgKd1ZE+s0VB2LzFB5BiJE23BYiz7A/oxueai+N+jdBbAwD1ICBnp5UoxeTtH2vS
         h48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016392; x=1781621192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZwi3TJldUuul3/U51ZEntUzYSLYU35ViiOd0AsBRRg=;
        b=FygoiBDTLOL5yFY9/MGi0iDbqo5Wl9Fe+/thJNpJF7CTMzORC5io5dYswj6lOCf94h
         szJ8Gu1ajxKLyBSt/TDtNTnLXubqVbkkD2O2UdGomD2b/HFuznbVmToxiGGwgwFjnwsi
         1ZiBK0JsEkXXQ0CRZWy8UUVN+s+eNBIstHtDhH+t5QvlPJsPhSQv5l4ezCH4KifuncSb
         vYSRGoxVo76o2OSFXK0fyqs3dHtywch5u/shA9FsvnSlESOq9F8wCr7a5GYX/UJxrh+C
         VU5g0oJ+cmbRYzHzdGG4m2G7yHD4AIGatsbNusVcGfOb/ujFXpLBTcOVTcUUlgVAMiMs
         a4mQ==
X-Forwarded-Encrypted: i=1; AFNElJ89S1+ugRoz9CE1CHLU6LbMQvlVkw7XTLVNaX29qYDsQrwVZOIas2+nqNCFl385CqQ0B2dUzBzZsWMnGHXX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3l9pJE0+EDOjy0QFXny3AEldMYzts/1BTTtxHOYe6CT8/0FNZ
	V+4PGrSsZgPae/yC96dQv/cfYv9Dtii4O/Z+cYrvng9lQaTKsgME5ev2LLPG3+wwKzD6eRdWCRt
	bn9UIHCetvMhgJTFt4X1GEm1oLtw0GzrCWkIe5n3oIUI5QJ5ZUS1GFYbT4RTgcgldCGsu
X-Gm-Gg: Acq92OGdtHqG+tWyuYq/b0weEnRCAbhmO6NaaDA8a1QHaqFxMSNORSdRSXatjac3ffr
	1ugH1qkcZiJTl/oGis5ybYuis9FRduqMdpDBfA1XfaKGVutpcwssY1VeHvN0Bvk5qcdmyK+dStM
	sDqflNc3vooy0bScnPa4rSSrrV7nE/UX49eGdLaNvbVfoco2oIxbI1d6FBUoZKvY8Z7qlR4uNMv
	74Ofr2MG0NoBEVUzYptTso6u55jJ1cnBavYtunXNlnjttiQNEhF5eRLre/dBfCkSoy6cTEW8j50
	Elsa7bePubHCbJDbFS8ScxVEBlzBi+8RJK2N583yEAXWWDRFAtOniBQ+XaNf5WYzVZodHGp0Za2
	qewCoEO7q7tLtnF7raccmLKVDm62Ru5oCzRmYrHcnkzurBq8fETKwcdEH
X-Received: by 2002:a05:6102:f07:b0:632:8717:e553 with SMTP id ada2fe7eead31-6feff065149mr3013598137.7.1781016392294;
        Tue, 09 Jun 2026 07:46:32 -0700 (PDT)
X-Received: by 2002:a05:6102:f07:b0:632:8717:e553 with SMTP id ada2fe7eead31-6feff065149mr3013430137.7.1781016388136;
        Tue, 09 Jun 2026 07:46:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f35c2sm1071131966b.61.2026.06.09.07.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:46:27 -0700 (PDT)
Message-ID: <2ccefae9-2209-43ad-aea6-f909a9e730b9@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:46:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SM7225 (Snapdragon 750G) Mainline Bringup Status & Blockers -
 Motorola Kiev XT2113-3
To: Angel Saucedo <anyeloxd13@gmail.com>, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>
References: <CADi_M0x5BnGamkMZ4oZFZwj=m6Cw1s6vn74VqnSuk3nGqfhM_g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CADi_M0x5BnGamkMZ4oZFZwj=m6Cw1s6vn74VqnSuk3nGqfhM_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dAvakQk0ZgoF58UHD5i_ouwIqKNsLYhO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MCBTYWx0ZWRfX/seBwQ7ypPB/
 dBw8XKZl9+WKHrvBFvq2HkVitN1BGzVcFuJbeLeQk6hXdozFZ8QzeJIHLRbKoJDhvYbTJwnZsif
 9sVEpujAX2DXkJ7mPiXf+nxA9HtFh6f7NHwM+D+pAVc5FCZ98dR78Zh+NN5u9Aux1RLaoQA4N/N
 JnPy0brtaN1ngqh5HhgNl1+Bno1Q5hrZNTaRyxdJ+SlboweyfP2lVBxcj0jW4dP0GIDdTi1cPbp
 lSV9RuIAwnpovsfOiMqsuwgL+9izwvcgjhupq1lHgVen+UwZCxC+83A/FeKvd6qxE+3IQz1HKZV
 l3ZXgJ5RiJTSWIPN6/37kT8HmqaNKslHJ+T628A1ADW+hs2kvQtiIlMVCV4DWh8oE0NWMe1m9eM
 6Qe8/2nI+9KvqbPcVdHGG9hWVo055thNcdZ82LNMfPAVBRzxsTRv/0lq9xSgk/sik8Kmk5DoAzN
 wSzfpaxFgysaVLb014A==
X-Proofpoint-GUID: dAvakQk0ZgoF58UHD5i_ouwIqKNsLYhO
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a282748 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=BhDLIM48toLa6vwcP18A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112207-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:anyeloxd13@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:luca.weiss@fairphone.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 642BD661845

On 5/26/26 7:43 PM, Angel Saucedo wrote:
> Hello,
> 
> I have been working on bringing up mainline Linux (kernel 7.0) on the
> Motorola Kiev (Moto G 5G, SM7225). While basic boot, CPU (8 cores),
> UART, and UFS storage are operational, the project is currently
> blocked by two major issues.
> 
> Current repository: https://github.com/anyeloxd11/kiev-mainline.git
> 
> 
>                                                           Key
> Blockers:
> 1. USB (dwc3) Timeout:
> The dwc3 controller times out (failed to enable ep0out) waiting for
> utmi_clk. The QUSB2 PHY requires specific register overrides and LDOs
> (LDO2/LDO3) to be set. However, forcing voltages on LDO2/LDO3 from the
> DT causes the RPMh PMIC arbiter to abort  (error -131), crashing the
> system.

What voltages are you "forcing"?

> 
> 2. Wi-Fi (ath10k_snoc) Crash:
> The physical chip probes, but a fatal crash occurs during the WMI
> handshake. The signed Motorola firmware (wlanmdsp.mbn) seems to depend
> on the proprietary Android qcacld-3.0 implementation.

Do you have any logs?

Maybe +Dmitry or +Luca would be interested

Konrad

