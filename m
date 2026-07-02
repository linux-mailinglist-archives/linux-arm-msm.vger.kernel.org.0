Return-Path: <linux-arm-msm+bounces-115827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4EcQLgwCRmooHwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:15:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A96D6F3B95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:15:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JifBqT1L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TtlrqwHA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115827-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115827-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C244330E8ACE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 06:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AA43750D7;
	Thu,  2 Jul 2026 06:09:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0567236403A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 06:09:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972545; cv=none; b=YxY+m5pKk/N5wwmkuzG+PCwACZVBvZhSdkGaKpljt/yL0pVHugj3Q8+G9bAJm/P/VQ7N8vz3JiZFCZZcWVVm/KxmogdNXZpauaTdqp6GzmBpDJBHo8Ph32wsGlrF75qx2Tg3Aupe+XRWQjQMry8lJwwsqDviEKJ05axwgTcY+EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972545; c=relaxed/simple;
	bh=CxSDGrGNPrn/f5+nMWjh2s3LE8mRw+4kULPIPcanjEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RwcQPM7zfPWfvx+fwfusucZNlCSljAQAJCGv7ySzJ8xd6N9733G51/aJWTdMMyLUM8Twusc2UGqL5xGO8CxehpYlWX2gDuhLzbSm85te7SmSjKGK5l4k10jn8RmCOadNaK4X+sJQyUxzRxKENyEd1VhVQJ7KuN6fdq5NHDRg6LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JifBqT1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtlrqwHA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KHr23067565
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 06:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8y6oQ4O1PrHXWEquRWNJMTThi3u0P0It3nfZ4zz+tEY=; b=JifBqT1LvVgFjwZg
	ezTrDVhyLhJXX0QuF0ziavDPerD7oq1/rxigVFJ3V/IsEc8moq1Xql70d4lHeZOF
	5xlVUPmeITaDF0rBHy0P8qnPbStKJFfllGCs31+YcHATSBAZyb2GIpueIc5FcX/W
	362dAIlDQMajXB5ARtP5IZ49209SfUoeMiQKn8BMWa27+5NaUbil0A8OvL4c/e0F
	sTJcwolybOFXr1aDsvYjmmVZvXIrqfr1lyV4VuoR1J9OOzK3kl+Je4ZihUqo/C20
	dE0iKz5mOPV7qnnYJSViXYzswGNUzS9h+cg97m55Skj7qSl7XujW33y3yeICD3cb
	mf4YHA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510am3rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 06:09:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca53c486f2so20223865ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782972543; x=1783577343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8y6oQ4O1PrHXWEquRWNJMTThi3u0P0It3nfZ4zz+tEY=;
        b=TtlrqwHAnguu52KXbAQwWx1DNwjQivYzCPCu6ze0Krv7YtpGDEJyPeBCIYJUGdoMpk
         YoOLeAL24uA/zf02ul+6LRngnfCg1U87wYmOdt6yxtr8UQXH0SgLjRQuAm/crNTrP48v
         wZLd6TUdUwR5chEDovLF/pJcmVe2JviPOFwVYJQ8Ck3UfVnspLzp2cGXLBfDDGqlYEjy
         pbux4d7ChvG72vg1ooGwdTtSNuOpG6yJ78Zel91dh7Tsf0mE6Avjxbl2grZUyglNnYO4
         PRfGP/2g+f/F5EgEUTDQNFg1RE0qs04GGHMQglpgvyYDP5XG7peieueMfJUn2GiAar+b
         21AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972543; x=1783577343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8y6oQ4O1PrHXWEquRWNJMTThi3u0P0It3nfZ4zz+tEY=;
        b=nw9JfnnHTQDeoD1+nBbZ5XU674DXXtiYeMMZzLJ52RC0/k2EZBRa2dBRyykf/Dtvok
         HBL22E8rtgKob6i1YA7KoWP5o7rsOCv6Y4QaU1NbZBoC9kT2emIpTfGTiCObjzAUo6Tw
         lVtX3Sgym5/WmFyl9iEYN7NRrRFsDMk3K71ivTYpBvFkU0rNYXH7Gk5246XVXPXkbjq8
         wOcLZ+JDSID4zWnmkbx+9lgeW5j8//hRnFop1+AdzF3EaSqPMcsfN9muPbunQ+Ix3mQb
         q/o4gNAhMxWxcwyCcY0f1Z1te+ZIU+KiVZyyL/4ZAbRbvG8FX+JS1fdIlhOu/1o5Sclq
         O0NQ==
