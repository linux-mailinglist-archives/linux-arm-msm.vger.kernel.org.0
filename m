Return-Path: <linux-arm-msm+bounces-113669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id npLUCQjDMmrW5AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:53:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D2869B27D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:53:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=krwcJxbl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DIuTZg6C;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113669-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113669-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BCE5307A193
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569C94BCAAE;
	Wed, 17 Jun 2026 15:50:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D4C4A3401
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:50:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711429; cv=none; b=SGknn5vphPrTmzkGNxoMV9w9oTDt/kSlvDLWSYN6pVK9SSQlbLPtVaKw+lJNv2sVXR7lH68jJ9k3SZj7KHdBkW4FR9CA48LzJDhR3utIqlVtb8y5mYb0aPjDwORT6U5bbXZP2yd077yBO3rtK2Ye8nwB6B3xv/3kCGb4mjmXNFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711429; c=relaxed/simple;
	bh=/1SiZawXnz/qPfQH5CCAe1vfcwxTpmb+bksRPXQlLzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eqZqoEg2xUH35ceGKemNQQ7dddWxFNq/jvDDK/UxMe8EEng374LSokUuxgivsx9EUDUA3AqGfPyULu2VgcI+L/MVarM55oP/N/B1mrxSQEGOrPMzR/l9O84cGx/bean+exroWPJ0GTvNEuYCaKhC0a75cmFzdR+2xGl2ySxr94E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=krwcJxbl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIuTZg6C; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFQhYc3229756
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vFU8OlVKWXQ6jY8WUCxd5dQmeVWbkz55pVwe1y1Cf6s=; b=krwcJxbl/0QOxTrM
	ST+kwS/U8PTZDJdugG38FVdbegz1M61hs78t18K57yiuFShR/ILalH9w+Cqoxlt3
	TLWLli0LZMrJBnGzLYfw7HUodEpJAxlzNO2P3JDmpTTJUtfu7IkkiRt1H0ZS02Ms
	h9f3+6y3X48Q2MluueuUWDNXTjAIfAHqYPx0AdUcemEQ7yoXg6TwWsBCkjT1a9DB
	jGKGk3giOo6MuqkUOfrfTuPMhwk+9Dy0vpWVjQBlQrhHM8XcS5YZ+Sn8YA8Dm8Xd
	sjzWboBdvlMmlDZl+wotDYfJlhUW27B5vaEf3eT7IK1zJwA6D4UFGfTO2FWr1/A6
	6GYaDA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevm2qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:50:10 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-966db2071b9so997406241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781711410; x=1782316210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFU8OlVKWXQ6jY8WUCxd5dQmeVWbkz55pVwe1y1Cf6s=;
        b=DIuTZg6CT1eIUy9jFora74mkkYknJ7dc2/dJ+pOqEhNVmpmDn0d7pw/UqP04YFueQr
         dCWPrn0rbZNL0VaCPIcJyFDgpAAg5Cq9dvs9jNFxIl6E9PJ7jU8J6c+ftzCJV91ep/Ur
         p7EUpzo1dmZGyLiV2cMjm7nuJk1xzEFjvnXWAeu4EITfLte1yK/eaJxAXkw+jmNa/v1O
         2q+4Zwgh6PuakDN4eXrJ/KNE5Wr7irw5wdEkPcB8Xk+ZcIbBVZH086p/ltL/FBgAdrHl
         671tuQtqXKFpdsxwpN8mFEytv53M0gqEv0OaMQteYVqouBgyBDcOWL0WwzV5nYkyFCde
         nv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781711410; x=1782316210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vFU8OlVKWXQ6jY8WUCxd5dQmeVWbkz55pVwe1y1Cf6s=;
        b=kQQmAg51eVGcm6PErkC5I42RmD+lpNpyvKcP3Pw7YAo6Yfpy/SJQZU9/FTkEnAbmPp
         BjLwhE97Q69HoeHdDysU0pI4jRRF7KhxgIeTylDuzZkBoJVRzSe5Nt3siXsptjHMJd+m
         FIjh7oEQfXA1hFCh3v+kKG/V9EAV88qtdPJoz44PP2Ft6hzfhh7Z1jMn2pOR2tyYAdIG
         EwZ8ehNq5xkLNskIe2q3eL6bXgVrtE5JY67dkUPNRanPxljl1PMmbtrOz487ZBRxR10H
         0ySnPTygYqu0GQCSFVj869hL/CfasOAKs84KLu56tQlaGA80bofuHpNd6Z36hXaGe6Ue
         hXHw==
