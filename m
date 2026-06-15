Return-Path: <linux-arm-msm+bounces-113214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id maWWCsAgMGrzOQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:56:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C15687F78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:56:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZtuaOlcH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Ja73Rj/E";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113214-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113214-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A14FD301EC3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3582140912D;
	Mon, 15 Jun 2026 15:50:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE226409E16
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538628; cv=none; b=aJEJdFEOJoBMJlpKZAa0Bgk/QumnJ3/0qe4vbc/NpHtv1TfY78yWnTo2GzJn+KfPMp836S74rYybKCVQ35oXxMAEGXNipeKttsmLOSSrxypJ8PEKd9pwgMFLvD6g1QaeQIqlzhZXE92hMbZGOZB5V8kv32/MK7PCB66FniRTVtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538628; c=relaxed/simple;
	bh=i2fU3H0f8RtrifvWpGUX+rYKiakFm1ijQ2hsGbX86gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=igCGxntQ2C/JZWxqxda8ryZrGKX5A1MKKBaiEpwcbs+Yec+aQ+ItUSielo+3SihaX0Y7IeWhSj84VXe2w+tFKnWTozKzCQUllJB1k0/Ywt35dQbivzJJQRGnfepXDBZPdW8xZWl8c3gkXGQ3hODqd6Mqqp8YBlKx7eC0FpmSrh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZtuaOlcH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ja73Rj/E; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhKf3449118
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GvVf4ywBOXek3VYmfQJ/BRHKjKyA+5DXdSFDv3cDrFQ=; b=ZtuaOlcH4py7MOKT
	JJT26dIfoOSO2/9mj4T77e+w9mg79tPF8r55+pdZelqg6m0F12gH7hd3ff+tCGug
	20+ZdV5+TqzP1s0Ukz5OrR0Eb/YRHB15qSqGsNn3lQtAoh6rylq4ptZYAHH8C7A9
	8d0Lae/dVNSoNzAOEb38nrZrBf0ix+ZwMuayvDl3cD4i2/ibTH8PfE9SWljQz8tR
	uaMjT9JF6wCjZyxLXLtdS2EcytKQf0mKvmHff+4c0h8FoFqiSK08GNpY27EZ+9zT
	r2L0SFFNWNxFOV69rwiHLP2qTLooO9qPUQXmij6t45C2ocsu2/xzBf+uMGOIUWS6
	ZRbl8A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa71etg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:26 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c33d75153dso1013636137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781538625; x=1782143425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvVf4ywBOXek3VYmfQJ/BRHKjKyA+5DXdSFDv3cDrFQ=;
        b=Ja73Rj/EYpg/W2kO+W3pWLPWfNm8MYU2PrXOtFrk7O0vpZpcTyOI8UgQ3/8+T8I8gB
         2Rel3Q6RPDIcIddrlmua/mEK3F8zLUXwnvPu/UHng0HorTTefP7TWzRdzy74xdA7wxa2
         KFnYiU15m3odFJi/PeJcP1VzVKclisHPHtf5fMHBvolTn/a081ocyi5ZUU/mMOdagrjI
         3B+6arjV5kVKF60LYiX9G7qHZ6xeJ0eSgCGeSq9SD+iUOkRXGe3FPeBOYvgmiB51XTj/
         YLTjNRLWfQV4+GaZfRzdPe3xmjzdKki3BZBY9Xyl3AcGsEGG/hBek9szEjkUDkf83dFE
         7mDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538625; x=1782143425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GvVf4ywBOXek3VYmfQJ/BRHKjKyA+5DXdSFDv3cDrFQ=;
        b=rhYYRSRA+JWDpEh/ENc+xKqahTX2oMrXSVZ/pz6o+TKZO0MAGkORtb+bHvrurds7Ub
         0DYP2xpXNCT3gjXh81DgJUaBLXqQy6w5R/mkBEzcDFKf24+e3r1sbVi12Lv2biNfsYVL
         s7vlzdx/l8oFBVdcCq5VF6c3tXBMPmIQSeoTW4NqZzmKzkbse9GBRy8idKVfbGiKUQL6
         QKFwVmjce1iHI+GDgikCiP7pSm2m6qxxcOdo1+rokdP3swuxDXC4vovzjP3WspOV6Jnn
         UfIvnc+B7Vp1vpmSlqYep43+FF4IJ28ErZywbBzKVRyTEf11JHX97prr3I1gZ/FTR0O9
         xfPw==
X-Forwarded-Encrypted: i=1; AFNElJ+Jhye9RTMLFvmwwoq3YD6eqznF/j/0RHY2NGG71JDhC0tpkMhtm1fRhQVJUsiOz7J8S38ukDWxhikRLiMZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyBx9M752VmCj5Pvfxs/BkP9/M88GI36J5YxHLoI4jrOJScRRBo
	g3vh2O6Fq6d0wsofXg9LUCEXGq5G2wpygeKKZKu9P41Fx2vm3dRVBfHc6vaPYdWOCGBppQUbImj
	+LkcN2PuUP4xceHmBtsvPEG96Ls4zpFXIxwZPWuwmpmMMuMoN88zIrDU4ku/lN7WLJ4ZB
X-Gm-Gg: Acq92OGtqGWKiR5Pr0b6zQSsGLfpWiNN791qqb/MwRTTIQAGrMuF22a5x1ny780aAVs
	FLEKk/4iQ41Hcpo+ahrKi/dF0cCexQgZa8lEq9f8HEqrMzhmI81P4wZAQmBcy32v2w6CKZP3Hlo
	nM3Wc6YQrAwoE2QqV1GpSWlpBw43eT/3J7pqaQu/Z0KPG86CrwrRkDSDHv0C+mVIa8xOlawnCo1
	p6xXtQS0rMvG0oqXJpc+YgtB2VSO0A0lzB3cnJoe8rjGH8t7C+0KWyQbZf7mADdWTkPbJBCBBDi
	4Ie08hx5yTXwAHpZ6pDzc1RhUw03zRW6ABCH92eji0XQX2w4c/ONfkSzlUQVXznv25n7PQW48qh
	NwkQ62k698XjOjARcg0R3q0YLODKh6usJtslHp/VkTj0JA+FkTuc=
