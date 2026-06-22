Return-Path: <linux-arm-msm+bounces-114027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2Zz+AC9MOWq2qAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:52:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDC06B07C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:52:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mcOdAtt4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LG26BZRH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114027-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114027-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CED3E301A116
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6E9310784;
	Mon, 22 Jun 2026 14:52:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9B53126D7
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139943; cv=none; b=YwHZTkuKtLPQxfS6CQr20yCMi3EF+wjniV/ywpkV7pImB3oBLEwSzHgGu/txvu4xgUa5VHmjWuMu3X2luBZOGl+CanxbYDWeNNdsPt1B1U+RtNsAyVipKVn/H5LBKyGdhebrcylXk8ED+G9q4FM3vqNDTQFFJ4wsYUQymLi6grw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139943; c=relaxed/simple;
	bh=vOD0VCNIfLO8tPOwqvxHTfl3EIp6ZMGwmN3q+QlUvLA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ur0oQrpIlgPMCMBSDCXArpkiAUwJ9SkZ8W9/aNr+YhPx0OTCN6V1dCF/tQd5jDbm5Y+yduwwuo+l8F/fep6Y97bA2pw36fSOPbqYyXUY6e/bbSzMw6ghzJEf72UNg1fGK4X3eJrE/Cpzdpw8tKg/ccYJL8K9aSsLAKHukiXbvD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcOdAtt4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LG26BZRH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGAUN1261005
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vCOUC2LBhTnnmYlqCxPS8k
	2WyBe7Ospqvnq4gVsyoOc=; b=mcOdAtt4AK06vvk2njKGx4oUj6VgAHDkiWGz8d
	uDE2MyNBoiLPJQxmsCQPqrQcbFN9linmW5Xeg0ptVaHlc5/V0yRQaIwcw0RGunBm
	pa1pN+I7R9+51tCxl+ErArVoFjfCil1HGvaUfG+rQlapPYYVV0XNvaAzZ3i0+bwN
	X9lCkA/icYMylxpgRa4CLUylFrx+9CA4yIpSRbnLH6tMhe7WxmbXjLwhkZJsmxur
	u5G+rF0JE5Z6eBuCIv6TFGOeYsTFMHmCRFU+i969AazBzoqzMvKw2Oeuf9Q8UpRp
	4VLk3JAn7hYrqLS+2R4HgQT9pGrMyYCUqF+gVrwZ3bTFkd0w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb8vba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137eced000dso291578c88.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782139936; x=1782744736; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCOUC2LBhTnnmYlqCxPS8k2WyBe7Ospqvnq4gVsyoOc=;
        b=LG26BZRHQ1ahiUBTHRJecoR+di2BWJjaqIbVZwsoq9YcLVDjJOAy4USuMDn0hbu9/r
         0dgd8bLk8YZw1eNSytC/ZkI6gYT5qrbrN6PlfiX/d3NXWQwTp7x7R7SYIs/P3WVzXdBD
         SjUjAouVTwTXas2FYoZOhjPM13lMWEC/jNKAyRDz5aTDDqyFzePWRa9xyZZSFlNr7/iO
         oBfA3JJl7kL8agwTyIYk+t2Aj2f9Vx7BCRTc3ZKk8nfVemHVLVnAWKmKLT4+c5Gmh4aA
         o9/UmM9k96NGL65ug3Lio0AYVAs23jcWdnnv1tnnXXcTJox6Z5no5ug+DJvbfJDx0ZFz
         MMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139936; x=1782744736;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCOUC2LBhTnnmYlqCxPS8k2WyBe7Ospqvnq4gVsyoOc=;
        b=hprxyp2xftgT7ll5B8WqBWT5/+66JMeIQheeVzHd8eNPSMeOlqGD68uAoCYlObzgG4
         /jUQF9tvhNLeZCfVlHOAvWdQklh9sozEwNHqNM5LkZPfzfikNxY4z5x1ZoZoVI6pg15u
         IWoJiM+XjYCqNLsNgeC1WWMqJNtneGe675yPcKKa2znea8ICBQo4M7KU3nK+M7woGA74
         ZLGbkGg3+qfxRuzxL8Z7KMDlpInGQYQqXWce4WUkdfJSKK/sd/1AVSKZp5eEdWU3Kl0W
         XnSgOht3z/Wa6C+KVosVr23PMq4zDI++cjKAq0P12cZzEvoArm4e8Y/V2AkpRwnSzbTv
         hMjw==
