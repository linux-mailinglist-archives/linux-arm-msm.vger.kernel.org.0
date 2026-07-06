Return-Path: <linux-arm-msm+bounces-116700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UU8JOvtyS2p6RgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:18:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A20C970E878
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:18:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X+SUIniJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BmpFrrk3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116700-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116700-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 073BD3082BE0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D90A424655;
	Mon,  6 Jul 2026 08:53:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB9A4F797D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:53:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328030; cv=none; b=Xr/kw+57jByReRGTwiZSDAHtbu1WkGRwQVJnbnc84igbca68C30bPwLzsHaY7KlLuCiI3q0egBDHUCwM2cgnyN/ohh5YAoelVCeqtZEF0znvSh+Zk5bndKGlyIJmHZsxq0zNskr1WxyyZlciGdcMEUojjjlZpgqjkogYMS0khvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328030; c=relaxed/simple;
	bh=0ufInVUVLfFzq8y2beOLns32ovlcfJNcUR5C24Dtp+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uh1+4p8iaQqWHJJxcPs/MrdEBcqOFDViwHgCxeQywCv4ZoZzJFGmxJiOIa3hsObOspeP+K37dHCmQMiA2CTJPsAuXIluegzzF9T+tTnAWzsdQ/jGqYV96BoNCwDUlS0jN4W+d4vueq1s/r/80r9PoJsgAaYL/rS+zpojNJSGUSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+SUIniJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BmpFrrk3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66683YT04150726
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MLeedBrkkia/qCCz/UPFtN7ntKyyH0lh9E88vuT4PU=; b=X+SUIniJ5e76N3KC
	4okub6IeNfLol0638NNvmRBHBEf/yZRoV7W6kmQ3kBZZJ+ReJNEiBVm9nf1zLwZB
	+PpvOUoOg3c4XOwhemASgDzeP+jIikkx4dpfOoPQadY3I+iEGEMGVJS3ElVaFW7m
	up+mxV8NYu5tHP2NWk9ArysC7f1y7gLH3Q+kHeKOtVaqg3fAufJMJEIL2gz4gP7J
	8PcD/NpEjm2KQWn/VkL7/oCY3QKL87d/QHpd44GgyhbUDIXVlT2lHKOzRoSjTwjT
	0C9BC5WVr4cLrm9dMhDKNe8hd9QRxf9qOMoq9xOpCKMAtzzBalq8UoOMqfDgWFE3
	I3BiFg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h506ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:53:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8894570b58so1932100a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328020; x=1783932820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MLeedBrkkia/qCCz/UPFtN7ntKyyH0lh9E88vuT4PU=;
        b=BmpFrrk3PqbieFLtj/jpHGZD0lo8NyEJXjwlS/FTphQEL3srFDh5B+hq4oRgpLA++2
         /NlwfqBPp4gvSBkxhP8ufrTrfBBAluL6rlRYLqCdk8M5GkrWuiDEWpvUajz+czQeiG0N
         PfXSEq7CFiridFyOeNpL+0wzJFRwU8scqAelA/4m2NbA4tpBog49LNWIyESzVsblJab+
         abyOtsNAK+Hxs0Lv2uYJeohBzRZrlV4nmF6lyb5wTUnYAAA90wXkbm5WmyoQdIfwNF3q
         kqleBdVh7fTVndZif1i1R46WRVEur+s6+iFAPinX52K0RJIqwx5R4D6rJZ13mRLwOpN5
         xlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328020; x=1783932820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MLeedBrkkia/qCCz/UPFtN7ntKyyH0lh9E88vuT4PU=;
        b=EA4q1Ms1HEWL0PyraBcPaEp5+MGuPP6sCPXRIgp5IEiabLy95DbHdC/6L0YzHfvdQS
         bN07qYE9Cda1gyVxrNqfV7vr20TrfhB+x8uhgwl6p5AeYZbjN84yWIH6frCPWC42wrAP
         LScxxcARRqVQeR6NwCZ2dJEIKQQ/D8NiiD1lYN6/+HQwcFLN72BVEkRCQvHuOSTEPQli
         tHiYZW5M8X+uniMacbsLgpVRllNFVgUssigrg7W7O7MqSvxfme3U9XCGVd2whbvhdlvv
         y9RRx9G5c35XWsLiBIaR32S1bTCbf+bxBoIe9tcpy2ZgVM0w702qPBxLmMPbnodEhKOQ
         Ke7g==
