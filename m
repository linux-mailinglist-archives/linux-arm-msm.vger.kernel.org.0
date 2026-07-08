Return-Path: <linux-arm-msm+bounces-117624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OjYCK3NGTmohKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:45:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC5E7266D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:45:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WMutdXuM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ja3UGPQB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117624-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117624-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCDD8309748C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 12:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF63044212E;
	Wed,  8 Jul 2026 12:39:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8235A43E492
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 12:39:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514387; cv=pass; b=AxhVwnuvOQQjA4dONchkHr6FTTnwKBdv/JdborcfSk9n85WmrdoSxOgazn77vX7YQURejW7flOr5ilO0bJ8ifVVttcF+0mUuCVVioKLX8aJRv5hvDqQYwzJ3CYclOJQTCEj/pYlqRpncozjYT4xk1OetKZAvbLZTXxnS/3LfgXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514387; c=relaxed/simple;
	bh=n/sGbbutQ73G342dpin2WL8qTmPSXEGKF9D4zc1iiXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Us6mdyyZNcgwcVRb8DEPUwV2s+kezHBv3llcT611Pw53uI13KbnTlaZbfpiPVNTqH8iBPAzCGJXSK4NsuNaQvU1KDUwhuqMhD3EY39B88kw4xQWESBTfZyMsuiysNm6d0qYWp4GE0D6hYg5pMfAxdhu4lcEfrBdhPfEdOVkUjy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMutdXuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ja3UGPQB; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C39KD2605295
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 12:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=; b=WMutdXuMbVkKPC/j
	6HN9SqXaZSnN4OtWCnX8k4AsDfDfx9zvXEslzfZbDuBENNg8QNebTMaBz/dFqB1m
	OHhP5nD5UhVqtDryA283LgRfFPUFnRtp8tQiVuTITPeP1QamoPF1xuIHG+oA39Ri
	Pir7o6URI7gqHvWJFOv0H/qBblZNpDNvzkji4i4HEm1oG3o7qQ7kBMRpK5Djvwg5
	/oDq79tqVMuUDBGiJQB6sC+hgxrAoLAikyi3xWNseZ2+8+8ZmbItTvMf7H6A2AK2
	16niAirL4jz45iWfDJ20W51WL3f8c4c6//WmPFK7pvxGJF2Y3C9p/fkgnc0cMs0r
	Qe56ZQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5amsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 12:39:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f113592bf3so13477876d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783514384; cv=none;
        d=google.com; s=arc-20260327;
        b=HXIZwzCgAfv7b2lQLIg9ZI5hDzbszz1w7QVDj29w0eVvVxRrJtOnHhMW4QB2cmQrCy
         9JHz1eCJaQ5X6ovEosahR2PMrjXkiAWBKckxwdntbyYzeEmu+482tUlkjeFyUXYewfax
         r1LHT5F9+o6FFCSYTT2sQm0W/6nTX8gBTjmmbO4tdGOUCpp2ik5/IIoB0tw62v+QvzPx
         /oWnj6Wtrg0jRWf17wT3M4sMgSd7eIEc89DxQZBVtgb65ldAOBotPeTTmtrPKv5E4+ua
         DxGZSRprUiPCELj3LO59w01MFZchKeCLf5sx2STzl6pgygsTZ+569BKNXMosUbZ6gJQv
         viUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=;
        fh=ECKJDK7GgqjwP3in7lYQfh7At6KwvWoO9BsfKigc7m4=;
        b=rLdr2RX5CzMod1XUSZeVJFDUw7xUL0TUwslpxXc/tAk7FODtANlJyuE0zj5H0AbROT
         Lp7VhcFBU/WPGXdaPpgMh7TCHCvzBNYCjf+cqHioqEeUYBXtWRyeNNTyAudjDNVSZiIC
         YoYlAB1RdKNBhX+aGzGvKxgz8fqTe0c6x6UwNFq089Ma1vaeFO5nKxtcqINbsMYN+yPW
         VXn37f+3z3GE6kv7WwDKRyjhqwgAkFVTExQd4o+mbJEWxgE2mos6N9Al5UMf+gILaH2Z
         3eODZWNiUHLsBQP9xuLUOdcnmsVp2ElhxZGAOnv7rp1rrJwsuTVaM73LxTGujJlW2sUI
         aw+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783514384; x=1784119184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=;
        b=ja3UGPQB+LrSaE7IbXO7DRf+BBWAP0NenUr1rAbjQq1XdTWDtApLGJzjb01Bf3s6+7
         wjQABJfMnsB6GnMeLkoguC6MAojP2tVwDhAvnaeAncgZxsugijWzxXJnYQol0J9EfAvX
         fWUrKqWIy7pSFr9CiM7jv9GHRCJJ2qiEijb7Dv5Vx9OhnDqWeDP0xzg6nySyW1kuR9MV
         V7+6re3Xskw1jhABPwZ9jxuWQvDPuPdylhLOt6tT083pnxfITjAUhbp4ScrXEvsOF/xE
         7J/JOATgQB04h0oys+ybCGl+JJLsW7srPshDTP1TvBllz2EH+IfMUZSqojKRU1wI7+HO
         t6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514384; x=1784119184;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=;
        b=LiM/LZ2zXAzHo7u4oy+GaG0QbjBICF3SBpOswAS7qNzVNxgUMuX8fHkmvHlLEP61m2
         VIEIMSaLehX8+IN+qxoUGc43GOQatAh3VvLLlsQaKe7tqgbrSky1AXe3El3WyEdsq17S
         U0wd/UzJKfwQ+8Ar+PsXVS7S0QeekPOGmfyIkP3LogbwrGdcNctQAYXAHAApSIxZhd4Q
         j+zNPWCDFMnzZZCqZEmExXfuG2WQ6Tvif/xZMNs7k1zei25jPFRntOD32V54V+N9wuzK
         wyKDkwGKAa4BB1YLA0jMKwkLgEMczWxGuKZVRq5J2k0GdmzmIbUszeqqe+6b84vS8ldG
         HFgQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3Jzk+KBZnnp+pEHLDNKmEsKhHzXFTK75AXwbbiMHmr2Orri3AYkbaX5cod/JxXq+r6fdLBR/beuJ4Pf7F@vger.kernel.org
