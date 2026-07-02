Return-Path: <linux-arm-msm+bounces-115824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +ICvMLMBRmoLHwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:14:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD976F3B60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:14:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ni/umDJi";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JCI9ZxfK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115824-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115824-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE785301779F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 06:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FE03750B6;
	Thu,  2 Jul 2026 06:08:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD253D994
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 06:08:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972526; cv=none; b=VnQdjOai39iQMgIOapD6+AlalQ39beE3cyd/tVCGbdekH22r4O2bjcSIjsYbFSEOk7twQdtedO1iHFK38COdL71sStpYh5720PgIUeOAVkalQreeYuEPs9UKdJ+etVilTXjVkqCLQC2ieggqr+QId+wpL7Hu3j0/hGICmaKhVmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972526; c=relaxed/simple;
	bh=xIzMABhrBVOXS12KhXGxjbw3vGblyslZPLNQnrZtcYM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sZyhnyPFrp3tV/DoRmQLJ6CJYIq1oM835/a6o0uBpSPPA96kIFqjs96jEOGZ10m+Sigx1/dsGNfZYUg2iA/PdC0ynTy/ZY4+XM6fBDSAL6EHTuAWguKbgJqHEPefvgbclSA6OD9IwVFF6FAC020EgNXCgSb73HfpqfCLa2qipF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ni/umDJi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JCI9ZxfK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KV4n3050942
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 06:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7LHd9c1QICTgnfClv1h2ci
	DcQzquFOL+HXfQ434Enz0=; b=ni/umDJikvsXP2fL5p5CK9HmBCOcnzezaLQ2Ix
	7RF7AZ1yHiZXMy5MD+00KGaKX5jGodU5EqPGdv0jlGSagO6HQSwhSEozQxb8voUL
	cw1i6A38iHrJjvFN+Z0Pao9eiOjbkupEl48tCUYKimuFJIStf8VWhpxNrhg4iUK+
	608prt42LHzJR/RQQG/vQEIJ6fc1a+WPHoOM7E+K9qU01wKw6VuYeiKEKcq5P+Zx
	ZWKTYpNNA7n53tFtUt4M2xzSUifGN3vwjB+/8nD0nt2PZ5wsM+kn3YwwBS97H0O5
	nqMsGkeRtbh7z9QuvxvU+4W/DTSn8mkHKIQfN9TWkKGx72sQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gptk9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 06:08:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c8e14ebb2aso5611365ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 23:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782972523; x=1783577323; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7LHd9c1QICTgnfClv1h2ciDcQzquFOL+HXfQ434Enz0=;
        b=JCI9ZxfKTVTmeXb2zST0+eqGa5lQ1Wrx//817IW7G7eUiJuroQfBxKFrrWrdW6gH0a
         MW/w6+5B8EnOVq3mxgqkQGk+eUoiTzPzwkcWz3DR6QxIu/Jh9sNLmmku+RZyQSKp8Nbw
         Nd3KZgKR4EBBI2VJPsQk9ksdrbWBE8LtJJZhHPnU4fRqhMtOHEzXxeS/Ok0wxNGVyAgy
         9pytmyNItRSkxjqsCyMOEQU6BxybjuoPEbukTIy68S75n4VeoXGsIqFc4XocEKmRtl2M
         YxCc6D520MRlRyHC85KuG7CRDGaxmj02cBMAQt1ZTEoonovjrcVsJ7sDPQhlxLUU8SPs
         7r4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972523; x=1783577323;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LHd9c1QICTgnfClv1h2ciDcQzquFOL+HXfQ434Enz0=;
        b=RjqOiu/qfMskpj0GyvhS7qjI34San7oLotclmWGWKwXSPqB4R++hjgXgY/fFAZYZ5f
         ljyGfXvYbzblbDIirRFYSBxFVwuQn1I8gWRSZlRTMN6H37sRgzk96Sv+EGCBkTJGBTPW
         i33MIymAsmD301B4Fs5yxR9rlX5JfjH5PYFF2365HGV5BAYsyl/uHfsBZFEZRuxFq3jN
         CtQWjl3ZU54MeCR9xkLiVH4TXX3CJKhivVHS4g/eO1Q0hPbjkFCAsZ00/zs+U94Sue+z
         B/175QoP0S2IalCIHpcpopBEkX2bifcQROH6O0u4h6zXxCpdS8opS1gPGCvYJsDDGgiy
         mRNg==
X-Forwarded-Encrypted: i=1; AHgh+RqKLt+WkbM8rdopF1OXtqSGvhQczko0V6ZXnKKC+5Gq/u0wzD0LQTw1FF1A0XulIywSrehizQafy9A3n/19@vger.kernel.org
X-Gm-Message-State: AOJu0YyapvWrH4rmmGwf+5qCgGJnQKJFbX7v7aK2IYIq9JKkyC/tHd9L
	O8nIdu1kIiaufvvKoPtmLj5jgyhOBzIkhtdN1/ndz5+rv4f8cHeqLDvsiqokwHm/XhFLTB7W6ZS
	nsX1j5k5TZCxVJHDr72G8W4cIfUmNsM067guiCqy0R8zuoeezUwBQl1fZbW+gJARS0uGr
