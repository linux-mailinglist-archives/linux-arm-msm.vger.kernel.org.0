Return-Path: <linux-arm-msm+bounces-114434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nHZSD1+MPGo2pQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 04:03:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9001C6C24D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 04:03:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=knKgH9hh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=emd3daBL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114434-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114434-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9709730D2B94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 02:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8913A873D;
	Thu, 25 Jun 2026 02:00:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78D03A83A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:00:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782352851; cv=none; b=ErRgjk9YQidtpaMdYxhGExpdx2CfHA5ldUUaTv3xK+UqSwUtPp9xLdJb+QrMSXYPU/KMJ9ZKrSghbsHsFZjSp2fcYCdPZiqWIXeoTzsoUWYW92luz/3n8O6B3ox5akdAMokDEWncBP/+mdGTxiPeVEgd5JIYo/ko7/9hy2pEtfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782352851; c=relaxed/simple;
	bh=1XRKW0vDR45JGT3UWYWuagvWFRDF/O/QLqhohEncfdo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h1tmgSp+jD3Oe9W76XTYVdWm0eVuXwXu55JkWe+Oq1bOXvgXsWl/b9yBYMgVh6J9qesObAB2pW+sYbJuYnCPrNUqktb4bCUA/8QG0UadAIOzFt+98IWI+Ozgm6RiO4OsmR6yRykMkCq1mmB1W4OlOgcb3iv0U867ALDuH3XP2gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knKgH9hh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=emd3daBL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OLqXhi392174
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iF6ibc0xqZo4e3ksGi+x6u
	qeIxacuV5DBZJu2XgrUGw=; b=knKgH9hhSkC/XfvHWKtUpM0bQmuim1l5JYQyWL
	ewXX0wPZwoZz9LJUcAE0OzKaRch2tC8rP6hUII7CsHmv/tIeY5RY31qFLFzQxm0Z
	xpjOtI/fnQHgoCKj/awLAJ6WHUcgvwAZOPc/2m4g3b8wARYl0Ow9myEIoJRcLmf7
	+EnO6HWkfid8301E2WudrSoIV/zvZSe4f+Ny/tuLTNeTaSNLWhkrC+YYStE6TdjS
	udldk8YPquDJkstbYTA0r2hfZSV/+uVl+xmayU8tKrGOASm8Ba0TxlQoit+BY1IB
	w6RYnX6V8s7hlhVk97ufHBP0M+24gHLfjVHLSC8AZNxh1CQg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g3b3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:00:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c62861b3bso852280eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782352848; x=1782957648; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iF6ibc0xqZo4e3ksGi+x6uqeIxacuV5DBZJu2XgrUGw=;
        b=emd3daBLZcQ/N/xmK3g5GJTucliCKxUw6ufHwP0RFpDPZw7IPggEHdIQhG7Mixdq5Z
         zZqkEdNz1cDsOEXVweDarxdvS66h54+2HdGsstmAlQ+Ro2pgvXCuNHye1bB8fBaxqTDp
         J4ZnzYTz9CMCbOOfQjCpl16SQXalVYU6pNuvqdtvXTMNyyKhZVaOqA3y8ANiaZmt/bb0
         ry/m4Li38JZ2BDt4saabBNIyUKLRpEhfU97EYfY4CFN/AzwVkMTsoxLb5esWSHzEKlES
         0l6LEOPJRH7rVOCjEPJZKqx5oRQJUxBojpDgRpk5xq/cXwAfaqhQggw+cEw4374z3diG
         1z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782352848; x=1782957648;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iF6ibc0xqZo4e3ksGi+x6uqeIxacuV5DBZJu2XgrUGw=;
        b=ck8ldjEQtbeOvCgFbW8JtiUyDvOBf47FezKrl+Q9iH9qDCykR45S212LjngCNmC+Bt
         LpypBOtz9iP7XJPgepM+jRwnG+RaxQ6HdJBElnuikqjm1qU0ik4vhO3gQbt0k2usU3X+
         w7EN8h9ev0igLuV5EnKDtqVQnQPYbqhscxrBapHBMjpg5j1UA/KquArk2USqw+w9yUyk
         gcGHFXz2pjw0DiIQU9K1HqYThNLXPBd+Zim05IPzBxZxOqlxl+2XTEemsbi2Qrb6Egvb
         n5ScFkGg/hV2NMetMqaoVB0MoMmMKpLuySZ1gGpmjFIMNWIIz1rSx3OvEEz2sFiNaOrX
         zEpw==
