Return-Path: <linux-arm-msm+bounces-107961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMHiHaBfB2pa0QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:02:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB24555CAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB5BA32DF1E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDE03DD846;
	Fri, 15 May 2026 17:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="GzQq+JyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.ci.icloud.com (ci-2001d-snip4-11.eps.apple.com [57.103.91.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F66D3DD50B
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778866205; cv=none; b=A8fFayKh6oDK18TdKI8zUqbmp+CN3IV9jZitsy5YJA9QPk6ca7xqhKgDb3yR6kRriIE1FZXWT8+d3V0Wmn/52HXEyFwE0D6x+lw4eV0C2ZQjEDJlwE5YFU7Bx+lIAiJFih//eMxWME9S1v2U1EKyj/1ggCB7Mm1f2jRrz1ftkQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778866205; c=relaxed/simple;
	bh=Foqr1TEYydQPTVHX9hbe27AqiF2A/ZyrSuZ5WBkdl6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzd2k1XGaSC22l7QQlGqxYPBRTugpZYRCxekh+YP0ArMGwzBXxKEFjmkjs3KX/h7Ui5q8TFelMa0/7fvjW+NesTLarHHcnEaSHhTjFXKCzHF1m2y2M8V+XLT779q6oaueQ4k24ZXoDnQpWsw48hgt+h/QlySsIXu2vlQVRCWjxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=GzQq+JyD; arc=none smtp.client-ip=57.103.91.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-5 (Postfix) with ESMTPS id ACF24180009E;
	Fri, 15 May 2026 17:30:01 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFoKWxx5HUcIXx9BFVhWXggXGVFNAFhbCFsEDx9MDFECQgVWXloRHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBB1HCF8fQRVYVl4IFwZbFAREAV0FXQJFCE0CWgVSAEYXSQVYDlwfRRQVUgRbK1cEXBBHHlIKHB1cRhMZThtXTVoNQBlYBm0UVhVSBFk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1778866203; x=1781458203; bh=Ykz/VTtZzmbcUJrh9j9DcbDYlLp1VHdB/J99ELSuML4=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=GzQq+JyDC5Sk2PSOWGyygIWtJy8E758RZyR9/CXb0J3qf88dc4EYoW89L4plZ3NCVf3d41AVusNwHcXalUf6OWsTjLHzeztj1KH2RqrdDGy4yMhG1UNPZRESod0FwSDAgDGHDIVYFPxodB9sCLsX5n+iFQOF1WYycCvKJ0JRRBo2zAGFbu0+1NXWnRD30zt+hNIG3NEZAlYOnSgm+KIXaTAe8Hk4QQ9XDGFoJ8YJRlGSJSHJFAJIATsf0bMJZuZpP4iwLCCleMQkEPcEghxeAA6L40x21CzlLoVq42BLD33lO4/gSRBJqA7YJHg7ML1fGXL5aK55pOnrvQgStyotpg==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-5 (Postfix) with ESMTPSA id D1FF618001ED;
	Fri, 15 May 2026 17:29:59 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konstantin Shabanov <mail@etehtsea.me>
Subject: [PATCH v2 4/4] firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14
Date: Sat, 16 May 2026 00:29:26 +0700
Message-ID: <20260515172926.16597-5-mail@etehtsea.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515172926.16597-1-mail@etehtsea.me>
References: <20260515172926.16597-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=IvMTsb/g c=1 sm=1 tr=0 ts=6a07581a
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qmbtgXoD8pYXKSWWfe0A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
X-Proofpoint-GUID: 2TYYURjjOZkjzl-yYHNgqdUJu24HQUpL
X-Proofpoint-ORIG-GUID: 2TYYURjjOZkjzl-yYHNgqdUJu24HQUpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3OSBTYWx0ZWRfXw82stq/7dSK2
 iRQP2o/5esAV5l+Nuuo/XJGfYwe7os5mm/Dd/GDkKEcVkJ8F98ZUM9hJyn6bOnpuiX8zlDFfhT6
 qEea9MVUDTx6DWVRVDnJQP1LqMBXk/mampp+rGBlDVxoV6YyFUEezuTe1MQ2zIo4IrCfykKPb+N
 DaCD1A3WSpObjR0XPI3Es6R87thljjs8s+RAmSx0lRvPgBdMcZPPJOuikZLLtlV1jHdYI1Hdpur
 +7B9oyZXgKsZ2ZF3QextD+5RHS/MJ+qFUQRlC7Krl0ECPDmlQ2DYnXqRNXzFIboxAMhi9aYaHzM
 oIYw6qa33a+POScGWdMxD2FfLIcqT8kugFHlHttJILB73xAQ6m4byw2UzrNPMY=
X-Rspamd-Queue-Id: ACB24555CAF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107961-lists,linux-arm-msm=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[etehtsea.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[etehtsea.me:email,etehtsea.me:mid,etehtsea.me:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Allow particular machine accessing eg. efivars.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..2d6dc99c9567 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2295,6 +2295,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,latitude-7455" },
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "ecs,liva-qc710" },
+	{ .compatible = "honor,magicbook-art-14-snapdragon" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
-- 
2.53.0


