Return-Path: <linux-arm-msm+bounces-116345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RcaUHOLPR2qVfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:06:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 22656703B42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:06:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LcotVmxO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dj0rLIVd;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116345-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116345-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 941D2301D62C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF6A414DE6;
	Fri,  3 Jul 2026 15:06:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9583A3D3D0E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:05:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091160; cv=none; b=CG4pYIgvzSnqap+CxVT2/7V8rKws4qT3Tzkv72Au9UlhPhiFNr3Pc7elrCDt1EH2JyMSr1dDnUGHznUfn0kao/oJ1HpmC+3z3TKmxVpf85OUdBMQN11l5f1zDAZBrCaZXkzHtLOJUdR+umAMUeMrTEpAry0GGvPXnR/XYQuYQxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091160; c=relaxed/simple;
	bh=CxSDGrGNPrn/f5+nMWjh2s3LE8mRw+4kULPIPcanjEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rzB3fL/sS8vDlAaMZBvTRfwtgp5SuqBQV3O8/F6QEKBecjE7CqxaVIlrAY4irplDqE4oxPAWgEPFOil2XhBMbMBURmpktSOwZsFs227LNYLyscAan4PghdxQEbNt+osGKFavJKqx0yjzqkgq5x7GpkJuDluk2aPMCb5daiIrxLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcotVmxO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dj0rLIVd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663CTV453144575
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 15:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8y6oQ4O1PrHXWEquRWNJMTThi3u0P0It3nfZ4zz+tEY=; b=LcotVmxOSL6VxQ+G
	rKDzMiieqY5JNcqRoSE3x5EBrye2NY2w9MzLvEkucKlTfV3cvyz6xxZtq0hvQuW4
	1k8VWnIX5/rD24kXq7pD1dwbFGXwhoxCN4HYZulqZ8+y6XbvIeFuEUtt84e3lueK
	vYtv86zAwEiPQEUC7Tg8TUA4Ww0XDD7nS6IYi/VqL/xdqeIvrDLaY6ODmgQ3iUM9
	jsGmNiYfTXB/jnIfnxTueN5mDhcSLiUpMr3K4iYUxsKNiQnlyWvf/Mk8nc18keOK
	OQTNzed/dh4ls5wYiw4554EyGHmfkXo3OKD06cjvZlINJ59+OFL7HzWVHkmM+Lox
	znFXRA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bst5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 15:05:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c804e38c65so12606725ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091151; x=1783695951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8y6oQ4O1PrHXWEquRWNJMTThi3u0P0It3nfZ4zz+tEY=;
        b=dj0rLIVdkpcZXy5ARZ/DisEBgtjRGUcUGic0NTTdByMSVi15yM7eBMc4vET6q9oCIc
         GlUdX63vOzVe7Rynryp3bqYx9Dw0y0mgxz1ODxEs4JfMEruHO67QVvY3WZn+djubsE2z
         UWQwRaIP5DPEGsXslTyGoalEceCnKLQ/fEqmKDNBQMmU1BPB9S5qjPGIDyutH+TibUSq
         GwceFBy9BIHLbd0du1I6GXCZ5MREcCrsei5kxDtzRnGMo6qJnn0a2WftTf+VeVuOU1rh
         A1TBizRFOdH4NFzkh3PgVQui1nS//ubWylk/aTwhNh/QgFlHL+ej5Fa1R6zHKYqpEoNn
         4VRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091151; x=1783695951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8y6oQ4O1PrHXWEquRWNJMTThi3u0P0It3nfZ4zz+tEY=;
        b=KOs0Ih//loYRHWp2TeiSrcvwvK7LFQZu9EeW6eXFdeJyCmtsw0F+C6BxLoDE1VH3YM
         /Ty95dDY2qHt6lSvxzsfSfXwmVjoJZO4UZvhhv34EV4I3r++SUCWBpl0gIEvhLLNekRa
         fWMjdN4H+3NW+2YphwN74iX0zes6JIzwszwPS8jURoxuVFAI5mv0IH7HPdtJU8CFSPP6
         wYtL+haogzHUV71Bkp66qL12Ev0prRX+XfxqTpBG+UVyEjNeGyurRQtddQzSDmTunaSq
         FXM/SiBOo2unFqOGPK2ucbjwHjKYjIXGe0ZaY6zbZyvDi1RJMRifeaQW8xs75irq4dxe
         luHw==
X-Forwarded-Encrypted: i=1; AFNElJ8g4CzCNUhehw2GBIkXR9fPbUDFANfEJH8E+HgodKdFvGCqbD8UAUdbLAK0DrITrlmpiBYlDHYB7zBcOR6l@vger.kernel.org
X-Gm-Message-State: AOJu0YyD0B1gpIsI+LdIXRMdPORIZ5NjKBw012tRCBVaUsstT9F03LiY
	kX76xUTtQ2pEVPEF/2HOywssJyBTEmZ9syb1GUXkFsXCNA1/IIpk9mJ34qUbxI+nbxNNYx+Q/ug
	Tn6JQhTtZ1xEHRBXxhrw04mIKadLKNhhqZYEiUpuFF914hFfJsCA0iEwEZ+Q7A1nBq1/+