X-Forwarded-Encrypted: i=1; AHgh+RoH2QS7CLo7fGbAKPAb8eQc7UJK81ExgGOfRZWkCeYFoL32q58ikU4jdtQDRxnVDOrFUM9iGkVhpdqwJR2S@vger.kernel.org
X-Gm-Message-State: AOJu0Yz85tCdnl4q8BXM8NBOCMiJM46fXMxd2ST2tfz6dH9lyBFehpc/
	XH6flNZoAvXqFE4WPgP+Jya+KzkPR7gA4l+KCK0SzQHfDHQ+K1W5LqPowSvsPemrZFvmZ2S/63+
	1jBbN2cfh5dMttGz4Er3MCv7ShUJGvl5ZVLV0Xt08HjNXN/ffMrFXRcK0TnabrQEknBVt
X-Gm-Gg: AfdE7cnI2Ibo6IIZ17c0KgsST51sx010hbosJxZh5qZYaxYc/QW72ZP1WlBHzKQzGHo
	Bz02KqP3tBX5z2OXpPngbE9urZF1d6L5zBsRDuCKGPboa/KoAphOU7FxGJ3nYk59GsE6WcRxaP4
	JYcKQf9wuPJiUylU5tHjihX+3lHU9e6CFQZ8YMFlETxbapeU2eYBS7X7/vNWMVdPcu8G7yC+OWw
	/Rp22l2b32SC1S+gwnylDEWBqkGK3OfDkGfRINYXiWo9kLvizkS/p+RC6MsHEB30zgrYJKR0CKq
	csF9+DwSeYaRvsMqCsdI3S6ycRLwc1gVn+Z6kHrB0pMI6JDJBWr2WeoRlzM1LPqrYdINj414N8l
	7gLKUrUiZRrQxkZ3kY1DGC4iJ/tOp8R0l/3HPucA85VTgHRM7KWQ+KlPO1g==
X-Received: by 2002:a05:7300:3b03:b0:2d4:62f0:b2e1 with SMTP id 5a478bee46e88-30c51fc533fmr234766eec.0.1782139935913;
        Mon, 22 Jun 2026 07:52:15 -0700 (PDT)
X-Received: by 2002:a05:7300:3b03:b0:2d4:62f0:b2e1 with SMTP id 5a478bee46e88-30c51fc533fmr234748eec.0.1782139935347;
        Mon, 22 Jun 2026 07:52:15 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bddfe34sm12025561eec.20.2026.06.22.07.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:52:14 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH 00/13] Bluetooth: btusb/btqca/hci_sync: Clean up btusb and
 fix several bugs
Date: Mon, 22 Jun 2026 07:52:13 -0700
Message-Id: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1MOWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyMj3aSS+KTS9LTMCt20pCQjQ7PkRMO0NEsloPqColSgMNis6NjaWgC
 asZxXWwAAAA==
X-Change-ID: 20260622-bt_bugfix-fbb216ca1ff9
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX1NP5qa5jSICF
 62WCd1h1bsyqDcfW40ogB1f3voRYld/yzaLyFMG3F2JaqsFeGSSgdDj5panVGYslZ2bR+S+niuL
 84QHQkVq7FUsptTVOe65nZqXjTyY9S0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX6MBW9vdmQW5U
 UBzSxFj/7K/1ojUPDhbF4S/NRCTtWitWQC7ZWkrrH7evJH7ceB+YRKRHb6up3RcytSLdp62wDWq
 vMCJE1M9l3F2RrGIXA7TC9WOKdEH4/49xVD8OI8LA7N/6UW1GQKlKoupiVmyaaR5cbNLllSehZ5
 QuSPDbEzCeAHRDvOQiRjBBH3r1HVcBlrMHqtHX9AepWRS/xnnqVt/FeHlMj/OvBPgsetzkoeqzS
 aiKVuL9BN5zVwnH1CJkNteXng0VHssZjY3asDDJJn1tKp2idkfgkM3CTjbQluzbrWkk0Qynamf5
 OcAUyY88e++pTM0eAmFyG61e4XkCI8/dxxmSYAnVZ60dOBJWCRzramEnq8t9tao04Ny3cWgjpkK
 oJy6UwKdXU1tsQt6iFYYBcLbykLMp2gGFhVoriiLTpLQpPC8fPmwMp7nDXYf/s1/FGoj4D3K/Zn
 RLxPfLVyaMqtfMit8QA==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a394c21 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5p3etvIpMzrVabLiRMoA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 0WkfB9_Z37FQlMFELE0LIe2ftTgM1vcq
