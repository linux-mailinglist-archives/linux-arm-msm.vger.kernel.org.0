Return-Path: <linux-arm-msm+bounces-112789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EtWeLqEAK2oy1AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:38:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 143906747FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:38:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y7RcbeXr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eJXIMIyL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112789-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112789-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B20B13078F5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 18:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF0B4968F5;
	Thu, 11 Jun 2026 18:37:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1221C49691F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203044; cv=none; b=Z6VRnajZB51dVoHCj811KkbDCtR2D8xOEHgkl0c8wE5dZuekV7c7bM3mfXQUfd+nDXZlh2ifF/x0KtUs6M5DO/LVuIc7ekAnL4+kWoqAvBQn5tyDDvY5hunFpjbjMCjyYU7Cds/r9VjkYdhPogZPv3y1UiJtitaeG6bsYDPd5Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203044; c=relaxed/simple;
	bh=5T444QwrYmsTwO3v1gCqDgxdhU4Jck3L9IB07WNXPS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IujrKLPDMuYUZ9TQ/qpJ22AO85CACfrlwrqm/FAfsF6dH5Y8tSjqo0SrqyUBluBrIzLCiBzst9ULxIrKKYyw+oQPik0vrdlPl5P6SIqRkF1KA/UQ6wZG4IVkjg1lnIZ8fufBWOD+/I+iP75pxvCSipnEGP2xEHrQhU3OM7WiuVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y7RcbeXr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eJXIMIyL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIU4ov1406016
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AyxmGXU7tCETamEQ37pkjmBcE0pG+FwQBF/uCJxPNaQ=; b=Y7RcbeXrUvc6Z1/b
	nZ4FOXt/Ipi+MICJydJ5E7HgxkF/zc0pd36ESrMyQty/5HKx8rB8q90epNh9ZSTY
	s4IRDgyOn/teB7YqIPL/M//AxaBn7tfmitVTFt6o6wx11Ppq6KMvwa50tc7kdHEA
	PzCzNUlz5hvFg9OUNq7uk53/2GlIPXUNIhRdO8s2JhsN1z//Uz74bi+bIVgxfdPC
	kYqX2AtCmhkc4mPU+zdTDmf5Zq+Pmm+ahs2XZP2NMgzf/uCGh1BD9NIF66np6GWJ
	nrqB6KGLHPt54PAJGeLQidsD+ixDwDVOv+DQqKs97+feaM0mBX9DW6MEOrNOjfL6
	YT82+w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbgcdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso65579a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203041; x=1781807841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyxmGXU7tCETamEQ37pkjmBcE0pG+FwQBF/uCJxPNaQ=;
        b=eJXIMIyLiZGVDS+i2IvKh8DWWRg27/1m4j0vJmuv5+ppQBRQCytpZwdARK35U9l3ut
         DP8uPUYjcJxeX36FbRImrc9329QsTyZ3SkocLrO6oLZGKo3qu0R5K8hKURznwj9hJ9WE
         v6fC9iGY7rH/J0EpJz6eM5Xi5ACbevZgUqV8FvmCRN+t0mjoavvVck9bztEJCkUMNXZZ
         qJpBtfqBLNSoyahrL7voX1c4h2wb99jOiCaFyQ/0gR3uvIodawFsYXtNRyWSd44UWnko
         Q/xY4bzVENjVhBcuTFvjq6dDAky04AqQtZyPFzqIZw9UKGKr1ukmKPJK4/H76n3aXnGa
         /iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203041; x=1781807841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AyxmGXU7tCETamEQ37pkjmBcE0pG+FwQBF/uCJxPNaQ=;
        b=d3K7vZ8zXkRxcJTPXz1nFFLykXOX6WPTNxsyYJFM48kx1f1US5Qz6LH2xIIY7HG5ry
         Pfext/xPPLUdyQer9C8Sj1hyJwampzWz/sPu9A9661rA31GTF9xqidt1sAr4MZfcAGaY
         5c7qI6HTIqDHskM6dvC/FhCrgN85fzogiMhwKdlbnP2FNSY4mDK/kahdKggGFP0GYipP
         NTr/aplUTi1g8RGA8x36AD0RmMNV4poKPlRCKCLBt5gmWPFgZci8U+FXNoMiSSFkzk7u
         +97KByeC6Mz3+6h2BTIPTEqQATuSxe57CkcG41Cd02SbflZ/lL2HXTnOnXR5+n5xawYt
         6MFA==
X-Gm-Message-State: AOJu0Yyw2CD0r5PSYZ067kVM85cAvse99xjz5X824QadEH/CdTf6Tjdw
	m6zuqM54Zhh7ACS0eb83Zrl47gtLg0gYlg7TJGsAHV30payMnS21iV0mgKpmN63yuUYv3YsRRrm
	LyKrS9jaYdDM9YsNJGxsY4UHVIr3RGSlKj5HR2LaJ+3RBOl4OTwF70q2h1dBhd3wb3g9Q
