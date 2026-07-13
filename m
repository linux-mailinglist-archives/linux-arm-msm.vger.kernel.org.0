Return-Path: <linux-arm-msm+bounces-118761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AlV9NQPXVGqafgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:16:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F51A74AD34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:16:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R1NtvZHR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gZj75XqA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118761-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118761-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A2043010663
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127DC409635;
	Mon, 13 Jul 2026 12:15:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A12919E968
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:15:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944948; cv=none; b=a0paalRoA2FapHwmpF2gPnVXsepOXLEm4UR2jHfdJvzTdiqDL0QgqQigBXzoNBwtNmNHjA4e9ylnDk6OT1wt8jiSQyZMyee0xQcT2QevGjAysItv+BfR9d0fZXKinWiUjseh5tQL5JvhhyBzjafaCJkHU4s2Al7NtYYwyn7MuBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944948; c=relaxed/simple;
	bh=Idmip/nOu5noW8nkQdg4s/Q7R9FjoaKZkmQtwHukCcI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JNKteHCvku9QT+oDyY+fzzralJHAk/YuFlhHpvMd8qUVyclFJWt7cNFwN0+nRWtRTtQQW3S210xXUF9fe93bAJRRLHtglnJNkjfS8cMuFs1nC8p71g5p9117wDlDC89d6y1IvEmf2ONPd36YVaWVJiukR4oc+y/n5WNQYQ2dIMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1NtvZHR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZj75XqA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDdmV1480703
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wqxzQNuOSLpI4zoQgw9QEO
	mxgTQJ9nfCSI9GvtFZtCY=; b=R1NtvZHRN2zBl+YO+eLtZ2AFgLjLSMON6Rtoxn
	J2vHGn0nyaNu4n748w+J0ZRghA8LNGoAp1+BUgL3unYQPX0xXHFYvpMMc+IKfgBJ
	x+GwJ5Y0nvTRyUoLHRsoNVn8+Srqm48jv/ssgNl0SP1uUAVNIC/GM3Ep8p1UDKxn
	3m8Etn+6lnnfyWQEz6O7WMYcKfvAZsZysLOy650G8B9ziFny/uEkEbKbnvKv0MzG
	+hOtUbCm2jFOx0r2xT50sj6VEAW/Bx763l8iOhFbp5+t/dd3CRWncpFfqinXrkdq
	r/rx7dfY4/EybFFrtAvIw+b/WlzyL0TY22CnfFGFNEuTVtJw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavrm2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:15:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4348895a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944940; x=1784549740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqxzQNuOSLpI4zoQgw9QEOmxgTQJ9nfCSI9GvtFZtCY=;
        b=gZj75XqAoJ8eLfwsEHoeSAITHzdey7i057jnjhZFrCtk8AzfdnWpK5VTTnITk0ombb
         p2b2Lmj2ypD7XuwreGdCmCdPFdyvB52nsiMkrG7oXWM/KnDVC866kNDcfQJ3MbIi139t
         5cIPG6g8Lr0MReThAztio0bldmwVUUamDSGormNhxHFIhpz1hPaz0I4lqlvFBFj0DqrW
         kEOd+OON9989uo9e3cvC1juhGKJGSHoFLbO0qOa4cNK09ErnJkkuPe5H6R3c9DEYwJQq
         JJDi9+iwOnHwRD00to20K5QoYXt/QUj/aZmfm/cGJNNcJMCTr8gr/DYXD3XRmZo0MSiz
         TCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944940; x=1784549740;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqxzQNuOSLpI4zoQgw9QEOmxgTQJ9nfCSI9GvtFZtCY=;
        b=r5RGTKusG4m5h6jsToYz+C7otxxADaYcD6vI1gmasyFjf0DDttpOs0K5TK0jpKfbI3
         OF5LO0ktB/nlHS6Ofot98mdnln9u6lRN3RsZVbFMhNufNO/huZ944l5qyIOt8PnbmtVE
         i2ZGa7OWQNXW/cHr4Y9eUpHXrqFkmD12h0Zw99HHPRivpJrTqvd2ATr1BqZiK/RLE1Bk
         sc/ruY8HtQtK30kvQq0c18l0K9GJ6WaV49FXReGUKjYz86V9NWBRaaD3+sn2S9hSi+M1
         N6RqAXD/PPYEd9Nx4YttY6coM+HZ1tlqbZRru+B0YSWR5dGNW8GQStga5QJvCxbYGH+q
         TDtw==
X-Gm-Message-State: AOJu0YzTR6mCIJ4Li/JjhM1BHflS6b3LdHS4sajSH/7FBGWXFrwzR6rs
	/7xrR84xVx/o2ZenpdyD9vR4Ke8VGcwUbXie+djP2+B2AXFw6RpBP3Z9hZd9vi1TE2LDxxFkCVd
	QWgpQmS2hzeeTBuopkGL6TTE8YuX29vxWE7GWHzVNJ0gFczzHr9htjeWOCd5UrsTxLu+i