X-Forwarded-Encrypted: i=1; AHgh+RqMHjjLKeNVZca72VuAq+eTmrQhne1Xq3Fc9+IFSN0AlBsJ0p/XV1/fzKaG7qNEe1bMG+Vsr0Yu2JVXkOit@vger.kernel.org
X-Gm-Message-State: AOJu0Yww9aip+9/rHbYVjhyzvKZ5/s9f2yfD6F13dz7nqJHdeBS7Z8ci
	mKfqKl4MmIfxFLDkPyBd8ltUFmzERMCeJb+DsJnaU6CF+JOJd4h0v/GQqfWkMhNPHdmzCfOYCBz
	LrU8l5thStOeRkZOVRJqI0sdKxxa4LAlX5LbZ6W60RDHjhCfgiOhSmQjKkI5NpHdJqIHH
X-Gm-Gg: AfdE7ckzhnRYlVOq4ZklfjFalAfBMrKtd5Y0AT33OUgm1BBbYHmXUZ2HslGcTel2peA
	WM81xWhFLWZfASG3FJPjnbL2hlvzlHoaKqIGI/56cBH5ZN6KAseWsjmciWw5LpOdYv0tv5CixaE
	c1CQxnvT8l60H4/a/Vpbza9AEdwV5/U/0gj4HWjcJXeFs6y4s7qhGem5RppJloSC6z4P+5oRJN+
	y6c0Kx9Ka0g7J3l4szkscOSNNKMVGdwcxcxu7pPSG5F14YdnpFWIXw5dHXaI2W98MUxy6eW4EnP
	Mpzc8wSTp49LUnVENvtKzLJSJYmrNhKlX/sxHbWbP3yWGY81flidv2ArN7+0i0g05hkDE8n7Jii
	kX7pb8HUT4/cLkBuTaRmV5ZVTv1Y7CQF8E2EuBE1hvFs0
X-Received: by 2002:a05:6a00:909d:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-847f6d6708emr8249567b3a.9.1783328018688;
        Mon, 06 Jul 2026 01:53:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:909d:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-847f6d6708emr8249531b3a.9.1783328018026;
        Mon, 06 Jul 2026 01:53:38 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9e12csm3411834b3a.21.2026.07.06.01.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:53:37 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:23:10 +0530
Subject: [PATCH v3 2/2] spi: qcom-geni: Fix missing error check on
 pm_runtime_get_sync()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-2-92feb5a7b926@oss.qualcomm.com>
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
In-Reply-To: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783327997; l=2819;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=0ufInVUVLfFzq8y2beOLns32ovlcfJNcUR5C24Dtp+I=;
 b=Lxpi51lVQh8CfIa0DMGsvzgVX/5WK/vUmhHZ4ROGKQqbLRm7Qj+Ah9siSBj3Pxzi85bbp/reV
 PsSrkkU61iYAUyDE5ufd+3sw/mfgU22Cj97wfFqxnnPNeiq1qCBJbVQ
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: NGhga-YWi0kO0flgE3O5GdJiiTgH06y9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX1e0GrBsW7bR2
 ZnLnD5Xtaxtlai9m0CGKTndADgQTT7azMg7QyGq5vypNs7hSpyBgFedNj8EWcxXIUPlEWzo/mhR
 tdVPiyQE8LfB+TS/TQLqkow0oihRSvE=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b6d14 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rPJgdety-6tgKaoqdU0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfXwujKaJDrNQvJ
 5GZ44+n/fTVDafskjEvOvXgvGf58HNuaVU63oZ9JOJlKkoczyraDFTRQszmjLSERPdqVCmP+mIC
 iuyYZih3lx/+yLmfSQykg7TZUu17YwfIAb1bH5Efe9y5lRZtGYUnUK31fFcseoIXdSmikRM3BsI
 IweMlZvTlIJrh4UBr1s0iTMOW4zXNDhlHeqLgj75Qth0ysoK4Oumot1trGBhdj4FkyxgWII7xqd
 cttwn9Y7tp6QTqaedGX1zJvnk8Wm981HXrj+pIYaKsNzW4ULLxlBwe7K9BeRfO2+55OmdEFWc3c
 iYcPfl9nNl8CTf3x4/5DqrGF+eILLf0hSP2Iap7D3a975R/7BFTelIVqk+bI0+7rQGLespADc8/
 sjjUpi1MwIjahclp8zHWg0h2ryCxr2dTj8qDd6sFbfle2GkaDS8L+3R55b8qR1K6uT3B3tZoJhv
 sF7cFTqfyVpjhhrIc9g==