X-Gm-Message-State: AOJu0Yx05c4yLYoZfAfIbw0gbf44LGbjOZYuNHh5GSwFzmTAe47qWNm6
	2za4HEEu7C+E4mUC6uAZIHvr1PvH+ZezA5Lm/0yQ0uxXXQFiJZzZDAHorAirWiJjkEbbP3IlVom
	p9rk4XpNREN2ggogTedSfRoP0wNBa2aRS5r8c6uvvJ7RKWgV8sGhDwwCVzLtCAZfi9qhtnUu5RW
	YMtQwpvWSpHzx8PWi3RkudAxDeJgCtAfvQdfpWAYDKOi4=
X-Gm-Gg: AfdE7cm1TdnBFA58xkvCu39+KBKf/Q32/bfimewn1PN9S9PyE5XPG3xWmRfsbaw4G2l
	hVDfMNyaHEzOqWgNsn8NJEug7ZVquhRijVGzFbyLQOD4LBH2NjNSCgC525veaDiQYA9Z5GsgwUe
	vTCM4bGjeM/bG/pDDo5nSmXqWQdNV2kGvK2PH/34rWm3seFt7UKVHYIMDknLeguYRrHR8lovr4Q
	qVAo288ffJvLyd9BT7D2KSMBBIrtDN7bNqvcSkJCK/iqjImk3ohm/SXXiBywNU5C7jjCpbligfE
	jjOY1WAOZA==
X-Received: by 2002:ad4:5f8a:0:b0:8fd:6dc5:946 with SMTP id 6a1803df08f44-8fec35246c7mr20100766d6.59.1783514384014;
        Wed, 08 Jul 2026 05:39:44 -0700 (PDT)
X-Received: by 2002:ad4:5f8a:0:b0:8fd:6dc5:946 with SMTP id
 6a1803df08f44-8fec35246c7mr20100466d6.59.1783514383642; Wed, 08 Jul 2026
 05:39:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:39:31 +0200
