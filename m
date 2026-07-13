Return-Path: <linux-arm-msm+bounces-118701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id snPwBHqvVGq2pQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:27:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BCC749467
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:27:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="D4r0JED/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=URT92oqC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118701-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118701-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89BE3300574D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0008C372B3D;
	Mon, 13 Jul 2026 09:25:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A764A13D8B1
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:25:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934755; cv=none; b=SlYrC9mw3Nd3HNolnx2I7RWrXvH2Trmnbo+wVVYUtP8QYqJ2EXrhKS0merHIrGbt2f02j6p7H/QCShB+iDJqya4VrL2e/XPgu7I4N8n47u40jYsl351om0tG/0GpXNVv1PIaXWmyOP8aCttjV77z9xFGLADG6+P0UkDQ74m+F/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934755; c=relaxed/simple;
	bh=IGwU/XzHL5SyWQ9S/hw4TQ6IbW+i1/eFqewpz5BZux4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nsv6jp53c8tBPJbmgdY9X+3Ww7hc6r1kDxu5ABwnN/jsA6L0NuyHKcEW7KLk1dLlZhk3bdunACx2W+aDj8ctCZcsHi8VBhZDzeUH0k8Ku+iuEzvucaUEFGf9xrc67UkAuf0aNOe2akDV3rIsr/T3TzLvBvcFQgwuxJMwMnmg1tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4r0JED/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URT92oqC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nfs2469252
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NbBmG6kgKD2
	CVzzcP60K4ZcdLZpgmeYKoleCsoDM+Ww=; b=D4r0JED/rr9wtjtCMM66Ly6auYz
	sm6/XhNXWNLB9C3tM/7oD3opkoU+aZjiiGdGe4jdRlPWE56PPsryex3GWydx9IT/
	vNTFlNrL4NCzV4NMMYqXzN6hW+n111kLX5uapuMMoUDJzoul5q1ScU6ZLrDRUxty
	qtsTfnpd5Qq2uRpH/cXbrlSf6D4JQtTLO5YFFDCynhZthA/oOMHat75UzB6h5qjO
	NlnLc+bgy6Mz/ojFMaP8awhQAID9mdBZ2VUdZbiiOF5iLaeVthLzgMJG8G6RSh1t
	eaWpXjiIio7M7VgVfc8DHJzgu9gsEQM8tcqC/FlMvstX/44QZcpBvVNpd+Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf485ddj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:25:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c888c687c21so284879a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 02:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934753; x=1784539553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbBmG6kgKD2CVzzcP60K4ZcdLZpgmeYKoleCsoDM+Ww=;
        b=URT92oqCOtzZMG0Hd/Ptt6yIQdjqB/xV0UepMtdQumP/0lBLbTdOpqDUd3M/XMQvhH
         k0pGKGkzFJiEypCBqy2fGJNIwinwG2Qtgv4iC2B+PGJ4kbFklfxOivsKmainrC3fpE66
         /W7UA6L8nDGZUTNCb1/iMP3Ot5NBkBPFmqzfGPBUW9oDaWjDRCqdk7zPEIvOLCsgCO6Y
         HbzkbBXzZhmwOB3rkp7UJGYR1y+m86YTBZV8liJexQM7flAty72IwTR+0k6BUbzS3cAl
         tj+5GW7xPl00mnVHMOC+Mv4JHLdGpR15CojcRTq2cUhWjM/+LvzQuas8bG8KOpDB5YQJ
         vFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934753; x=1784539553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbBmG6kgKD2CVzzcP60K4ZcdLZpgmeYKoleCsoDM+Ww=;
        b=FqjzjL4F+6bgD/ywvLvUhcUgedfRxR+bj2WTz9cjNhx+0KkdwGgdMNlvzSnYNLK0fH
         AtucaLmkBMwYqh+KlhbYJQcZeSylzwbDGf2bONXTHOo5OKPSeCddgjI7nsk/+2blBv03
         U44EQr8dZVjOxKew/rrE1f5L5DyGqptGORcma0/4yo4ae+JgmXlEWCAmh4JwDGKnMCXO
         YCCyHEjtTcEPUMcKRyDkIkwJWA0FHZmLKOkKQ5CK2rmFcPMg3vU69B2hB2utXBfyCPZg
         CA+8ziKZG2Wkos63C/PFlBRJsd9aGKVkjY5MDMwUo9heCt4r6LJH5GJ2tdE9DhCINS0T
         5cvg==
X-Gm-Message-State: AOJu0YyOCYcPCIfx2BuLTUGGxzUzDrEgP7GSoxDf9gduGxn1+8LAYYnj
	6zLYuUtxW8XYlNadtYT5Q9RU2GBHPFpyTjw6HGhMGp9smz1G0w8tCSfAXExtqAGq/sKgkUjCAMF
	aV6G8dMBhGvwCKeAO9UbiAsZN+DXApXqxgqrO8V99x1yE2dBM6FoZp0duKxLAhMKZQuR+
