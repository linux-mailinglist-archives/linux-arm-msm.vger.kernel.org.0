Return-Path: <linux-arm-msm+bounces-94867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPnuDNFspWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:56:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8512D1D7004
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A04AA302F397
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F278135A385;
	Mon,  2 Mar 2026 10:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6pE1hmj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pxt0D/Bh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818FA35A3B5
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448823; cv=none; b=SQDp7hK03lfWhM+A9wfVTjqUFil00O7q6IZSzEQ+/zwNfVWAxydWC3n2SHh1UkzWu3zgBgQGBZrhbuL8mbwqZRG6laUbS2G6BkCHdaF5+cirUMLaxanBTZ5lXKDYFjC+dM9cQgPRrO3of28zbYoK7nllv0dwQHSfDw3KOLaPCMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448823; c=relaxed/simple;
	bh=u0f1UuhyL9/F+8kZ811qd/JH8rakNgMpVUOjIjuIfCA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U6Sh9vQ3Uz22mQ4s/noTpbWxharg7a2G04nDYnKQggKu3/0nY/DuMCpBZ8So+9uGd5/D4XMNt12aHWJO0ymXFU9v4c3QcOhW8g83nwv47gWI9xDSIzzFxcyhBFlNOCXNx4wLsnofljhx4bBci+YRjBoCzmITVWu/HihIbanYRac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6pE1hmj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pxt0D/Bh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226hCpI2504657
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BlHkcSGB0luxkldVVY6qTC
	wKgdbxG0q37Jawr1wo76o=; b=a6pE1hmjUa1LcChzXqPEqQHHgvm0eZMeXL7FFs
	WTUKMNotEXrsPBOS75F5hdo9pnr0NSQcxvhBIv0zn3oEWMD3KQMEPQZ5SYrbjI6U
	5yIiv/ahxfc3NxE2+MQzTSC8Eh14XrNTsvPUgjPbaor43h/b3WlQPyKWg/heivfg
	FAbFpH7oXurfuOd3q+NLy83YTx9NzSaJuUgRqQCgWSk7E0BpF42OgR8BxF1u1Ewr
	pWx2RCorq5/qnFsDIsrb6chHShlK0DWVb/P1q8dwKA5pR2TLmF86+V9ChSJ7Ksgq
	ysjL9jTprWoKzWoy0tb+wixwZeJSKKmlyU3ZEuGi1ggJjbig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5herwp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:53:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70d16d5a9so3092270685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448821; x=1773053621; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BlHkcSGB0luxkldVVY6qTCwKgdbxG0q37Jawr1wo76o=;
        b=Pxt0D/BhdUHYtDYeMCWaB2TVf0Jxhzb9Bg3FrG9JOADAj18attblE8BneZPrB8m1On
         SMF3RVfNA1Bqhy+1BIaylgyo5DigbOaG6IAzcXD+oaYSXYo1JlSfr1nTfjxjMc3KIHsB
         W2UG8XLpt+5n6kTU7T1XD2DARlI1qj7MGpu0erIzYqUxbHPxaNzuyDMtYZMSThZOiiTn
         j5TmX+uwEKAiOj9ngPpRh+Ho+8OzZ2ftj0n7HAcujxhTBtX4xQUjkhKtwWByhMWH4tpK
         VvZt8wc60K+zcc85SFNQjj+a/17JJzdqRXTx+39I/MzvDSx6U7ZDCMC9aTHJggZaiJvt
         PtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448821; x=1773053621;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlHkcSGB0luxkldVVY6qTCwKgdbxG0q37Jawr1wo76o=;
        b=iIFTbHR6XFrdxCZUM3M4rvWcDSwgcfvThB9RZydzKqI+vFK6zI4waBOELgpFpYSJmT
         jZQHsn2Xv3Xy/50nK1zihSyj6HyAUd+ySL2je4lT6uPJSDhNrNzQMVb8AbEcYVWT1sga
         QTZoiom9LTyL5as1ZDe7OHQgl667Z3QVlIoRXU+TDPiC8KX2n0Cc9JM9vpK6zFElacjS
         Ki+3vMn3hVY9EAu2VZ8y7aIJUE04HqqJbZu73H5LhncFeGlpmQrtNnC+6Per50O7R1Kx
         RVzL5Smi+EDH2BH88lUBwOsNkVwg+eVsLqG5sZXfrPBIDDWdWsbV1zFzU0KSgPLqC0WC
         GxiQ==
X-Gm-Message-State: AOJu0YxgYa3wqZE12nZlJta7i6hMCIHiCY8v2Aur4EloxeL/KqX/jSyl
	SOtBy5ro08Oaa9jC6vfQoScS+wFFbc4ceOODDWVR5eTlw/ZcRR4++aR6cnieLgrq1zMhkWaxp3R
	63xRZUfRmIdDYxHtM5AFUft6TIBoD4KGd461l/rdS3VF/9LuuA/8Ejh0JZtB2dPWBfLpu
