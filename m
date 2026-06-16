Return-Path: <linux-arm-msm+bounces-113485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cwkcC93eMWrrrAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 01:40:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F71695BF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 01:40:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kylxHvXv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JbkDhaPM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113485-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113485-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08CEF3028241
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1CF481246;
	Tue, 16 Jun 2026 23:40:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CA9481A83
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 23:40:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653210; cv=none; b=P1quQI9UwWlZMj7A17b7qsvipaIdjY57bvFBYq3SxZpzBZ1XyBjvenBwh0PfcyH7/RkqjSqiquB9qd4Y8i7VX4kHEAZOS9PV2FsJjpiEu7gO9kFzteLwQhMLQf1PzH71kCdc9NRsfV5wyeMdNHlvQ0qk/L/nctGBNrGDg8qJKPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653210; c=relaxed/simple;
	bh=2oVtRuJR5wLvi4drkwXbpmhGqp9pCP+15g4e/nO6WsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m9KySVTXNoYww/GkeKrpchxukJGIB6pHAhIvOtslb+chmotVeYT2LnWPBx/u0bXHF9gl6LzlfB0IsdIbBADPEQe0jGJ7vZa+u/yBEDgdUl4U7C54XJpIKYqnTHZOqBiFIEWaOC/f9bXSouTXCNsyykZFqhp3/quLgotnhS0qdMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kylxHvXv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JbkDhaPM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLTNik198436
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 23:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSBfUs5zHWsHGP8+8ujO3onLvjU61aUkgAyxvbFTMZ0=; b=kylxHvXvsQ2UHnL5
	0+16lqB9Vw+vaYasPAowTafo/RbuW4V7rsPRUxj03++BgxsEPn2acx5R3XVqK+7W
	rTjcIeoP4Hxf8ajSjscnAY3GJmCAqAU+yYWutndqWcJ6T506yLFrbhk7esKVwKlb
	Ep5eR+EDXE05xKT8RARq6Uhwbm7sf7TAqtp6KzD146JzZwhAO2u88igPBYB6vREw
	Ut95ld4xpiLbUhVFXDXbZoHtkeHv1+t0VydzQufhVlQ121IeE5JsBVqwBJ3FX4li
	NWZXlyKikcjksgBISNU040HmxD3CwQm3dHkhD81jEm6fYw7Mhg0tf9oFHei8M5of
	dLbmcQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer0cd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 23:40:08 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137f9301fd6so253693c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 16:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781653208; x=1782258008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSBfUs5zHWsHGP8+8ujO3onLvjU61aUkgAyxvbFTMZ0=;
        b=JbkDhaPMSxBENqniszbd/zfrlhxaf96E1xpnejPpFOBBoBji+vAfwqVk15TMKv0ncs
         51KQQrhIPbNuUJbOIDQVs7q+qqEv60zRChjiLS2PuJomy+kSAv1sF9u7fBTqlEpmb9zF
         r5qHOjqvrmh+jgl8//T+q3P80rxShhA1PFtAOuTbCuMINhtHHZRsabJTuiTKkWstTwbl
         IjYZxLCdKfZtN1G2AJlqMivTbpLOJYKbG2BsTIw/VbK7LAXUKBpKRDyC0Y489qLRRGre
         DlmHpuoZPwp3Ow0SVcuh0nz/Ht1jg5JkNXsASkEyFeByKTIk5MZFZgIYfUCPXQqQwZrF
         MZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781653208; x=1782258008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SSBfUs5zHWsHGP8+8ujO3onLvjU61aUkgAyxvbFTMZ0=;
        b=QHd/bttvdESq/Ljxpxfy8rI+t8eR6X2sW0gnsn+Ig/x1e4jdG5bqKSWUHkA+CLhCsn
         L+C0mEnP0Hs0VId9JZCGxs+BZe5D4B6tvgnpJx/6v0InTgCKDO3RseL/beVcEMqzov9l
         DWoHezn0PcQS1oueGsYnOJWHz4M4XhIgoodz8gKnv9VlRuYC1WHTzs/q1ywLiH3kopwn
         1TpY/6nrGqlY4g3eKk73638IyUPpfh2tTVtoD8BIeLBd0Fy/iNp9c7bcrmwOwZf+Mag9
         ylcL5XsaCFscjl3fWzPTwlN7z3Y6SLGuLcWtHH3om/HuDhifG3YOwfOcDGzCPf9ImUzb
         5KPw==