X-Proofpoint-ORIG-GUID: 0WkfB9_Z37FQlMFELE0LIe2ftTgM1vcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114027-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DDC06B07C5

This series originated as a cleanup of btusb in preparation for adding
support for a new chip, QCC2072: specifically, moving struct btusb_data
and the BTUSB_* macros into a new btusb.h header so that the forthcoming
QCC2072 driver can share them without duplicating definitions.

While doing that cleanup, several pre-existing bugs were found and fixed.

Preparatory cleanups:
- Initialize priv_size to 0 at declaration in btusb_probe() to remove a
  redundant assignment a few lines below.
- Move struct btusb_data and the BTUSB_* macros into a new btusb.h header
  so that btqca.c (and future drivers) can access them without duplicating
  definitions.
- Record the matched usb_device_id pointer in struct btusb_data so that
  downstream code (e.g. qca_setup) can inspect driver_info without
  needing to re-scan the id table.
- Move qca_dump out of struct btusb_data into a dedicated struct
  btqca_data stored in hci priv, decoupling the QCA coredump state from
  the generic btusb driver data.
- Simplify the hci_reset_sync() return path (trivial two-liner to one).
- Add __hci_reset_sync() as an exported helper for vendor drivers; it
  sends HCI_OP_RESET and returns a proper errno.
- Use __hci_reset_sync() in btusb_shutdown_qca() to remove open-coded
  __hci_cmd_sync() boilerplate.

Bug fixes found during the cleanup:
- BTUSB_IGNORE is a bitmask flag and must be tested with '&', not '=='.
  The '==' test would miss any device whose driver_info word carries
  additional flags alongside BTUSB_IGNORE.
- qca_setup() unconditionally populated devcoredump fw_version and
  controller_id fields even on ATH3012 and QCA_ROME devices where those
  fields are meaningless.  Guard the assignment behind a WCN6855 check.
- btusb_set_bdaddr_wcn6855() passed the raw bdaddr pointer to the HCI
  command without byte-swapping it first; use baswap() as other set_bdaddr
  implementations do.
- hci_reset_sync() returned the raw HCI status byte instead of a negative
  errno on error.  Add the bt_to_errno() conversion.
- qca_send_reset() used __hci_cmd_sync() which only checks transport-level
  errors and silently ignores a non-zero HCI status in the response.  The
  function is replaced by a call to the new __hci_reset_sync() which does
  the right conversion.
- qca_set_bdaddr() passed HCI_EV_VENDOR as the expected event type; the
  correct value is 0 (any), matching how other set_bdaddr callers behave.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Zijun Hu (13):
      Bluetooth: btusb: Initialize @priv_size at declaration in btusb_probe()
      Bluetooth: btusb: Use & instead of == to test bitflag BTUSB_IGNORE
      Bluetooth: btusb: Record matched usb_device_id into btusb_data
      Bluetooth: btusb: QCA: Do not populate devcoredump fields on ATH3012 or QCA_ROME
      Bluetooth: btusb: QCA: move qca_dump out of struct btusb_data
      Bluetooth: btusb: Fix BD_ADDR byte order in btusb_set_bdaddr_wcn6855()
      Bluetooth: hci_sync: Simplify hci_reset_sync()
      Bluetooth: hci_sync: Fix return value of hci_reset_sync()
      Bluetooth: hci_sync: Add __hci_reset_sync() for device driver
      Bluetooth: btusb: Simplify btusb_shutdown_qca() by using __hci_reset_sync()
      Bluetooth: btusb: Move struct btusb_data and macros into btusb.h
      Bluetooth: btqca: Fix undetected error HCI status in qca_send_reset()
      Bluetooth: btqca: Fix qca_set_bdaddr() using wrong HCI event type

 drivers/bluetooth/btqca.c        |  25 +----
 drivers/bluetooth/btusb.c        | 197 +++++++++------------------------------
 drivers/bluetooth/btusb.h        | 139 +++++++++++++++++++++++++++
 include/net/bluetooth/hci_sync.h |   1 +
 net/bluetooth/hci_sync.c         |  18 +++-
 5 files changed, 205 insertions(+), 175 deletions(-)
---
base-commit: cb20f6afc25b2b54c0fec61b45ac0ec9eb875d59
change-id: 20260622-bt_bugfix-fbb216ca1ff9

Best regards,
-- 
Zijun Hu <zijun.hu@oss.qualcomm.com>


