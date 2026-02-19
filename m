Return-Path: <linux-arm-msm+bounces-93417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDEXE/krl2nmvQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 16:27:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB3F160202
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 16:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 42991301286B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C35B3446CA;
	Thu, 19 Feb 2026 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaXP6AgM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMtN5vd2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479C93431E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771514866; cv=none; b=D81QRPjArsEzrHbADHZywEkuAe0MMvhJ5Rht0K8+Q2gMQ7gJyPFO9zuSE3joFwwsmxC7KhGIrrfOVQ+7jiRBswTn1Ne+f+0v7fDeJkVhYcwWuwSGJvzAPM/jXFkJ7N6oz4ZhwmvzM7iCTObJBh6tlwV7ExVfNPl5wdzGs+yPBa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771514866; c=relaxed/simple;
	bh=qMbrkoET4K1dqImjBKG4EMHKmJ0owZNs6aGi++o7ugA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=TBGuBBG7u6PSVgiDJNf8NTmMLAAr/WH2x/8fHbcGH/VXHpEo4zwEu5zZ14PC15HJ0TIJI/lx8EQxttFxd8wxgvCHDxbRP7mx9oFhizcXE2tgOWPtU72cQnd3qLZskI5i7FT3RiQPn8K9nybRAMRBzxetx8SYANZndHZs8aC4MPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaXP6AgM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMtN5vd2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JE4o5p4072775
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l09z2ve0koTesuuRESqYUj
	QgD2VgQ8kmPAtxMpv1804=; b=kaXP6AgM/P/hqe4AwtWL0kOnbrSKTh6C1nR0MS
	5ahv7094tElNfBJUC0ojisgSru3BlRiY2Z0xXj4r4HV8bGgZM+3k7TQ/s90vv33I
	iXIPcMctkSyB/MTdSi1zL+HR2Jm3Cw/L2lAumwEI1yN1Ls50xsyRCMPVTEj98N61
	YVDRklYxnFuyyLWOfFwLCUeobRcaom61r2WrKFO+UzBtaE7/A9wRmsd+5uIjbG2C
	6lPuamko7zJSg/Nld2HdS/WLc4OKx4Liv0zocKAhOm7rhateess1iUyIBELQ5SM4
	dpVq60YzKmNl+NBEfWc7I+V56jhI6Q5a3DwLXlaxeJlrrezw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdtjy1r42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:27:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so116033585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 07:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771514863; x=1772119663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l09z2ve0koTesuuRESqYUjQgD2VgQ8kmPAtxMpv1804=;
        b=IMtN5vd28ZVUDimJqjINQfoxLrHEgwgvTfwDUaqOp64cy936cw65RQDTvrduGtSWCc
         Eo1CryYYOQ4Qhux2M3dp2HcX0oQvTq3Jw6mk1SoFdMTPd4rcibsOTyOsYX8lSlP2wHCP
         SDGp6w5Y0SZSNhrgdRiJQgbjF1y7tjLgW0dp1b6MDWGgjF3l5TrJL37+klWdl4VC7zrN
         9y/FhzbEGlUehyBnwt37TX2nFE8vZrJpM46haZ77zJ5+pXfn7PsPZ/LQ1v2vR+Becqz5
         wSLe280fRDvg5brzHXTynydsv0T/mpkv0PXY3YzW5x2xCdGOL5nhWYSx7A+l1dyCN5wo
         UOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771514863; x=1772119663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l09z2ve0koTesuuRESqYUjQgD2VgQ8kmPAtxMpv1804=;
        b=N7Zo/YLodTgO76xSE3fciC8LcITDbexiSd0y68NwCK8/lnoHjDxSJfosED5FhXZYu2
         fSIi1aTaoJ2Y+bSB/OlkqwqbwfgOhl+SHxNwQ7NPyV6yq90VLr3lNGal02c/WugiTBOq
         pdkz2XmwGmE072bx6jgmgMd5KOK5FGD70nODo/2OoFxt/omppBO3DHXU33Bd8DonbZG2
         j1p3RS/OJP/G82qlitBB5Nw6PEPTB1E8JxuGyU4xvLQSqyRW2HQUAKxfmC//0+oUg96Z
         /D5kCTCb0h8/AEBF6OjRyhsoJhVpmfwER+MmtYHUgH8MMuvVATRmgg+WPV/9lZyGEa8X
         t1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ7YwD9afvdcAOF4aELoXXjBPsFlDjtmOUZt9iPTHwXni8z7jokqT82VEkFBMzaeQhAh+8lozshs0NXwsT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzei54E0u92vnub5QSkHej4E2ig9zB5P2vGumqsCv5+x9r+FMmf
	uovXiFy70OiSz858Rha2/A4y5WfiRLQqCR1juKaJPF7FE83Mlx88km9Rw4VQgALVH9B5oaqqhW3
	49p/iwaldHsoslzGYIWtmvXAUuQKdZ3aUv6t4iSSYP9irl1QK+uvgtir71O7ONkuOT/+h
