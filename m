Return-Path: <linux-arm-msm+bounces-118223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KPefGK7CUGqo4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:00:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 009E47395C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:00:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Fyf/j1sP";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SWn3+Q8Y;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118223-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118223-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21042300EF43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E843FC5CB;
	Fri, 10 Jul 2026 09:57:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0323FAE09
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677455; cv=none; b=gSCglIW7UO89/ygaYXSzIMiVwV8wK3V6+gCOyqEqKJmdIoLogyX5E+/7Gzu6WOuI/WgjzFlMmNY/k14/zomXEuKT4KeYsY0AccFyixhRgEBiwxPL8TKeWdUqk+rRLjcjNRLAeBb5gM0GmIb9CddybdVtAG676ppVD5lPoDc0S68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677455; c=relaxed/simple;
	bh=BC1i5CTT8hEROlpRriYXpfyJBmL+KtWxwcFIQuJ74ik=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GPNiRHjnOJlzsJgV2OtR4ww4L2M+foPiJCwvGHRFtRw3oCaStaq0DCF8wvb99VbPHgajKZCT6uJCltmpy4hGZ9eCMZTvEKuDcuR2QbJCkdLq1rzk5tIbVWJrIbwZaHrsoT9GABTbPQRLQPm4V62gKVuY9SdFvt5xyJKtT1z1efE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fyf/j1sP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWn3+Q8Y; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dhHh4156649
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eCe+9upivq7I1QkHqTrfks
	jrU/cl381iB5pepWLOaAk=; b=Fyf/j1sPQXJaruPX6ZgdSINKXnpfWASglcf39Q
	hd/RgeCONCE1aCcn6LmVn6sMYC5ifOpqnvhL1VW5MJKds+jTUoQIDbWz7RQpEC0r
	s6fHYdrO1goz3nIhC1+x5T8vVuPqAs8ZC81nSYftZCe5NgfEhSh+2zRoLI4f6URO
	Rkrx8LEil+AydnyakdpOUUcqIhiuCAlV9zRkAMe+HKi5IX4LiHFnJH8VkWBeuFxO
	hliK7P3Akc278C5aJii8WUJKZy4jHyu9Os/b+or1rHMFTWISvYZVbmSsCJwirR77
	vIH918QNKrlgsPDaAy0QQQ6giN+QSHtQnu++yL/0q5w5R6iw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8jr0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso13037581cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677452; x=1784282252; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eCe+9upivq7I1QkHqTrfksjrU/cl381iB5pepWLOaAk=;
        b=SWn3+Q8YnbjgQaLMCHFwnUwRfumL1xp1UwF9eH53ml+QUZCy6K4tGFMs7xE0oNyrpD
         0EFvxx82/829oTRYys0umuV7vZdjgK4+JzB4pKbyoZXlC6NCLegPP4GCq1jpgDJKDfdA
         ZL1iYYQoeyEeIj/hZiJlto6fcHTbcH9QlTRBMm5QnArv4H6zrhyiJdeubzKXZ981IJ/C
         3yTautOETutiiBu3xNhT9f6aDN3oA2qrEyGC3ZdzHrN0rKtpRAcO50oqDfkaF+qhhomQ
         a147d+iagd+cDyvLs3ZOl2gvF1P7ycqiHXuXIPuMqBVHp0X37qR00d/LN/sxUVnc6Py5
         2V/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677452; x=1784282252;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eCe+9upivq7I1QkHqTrfksjrU/cl381iB5pepWLOaAk=;
        b=hjCdnAnlIJ9ak3VIGOlQrQTuOLaSll7+3Z78aWBhtSRkAoh/LeslRQ97fxNQdDfBy9
         AHqdu3ggna70T/tZK8PuFH725JxN0RYnif0FkUK4EsrqYBsCBVwMoCV5acIUzHWOJIyo
         njRmJLDNU9Ii8SGi+AIqbupkL9uS2r38hFSz8ORLrZYGSiKK5yE9Kf/HwshnIUaTca9c
         CYnTxHjKzO+c9rWk914WKnvL46S1i53o0LuelpOXfMs7hWuaVvqqUWgsdJSMU5H9cfTQ
         NUQjEj9y+MeIVLkcVHGVk7sXJL5CqC+eW8zVXizopQMFe1rsPa+0Dz0ZNiOcSq5HC9DA
         PDUw==