X-Forwarded-Encrypted: i=1; AFNElJ9VrJgcHLdCmUXR082Tg6CufXky7mmpSc3/jrSLV6uJYDHcSjKDQF3WPGaTt8JWVGCAywBHbYhquecXzT2H@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ5jsIfBzFMPMoF+SQHK7SDRlLsRwcrwQQZW2OsbPADfnNHMsd
	UC/xhykcEdh1y3g1rm7KKnMgUHvhDJaESpleObH9izILK2eVPtVPx9qlCzOspcOIUUwJf1GiInF
	0kL/vppAFyT1avtkSlsO6azGBmaPSp52CBt2G4bExH0RxmVaw5ZeChWfJ4qtwGFe8WTFQ
X-Gm-Gg: AfdE7ckmxKVc4tjeiXCQkXiXCJp9dbA6m6BoZBfJw1ijZjyYeIeninxQ8AruwjnULQq
	dv42po+F5KSg8+cxog6UHNQmm1IS4rZazq+3ln0sgJiISB4Z9k9oFFbIqa9DY7FjjbZpBo9PU6H
	+TQa2fghRy8dafWyz+EZqRH3esRCdWqySXtR2R8PUvajROQYFMhlX2ubCnlDCebeTA2Zyf8zSv/
	xAXCoQK49QcbXy3siWQJeVGJbHm5BCQ6L2QMkTGOS+2/cszJUH/xoQSGDj1/qE72Y79k+loAS1R
	szjShGrx6YmWQ8Ng/7lsjo/YSO3OhJOZ94eJgKErHgjRC3j3K5iKd6E3eX32prPjvPaR5vhcNxo
	1Wtuw3SIXH2GEa3JADp+Kcn6QyTzQVZ11DeC1ghegVuu3yZego3nFOq4Jhg/y4KnQA7BqvRrQNz
	pE5Mf5zw==
X-Received: by 2002:a05:7300:8bac:b0:2f3:3835:2005 with SMTP id 5a478bee46e88-30bca0740cbmr469704eec.6.1781653208286;
        Tue, 16 Jun 2026 16:40:08 -0700 (PDT)
X-Received: by 2002:a05:7300:8bac:b0:2f3:3835:2005 with SMTP id 5a478bee46e88-30bca0740cbmr469694eec.6.1781653207718;
        Tue, 16 Jun 2026 16:40:07 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbbd636fasm2828607eec.22.2026.06.16.16.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:40:07 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:40:03 -0700
Subject: [PATCH 1/3] media: uapi: Introduce new control for video encoder
 ROI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-enc_roi_enable-v1-1-fefcc4e76f33@oss.qualcomm.com>
