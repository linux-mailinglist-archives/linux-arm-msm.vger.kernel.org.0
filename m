Return-Path: <linux-arm-msm+bounces-113997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V3p3AkI2OWqBogcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:18:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E816AFC06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:18:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gVXBp6uT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fMRnXkv4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113997-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113997-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E1103010BD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A076C3B1022;
	Mon, 22 Jun 2026 13:18:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072923B3880
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134321; cv=none; b=QH2mqSQHT/+kzsfWBoEgWBvgMSRonvqowpvUUABJlCGlRAhrX/CjzRFvV4/QAOFwiq6ZZf7k1d/9ky9ks9mQSqpJfQpFElmAUy2XySOH4Qzjea0A6UXES/3Fz5PcqOsuqLFO4gdjeDwHs2mrfXgAfFxdp5WPjDGauFMCWFQekY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134321; c=relaxed/simple;
	bh=c+mrubN7rsfOnXUrhAmKfIPiEiFtp1qvBtE3BukFaZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jeSioCyuCa7hfbGovLovPUlwwhKT+wTSGaZr0WCcCWLKfcpvbyQegltrf55AYTKqEXfQrK8iEKEajBxjIJumVTC4S0YpsR4H1xdl3Q7rxc8Za98Q5v2pM+KRVKycBEDYycIUjkKR1nHpCBs7D3I0xImWDa2LGvSjYn0KGc/mxbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVXBp6uT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMRnXkv4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDG3Hf1062158
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	su379PS4fCpra/SUatLozY865KIfA6SXq4/i5am3Thg=; b=gVXBp6uTrK1uioIt
	z7QW4e+E2mlYwNiY26sj+jzsRolSEDRngNCyUFTZPrmkPXNg9jRBV47EXxRl7VRH
	ZbfDmyfFVcMPopYczGuYuoW0aEhkyFS6gAf3KPK84WVoB8byIsuxgNHiY6r613T+
	tUH4WMAQGWwzy7cS1bHilZ//dZqME+LCdFQrao/9oxgmWUt/Frwkavg6mZ9I7Kh4
	a7QTRlrGGcknQfMZhB9oo7+gLRS2EApTIjUpFaiK89IiXi6E8JWz3OEl38lasYhz
	GHuUc0VGFNdjYBPWE9z6F5/7ZV02k8RUDQs1yw9ZE7xWXLyYf25vPXWj8HHedSj5
	aFosuQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1sn6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:39 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-966df3665efso1906575241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782134318; x=1782739118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=su379PS4fCpra/SUatLozY865KIfA6SXq4/i5am3Thg=;
        b=fMRnXkv4qNujbOJeFr8DaB9j15PaUJsJGCAreVmfZwm0i5x8JgG4VnyTsKq4oe98kE
         aGs8r5HsXSK7iQUfbnQGXcdB3c2xjP8AXpI9gSqaEA51zyozTMVjKUHXjdJX8sttew2C
         fnzHbZBqUxzb/IeB3sbE6/WO/l34IA6Eu6rV1jW8HcyES6Evx0Itt43oQalEiRRQLR3R
         QzJ2yLSX7l0n4cNdaEh5SU5ZTOoBeYGMKQk7tIhgQkgOlIY9FYSBnTECanAbCn4cDUyi
         Nmmb4da65FJ6YYZWO5qs+8nmPiVVG4I7vbi969JdQjUC9iyOaHsGhfNftf7dQEV/cDce
         /iGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134318; x=1782739118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=su379PS4fCpra/SUatLozY865KIfA6SXq4/i5am3Thg=;
        b=POXxtcCB4U1ikSaiaIhtMkmSBEBqEeTBbV65WBFc0OGBQhT2Bdiz073x/9hytlvFjC
         n43HqfXKqvEK7OzO5YfSGzgfm+ZQGPjtCPuw9fQ/jXKEmlSMIrKxAkTdg4ABTSl2kVN4
         /rxYy8tyrdfb/OvjwclHcBdq0QNBk4EzGMcE1FjT1MwkcdIUN2rPdFlLe/dkDc/7EEAM
         t7pmYQaOJ11qe4OpX+rTX2dqqTc3afPMNp5EW5/DV37meF1m1i2olt6Nr18qqmsVmk5o
         evZGcgToNuXu6TaOq1J1yFmwEVzttlBT2lTgBXUr0eGUQyT1T6+Lj5WYwAve8V0lIp4v
         dHLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/N3CrYoWoAbvIh42C14ZfiF9YM3leit1/aLR20LU0qUM+3KIxZ5LgXWfus5fZrUmNVGuY6EfWFesCfJXra@vger.kernel.org