X-Forwarded-Encrypted: i=1; AHgh+RoREj/4xHZf69B3GrLzAGsaqBtSz6g2YRQj5Hf6Okhsu0uTWexSP/kZBKsB1jrsNPqASBg0Y33cyiU8dCRQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyEE9DejTjp0Iu/C8ZTQMv/fhTswxQ1yxFYHShLFuTafCaMJihr
	p0GhBAVqJVwToD2i+Nt2NzGfVT7iB00ZRsuxlZNsTsNH4L+y8pV02WauitrHhqi4CNHUMV4b/JB
	jc1ErmjQdcJx9ksd2ZTRWvcwHZispum5oI73YX4U1p6diebRif3uPuP/VjPKOFN58aLWBdCCtri
	7f4rw=
X-Gm-Gg: AfdE7cmxSFnxA0jF5p6dJW9ODXmssCQrpxJ+lsFFBn//jqtAKTGiu1Oa0g5E9l8nyAZ
	eHzyq8fblw2tNIRu/LYtwUHtE7/9k6DkQYRH2Vw0k//HtZ+t4ZiDoCrQTmHrecvrnbQwXtNxo1s
	8gMFIptz5asevHmSnESxO+vHu+UdPt5utWuBTXQReRHe8Z4HXKmdJUkzVGtvDofy39DYHov0kyG
	opfko85wUHuzl4Py1qaNoQLoMdspZQRokEEKScp1MVB7rOXw52ZvyjZJSQM4TiCqkcKk0jeXRDM
	pKnZ/NbX1eDQM+Ir+Nr1nuSp4JBRbFgnRIji2iTK6T+MtSp9ypXfjxwguKzGZ4ksU3z0m5MhgjE
	Y3q8cDQRNa8dP1yRwSL/UbooqJfLnodNgqptVJ8PveRMP66VPobZJsC+XS4uyiX3jblfxHjrjuv
	aQ/wzG1n0I5PIIlUMi3APhtW4gJmLnj5O3l9aCIGHWr6ITfFeO4AF+WWyq10+6h9KyGHh0uSeUa
	qFe6qEsLLlzqWULotAQ
X-Received: by 2002:a05:622a:1c0d:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51c8b4bacb6mr108170081cf.61.1783677451902;
        Fri, 10 Jul 2026 02:57:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0d:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51c8b4bacb6mr108169921cf.61.1783677451484;
        Fri, 10 Jul 2026 02:57:31 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 00/11] arm64: dts: monaco-arduino-monza: Add support for
 LGA WiFi/BT module
Date: Fri, 10 Jul 2026 11:57:26 +0200
Message-Id: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAbCUGoC/3WPy26DMBBFfwV53UF+YQdUVfmPqAsDQ2MphmATp
 23Ev9eYRRdpNyPdkeacuQ8S0FsMpCkexGO0wU5jCuKlIN3ZjB8Itk+ZcMoVrTgFN43fBu7W4wV
 DAFQd6oEyMYgDSUdXj4P9zMDT+549zrfEXfYlcenMZG5TvO5YquF69wFncBzaBSIHCkxL2vZSH
 ypRH6cQyvlmLt3kXJnG2+ZqTUDYNnZpiqhLBr6TZLOebVgm/5VbRZa1/xWILLnqQdWSC0ZVJZ5
 cmRj5L0VT/kTZPtZtpZAbZVQv/6Cs6/oDoN8SCG8BAAA=
X-Change-ID: 20260520-monza-wireless-e6ce7f013f38
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: B7M4fmzdCng3NF57bMcoP8zSnXivZFvH
X-Proofpoint-ORIG-GUID: B7M4fmzdCng3NF57bMcoP8zSnXivZFvH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX2+esQNDg+9iA
 gsGm90IMtPEE23/SAys2zi81uMoTcxVJcqKnmwuM+vC9eRbPoA1pVQV6NGPWRlpxYIXvkoUMIBo
 Zf1hdexOy3rQs/GE34H66YlRoC17rgs=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50c20c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5z_Ge3scFvwj-DIjt2UA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX00Nl9knsErud
 UWDAbwfqDugI7Nilojkac3xr9htN7pWgWb6MrGrzFxlgvPV6o8KfoiD8hOS9AvlbkwaDqYvpc2l
 sVI6IBvJ+Edrue2qdvgdZAG1a8hmIq/jEwci8YI3FSOgcJt1NWN9B9EqHSh7J5O0BJzQPJaRCOF
 v2cMD7Aa82PM0aSuoSbjMmv5QRFasv5WlFflwVMjFEVaKo2f5DROISXiiFYVkqY1Bqi1+NUd4x1
 ZdYzbbYCJlc1HgCKF/ee+fhjDbY4s9N1o+VVy8XZJHyZ0Yix7KIBNkvldID1+OvsxC8eE5FrN2P
 ywq/hdrfXgdLeD12pXW8PbP0fROM+askK/zNFPCkoZE0E0hjtLxAgwdq0CWnKvUw9c8pHia6xK+
 CjItwG/yCfK6qdxxCfrPxs8EooBxzhAKiVVhhDzLJUS4tdecIzdhhtnV6x9VkjJzsEH3Comoqw0
 eRy2l2xh61blVkMrPgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118223-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:wei.deng@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 009E47395C6

