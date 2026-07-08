Return-Path: <linux-arm-msm+bounces-117608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vkqBEzY7TmqmJQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:57:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 054A872613F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:57:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XrhMBcZW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a3OQPlqI;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117608-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117608-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C7FFA30117BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 11:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5C943787E;
	Wed,  8 Jul 2026 11:57:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21591437843
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 11:57:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511849; cv=none; b=nr8WKu+RYJHhOHayH5TKsD7W3mptENQkS+w0Zz6y2UuwnHS7KiC/3zbCyXjT+ChXFIy8ACqR+2pSE273dK9BlAH1aU89f/J1m39rGAiVuztdZrE4b+IH6JmeubSY6yOfZ4ZIscuSVf3Xl3nWs699J5qNRPw/fELXbYi1bxfPX9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511849; c=relaxed/simple;
	bh=FUXzDx/MqiII8ZYGHiC1f7+FAeVodk7UbwWT+31SNcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NC/RpxiyGVHybYS8ZjirTZAX6sJzpGz+u2OHIdENS0hojIlzV6mZShhzdY0M7xPEqcsiZKZlX1d9neKeTodUpBItvRlr1MW+Bjsclk9UjNVjS1sgmpDu7euueiuxdJhUodpyQ2vm6Uoqrpt31dMujy4oPRbkGrX2T51ODXI1dxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrhMBcZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3OQPlqI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BSlCC2675401
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 11:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hHdBgQ4YRaAM8+nMh8X4NW
	ZFsOQZElrCph3RwF75yXo=; b=XrhMBcZWhz8SnPajJmP+ziafF3kUG/fBpaGnuz
	aSuvEQG9pS8Xu6R90h4OXf9y0JN6I/8HPSxHvTOuwuLk9vZMU/YaWx5HIq2GOm4m
	Ayzi3qKDei0Nnicu2TIi2YbbU6GuXCKrtwZed69m8qS8K8Rgu/7gkc2OOtFfAtL6
	egWEfY3z8X4T1LRKNG6noMxgIGClYDK1ua10fH1GtKKsb/Z+EBvOuaoGgE3vncnp
	IJRL0WEf+2bWPz1OBSou74sfL/QNHHmESe4gK+tpIbevn5JgNrZfrRa1YsBysL2q
	uZfdmUqY7TxQWNqAI8vAUERsh6Z5bleE15sFM5YoevvPxTZw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hhgf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:57:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92aea0d801dso73576485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 04:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783511845; x=1784116645; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hHdBgQ4YRaAM8+nMh8X4NWZFsOQZElrCph3RwF75yXo=;
        b=a3OQPlqIAdQHh7utFPZOndNzI/mzD4cmCHHkaFZrjAeTUG+sjQL8eysVIsI89WUtqu
         OQD2tt1LUBBxEvoTG4xJmDwwIiFja0EPaEkJlnoDdFQOmG/gdqypyWOekZHJfmwL/FUL
         xKGtFe6Q7MKpP9wWruR7rT7/IfheWlfvOdQtrzBJlQ/CmV0P2i9yjjQ5qNDFsd2Z3Kyo
         r9N5kIFxx5okxv0IzSCmD/p8lDS2973h11PnfxAq+BUBRPuVrAZMn+dXU3oLn4lEznAw
         cj0mdpQWx9t9CY1EosLVHehqDxPx254JfPlXImpYfVyXZXimnhbZxrv1WwVY0qgy8+B6
         f2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783511845; x=1784116645;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hHdBgQ4YRaAM8+nMh8X4NWZFsOQZElrCph3RwF75yXo=;
        b=RBRv2Dma2gYGIlHxJMRVy+FaEs/a3ybPg3l0k2NqZVi6k4DR5eyWISUcjY+NzubtME
         poGeR9kmKL7tZncBxUl5U3kRvcWzM/rmVNrQJz3cxq+wb6ZPeog8LNinfSki8/yLAt1K
         fXDyYZYJkATEHIg3RP5uq388X0wirjkVMhMvxzQKuiOewQoNvNxl+FAEUznMVEOUf+bl
         XJt7CfrwDC1LepHHq80vK4zmkUsJErXTbdiX0fcVel8F6ChN8qmNjUDQUa+NLiB8iqe/
         Fgh+zBbSWsgn0vs3C1VS74gK+XZtMZ5q6GvyScxhLSaDte+9EIlpZpsgJVhAMIFBH1oS
         4F/g==