X-Gm-Message-State: AOJu0YycAriM71PHj5h9avCiUzPWSSwL8YJ91pOdZRF4/fcGjQk02LTR
	XI0TdkGLCqhX1/bA0Zu6XAg5WyzJwPXaBm9BKjtzeU3FQUbRI3d/TM6sz4MtRTdptYhGKILIVJH
	46Zwz5BgQrjN6zxwYybHO+Bov3kLz487hCJSRB7HCdivTpUctSJ5vwadzmat93k4QAVR5
X-Gm-Gg: AfdE7clSaQb0dMmn7nSkS5IMl/WLl3sPP7QpakZUoEhKGzLP0P0iQSBZDvujYhyXclQ
	O/o8kp51DmrF4lkKEYDim4YqWqZicjG3fjB4PcGr/BSg0VtRNa+CZglOdkpEPvGF2yNJpTkLh8M
	zyHe7I5U8AjaVbEPfGWtRyGvctjBl3s6ax70Jya8hq+3aW1cZn36iStBzk2d3xZWBtwROhTQQ/s
	3D7jEnYvEMk04FFK8qST3sBdtuzVy/+g7TBc/8OjiQuf8oDjwpELTfFsw+veYIbNX0vowJ6cdK0
	+VRYN9gucgN+bsDHZTJaX369bQP/O0sLSJGZcEzL3iFfx31MQ8GE9mVYIOtu1Ju3VjJPIQ8r4lm
	53EttmXRjSkjXVeRjPC2BH7j2AnGMc6DH1LAbqLaX
X-Received: by 2002:a05:6102:548e:b0:604:f849:462e with SMTP id ada2fe7eead31-72a78d9227emr6430089137.25.1782134318459;
        Mon, 22 Jun 2026 06:18:38 -0700 (PDT)
X-Received: by 2002:a05:6102:548e:b0:604:f849:462e with SMTP id ada2fe7eead31-72a78d9227emr6429685137.25.1782134314901;
        Mon, 22 Jun 2026 06:18:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd30078sm294083835e9.7.2026.06.22.06.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:18:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:18:11 +0200
