Return-Path: <linux-arm-msm+bounces-93217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLvZGme1lGlbGgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:37:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B94F14F393
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D5BF300405A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 18:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9B5372B49;
	Tue, 17 Feb 2026 18:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFB0OLP/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D0y4vzuv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0190F36F414
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353441; cv=none; b=QZfujApRQVxaxrzVWqH2D+XpJxqzBFFZXHBMHvWAnAJSPaU78e+8uFDTLWKl7RX1/ITtM0m+b7cgCHJs3x7b6jJlPENCBn0rCXxvWt7cA13RnhMjf/P1lGanYmeq0amJEjRc7txBZdVLjz+oHUj0E93HPNHPD9YdHxAIqFzRs0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353441; c=relaxed/simple;
	bh=xn1qa9Wzq30aeozYIZEjQOWZY7YneM3h7/bNRTwQFiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLG85SJwmLYtBbE8KvgcKPlCBi4SMLSVZlQyC4J9yx5nar6cYRD2fUzL7abQRtBGvQR2LeQxpUzYKN0cv+9AhlNQP8UzNZNqKew1ls5OkT2b34+ye1hMcETov8n5J3XYbb9FSJq3slP8qDX4s6wJwViGJcWoElgV9ws/4V0c3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFB0OLP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D0y4vzuv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBMgb31613313
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1QmuUCEZrBFNgSu7w6yY93qG
	dfCy2AGpXr9u+0yhsQM=; b=dFB0OLP/P2Zw+1rUZLCk+oVjBbPLZfNVad5hyE30
	3eyHyd594rlb+oaHi0wm3ZIT2iPUdiV/Kn1AzykObKvntO5Et9uTUkDTfMz4YGsC
	hC7sUFSRE5FVE0ZhHQlP1NrT7TD+Y3dBzCGNcMqx5E3eQgKjd3KVh6OHmKN9Pf2n
	tDSkPmxLGeNfuUh5NyYs4pt0AeXPWzQ9DH6SALarPo14S98LmrUqi5xwBlPdEUe8
	k3SRvDf9AAL/7qq5iRt8o4gdOHSeS0V8laEZS+30ov6ggr+YZmoaQHEbA3Tdfhh9
	UhGrYkpQPsoHnT2Fmr8uXt/9Dw2A3TFWtNCav7JwRIgDMg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662uk3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:37:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7b7f04a11so240833075ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353438; x=1771958238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1QmuUCEZrBFNgSu7w6yY93qGdfCy2AGpXr9u+0yhsQM=;
        b=D0y4vzuvCkwnXY0x1Eqghy/bCWpJUMTXdfObfGAnQht1BLozVPIqIbzMrFq+L9g7dJ
         FrxUUHhqL57iTUQq3Nb/rt7Tssz3/fKv/fSTahrb87FGtEkKbqySvHQ1NwJlqi5lkuXQ
         uUu6kP1QoZWx4A3RPR9lx7J2mYvmJeUOr3ToSetPyUJ5Y+PMbKfFJ/WlIOkSsSNTLxsH
         69I/P8EVUqwGWl6rQepDFwhHRuiJ1Y6MO2NHZo6dcPChvBYUjwn2i6DPAxCjWFzNuPnw
         e9H1eN4L5suCy+bZ6CC2S2fRCAjKlSc/938Q0LKPbf/QAwPt5VCGuiGdtcsIZwxu9iHi
         MVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353438; x=1771958238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QmuUCEZrBFNgSu7w6yY93qGdfCy2AGpXr9u+0yhsQM=;
        b=ciEvt1sjSnaaepetb3wTXpqrmZX7bldA/bTSicSVOeErF1YrlVreNioDyYcKHiw5YV
         jEGiktrr3CPPrRc7AM2mLq6QhHnO+nuH32qZLEoc7ZzjagPTdUczERJl4p54i3pAzT0t
         CR2zJE6iblWgUajhVzG0XzznxK4w5zQo7vdqiSLZXlJkZEgHnXFkfcLWmIzlZyBhIhQh
         gGzm5CihOYymE1ZFRgUeptLnVD9RDDCV7q1UkM6dJQdqqbgo/Qu9ygbCJUkfI0PPrDQq
         +eYXw2ELUzgUGP0McqXADS7yr0g3M9zLfRQ3FtTI0qyKhY9BJqLJzHjB2FkixN+gG08d
         zAOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOJYuTa923U6CAkrEWVtUSQi7b6sCE/NTPo0+wloUP/jpZ4QduS37a9o5aWD9IoQ991imPlTCbFsozfmXj@vger.kernel.org
