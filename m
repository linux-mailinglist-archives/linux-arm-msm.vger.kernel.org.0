Return-Path: <linux-arm-msm+bounces-97314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKcXLcmus2lYZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:29:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F4E27E1E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55A1831731DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 06:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB67352C39;
	Fri, 13 Mar 2026 06:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1olrOMq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqkAvB+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F50D34DB57
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773382529; cv=none; b=p9/d7pRoGq/lzetYTihuCGp6lKrkTkHer/hUsRIZT13vwM1Xi/9W7aC23F4EtSBB1xYMZ6EDKMX86z4xdSstkrC1o0rLB2FI396opwEUxECBJQHmWfy8lIQRmqxUBPQpmQLim85Je6HtgUhSWPfy1Js7CtdNvZ6D2D0TVI4dCiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773382529; c=relaxed/simple;
	bh=7NxeY4CuyW2/3O/G0Uqzvu1qGnXqz75oS+X4rDC+nzw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VLJc5bOVwDzP3ZrY/IJM2f4DaB//7fAOyTuBB6uuM/5odZgJNBGUsFRyuCZa5bhQ3JgKr/X0Vj5MzPNOGWaxTWBvGMchJhdCvDPJ3Ok8H8CVVEkKTE6Pxh7vbzPKA/IEB79v/fk+1khHv2wecZcRIf076zr//E5lGYE9Z+KU5R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1olrOMq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqkAvB+c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tbMB1176366
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aHRQhUJOikkV4EKm9nXImd
	ELzGuUaL6lHgfb2RWAPMs=; b=G1olrOMq4Mn4M6J8Fqij+Qm7IaX85I4/SX2IOU
	pFfH8PCe66DIZNhRBIKk46HwMLemPuFMSica4XDEZHprGsjMcQBnHv9/omOFyRXg
	9293bwFwTaVFjJvHmChsyq4pwnaXv3OW4YsB4hHrGVHM5Fgz+60XZuWWqDa42iff
	RCHON8AkFT+D4hIDdvC8+PdPoKVi2CPF7IBCjWM39/izTkIX48WAXuXL4wS6X5+t
	I37FEOQj84EyLcSxbOdMa4tK117iXFQeQKEB7IRHnWT/CI/L5KjAgUNZYwzl8Y8+
	cXF9IIDlR9hvCY1+FK3UTHWrpNaLhUR+5OPYuhK/HEl5Xr8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvqc5bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:15:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd773dd409so287013785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 23:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773382526; x=1773987326; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aHRQhUJOikkV4EKm9nXImdELzGuUaL6lHgfb2RWAPMs=;
        b=hqkAvB+cTSjXF+Y2BafiGIxZ9xOsBIBshqkdhvgsBuGDsEYgs/whAMD9qOeyHUQt6m
         FT8dO79QhBIA0M+PxubA8r3Js1MQPOy6nLKDmwECTbAPE+DaxzRt/qz4KZxsZ0mJl0I9
         iR4FnciN7c0fRgefXukCxEfzujYgHjtznrodabSdSzAIie5GS7qtOn0HeyHpOiXeYWpW
         a09Ayfk7rX7mzZXHm1W32yUs2uHlFLlgVeQdpXphAOU4z/93tWytqPcyyeviNeAZ3eJ4
         rgOlgeoUVEc8lM3vcTpyzlxFqRe1bCq7Kph/3kSEIh1gNqOENFw3kI8ngEmgGm9hBRqO
         eQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773382526; x=1773987326;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHRQhUJOikkV4EKm9nXImdELzGuUaL6lHgfb2RWAPMs=;
        b=DGpBquT/3HkL53WyrMyQ43ZPNRzu07h7Y6lfW0yxC91OSWpBrPRQ3lZDLqItkXEz4r
         oikdpiebo9vPcQ09cGat9uyMKIMTdYMrQMUBxZqqfylvhqyzBqvqSGlCq2EyWf1/ZkfL
         o5ZQceuhSscQFAbwdXeVm5J5wXzDgUlkYyG8XvQPTKMEKlTumByI5wmH46hp4txN3RaZ
         cExhNeWI5U83joqqCTrHhzhLO+l/SGCI7RP8zf37zQzpI5JbBrA4CqsOR0cQ0D6tLQXS
         FifPxQY/P70imXEw1TqrmR5V7nni/VSltWLhUJ18eqGmJansnDtw8q0tMp4LeL/i651J
         rkpA==
