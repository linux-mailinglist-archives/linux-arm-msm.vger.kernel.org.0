Return-Path: <linux-arm-msm+bounces-104715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALUIC8Fb72m3AgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:51:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F106472CE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1315C3072867
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DF630648C;
	Mon, 27 Apr 2026 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FqneaEx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T6BzQESD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45A830C62E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293999; cv=none; b=KOeBAqkv6kZO9ZTAYqYSyfgXjDqg+dPueHgFRpu9B/l2NJnhD15kSNujXOaJspD6uFo/yM5IUMKAmpFBfesl3d5auNYDiMm2/Jlq2jVTi3HcMWFhTc9QS5sKSN6XDbP73YYJlcv1MIf4Ot9yWYXLUDghOTI0E2IybL8ZZVmO4Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293999; c=relaxed/simple;
	bh=V0JA11tC547dVjIXETBYVhT0ZhmrOZQRJ965d5IsRe0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rd3QAYzgXd745b5EHq4YDd7GmFZCTTExNbaov/tThgRvhhUivwQr8tk4aUma2TAcEu3Bwzh0oanYZCzfJr2muHT/sHHcnkv4E4yRNzJwA+83g19wDgImhX/HIWbv/ws2VHMlRCorPaS/ZKcJBZVrPT4L1TsPSBdUW/DuAg32wPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FqneaEx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T6BzQESD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TFkf3682580
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m4HidIRDPD/ENeg1siawkt
	AX3FHiD1tFgd6YIKBm+ZI=; b=FqneaEx7FpYFgqOPMwzx93G7aQfGPdCil7J8jY
	lKuThXD/GdVUcGBBv6NjVR0gymCE9EfUQ1AkhFFNMgkeoj6y53sg53Q1J3quVxAO
	Az12chcitRfKXDcM1lkczMDVUUSoWrUQWeo2+DGnLPly9QIVV5gRGDfhS2t+iKtp
	DySAPotw18UFN9vxVZ5rUNrosJU6XaKIx7qfJMpW9nfJs7ruTm57lvymy5wBCFWx
	v2VT+0ESWovcfNw9XDH1ODJSm9vBlFfgU+pq6IWKnW4++rzyzMYC/cWEv5ubk6o0
	6jiUgsKBrcniRbLPt6Fql0LLI1P0M6UxPuW1iS35B9E5PWZw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr642t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:36 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-953d479ea6eso12085605241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777293996; x=1777898796; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m4HidIRDPD/ENeg1siawktAX3FHiD1tFgd6YIKBm+ZI=;
        b=T6BzQESD+YiNk6/JJU7TB8YSWWfXXq/YmkcGbXalFWqwwhQMIfIvp4f6kKa/wCtIsq
         jrNvur2veuwJWUPDWuGtnhOrYK+27rdf2wiKgYFU14gUelDe5+PS92MqI4Ym9hcjJQTP
         5ZpdGgnirlqNoDjubzi+lNPcYP8wWXMYaHWIwKyEGr2/LxuvYKLyCe1XI/y1Y/EoJCtZ
         MqTIefSHk4YxXmxvhqzo7qMT4nhhYaGySIFMNLH6MMMhBR7IF5fuwSXC4SVHrSRkaCNH
         cOCn12GSpsybdNcONb1yQGLmOzIu4q0+FDxq4VoRiDIVAFnSB7laa9QIUhOhudWhJgII
         f/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293996; x=1777898796;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4HidIRDPD/ENeg1siawktAX3FHiD1tFgd6YIKBm+ZI=;
        b=gdg2+w1LjT68LGQzSZ3FjkEdvbcKUgdZxWFjWWNQobPNzVAHWMY/QclZ1aF2c8lSTD
         MaNHGEVwShaqpVq6BdE4neP0IjhrJI3QK/HsuS16MuElyTcbuY/J/wxUGzXzpWlSkoFu
         U9GZiA7O9w8w//a312guZ/ST6J79I4Ad7fZSTasd7tchxNyOrsCx91MQWZx3ToCup7gg
         Mw58BOn4ksj/8GWTDqN7HXAQXo/B7Lme+umtS5CBsUcBR5kvxF9u4grBovgeQCjIWSPq
         08gpTaJcHhMFO7WwyrxLdHPjFzmhk8jWi4sHKpfU5DmhcAMM6ZB634dCOCqdNO19gzEl
         JxFw==
X-Forwarded-Encrypted: i=1; AFNElJ+07Sz+8laodXEojAId5XSu7VBf7aA0E0Dq0SPrtbWS6VtzASHrXPrP3eFs8JNS+hie1eh4Zn3EnD5HbT9T@vger.kernel.org
X-Gm-Message-State: AOJu0YzN3ib3xkwmJH8AXpbGM1/ffi1Ff2nf5EfOZpLoCGfYV84Repdc
	hWY1GM7Ocz/BFvA00msn25HSBBZatS8uYIqmORSiJiXy/WW7lx/YZ6oK5e7kbwtKV179h0oQHxD
	Ungt/Eo/Q+tcjbUXXcb+9HkpW0BX1BJuTsLT8e0sDk0BtS4KSHT7i1We3fjdYLxaw8A9h