X-Gm-Features: AVVi8CchIqRSdmxO0bXp2YqtKRf6VLcwQniYXaK_pILrgpsztuik_wMDiAIIoR0
Message-ID: <CAFEp6-3-OZKpn-2WV8hKC5dsid9X-usjmiYLdYHeaDKqHGRonA@mail.gmail.com>
Subject: Re: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e4511 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_SFytyMYinpwrXg1NNAA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMiBTYWx0ZWRfX4ucR/TfuLDQt
 TEPRMMDmxr1qXu8RWpXcMVjq3Be6dwlhIohXNBlZZixaMzXeTF2Mc7rdLHauseYqcfOkHuPxFSn
 AtT++3sWI4p0sQdnpit6vkSfJ2XQsHs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMiBTYWx0ZWRfX1vn1dlbKpFxO
 N331u4ZMWtLhjzC2WAZZjfVuKq2DXK1bm3aFHNK8hkNAPzG/VEA0AGbsB6kjzYbh3X7LR9ow0t2
 sXzZcYhmoKWkNnt+AvRhGd+sVEIwsych73oxAvN70Jdo73qT2hjAw3lDfV58tZG7PXivMuy5ukx
 Ai48cWiGtnW7qdNU4buyeRX7n0oWzJqTwoWVFlRYlgT6TH4s3jzBfyEwyt+c7PI8ylumKgbbN3X
 I7XQTkOlE2udfROlm/30dwNrV1lXcZ1aNwUpiX5ZKXmp7arRWFUMDMCtF1g7jgu1s745mTO10j+
 h7kMvhiVjKBiHNr71a/5d/582wSpahzG2+axAC2Wx7EJSPcKAx7tMbFHl/eDqbS7bzVfVxfNe/M
 CKLNMXxno1mczLGtANqT7AddCkPWCA47pcAsDIeK3mF3TwQW68+20o9RelX6HHkaxbzAJkcr86/
 HUVdxv0tdeUQqYyQkZg==
X-Proofpoint-ORIG-GUID: -CliABPcE07TjAYpUr9CawZeO49gW-Ad
X-Proofpoint-GUID: -CliABPcE07TjAYpUr9CawZeO49gW-Ad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117624-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FC5E7266D2

On Wed, Jul 8, 2026 at 2:07=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> The original iommus list included entries for ICP and BPS/IPE S1
> contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
> ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
> CDM IFE. The remaining entries serve other hardware blocks which will
> be described in their own nodes as support is added.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++=
------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index c17b9757b2c86..c4454355f07ea 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -112,7 +112,22 @@ properties:
>        - const: sf_icp_mnoc
>
>    iommus:
> -    maxItems: 8
> +    oneOf:
> +      - items:
> +          - description: S1 HLOS IFE and IFE_LITE non-protected read
> +          - description: S1 HLOS IFE and IFE_LITE non-protected write
> +          - description: S1 HLOS SFE non-protected read
> +          - description: S1 HLOS SFE non-protected write
> +          - description: S1 HLOS CDM IFE non-protected
> +          - description: Legacy slot 0 - do not use
> +          - description: Legacy slot 1 - do not use
> +          - description: Legacy slot 2 - do not use
> +      - items:
> +          - description: S1 HLOS IFE and IFE_LITE non-protected read
> +          - description: S1 HLOS IFE and IFE_LITE non-protected write
> +          - description: S1 HLOS SFE non-protected read
> +          - description: S1 HLOS SFE non-protected write
> +          - description: S1 HLOS CDM IFE non-protected
>
>    power-domains:
>      items:
> @@ -361,13 +376,10 @@ examples:
>                                   "sf_icp_mnoc";
>
>              iommus =3D <&apps_smmu 0x800 0x60>,
> +                     <&apps_smmu 0x820 0x60>,
> +                     <&apps_smmu 0x840 0x60>,
>                       <&apps_smmu 0x860 0x60>,
> -                     <&apps_smmu 0x1800 0x60>,
> -                     <&apps_smmu 0x1860 0x60>,
> -                     <&apps_smmu 0x18e0 0x00>,
> -                     <&apps_smmu 0x1980 0x20>,
> -                     <&apps_smmu 0x1900 0x00>,
> -                     <&apps_smmu 0x19a0 0x20>;
> +                     <&apps_smmu 0x18a0 0x0>;
>
>              power-domains =3D <&camcc CAM_CC_IFE_0_GDSC>,
>                              <&camcc CAM_CC_IFE_1_GDSC>,
>
> --
> 2.54.0
>