X-Forwarded-Encrypted: i=1; AJvYcCVl0b2KvUStCLzIm0rvKONdjv+lgCk6Mh4IHKv1SAD5zQPb3msHF7nzANi8nxP765KqjYQiNexa8Lz95a8f@vger.kernel.org
X-Gm-Message-State: AOJu0YyW/4i0YRbc+oW/iMZKMlneWEzdZwL8WEjGivBqJokmM8/Z5SwJ
	BiUHKZ3wm3f0tM5/fUySIb9TQi4TYIYxKNUNkR01ZsuzX1LkseF1htqRANg0t0Oj66GN4YHtlX+
	lrKGN7g6Tjsz7SYTqY99XiiXwDSCOxhzPUV3Jx4eYQ4YzcB39cfye1R5evG0RMLWE2Qdj
X-Gm-Gg: ATEYQzytrTBUbr61m2cutI6CCFnh3pbToO8JZY4zPAdox5qR/wkygSVP+P8XOhfPoVS
	4NWJSYTQagGjUjFSpS+GHUV8PIxNOIV/EocUPJwbS1hG/+sfEIWUIyQOiMGrelL5qp01CtJqRHy
	wBVi7he/zG1qLHMEvi/La3r2Wx19DZ8vBXe+/9uWr4B54m/aik3QYXvVB8PZ2gyIX5zz6G4RAfY
	rR9tb1j8+WN8ZryFkpXxetXCAxLjAwmTym1ESbM4q61lCPYM6Nc5zlLXXg8oOxctkpl8wlprM6V
	8C//RpB+wB9cpllBNFvfHJY7EIt+HMGTzxyNnictDBL94XjYbMPArrN483tlkuywHocSOZwZeQ/
	25340mcD2PC6rgFIdP6u2r+CLxRua/d53EDx2g6yku7uGQKD6mnu1eL1dtgKxgigTWJLGxVtrq/
	wU1rU0A9kufmvs
X-Received: by 2002:a05:620a:19a3:b0:8cd:9322:7c4f with SMTP id af79cd13be357-8cdb59eb359mr298796985a.1.1773382525962;
        Thu, 12 Mar 2026 23:15:25 -0700 (PDT)
X-Received: by 2002:a05:620a:19a3:b0:8cd:9322:7c4f with SMTP id af79cd13be357-8cdb59eb359mr298795385a.1.1773382525463;
        Thu, 12 Mar 2026 23:15:25 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fc09e4sm502265185a.3.2026.03.12.23.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:15:24 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v9 0/3] media: qcom: camss: Add camss TPG support for
 multiple targets
Date: Fri, 13 Mar 2026 14:15:03 +0800
Message-Id: <20260313-camss_tpg-v9-0-b9095de6525b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGers2kC/3XQUQvCIBAH8K8SPmeotznXU98jItS5EtpcuqQY+
 +7ZVlRQLwf/4/hxdwMKxlsT0HoxIG+iDda1KZTLBdJH2R4MtlXKiBGWU8Y41rIJYd93B6wYSCi
 FUjyXKM133tT2OlnbXcpHG3rnbxMd6aM7K5RmH0rkmGAQFVRlrQxAuXEhrM4XedKuaVapoAcWi
 zfwvUYsEqC1yoEXkAmS/wHEC+CEUvgERAJqybSigktCxQ9gnO/z5nxJL+qfR47jHW7sgQNAAQA
 A
X-Change-ID: 20251226-camss_tpg-b23a398bb65a
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773382521; l=4875;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=7NxeY4CuyW2/3O/G0Uqzvu1qGnXqz75oS+X4rDC+nzw=;
 b=tXD1RFAjKvEzHlhPD3/HDfYDZc9zNyAFTSW+ZzTQlUBohWT2hVthI2X2GfMxne7aEBQQ/WHdR
 QfsCGtmK2ZSBpiDvzW+3o3PimGNhBHekz13wUDAH/oqJ0fDNN43sOcJ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: -xjRNwBAup7J9dRFu3GwgHXIbyEpdIMy