X-Gm-Gg: AZuq6aKOeNmtsTpjGbJolRjvGnImfr5dP1Y4PfwJVI4aYs0L1GS2R7W4ZhjuUzB+254
	hUGs4n+m+c2OPREUrzusYD+zmUX5hc6TMZnhJmn1+quOvRgnbGoXNby6SL9RSWxVxdzmZABDE7P
	lHp/97Y1/VcSYe4xyzP79Rfa23mYqQpmvWUC5NqK6Q2lpFlu6ct5rkxnxXP66TQcBbVfZtfdHYF
	DZ7Grn+iXNpRzsIPDnlEgHOVIkDlTgdmFGb0gpNqinZYKjBceKz7wNmuD8+/slZqxKno4LA2bw+
	pzkfc0tTnDdE49HrAI0G5gUpT+42Vq/4BBvGdJPyqDUt3dThgwoW5CAijiQygWCUl/FrYmlyIKX
	0fDyqhfM64Dwk6+vdmD2vWtue1UXsIlBXQZLO1wLfURicbCTFEd8fzaLMxNrLbhBqraII+sZj1x
	wB48mLnM6tN+Dw
X-Received: by 2002:a05:620a:4724:b0:80e:3af7:7a0c with SMTP id af79cd13be357-8cb740a697dmr635805085a.43.1771514862621;
        Thu, 19 Feb 2026 07:27:42 -0800 (PST)
X-Received: by 2002:a05:620a:4724:b0:80e:3af7:7a0c with SMTP id af79cd13be357-8cb740a697dmr635800885a.43.1771514862129;
        Thu, 19 Feb 2026 07:27:42 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:38c9:810e:d893:92d5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0ce73fsm2241024785a.11.2026.02.19.07.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 07:27:41 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: =?y?q?=5BPATCH=200/3=5D=20media=3A=20qcom=3A=20camss=3A=20Add=20PIX=20support=20for=20CSID/VFE=E2=80=91340?=
Date: Thu, 19 Feb 2026 16:27:34 +0100
Message-Id: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0MCBTYWx0ZWRfXw86E8gRxJ9/P
 D1KtevVxGH5tpC0FK7ttXYcsrhWWyj56C+yjUdGN73eK4l4PqVL/IAF8msned65goosLmbyPCyd
 6yS4KiWjBTO6ug5koX9d7oDbhepwFHF8aMiR0uc+rEVA2wFHe9Qh8IFrKg/LK/k4jvJJC+QFYBF
 1kVQrTHBOrt7aU+kMeWKYVILwDX/ZqGFkmeafamhzX+pityupBtXvkKNogAMOsGS1wDsgig+vdz
 ksE28lWMl3uWCQJ6Og+5SyzfN4LB1BmzvP4F7d8rAGIaiXhqPF/5ts++4ls/9uHgVlb5Gj7h7eL
 DqO6PMrC+J9mMrRF3X9OGznPyWa8q1BhYgq0ci6PltOQ85tHXlZgkOZwHBAVPM+XDbG+WpVUR5P
 XfpPo78T/1DZxYx2mhBVrg72jUbGStTjmuFi+LzhPgT7qZ0OKF41aBfk4wbzatqR3pthDHhOX/c
 jwZEDPlDCHzJsULhTYA==
X-Proofpoint-GUID: 7bgk4QyoT4hUURpgApA380NCHvWN2iC2
X-Authority-Analysis: v=2.4 cv=FoUIPmrq c=1 sm=1 tr=0 ts=69972bf0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=qf4gfuq51q0A:10
 a=HzLeVaNsDn8A:10 a=5i0wh9Mj5QkA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=C58lORqpyhk_i94gvmQA:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 7bgk4QyoT4hUURpgApA380NCHvWN2iC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-93417-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DEB3F160202
X-Rspamd-Action: no action

Add PIX‑path support to the CAMSS pipeline on CSID‑340 and
VFE‑340, allowing frame capture through the VFE PIX video
device like msm_vfe0_pix.

PIX capture has been validated on Agatti / Arduino‑Uno‑Q using an
IMX219 sensor:
media-ctl -d /dev/media0 \
  -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":4->"msm_vfe0_pix":0[1]'
media-ctl -d /dev/media0 -V '"imx219 2-0010":0[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":4[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB10_1X10/640x480 field:none]'

yavta -B capture-mplane --capture=30 -n 3 -f SRGGB10P -s 640x480 /dev/video3
[...]

Loic Poulain (3):
  media: qcom: camss: vfe-340: Proper client handling
  media: qcom: camss: csid-340: Enable PIX path support
  media: qcom: camss: vfe-340: Support for PIX client

 .../platform/qcom/camss/camss-csid-340.c      |  85 +++++++----
 .../media/platform/qcom/camss/camss-vfe-340.c | 142 ++++++++++++------
 2 files changed, 153 insertions(+), 74 deletions(-)

-- 
2.34.1


