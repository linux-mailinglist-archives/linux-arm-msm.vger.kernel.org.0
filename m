Return-Path: <linux-arm-msm+bounces-95826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIxjOHLfqmlqXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:06:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77707222485
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ADCD314BB59
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D270F38F22A;
	Fri,  6 Mar 2026 14:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OiOB2Iq1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFz0mJxg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397C42C3254
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805750; cv=none; b=DU53VnQLWKBxn1t8z6vf5Nco/k+LnrxXV3OjS7Nm84Kga410KtvWJASxMKC4b54/j4X5zVrvR0ohYypyspYgg3lFhk5oHJZKoBdU7SV/d3cAHFIOlt7Q87dwtO63RsvzAMq9/tcNX7eCC3tYGBW8BO3ARF65sbX/nntG+uJ0TT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805750; c=relaxed/simple;
	bh=FYMbeMW4jSsAJB2LFMNQzfBE7l5/Ohuoyv0kKwYDuJI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pvoaE/AfXQ50E6HlsED230MdIp8+iKY/JLjeNcIMraCJUXv6/++SxqoEfZUuGaLbJb/x6lKCxTZioqrf0oVL7QnTjNMZPQlrN3lwrJ4647sHX6IeRuwcAKE7R3kAj95oaoeSIJoPShY8FVlyw/es3ic958GgrzOa6SyIVD3swVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OiOB2Iq1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFz0mJxg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbUgo3727682
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 14:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=S1JKZungNW6b7Hm6swONkEL4PdAoFX5sWfi
	9+pn79IU=; b=OiOB2Iq1LD1n1CRRQUmbkFukFoH8Ad4+n+dy+Y/El/z3N9Gn3kD
	ESUp/4uw+t/sGw0EDeCnb49M3ZA6BCR8/23mSRkOeDWkE/75+MZhw3P/fWC890qd
	qGMBanymKtu9kWCcvnLfF4wVS8PO/0imXf4BnBfdVZ7V/ZYnDzN5Jrp0bifDWNmO
	bTn66H+mjIHDtMrosCMA+z+p8QkFJYYA4pQogRc0nMN9yBg9P3XMYGuL8uAFhbh5
	M7H33ZNSsoH84xdj1Zl5p6a3xO41FwzpeSlJfQNtFRu0eCkfUFFJblPuZmWOklF8
	CNGh3OeiGL8mmNIvIahn0wcWItqBN588U7w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp431nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:02:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5fae584a130so63038354137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805746; x=1773410546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S1JKZungNW6b7Hm6swONkEL4PdAoFX5sWfi9+pn79IU=;
        b=VFz0mJxg6cEBb6PQxgdOLN8ym3J0pMnsY61tkGV8KNqBS3TIgIggGDzrswduE7eTkB
         8Zi/eDsWLI5bsU6FJhjuQubdRxNdoeQY3jCdjvrg56ToIYhec8vxYtQdN8t8TQy9PxNp
         L0JGup5nhVGaXw/yhPHbFDyAdhPercCanEJSc8hieJ3DqVNyHE90Ehi/wvqhOrU4E7I+
         SVj3Tl5qbBMkrsfzQQs27PVuJc+lzCqCHgtzl8EZbw0m8O8TAZFdneW3bOqNZrEjB1BV
         IAc/Lcelkx2vmpkaS87A0Iz7oTwRcK1NUrEmw5MsorMQ1WUwdu3/BF/Cv+bfYwHApk5e
         NWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805746; x=1773410546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1JKZungNW6b7Hm6swONkEL4PdAoFX5sWfi9+pn79IU=;
        b=rpaTuaLiFsFkHskdqjat/tZ6emrrgjtG2I9utr25sULwIw+ltvqcvZbcmJiI9Fv0as
         OVzYCFjIy4eZpEXi1hVRu43HzUBcelC15xURfhE4Zu74eeh2hiuubIby5ZzY4IjTgxKt
         uQRNdQIKBOAyugTcE9Luiy1tF1T6v03fBixxmAsMUslXp2nFYtzL054t0+iprXXGVYo+
         9FV4MlF5UAeg51KCPTIzz0VIeBLNkHSLu2jDbqFtwYuqVGtdQxDu7oE2TB24BFMJmi/J
         8Lrj4fqC8QLl6YNQLPUVlx6FisWEtSAJxjn8F0xRlloJdWg040l7y6UlQD3X+S9BYkco
         hliA==
X-Forwarded-Encrypted: i=1; AJvYcCVenfmqByeR36pDxZ4anPmbLSpmOi907xJjE90XyqCGTFspjtrUtu5y+Hcd14yf8xRNplNhcNuWTXE2U8Un@vger.kernel.org
X-Gm-Message-State: AOJu0YxHZ257NEcgNX7Enev59WnutGwHU/MDhxKbZg2y7TNTOA4jdo2W
	IlGspFQL5u21xOCLcuIMbXqwil8fRgHvIugK+EijThh/goubJjyI83ecMz/AaE2CPRMNjvxYMbM
	Yu4rgXfuWaUTrh+reRbayy67fkl1VI8iWd+pMNE2tOr4NuYB71cY/DkOGFXCAEC5k+5Om