X-Proofpoint-GUID: -xjRNwBAup7J9dRFu3GwgHXIbyEpdIMy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA0OCBTYWx0ZWRfX55ZyvC+fUbcx
 tDMxQI9gFER+zUjHFRbTmJ7z3mFwArgjbLCoggW/3Z8PvL7bLeWXk4fAIums3V2JTuNX8d1h9Yc
 QN0AwtuM0NqInqZv29nbMhNFKFPJT94pWpxAo1C7kC4LYzcp+IGO8UkHJ3krc5kodeROfMhMs8W
 Yk5U60yt0RKICDkdnOo1doBRNHqTduT/xk1k5aJkFsiDQiVQvxOel58rjY6kYZlKQxtaoHTD3fo
 LpZS6aqFEHTROQ92+oIfSyMg46CT+gR3hmSuon+XeTIEisth3yR2ft2jwmhf7/fCiw4opSXuNIC
 yWat6vsP/p8pgBcmzPRPo/KMgS4317+l6vLOM1SLP/EU8PRKTKaBMXc8Te0MJatfXd8FJfmNvCI
 JrR1H0icyMs+YLUP0q+y4KmAXd0vKGD7YyW9ITW2uSTo4tfyuPJ90gQ7HKKcbMtUx9jAWRglKhC
 rGt1vD+OXrq5RUlLDXw==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b3ab7f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=9YuegPnT3h674dkZU1QA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130048
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-97314-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64F4E27E1E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds driver changes to bring up the TPG interfaces
in LeMans, Monaco, Hamoa.

Have tested this on LeMans EVK board and qcs8300-ride board and Hamoa
EVK board with 'Test Pattern Generator' and sensor.
Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY
and sensor.

Tested with following commands:
- media-ctl --reset
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev1 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video2
  --capture=7

Changes in v9:
- Fix typo: rename TPG_GUP_ID to TPG_GRP_ID and CSIPHY_GUP_ID
  to CSIPHY_GRP_ID.
- Replace DATA_TYPE_RAW_*BIT with MIPI_CSI2_DT_RAW* in format table.
- Simplify camss-tpg.c: remove kernel-doc comments, TPG now has only
  one source pad.
- Rename CSI2_RX_CFG0_TPG_NUM_EN/SEL to CSI2_RX_CFG0_TPG_MUX_EN/SEL
  and use if-else with phy_num_sel as they are mutually exclusive.
- Add TPG mode validity check when tpg_linked is true.
- Refactor tpg_stream_on() to use MSM_TPG_ACTIVE_VC/DT constants.
- Make tpg_stream_off() reuse tpg_reset().
- Rename TPG_V2_* macros to TPG_V2_0_* for better readability.
- Add register section comments in camss-tpg-gen1.c to segregate
  global, VC-based and DT-based registers.
- Clean up resource tables: remove vc_cnt, camnoc_rt_axi clock and
  interrupt entries.
- Sort Makefile entries in alphabetical order.
- Link to v8: https://lore.kernel.org/r/20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com

Changes in v8:
- Fix error bit operation. -- Bryan
- Add tpg link check for tpg enable/disable in csid node stream on.
- Link to v7: https://lore.kernel.org/r/20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com

Changes in V7:
- Add TPG support for Hamoa
- Add differentiation of register bitfields based on hardware version number.
- Fix the null pointer issue when TPG clock is 0.
- Correct the clock dependency for TPG.
- Link to V6: https://lore.kernel.org/all/20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com/

Changes in V6:
- Addressed comments from Bryan and Konrad.
- Add exception handling for the streamon format.
- Link to V5: https://lore.kernel.org/all/20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com/

Changes in V5:
- Modify the commit message and change the chip names to LeMans and Monaco.
- Add the header file to resolve the compilation error.
- Remove the definition where tpg_num is 0.
- Link to v4: https://lore.kernel.org/all/20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com/

Changes in V4:
- Rebase changes
- Use GENMASK to define bit fields and avoid using tabs. Use FIELD_PREP and FIELD_GET uniformly to access bit fields.
- Link to V3: https://lore.kernel.org/all/20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com/

Changes in V3:
- Change the payload mode string
- Change the method for setting the TPG clock rate
- Remove the TPG IRQ
- Format correction
- Remove unused variables
- Merge functions and eliminate redundancy
- Modify the register write method
- Change TPG matching method to use grp_id
- Encapsulate magic numbers as macros
- Link to V2: https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/

Changes in V2:
- rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
- Link to V1: https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/

---
Wenmeng Liu (3):
      media: qcom: camss: Add common TPG support
      media: qcom: camss: Add link support for TPG
      media: qcom: camss: tpg: Add TPG support for multiple targets

 drivers/media/platform/qcom/camss/Makefile         |  12 +-
 drivers/media/platform/qcom/camss/camss-csid-680.c |  14 +-
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  14 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |  45 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 231 +++++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 519 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 118 +++++
 drivers/media/platform/qcom/camss/camss.c          | 172 ++++++-
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 12 files changed, 1109 insertions(+), 25 deletions(-)
---
base-commit: 41703b3a8dbdb22e278a634463fd9fc268a81102
change-id: 20251226-camss_tpg-b23a398bb65a

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


