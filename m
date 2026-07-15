Return-Path: <linux-arm-msm+bounces-119228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id shhXKnp2V2pyOgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:00:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 528AB75DDD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:00:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="a/vKs3Kl";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="doTWL/o4";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119228-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119228-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78FBE3105834
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD9D449EA9;
	Wed, 15 Jul 2026 11:55:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2AC44C645
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:55:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116539; cv=none; b=Z8HW9s88hoG/5uQBfNNt3l842cXMrqhnZ1ZK/BEBDqTmj2HwyxX2iNkYFJeghWMLjn1FeWEFoG7MbLqtlOgfYHvnK3mmHtI2lKvNK3sNCWDR1l6YBemhGi/zMCAI80ZsjuJ9AfkKu+JekOW07+u9agZzZtxZOlvaDHYVn2PFOpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116539; c=relaxed/simple;
	bh=hQW+zdN9L13i1jyldCVRrfULGZ9qpe14prmnJtneBSI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ohOFMXWrzDsj+7BE0JsNBkVsG0LGEKIQc8duzcVdTxgTfi05G70Op7VzTDr4UDc+2Dq6dqeZAmL8WIxEd0ZonolL2N+RfwM5+YhiYSt1XfAZlUqnbNUTZvdqtAiWgTSj3bU3pgzWSJ333mmv/sp4ZhmL++D4v+u2iJ1qcQ4umoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/vKs3Kl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=doTWL/o4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcbrx3766620
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XEunTC2/bQHTMImEtBUTho
	Ace5fUIhWoLhhWeTNqzww=; b=a/vKs3Kl6BKYvKjK267rbMPqVmsLFZyZAy2C7o
	x+bH71ovXjO5AUQjyZkU+4IqaoB+t57QCbf6exuwMdoCbp32vXzF3nZEq/HpBBEU
	kfHx+uG/IucHVkTgnGwcyjJyravZ8jhArgWQHtNBJhgdgrBELuGuFmB/vzArPEZg
	iJ5K6v2+KH8u54UyZFKKLgoQ85A8BNzpj78pLtZeMKr1GjYgRmA1wWGyDbmpCXx/
	B7uBPuzSuLbitrvOwU1EObMFfl/cOOaSQEBsqnyRWl2VvuhxqOP1AzB1AEn4a0Tm
	mogP5ePEv5pAwFcxiYltcPMPWtQSOXECaskCaV6YGgQVy4Lw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe8558fpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:55:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so7170633a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784116536; x=1784721336; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XEunTC2/bQHTMImEtBUThoAce5fUIhWoLhhWeTNqzww=;
        b=doTWL/o4dcw8ssTv1pj0EgN9WB+rQy40HeVLqJMbqkJnTnF2qRFGGWc5uNY6Fztvcf
         bN0cn0OlJ2QugB3EuGso/YpPfN5+HMzQ8ZwqYoPitzpl2qzoigNJJ1rtvpcC7hdqELue
         HqGm6oVtuE5+I0XbUIqTuL1P6BgboT+tRlIt7wF2uuyd7sB5vIBxMGNdozGbSq3XUROT
         taXKxWRFnDIOqYN7HAsu3LwJ7w0I36XNrmaNO7yjwo4WoTqWJ8TXk6NYAtxIzi0vcBVb
         uDDaDIw92pcV7gYla8utNm9mkSCJVWtQXZ2CPe+iJV952PqiKJFjYG1Pz5g3ULz5um1X
         u42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116536; x=1784721336;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XEunTC2/bQHTMImEtBUThoAce5fUIhWoLhhWeTNqzww=;
        b=Zplcl7nTX5HghAHeg6a3Filx50o8c7YDYz+UBOI69p/cOn3rjnvy4Ot3si55NWzO+5
         dn0+jc1kCe5gPZGBpDQVhL64AxpCmEoaFJuY8GCtlT/uKLoHWWm7oeWypdS4KRK/P+gf
         dF+nb5Zaylro8KCZVnx+INA0PzJktRbIi3nE8It1YTPPW7hf9RvRA3oZoRFp24juN4Mv
         xfUxLJ+14j7Zl/GaBHjSYHS7dzJPaxX2GnEk4Wb/XpDUKHIHFvBI8Ca3ogoOxbriY/TZ
         VQJFKOKkkjJysq5Zw8o5CSko//zjvOdWpLkmlFe29pYkMS9AbZsMRsFW4poVPdwcfy7F
         2jCQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro88M3z6fjf6+yUFXI4YqIAdNgXvTB7YYv4vJU1T3+LecMGqxVmBs296HrTgS4saSEKu9QzcbOVwxlzGi0y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxox18VsfLOTtQFapZh9fwgzs3Q3IY5i88yENT8BnsBVCWmA1Jf
	TibmNhS8umlsDHFqSHOFKCsjqKNuXeXe+Fq5tryfH7gEmA9gEC9ZTXkyUc6ruBaTsuLUYPUkR9r
	JPYBtXSV1M/PvXJU5bxUaJ2kd/U+pxI0kK4g1tfsLZz/8uiNYCrWXUa8+fSk42EjjyMZY
