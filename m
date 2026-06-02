Return-Path: <linux-arm-msm+bounces-110807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wS1ZDgLTHmoJVgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 14:56:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DFF62E334
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 14:56:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L1d8z0QB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BNNxFHFk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110807-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110807-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 555BB308B215
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 12:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD143E1717;
	Tue,  2 Jun 2026 12:47:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B635837CD2B
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 12:47:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404452; cv=none; b=LVi5v2nzPEXaAywcWW9Q/C6B94hQBSQRdUvjozG393qitzaWLGILUilwAd4CW55C4raPc6802HOAkmk959PwiqDMA8hvx6lRiAg55fi2uyOQ85himJtveO+bOdJdYSHwCqHYKdWk/o6zIwmNch2j6Q2WOt5k3aUgjavuIXE95sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404452; c=relaxed/simple;
	bh=/qUTl9sMI/vRjckOGlZTctOQLXKzKDXzB0maZwnAs6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sRmwoDqGkTULLdfRGQf/pQdbSNYhrluXIgPut/tnetryH87GemEYuQoqHnkF8inmv7mkYz8yUaKizbFRiUkEQDfKcGSTfTZRk58bhsS2aHePlYWgrIwzqUWgsWorCntsrbJ3oAHSZvwqobPFbScArsSwzp+ukwfhLI9/UtunCa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1d8z0QB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNNxFHFk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652AKDm42691969
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 12:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uep78eAe1qTPBeUI/iM+S5
	YJTJaXYnSn83qnfGYSLws=; b=L1d8z0QB7CLPYJzAmY4JV7PSjGmdwBa/BJZMvE
	c8vLIwDC8uKVZrDjj16Yd/x9S31JnH3gxjgS2QVM35AM0/qt+btGO+7+PwtIf5ju
	Ofrkspi/9wdWUWhTR5pPMZFf1+Z1E9tkc3K5X9/GNa+G4mH9ET2qVEjCAU7D1OKy
	k73H9KfEQM62Iury+9bt7qVMf5Qw1Iz978Go7DAXeUcUc5k0MaCk8vXtMfBRyAAJ
	8JxNOcHA3q3jjYDZxjjqBjdFLrFhsrxhAaUw5qe1jXAiZGygoz3Wr33j9oIWOHE5
	GjglW7KdD2srfapn21yaULPWDZucJg3Dl3KI8licq/rRqG4g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqumhwpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 12:47:30 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9639f945fbbso1078775241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 05:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780404450; x=1781009250; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uep78eAe1qTPBeUI/iM+S5YJTJaXYnSn83qnfGYSLws=;
        b=BNNxFHFkl9kVEtM1H/0SiftRdJYIzIhoiVXutP4cQsCVz8VMeFnf8ftowLkHIjuILY
         qj5wvH2w1Z6fr0iQe6t0VTq9rH1hZ0/ib/TgBGYb9I8KIHDRgIGuZPnugyCVj+G80ouU
         IOtWCSb+kHpazQYycROjRp4BbPO8G4DiMHX2UR1xpzMCceswJ/z0IpGb+Q57LRdQ2seN
         l+7Rp9AXzNUdYCKojDI6rbj6f5s/S0gHW87+ht7g4RB+UBSwq5T70N7hCPhGKvy3zqIU
         MIIjrVxVtj3eYlMw8OqZgaROZ+sOMy8iM7CXAmoYwtxtvjxullbALRDctQQW+ADh/kNv
         q3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780404450; x=1781009250;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uep78eAe1qTPBeUI/iM+S5YJTJaXYnSn83qnfGYSLws=;
        b=E78ivyTZT/Zb+oYhhy4BC3f/aU0qEFoBPgLOv9IKNu2VkMEqsJug9ulI//b1RblAqu
         or9TObx4bY0e4CcPmBeonSEAt1XuMArfsa4HSCTqwQK8IrkHoC1NxbQYgCwCvi5naDMn
         rzh0QJHBIolgLEdg25cA1KzXfDVoGbL0HNKHm+KVaku9Aq7Am5Xm9pFXGbiSUqVs2A97
         Xr8H61oezh5s2SpYdgC2Tnr5GU6j5QFv+DZLkUEyKzsxOctEvAH5BLAhLYomBbTRWLeN
         A78f8kbItZVz11owJQ1sXbUPjbQpnm8XwP7ViMchmJgWVlJn1hPNLv7uZQjy0LPhC5AT
         hLRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EGeE+YZNKvhD6uYxl1pHBGz79Z4iFgg5Te6Gv4C4WuqXV8q93Udsc8dq4i17xUa/X+QVgKUB5gLRXGJDN@vger.kernel.org
