Return-Path: <linux-arm-msm+bounces-114565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KG1SF/9QPWrK1AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 18:02:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E99906C7415
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 18:02:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QYWWU3yf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hgw4OCd7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114565-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114565-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F011530DA34E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAC6321F2D;
	Thu, 25 Jun 2026 15:56:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158C030E0F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 15:56:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402980; cv=none; b=rxSb04nVYYuB8b+a2qNc31gBg4T2hDGLdVW8uC/Y659j8+rwtQRMayoig/oSSlmC7GZzCibw7m/pAWN1t9s5WBrztnAZEduKx3+Be/WXuVFXTJfb9K1fbie1pKeeILIMy8R8aDQDPX1FhDL8BxMzToFDwH8iF4VMmuNO8OzSPR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402980; c=relaxed/simple;
	bh=Qg2DWASAieOm11wQczT1rsri3HzntJrGim/Ejsmsblg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Jztvyf/hCoe3KNVp5vxjJNlblwT89fOdHNoMDuKeyB0epCx1rs1ujpCmuYH7Y5/3C+JELd2MMBmwPzzf0RPndcjRZSFGkzRAO6GFoivcwuagnnyI2rsblaPZeJxVaV8ZYMkassfDn8+PoWLwJAFoI2AyXoKptKco9cYEHC5csxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYWWU3yf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hgw4OCd7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFdwKX2259856
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 15:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t9Nok5MFqNfnzbr0sc8Oz3
	wNmGbIKAOcP3OgZ1/l6JM=; b=QYWWU3yf1l/m53cHK2jftFbddNvRW6VsYlbWHW
	QxGfTwhJTKXccHJwd4xnK8+Tw+zqvDDQvBaJSns/aJOIqPi1Ja8brp0ATUwcDL3B
	2E1EUfpRn2DL7uLfa9FYg8WEpwvdHHBbhk8ayuWvjM1jh/2sxUOh5/cUFi48RE7P
	54zZfhBLct1+FFfFIpXZSDA4GVi3TS/zFl0UqBZ0fajZRko/aHvMDQqD72KTPlZ5
	SogXgXK/XlD/1hEDQfO5TPev1gMvs9dwcceG7wk82Y+fIw7fJWP2iMVhVpKwbbjT
	roJL5Wke/Da79mRavEXSTeVvvxKPiQAsliKWq/b9A9DL/9Xw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0nv7m37k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 15:56:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37df91eab27so917884a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782402978; x=1783007778; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t9Nok5MFqNfnzbr0sc8Oz3wNmGbIKAOcP3OgZ1/l6JM=;
        b=hgw4OCd7mEkqCiEtAc3lhlTVmhbHBZk+k6bsUjJgQvTcSCJxf8UhR66i3J9POGgH52
         ncaUI1C2p+1lCJ2RxlkTlYX/+SVnDsA7h6IRrPu9OHv6A8mt/e9rkN6g3oUKx08D7r9R
         8ympDAI+O5dAHT2hw8Z4vGiF7SmXxGsUUaqk0YzUn+n8s6jTnDaoRVE67dv3j3CwXygO
         r/SfpdPQFU6yFDzkqy7wTx7e2A4V1pYmz9JZ8vIVi929FCkxB6lWNDvK+6Qc53bKa2mN
         VMlyjd1J9jzdX3eRmVtOPs9S6h8GXkWHSuf6nQHSOV1ywIAsS+OAZOs0NmAJPQpv2tpj
         RhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782402978; x=1783007778;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9Nok5MFqNfnzbr0sc8Oz3wNmGbIKAOcP3OgZ1/l6JM=;
        b=RqhcF6l1VSYhNf/wVs4PxssKneYxaIjMHfPaSwqjPCyYJfT3m0r6d+pB3+z9zUgK5q
         6Kre91XPUOQ1D411AWVh0GoZHPx9dpI9iwNYyh2G0hmz/RW4emFZD/HNXCRlLGIBoRNR
         TRvpZTiAnjM6gTxsWDzk3qb7ii5LnKrC85Vzsacb+ILR2BcpqrebDa4boHrScP7wBMwV
         Jh3fmhw3Up8ZkhgQ2hbe2gBeKCxwg711OI9fSVn4FEAaK7uCi0trmBioYTqfxDbjKp2i
         OEacd2gAndtb8hjJ18ddRqx4zx8jV6fVqR7twVmt2ATvOJbIhiUpmE2rCAOCrj+gfJzG
         Uwww==
X-Gm-Message-State: AOJu0Yxdkx+0MnOAsJak4ozYrnqbrsui/z2WV+WiS3bc6yi4AxPkoxRv
	UB8+7e1u7JY7mEj8CFtF8o3mboQaiT0GU0r+a/SD1F3wchbfCcWx57aJSXm0lRnq7kGEkZfFhlF
	wHJsibmt+uQslnTLN0HkGKyDd47rEd1n3NjlKJZkD4MODzPF7PsmsLU/28AgF5AOkmu6jnBxpGd
	Ei
X-Gm-Gg: AfdE7cn8p7z3vgNbATMCjXUEJT/OjJzZ/ZLZLs6z+815UmmHzEcr9sg7YS/ydcAoCmq
	JwzbzLPS+g/UVQhK2ohj1q2+1zU1BqrIcsS/gs1b43D5a3uJSn8aENQgOweFH5ozN0KsVP28axM
	pQ/UrYbCl6O1dWm3KC6nwkW48ZnnzdWfo1/mEaM0OlW7C8dsEeKurEBm7dKaVELwhF0NdTOCynk
	xTfo+vcRdqHuxKp0v+GuNA7sHj8wT7TdyKbXNJ1YpZLHAH5eEf55z4kkdx6rj/EyPJna38CdbaK
	a8svW+vL/Ysu1V6bbr7YWWk85Im7k4gJu/RoJ9EVjVu5JEga0oogXCILBc5CZd2fDEEwWFk0Wfy
	0z1LJ5Xlxk0YQ1qkaQLvWQ42Rckp/qQRBC9A7rrTOY7DN
