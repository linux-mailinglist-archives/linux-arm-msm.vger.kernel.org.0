Return-Path: <linux-arm-msm+bounces-117830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 22XwA68hT2r4awIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 06:21:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A6972C893
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 06:21:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m+OcwAf7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iM3PawP8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117830-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117830-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFA22300443F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 04:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B35835DA40;
	Thu,  9 Jul 2026 04:20:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA8D35A393
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 04:20:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783570856; cv=none; b=JihxqYStRzLErpUCdAZHD3eEisgDAaHPgZV8AWB3pp5CEtNbTVRDPcLkWF37sR0lpfMsbx3CJEz3MLyWgeZwB7oC3POmSi/OtUekg/RbiK7a2mXRdDvtdtpS+Ufhdrh8Ny3sXxZk/sVB6jWeuTfu6ize+S7vZd/jy0z167WSLIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783570856; c=relaxed/simple;
	bh=NkUtuuIs12BSSsmdG6xyEVbaMPiM9YCwp7AEArjcEHk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=usvzrFOfO3W1ik5G7ihO3UQ+AlJk6qkHg8aoCL3JvNhFFjJo5QWhLp7oLWSFe0cTi0B+OYXkqRZAHQ6eLjwxx4mJ/5T8F5FkVqMPnU/S0nhBrxXgukO8Cusexm1tF0phs8xb41nn3j39Aby2UyNDhuEXrIbmHjIVc4IRo9y9u3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+OcwAf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iM3PawP8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N8uKC040510
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 04:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=otrAduylictWjLlY2CQabu
	6AyUtCL+D8OY6qMEEb//A=; b=m+OcwAf7PtR01kDMHOiOcIdGJVz1v8onopj7Wp
	3JaPkgrghBmrBJwPqcvRVCuNfWZaOcugXPawOByWk0TwaSdkZuYQ17ViGaY/SbI8
	V2shgNhDU/2VMBfrxeeZjP1xnO8iAUle7Y34jFBxcy9afRq2w88gYrfLk5Zhnl74
	Hd+nW6clEu+pV8kVQNCv2Zuuq0D1AUsSke/tSqg8xZg8ctKoFAy5wpgN6JW5nYsN
	HTtGvi3mzRg+wK4Wz87IC6hrFCqfwd2bfE2DAWxTg/fcVtnZdXlgcdBiymuSOIWq
	GEj8eQTtHPC9R6KlunrABgdvtRd4FQ9JHJl/nkIyrUPXx3zw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsaa8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 04:20:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845df469a26so3816683b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 21:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783570853; x=1784175653; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=otrAduylictWjLlY2CQabu6AyUtCL+D8OY6qMEEb//A=;
        b=iM3PawP881yNMecCo/bjGzkulX/2XpNzLhGPULrhgMuCc0z2lMKfoHko5u0aRzfI2H
         tjAUxU+8BZIU8sgt51tUyRUcNXWsih86Ak7ZGCHfwvU10QKzyN2VV1gA4vjHN2B7gkRG
         uAwfAdJx1SkpHbIjabuD/74qNp8TPXByn9x8KQDSN/KOhXvVMYMOlJgiGR9l90o/inyd
         XazCsi4CFGqkhDhgkfiK244wp0vveMS/tHuA1PBahUQZ54LN2uGVPmWsrq5O1WwI/nPb
         MDgtYql+CWIZb/NfXYivam1OA9Kb5g+K9VvqFD7r652Z0WE1Q11tNAzCjT2ig9kaTdvJ
         lJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783570853; x=1784175653;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=otrAduylictWjLlY2CQabu6AyUtCL+D8OY6qMEEb//A=;
        b=rV+TiKfWTIJ7R1mNsONmoQH2huZS9Utg0WhFzmvutOIYdI3lbyz/dnkgnFHzQBO+oH
         IXQQaXO2HRgKWFpAO1GjcwWG3Dht7wIm6v7Na8Bef8CDBbL5ALB7RQeBl0iVWwdXyzIL
         SYYxK64tTQgOTrv9bsq1oZnEBWJQc6m4CUJnh7z6ToF040tTcN1xw4wVmohUL0EjJtSR
         hw5LUBgQbLHJtRAacpKmXsrqSywBheyPeDWCEDIm/VyfoPOHP0F57cSXf53eI4y/5TgP
         5rg+kKcMt+BxMLaVobdF1klM932uUwrEHFtPoeDE0VcbgT7pO499VjIuybgIqurFAe/I
         GXcQ==
