Return-Path: <linux-arm-msm+bounces-110865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /yEvONBYH2plkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:27:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 544D76326A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:27:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dv05aFtM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PxSgwJQP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110865-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110865-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 851D430B28C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 22:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33B83C81B6;
	Tue,  2 Jun 2026 22:24:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C393BB104
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 22:24:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780439086; cv=none; b=SIhMmnm0acDX9Q6048dYwR2tF+aJ6hQdn0bL5HO3dPY6gmIX4lTLy4t8VkkgX3bB/bSXFntedcruV/y1U/VYLldI+Tx47AvFcWWtH+7BN0Jj0jrqUu0Llo6ii/CgmhekcsnngYUq5qSdXOPgyhgWjNw8euBd4KhR2yzFM9um4Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780439086; c=relaxed/simple;
	bh=3w4W63xsG2++dPCs7ogqk5Rw8JmFxMFLrWxtVoquP6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ofuytWswFIDuNYOFcI/tZzPD6TeiA+usdG8OMSOPZ1iqAcEFkp3pQoQeTV1uFfEh8GnrY5wC8oqVK8JiBYS6oWFZKf/DsmB5aVSXOUTcDAGpAt1spZLgyivBGTeSKJSRK/7Y7s9btYyFD4+ObJk3xs0Gkx0dsQocZT9nfgQJMMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dv05aFtM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PxSgwJQP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652KWswv3803745
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 22:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/5zy6XbjJJB6n/FuzDKwDIAc3x2b9RV3asGSb1UkAE=; b=dv05aFtMr6OD4M9K
	2a6dCDS2WcA7jB0tAgLvUx+KArCmKAJYnY6SfOg3IQ/v0o+k5dAwl0dguGNc84+0
	UpOhiWMRd3T8COjXKwMIkQUl6TDPHe0PLfmdRaFFtx6cDx9XwtcAHfxdpennUOvK
	zzqOPHQgBg/SQk8HyKSNh6ddXlbREY4VgsrVlPZO9Y0LALCdEowwrv7SOyNCE1uv
	izd2xiidS0kPWS5yUp14TA/UYEa4+sffmWUDmkHXsuYGKJy+hPXYBjeLkp/76vYw
	4vKraWOO+iAxusquW+5KvVrTnQc5E9p8xBJ2bezWcGBBU2PrnVRpd3umjFVlmsl7
	cQHZig==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9gdsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 22:24:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1dece2ecso52790925ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 15:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780439084; x=1781043884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/5zy6XbjJJB6n/FuzDKwDIAc3x2b9RV3asGSb1UkAE=;
        b=PxSgwJQPxvKRXinssiTjwD/FREVCw5BRpInxDu7P+bptzTdZnY8eE4Op7RUDHVM1f6
         qWYK9lrkWTfPP0IJiQ0/mtfCavbU6a47pNS8Z4GHQh7J/Q6UGjPf9Gdg3RSOJRZdfKsD
         6kr6buh3q7dlOm32sH9bkacewiUIC24wh9BeXtZwr61cWXhAkvUB9OAGnT2781xVfce9
         QISIgdtHu7Wt1ykqAN8CJ1/Ycdz+w6sM3UtBoXJyUsVL1F7zEW2kZHi5FAr5aIufbnfP
         H1xQMktU/FIA6oN//1HF0JrZPjtsjp2AWdXNIzmWEz5zg6+fHkNT6aLoL3OuW0djARfb
         hwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780439084; x=1781043884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b/5zy6XbjJJB6n/FuzDKwDIAc3x2b9RV3asGSb1UkAE=;
        b=lIkwIGpsM2pyTMkqGQX0smEJU9fPRvBsx4hVMQ9BsWIovUB/BxnLlnUosCDFZz3RHm
         Vez2wReBLx0vdEshjXw6jSxdF8DdQzt9xq2EI4Td6XxM4TEex8laN914VcQvEaJjSKFv
         XVTL4GKtOjg5gwv99vOC2HN8hNX9o5YItck78ae0b2AFkM3KnBdcsxpDNuHP3GNVf7Vw
         aJuBYDzHXBlYQ0RuCUr7aD8ckOh3SgoYhqWA7mjeLDkk2dFegrt7rB1L7osBOA/aR6ez
         xO7cZ1hIoj5IpSCoxLIsGjvxKmtcXDV9vECx+TWyldBH6LKoFa/I4gK99MecNEqgLGSq
         fXhQ==
X-Gm-Message-State: AOJu0Yxao2zuKXwhxNef/veymk2QoK7hSkshcWJCoij9ciRP13uokeKh
	vmlNzrpsxIuPVG2xxJbH3r0lvRYbY8/WkuqEue3BCgWw+SMb8Urt4x5e8YzdanDZa5FprsJwXNp
	vwFu3amk6D5ulMTsdmO2/lY2NxunQ8YyXkIAyaaPJhjtdIIhWSTOPIqMiXKq0pDp6+JPeyisK5U
	/C