X-Gm-Gg: AfdE7ckNmyWKv7lMMHoIRk39V+cq29jE2oqyDQSoHIECC+SV8LbAMO2YK6S/9xTQ+1Q
	cIJRdYMCm+Zy445W568UnmaBx7/Kwf5ZBAeE8wAYkaax7Ymvfdd79fxXs6K8Y1xPKeewdSeD2tM
	DozWSebLoA1rQEoTL80fRkDUb40hvQTf/4FCMMtvi9KqR2I++9vTXcm5P9NN+VFH74VlBVZ7Bst
	MDserPGJ4erg0wHsGJ2x7357FKV1pNZ4bQmUE8go5rLiESEuSwoMixb+AZ277jquilE6/glMSni
	omWfBkek8FbF1OB7oHaClBs+X1uYmifQ5h7cYwnF2r1MAHFV+nI3oggbXx78qgiGh+NlbjT0G8J
	cwkqmzin/wu5Neot8oFLYdU5utujboqo2E7N2jNHr8ofk
X-Received: by 2002:a17:902:f651:b0:2c9:c913:e214 with SMTP id d9443c01a7336-2ca44a1cdabmr75889495ad.20.1782972522482;
        Wed, 01 Jul 2026 23:08:42 -0700 (PDT)
X-Received: by 2002:a17:902:f651:b0:2c9:c913:e214 with SMTP id d9443c01a7336-2ca44a1cdabmr75889005ad.20.1782972521787;
        Wed, 01 Jul 2026 23:08:41 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa00970sm8176325ad.71.2026.07.01.23.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:08:41 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/4] spi: fix sticky -EINVAL after PM runtime resume
 failure
Date: Thu, 02 Jul 2026 11:38:19 +0530
Message-Id: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFMARmoC/yXNTQrCMBBA4auUWRuIoU3Rq4gMMZnoaBtDfopSe
 nejLr/NeytkSkwZjt0KiRbO/AwN+10H9mbClQS7ZlBSaanVIDy/MBe2jzcK4rCYCY0vlDDOmGo
 oPBOayOgNTzWR0ONhdNIMtncSWjUmaonf8XT+O9fLnWz5bmDbPnyJc2STAAAA
X-Change-ID: 20260625-fix_sticky_-einval_after_pm_runtime_api_failure-6797d0a5c4d0
To: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782972515; l=1503;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=xIzMABhrBVOXS12KhXGxjbw3vGblyslZPLNQnrZtcYM=;
 b=ywxqrVcRff5Xmtckb5XEgw+rGsMHvNYpd6paW5OAHepe0UfyIbHv/NeHi74nUfLY3pdC9uWgU
 9Dw3548w0aSB/xbmjvjovTzWw1Dtz9XBcmHTBFK9X5x278+d8NxNuuO
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfX50LFKCof8qBx
 vvH7LR84hKSjGU/8B0teNKPmjcOoe7nlSazBr4A+82J9b3a+f+q34AQsMFRq06YjoMT8jPywheG
 RXZg8BihUoUBNNxIfm1mKTAEnT94C6g=
X-Proofpoint-GUID: OLMvWMRG5Lj8W5GhquPwildZi5xUpDmh
X-Proofpoint-ORIG-GUID: OLMvWMRG5Lj8W5GhquPwildZi5xUpDmh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfXzq8UiVxDIFaq
 LFXTWbSklGPRAlveYhsgAL//YXGSoCBx38Hkdmm/DyUbHEkMmnUyH1aX9YWMUzyceWgD77Nr72C
 HJFaw39hFL6CO0fhh+J3aBNwHcVDAaxgdGmHF9GMEuDwpiPHmEqv7DeKSySc9m0NN6R5likvE4D
 a5NH6IKj8nHKTah7ZiBQQCq6KO6FwsI+sYw0PXg4lHB/0jju5XgL+RTsQqCsVvxt72j+6DI4Osg
 qwwGgy5jrOtuqh6oXzoQJ8PC5XIMO4djFZxjlBYpx5Pb7mvMf6DmP3BuFtZH2dmJUGIZuWbTyNa
 O/SEe/NwNIygTGoN3MCelANtu43Dg3h5gpefSIy/bV5iRbx2dDy6S6X1YKzHOcCuOrhgpGB513d
 tQdP+s/BOXhKVaJaUUiwOO54E3kJmInG6fKKgis3YiOuENSGidTnXXxELrckyJRf6QlAZAs7e6z
 C+qIN5zMahc1fbgKRxg==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a46006b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=E9aaBbxYo9AZKUvAECAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115824-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AD976F3B60

When pm_runtime_get_sync() fails, the RPM core sets power.runtime_error,
causing every subsequent get call to return -EINVAL without attempting
the resume. This makes the controller permanently unusable until rebound,
requiring a driver rebind to recover.

Fixes the missing pm_runtime_set_suspended() calls in the SPI core and
the qcom-geni driver to clear runtime_error on failure, allowing the next
transfer to retry the resume.

Symptoms observed:
    spi_master spi2: Failed to power device: -110
    spi_master spi2: noqueue transfer failed
    geni_spi 988000.spi: Runtime PM usage count underflow!
    spi_master spi2: Failed to power device: -22
    spi_master spi2: noqueue transfer failed

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Praveen Talari (4):
      PM: runtime: Clear runtime_error on supplier after failed get_sync
      spi: core: fix sticky -EINVAL after pm_runtime_get_sync() failure
      spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()
      spi: qcom-geni: fix sticky -EINVAL after PM runtime resume failure

 drivers/base/power/runtime.c |  1 +
 drivers/spi/spi-geni-qcom.c  | 18 +++++++++++-------
 drivers/spi/spi.c            |  3 +++
 3 files changed, 15 insertions(+), 7 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260625-fix_sticky_-einval_after_pm_runtime_api_failure-6797d0a5c4d0

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