X-Gm-Gg: AfdE7clYXRlYQFsQoKu/oCC+TL3HXYYraubHesUT8W95RFrQdI5ZdazImM9ga0rM54L
	EiJw9B7AGljnqk95xG9UXY4tex3ZK4+yxQLEIcI6oeMjQcSfE1IKMvzmmvqksBRnIxV5ZFsaGS1
	HAJ8LNgtFQ/pKU1/3QX3nOXqwrmtShcLFOSL8ImW+UnWPR2LftFklkS+GEwqLKqimK6uO4w7EDs
	TFtbBhXNwjE7tDhmeRpG6+egDKs5U/dERFHCDctGvDsEqAuGuEcGSFhlumb98muAU2447j88twH
	2GMB6zl51kiKfMsVbZOW5iQgfYzYeNqupRf28D9MHzJr2v18NW9H/E3XhH8rYq2+g9xscMbiNB+
	0RT3bHubxOLiniilgC3wyuN6t/9c2atVJzZ+pkwJ1Gr0S
X-Received: by 2002:a17:903:40ca:b0:2cb:2b50:d9e5 with SMTP id d9443c01a7336-2cb2b50db6cmr504965ad.45.1783091150787;
        Fri, 03 Jul 2026 08:05:50 -0700 (PDT)
X-Received: by 2002:a17:903:40ca:b0:2cb:2b50:d9e5 with SMTP id d9443c01a7336-2cb2b50db6cmr504575ad.45.1783091150235;
        Fri, 03 Jul 2026 08:05:50 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm32904517c88.10.2026.07.03.08.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:05:49 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 20:35:21 +0530
Subject: [PATCH v2 2/2] spi: qcom-geni: Fix missing error check on
 pm_runtime_get_sync()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-2-578b78a0cf46@oss.qualcomm.com>
References: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com>
In-Reply-To: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783091129; l=2738;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=CxSDGrGNPrn/f5+nMWjh2s3LE8mRw+4kULPIPcanjEs=;
 b=GXpErkxbu5zSV355CLd1HAsbeyFy81q5EchJ5XeCQugAQQ1WDNyNc4XFo1V7ggaPPcEsDlrOO
 Xrq5d/i4PbvC4R9ZwZk0tKpNptXMscb812LA1orTH1BhrYUssUTNfGT
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfX5vWLWN6b/D+Z
 /3sBokEsPzA6i7x3E3/6FXxURQ1cQxcdOLaw7RkeyBmt/qwoDDplmYdVZ93NEsqrbrgwbNe14/3
 m3nmYJsBXfMemhMmvN0+S0fd01UnqhkdKFILfDM4k5wKfiRkrhv1whQFGRw6zJqlyf36q0pyhEg
 HXiL9M+s+txLlVy8iJCFZ1eDGyXayJ1lYLcIcnCxN+6PSKKM59M15IkGOCFWTY4um9eXgKwTkWA
 C8Wl+AqMX6vMjfa3J89588MGB5qDPa6afJzWiZp106MYGErCYFti+4DHCRMCgELfhfWiXwSbj+J
 fBjtjGAU6EpHuzT4aN+SDpRa2yItj5gBJG44MHpLCZw8sEIcjZ0BcqQefxZNuy+PHyWGJHmC1TQ
 Z4VreryVfF/1Lo5CuDm4w6DprwbZuiEEVQVI8XoOl6gvLmx6rQjfoHFBHVTbUUAKRRCnCnGynpL
 NXwzqb7yeqdWgbkDsBQ==
X-Proofpoint-ORIG-GUID: GH0knJJXiu43Fh385V_eN9fyKbsvlXIH
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47cfcf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rPJgdety-6tgKaoqdU0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfXyGCdsVnl1ztU
 A0MQwAixfMxLV9y8zRLQyK/V5Nrj1lfvMMMgIQ6Hb3stIUDXRUmRV+aaYU1ee/HmekKl9s30p8k
 rqt0ARoBELmL9af6OKvu6+N+0N5tIvk=
X-Proofpoint-GUID: GH0knJJXiu43Fh385V_eN9fyKbsvlXIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030149
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116345-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22656703B42

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
 drivers/spi/spi-geni-qcom.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 26e723cfea61..a55a3afc0ebd 100644
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
@@ -693,8 +698,6 @@ static int spi_geni_init(struct spi_geni_master *mas)
 		writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
 	}
 
-out_pm:
-	pm_runtime_put(mas->dev);
 	return ret;
 }
 

-- 
2.34.1