X-Gm-Message-State: AOJu0Yx5LVZSkoNfslGCAT67tjcZtRB//yyFSLClA3IEPPRpHuu5GGHF
	z0GC1SFRlBR8eCPgDBlDGgmsz4Abg1mSasgfwWBG5+DMr5SAAAQJnbNxcSVdPDgGtn7L/c6jdUl
	W5BLWWRXYcRjz1yOIEYNMaZXpdyhle69806vHe02JZvqH49H4R+1oo+LFYZmHWKFD0cLr
X-Gm-Gg: AfdE7ck1299FsWcpJmOc9/HmEa6sKvDnNelbY5dwyrMgRv7N787ibaVpJZJClhV7JE9
	9nGMYv/kB1tmrAgJQucC+pdptb2Nj6yNzg4OwofXupa6uvUiYaMBQAVZfBYOBZ7URE8i3Wf1kDc
	x0BjsXDQY8N2jd7/EN/ssJ9Kpn6FhSpFRwJKUHz0X05eXrT0GVfLoSGhSMRLPMMHvmDKQVqmQbx
	qCqz5BJVzt8A5TDu+Qd1FGr54xlR4N5qAVxiAdYlnq0hcFktRQ2rAZfINJpcuf5rAuKmT9Zq7o2
	rLVgVI735Zc59kBPqqi5yXBhtDVMv2G77pq1IjXrhjMPH2CFzzaraC40g49E5pCReyEroorIJjb
	0CgQKoykotmovdLOuIt5UXNjRFJRt3HSthl16MsOiSNQqow4rIEejzhHLbFYko2I=
X-Received: by 2002:a05:7300:1485:b0:30c:7ab6:7ff7 with SMTP id 5a478bee46e88-30c84bc4e7amr742488eec.15.1782352845882;
        Wed, 24 Jun 2026 19:00:45 -0700 (PDT)
X-Received: by 2002:a05:7300:1485:b0:30c:7ab6:7ff7 with SMTP id 5a478bee46e88-30c84bc4e7amr742373eec.15.1782352844019;
        Wed, 24 Jun 2026 19:00:44 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8afca8sm2933939eec.17.2026.06.24.19.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 19:00:43 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v2 0/3] input: misc: Add an initial driver for haptics
 inside Qcom PMIH010x PMIC
Date: Wed, 24 Jun 2026 19:00:35 -0700
Message-Id: <20260624-qcom-spmi-haptics-v2-0-b9118e60f3e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMOLPGoC/32NTQ6CMBCFr0Jm7RAYSImuvIdhAWWUSYRCBxsN6
 d2tHMDNS76X97ODshdWuGQ7eA6i4uYEdMrAjt38YJQhMVBBpjClwdW6CXWZBMdu2cQqVtaeG25
 6qogh9RbPd3kfm7c28Si6Of85LkL5c/+thRILHKjmmmhg09dXp5qvr+6ZolOeBNoY4xdngIbvu
 QAAAA==
X-Change-ID: 20260616-qcom-spmi-haptics-3cc97e7b232e
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782352843; l=3511;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=1XRKW0vDR45JGT3UWYWuagvWFRDF/O/QLqhohEncfdo=;
 b=9gdxI7Dk+7XkZfPAg2VWu5NzwswK/jSdi94TNuaGcS8WIDVmf9HfUO0SIHgi5bTYRbJ6oPZAA
 djcbQYiyh5nCtU4WGrxhy05ja/7z9k9svfrqTvl07+XhBdHVOyejm+J
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3c8bd0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=F7vqA0BNXnWFEAHbpNcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: l-bGOny6kcvEsKsKO4WICx9YnOb0wk0Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAxNSBTYWx0ZWRfX7EuvjAJRHf1k
 aNcY9JkkaYBsojK+iiU0B8SVF1t2Ra0+DR4ipK3Mgz86h0GNOzkjK4BY777Igtm6EOyJ09H3PRe
 94TFWsTvz+WGsXG/DtczGk2CreOMLGSpcellQlFkRaF7Q1gt2PhAPwXmc/wfWw6ikkYGvlfYUZC
 W6dFqlNoY6Fwtz1a6BPYB9Te06kLHTqsI6J+lyoKZIJc1A36NChecYNzYX6Z7Nr5GKA/yadZpC+
 GCZYdW00YUfLHxhIJ8ekG0LUGHFRLc0xDXq54MyIw9DWuJnWBuUVyQUxmCTUVPxN8To5xYRMIZW
 W//O6HG0abFi34+Cq7Gem/xZ9D073Zgekj39M3UNAYLwUFqRyonTwgfG0cXKJjCkY1rxUEXM5d0
 xHxoev2Op6LFmRNMd92+9DYX95hzkhm2rnLZERigOCIbDTaTiim7oyM1ZWtABMB/jBCQifOxgbH
 aK4WxSuxBl2oVCxLfAQ==