X-Proofpoint-ORIG-GUID: NGhga-YWi0kO0flgE3O5GdJiiTgH06y9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116700-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A20C970E878

spi_geni_init() calls pm_runtime_get_sync() to power up the device
before accessing hardware registers, but never checks the return value.
If the runtime resume fails, the function silently proceeds to read and
write hardware registers on a device that may not be powered up, leading
to register access faults.

Fix this by replacing pm_runtime_get_sync() with the
PM_RUNTIME_ACQUIRE_IF_ENABLED() macro and checking the result via
PM_RUNTIME_ACQUIRE_ERR(), propagating any error back to the caller
immediately before any hardware access occurs.

Since the macro handles its own cleanup on failure, the out_pm label and
the corresponding pm_runtime_put() call are no longer needed. Replace
all goto out_pm paths with direct return ret statements and remove the
label entirely.

Fixes: 561de45f72bd ("spi: spi-geni-qcom: Add SPI driver support for GENI based QUP")
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 26e723cfea61..392accfd8515 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -613,25 +613,30 @@ static int spi_geni_init(struct spi_geni_master *mas)
 	u32 spi_tx_cfg, fifo_disable;
 	int ret = -ENXIO;
 
-	pm_runtime_get_sync(mas->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(mas->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret < 0) {
+		dev_err(mas->dev, "Failed to resume and get %d\n", ret);
+		return ret;
+	}
 
 	proto = geni_se_read_proto(se);
 
 	if (spi->target) {
 		if (proto != GENI_SE_SPI_SLAVE) {
 			dev_err(mas->dev, "Invalid proto %d\n", proto);
-			goto out_pm;
+			return ret;
 		}
 		spi_slv_setup(mas);
 	} else if (proto == GENI_SE_INVALID_PROTO) {
 		ret = geni_load_se_firmware(se, GENI_SE_SPI);
 		if (ret) {
 			dev_err(mas->dev, "spi master firmware load failed ret: %d\n", ret);
-			goto out_pm;
+			return ret;
 		}
 	} else if (proto != GENI_SE_SPI) {
 		dev_err(mas->dev, "Invalid proto %d\n", proto);
-		goto out_pm;
+		return ret;
 	}
 	mas->tx_fifo_depth = geni_se_get_tx_fifo_depth(se);
 
@@ -664,7 +669,7 @@ static int spi_geni_init(struct spi_geni_master *mas)
 			dev_dbg(mas->dev, "Using GPI DMA mode for SPI\n");
 			break;
 		} else if (ret == -EPROBE_DEFER) {
-			goto out_pm;
+			return ret;
 		}
 		/*
 		 * in case of failure to get gpi dma channel, we can still do the
@@ -693,10 +698,7 @@ static int spi_geni_init(struct spi_geni_master *mas)
 		writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
 	}
 
-out_pm:
-	pm_runtime_put(mas->dev);
 	return ret;
-}
 
 static unsigned int geni_byte_per_fifo_word(struct spi_geni_master *mas)
 {

-- 
2.34.1


