Return-Path: <linux-arm-msm+bounces-115069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HZHwGqhrQmoa6wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:57:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5936DA9DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:57:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kdOZXKmo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c1URTRvj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115069-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115069-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB11131A93F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1BD404BEB;
	Mon, 29 Jun 2026 12:35:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB914404BDF
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:35:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736502; cv=none; b=DAD1TEqw3hpapzj+e28gr7f56upRQNXqJnpxaGpeKLs6gw9/+ihKKr81D9yEV4ktMqJRIzH+3thVkIzyaaf5g+urVJdLMGkcctJglf79UB/WLo3XDxGGWtoZ2/lY5aCCSw+9WVdWVjM7IpIEDsKoXU+dh/RHLqPZHWWuPn40ml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736502; c=relaxed/simple;
	bh=9FAS+mDt+OZ2wTFFclBcMONt0IaDUoeHNgfvU+Et0m8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xa6Ca6RGKrr1st3ibG86VX4y6OzOumv4xwz/IF3xaY41nzHGsGL3oq9AQB8f7dpg6lC3dp50T9WMKr3prBY+IgJ1q0zUw/TJhE8VcUSX66sNjlghbLEG2cneVpxsv/8xFmGCndIVANIXCcuA33ReDU2TBJ6JsV6h8DSXcgQA+sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdOZXKmo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1URTRvj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT2bf2646894
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9FAS+mDt+OZ
	2wTFFclBcMONt0IaDUoeHNgfvU+Et0m8=; b=kdOZXKmocMPs8ytFWG4Wq7e8ayd
	8TFR7kWYujCwTM2Ta5YBrDl9CxKat9xCGKHU6aLeF4APtRh1lZ23J/c7n8zoS751
	1c362l+X/zpoAtLjgRCjAg7qaVG9dZ+EMpS6ZopqLU28nvyl8ZFHsKmL+JVA+kQo
	5O9D9LFD5a4aepRDi8s9OG1XXBPOsYWEH7qi6rfi4zvEOZwUrLNtVRgv2f+1O1dt
	hT7v9jdPMsesDdTCFjvWdThP/X1yut1X5jA+FhQDpvzg8IbQRIFDZoDa3Fyzi2SO
	7gZ2b6cCxtjmUaUI9nSAygq344jDtNnZrgfC8eskxcuuX3LixQg+St2LMLQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4ts8n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:35:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so190477685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782736500; x=1783341300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FAS+mDt+OZ2wTFFclBcMONt0IaDUoeHNgfvU+Et0m8=;
        b=c1URTRvjyMgydooofsQKxu0GRiC2zFuFnaj14igWZDiHCdlFCFGeUlbuws8+q/X0k+
         I5Nu7GJXVWaKsrGEqjTIUwSeLjxgJI1msA0MYz8fchiHXO9/XWpko8psNsTthB5g8eEc
         aUlNz8Pptq1MDnqN9F6mujcpmHc1itzvPoBkdWXZuC1F94ekYAuMRl0HvaMkkbBYSEsk
         GOWgonGSn5WgL9jGPSOKcl7GVTkB5PVW5jv1u1SF/1RSp28ux5N5dyowW53ydByZDDxm
         5Sc3ZCZWVQdAl0aHv7AA8ccOWuMASSquX/RPjA322YErUuRuzmYIpRSaXgWfxFiaLxGs
         8/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736500; x=1783341300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9FAS+mDt+OZ2wTFFclBcMONt0IaDUoeHNgfvU+Et0m8=;
        b=aQzN0oDy5+hHTsZndVbmCRHfnEsxyE9U6mCl9L2Q0UD3QOnRg0xhgsFLz1BmPzOG8h
         TKXKPhkzomthjB0GkzyyZpzQmFx852pnKPQy+mv+T72SvsG4jHJsJ48tVOx6YZMKbcDw
         7LSgizb0KYFkUmCUqnBKcsAHMqWWOwyXav+VheCcbhzV6w7MfrQ9Y2Crxz5xi9RfEJuH
         aWLddkkUeIRnvnnQ171O9ID3pThOaxWvTvq8jEalc20dSwUS6M/smr4vdPZfiw/AsHFl
         RX6rK/zrTFKNjls6jD4R8/3uUpwDeawp1eU3laPIYRa/ykYn4LQOlGC3Qdj8TAnyI3ql
         jkFw==
