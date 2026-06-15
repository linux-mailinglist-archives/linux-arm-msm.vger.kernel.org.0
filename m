Return-Path: <linux-arm-msm+bounces-113130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VQ5pFsS9L2pgFgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:54:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B915B684C2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:54:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Hl/Ye/73";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aHZOfeoD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113130-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113130-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C858030158A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C2A3D75A0;
	Mon, 15 Jun 2026 08:51:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7823D47CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:51:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513489; cv=none; b=i//seId2ttr8wJBvoXGc4z+NPhdfeKkJUBIe2shOkO2Y9K05boVqC1GwfB2uhDs+W1vXuvl+lxTyteGMeee+bxs2SC7/siEhsKUGolPHND7GY/EASPxxh7wO5vhG8G+RteypPuKUy7akxHOaRMIERhISvXjDHvCmAb7yT+CwxaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513489; c=relaxed/simple;
	bh=s3YPsS7TYXOkNKykf4aKHwJBdJUL1KkEkzkYprblN7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVxaDLUsZ4fo/cN9yAupupcYaiHvEjGPVied9HN7ZYOah8sDMPEXNj570C6JQMwXCnmksDVCJAr9hmK12PmtJWPAyoFeKfbn7q572sWiQujTG+Pni/eJ+OQN2knMUqkEVcKVS88nD0HpYqQTJM1Z7eFeJmi/Ms8Cm1PPfuGlo8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hl/Ye/73; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHZOfeoD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6IufJ3346582
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TY6bO/ZF34WSseauS7TpJELH
	kVqlLrjKDs2OgzBNdv0=; b=Hl/Ye/73vX1dcRAZ8f+m6tCwMuKBC5w9FXTPrNl0
	8JsuMq5AfBDbeXPO/IP63zrL1G7SeVlSAgR+Csy6DCF0noA++rMCtHVtgxamf1Om
	CBLtEcOkq++ctSCJLxSB3uSQPSOgbZaRx+q1r0ij9DJgH2moEPSBQpe6463RWwSg
	B42vo38zTqwj56tZCBydj6DHteNFydHUp6++GQ3mFvWKvYhlU+A/iVcSQNfBC9xi
	QKOYtOYzPxs8S5nyOz/wZ4Cm8ip+SH6oq7lAqjS3bvP9HGz15NADWIZI8V+I2tTw
	psmL1VIMNQ5x42zD6Q0WVZw6fVTrmANfO/YyXUmaamEjog==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g86h9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:51:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383414cf84so3524760c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513484; x=1782118284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TY6bO/ZF34WSseauS7TpJELHkVqlLrjKDs2OgzBNdv0=;
        b=aHZOfeoDM6578+Y6PxaHSxhgQO8XYSmNPyGxJ76vzJZkCKb/y9yIZyQZSSCVeZKFCA
         RgwV9dQyQIIipVrQ4Y8uAMKU2LpNgrm/5RRRCe3M10imMsIUbYXPdIo1tqEPv7RKWv9z
         rN38LdNSIuzY9ZZ+9iZcvFvEXVIM8cn8tO05SatbNQ/uQYeUArTDAkDgu5zjsBpG/Xon
         IUbCaJvjWZyokwEPxN5YfKUjP024GJwZbSEphJ9YjWHcQJYrGRcmrojt4Vib4LdAfFtP
         qLneI1X7CxXsS2bfiHp6PU7pjwFBP2M6HCcWtvDX9JSPtyagbk6j7I5A2E5CO+CyZHWc
         hEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513484; x=1782118284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TY6bO/ZF34WSseauS7TpJELHkVqlLrjKDs2OgzBNdv0=;
        b=fvUo9c4DNAUw1n3MradHA4Ui3SUad0Xuymdvg0lggHIt9BOAEe0UgZGfTPi8lEMv6y
         1KQvlFzKJYZHZCex5LKhpEeD2X7xM8S5XT3UMoNOpXJFMUU/biJVTrXwYR8a5GBBdYGl
         coBdVseiI+tjgTYv1LK0AsQR8YKOWX3qbJ2jBASwqrwNPEvgvqOkYqrSU990Rf6RcQJ4
         eIrLphnn93Eujarrd9zwYyAu1VL6jVAQhljdqM+ftGnnzuiqCXEmrHlII6avoK+ww659
         cvUc7RBQzeXgPNZU1lkkp7hkFxTq79hymy7TkoS+ti3sNdYLrNCv19sp0GN26ndmx9wz
         epvA==
X-Forwarded-Encrypted: i=1; AFNElJ9uTjV4DqY0tJkip/9zfLGZ1odkj7WIKeKr9X3fDNkt6XPMAn7GPAfuRyJ+PSRKUhJ6E2lFbRUIcXOqREMC@vger.kernel.org
X-Gm-Message-State: AOJu0YwqNzAlOSudG7bduGSo985m4H7OVcwW2hnqu9aOS+JqrMoEaZvx
	RdT05rCyH6KgmclFNTAlYOnVNyXAP+IleMacRaPkI1bUOVKMyIW/9BYbZ6qe8umOigQ9RFNmvPa
	CG8vp/XUCUHK0rGjhtks2rwBlBjCOyOtPTm495EDzGDRIw/0XBP+GJoBzKcF5PGCseELM