X-Proofpoint-GUID: l-bGOny6kcvEsKsKO4WICx9YnOb0wk0Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAxNSBTYWx0ZWRfX0ihPAx0rrIvl
 lGYNPolyJ+n7yg6LCsXbfGY5bj7NgmtgnoJDiQ2SImDZnUomT0dz/anJpiO4d6+ZeewaIcvOjPL
 3/rmsYrNhyEEWuTJ1MjRaMZENsCQ9C4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250015
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114434-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9001C6C24D7

Qualcomm PMIH0108 PMIC has a haptics module inside and it could drive
a LRA actuator with several play modes, including: DIRECT_PLAY, FIFO,
PAT_MEM, SWR, etc. Add an initial driver to support two of the play
modes using the input force-feedback framework:

-- FF_CONSTANT effect for DIRECT_PLAY mode which drives sinusoidual
  waveforms with fixed period and amplitude, which would generate
  a constant vibration effect on the LRA actuator.

-- FF_PERIODIC effect with FF_CUSTOM for FIFO streaming mode, which
  can play an arbitrary waveform composed of a sequence of 8-bit
  samples at a configurable play rate.

Also, add the device node in the existing pmih0108 dtsi files, and enble
the haptics device for several boards by updating the vmax and
lra-period sttings according to the LRA components that mounted on each
of them.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v2:

Dropped dtsi change and I will resend them after the driver and binding changes get accepted.

Updated haptics binding and addressed review comments from Krzysztof and Konrad:
- Extended the description to clarify the 'PAT_MEM' mode (not yet supported in the driver)
  by comparing it with the 'FIFO' mode.
- Updated the compatible string to 'qcom,spmi-haptics' to match the file name and removed
  the PMIC wildcard.
- Simplified register names to 'cfg' and 'ptn'.
- Corrected the unit naming for the 'qcom,vmax-microvolt' property.
- Added an additional clarification for the 'qcom,lra-period-us' property.

Updated the driver to address review comments from Konrad and Julian:
- In haptics_write_fifo_chunk(), separated variable declaration and assignment, and added
  comments explaining the 4-byte and 1-byte FIFO writes.
- Replaced manual 'x * n / d' calculations with mult_frac().
- Switched to disable_irq() to prevent late IRQs after device removal.
- Replaced property reads with device_property_read_u32().
- Remove the 'INPUT' dependency in Kconfig

Updated the driver to address feedback from Sashiko AI:
- Guarded pm_runtime_resume()/suspend() with 'pm_ref_held' to prevent runtime PM reference leaks.
- Replaced spinlock with a mutex to protect FIFO data during playback and avoid calling
  sleepable regmap APIs under spinlock.
- Adjusted suspend/remove() sequence to stop playback before canceling work, and freed
  FIFO buffers to prevent potential memory leaks.
- In FF_PERIODIC handling, allocated 'fifo_data' before assigning data to ensure its
  consistency with 'data_len'.
- Registered the input device after enabling runtime PM.
- Unify to use 'h->dev' pointer in probe()

- Link to v1: https://patch.msgid.link/20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com

---
Fenglin Wu (3):
      dt-bindings: input: Add Qualcomm SPMI PMIC haptics
      dt-bindings: mfd: qcom,spmi-pmic: Document haptics device
      input: misc: Add Qualcomm SPMI PMIC haptics driver

 .../bindings/input/qcom,spmi-haptics.yaml          | 132 ++++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/qcom-spmi-haptics.c             | 838 +++++++++++++++++++++
 5 files changed, 986 insertions(+)
---
base-commit: 66725039f7090afe14c31bd259e2059a68f04023
change-id: 20260616-qcom-spmi-haptics-3cc97e7b232e

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