X-Gm-Gg: AfdE7ckev2xViz6dZvyM9nDcN4P+FISV9WAfOEvyl2W89wlP2J8PGdCXKNYH7YXph/Z
	oDG+zRcLJY0Bx1gOV71PYBMzkAmp6CZxHTqUtXeh9Mrd+6nCAIEzAITMHiDp5Wm8pa8CilYZMXy
	C3C8Od+5C0GTfYDU/B4bjvUZA2JVugriFzagUu3oTYH8NCyCFDO5218M7DAJ+huse9eA5X31LvC
	FiKi7zXbReQcyWkTyUjxIQNpLSlmh7Q2ZW7+q60lcmiAAbiRWm5aSGuhvr+8T+uHgvB5UUAyS7e
	VfC1bco6G20QbXuJ2aeSin9V7hfUculkFx+MYR8DoY46UXzKN48rRTClpKWHyg8NM082DC0oZzg
	dlCPyyZCAA1vqp/d8kA8Ds5iHZtAURoMjC3RXZMwF
X-Received: by 2002:a17:90b:3b89:b0:387:e0db:3fad with SMTP id 98e67ed59e1d1-38dc7778aedmr8357986a91.38.1783944940027;
        Mon, 13 Jul 2026 05:15:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3b89:b0:387:e0db:3fad with SMTP id 98e67ed59e1d1-38dc7778aedmr8357959a91.38.1783944939599;
        Mon, 13 Jul 2026 05:15:39 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm28069425eec.23.2026.07.13.05.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:15:39 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 0/2] pinctrl: qcom: Add Eliza LPASS LPI support
Date: Mon, 13 Jul 2026 17:45:16 +0530
Message-Id: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BDmYnw8ALzEC9QcvOv9gRP38lVSGyITI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX/pVlBsO1SOYL
 bY/UZggFvO+XHKRQhymRkT9348Ee38Oslo2URb4rivRvdi5o8ASAFJK7RziJrI8fXy0ZpqB5hHf
 zwtoHCAyQ6Bey5LTcipuhXkmqRKzKickKecBpU0b44vXwhw/CMy4sGcTE3CMIXDrmLJuVaUdXbw
 xZwXFQC6wGs+In+9ZyzCFAEheSPewprqEVIulRjjBEN/WI1fVW3eQWn7jv/+CoCjE1Z9jzsa/ir
 0/YU3p+GH746C7tcqSECiCtu7MOxH9JmW5L8SdczvAvknU6j3M+aJy/KdF/w2DmWMX4beB45y8s
 cO1/2iO6CL3jpAk4CCn1Iu4QP5qJ3PAvuumztpsqHx9taT6r+Ajy1Sd+TM4vWKTVyB/4HSfsTOX
 y+AeFLqryRuZEKE5s72d6nbnlyZ+R/MSQWMnVkggNR/vMUpZfg2b6o50505wYrN7wQxmiLDsTBL
 BduTAdtpx92hb/n16Zw==
X-Proofpoint-ORIG-GUID: BDmYnw8ALzEC9QcvOv9gRP38lVSGyITI
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54d6ec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=2gB7WEHjjayKgNmZduoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX+UpmHQtdHvxC
 9+kBmY/tpk6BwqhyhpyPQMv2BSTEct1eFevRv1sz45MqyGTFcI6cpW/UUlhiEdSCSx01Ffcch6n
 ZsTnIUtLXe60ha0bfbYwclyzM5GlGlI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118761-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F51A74AD34

Eliza is a Qualcomm SoC that uses the same LPASS LPI pin mux
functions as Milos. The key difference is the slew rate register
layout — on Eliza the slew rate field lives in the same GPIO config
register rather than a separate dedicated register.

This series adds support for the Eliza LPASS LPI pin controller by
extending the existing Milos driver with a new variant data struct
that uses the correct slew offsets and sets LPI_FLAG_SLEW_RATE_SAME_REG.
The pin descriptors and function table are shared with Milos since
they are identical.

Patch 1 updates the binding to document the new compatible and the
single reg entry used by Eliza.
Patch 2 adds the driver support.

Changes in v2:
- Use 'enum' instead of 'oneOf' + 'const' for compatible property
  (Reported-by: Rob Herring (Arm) <robh@kernel.org>,
   kernel test robot <lkp@intel.com>)
- Restore 'items' descriptions for reg property, drop redundant maxItems
  (Reported-by: Sashiko AI review)
- Link to v1: https://lore.kernel.org/all/20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com/

Ravi Hothi (2):
  dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
  pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM

 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml | 18 ++++++++-
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 40 +++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)


base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
-- 
2.34.1