X-Gm-Message-State: AOJu0Yy06WOKKiZ9Y1r1BBXbVpM1/LVAAaDPj1u6vOSt1w3d86j0HMNo
	YcgVeF/naGCw1wrdE2h1XNaUMm7Koc7U9O0vFwnW0b83vLyt6nc+xerD3cqMS/IERnbR6H2tCq1
	irqRL43qcUiRJnKG9ji7QyzkMxjnEUXg1VZkYO+IGhTZ+5yDKoZTGq9385df1LWimii+F8kXmAB
	wX
X-Gm-Gg: AfdE7cmiGTu8mlFB7Nzw3dDwPN9Wdufeer6avttllatm7L4d3zsV45PxpXHKYdpGsu1
	UD04Xqptgry9ynfwN1U5UxpYF9JoHaYJEM0Pl7U2cqg6VPr387bXxWSeAv+gWlx1aPxF7eP979K
	LKG1CkdGfffSyFgOhq4pRRtQBKTB3uX2Z+QDdLF7WMwfblOxKnwCrlkRz7eYG+g87jbMZ0Udow5
	FVpqEsCW/pwofvJyy+hhC9JnGTiQiFw2sIraIaq9cyWo06BuFxmNtNw5Z41YCl049ppHQi3YdSp
	oQ3UU9Va0wmcvNAdZ1J28OqRw0q5fwtDY7fVnr95Eb3Xs7AllAfkkde1cUB8TTgxotJ7gMs4bUt
	rktj20TJC6Nw+1bs=
X-Received: by 2002:a05:622a:11cc:b0:51a:8c9b:6499 with SMTP id d75a77b69052e-51c8b40bf87mr21608761cf.61.1783511845177;
        Wed, 08 Jul 2026 04:57:25 -0700 (PDT)
X-Received: by 2002:a05:622a:11cc:b0:51a:8c9b:6499 with SMTP id d75a77b69052e-51c8b40bf87mr21608481cf.61.1783511844639;
        Wed, 08 Jul 2026 04:57:24 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3318dsm121284385e9.3.2026.07.08.04.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:57:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 14:57:20 +0300
Subject: [PATCH] dt-bindings: interconnect: qcom-bwmon: Document Eliza
 BWMONs compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-bindings-llcc-bwmon-eliza-v1-1-3c7dbcbae87a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB87TmoC/yXMyw6CMBBG4Vchs3aSgkHBVzEuaPuLY+pgOt4i4
 d2tuvwW58xkyAKjXTVTxkNMJi2oVxWF06AjWGIxNa7ZuK3r2ItG0dE4pRDYPy+TMpK8B/a9W8e
 +a1G3oNJfM47y+r33h7/t7s8It++QluUD/VxJmn0AAAA=