X-Gm-Gg: ATEYQzxq0wMiBrWwsX2Z2PDDwvOO7Iqgo165zFkW1nAcmZ/0ZSElt5yc4O/5LMczIjF
	7R10EIpnQ3rZhzb34sOjMbT4N9zNJR4qt/KPCAeiKdy0tGyhv43JFUayXZk6ypYliTINl2Q7giA
	YpLay/sNRlFDs5B1cRSJKyie1EyaGblQfgqXL37JjKG6AUMkzRqgPMWWqENT+V9lGrbbN9k1gCn
	eafDE9TRYgezbJNn5HyorvEtpLNZIdQQR4OiNLQrTgIej5+sydk0CplQR0xZGpPOLSCLwr5/1Mg
	iBeebZ0vtKdMC5I+0hP3UD0Xn9vEaqNwFvQ63PIZqr+l/gOKK8sWl1/6pPVavUy74v4XqCq1IpN
	CAk+9Qa5fjTCI9hBUuZZ6nZFSsjZxLA==
X-Received: by 2002:a05:620a:298d:b0:8b2:7777:f662 with SMTP id af79cd13be357-8cbc8e1a5a7mr1383282185a.64.1772448820669;
        Mon, 02 Mar 2026 02:53:40 -0800 (PST)
X-Received: by 2002:a05:620a:298d:b0:8b2:7777:f662 with SMTP id af79cd13be357-8cbc8e1a5a7mr1383279885a.64.1772448820068;
        Mon, 02 Mar 2026 02:53:40 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm8399509f8f.38.2026.03.02.02.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:53:39 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v6 0/6] clk: qcom: Add support for basic clocks providers
 on Eliza SoC
Date: Mon, 02 Mar 2026 12:53:28 +0200
Message-Id: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAChspWkC/3XQ207DMAwG4FeZck2mnA9c8R6Ii8xxWKBboNkqY
 Oq7kw4hSqE3ln7J/mz5Qir2GSu53VxIj0OuuRxbMDcbAvtwfESaY8tEMGEYF4xilz8Cha7Ac6U
 a0SL4yNB60kZeekz57crdP3zlet49IZwmY+rY53oq/ft138Cnvm9a/qYHThk1RiXuJU8O7F2pd
 ft6Dh2Uw2HbCpk2DGJu2IUhmgGA6JV0Ow1uxZA/huBmYchmuJBAB4sy+DVDzY3lHaoZOjKfhIt
 KaL5i6Jnx5x+6GRHAmJgslyD/McZx/ATYmO6N0QEAAA==
X-Change-ID: 20260120-eliza-clocks-5ee7ec9d0e79
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=3721;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=u0f1UuhyL9/F+8kZ811qd/JH8rakNgMpVUOjIjuIfCA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppWwqb4ItyB/8btYEZDQmGmebeXP6B6Gc5evfV
 oqWoOURPG2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVsKgAKCRAbX0TJAJUV
 VhaiD/sH6m/kBZebHEEl1OKfr2Tr1bb0OC8dNDqRundBlMW2iEu1yDvFoxXwROqDpDNEqN8LKnb
 do592lPGC8cqyKtKmXbkGHhJsPxRsdhU3IIyzCtqrd2rat9/gqMr3NxG7SJicnX2xOGktkm61zc
 8yJxprkiac2Y+hMa0zQM0gBotdCLV7769m9yzFhzEN8Ufy9a00BPtAQmfMbnHepCpfY3Jnxujnw
 h+V/s11ZxvGsXF6jAnI/4B6nfT6RSszs8t2M41wKQAeoGPeWpDTBuIgy4Gxg/71z4bi1F7Mq8o+
 1n1aG1/yL6++E5ewpOMak4oVWDpkzZKlxMgtQrnp7or54/J1icGBkftSBIkihoJGusDXy6QdEse
 nsuWkncuPhfjKwdA5ORFkbhuxHvst4lktIVl17OC1d7JBOBv8fMIXoXzP0tFtuDYs2CQoS2bqpP
 YCNlj6blMcnPUdRJIAIKFUkNhIndnUJIVD7EDjOmo9Wisc5gFb97KxQh4c9MHQsNtJLe0p+7Dtu
 0k6sqdZA11z/RlOe6iBdTl+5gAJEYMwVlOSsU290NrYskMGi49NS7CLSZnCcRHTV2imBLu6ps2v
 ResdOJ3U6BINimjvpleuHYpECJfjfv35zTAAtgR5C8C7PJedkYSEC7nw2eeZONctwe/YB7jh02y
 x2S+rKYZ6xv2A7A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a56c35 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_fAS8OA3c_KVdZu2R9EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: u2k0DSTsApyKgpdCv3UWBNfKpXRNN45D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OSBTYWx0ZWRfX8+6MN95kXbHs
 JNO7nt2DoRLLq66GeDXpIHWzuCQN5YbJucaAWHRPvWPbtxnnG/wI7Imd7reE52Y79JeNMHPjjo5
 lIgMoyWpJcoqrH/hPkFxDpQUKFWPQETnjmIkZIrEa7kjeHRVpQ6912hlb829aO1wTwyrpVnC1cc
 yrWsG9gR0Re2rXMk+BTLCtpSgW9s+ZmnBj1SClw49M6Fw8r3Ar5TWPCQy8R2ILqt9CdRMtLuXVh
 rk4EhO0XgAZFWdZkOPFdTsrbNZQR6qqKJoboZP/f2IFQKXEMwv0ynDRNK4Gy+bXINX1prdOF9Py
 ny25ledFHseoH/QHQefTS/IvoslymfeTQCw/qw0b/Fk1S3X/LhhHTmog67l9y+0+yTocoRWBwvJ
 bz3qT77PMYy5gYrpuTrJe/yRT3KkEezQAGBG6e1ktPkTnJRVBxI/i2eQ+N0xS4qB4ja5EjxY/DZ
 PXTnegioWu2p43Iq5mg==