X-Gm-Gg: AfdE7cnkSJoL2HCSiIgt4c4xCPvya9F/18g3TazeHjpSukptdB+Ff1vqzkdLr29q9Fx
	4TQe5ODV40DS70Nx9kS773QLiVDGzaQvoDJJH0T9LK7QpfHD7QIWC7COYkY59rADmx5hmygcKgl
	YXUftDP1YtdY8e3NJdLnkjcnUjj2+BiFbAjcvB7jaYziOeAnO4XrPx/XNHpdfgi50ElV1QwzwMY
	LSXx4jnY9F4nz2xLF1RZjGmD8gBTf2IvPJSyO0Rmk27k66sdVMi2touSGtPrGU9faTWCTjdBxRH
	Et1wVrklZm+3hTZFhC+wumnFH/jG+S0zmO3pmtZumgnEtgfXzK8+uoUHZM6Qa5nPjqm4qu6uP71
	5nJz2KqvQPgqRHNUci0UoiKo0hKOmOegauXwuuirVj3ABNpC0JJuATa0edx3d9w==
X-Received: by 2002:a17:90a:7307:b0:38e:bfe:81e6 with SMTP id 98e67ed59e1d1-38e0bfe9036mr506233a91.1.1783934753192;
        Mon, 13 Jul 2026 02:25:53 -0700 (PDT)
X-Received: by 2002:a17:90a:7307:b0:38e:bfe:81e6 with SMTP id 98e67ed59e1d1-38e0bfe9036mr506220a91.1.1783934752667;
        Mon, 13 Jul 2026 02:25:52 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm67901497eec.18.2026.07.13.02.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:25:52 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, mengshi.wu@oss.qualcomm.com,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: Re: [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector
Date: Mon, 13 Jul 2026 14:55:47 +0530
Message-Id: <20260713092547.4100116-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <63643fc3-3a3b-4aef-96b4-de42498cf47b@oss.qualcomm.com>
References: <63643fc3-3a3b-4aef-96b4-de42498cf47b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NyBTYWx0ZWRfX7Hwtd/Tn+CQT
 kcF4iFNArwAYfgxKm5XU+xXOR5voDiZGZZC7tjRRXh/dY0cRNs1SD0b8WxTGbiSndXo5fiEUSo8
 +EF8XqZFACo7bUJTqp3DBJlnxv5JZiU=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a54af21 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VjGlub7PaFdePbqR2KAA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NyBTYWx0ZWRfX2t7Do03XDKQC
 65YNPEcPdSDoS5YDDivBfzrDYLhYdXTIRUI4aNJi2z8eUrZMFK1JZxabxpb1DvethX1aIHEkZI1
 RRPOeG2c8oC5vlK86Z5eK4pqq4ze4OdZUSG8SrMBg9zJHecuiz2ViS5ii7nDth8yQTubOO8aG3h
 f2oPTE1f8XHXo6UQr82AD3mLgENQyY47wuM+Lq/0oadGbhDAtlcnCvla9Hwy+hyz2ofHBnKOgxr
 9ifu2iadcxh4KSIMc6l3XgkZIL92/AeAsoMZp53fovhQ7uqVmFQNq24WWk8vslZS0pDhZpwE4hW
 eTjpQOcrYlEIxIG8zdF8sOME0aNRuFqXcxO3H0v4PdmSACShjlE4Wnbr8CuXjQdDGQu/MF5xKUJ
 Dd9afyug5/RfgaGNj0HscpR1HmZdBu1ReiGGrJxn2IPnF7Aw9pXnMLaPMQ9RglqzoE5PeeqAjem
 zdcGyS6SQyunoPfuOtw==
X-Proofpoint-GUID: 49Ca_8Sm55D-TZ76VldzBWAU6mIhJXEM
X-Proofpoint-ORIG-GUID: 49Ca_8Sm55D-TZ76VldzBWAU6mIhJXEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118701-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:mengshi.wu@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58BCC749467

On Fri, 10 Jul 2026, Konrad Dybcio wrote:
> On 7/9/26 9:29 AM, Wei Deng wrote:
> > The hamoa IoT EVK has the PCIe M.2 Mechanical Key E connector to
> > connect wireless connectivity cards over PCIe and UART interfaces.
> > Hence, describe the connector node, link it with the PCIe 4 Root Port
> > node and replace the static BT serdev under UART14 and the
> > chip-specific wifi@0 child node with graph port/endpoints, allowing
> > the pwrseq-pcie-m2 driver to power the card and dynamically create
> > the BT serdev device.
> > 
> > The M.2 Key E connector is powered by vreg_wcn_3p3. WLAN enable is
> > controlled via W_DISABLE1# (GPIO117) and BT enable via W_DISABLE2#
> > (GPIO116), both described as active-low GPIOs on the connector node.
> > 
> > Remove the chip-specific wcn7850-pmu node as the M.2 connector
> > approach replaces the WCN7850-specific power sequencing with a
> > chip-agnostic one managed by the pwrseq-pcie-m2 driver.
> > 
> > Also add 'compatible = "pciclass,0604"' to pcie4_port0 in hamoa.dtsi
> > to allow the PCI subsystem to associate the DT node with the
> > PCI-to-PCI bridge device.
> > 
> > Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > @@ -1025,19 +1004,10 @@ &pcie4_port0 {
> >  	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> >  	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> >  
> > -	wifi@0 {
> > -		compatible = "pci17cb,1107";
> > -		reg = <0x10000 0x0 0x0 0x0 0x0>;
> > -
> > -		vddaon-supply = <&vreg_pmu_aon_0p59>;
> > -		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> > -		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> > -		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> > -		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> > -		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> > -		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> > -		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> > -		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> > +	port {
> > +		pcie4port0_ep: endpoint {
> 
> "pcie4_port0_ep", please
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

Thanks for the review!

Will fix in v2.

-- 
Best Regards,
Wei Deng