This series describes support for the onboard WiFi/Bluetooth module
present on the Arduino VENTUNO Q (monaco) platform.

The board provides LGA pads for a wireless module. On the VENTUNO Q
these pads are populated with an NFA725B module featuring the
QCA2066 WiFi/BT combo chip. While implemented as an LGA footprint,
the design is functionally compatible with the M.2 Key E.

The NFA725B exposes WiFi over PCIe and Bluetooth over a UART.
Both interfaces are gated through the W_DISABLE1# and W_DISABLE2#
signals, as defined by the M.2 specification and handled here via
the pcie-m2 power sequencer.

This series models the hardware using the existing pwrseq framework
and connector bindings, allowing coordinated PCIe and UART bring-up.

This series depends on:
https://lore.kernel.org/linux-pci/20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v3:
- Embed bt_power in struct qca_serdev instead of allocating it (Dmitry).
- Add generic pwrseq_power_is_controllable() API + per-unit .is_controllable()
  callback; use it in hci_qca instead of peeking at the W_DISABLE2# property.
- Implement .is_controllable() in the pcie-m2 and qcom-wcn providers.
- Treat non-controllable BT power as always-on.
- Integrate the pending Bluetooth pwrseq patches from Mani.
- Link to v2: https://lore.kernel.org/r/20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com

Changes in v2:
- hci_qca: extract M.2 pwrseq into qca_serdev_get_m2_pwrseq() helper, called
  outside the SoC switch; drop duplicated of_graph logic and redundant
  bt_power NULL checks (Dmitry/Mani)
- dts/bindings: use qcom,pcie-m2-1418-lga-connector (fallback
  pcie-m2-e-connector) instead of the generic M.2 E-key compatible (Mani)
- Link to v1: https://lore.kernel.org/r/20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com

---
Loic Poulain (9):
      power: sequencing: Add pwrseq_power_is_controllable() API
      power: sequencing: pcie-m2: Report power controllability
      power: sequencing: qcom-wcn: Report power controllability
      Bluetooth: hci_qca: Set 'bt_en_available' based on pwrseq power controllability
      Bluetooth: hci_qca: Embed bt_power in struct qca_serdev
      Bluetooth: hci_qca: Support QCA2066 on M.2 connector via pwrseq
      dt-bindings: connector: pcie-m2-e: Add vendor LGA connector compatible
      power: sequencing: pcie-m2: Add QCA2066 (QCNFA765) BT serdev ID
      arm64: dts: qcom: monaco-arduino-monza: Add QCA2066 M.2 WiFi/BT support

Manivannan Sadhasivam (2):
      Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq
      Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to 'bt_en_available'

 .../bindings/connector/pcie-m2-e-connector.yaml    |   7 +-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |  64 ++++++++++++-
 drivers/bluetooth/hci_qca.c                        | 101 ++++++++++++---------
 drivers/power/sequencing/core.c                    |  39 ++++++++
 drivers/power/sequencing/pwrseq-pcie-m2.c          |  28 ++++++
 drivers/power/sequencing/pwrseq-qcom-wcn.c         |  30 ++++++
 include/linux/pwrseq/consumer.h                    |   7 ++
 include/linux/pwrseq/provider.h                    |   9 ++
 8 files changed, 238 insertions(+), 47 deletions(-)
---
base-commit: aa61612ab641d7d62b0b6889f2c7c9251489f6e3
change-id: 20260520-monza-wireless-e6ce7f013f38
prerequisite-message-id: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com>
prerequisite-patch-id: f4a7d1957c1776051608bf3d808b2786606c1ae2
prerequisite-patch-id: 6cd3c33583a9af16b3f6f71517b16b32d8155b7c
prerequisite-patch-id: 0550c57d69cf112fd4830e62f4388db6f8bf397c
prerequisite-patch-id: cc10d8079e37ef0ba0c33d0984c95d76361df9dd
prerequisite-patch-id: d7f4bb2bb4498ac619e67a94f8b59119a5caaf26
prerequisite-patch-id: c00ce9095b2d3a412229796194828b55642d3d96
prerequisite-patch-id: 09600595c2e80b12eda3aae39af192847d0f03d0
prerequisite-patch-id: a6118ed2894c176780ba933750e1068f2819fa4c
prerequisite-patch-id: 1dee41a33e032094e8dda74ac4e0bada928573d7

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