X-Change-ID: 20260708-bindings-llcc-bwmon-eliza-b903d985e15e
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=FUXzDx/MqiII8ZYGHiC1f7+FAeVodk7UbwWT+31SNcs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqTjshh+J00qB2eNZSzeutTwk0f8X20DuUsz8nw
 a7GNWPC+ueJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCak47IQAKCRAbX0TJAJUV
 VqPQEACx4mNaOxvWdzfrJJPyaGPCcaxAx3IHGbzJohk67QYHzC23Lx/f+NohNkq92L6kS+wTPXX
 VavhP/VEENW89+yNxyT1doNpj7i4cd7JGe94R8WwsW2UA/tYv0ZRa4PNCQ4QatOAAIKZjeXYu5i
 xFZRL41gGzhf5IlDhGKAK+QNW0/rlI8UDyaZbxKZKbSX/Q4mlAo/wVBgi8FXYknWCWjY1IPx8HV
 a6xOaluJ8FAvlQX3NfXrU1B0LeVs2iY0/bhu12RYitO8dO8zmXkgJJvyFotCPK+rQhuMjDmitcD
 jTkpmeEHo/4zjjVWzWIEzfPT+DNq0MyKvPH1cNR5wZCxkaNaSElkvP5EegxGMziqEddY2c4/hb0
 PF3nbkXozEM9H77KrTIsYgfbfqGBjxtbpS/+6IDEdNyKqnomAvSg4BmJ9gUHRpLq+Z/keO5FD8y
 4lVDU/yLYGvEMYmPmkzLjzClX6WQRsqhcMWJmvXMRdcbn0vSKVXCBGtrl4Fayj+pOFX/RsdjM3l
 kzpB5sM9aILfEx59p/GdNvpNjfIidSlIf+Trx112qQ0ZDPRYxYTAL6I0tH4C9ipG52DhigacJxc
 PYeN6tXgjqQ7MuQ4snfrxaR++nFhVlu2oP9IkMQ+lk+AkIkbbrD3StsgmXJMW2sMDRE3WOBcfXy
 RPtHIIFHKY2dl3g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNiBTYWx0ZWRfX2RCRXK2C18wB
 Xhq0Wg1jdAOObL3cRjBs7EVC9e3mm1tfuAJ/Iivig226eqb9CJ0Ms2N1zGe8GT7pIzI42/GU7tD
 up9A5OoMO/Gpzn8FYouNv+R1jgDXgk49RcxyftfRFJVH3MwvmI8wr8OYsbnQNTFGV8yurn5imuv
 0pItD/RYe6+9sr4tErIGEGyly6zU/B4+cfheSA7K8Ynt+t9ako2bTp5oiKCCPYYQ1J2JtQ0/SUr
 /9wCzNYdK87zFp/CDpdbMuig8fK4+j9KNcivy+TMV41Rg9k2JNUdz8dGRLxHAvDKWg5e3W3igmJ
 mzaZTL1kvwdOamPwfnBVIoYeJGsc9Lb3GDa22RZvQt1bj3EKSwaGXOuKIj+MXOEtHqyUg872uUy
 Hyb2L1XaZ+QOBrAJ43A7eJomHZ4eC3JIFeLYiSVEPmqqmKLFT1v0gwxqdj5QOVxOoIjqhxYqNRT
 L1AYbtCyKTSakvTRc/w==
X-Proofpoint-GUID: A6m4irJmzDS10ZNf0UtIEWOWT6ELltgm
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e3b26 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_bAYtE0Crml8VzQeUhIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNiBTYWx0ZWRfXx7Bo5BtgVhEk
 Tbcj2BAdECaRrD1OvY490u5KGfZWKhL0Zo9z5h+qoWKqs/PuMDmDr2HKPjM9+QaqUAuWHGL+5yt
 CV/mgH3tLJmfa6whXFD+dfNlOYzONHA=
X-Proofpoint-ORIG-GUID: A6m4irJmzDS10ZNf0UtIEWOWT6ELltgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117608-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:djakov@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 054A872613F

Document Eliza BWMONs which has a BWMONv4 for CPU-LLCC and a BWMONv5 for
DDR-LLCC paths, same as SM8550.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index e002e70580f9..66dfe70a8c34 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -25,6 +25,7 @@ properties:
       - const: qcom,msm8998-bwmon       # BWMON v4
       - items:
           - enum:
+              - qcom,eliza-cpu-bwmon
               - qcom,glymur-cpu-bwmon
               - qcom,hawi-cpu-bwmon
               - qcom,kaanapali-cpu-bwmon
@@ -46,6 +47,7 @@ properties:
           - const: qcom,sdm845-bwmon    # BWMON v4, unified register space
       - items:
           - enum:
+              - qcom,eliza-llcc-bwmon
               - qcom,hawi-llcc-bwmon
               - qcom,qcs615-llcc-bwmon
               - qcom,qcs8300-llcc-bwmon

---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260708-bindings-llcc-bwmon-eliza-b903d985e15e

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