X-Gm-Message-State: AOJu0YxcE778L1LzVrGUCHKNF4aYbu8zjh93jLn23J6paSOBGfGWwd0K
	z4Rvjq4FDvIlCn7H9Fu+lQ6c2e3/XNUoeHM2vVXt8FAwYAIaH7vZ3zt8OGrVDKLYD1dYTVHuFVE
	etT+7spKRiY+FhXB5C3H/r5YpSR8f2d+l8a5EBEkEYy/gOFtVMyA4vU78/gMT2M0h7mvr
X-Gm-Gg: AZuq6aIvzvMBvBWUNJIYMx27aKEepaxmGYlySvsXonZ0857TJrZ6UTyS2IheeVgQm3c
	XyPHblgcm+5elYHP//aY0tv6MB4RwBoV+6vKuCLrgU7WzYZ+hMBVzQzK9guaS+6x44liEMNc/4+
	KMpu9parwn24DRs1NakQWEKiccINnbF1zR+9dWsaPGuR6p4sHNEbzR+RgsxbScNFF4J1dus15+C
	23JluCLM3N2n3xYfnmG/b67q31WevsiqsfMXkgCDFWyBfxk19jc0Kc4WepyhS6Pr7MBLvWeLmER
	a+Qc9quZab7tbIYwqJlW3yJdr4biyOph4oROjGc21ZBjH5pJTJqFBCUqy31jV2NWsQr+zKg0Sb+
	/CEns7Ah656EburRjFmhOOBu1KnmCPXIcqM0=
X-Received: by 2002:a17:902:fc4f:b0:2a9:6414:71a4 with SMTP id d9443c01a7336-2ab505146femr151882845ad.16.1771353437916;
        Tue, 17 Feb 2026 10:37:17 -0800 (PST)
X-Received: by 2002:a17:902:fc4f:b0:2a9:6414:71a4 with SMTP id d9443c01a7336-2ab505146femr151882425ad.16.1771353437289;
        Tue, 17 Feb 2026 10:37:17 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a738220sm110424095ad.37.2026.02.17.10.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:37:16 -0800 (PST)
Date: Wed, 18 Feb 2026 00:07:10 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 4/9] net: stmmac: qcom-ethqos: move
 qcom_ethqos_set_sgmii_loopback() up
Message-ID: <aZS1ViyPMUmk/+IH@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPB-000000093mT-1lwv@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPB-000000093mT-1lwv@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX1ChCmw+rreGV
 /Go0YXeOUAqfeXMI3f5xeVA00Oy+zkad8y3FaoKMdI1H2V+qr9fiYJNPJxpK3KgTIFsJkw850az
 lF3dNxQ6B4ZceJKD/lLUy+XUnnCUMJI0u4F7yFs7OoonQ8PwRM9p+I0vr/19B0TCOseGK0bFS1v
 1Kr/82PzZnBDDt9llbYDdtCyFeeGXv4gxmK8y8k7fdkhbK3soMaD2sfw0s5u8SGsoqTk3DOwYFZ
 HkOoCYE/9Ex59aDarlT1/3BhWdNLD0u50a4FMieRqOW7VZjrURokRVePVrVnqnF+7tQzrJ57ubR
 QL9Qn/+nij0luPR0EYukpHrqk5fFztEbARR0o9u4qLLrqAlKnU2dPxTqF8d9+/mY7EKplKIphZ9
 UQTi6w4bHWuEckt+Ezo3kmwf2TmpwObcoWvwrdkIRZ57WLDyI1PZ4CniMDMiqN7gq0dMM7Vsgr9
 danclu0ALGoPCINbHTg==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=6994b55e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=PQJxtWgwoR3tQ6wQTWQA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: 2Lv-Ky9TPm_yt4dM6EmlIm28ZnCzEOBq
X-Proofpoint-ORIG-GUID: 2Lv-Ky9TPm_yt4dM6EmlIm28ZnCzEOBq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93217-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,armlinux.org.uk:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B94F14F393
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:18:01AM +0000, Russell King (Oracle) wrote:
> ethqos_set_func_clk_en() configures both SGMII loopback and the RGMII
> functional clock setting. qcom_ethqos_set_sgmii_loopback() is only
> called from within ethqos_set_func_clk_en(), and checks for
> PHY_INTERFACE_MODE_2500BASEX.
> 
> Move qcom_ethqos_set_sgmii_loopback() to the callers of
> ethqos_set_func_clk_en() except for ethqos_configure_rgmii() where we
> know that ethqos->phy_mode will not be PHY_INTERFACE_MODE_2500BASEX.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