X-Received: by 2002:a05:6102:801d:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-71e88acea75mr7814527137.2.1781538625123;
        Mon, 15 Jun 2026 08:50:25 -0700 (PDT)
X-Received: by 2002:a05:6102:801d:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-71e88acea75mr7814498137.2.1781538624459;
        Mon, 15 Jun 2026 08:50:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7fe3:eaf0:5a0b:2610])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f450sm38643032f8f.10.2026.06.15.08.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:50:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:49:54 +0200
Subject: [PATCH v2 3/8] crypto: qce - Reject empty messages for AES-XTS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-qce-fix-self-tests-v2-3-dc911f1aad42@oss.qualcomm.com>
References: <20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com>
In-Reply-To: <20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1432;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=i2fU3H0f8RtrifvWpGUX+rYKiakFm1ijQ2hsGbX86gs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqMB8uiTVzUq6zsXGI17YitgotwtvpOvjWs4SVp
 zEJ8U2hxWCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajAfLgAKCRAFnS7L/zaE
 w0cJEACzsfUnjbY5uXwNOwJqpfqt0kdS+dtI9SbD12awmoINPES9jW748rjjS0DgzlcO+jQhlsk
 BjYjjh5MokdL4NXga0Tvju1ZAShPYm8rLBvzv0kHrppuv2xXy88ZAxFVVyOM3NXmf8kr89XYHDz
 XJYjWvK3EnTnB2do3rKalb2ofF1jQ2owvmkh0zr7lvWot0GgBoU4qoy+AzKApEyq+YSrd25uXR0
 czh/fzoUUXmiSkLVQnT4uwmHQPewevsnHUbp4Y5FZR+toXYqYmyFA4I+oXAOxyjV3DubSsK46Q7
 2wIkikvjcics51UKy5yn1AkeygsAaRjDwbKH+e5Q61cclVDlUDka8t1HaMHVOFaqb57KcrVyIZC
 H0s+UGusV2Xoj0VssWKg6ft+mwI7RTPPrPZR2HACdsuD/MulK0F0PhSdMRiGdBJZrPt97y81rpa
 844B07hs9+MxM5dFZ886bTbtxTXVVRl3tAfFKtQcTSNTkAdrm6FGvRlJHs3g8Gb5fC/m119subT
 g8Dz5TCo+HraFFDmM5pEf8ZwYteVE6++3hNRv9lNiD3OVWMIGCiDNsOtV+f2ke6d8yL4JZkubSB
 s+Ow2+T5Ohe9sripLlPTF9b9bgg6YV6B51JTs/1zfNqI7lf1DMHPKX5KQle1cTODt2Dk+h0FYLW
 5Ap4scN78RZmSkA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: fvrJPhxYkQYtgFdWpTiukpMfs8aF4Zf9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE2NyBTYWx0ZWRfX39p0zytJeeA3
 kCLhBUG3B3HYRt2kudWZhBcy3NDMAWr+dVzQPRjj/9QMX8j99g6tLigk+PkyPLNxlGa0LEtpXrU
 oC1CxWaB398mb7hY8vSrUMU39TrZjwg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE2NyBTYWx0ZWRfX1V1EQqrphRcm
 +d134ILYKufT7JXPPKdOu/7s3FIPw8Nv7pSFYzR2Ti0LyFq8A9FNhI14NCXn+6GhqrA41J9Og5u
 a9WPjfAkIwC2iKV/DEWTLlomGIZLYfCfSkQyTbL5Vr2KXQCdorozdM7dXpNyE30BVM3l6+L8FKr
 eDdaKWIYVyTQU0qiht+TV58x0iZB2mGZZpVR72OI+0yHscfKcrz13LVUJEj5OS7Exyj+M9IzDOg
 2xqNLHtc8cckXLMXYUS+34GW+YAKrAD1rbdD4rPZzd8CDOBsACQgRcfdY9P6NEtDu4td9kAdveW
 3mZgTkmdKv1hSXl0UxGH22Zrc3O5Yjg5LUsUgQt38/0qa7VKc3qK3tIFPsajkJBlg25PMYZaJGe
 3RVkEIDsBTqvRqBlECAthP8lncQ90ryso0j0CVY92cDhW1t8zsU1OP+sG9jpBcq9RnzsypZxh4D
 CzJlslMfHsgRC1JXvog==
X-Proofpoint-GUID: fvrJPhxYkQYtgFdWpTiukpMfs8aF4Zf9
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a301f42 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kiYxeA6Iecqc4QeK3QQA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150167
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113214-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 27C15687F78

XTS is not defined for an empty plaintext: it requires at least one full
block of data. The driver treated a zero-length request as a successful
no-op, so the crypto self-tests "unexpectedly succeeded" when -EINVAL
was expected.

Return -EINVAL for empty XTS requests while keeping the no-op behavior
for the other ciphers, which the crypto engine simply cannot process due
to its DMA not supporting zero-length transfers.

Cc: stable@vger.kernel.org
Fixes: f08789462255 ("crypto: qce - Return error for zero length messages")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index eff80ad5cb943c5b2e1e293c723bb1b31102b006..68b83e3ae088ae42a7fb2a2f0c2e132acf62e849 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -239,8 +239,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
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