X-Gm-Gg: ATEYQzwCDHwCmJ2GcrKrStDyk/B4aw5Jis53DFgd6OocTl9ZvDyhAa5UFHdhaH5bThd
	qzF0Sq5BV7LWFOD4SHZQNMKu6lXEBNmhERGa6SNYV82c+SoIyQqcvZmF4nS+5cxp6Qgk5zVfMN4
	FDxKn3f9nnsbDaXqtT+K3TT3LZ0MiSUzVSyQt5MLyDEtUtJpMnkjwYSpzrC7yqGww8RpjfNGJFo
	uWafQZja7JJXMjzf9Sn489DxMfGmG75mZPiklnP6NGL3HIpHfSWq/Or6P2bsFhtboApsoGzYDHS
	iX0OHhT1V8g2KG5OZxD2nSC8DpMw79PCbYLB2K2hS2B/j1byVWDB2lCso5abPV81bI3IS4V4Jh4
	a0amlDplZjarGIO7+TD9aY4BzoqYiKzER23X5S8i5MsiMknbXgQqqFxL5jQjxkYDop3rrgZC7B7
	bGrE9lFZWT/krNmrVxr8/PosKW+Smddld33mFauKV6EQ==
X-Received: by 2002:a05:6102:442c:b0:5f5:4d37:8118 with SMTP id ada2fe7eead31-5ffe5ed14e1mr876915137.2.1772805745675;
        Fri, 06 Mar 2026 06:02:25 -0800 (PST)
X-Received: by 2002:a05:6102:442c:b0:5f5:4d37:8118 with SMTP id ada2fe7eead31-5ffe5ed14e1mr876807137.2.1772805744910;
        Fri, 06 Mar 2026 06:02:24 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237f2d2bsm20171425e9.4.2026.03.06.06.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:02:24 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 0/5] media: qcom: camss: Add PIX support for CSID/VFE-340
Date: Fri,  6 Mar 2026 15:02:15 +0100
Message-Id: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8XfO3FsnnpEfs-92rBxkYUHjduKmCHXH
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69aade72 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QLs-j7ecQSDb903mvAwA:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNCBTYWx0ZWRfX987i5w2YzDm/
 R2SUl8AJMmjt27jC+O5roEK8uLp0+2Kka9fOX2Lj3dadsKqfiVrp7ozDqDk5N+o3IoJp1hIqJq9
 itoaOnVAsbxpmvtd5LAy+N3ojS2Pt9uRmZb7/87yPqtY3wkC2w+3gWm5AXma2p+R2yp/dg4utT1
 kpVnsEBv+ioGhlCp8xUxXn0gKnDsosiTlgIEd3IMH0O5uvlnR6Kwjm742/dCVCmUuP2XsuOlo3f
 D0SiLa6+EX/hroHJotr2b/Ilerh2rnhC0xqmrm9yEo8T822F9gUaU7mw/Td9ZvhzBbK5Iu+loDY
 FcOziodB5AA1DBHMgm0IIP55d0Lz6FTrtB5231ZPAYl+BQ8153xuXgTb/ia1FDMG5zajrqgh/mU
 aMtjYJ2k6WkRmDvmY3iZA3Q8X+9kVXnigsbwZgo+BjwZCL6nCdJEUyy+viqIxF9Peac6RNn+c4H
 VzkRDNcw43upj2gW7iQ==
X-Proofpoint-GUID: 8XfO3FsnnpEfs-92rBxkYUHjduKmCHXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060134
X-Rspamd-Queue-Id: 77707222485
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95826-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add PIX-path support to the CAMSS pipeline on CSID-340 and VFE-340,
allowing frames to be routed to the VFE PIX interface and exposed
through PIX output devices such as msm_vfe0_pix.

On CM2290/TFE, the PIX interface includes a minimal inline processing
engine, which we will be able to leverage later to export statistics
needed for proper 3A frame processing. This also fixes the PIX path
not being usable on this platform, as PIX routing was previously
unsupported, causing frame capture hangs.

Changes in V3:
- Introduce what PIX is/means in 2/5 as discussed with Dmitry.
- Fix patches format/encoding (proper ASCII)

Changes in V2:
- Fix various typos, extra spaces, and reword commit messages.
- Split the CSID-340 patch into three independent changes.
- Make VC/DT-ID configuration explicit in the CSID/PIX setup.
- Add the csid_vc_iface_map helper to retrieve the interface offset
  from a Virtual Channel (VC).
- Add cropping configuration in the VFE/PIX path so that it
  respects the crop parameters defined in camss-vfe.

Loic Poulain (5):
  media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL
    registers
  media: camss: csid-340: Add VC-to-interface mapping
  media: qcom: camss: csid-340: Enable PIX interface routing
  media: qcom: camss: vfe-340: Proper client handling
  media: qcom: camss: vfe-340: Support for PIX client

 .../platform/qcom/camss/camss-csid-340.c      | 108 ++++++++----
 .../media/platform/qcom/camss/camss-vfe-340.c | 165 +++++++++++++-----
 2 files changed, 196 insertions(+), 77 deletions(-)

-- 
2.34.1