X-Gm-Message-State: AOJu0Yw4SdFSyO4qjYabbxsvhzR/Sx6oktBXH/t/oLKprPfx4drBwBIH
	uUR816DHp0TmUssn+RZ/DnR+DOW83Bu7gMZQ9o1AifXKHfClgptG6PrtT2bijY/wxxd0cLIUY/B
	r7GKVDOO5oyznC1XoWRA56bJ922Upr++ybEEXjsxkJq/0FGcnsurOFc5C07DjbqVJgRmi1oBXoN
	O1
X-Gm-Gg: AfdE7clO4dTLhU+tOIt4rkSK7OX6iZCNrNsNqepmAQjC3IvoQJKBOqrwjl5LTYTPWq2
	a1MjaQoODOPhFH1r/gmDn82b2+8f45fNoJxX7qzIE7kvhfczPwzFdKLFXIcaOGekrj8Q1agAO+J
	XSZF+QKtCywdC4rq2VoGngy03GzXE2sCwbrFGT6Z5vcq/dXKMtJ6N2JKscacHzgk4HnHeKwi3IL
	C2kgNj+g2rZwXxEKZ5PZej4Q/KSwcZSVO6XrjWwSQJzAJXkt2DgI9hSycIy4UQi6Owjtaftx62D
	X504kMyBujDBaHQYc6mLL0vFUGdrMc0LqyghZ0Uf+DY3MDuhtSKKikt2LN6pUGowF4EZEHjVNw4
	6TB+/ElaMMRgvQntpGur0m9P8nWDcbVcS9laotoaP22k9
X-Received: by 2002:a05:6a20:1587:b0:3b4:65d3:17b1 with SMTP id adf61e73a8af0-3c0bd1a82b8mr6263842637.43.1783570852869;
        Wed, 08 Jul 2026 21:20:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:1587:b0:3b4:65d3:17b1 with SMTP id adf61e73a8af0-3c0bd1a82b8mr6263804637.43.1783570852280;
        Wed, 08 Jul 2026 21:20:52 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm25490098eec.2.2026.07.08.21.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:20:51 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/3] i2c: qcom-geni: improve transfer error recovery and
 synchronization
Date: Thu, 09 Jul 2026 09:50:39 +0530
Message-Id: <20260709-fix_cancel_sequence_on_failure_for_i2c-v2-0-1db178c695bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJchT2oC/42OQQ7CIBBFr9KwlgaoFuLKe5iGIB0spgULpdE0v
 bu0xr2bybzkz3+zoAjBQkTnYkEBZhutdxnYoUC6U+4O2LaZESOsJpxU2NiX1Mpp6GWEMUHepHf
 SKNunANL4IC3TWIlanDg1nANBuewZIF/uomvz5ZhuD9DT1r4lOhsnH977JzPdcj+p+Fc6U0xw2
 wojjtRUtWIXH2M5JtVrPwxlHqhZ1/UDAxjXpvUAAAA=
X-Change-ID: 20260703-fix_cancel_sequence_on_failure_for_i2c-a868571f77e0
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783570849; l=2149;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=NkUtuuIs12BSSsmdG6xyEVbaMPiM9YCwp7AEArjcEHk=;
 b=3tbAoQWBAMFwXL9OhPVPfWdm6y8YXx6Gea7z7ElcpsIRrke7zG99hMoaVnYV0qoqLCvcJhmRH
 sldoAzYiD1eBntMyF97uSKUrgtFZ3rPcdKfijfuRuboPydYodqR9FEB
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAzNyBTYWx0ZWRfX5VuN/g7WSS7v
 NXQoE5x+Vac/IRhRyK1E4ySUkCHQJ+aLXX66DfbsETFu4RvswDoV50x70lJGn83me47nNJuOKPw
 mYAYU8J6kaV8V24GTHpOufzwZJFGgKg=