X-Gm-Message-State: AOJu0YyMA2aOeyPQqX4zKEia91EJAwQLtHF+6aSoDspQDz06Ddxh7Jkj
	cbTj5yYEqNHgMeQLkqzsGo5US6RC9C5fLujl8vCBdWT88MnquRZsPFyypBPCAojrSCGs1qdyfR2
	u4H1ZF4R94HHHg0bRg4PMDGxBkXM+jLLaOZ8wxgZEcquZMBE8E2CZpXjCjKXubD5xAsZX
X-Gm-Gg: Acq92OH3Law8jsn7qWMVLVYJ2z1nGK5VdKiX69cmPSp7rqmsazkomfnr+7tu7JFT6/J
	9Uxy1Lwy9fBR9ZYPyM/DHUB9kYWwvCGqBiKgC6syE5Ab6CLgcHQUwm1oGmh6v2umN33w1sXEy4U
	p9nlw3dDZEyfANMXG3jTi07ql6qacd5c1c9uLTMjRdUVD3KM6Z2ISDFti0tLf7Ec+58hjNttYvg
	kvxdzRBI0tp0LIDU5u/t1UG1sg2Aw1aMaUY802PGSSUW/Azo0ItA/JMbLCZE0Dcxx6caceUgtEm
	rt04uUDFayX6z14AI7Uf+6kF7uK327eBBuS/8IK/e6ZfZplsXQrFjY+ZfE0u0wo0CC0xf9huW7q
	JA8Bja0ur5ia6n1kQSOrtTYE6M+LoGCj5aGahamGbTp5NQXFHRSjFB67+6fikSF3yuuaCzsF7iC
	+F6+dO2Ja9BOTZJQ==
X-Received: by 2002:a05:6102:4b18:b0:631:28c1:154c with SMTP id ada2fe7eead31-6c68d62b471mr6145926137.9.1780404449105;
        Tue, 02 Jun 2026 05:47:29 -0700 (PDT)
X-Received: by 2002:a05:6102:4b18:b0:631:28c1:154c with SMTP id ada2fe7eead31-6c68d62b471mr6145903137.9.1780404448597;
        Tue, 02 Jun 2026 05:47:28 -0700 (PDT)