Subject: [PATCH v4 3/8] crypto: qce - Reject empty messages for AES-XTS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-qce-fix-self-tests-v4-3-4f82ffa716c6@oss.qualcomm.com>
References: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
In-Reply-To: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=c+mrubN7rsfOnXUrhAmKfIPiEiFtp1qvBtE3BukFaZ8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOTYdajfJ6qLD0b2DQCgJ3NCXMHH1ZjzGsVtuI
 6P9oyD3r3eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajk2HQAKCRAFnS7L/zaE
 w0MjEAC4TLJz1Ej68xBsNhIVa68is1as86eop9e2v1TD0+VSDjpYasp+cI6ZHukN1EE3rzaYMob
 rywaUyaGxf+sjYVUyZAnnZHm8HjOYPX1zME0JKp/zi6qwXTnh7whtFBtQf/xAqF+KRJUgGBC3U6
 yMsGA1+ZydV0E29eK8nA8BCtgooifXRHn0FWZt1tKlcRaywq9Np006Jqav0qpps3js/fsjlP/ob
 iKCo7ss+JEJI+L0UpzbOmCHRoL2U6Rzg6rcYI6gPO1mkEavJarU/eUG0nR3nO3oYQOxcf6ZTFqF
 ZMaXSWpgXsaQNXGljPeLVwg7mdUoW5Pc7J4bz++rFbKJaqYrfi0VfksXDNBkJ9h/lqOXVRiZeld
 89SxofCKk7oZufA70VM/OVLOEN8ZMH0TOAmMGYwGg8GeXgY91vUYDzGfx8W+oeGJYjERW6Ok9vV
 0hx7a6LosI3soYJopKCqV+SjEHRM0L+HHgZit9iLbJi4SZ1k5TU0eF95IyKOO2vkgs2dChEs/2M
 kesrl1IqngEU2c3CXko/gH6InTSUCH0Epzj0L6VBHT1c8cFmXrL6+sMcE+1lOctKgVyuONGUvXQ
 UZZiX512AdznXLGCDvQwWdPpfcwTSxnDwM36NqEnXXzV7f11OUvo3EQvXo2msk5Gup048ix76kd
 RF9chZxmAm8uoxw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: E-s795Bv8Gi6-ugbbI_m8Dq6MPSI_6ed
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a39362f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kiYxeA6Iecqc4QeK3QQA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfXxWrLEqGjVEB8
 y6JEnZcTDyInVg6cndeHoAT9W6gVtWLubb+OM6hMEmQqfgIsW6urrgX/mcpoA700hV14QcWaz+g
 UyHjw0g7VB3nrL443dAExajtSy/iKaw=
X-Proofpoint-ORIG-GUID: E-s795Bv8Gi6-ugbbI_m8Dq6MPSI_6ed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfX1D7xCWe05i7M
 mkTF3HZQKK5LKkzysNOdwOo/aIrMMTn2J2POcb9gBthZWBnkaGr6NNJARbD/7E5/5o5yCqcYW/a
 EActAgwr95bjakr7zH06ZlMCg0TC0Ko+Varr9jKhPcl1NKYwJyt/c8TL3iP8+SrG2D9zUvHOnEw
 VxDMQZkewhHrvIgNGr41IDiCUVYRqalj/9J7aebLS3RDW5EJAysrxehGUteaqmtR34832VfcNdz
 djznuiDfcJ93jWXXSf7iXZqGgR5ZDtNJt0maFUHoBFnt2ZNhHaSKZf6PXb5QnE91LpZQdVM3fy6
 3afb0PWAJ3CsZCS+3+gQEPoUfvxTSU08UtdB5OpQnZPwUjiWWaZhM6fX9OnxZGUDfygs/BYKDFh
 xr3yw5Nc8s5vPLrmd1DuKoLuhW/okDI18evZzWI3HEeUX9UW3NAX4c9sXlAm/4Rml7Y8eDh0jVQ
 IH751rgi9Rn1PZrGPrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113997-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91E816AFC06

XTS is not defined for an empty plaintext: it requires at least one full
block of data. The driver treated a zero-length request as a successful
no-op, so the crypto self-tests "unexpectedly succeeded" when -EINVAL
was expected.

Return -EINVAL for empty XTS requests while keeping the no-op behavior
for the other ciphers, which the crypto engine simply cannot process due
to its DMA not supporting zero-length transfers.

Cc: stable@vger.kernel.org
Fixes: f08789462255 ("crypto: qce - Return error for zero length messages")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index b27008ace93a8a40c291d564c3fb9d73df5447ec..e1f69057607fac36e8b4bdb5dd9e62a2aabe5f50 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -223,8 +223,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	keylen = IS_XTS(rctx->flags) ? ctx->enc_keylen >> 1 : ctx->enc_keylen;
 
 	/* CE does not handle 0 length messages */
-	if (!req->cryptlen)
+	if (!req->cryptlen) {
+		/* XTS requires at least one full block of data */
+		if (IS_XTS(rctx->flags))
+			return -EINVAL;
 		return 0;
+	}
 
 	/*
 	 * ECB and CBC algorithms require message lengths to be

-- 
2.47.3


