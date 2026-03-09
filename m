Return-Path: <linux-arm-msm+bounces-96190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK0ZIRmcrmk7GwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:08:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02792236C89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8A2C3046F3C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9763B3806A5;
	Mon,  9 Mar 2026 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YpTvnMV6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q8C+81WK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B110738B7DB
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050804; cv=none; b=FmbZ6BKTisctU6LxZLRF9Qhy8n4zt23qsFaaPo5nQsmBhuugLcszu2S2XQlx5CDGBGYCqa5T1vraKUW4E97kQYMozVd2AQ3Hei0d0CZ54/N4anuYRwfxSQ0n0/RvyvPJv8Ug4jFC151CK775nGZ5IDftvP4/PnpeOE9iucXTUzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050804; c=relaxed/simple;
	bh=rHJsocNfNwVm2MjdpQ8NBJ8I/rjbG3Qcpok1Ai/CgR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HI0dKVfOVaMaH+fOOW6FROiB8LnSLzv0fT3wCwSswrA5WlHAr1loDEqWQQML+QgkeSPzAx0xo9bG4Oqz/ChUqJtLDxHLAHn/nBx45FLuuZ+Xj6B9q10SQIUYfqOtyqcGbw+adftjJVfM16JxKHZ7vqzkafo7om86zcqpWlCSmrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YpTvnMV6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q8C+81WK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297mTd62798716
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 10:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7IdqWoT+UUiyloygT8MTrbnVWYlg2uxJ7b2MUvC7aI8=; b=YpTvnMV6lIqgAEIx
	SJTWvJDMNpxzXe1HwB/Hbtqcw1tCYlR2qAf/1QPE2FUJRVmnqO+FzM9vIFCZd9/d
	lz/qlunm8rHZPd0d9eN5+8RguT0Puf1T90BzmP0EClA86MksqYNltvsoPWTmbdog
	Y0F4ahZG3PF4BU00y2lv6Hh/VRl5HMwmzpginHlmuDjrvz5VeFCv6geI6dfOurDE
	VVEUtNRzAiCawdFzjnTFG6CINpJlUMBpzspAsFt3grWNYnXyNr1zLHiVhZKddwOJ
	Df9VSvZh7d8a/oyE+kMVKPuqTGoH53ECptbTk+U3MWQ2BB6VvFSgCsV+bPLUsE4p
	iiMZdg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qew8uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:06:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd773dd409so165282985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 03:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773050801; x=1773655601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IdqWoT+UUiyloygT8MTrbnVWYlg2uxJ7b2MUvC7aI8=;
        b=Q8C+81WKytlKEhn0gW8sK7H2kY0j4olPlsA3itjH1urp2A+qkn3IfOqVgryzvWUv86
         oFDgfZI5/tCj4JYQKy/XZn13wCRVzieFoMtMzMClDxdK4aQkjgeXEiOknaKc+KXS0WU4
         dRL5O8vUAIa3xgKiw0DCnQdYHNLW9qZNDa3gAOviBWTzdfCu26gVLXWKXRYrbnzn3SBP
         e7r95b109Br6Pmt4CrwIBxC4kyss/flstXG6+nAmEIEs/Dz5OnpJaDHyRyrz5xwPIKj4
         Nx7D6YKq7nb2MSxTPUJFRT6pTgtf+wEmgtnUBassNKSN079eELo4y7xZAAkcmClC+irV
         rwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050801; x=1773655601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7IdqWoT+UUiyloygT8MTrbnVWYlg2uxJ7b2MUvC7aI8=;
        b=HT4n/dCfTdNkt2iYzwmMEMkb7UI1YfQYeKJJyDPuwvIK9FZ/hL3gOKU4MPE9NG3Htg
         tN9CwDGVaEAAwpR4loa+9/mr9h/v+YjAqf+yJ72CEMXs+NJpCi6lcFC3sJY1an/F/6IU
         5L6CW3deX+4CDiec8wvQBOwaCJmCRDZHqjOHOSL4xeac2OcC9esF0uZ58QlWbMbnk4c/
         rvCOyPM+a2R9Vja06A7zlyHz7HCBQSMG6beaprpMb8IGfDKFjyQcuQ5PVzUaND7KVFtW
         IR0iQMGh+ywPeJ/qmTprY82XZMUFPBs6laKqlSDMZ77TpVDiAEIQ9IEvBtxsgUBBy2xJ
         5OSw==
X-Forwarded-Encrypted: i=1; AJvYcCUuSwAnnUBybu/v06x3/RDyuT534bYsyuRM7fmLuz8FlQ/ttKZw7BTQSi5N23STOk/pxU5trUWREUzpTApR@vger.kernel.org
X-Gm-Message-State: AOJu0YyEVhUO1aQNgGEKrMuXRlFdD+XuSm/rHF+rR8N6c92QUahb3zi1
	IH62ioHDr9FdlrqIcBHucXoJQxfp6bqvLWw4vxEGbPPZVr3JJDubzTn3yFyxHt5YJPNJoGagwPf
	NeUAWyvzOrWYpcIopH3pFvkeCIbFqzH2hsuVB25o916FuOci2XhJpBJyrZLcbrKi/SBei