X-Forwarded-Encrypted: i=1; AHgh+RoL/aoeetk3nARb7AMuST8ni3c0/fJc8negzGfkaQ1zxbvGNOJbafJOVXnljltAx6kG8ORXwVj14KkDOeGu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8CdpYjcwLGOANxDtG2qJPdanHEhERyvWIw5um/F7JUgAqaZM1
	xgWcdiM+mu2j7v94jIgoActbBVYCdEzXxkST8nhASOBAVk/Yb3YVM6cDj6iRnCBGkdCKO+nZxYR
	4rlPNgoC/q3EJ4bdNxPp2QYt/dYybxQX2I7MBNyBJI1FYTxMI45E+A8uJO5b9kK8LYqtr
X-Gm-Gg: AfdE7ckL8ki9cqo4tl5Q8h/hBEqN+0kEu2OQ/7AfoykPJKQ5bWE1Cdvy6A1mIIwlHsv
	vyLkMntVfqMz5cAvTZwYankSoUA3YGSU56zEeNk6fUcOFvMR8KVylpIClei98A32ZZEPRfi0ZWo
	SF7FJ7nKd+j8y3+z2bNR+cME7nUFH5ou748mr7E83yo51/uTcb5Np/7DOaqo4j7iyyBlmZhJ5Sl
	vyLCr0U3J8tx/HgqO3TrbGFMKsFe2YRnvWoxD29UdH+Sh8cDqINeQycbztT/jygiQw4uJtmtgxF
	soCoVFT7pxs6GZ5/FReFDau/kMS7FQbERPoLSFGEHllo281ed/aH4SmZQ+Dx2t4/AJBAL0YAzVq
	qZ/kP0S0r0tIVcHTDI348uHaSGYcQKAtsoU71gUiTk+iC
X-Received: by 2002:a17:902:ef08:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2ca91206866mr36377095ad.36.1782972542456;
        Wed, 01 Jul 2026 23:09:02 -0700 (PDT)
X-Received: by 2002:a17:902:ef08:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2ca91206866mr36376615ad.36.1782972541758;
        Wed, 01 Jul 2026 23:09:01 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa00970sm8176325ad.71.2026.07.01.23.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:09:01 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 11:38:22 +0530
Subject: [PATCH 3/4] spi: qcom-geni: Fix missing error check on
 pm_runtime_get_sync()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-3-6ddc317011c0@oss.qualcomm.com>
References: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
In-Reply-To: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782972515; l=2738;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=CxSDGrGNPrn/f5+nMWjh2s3LE8mRw+4kULPIPcanjEs=;
 b=6Jd/edVSwto4JfXJn9C1CNeP3ZrYJorVj/+lQfjhM3eBpq7nj9Sz64curfgbvFcomrkaqnKAs
 rSW0rF3e78zASWzrMeaF7WeA/dMG7nPpk91R20jLXdbcMAIESp4T/c4
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: NHP1I-T_kEQF3b8Xh10myU6uptM7jYVs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfXwHGvHl9n3sUf
 V47wexIrRnuBKie8ttg3zXvHSMZnmqZD0RAHIcLDzbJQ1jcy12nlRJKlxMgqh4eerfwY+UHXUoW
 1f2ikm8Sy3DAF6KP48a0mqX+v7cRJnOU2w38XU4U5378RAVoMw6UD9T6TAppSQ+2XOURgptPQqU
 r+GXUz9JkFdb3j8FdsYUZM6/yC6muA5QqTtZLLOOKlm84t1eUAOrirBrG0UQwaGtbT/4rNXjZDJ
 0Bc054jHbsvhgj2tZA9bv+D0C516IPgxkDt7mZfGtoYdI/s8Xnz4fuQxW2+ahUIvrJsTFNWneWQ
 ToKiR0vblYncKx6YK2no6eEe7k3VgYXRxqhNW2yfAIaUVUsvEJ6k6oyY2wGZN5TiY/hVngHmpFP
 CYaif5tSM1wAUCc9JnDJz2qB+Y2G+LJv7mDk/vlmMPbDw9g+Q0xkrogyN55J15/kt4PgzfqGXg+
 6ML5u9t3yp0d1SlNwyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfXzvJ1e91w836e
 PJyFksS5uKePa+eMszVMB+spODt2TlGauBTRzeWD5LEV1KbFMlpPJN0cp0ZnbAOX/fltp1dGB3y
 ZEXRPTkIkahomLZnG744yESvq/ejOzg=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a46007f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rPJgdety-6tgKaoqdU0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: NHP1I-T_kEQF3b8Xh10myU6uptM7jYVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
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
	TAGGED_FROM(0.00)[bounces-115827-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 5A96D6F3B95

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