X-Forwarded-Encrypted: i=1; AFNElJ/9VXV3tL1+xzlcdmOiRXVhjbpdBvUiU/4Z5BpNI3pW6zf/2ha3nqyyPbvCoZnnu4daZAtWOoY05rYEv/Q4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt4j5xoh+o4vWxKzgCHWQX1SZg2k70mqE0whEE7GogyluahT5S
	MB3IuEnvP5iwoirQVVd4/RTiiA26yNK1Fy68Xn1xBrtHyKT9fVqA9zBY6O9ix7A4cKg2+jr5fMW
	4or3KQAifJXIjYlZzhuzdxb9EaBFBrXM4s1kfjLz0yT8IyKeA7a0iTt1vDVrGSgxxXzU4
X-Gm-Gg: AfdE7cnq+MT6CsvM8Jc9T51FbKO+3kKJwxhomNkTXhLg2zrVakGiPWCRVZJT7/FYJhs
	YrYZP930qtq66LwEdeIxUiOhtslIWOvCQkxpZUGI6/gSP24h80wcGnyPExUQubHtykaKlzkaPTV
	lRuSld5C2OXGyyUdDgL+P04yWmiQ/+7Rhdua6zXSfjpbyc2B0Z2KTI9n4tDFXDa7+MJZAAdHTdz
	0JHEeLvmyTEpHw4PsPh6IXMiZ1tHNINJNgndM7MCf62Dh4SGAoxTkmwJ+ZtR7aFt/7DVuWbt3a0
	3LM52lHTKL9UunGpPf9nWWXTKDXtSRZRQu0dp5edhDtrcijPZmQL2q49UmE0uO8hh0MZRpM5UA3
	iKNdtHVo8SIl6OzIni1qqvp0YcuvRvUqh5BanQFgH
X-Received: by 2002:a05:6102:570b:b0:639:4bb7:c916 with SMTP id ada2fe7eead31-7245d425b71mr2699091137.3.1781711409938;
        Wed, 17 Jun 2026 08:50:09 -0700 (PDT)
X-Received: by 2002:a05:6102:570b:b0:639:4bb7:c916 with SMTP id ada2fe7eead31-7245d425b71mr2699049137.3.1781711409473;
        Wed, 17 Jun 2026 08:50:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c856:25e5:e249:5e0f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm168913195e9.11.2026.06.17.08.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:50:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 17:49:37 +0200