X-Gm-Gg: AeBDievGF2DUC7mMniCRTBjdfaO+a854DY/AI1VAk5dh7jtVFQkfkgOZhQTPx4fP5ZT
	upN8yPg7svboaUuIJTQPo4RIdvazRi1vGFR/1sewIdkIQKYfrJyJGazC/cY+XYqoBVEq8CKkogf
	acg3XJNMZ/zNe/xt6UcFWr+hMdvh5bHPlyRbYFiwT9HbfsvaQcyNkzyaosHlw+QkWFiIhTwuokx
	mEzodS7WXgI4fDfWUvLCovfVa/SmhuY5k4MIFqud5bQsd10+UOv90lPUAxn9ByVawYLDkC7VBb2
	tHZ+keXWwt4u9rOtrNOtbGdhz7UcD2vzF7w+CC/+2/PqTFZScWMoXACF3mtbCm00yDEh59RRFMA
	YcBEEMrRUHZLBkHe1ECPQ9u7Eyz8S7yusZi84ck4lfK1IYpxmpYSxyHMi7qrT8vBdtx9Ifk08HL
	iyxvCVVzoDUhENaNMM8CTXO4Be87I=
X-Received: by 2002:a05:6102:41a6:b0:60f:c9ba:b992 with SMTP id ada2fe7eead31-616f68d760dmr22047569137.16.1777293995639;
        Mon, 27 Apr 2026 05:46:35 -0700 (PDT)
X-Received: by 2002:a05:6102:41a6:b0:60f:c9ba:b992 with SMTP id ada2fe7eead31-616f68d760dmr22047540137.16.1777293995204;
        Mon, 27 Apr 2026 05:46:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 00/14] media: qcom: camss: CAMSS Offline Processing
 Engine support
Date: Mon, 27 Apr 2026 14:43:27 +0200
Message-Id: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAO9Z72kC/0XMQQrCMBCF4atI1k5opk0rrryHuIjpxA40TcxYE
 UrvbnDj5sG3eP+mhAqTqPNhU4XeLJyWCjwelJ/c8iDgsVphg33T4QDeRRFgyZAyQXe3gw2BPNK
 o6icXCvz59a636lBShNdUyP0rLbYG7Qk7jcb0xoKBObHXOa2z4+WSRPRzdbNPMeo6at+/c2qcU
 qcAAAA=
X-Change-ID: 20260427-camss-isp-ope-4b575ffec2ed
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ef5aac cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=MYo6ArsnHSpCJc-KhkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 9lFgHEArRpeI4ikPq8-GGFTGO0imqv2o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzMyBTYWx0ZWRfX5QquDrmfQ1K4
 fVaUtSrK8gDohbjFPKc3IL+ZVQwoJ5u0456lM0G49NamacCCUfvwGg1Qed7gXqFKXFfP13ZzbZm
 /C7IK/QfvvWcUq2AKHl9blY2bOCFzdV6UNUgG/PdJwKblOe8DSCmdeIWKEVnwPJeOXs2zwxAy2t
 IBcu0HBFa1XepFCb+6E53EtPge+KFbI9gNnqSKaxKz4pgByoQ8QxK/kjQ0JrjLtLrQ080zU7hyf
 YiHd2DoMFplFpz2STzoG/IVB6pYhynmdTsd9p7W6pMBE8PEsdwf4Vq30zwmDi8v5doP8Z813APL
 UwE9bi0xHjThe5lT1YynutBPnYAbobPqHXA/8jvk6dipkVhDDsru6qwOqE+BwrUf+cz7Zd2rfgC
 VC26YQ2j+GZjpKNnP0v5St5LLTT+G/TOKqt75KTuDBhOzKf/p7ftv66qMxKgd0oDZJzOcZGWViu
 j/gvQtKQ0apgGgWh2Ew==
X-Proofpoint-ORIG-GUID: 9lFgHEArRpeI4ikPq8-GGFTGO0imqv2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270133
X-Rspamd-Queue-Id: 6F106472CE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-104715-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series introduces support for the Qualcomm CAMSS Offline Processing
Engine (OPE), as found on Agatti-based platforms. Boards such as Arduino
UNO-Q use this SoC family and will benefit from hardware-assisted image
processing enabled by this work.

This represents the first step toward enabling image processing beyond
raw capture on Qualcomm platforms by using hardware blocks for
operations such as debayering, color correction, and scaling.

The OPE sits outside the live capture pipeline. It operates on frames
fetched from system memory and writes processed results back to memory.
Because of this design, the OPE is not tied to any specific capture
interface: frames may come from CAMSS RDI or PIX paths, or from any
other producer capable of providing memory-backed buffers.

The hardware can sustain up to 580 megapixels per second, which is
sufficient to process a 9MPix (4K) stream at 60 fps or to handle
four parallel 2MPix (HD) streams at 60 fps.

In order to enable reuse across future CAMSS ISP implementations,
a new camss-isp-common module is introduced, providing common
helpers for:
- buffer queue management
- job scheduling
- pipeline construction
- parameter parsing

