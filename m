Return-Path: <linux-arm-msm+bounces-109306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJdNF2hKEGpvVwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:22:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F156E5B3D2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39822319AFFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3672237DEBF;
	Fri, 22 May 2026 12:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOVJNU4C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AHokcY59"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25D037CD3D
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451650; cv=none; b=ZWV0yaV6Dpk4WhWFqMI1Lih3E7vMupp0a+UspOg333pFEaJ3uRTDt0P3wIb4wPCyGvzUL3wcAPfP4EaFtpxVUcuoWA//wewwbXRhqQxv5y3P9aEolMVGXUREsdjXGeTIIUyuMQlscahXQnBMbXQKSKJjrO/llt1bMXcGmR4FsbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451650; c=relaxed/simple;
	bh=Fj1A4b7g6dvijlX3WGGYJg3amw1kuK5FFTiSfqI3LZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ApSx87nwsZOMV/oTxMSTrBwlnOfqYYc1+yiJRC8fSEj9nM9TfeSPfy+IGianKjSAg2jTDHz4ngl+IvqbaSomizBu9Qz79L9kXddGK6rkqLNVud0fD0dieQLqE+lhnqSdckzE7EwRwj6OM1BO4k1/Cs1Ym+vzITTl4afg6wBRxKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOVJNU4C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHokcY59; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M7NXec778825
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zE6lEFfxgQ65YExek3nLbR2SvRi7Pjb1+wohwnY48tA=; b=LOVJNU4CyqKj/p/s
	QWN8jTv7RC+lKqSxMmHFkDFEaiiprnestt70R4eJ1ol8L1+Ym92QoR5ly+MzB2je
	MXK+iK/yqUzTGy7xO8bpXJJstcFVxx5wsJYjSzIDCVpQl1KEiBgC9EpcloabzCs7
	ASr0chuN3EDEU6BTGW6se8CF9CLuuASxowStasXAp3cSV5OLUHU/TZBwCAuXZV/U
	+Y3oaoZViWwOh/Fu/MNiFjh4/Fq+GLfo8NnvZbUORGiVod+lZUncnWg2ng52ezbt
	i8wQHKXwBJh1ZMMTBX/OJpASj6Zi0ULNtvxJ6STeFvWN3zffHlgspcXOyb/OBNPL
	WbL/uA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7atmf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:07:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914ae409b05so32287485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 05:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451646; x=1780056446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zE6lEFfxgQ65YExek3nLbR2SvRi7Pjb1+wohwnY48tA=;
        b=AHokcY596oJX8cHOsOckgq2k8Nl6mdD1jXdCBVFTnoUN/T0V/USLkQpAIAIIlby/q7
         6E9AD71G4C+ufFeobKNvs+SZSjHRkO+AMTKRS7fUfdaAmOYkO1KOOGx1iVcDDGk8M/k4
         Cr9q6SKcQIEj3xGtZD1+0vqF7H4dBq5an9QUv8Wr49NWqYae1DTplAas2W+g3g7BUcnM
         QISCa7z8x7dBXJMjKn7hbv29+Dm0t4GF0EfBgeF+LaFTdXNEHxp+sotIYP9sEXEwqNxl
         Ty0rZsq/6j5bxoQAtMR4/0Fcow5W5OUvNDvB+PqBT9+YwT7W8BGOgunlacvtUCM0fDCW
         5+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451646; x=1780056446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zE6lEFfxgQ65YExek3nLbR2SvRi7Pjb1+wohwnY48tA=;
        b=PjmMh07OIETA08uNXo/0228ys6+BqbH42yNiJ/fRjtJDGJi7+2/ah5m0Bq9yxfBtTG
         lZHtycfB91ChYVL0OMPZGDlUdtmcLDmPxPdQ0nNvAVBQREp284DSv7ONrvUHhlJyhyHx
         e3lPbBlmuhGmMo32MzBDhgZEZ/MA6YomDEwb6etwlmISaVedRNluLzm0qoQkprQ5P9rK
         Kq8/8bg6jasePxZ/iykNZoxoGdveWsYs/Ev48rqqLm3A0ib04btFPOSTnKl6bkEUko9W
         ImP7uB+wNtyqSgh9KdWbB+oyhv7ZSqAPPp1U60buPttd2cPwBsy8rvsEAHu0z27f04i0
         0pUw==