X-Gm-Gg: ATEYQzyKWg8LRKqO0IbLFS9wXRCsFBQDmeylKkq7WMX4ovlRypKDM2N4y33f5YMTm5A
	fa7zNIs/wjFQ072aow2p+uKKJ1co5X6Ih5FwuXyOvOxKcyNm4Mi5hgGnfX7Uuvwp63lVlkWmwZs
	kwg0qUgi4FvlWeWGoe3XBIZOm9oHlRNqLoty96U5pU8nwB0q/nroFUB4v6OV1Mn/Hl0qWqg516F
	R6aeIY45ezzMSQKyvMQiDL35Aub/VFTboOCoDeRwl0Lctz5GjESdrqgK9m6+UlJIcy0EQg4QOSU
	Zua+ciAIU6XjZZ945Kw9G6TvKg8vVpXs8QJBdwlyaxq1A+Dkx8qEOLD1AIgAkV4yMr9ltWT8Il1
	FnI0Mf1uWnLFd1uDFviwrW3BhHRgZjw==
X-Received: by 2002:a05:620a:29d5:b0:8cd:8569:b951 with SMTP id af79cd13be357-8cd8569bd64mr411449285a.65.1773050800967;
        Mon, 09 Mar 2026 03:06:40 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:8cd:8569:b951 with SMTP id af79cd13be357-8cd8569bd64mr411445985a.65.1773050800378;
        Mon, 09 Mar 2026 03:06:40 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d973sm24114052f8f.3.2026.03.09.03.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:06:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 12:06:18 +0200
Subject: [PATCH 2/3] clk: qcom: gcc-glymur: Enable runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-glymur-fix-gcc-cx-scaling-v1-2-f682c82f116f@oss.qualcomm.com>
References: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rHJsocNfNwVm2MjdpQ8NBJ8I/rjbG3Qcpok1Ai/CgR0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprpunORV/wRqjCs9UlfyC8/UweFYbhuxql0nwU
 J0JqDdLzuqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa6bpwAKCRAbX0TJAJUV
 VkH7D/9xhCrfEo99R3fPf4L3d9EnsDPj7kcbFgvFpiLgDqkfVV650l/1rEwYHdm35oCHWckW/Lx
 lxTNYVdrfoDBkwagDxA1X5Dd3LS5IGr9FNzM7+5i4Nb7woVMuinu70LIeydcNUnaaLnk43uRxph
 khq67kdtWOIMb+4kzbA04x/hktAdb4hJmzsuv1mKcLBMTgHhj23S/eOoRCYJStLkw+qV17aF1+G
 ugoiUFCDn+NARU0CPGYlk024LWVk24YPqj5v5M69epdqhKjD6CqHGUop6wYsblUluoEswDqeeCE
 OAlK5epKF7YIlLM4F3EiiQAihWSOtkxLhqlgPNUJcOm12pBwtVgzsQE1GXoPSrn43fpeRg3aLmu
 PVCSutGIVrIvNMXS6N3CiI0uxStvbaeh7VSSW0zWkL+ckqg0eYkcYFHa/rlCXdfoiRnVsa+YYEb
 6KnX6iov8z+bi44i8jPkhShshixQCc6CZLZLgw69pjnEUx+CCt2hSIvQiLNUhuZsKIYa7RDZN3m
 t3hIAT9x0OMv4ZEXXWjUO6gYxnLaxGJJB5rqv4jL34/5mMTHRuTP3wTHO72M+YA765JBT48M8CS
 Nf/xEg5blU8ED4Z6UunYk9lSSgX+GkwnsLjtE0YBWt+Hl6wiZjF50waVaDjUQb5qgTXvr/ATF8B
 dcvPjnzvfkVphrw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: nE_O3mfK5R8j3V0mE4923Ma1bGej9Q8g
X-Proofpoint-GUID: nE_O3mfK5R8j3V0mE4923Ma1bGej9Q8g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MyBTYWx0ZWRfX/L8atjf1x4Wd
 Ic57QNIbcIYAgTNL6etTNmJ8AGwyvRfPhHuRqXESZcgWMPuJI9lwa0MkpR8KSSEUgV4FgemYt0p
 c8cQhpYzOZViafqkZI8jQizwLO6E3Wz15B8JjNNQM15r03I9bTXqYVvQKNqbnNSmVqQVag8Ovc7
 6JzFoesqdxeJfl8GdaWO7jeiCe4i77/I8YkcN2fMhEQNnN5tZfqI6x3M7xR30iQ4Id6Us9kzDxJ
 PEYZb4u5ZVen071CmrfVjYiLS1JfQEXR5MACxqekaT7HL76lGMuiKOwIsfRGtMULdFrKZBVFZPl
 1oDR9fSq3MlVeF13GqoWRNSYvpZB89NDFTUqP7TwD03WLqmZEPKYO62lzvm2MxQCqUSeXN3DXVa
 VWJ2B62eyksNxqMON8cv5gsXPl37uUw/6rskxVQ7RRJKK5u9hqfz48Q4+4Q5ggnGbKDe0nTIS/V
 6Z9c7l+lJl6bbnvDMlQ==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69ae9bb2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Q0q0LOKJFIdqpUU2TdAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090093
X-Rspamd-Queue-Id: 02792236C89
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-96190-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.936];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

It has been concluded off-list that the controller needs to scale the RPMh
CX power domain, otherwise some of the subsystems might crash or be
unstable. So adding the RPMh CX power domain to the controller will result
in all GDSCs being parented by CX. This way, the vote from the consumers
of each GDSC will trickle all the way to CX.

So since there is a power domain attached to the controller, enable
runtime PM.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 0f3981252a68..7cb5076a460f 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8578,6 +8578,7 @@ static const struct qcom_cc_desc gcc_glymur_desc = {
 	.num_resets = ARRAY_SIZE(gcc_glymur_resets),
 	.gdscs = gcc_glymur_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_glymur_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_glymur_driver_data,
 };
 

-- 
2.48.1