X-Gm-Gg: Acq92OFLecjbA633bKqMB5S9e0vfl1Ea6J1C9qbJGakNBcUDCARJmUvNgP0qCujq5me
	HrG7EwwGRJTFfl0euhYr/7tZcikSvJYk/5OKcGnH43T4zPOE9tP6MZEeTMv5QrAjJAnRXGPoH/2
	c4388ebrrXv6bmBNPS83mMlc5ucJdZUWO8VKV5lwhRUGeNX1OfoXIRhXXwnqCLgTgzzdMBDNhsY
	KKlaL3FpapRyh+nULYGMKES915eBslsMHLlWevWTN3u2K62ovevYGkrByG448Fdc0xJx4pqKKV7
	x7yZJd4IJP0Cj1pAncOOD45zT59bZxErOEDmV91h3vr0KfwWQrfT/YZW4ch1U5Sk2l4iVfn98mE
	kdUh5n46bQ2TD6cj9IjxR4YqClha04edFyAov5CZkg2AuRKljaHQeT2BhI8n6iRkwMOHflA==
X-Received: by 2002:a17:903:3bcf:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c1644e4d16mr5741925ad.37.1780439084317;
        Tue, 02 Jun 2026 15:24:44 -0700 (PDT)
X-Received: by 2002:a17:903:3bcf:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c1644e4d16mr5741585ad.37.1780439083807;
        Tue, 02 Jun 2026 15:24:43 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0ecsm2698035ad.45.2026.06.02.15.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:24:43 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 03:53:55 +0530
Subject: [PATCH v10 3/5] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE
 init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-enable-ice-clock-scaling-v10-3-b0b728435356@oss.qualcomm.com>
References: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
In-Reply-To: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 3GLbhbDGTndbAXv1r9wKBhD_3AT3d_I1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIxNyBTYWx0ZWRfXxuL5SmCmwpOI
 knTLTUG9VHT/Ee0dB7D6dc6/gWS1z7wFwlGYzK77LkiY1tZ8+L1V8QFTN1xs6EOnjLek9wCx9Gi
 pI+XeCayn7Nx6tmzls9Vk9jyBD59RrcX4mQFIPPvlUk4G//RT5ao21oY+YP/sjgM5xcby6lwA0g
 rJ7cFyQIaSmNjSJaj8MsbR3LCeISohsPT9CpXk5gS1b4VCvd0HsmN3tSdycZimDdYmK++jVAcqo
 sXCaUiGwdsrNI+hORO1Tm7idRYd40WmKw7+jiIs5rC5SfKWYV+wp+C3s2ghPL1ktAyfJHEaOAjY
 Vz4m30EXEa1MTDarTxEuSI3xOHx1O9CaMRQ2aT4SZ+EqsKRw1j2mQ/AhjkOnQPHuQJcnVc+XTax
 LeGNQ984fppR6Jx7wy/cGx/5ttVSXbqOM11QLTLF0KQN0e1Zr8noJ3GcB2tF9UgCqjkMtugbFr5
 zh5zfF1TdmgnY+p34Yg==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a1f582d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=PzEurhthzZq-M9kHIYIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 3GLbhbDGTndbAXv1r9wKBhD_3AT3d_I1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110865-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,intel.com:email];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:abhinaba.rakshit@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:~];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 544D76326A4

MMC controller lacks a clock scaling mechanism, unlike the UFS
controller. By default, the MMC controller is set to TURBO mode
during probe, but the ICE clock remains at XO frequency,
leading to read/write performance degradation on eMMC.

To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
to align it with the controller clock. This ensures consistent
performance and avoids mismatches between the controller
and ICE clock frequencies.

For platforms where ICE is represented as a separate device,
use the OPP framework to vote for TURBO mode, maintaining
proper voltage and power domain constraints.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 0882ce74e0c9bdddd98341a67b97bcef74078e0c..b655bcb5b90c0677bbe3dc6140de488038fe5ee8 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1901,6 +1901,8 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 #ifdef CONFIG_MMC_CRYPTO
 
 static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
+static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
+				   bool round_ceil); /* forward decl */
 
 static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 			      struct cqhci_host *cq_host)
@@ -1959,6 +1961,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	}
 
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
+
+	err = sdhci_msm_ice_scale_clk(msm_host, ULONG_MAX, false);
+	if (err && err != -EOPNOTSUPP)
+		dev_warn(dev, "Unable to boost ICE clock to TURBO\n");
+
 	return 0;
 }
 
@@ -1984,6 +1991,16 @@ static int sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
 	return 0;
 }
 
+static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host,
+				   unsigned long target_freq,
+				   bool round_ceil)
+{
+	if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
+		return qcom_ice_scale_clk(msm_host->ice, target_freq, round_ceil);
+
+	return 0;
+}
+
 static inline struct sdhci_msm_host *
 sdhci_msm_host_from_crypto_profile(struct blk_crypto_profile *profile)
 {
@@ -2149,6 +2166,13 @@ sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
 {
 	return 0;
 }
+
+static inline int
+sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
+			bool round_ceil)
+{
+	return 0;
+}
 #endif /* !CONFIG_MMC_CRYPTO */
 
 /*****************************************************************************\

-- 
2.34.1