While currently tailored for CAMSS ISP drivers, these helpers are
designed in a way that allows further generalization and extension
into the V4L2 ISP framework.

The driver is designed to support multiple processing contexts. At
present, however, only a single context is instantiated, which is
created on the first media‑pipeline open.
This keeps the implementation simple while ensuring the design is
ready for forthcoming multi‑context support at the V4L2/media
framework level.

Since the OPE is a child node of the CAMSS device, the CAMSS driver
is reworked to properly share and manage power‑related resources,
including power domains and common clocks.

Graph:
frame-input --+
              +--> proc --> frame-output
params -------+

Compliance: v4l2-compliance has been executed without any error on
the media and video devices.

Testing: A camss-isp-m2m tool is available at
https://github.com/loicpoulain/camss-isp-m2m-test
The tool can be used to exercise and stress‑test the OPE engine,
as well as to observe performance and latency behavior under
various operating conditions (resolution, format, buf count, etc).

./camss-isp-m2m -s 3840x2160  -n 5

  Name                            Device            Dir       Type
  --------------------------------------------------------------
  frame-input                     /dev/video10      output    video
  frame-output                    /dev/video11      capture   video
  params                          /dev/video12      output    meta

Test: 3840x2160 RGGB -> 3840x2160 NV12  [5 frames]
  Input   /dev/video10  3840x2160 RGGB  bpl=3840  size=8294400
  Output  /dev/video11  3840x2160 NV12  bpl=5760  size=12441600

Buffers:
  /dev/video10    buf[0]  offset=0x00000000  length=8294400   VA=0xffffbcb87000
  /dev/video11    buf[0]  offset=0x00000000  length=12441600  VA=0xffffbbfa9000

Streaming  5 frames...
  seq=0      buf: in=0 out=0   14.833 ms  (67.4 fps)
  seq=1      buf: in=0 out=0   14.874 ms  (67.2 fps)
  seq=2      buf: in=0 out=0   14.902 ms  (67.1 fps)
  seq=3      buf: in=0 out=0   14.960 ms  (66.8 fps)
  seq=4      buf: in=0 out=0   14.896 ms  (67.1 fps)

Changes in V2:
- Not an RFC anymore
- Move from v4l2-m2m to multi-devices design
- Support for parameters
- Helpers for pipeline, job scheduling, buf-queues
- OPE as a child node of CAMSS

---
Bryan O'Donoghue (1):
      media: qcom: camss: Add support to populate sub-devices

Loic Poulain (13):
      media: qcom: camss: Add PM clock support and integrate with runtime PM
      media: qcom: camss: Add PM clock definitions for QCM2290
      media: qcom: camss: Drop top_ahb/axi from QCM2290 subdevice clocks
      media: qcom: camss: Add camss-isp-bufq helper
      media: qcom: camss: Add camss-isp-sched helper
      media: qcom: camss: Add camss-isp-pipeline helper
      media: qcom-camss: Add image formats for Qualcomm CAMSS parameters buffer
      media: qcom: camss: Add camss-isp-params helper
      dt-bindings: media: qcom: Add CAMSS Offline Processing Engine (OPE)
      dt-bindings: media: qcom,qcm2290-camss: Add OPE ISP subnode
      media: uapi: Add CAMSS ISP configuration definition
      media: qcom: camss: Add CAMSS Offline Processing Engine driver
      arm64: dts: qcom: agatti: Add OPE node

 .../bindings/media/qcom,qcm2290-camss-ope.yaml     |  131 ++
 .../bindings/media/qcom,qcm2290-camss.yaml         |   13 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   71 +
 drivers/media/platform/qcom/camss/Kconfig          |   32 +
 drivers/media/platform/qcom/camss/Makefile         |   11 +
 drivers/media/platform/qcom/camss/camss-isp-bufq.c |  101 +
 drivers/media/platform/qcom/camss/camss-isp-bufq.h |   85 +
 drivers/media/platform/qcom/camss/camss-isp-ope.c  | 2466 ++++++++++++++++++++
 .../media/platform/qcom/camss/camss-isp-params.c   |   67 +
 .../media/platform/qcom/camss/camss-isp-params.h   |   62 +
 .../media/platform/qcom/camss/camss-isp-pipeline.c |  361 +++
 .../media/platform/qcom/camss/camss-isp-pipeline.h |  228 ++
 .../media/platform/qcom/camss/camss-isp-sched.c    |  223 ++
 .../media/platform/qcom/camss/camss-isp-sched.h    |  174 ++
 drivers/media/platform/qcom/camss/camss.c          |   80 +-
 drivers/media/platform/qcom/camss/camss.h          |    6 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 include/uapi/linux/camss-config.h                  |  118 +
 include/uapi/linux/videodev2.h                     |    3 +
 19 files changed, 4217 insertions(+), 16 deletions(-)
---
base-commit: 143efe4d18f3e221bf6e9c6476296b3dd53de032
change-id: 20260427-camss-isp-ope-4b575ffec2ed

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