X-Gm-Message-State: AOJu0YxKNuwua5CzHp+/n/47N5kjx4nnkRiS/UHRXkdoM7z96eEaQydE
	pWS5rs3zime0hAptNChYylCKWO8Fc/yXX0viOwqvEK1ZrFY38xJNGoeQbvT/8a39xtpra9W+CRE
	NvEbMOa/OIUQpaduLVm9F8IxnZWfUADTZoUgMWwFE9Q5ftvbNhX4dRr4xvCdyR6b0kvxgJrjRxX
	ot
X-Gm-Gg: Acq92OEtxUEDb2r0cJ5nKZ63mvVOG0/jmT6Tqr/NtrynGM19d1fTQliXOCtedqtFMtv
	rras/DVnSR51rFRZL7woUl5Fbd1ctKVpZnTv/RQGfTyuy5bAFVmp5BfuQhG70n1AlqOYXbAvUsM
	EEczF/eoMrW/6jRmZ4ZmJj+2hbdTkzmUSdJMH+p+4KUUHoyM7bSBw/SNu21SSlxmEZDgSIOOB6K
	SFarYdOLpgi6L41EvKfXdwJY4Y1G4aqhGYQGUJgtfMZO+gAyVdERNJdw/7aVPb2qBE4+gDccuN0
	wkWarr9M9nDnyKeSIPN+j1QpQbFsATQ+Xoz1mqTNlkWZcJxhD1r7ala1pSuNacIzShea3w9mK9o
	Kx4aEXiVXU/bmMLfQtgkuQp3BOihOPiUxM48U9mDGQUM97w==
X-Received: by 2002:a05:620a:2682:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-914b49a070dmr346772985a.6.1779451646100;
        Fri, 22 May 2026 05:07:26 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-914b49a070dmr346769185a.6.1779451645680;
        Fri, 22 May 2026 05:07:25 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb133f7fsm599416a12.23.2026.05.22.05.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:07:23 -0700 (PDT)
Message-ID: <29d16d2d-3a3c-4443-8f78-b99a5c3c2279@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:07:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] arm64: dts: qcom: sc8280xp-arcata: add USB-C
 orientation GPIOs
To: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
 <20260522-surface-sp9-5g-for-next-v2-3-dd9d477407f5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-surface-sp9-5g-for-next-v2-3-dd9d477407f5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m5cyLeLPU6bYekwvFDs0s9trOij0sjQQ
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a1046fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=N2VbTgOPUDbNM2pmtP0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: m5cyLeLPU6bYekwvFDs0s9trOij0sjQQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMSBTYWx0ZWRfX09giARAfKEWB
 GAeL3LOu+1gZo2hVb3zTtKlsXkcaOGjjBDphQNI0E9jKeyO2BC2tCZ0uEVS/j4kbicQs4NKv4tJ
 olJwgP9arL2Fwx+j5gv78FLgCJKoVP1dr16nYmpzYPZRQKAXkRGzkUqJYyg/stW17/xZpUtx4Jx
 HVJT+QZaDMfAQ2pIsNcfHFe5BAXmhlFIWbMGP+c+CfUkt0y41nBWWU1c0ayRmnE968RpS5CglNQ
 xKvDbu9iJlCwEoz5IyLInpjOcqEFOa/KNBFfx2Dc4k+jAIYBFMYY8ZHTsSheWb/uZ98RE6McTKi
 GLT7D4SlXsKLlYEFujzuYFrZBeTWjcz7fQPqnNK3/oV3xmAadkbtL8TnmHrlwOegKUlj9IwJnFg
 +flOykF973XgV6zeyHgYGhQzQ8woaPqix2OXHeTo2kn70+U0OqMGVmDEJqdGYYt/pwrkeHqGslU
 MoRZjEQnZaZEf7YvBRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220121
X-Spamd-Result: default: False [-1.57 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.59)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109306-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F156E5B3D2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 12:43 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Define the USB-C orientation GPIOs so that the orientation is known
> for the two USB-C ports on the left-side.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