X-Gm-Gg: Acq92OG7mkDuaPQcxThaR8fo+jrjY68bKDmTiCl5FiPfxhAr2LwOlEW9XlMsYxVFAr+
	eX7muG9sCUs4vTL1fiEkGdw7uSAKQngHmYEHtE2gNUbFjqiyWhi3A0JmaHBP6P0Omdj4F5/0Jiw
	QSjiQYkBPkawIbPwtNPgUiskrBZguJc2usAwT1wplGYbCLnNrmgds9cvbt+Y0cqivAlWTmuRWlB
	xQQE/7+aJ/00WgRRrm6YsfQnJ9+jwQ4mMn72dvnPSE+flE3rL50yN5YE0CqiZl4xuOnDvXfWFRn
	lTxPF0VOvCKMpFbSNw3GNkDEC+e94I6K+uFXQhP9pnQuG1BUj6v/fu8wsjma5FSiquap1Orroq/
	D1fJeTrpfp2h6jpI1kILoGErZQ7IK3e1U/kogiWzDH4LqDLLX8Y0=
X-Received: by 2002:a05:6a00:414d:b0:842:732c:568b with SMTP id d2e1a72fcca58-84336bc69f3mr4345824b3a.22.1781203040952;
        Thu, 11 Jun 2026 11:37:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:414d:b0:842:732c:568b with SMTP id d2e1a72fcca58-84336bc69f3mr4345780b3a.22.1781203040445;
        Thu, 11 Jun 2026 11:37:20 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:20 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:06:57 +0530
Subject: [PATCH RFC 1/9] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-1-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=2195;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=5T444QwrYmsTwO3v1gCqDgxdhU4Jck3L9IB07WNXPS8=;
 b=Y8TuyI8PC+fi6lUIQ3mPFu/M5131hg3c7XDWYgoxoDB1Fd/WfaGv9PKijnwpIL8ceTzv9YHRr
 3aHjmo3PKU6CzJz8jJBD+WK6JDJtkQlULNu5b5xAVGiJM0RbhvweZN9
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: SwYfuykhDM-ukRtd-Jt0lWM7HfT4JbfT
X-Proofpoint-ORIG-GUID: SwYfuykhDM-ukRtd-Jt0lWM7HfT4JbfT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX9pITmNJdr6hv
 0osvNasMeBgx98mDFSwvKOWkXPpeW6Mp7Z7+7/hiLNR8gsRorHbvBhhoQ0R7Xc0b2rpAye6Gm11
 pHQ0asDJgvTIMIcYJgnB1uxgAEIZ7e8=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2b0062 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=w-NwtAtCphaO0WLdcGwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX2yUFstt8orQ/
 PZPItSWMXhMNlWCrgljYS2Cwtdnmc+gpTI/gRsBMBTPVf5avl04TRUQleKfpr6N+MZISvcNTq6m
 NLLaCBE//QC1rYk6JCUneNwNJfKI60zHC0/jsZsF2murDUMSbDR5s6GF8ldSB8Fhj8IJfOK61/i
 1+ltehl4wtT3NWBGMzvnCr7mXWrHTsx+RM1v95CtwIdm6cPUWDBsNZyCAuVifuavMpczLEraked
 l06OWYH2Mct6cWZ5oTKrS/ZDmJRBpjkn06b04oghbXHcqpRl+RK80mobbMQjUlPxdSWjyx5sfGB
 QV/V3+Cm2xFGWdlK4Ocgds5WYgk+RUWKZg00rJ6ONkNoFz17ai1dWLu5FVb/hjNCZP3ydnkA9e8
 JkBlGBcHXw+ZcjmjH59DKwJbQGFC22b6IXwyNpuzPHQj2eQ+U+MxsI+1rRhJhgRcvsv+2Ja6gLi
 CltpjPLbw+9jj6JVqVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112789-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mohd.anwar@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 143906747FC

Shikra's EMAC requires three additional clocks beyond the standard four
(axi, axi-noc, pcie-tile-axi-noc) for NOC interconnect voting.  Add the
compatible string and extend clock-names with a oneOf variant for this
seven-clock configuration.

The AXI clock appears twice (as "stmmaceth" and "axi") because the
stmmac core and the driver's NOC bulk-clock array each consume one
reference; CCF refcounting makes this safe.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 31 ++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..4528946856c8c6e33bc6ad4159ed111f35ec37d9 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,qcs404-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
+          - qcom,shikra-ethqos
           - qcom,sm8150-ethqos
 
   reg:
@@ -57,16 +58,30 @@ properties:
       - const: sfty
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 7
 
   clock-names:
-    items:
-      - const: stmmaceth
-      - const: pclk
-      - const: ptp_ref
-      - enum:
-          - rgmii
-          - phyaux
+    oneOf:
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - enum:
+              - rgmii
+              - phyaux
+      - description: |
+          Extended clock list for platforms with AXI NOC clocks that require
+          explicit driver management (e.g. Shikra). GCC_EMAC0_AXI_CLK appears
+          as both "stmmaceth" and "axi"; CCF refcounting makes this safe.
+        items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - const: rgmii
+          - const: axi
+          - const: axi-noc
+          - const: pcie-tile-axi-noc
 
   iommus:
     maxItems: 1

-- 
2.34.1