X-Proofpoint-GUID: GtsEw0OQZ2GWl9JPvLiRsUuoqLH1-397
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAzNyBTYWx0ZWRfX0F6/sadUU2fd
 TIfsR4u6hy2JR+9DuEaUDpUqvuJa1Hnyi1CKaCquSp5738HOkfuCbUAaM8x+YBU5vucVo0rV53O
 tO24SW+1TmR3a+C1iSlcejpKJNeIJikVxZVbDvT2nTWf8QutOoRYrjVVVNeD9LNo0B503pZ2W4g
 zZsS8fD2bttqkIa9xnodzlgqvAMF79JzmpaO8KY/BqPAo01wdkGSleKZr8hiZzKFOZI0LeM+0be
 pEhAK+5Tc/oZ6zMGMzsJoAZRT33md80wNtp+uFHjiSscl2hHI2shswNsuocoeT76at6SpE36VV3
 oQrIvCmC7mAcLw/V0rNH4douzuXiitXdocBMb5/4drxnCKljDGLVCh3bLH4DtsReN2ocDMJ8zSb
 OU/MZtba2gS1qoAmpvBR3Ilkc7wdfjoP/q1ikytsMcQhZtunO/k8aVfAaGsmVKgFaRUB1dBq9SA
 ZyfB/JvlpYWsMmNwvjQ==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f21a5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=myXUcApQ-ot6Es7YN2sA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: GtsEw0OQZ2GWl9JPvLiRsUuoqLH1-397
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117830-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:praveen.talari@oss.qualcomm.com,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9A6972C893

The GENI I2C driver has few issues in its transfer recovery
and completion handling paths.

The timeout recovery flow directly aborts outstanding commands, while
GENI hardware requires command cancellation to be attempted before
issuing an abort. In addition, multiple operations share a common
completion object, which can allow unrelated events to wake waiters
prematurely and lead to incorrect synchronization.

The M_GP_IRQ_1 interrupt fires for both address-phase and data-phase
NACKs, but the driver treated them identically, triggering unnecessary
cancellation and reset operations even though the address-phase NACK
has already terminated the transfer without arming the DMA engine.
For an address NACK, the hardware requires no recovery since the DMA
engine was never armed. For a data NACK on a write transfer, the DMA
engine was active and the normal cancel and FSM reset path must run.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v2:
- Fix typo: "signalled" -> "signaled" in patch 1 commit message
- Replace "shared" with "common completion event for transfer, abort
  and DMA reset" in patch 2 commit message
- Fix "has a few issues" -> "has few issues" in cover letter
- Fix "cancel and reset operations" -> "cancellation and reset
  operations" in cover letter
- Add geni_i2c_check_addr_data_nack() to correctly gate DMA FSM
  reset and cancel per NACK type
- Link to v1: https://patch.msgid.link/20260708-fix_cancel_sequence_on_failure_for_i2c-v1-0-dd8f841f36a2@oss.qualcomm.com

---
Praveen Talari (3):
      i2c: qcom-geni: use cancel command before abort on transfer timeout
      i2c: qcom-geni: use dedicated completions for abort and reset events
      i2c: qcom-geni: distinguish address-phase and data-phase NACK

 drivers/i2c/busses/i2c-qcom-geni.c | 113 ++++++++++++++++++++++++-------------
 1 file changed, 75 insertions(+), 38 deletions(-)
---
base-commit: 173f2099661309fd2a52fe94e6bcbbaf0d323dea
change-id: 20260703-fix_cancel_sequence_on_failure_for_i2c-a868571f77e0

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