X-Forwarded-Encrypted: i=1; AFNElJ+6Z1ZC+qvKmQ3P/zeWCAvzdCUulaszTxsHo5vW4lVPFuEo6aHo4Gx+3/fGbFA9bLdAAGQPXHSJ6fn1DgFn@vger.kernel.org
X-Gm-Message-State: AOJu0YxO4r//Ngw9dtDRqWH7uvxCG/vTANvGylSDyXS5V9RollU6EapN
	+yb4b05J41ZaST6oP03ArXr5Sf8LKEEX41hjShPmR5mM/sO8hxEhcW4rmt7IoXQ5Wg/zGrwrZuV
	tPPLPTfF0QppTQ4ttLaOd49lq/gf1HtKtjcjBjfAuqBFY1/R0ji8o+H0DH2lgEYSXLTeY
X-Gm-Gg: AfdE7ckUCZKPWsE+LvSxsmML8HfUyFXL1C34oxw8BBeSGhj/NgWIdO3GDGcE7HU/ETP
	Q62K5udlUZNraz5mxRsNmxZHB3jXV/KPtDMbId0BmXydxCEJLozjRf2cgbjQ9GEQsjynlduXlq8
	eX7CJLYEFlPFXGSkET0TYusqSBaxZGZNFrxH/CsYlfZGagMy21giwFKIB+sNawbsY9E/GFi/gAp
	cnsiMSL77fl0FC3fcB+THb+N8Ln/OS7HPaqS758Dwb1uKMQnRiIyXq1gGPENeorJK8WkGlmyXGP
	L8r3UZm6IpMTE57I4IljgOmCtNqdhsxzZb+a2s9apSAPmSWkiR40vTtNFDteyFQLjfychH+KG/1
	60FwdySEXY9erDcu9KnBP1C4TbNE1SwuCdN8=
X-Received: by 2002:a05:620a:6499:b0:915:6a2b:6265 with SMTP id af79cd13be357-92b3e37a536mr1306144185a.44.1782736499963;
        Mon, 29 Jun 2026 05:34:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6499:b0:915:6a2b:6265 with SMTP id af79cd13be357-92b3e37a536mr1306138385a.44.1782736499365;
        Mon, 29 Jun 2026 05:34:59 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa46asm775684066b.10.2026.06.29.05.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:34:58 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>, mchehab@kernel.org,
        robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add Qualcomm JPEG V4L2 encoder for SM8250
Date: Mon, 29 Jun 2026 15:33:59 +0300
Message-Id: <20260629123359.3469724-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMyBTYWx0ZWRfX+oumh1FrNdtL
 0dlX/oyIXEeGXHmPqYtaFUGcrYeX1z5kpHHAJs3xAUlPX+jAoC+7BPWrV6cUebIPt4riCDmYD3q
 RiJ7+bFYxqtXHCXZh793g+dweBSEN4Qf7KQWj11ipfgNJsL5F89k1f3ejX/ICH+yH4LVgo4Lz1l
 Lo7g0r1OqULjEVBnWLdyESek4ydaZz1olfpq+E2mTEHVuZt3gHI0sL4nsdZTyiqM5BlHZ+eON+o
 9U4b5qQjDozpfS8/NlnsG476wxOFoavC563OdVZqdlvL2oXNaLZaorKQcOZX5bpjLwSPzL4Qv7s
 FGoC5HYQSeJJruURw0CieB50ecMwo9ProSOvW9/nCfmWnVdNYwppYDGNVv5ycyWv2Md1iC2H/kY
 ZD75ugL9ODTMikBKtqlbSfnxjH6TtB9cbjp2z50QJCWp3nC0PBh5cLq6+wodcLhV5O2/uuI8DAg
 1i27/3BeMloUmdeG9Ag==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a426675 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IiUnP6lGiGDxgbWSFccA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMyBTYWx0ZWRfX86y6bYrxOoIJ
 +LrOhVEDBUORfiFQBeVS5MR0bFtvJm7hDG54RNb2IiuAceEczmztWEpjyLyVPkEKG7iZn1yOhXQ
 YZ/i1nrmm6m7so3bWWngPg4oULy5fEA=
X-Proofpoint-ORIG-GUID: tgEH6jFQlKB7mf-7bz4wrlfQfZ2bBaYw
X-Proofpoint-GUID: tgEH6jFQlKB7mf-7bz4wrlfQfZ2bBaYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-115069-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B5936DA9DF

v3 posted:

[PATCH v3 0/4] Add Qualcomm JPEG V4L2 encoder for SM8250
https://lore.kernel.org/linux-media/20260629121110.3469048-1-atanas.filipov@oss.qualcomm.com/

Thanks,
Atanas