X-Gm-Gg: Acq92OENc1piKWW2NW0v0TeZgUlEKUJLaFJJ+5l/ClHHeFKBT4V51qUqZWUW8lK0qQw
	bMWip4fYYpZa4aNPQu/VDIibb128z3SRUkwZzr0Y2qlyscaH9MaV82mkGowMC5h3wfGKt3ZO7TY
	7cfMWq8qB0WKq/kVAz0YkzRwbBklgVYR0bjOBcU5E1KejpA3iSll07OtYC1bJYwpzfh3DxKFG/k
	hk1l9KRukNKgm0McbarwqSafQl2iJ67mD5ZH82k/r93ubHjNmUiIHDH/k7/XEKpM2JTS2leVD/m
	c8NsmW+eZcvInjZGOckQw4auPBAE3LZ758k0KMSO0ud9F+Xiwr7Y6PDxJHaWnbrvvdvjJYBte7j
	fW0nu4pqt5XLMyTeqUxa15XGqZEkMomEYY2QFUn3oUX6Jf7qOCEWJYSgdQfYpZqFZCwyF
X-Received: by 2002:a05:7301:1e8c:b0:303:f2fc:c483 with SMTP id 5a478bee46e88-3081ff4108cmr7650469eec.1.1781513484566;
        Mon, 15 Jun 2026 01:51:24 -0700 (PDT)
X-Received: by 2002:a05:7301:1e8c:b0:303:f2fc:c483 with SMTP id 5a478bee46e88-3081ff4108cmr7650439eec.1.1781513484027;
        Mon, 15 Jun 2026 01:51:24 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ddaf69asm14766842eec.0.2026.06.15.01.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:51:23 -0700 (PDT)
Date: Mon, 15 Jun 2026 01:51:21 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
Message-ID: <ai+9CYntPuyEEcLX@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
 <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2fbd0d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ZCP-bhYMSNivbHJuKgkA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: h3ls5zDTbE1qYZQWSV-LZkCr8Rtq7MlK
X-Proofpoint-ORIG-GUID: h3ls5zDTbE1qYZQWSV-LZkCr8Rtq7MlK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MiBTYWx0ZWRfXxb5Lo++nevA7
 DxYOtR77MMTLW08xyVWeP4y+7/4KBFDkfSoJxFYNr4sIGDViZ2SV0hYGaOe3UxvRwfDvy4bOO5H
 baWQ+nHE4CiQWBr8L7U0cO/cHVhwQoMtsbzKxQJuXz2e9enYHCOoDsEunZ1cPO/DqY/ilfAF22z
 IhVlAU47w6QGEVgBxJbcAXH+5zUFYJ9cbX6jVuPF5MiNZbBI2CNQOy+XGCwhqf569+uTkMYGikI
 DpkA0tHMtTKnwJOZCNKhQOBhO9ZD8f9/fSWeFK4Lyk0Kf/oRs6gwR5IyNE+RLh+01j+S+x+a0qv
 EJdaEIFxguDg8F1cWzXztXu1rZ3L284PWQ2YPqbhhAiowp4lOvZbS2s8whaCHWHw/xPueGACV3K
 E2c9LGtuAxvd4JmSg5wE6+CawV4A2lQ8UuC5nciDG4E8cIWFTevPCfvcSYLaClZQGPfLJLZuOIh
 sPjIqPNrX/vaBr/3IRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MiBTYWx0ZWRfX1pALauBppRQ0
 LpP1ulqj2/uJHnqrWMLbUTTXcqXFmsIWtTw+qRtkz+ssR3qKt/Q12OXyohvPOlECKqO+Oa7NZwd
 EGZroiR9KTSjL95QQTPdw3FwbziObIs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113130-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,hu-qianyu-lv.qualcomm.com:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B915B684C2D

On Tue, Jun 09, 2026 at 03:06:02PM +0200, Konrad Dybcio wrote:
> On 5/28/26 4:29 AM, Qiang Yu wrote:
> > PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
> > clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
> > directly instead.
> 
> This is the last piece of the puzzle that this series is missing.
> There's no QREF clkref_en, but there is a refgen that needs to be
> powered. For PCIe5 on Mahua this would be L2F_E0 (0p9) and L4H_E0
> (1p2).
> 
> I think the easiest (laziest?) solution would be to add dummy clocks
> in the clkref driver and only toggle the required regulators. Another
> option is to defer back to individual drivers (such as PCIe QMPPHY).
> 
> I kinda like the "one central node to drive power" approach, but I'm
> not sure others agree, since it stretches truth just a tiny bit
> (although not as much as one would think since there are *some*
> controls for the transparent-to-the-OS hw pieces in these paths still
> in TCSR).. Dmitry, Krzysztof, would you object to that?
>

PCIe5 PHY on Mahua does not use QREF at all, so there is no refgen for
QREF either. The refgen supplies you mentioned are for the PCIe5 PHY
itself, not for QREF. For other PHYs that do use QREF, there are two
refgens: one for QREF (voted here in the TCSR clkref driver) and one for
the PHY (which should be voted in the PHY driver).

- Qiang Yu
> Konrad