X-Proofpoint-ORIG-GUID: u2k0DSTsApyKgpdCv3UWBNfKpXRNN45D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94867-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8512D1D7004
X-Rspamd-Action: no action

These are the bare minimum clock providers needed in order to
be able to boot to shell and have the rootfs on UFS.

The multimedia-specific clock providers will come later on.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v6:
- Picked up Konrad's R-b tag for the GCC driver patch.
- Picked up Krzysztof's R-b tag for the GCC binding patch.
- Dropped the GCC_CAMERA_HF_AXI_SLP_STG_ARES, GCC_CAMERA_SF_AXI_SLP_STG_ARES,
  GCC_CAMERA_HF_AXI_SEL_SLP_STG_ARES and GCC_CAMERA_SF_AXI_SEL_SLP_STG_ARES 
  from the GCC driver and the bindings header, like Konrad suggested.
- Link to v5: https://patch.msgid.link/20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com

Changes in v5:
- Added force_mem_on for GCC_UFS_PHY_ICE_CORE_CLK.
- Switched PCIe pipe clocks and UFS symbol tx/rx clocks from
  clk_regmap_mux to clk_regmap_phy_mux.
- Dropped the GCC_CAMERA_HF_CLK_EN_SLP_STG, GCC_CAMERA_SF_CLK_EN_SLP_STG,
  GCC_CAMERA_HF_CLK_EN_SEL_SLP_STG and GCC_CAMERA_SF_CLK_EN_SEL_SLP_STG
  from the GCC driver and the bindings header, like Konrad suggested.
- Sorted entries in the Makefile, as suggested by Krzysztof.
- Picked ub Konrad's R-b tag for the RPMh CC driver patch.
- Link to v4: https://patch.msgid.link/20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com

Changes in v4:
- Picked ub Konrad's R-b tag for the TCSR CC driver patch.
- Added the rfclka4 and rfclka5 clocks to RPMh CC as they exist
  in the cmd-db.
- Added the missing HDMI and PCIe1 TCSR bindings IDs.
- Link to v3: https://patch.msgid.link/20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260213
- Picked ub Krzysztof's R-b tags for the TCSRCC and RPMHCC bindings
  patches.
- Picked up Dmitry's R-b tags for the GCC and RPMHCC drivers patches.
- Added missing TCSR PCIe1 and HDMI clocks, as reported by Konrad.
- Fixed the compatible order in GCC bindings patch.
- Link to v2: https://patch.msgid.link/20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260126
- Replaced the all-caps SoC name everywhere
- Created separate patches for each clock controller
- Dropped unused header includes
- Added parents to all TCSR clocks
- Added an explanation to why the Milos GCC bindings schema was reused.
- Link to v1: https://patch.msgid.link/20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com

---
Abel Vesa (1):
      clk: qcom: Add TCSR clock driver for Eliza

Taniya Das (5):
      dt-bindings: clock: qcom: document the Eliza Global Clock Controller
      dt-bindings: clock: qcom: Document the Eliza TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Eliza
      clk: qcom: rpmh: Add support for Eliza rpmh clocks
      clk: qcom: Add support for Global clock controller on Eliza

 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |    9 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   26 +
 drivers/clk/qcom/gcc-eliza.c                       | 3105 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-eliza.c                    |  180 ++
 include/dt-bindings/clock/qcom,eliza-gcc.h         |  210 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h        |   17 +
 10 files changed, 3567 insertions(+), 2 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260120-eliza-clocks-5ee7ec9d0e79

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