Received: from brgl-qcom.local (2-228-54-83.ip190.fastwebnet.it. [2.228.54.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b834esm33096872f8f.11.2026.06.02.05.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 05:47:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 14:46:56 +0200
Subject: [PATCH] MAINTAINERS: make myself the maintainer of the Qualcomm
 QCE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-qcom-qce-broken-v1-1-a4ef756089e0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL/QHmoC/x2MQQqAIBAAvyJ7TlAhhb4SHVLXWiIthQjEvyddB
 uYwU6FgJiwwsQoZHyqUYhc5MHD7Gjfk5LuDEkoLLRS/XTo7kNucDoxcajUa64wwwUOvroyB3v8
 4L619d8KT6GEAAAA=
X-Change-ID: 20260602-qcom-qce-broken-16257bc707fd
To: Demi Marie Obenour <devnull+demiobenour.gmail.com@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/qUTl9sMI/vRjckOGlZTctOQLXKzKDXzB0maZwnAs6c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqHtDanTXFZGHY9kJ77ITtK7fxbu6RiPtBOokIj
 d4rnYVANIaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCah7Q2gAKCRAFnS7L/zaE
 wzt4D/sFk/6NUsGH8RkpfU464qPnuizgY1weScCKsAxa+0ORO+CHE6L3kexi+42Fverqm5Imofg
 3iqtVbL9vEBV4poV+FPMocad8FHNwkVd9kvRk+oEvh8JfemCh7E6w1DRh7Hj1ogAt3JKIlZBWjV
 YvpPRWPxqhXkv4OIKpQnpiJsDHH10cu/R23MwGeVX2WxT7Oqvz3GGt6oh+oMwpNY2kxxGHorYEY
 SOd0v7Kkyvhi4JEumK2SSmywb7IgrcKslM3PLeu8jvYNnG6Tm0O47NeoRBZrOkQ9xKVV/AiutTn
 0jpvQ8DTsxZGwDB5ouqngOEJ/NZp5u3slpP9kCxs4JM9SyFH34mzFW/xJcGwbtsrgDh99RYpErC
 4s+P5WuNKcD9gXf6Sq9cRdA7WgAaLbL3EL5ACwC/0tsS/DZwTWvEb95FdYFYAqIR0Pwf4llF8Rp
 UGd3+iO/3vXsGxkmwH2KFC4wDKnBqLQrtPMUQddR8EZ1bcRkCgQhMYqa3eEpzs8lkxUPNmpAFgE
 Hs/o74ipSFMdhh3+YvRAX0ELuffW385PSZz6YHAgzmhfzY7L0yI9Y1jQZ5Tdi9BWU9xa175JXtr
 KAr7zNSTITdonuAwrwTppfbuHNWBYFUutsYDk3EAERFFxqACbgNZqSjq13VVr6ZdEDNbI2kTV+3
 sfBKRXYJoRAB2Ag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDEyMiBTYWx0ZWRfX24iqq4mKihAy
 xdUgWRsz5FZKUQILAV6hjNYMl6bGX8GlVzEnml+u89O2GbTUc+NtNOoNUqLCmFitgBF09hkRmZs
 7QDVSe0ASy4s2MPR9pTN5PcK9qk5JhlmBFaD09Rk1UdH7iO3ezJgDFth+QxSsXMmceyjHRVJegO
 sbEJmmzHl11+2ZNjJQT3nN7Zf5nUAK5NEAGc+JfzkVXaS9G+S+tFtfCTXSeTv6+UYhhXniBgn7u
 6SyvgaxbUZzdOafrlATChu5spcVpKq1Kd/XQLsWkLd50R9RsjLEbNQ0EUeNzpSOODcxSgYEiedq
 qymA0oV3g72WfjfM3hG/j+uUGC+DbV9eA729tfCOYSZZr/hNAKLnS00LQL89T9J6P7BKiVxvi+6
 Pfmoahc/YoM0vzFw+bLstaVYKPFJaRft7wZ/9rkXjf4VRZCPNvUtXLDfyU5gFX+eWlx3GgJmcBR
 /kcJgGAfp6/2/c33oeA==
X-Proofpoint-ORIG-GUID: Tk_eOeZGJSRDfFHmo0DS0gMrEW7EpmiA
X-Proofpoint-GUID: Tk_eOeZGJSRDfFHmo0DS0gMrEW7EpmiA
X-Authority-Analysis: v=2.4 cv=Rrv16imK c=1 sm=1 tr=0 ts=6a1ed0e2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=F4J0OHcPalsv3C1teIDEwQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=69LWc1rl86c1DZQ69rIA:9
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110807-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,gmail.com,armlinux.org.uk,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:devnull+demiobenour.gmail.com@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:thara.gopinath@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux@armlinux.org.uk,m:ebiggers@kernel.org,m:ardb@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:devnull@kernel.org,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,demiobenour.gmail.com,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80DFF62E334

Qualcomm wants to keep supporting and extending the crypto engine driver.
Thara has not been active for many months, so change the maintainer to
myself and upgrade the driver to Supported.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
I've considered also marking the driver as BROKEN but decided not to.
Next week I plan to address the failing self tests as well as go through
all the ciphers it provides and remove ones that are known to be weak or
deprecated.

Regarding the series that proposed to remove this[1], let this be the
official objection. Qualcomm's clients use this IP, we have support for
new features planned and intend to refactor it significantly.

[1] https://lore.kernel.org/all/20260523-delete-qce-v1-0-86105cd7f406@gmail.com/
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ae45fed10fbe2983c37889bf075c058bc09816a..538373148cb1782651f8b47efc8ba3ed9313fe38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22087,10 +22087,10 @@ F:	Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
 F:	drivers/cpufreq/qcom-cpufreq-nvmem.c
 
 QUALCOMM CRYPTO DRIVERS
-M:	Thara Gopinath <thara.gopinath@gmail.com>
+M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-crypto@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
-S:	Maintained
+S:	Supported
 F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
 F:	drivers/crypto/qce/
 

---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-qcom-qce-broken-16257bc707fd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