X-Received: by 2002:a17:90a:d005:b0:36a:fcf5:64bd with SMTP id 98e67ed59e1d1-37dfa18f2c5mr3104222a91.2.1782402977573;
        Thu, 25 Jun 2026 08:56:17 -0700 (PDT)
X-Received: by 2002:a17:90a:d005:b0:36a:fcf5:64bd with SMTP id 98e67ed59e1d1-37dfa18f2c5mr3104193a91.2.1782402977006;
        Thu, 25 Jun 2026 08:56:17 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df4127356sm2106212a91.17.2026.06.25.08.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 08:56:16 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 21:26:02 +0530
Subject: [PATCH v2] spi: core: Abort active target transfer on controller
 suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-abort_active_transfer_duirng_s2r-v2-1-1d6f724406b6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJFPPWoC/42OWw6CMBREt0L6bQmUt1/uw5CmlAvUCNV7S6Mh7
 F1AF+DPJCeZzJmFEaABYudgYQjekLHTBuIUMD2oqQdu2o2ZiEQe5VHGVWPRSaWd8SAdqok6QNn
 OBqdekkCuIYWiKqscCsW2mQdCZ16H4lp/mebmBtrtu3tjMOQsvo8PPt57P534Q+djHvMiTSpIs
 jJTbXGxROFzVndtxzHcgtXrun4ANAuRw+kAAAA=
X-Change-ID: 20260605-abort_active_transfer_duirng_s2r-ce4e79896e7a
To: Mark Brown <broonie@kernel.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782402973; l=1533;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=Qg2DWASAieOm11wQczT1rsri3HzntJrGim/Ejsmsblg=;
 b=kFNqq9vy7xxsqJMS8fbUkyiJ09h2xFvRsqZpyCmhhjlLz+pUi1/+sMb3/5Sdj2qRlddfMH2vG
 PSOz6pdTLkcCCsoI2d40oYUpoZUyLyFay/4j62ji2C3H2dvr3vOviEX
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzNiBTYWx0ZWRfX8lZSDdvKaVpg
 BDSNXKmEq558CWWp9Cmpbibd3uOtJ7FHzuGkwdSYp2ixpF8lRMEkTTXEAvqlmqEmoJSbT8Yc8Cl
 tP6/aTIavmuuOovLMmvS9zKdXte3Jpk=
X-Authority-Analysis: v=2.4 cv=RJiD2Yi+ c=1 sm=1 tr=0 ts=6a3d4fa2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=XUkRz5sAuzcGnk6uUTQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: QCuOo_WtGjKziScsDkFWBDQ_OBnD98zi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzNiBTYWx0ZWRfXxTh0LvFj621I
 9RWp0nDYpn64M5g6iKypx6ejIjRRkjO3GsB3yKR0G7U+kfeMFeeh1gLA7wawQGhGuPI42J6TUpw
 Hdhesxe04STXwZ12CfvhY0VGjNkSLx3RhPDczp0LkIDXpAPTACzHhIvXxUqhercVxMpotu1WDOP
 lP3Ax/5ZRlW3HTQ7q4VOdCJsEt90lJwsAfSfoXOtBzFnjoio5eslCBlki8vSjiOpDqA73iFwvN8
 DFiHeBN6KtvGRAL99/HMszaxM44kqcVnPxt5giv/cvcSxPFq/f9H9jREjNxQ3HbnAQ3fGfpsh5r
 rQg50zm97QP4HDuvcxVc56yvZ7gSIk10Gg7NkP01coAep21cz7/uXOuy2Ai74uv6B8oWuSHJqFl
 fJA9gYHeOExw0+NSoTkMX4OXWygrQLrhHdSpxfE1OoGesv5nJSMQcdEEPt1Vc54YYvgWNNYo06H
 czm9ednTr9rwIJxpHqg==
X-Proofpoint-GUID: QCuOo_WtGjKziScsDkFWBDQ_OBnD98zi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114565-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E99906C7415

When an SPI controller operating in target mode has a transfer in
progress at the time of system suspend, the suspend path proceeds
without aborting the ongoing transfer. This can leave the hardware in
an inconsistent state, potentially causing the system to hang or fail
to resume cleanly.

Fix this by invoking the controller's target_abort callback from
spi_controller_suspend() when the controller is in target mode and the
callback is registered. This ensures any active target transfer is
cleanly terminated before the controller is suspended.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v2:
- Added extra check of cur_msg.
- Link to v1: https://patch.msgid.link/20260625-abort_active_transfer_duirng_s2r-v1-1-7439e3585ad7@oss.qualcomm.com
---
 drivers/spi/spi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 76e3563c523f..e9e68e2c97fc 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3667,6 +3667,9 @@ int spi_controller_suspend(struct spi_controller *ctlr)
 {
 	int ret = 0;
 
+	if (ctlr->cur_msg && spi_controller_is_target(ctlr) && ctlr->target_abort)
+		ctlr->target_abort(ctlr);
+
 	/* Basically no-ops for non-queued controllers */
 	if (ctlr->queued) {
 		ret = spi_stop_queue(ctlr);

---
base-commit: b99ae45861eccff1e1d8c7b05a13650be805d437
change-id: 20260605-abort_active_transfer_duirng_s2r-ce4e79896e7a

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