X-Gm-Gg: AfdE7cnM3neKPsNLT6iet/GoFA8MrgTMYwao9viGJPCSEl+RB+HBDxONRWXv4QGP3nT
	5X5akWER3S4aoFNhC1kzIoo/axvdRjsEGGnhZxgVlFIyzfyNshUZY+wm1DswtJcaN2JR3ZfnRzA
	CbKBuaA2zI9UuzpPd44w3uP/+UaYs5+G1mviF/EKTvysmahziw3UBf+ukELo9DGHXgJc1+FwMem
	7HTU4Qszx7cQfLOxJ51YcdqOVpFpfF+bjh4CBBsW97hQyw0HtypHrjoQoF7Vej03j1iW5b3ozEU
	6eb/NlZ/yB0KlYcp3yPtkpT0RWHz+LViSPOcwXiU5BXemrTgM/qAh0H4dIYm8Ue6AVjLrtRqb8C
	DUyHAUlmkwniWiMpoptgwqA3Bq0vtH0dDHnmogg4=
X-Received: by 2002:a17:90b:1c88:b0:38e:dc4:3f64 with SMTP id 98e67ed59e1d1-38e2a088fe2mr2315307a91.38.1784116536462;
        Wed, 15 Jul 2026 04:55:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1c88:b0:38e:dc4:3f64 with SMTP id 98e67ed59e1d1-38e2a088fe2mr2315286a91.38.1784116535999;
        Wed, 15 Jul 2026 04:55:35 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5326c0sm870683eec.11.2026.07.15.04.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:55:35 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v2 0/2] ASoC: codecs: lpass-{wsa,va}-macro: check
 clk_set_rate() return value
Date: Wed, 15 Jul 2026 17:25:12 +0530
Message-Id: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-0-16ca64c2b929@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACB1V2oC/42OQQ6CMBREr0K69pMWoURX3sOwKOVXqkC1v1QM4
 e4CXsDNJC+ZvJmZEXqLxM7JzDxGS9YNK2SHhOlWDTcE26zMMp5JXooCJgfUgHYNaniTgqhAdw8
 gDOBVQBBGSiVzIYv6xFbL06Ox075wrX5MY31HHTbt1mgtBec/+4Uott7/a1EAB8N1KY7G8DrHi
 yNKX6PqtOv7dA1WLcvyBUyx1L/nAAAA
X-Change-ID: 20260715-xo-sd-codec-wsa-va-clk-set-rate-1f66a64165b9
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: Ijk1nt5Rrq1kps-BnkDEucWmkt5-2_13
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a577539 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=2hB6ode7iKseogbFr_UA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDExOCBTYWx0ZWRfX4wtzp2+6NxDq
 c63TC+g+h0wKDE20ZTN0MnyJwa1wtfAupaUj5fXlNJs2j2zbepzM+oscR1rnBSXBChZClAXuOMm
 YTmLAX0FPC3nHOlxr37IsRE93Djv6K20jlVKxbbKDge/uDr7Y4qFGxZ8GIKV5NpPi6jHAIJSuzQ
 lDxHO5l/As0QgQHzztGXR4QC37EaS8zeMtS/atJORmV9Lt0hEwYcvUv/IFW254NL6xmuCr0Vb+9
 wij9ShSTpEHWeuowadBK8mGV87ujjPcSL3s+Use5DFTwGNjM0ED9YRzrjp1W6s6K8dTpUbHt5yE
 lru7pInfCzUbwX3fFF5jKMk968WDaVck8dVVmB9kz5tFQ/bdvzxzytPAtTy4mdLYNfz7IRQ7TDn
 YQ+lLkgpBLeuie9+ivU+pXA4p4JQZbubTfmivJDUBx2FNRNlSl6AeQHOGkpW3coTxkntM1IfHvH
 y8p9NcEHj78qID1q58A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDExOCBTYWx0ZWRfXyFA6IBkMbNhV
 cTyrGmYUaFqITEwivW70RSten7ugkFa1Jm+i9pb20O6Pict+oMglnNAmYOWim3eqtfQjyC2c+6W
 WVN7PzlSJSJ5MQSbvm0jF+gXWmQhyoM=
X-Proofpoint-ORIG-GUID: Ijk1nt5Rrq1kps-BnkDEucWmkt5-2_13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119228-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[ajay.nandam@oss.qualcomm.com:query timed out,ajay.nandam.oss.qualcomm.com:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 528AB75DDD6

clk_set_rate() returns 0 on success or a negative errno on failure but
the WSA and VA macro probe functions are ignoring it. This series adds
return value checking and bails out of probe on failure.

This mirrors the same fix already posted for the TX and RX macros [1].

[1] https://lore.kernel.org/all/20260707-xo-sd-codec-tx-rx-v2-3-f61b4622f97f@oss.qualcomm.com/

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
Changes in v2:
- Use present tense in commit messages
- Carry Reviewed-by tag from Konrad
- Link to v1: https://patch.msgid.link/20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com

---
Ajay Kumar Nandam (2):
      ASoC: codecs: lpass-wsa-macro: check clk_set_rate() return value
      ASoC: codecs: lpass-va-macro: check clk_set_rate() return value

 sound/soc/codecs/lpass-va-macro.c  | 8 ++++++--
 sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260715-xo-sd-codec-wsa-va-clk-set-rate-1f66a64165b9

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>