Subject: [PATCH v3 8/8] crypto: qce - Use fallback for CCM with a
 fragmented payload
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-qce-fix-self-tests-v3-8-ecc2b4dedcfd@oss.qualcomm.com>
References: <20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com>
In-Reply-To: <20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2849;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/1SiZawXnz/qPfQH5CCAe1vfcwxTpmb+bksRPXQlLzs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqMsIdFgJkC+uxUUrYZVHZb27slLcQXse1Xe5yp
 huJxJP7Ln2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajLCHQAKCRAFnS7L/zaE
 w/XND/9c4Zl8fbjJrD6/faOiYpmShxOHo85y5cpBkhF5l16gv8nr0y66XKzdakMKaGmUiVFHQBk
 cXBkzLRjprNwXHxzHJY1IFYdcIWLhMx+F9zBSDLkw6w2+3EPZqsNj7eXUwOTWdOlJnEsYFbJOeV
 oPq2mqeOUuLX0VBsY6GQKNFXrfvbx3W3f+ConbDpQ7L3HmjXHmdTwIqvvLWwm18xftKi+5DtN0S
 zVDSMK6BWp/3ZiKSytH5wlSPLzCwpf2JGgOzqDrpae72zTFbdrvg4EPxldx+cG3gu4exFVAonTj
 GDq843HrCWNdHe4VHDw2M11D1VxpUVWxP8R3UvP7kQB2aQBzIbYYrbynHTIhBmQAZ4CtsFP7W1j
 z05M/IxEMJxdCqtgmeq+egcmbIbZFZzn8mbLZ5A0Cev2qryygXw00DlrKX+/AkzB0x/xJdI0dzr
 S894x5XwlLkxFagNEXTpX5zLkTtKnX77yGHzQ5U+haPi74H4Tw4yTNopmUFzcOKU6soXnocxozP
 j6KzCE4EP/6K43ZaWMRY68RyMLO3VCr7NUX94rWnXdrxdaA9dPUF9S7+DrZkIqw4VNuEz4/jT5r
 0AQI+Sj8MrcBIMSRGHzJm/Siry4tcxjnVRmEZb3ciKzBVT+B9VHhj7ZI25voKkxloYw5jkiJLwi
 wG9sJ6JbX+aSk8Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE1MCBTYWx0ZWRfX4iRgUcAk8KjQ
 cHR1c4z5KbBbWMfkQ9vs6HOSMXSGnv9f4OsVjGRCNSuEu040Ew2U1sBEG0Q1Zrfh6YByJ2QezY/
 RXpYBPZ5zSvCvJcMmDMRxksD0Y54d6x6aG66EBu6pm2WdwajjwYi4eydPGJ7Tqp2ZBF17S6yzrg
 VtMh53ZGULE2CL2itz0GV8OvJM+D7vuw4ihe5veGvmspHG0L1abP1UZZyGzYVIXxtaj5iGMcRwo
 bYUXf9OuoO8HP+Z5RGt931yrnJXnHfxjLiyj/XdCX3pvCfOMGaCrDOOSRMcw0l68++GsWs9S8Mu
 6qLzBUXmZU0q1dpq60TbdxPklpdkLb+fvqdeN15XPDOIIVXYihZugyeHotA7ybx4kWA0yqMt4nl
 w+8GCPFn4LGk2dt4qJpMhZyrxY1nL20er3qPGKWpiIEvsl7hCkPQ1+CTVLRKv7A0YjYmwCVbNGs
 1JPGZfMVUAx7XdWbJbg==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a32c232 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=phyxH6jkQibGXiXynFEA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 2Ns-bKxDzLZf8cYC-UyhqeEZi-K4EMIn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE1MCBTYWx0ZWRfX0tUPVKy18p9d
 p7tX3GMTtAHyUvzMzxY6qwOlpLqImopxWvi/Q8Gn2wnEhfXwi2lApBFn4H8v6FKPk33Ac0u0BvB
 U6uUdhozDImQFPXl+aVfDnDOYi4ijk0=
X-Proofpoint-ORIG-GUID: 2Ns-bKxDzLZf8cYC-UyhqeEZi-K4EMIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113669-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: B9D2869B27D

The crypto engine reliably processes CCM only when the message payload
is a single contiguous buffer. The associated data is already linearized
into a bounce buffer before being submitted, but when the payload itself
is split across multiple scatterlist entries the engine stalls waiting
for input and the request fails with a hardware operation error. This
was uncovered by the crypto self-tests, which feed the algorithms
randomly fragmented buffers.

Detect a payload that spans more than one scatterlist entry (in either
the source or the destination, skipping past the associated data) and
route the request to the software fallback.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 4fa018204cb628c112f64c45ff6c7407df73b945..9ff8fe2a7efcd2734e4ff029744961a7b1101013 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -498,7 +498,8 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	struct qce_aead_reqctx *rctx = aead_request_ctx_dma(req);
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct qce_alg_template *tmpl = to_aead_tmpl(tfm);
-	unsigned int blocksize = crypto_aead_blocksize(tfm);
+	unsigned int blocksize = crypto_aead_blocksize(tfm), authsize;
+	struct scatterlist __sg[2], *msg_sg;
 
 	rctx->flags  = tmpl->alg_flags;
 	rctx->flags |= encrypt ? QCE_ENCRYPT : QCE_DECRYPT;
@@ -522,6 +523,27 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
 		ctx->need_fallback = true;
 
+	/*
+	 * The CE reliably processes CCM only when the message payload is a
+	 * single contiguous buffer. The associated data is linearized into a
+	 * bounce buffer before being handed to the engine, but a fragmented
+	 * payload makes the engine stall waiting for input, so route those
+	 * requests to the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && rctx->cryptlen) {
+		authsize = ctx->authsize;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->src, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? 0 : authsize)) > 1)
+			ctx->need_fallback = true;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->dst, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? authsize : 0)) > 1)
+			ctx->need_fallback = true;
+	}
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3