References: <20260616-enc_roi_enable-v1-0-fefcc4e76f33@oss.qualcomm.com>
In-Reply-To: <20260616-enc_roi_enable-v1-0-fefcc4e76f33@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781653206; l=4210;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=2oVtRuJR5wLvi4drkwXbpmhGqp9pCP+15g4e/nO6WsM=;
 b=N8Uh7A1P8CnzpWV3lV80XN9/yPl4mPYxEFmoI6njVMzRGNJGjT3x2ldG43GyNZTjKDCc7STlJ
 L25rJD/8gRHCl3VjuzxMlt7OGPvNfESwxoRgbj2JmrNYVGk8C4VmUw+
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: 7MCZAM41l_FOwLvUeLfplfC6FfIgu3N6
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a31ded9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1tTGy1hlu4sAMEPmmk4A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 7MCZAM41l_FOwLvUeLfplfC6FfIgu3N6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIzOSBTYWx0ZWRfX+zOEAmf7F79u
 k57Ytm4AwW/5qDIcA8ayMJcT4XBAudPWTK/qDD3/vU+xNW3GOuKVgUvTUuhOEn5sy4jRsVkTKf1
 8nxF9+Yl/jczAKT/QlXmc9ePmaVqgsk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIzOSBTYWx0ZWRfX8wahp6ONBXJc
 F0b+X/bcRXETb227DZdjeL4xW54ulaDo6/5TrbBjD/BxZh+b12xNn4+90cuLHXu/pUr8mQ3HPNo
 MpuH3qo9bt+1ui+Q6x/877YKiRcGDeVd9AfYaRWMpt74Wc/CpSdqF/ppL4+VGIAYErWQNXFvggg
 k7GkzGPWLENGpnMuAN2GQ9/ZTD9AeYDB1yDVDXRQthSfA4ErrYTq6K0vRPCVknlNu5F/LYI7Bcc
 1N7SrQH7FTbybqkduoBrltBaxAPUza4H8mzx605+TNGiLKmWFmcxNxObNp6v6RQ4AJL8Unf8TKv
 7QWhfBQiYLpFW4rupLc0N/ZZQ/Dib1EDE8Vd/ZHeogeRwIt9/Fsl01z3rSoYoX7BlVCjbm1XzXv
 +74pmR9f7DAsg2SNiOr8EeL0Mp2Nqc1uxoU8g6Tw+6mMFZmKhZhgJSIfrPbCh9399dKoY0rrN43
 MNS3ZJS4tamjKtDY39Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606160239
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113485-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deepa.madivalara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:deepa.madivalara@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7F71695BF0

Add custom control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
video encoder Region of Interest to allow applications to specify
different quality levels for specific regions in video frames. Define
V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
codec from the hardware encoder and set the corresponding ROI MB delta_qp
map that adjusts quantization relative to the frame QP's base value.

This enables use cases like prioritizing quality for faces in video
conferencing or important objects in surveillance footage while reducing
bitrate for less critical areas.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 14 ++++++++++++++
 include/media/v4l2-ctrls.h                                |  1 +
 include/uapi/linux/v4l2-controls.h                        |  2 ++
 include/uapi/linux/videodev2.h                            |  3 +++
 4 files changed, 20 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..1995e7335fb29611151c61561df577f2bdac7a48 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1674,6 +1674,20 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (integer)``
+    This custom control is used to set ROI MB map delta_Qp for whole frame.
+    The frame is divided into grid with MB Size returned from querying
+    V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE. Each block is configured with delta_Qp
+    in raster order. The valid range for delta_Qp is encoder dependent.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE (integer)``
+    This read-only control returns the MB Size for ROI MB delta_Qp map.
+    Its valid range depends on encoder supported codec format.
+    Example: For H.264, 16 is returned for 16x16 MB size.
+    For HEVC, 32 is returned for 32x32 MB size.
+    Depending on the size returned, delta_Qp Map is set to the encoder.
+
 .. raw:: latex
 
     \normalsize
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 327976b14d50b73a631e4d2ed95d9f4d146c45ab..a1806ddbc797efa52e83cd3f685ef70d5b5483d2 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -64,6 +64,7 @@ union v4l2_ctrl_ptr {
 	s32 *p_s32;
 	s64 *p_s64;
 	u8 *p_u8;
+	s8 *p_s8;
 	u16 *p_u16;
 	u32 *p_u32;
 	char *p_char;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index affec0ab4781507be761cb791ff737460acf9cb7..00a2c48630bd198faa9a2b833a9aa346d8357555 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -920,6 +920,8 @@ enum v4l2_mpeg_video_av1_level {
 };
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc14a90a230601d8e23b0e13845d34..ce217c41c471042eb9b920532a4102a87c991d5b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1880,6 +1880,7 @@ struct v4l2_ext_control {
 		__s64 value64;
 		char __user *string;
 		__u8 __user *p_u8;
+		__s8 __user *p_s8;
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
 		__s32 __user *p_s32;
@@ -1993,6 +1994,8 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
 	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
 	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
+
+	V4L2_CTRL_TYPE_S8		    = 0x284,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */

-- 
2.34.1


