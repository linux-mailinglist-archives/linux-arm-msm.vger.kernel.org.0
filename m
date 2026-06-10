Return-Path: <linux-arm-msm+bounces-112362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3a0DFWgqKWptRwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:12:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FEA667B05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:12:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=K3tYPK5R;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bGMgl6Z5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112362-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112362-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BFDC3236610
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D153B19B7;
	Wed, 10 Jun 2026 08:52:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB523C872A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081570; cv=none; b=AbHGqWZynr4R2otkQRhN7I7v3gVFuik0dAf9HlwwqemRrynLnYJJn+R8OF+MWZswF/F+tkmfCe5//YSHBmaS1EvPvZjLN1vQm5h/p0ydqKNcaQ4spWu7C0XQM2tg68sYnY/rA9WUa+h+1UyCil+MLVOtBFyIS28KBsA8G6hNS/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081570; c=relaxed/simple;
	bh=qb00PuDcbyAIr57uzPNiYUtmvvlQsMTQ5/D7nqo0M1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R3g9Vh91kohtLgApE/BVPIRWgrlTF7m8nN2ppQhKDtgxBVDD67aBW5tEt9PnITmdIocV7AL+wk/ieja5/wbSYkqlv0ET5bNGx5UG+guoHOY7wAateDt+02YyX9MaypVo0tfNtteqpfDXIY4mGSz9CECqNROFUkQNikftSt/5x40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3tYPK5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGMgl6Z5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iI19988894
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLRO6Pbdcj4iSKEC+ywsG8UsRVU/ao5vEKU8SWtoud8=; b=K3tYPK5RhSg85BP5
	aTtwTwYqO6sbfQlA3takZKEt82tfrUX6kWRvIEyHigbt+dHYPnD/fMD3zLkFyBl7
	JDLRHyEBjGUl4g1C4HhyANlWWJVSQgJOecIP9yYIhu3me6+8s3Y1RNPjkMTTZQNL
	XrimnVYi3/W3HvVXnT18el/ha6BNjIhxmYyva+FZK18H4T4vyyMlMTSQqjt6cwvB
	PKHiAglkl8Le2zBAdv8XK/wXF2et1kmtmKfvdQwVprkLdCCLhhYlchI957F6p6CA
	BtgXeopxZm9y6zeA8wuA4rTfQKY3TK3GhKj2X4X93T+x3RsSwxV2RdoniTdRZ8Tr
	R3+LzQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2seggu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c1e08848so88595465ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081565; x=1781686365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLRO6Pbdcj4iSKEC+ywsG8UsRVU/ao5vEKU8SWtoud8=;
        b=bGMgl6Z5Xc7ctqLny80gTS5hhvusVvHeoZgF9G5xF75MCtapGcQakOnfIyaJHmGPQ6
         A8HGPcNO1U2PyRD6uHIrlsKRMnyqbhvn4RoI5LJUdkqHYZLN285SAMPp8FjDN4XlAcAv
         bi8DOegGLj339+k0N41r+AFQmBUZINFIhK74twwlhQt1SXu3fiecISbgGFAUqJfHj447
         fZ/930GBHfZVHfGLUr+oYColfCO9Gku+YcpH903cCrMvH/UNVxtmRZ09lDiF6hluNcz4
         NBTrJsCoadManhHOXG0CRjia6PBo4SgsFvFsYzOmxAKxPs0SucUJURlt/dbUIwGDT3uO
         NWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081565; x=1781686365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vLRO6Pbdcj4iSKEC+ywsG8UsRVU/ao5vEKU8SWtoud8=;
        b=oMdoMZglTRWmUGgdsXT83+zmAaFINFqaIetEgqlmHSP8Y7lNMmYTNO/UOhZWbGj6Hq
         T6i+/EB08zSWLSzb0gYc03Z4B9CfeG7etEKp5X6Cq1+Q5gohAP76bhkTXB/sqnCn4xPH
         nraLQ8Sq+t9/U1kDLpNYMxmVlUBYyjB57V/hdwdV671n2uC4UcxuHBDnoYIN+Jhq+KYa
         mjiJtVk1WOEN++qHCbOsKaWDfAYgBiFj6BvRccphfcWSn3GfKC8Xe7/CAh4S/KIOeebP
         N6ys+LoX0CEudVqY9zTtJySV3n7TZJqCMiJ/WfrMqRYJqOfyxWIGcf5AwwaFafKnLEei
         VR1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/KrvAKGb2STmw71O3AH2cHgg6BOAdlnVaCYolQXrSCOjhrPGuv5NQaU3g3KM4Ho8qIup9JuKc8z7SKoO6I@vger.kernel.org
X-Gm-Message-State: AOJu0YxN88XOUwRcqk65JSXmYFhnBwMu3odrSPUq8XmeMWUp0IyX4e1V
	XLCkxU6n2LeUnmTifGbkWsq0Y1EgEPFs3psWm6llsCfJR8RgHoQrGYaVToukEX25ma48sg/SzBF
	08xAwdXVw/TzUXfJ2KOmsCgsi29SGxDXdQIwO7jOirLKnQxf0SnJprHnKn1eWtbbNpqR9
X-Gm-Gg: Acq92OETvPqyoNGAy12dDxyrHqA6Tn3hDh+0baTvKbC/Xt/Q5ZUUKBVm5NadwVa6rBP
	EAlZMG/ioqC+xUF9IeRK9XsHoY9KyM2ARNXgkX4lPoUCpvntpVe7sRNkWtRDo5ZLL2ayplsWtfv
	Ku0+ma/nfyPFUHwGVTqhuvBaj7AGzMrS8Vij1XAQMsMTifTB9bHiAdTzXGmYjEQh+1iOfQXEt7i
	5XuYVdNBksDlWCYa2hefEabwEfhlzTgVXuoNE1NuPQ2rGf92TPxuIoI4j27onAooXZGUd1lMBTp
	ECxbgRLlG7MJR+IaN+X0kZfR5WYMMu0TLjvR+AgMcYLiKX42M1trwnJJIftt8x0oF1C1QDX6ECV
	n5mWnHydGH4+E88rgIoOP4bU8ybHjvSJbYXqmZ9pFxNfTQfrkgrLlEDJBvs/8BQtF+k8ogiPjgo
	flGDZ8oWGzyEZRJvxIe8Lxmxu9ox4dJgepmPWXEIIlZw7UXb2NagszKhu7HTw=
X-Received: by 2002:a17:902:e84c:b0:2c2:8659:da2c with SMTP id d9443c01a7336-2c2a1bcd6d3mr80610485ad.14.1781081565054;
        Wed, 10 Jun 2026 01:52:45 -0700 (PDT)
X-Received: by 2002:a17:902:e84c:b0:2c2:8659:da2c with SMTP id d9443c01a7336-2c2a1bcd6d3mr80609945ad.14.1781081564288;
        Wed, 10 Jun 2026 01:52:44 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:43 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:34 +0530
Subject: [PATCH RFC v7 7/9] PM / devfreq: Introduce the QCOM SCMI Memlat
 devfreq driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-7-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=41524;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=9HpSEzN3z9wGdtTNEYwr4Xz5y1MGY13Rr9W42hE+bYA=;
 b=KW9odDUxxPymfdgUdSOOdEzG1Y+z9KGaZlIAIFeYe41p3XNuXTlZwufcEf4Fh74boX/0ELzF3
 YFWf5g0aI4FCb3QJv8xfuvoqpbC0B11u7THpVUXVHqp8NiIqwzJi2Li
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: b98HvgKX085pBvqx3ToYs1No7C6Jw8oW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX1StVhBZhEl6z
 7mFel2PAUSt1hjT8UE4EItYOXrt+1QKmlAYd8QUeLHPVbSTfZo+Wd7Syr/rdrdjyZm72FhE0H0y
 QO9/eIBv7yE5D7piIbVOB/N9+JvoMEXVgDfaCh2zFT1Am/+BJklWttPcze2p9gGT3D57WEmSVve
 DWufbo9Jrj/07wusu0Wg6GkKfd34REuVdzSxUu7prIkrt2zZRyCRpX38Na5DWllgxijMKEHSd4G
 dWrFu4xPGzx2cLQ4LGDypiyXrL482FV48fEcdsF4jQtN3EnfYZ+m7xfjjxesem4vgSTOGD28rzA
 cXwhzSShemB0ixqYl0ZaizRE/j+TvqfzPDdpJZiA5jdBUrCAz8tc//qdXp291PXxZEy1dzwM04i
 YrRp7Mf1KIDq2U6w8lQBh3ISE+rW4MSkZDv5qfjWzrkiPVnu85hMmIQJgRAB3ilIok5mumxYBK1
 OfA+pKf/eGQ4l9JdgiA==
X-Proofpoint-ORIG-GUID: b98HvgKX085pBvqx3ToYs1No7C6Jw8oW
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a2925de cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cq_nS-vLBsE7nuxwGFYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
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
	TAGGED_FROM(0.00)[bounces-112362-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,oss.qualcomm.com,samsung.com,gmail.com,nvidia.com];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:pragnesh.papaniya@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:amir.vajid@oss.qualcomm.com,m:ramakrishna.gottimukkula@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,pdevinfo.id:url,qualcomm.com:dkim,qualcomm.com:email,pdevinfo.name:url];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66FEA667B05

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Glymur, Mahua and X1E/X1P (Hamoa) SoCs, the memlat governor and
the mechanism to control the various caches and RAM is hosted on the CPU
Control Processor (CPUCP), and configuration and control of this governor
is exposed through the QCOM SCMI Generic Extension Protocol, addressed via
the "MEMLAT" algorithm string.

Introduce a devfreq SCMI client driver that uses the MEMLAT algorithm
string to detect memory-latency-bound workloads and control the
frequency/level of the memory buses (DDR, LLCC and DDR_QOS). Model each bus
as a devfreq device using the remote devfreq governor. This provides basic
insight into device operation via trans_stat and allows further tuning of
the remote governor's parameters from userspace.

Co-developed-by: Amir Vajid <amir.vajid@oss.qualcomm.com>
Signed-off-by: Amir Vajid <amir.vajid@oss.qualcomm.com>
Co-developed-by: Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
Signed-off-by: Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 drivers/devfreq/Kconfig                    |  13 +
 drivers/devfreq/Makefile                   |   1 +
 drivers/devfreq/scmi-qcom-memlat-cfg.h     | 573 +++++++++++++++++++++++++++
 drivers/devfreq/scmi-qcom-memlat-devfreq.c | 616 +++++++++++++++++++++++++++++
 4 files changed, 1203 insertions(+)

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index 2caa87554914..98b5a50d3189 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -169,6 +169,19 @@ config ARM_SUN8I_A33_MBUS_DEVFREQ
 	  This adds the DEVFREQ driver for the MBUS controller in some
 	  Allwinner sun8i (A33 through H3) and sun50i (A64 and H5) SoCs.
 
+config SCMI_QCOM_MEMLAT_DEVFREQ
+	tristate "Qualcomm Technologies Inc. SCMI client driver"
+	depends on QCOM_SCMI_GENERIC_EXT || COMPILE_TEST
+	select DEVFREQ_GOV_REMOTE
+	help
+	  This driver uses the MEMLAT (memory latency) algorithm string
+	  hosted on QCOM SCMI Vendor Protocol to detect memory latency
+	  workloads and control frequency/level of the various memory
+	  buses (DDR/LLCC/DDR_QOS).
+
+	  This driver defines/documents the parameter IDs used while configuring
+	  the memory buses.
+
 source "drivers/devfreq/event/Kconfig"
 
 endif # PM_DEVFREQ
diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
index cde57c8cda76..b11f94e2f485 100644
--- a/drivers/devfreq/Makefile
+++ b/drivers/devfreq/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_ARM_MEDIATEK_CCI_DEVFREQ)	+= mtk-cci-devfreq.o
 obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)	+= rk3399_dmc.o
 obj-$(CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ)	+= sun8i-a33-mbus.o
 obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra30-devfreq.o
+obj-$(CONFIG_SCMI_QCOM_MEMLAT_DEVFREQ)	+= scmi-qcom-memlat-devfreq.o
 
 # DEVFREQ Event Drivers
 obj-$(CONFIG_PM_DEVFREQ_EVENT)		+= event/
diff --git a/drivers/devfreq/scmi-qcom-memlat-cfg.h b/drivers/devfreq/scmi-qcom-memlat-cfg.h
new file mode 100644
index 000000000000..1ab8b61ea271
--- /dev/null
+++ b/drivers/devfreq/scmi-qcom-memlat-cfg.h
@@ -0,0 +1,573 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DRIVERS_DEVFREQ_SCMI_QCOM_MEMLAT_CONFIG_H__
+#define __DRIVERS_DEVFREQ_SCMI_QCOM_MEMLAT_CONFIG_H__
+
+/*
+ * Memlat Effective Frequency Calculation Method
+ * CPUCP_EFFECTIVE_FREQ_METHOD_0 - Uses CPU Cycles and CONST Cycles to calculate
+ * CPUCP_EFFECTIVE_FREQ_METHOD_1 - Uses CPU Cycles and time period
+ */
+#define CPUCP_EFFECTIVE_FREQ_CALC_METHOD_0	0
+#define CPUCP_EFFECTIVE_FREQ_CALC_METHOD_1	1
+
+#define EV_CPU_CYCLES		0
+#define EV_CNT_CYCLES		1
+#define EV_INST_RETIRED		2
+#define EV_STALL_BACKEND_MEM	3
+#define EV_L2_D_RFILL		5
+#define INVALID_IDX		0xff
+
+#define MEMLAT_ALGO_STR		0x4D454D4C4154ULL /* MEMLAT */
+
+struct scmi_qcom_map_table {
+	unsigned int cpu_freq;
+	unsigned int mem_freq;
+};
+
+struct scmi_qcom_opp_data {
+	unsigned long freq;
+	unsigned int level;
+};
+
+struct scmi_qcom_memory_range {
+	unsigned int min_freq;
+	unsigned int max_freq;
+};
+
+enum common_ev_idx {
+	INST_IDX,
+	CYC_IDX,
+	CONST_CYC_IDX,
+	FE_STALL_IDX,
+	BE_STALL_IDX,
+	NUM_COMMON_EVS
+};
+
+enum grp_ev_idx {
+	MISS_IDX,
+	WB_IDX,
+	ACC_IDX,
+	NUM_GRP_EVS
+};
+
+/*
+ * CPUCP firmware identifies memory groups by a small integer (the hw_type
+ * carried in node_msg / scalar_param_msg / map_param_msg / ev_map_msg). The
+ * encoding is shared between the cfg tables below and scmi_qcom_devfreq_get_cur_freq()
+ * which special-cases DDR_QOS as a level-based bus rather than a frequency-scaled one.
+ */
+enum scmi_qcom_memlat_hw_type {
+	MEMLAT_HW_DDR			= 0,
+	MEMLAT_HW_LLCC			= 1,
+	MEMLAT_HW_DDR_QOS_COMPUTE	= 2,
+};
+
+struct scmi_qcom_monitor_cfg {
+	const struct scmi_qcom_map_table *table;
+	const char *name;
+	u32 be_stall_floor;
+	u32 cpu_mask;
+	u32 ipm_ceil;
+	int table_len;
+};
+
+struct scmi_qcom_memory_cfg {
+	const struct scmi_qcom_monitor_cfg *monitor_cfg;
+	const struct scmi_qcom_opp_data *mem_table;
+	struct scmi_qcom_memory_range memory_range;
+	const u32 *grp_ev;
+	const char *name;
+	u32 memory_type;
+	int monitor_cnt;
+	int num_opps;
+};
+
+struct scmi_qcom_memlat_cfg_data {
+	const struct scmi_qcom_memory_cfg *memory_cfg;
+	const u32 *common_ev;
+	u32 cpucp_freq_method;
+	u32 cpucp_sample_ms;
+	int memory_cnt;
+};
+
+static const u32 glymur_common_ev[NUM_COMMON_EVS] = {
+	[INST_IDX]      = EV_INST_RETIRED,
+	[CYC_IDX]       = EV_CPU_CYCLES,
+	[CONST_CYC_IDX] = EV_CNT_CYCLES,
+	[FE_STALL_IDX]  = INVALID_IDX,
+	[BE_STALL_IDX]  = EV_STALL_BACKEND_MEM,
+};
+
+static const u32 glymur_ddr_grp_ev[NUM_GRP_EVS] = {
+	[MISS_IDX] = EV_L2_D_RFILL,
+	[WB_IDX]   = INVALID_IDX,
+	[ACC_IDX]  = INVALID_IDX,
+};
+
+static const u32 glymur_llcc_grp_ev[NUM_GRP_EVS] = {
+	[MISS_IDX] = EV_L2_D_RFILL,
+	[WB_IDX]   = INVALID_IDX,
+	[ACC_IDX]  = INVALID_IDX,
+};
+
+static const u32 glymur_ddr_qos_grp_ev[NUM_GRP_EVS] = {
+	[MISS_IDX] = EV_L2_D_RFILL,
+	[WB_IDX]   = INVALID_IDX,
+	[ACC_IDX]  = INVALID_IDX,
+};
+
+static const u32 hamoa_common_ev[NUM_COMMON_EVS] = {
+	[INST_IDX]      = EV_INST_RETIRED,
+	[CYC_IDX]       = EV_CPU_CYCLES,
+	[CONST_CYC_IDX] = EV_CNT_CYCLES,
+	[FE_STALL_IDX]  = INVALID_IDX,
+	[BE_STALL_IDX]  = EV_STALL_BACKEND_MEM,
+};
+
+static const u32 hamoa_ddr_grp_ev[NUM_GRP_EVS] = {
+	[MISS_IDX] = EV_L2_D_RFILL,
+	[WB_IDX]   = INVALID_IDX,
+	[ACC_IDX]  = INVALID_IDX,
+};
+
+static const u32 hamoa_llcc_grp_ev[NUM_GRP_EVS] = {
+	[MISS_IDX] = EV_L2_D_RFILL,
+	[WB_IDX]   = INVALID_IDX,
+	[ACC_IDX]  = INVALID_IDX,
+};
+
+static const u32 hamoa_ddr_qos_grp_ev[NUM_GRP_EVS] = {
+	[MISS_IDX] = EV_L2_D_RFILL,
+	[WB_IDX]   = INVALID_IDX,
+	[ACC_IDX]  = INVALID_IDX,
+};
+
+static const struct scmi_qcom_opp_data glymur_llcc_table[] = {
+	{ .freq = 315000000 },
+	{ .freq = 479000000 },
+	{ .freq = 545000000 },
+	{ .freq = 725000000 },
+	{ .freq = 840000000 },
+	{ .freq = 959000000 },
+	{ .freq = 1090000000 },
+	{ .freq = 1211000000 },
+};
+
+static const struct scmi_qcom_opp_data hamoa_llcc_table[] = {
+	{ .freq = 300000000 },
+	{ .freq = 466000000 },
+	{ .freq = 600000000 },
+	{ .freq = 806000000 },
+	{ .freq = 933000000 },
+	{ .freq = 1066000000 },
+};
+
+static const struct scmi_qcom_opp_data glymur_ddr_table[] = {
+	{ .freq = 200000000 },
+	{ .freq = 547000000 },
+	{ .freq = 1353000000 },
+	{ .freq = 1555000000 },
+	{ .freq = 1708000000 },
+	{ .freq = 2092000000 },
+	{ .freq = 2736000000 },
+	{ .freq = 3187000000 },
+	{ .freq = 3686000000 },
+	{ .freq = 4224000000 },
+	{ .freq = 4761000000 },
+};
+
+static const struct scmi_qcom_opp_data hamoa_ddr_table[] = {
+	{ .freq = 200000000 },
+	{ .freq = 547000000 },
+	{ .freq = 768000000 },
+	{ .freq = 1555000000 },
+	{ .freq = 1708000000 },
+	{ .freq = 2092000000 },
+	{ .freq = 2736000000 },
+	{ .freq = 3187000000 },
+	{ .freq = 3686000000 },
+	{ .freq = 4224000000 },
+};
+
+/*
+ * DDR_QOS is a level-based bus (0 = nominal, 1 = boost), not a
+ * frequency-scaled one. The OPP entries below use synthetic frequencies
+ * (1 / 100) purely as distinct devfreq keys so trans_stat can show
+ * level transitions. scmi_qcom_devfreq_get_cur_freq() maps the firmware
+ * level back to the matching key.
+ */
+static const struct scmi_qcom_opp_data glymur_ddr_qos_table[] = {
+	{ .freq = 1, .level = 0 },
+	{ .freq = 100, .level = 1 },
+};
+
+static const struct scmi_qcom_memory_cfg glymur_memory_cfg[] = {
+	{
+		.memory_type = MEMLAT_HW_DDR,
+		.name = "ddr",
+		.mem_table = glymur_ddr_table,
+		.num_opps = ARRAY_SIZE(glymur_ddr_table),
+		.grp_ev = glymur_ddr_grp_ev,
+		.monitor_cnt = 4,
+		.memory_range = { .min_freq = 547000, .max_freq = 4761000},
+		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
+			{
+				.name = "mon_0",
+				.cpu_mask = 0x3f,
+				.ipm_ceil = 60000000,
+				.be_stall_floor = 1,
+				.table_len = 8,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 960, .mem_freq = 547000 },
+					{ .cpu_freq = 1133, .mem_freq = 1353000 },
+					{ .cpu_freq = 1594, .mem_freq = 1555000 },
+					{ .cpu_freq = 1920, .mem_freq = 1708000 },
+					{ .cpu_freq = 2228, .mem_freq = 2736000 },
+					{ .cpu_freq = 2362, .mem_freq = 3187000 },
+					{ .cpu_freq = 2650, .mem_freq = 3686000 },
+					{ .cpu_freq = 2938, .mem_freq = 4761000 },
+				}
+			},
+			{
+				.name = "mon_1",
+				.cpu_mask = 0xfc0,
+				.ipm_ceil = 60000000,
+				.be_stall_floor = 1,
+				.table_len = 8,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 356, .mem_freq = 547000 },
+					{ .cpu_freq = 1018, .mem_freq = 1353000 },
+					{ .cpu_freq = 1536, .mem_freq = 1555000 },
+					{ .cpu_freq = 1748, .mem_freq = 1708000 },
+					{ .cpu_freq = 2324, .mem_freq = 2736000 },
+					{ .cpu_freq = 2496, .mem_freq = 3187000 },
+					{ .cpu_freq = 2900, .mem_freq = 3686000 },
+					{ .cpu_freq = 3514, .mem_freq = 4761000 },
+				}
+			},
+			{
+				.name = "mon_2",
+				.cpu_mask = 0x3f000,
+				.ipm_ceil = 60000000,
+				.be_stall_floor = 1,
+				.table_len = 8,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 356, .mem_freq = 547000 },
+					{ .cpu_freq = 1018, .mem_freq = 1353000 },
+					{ .cpu_freq = 1536, .mem_freq = 1555000 },
+					{ .cpu_freq = 1748, .mem_freq = 1708000 },
+					{ .cpu_freq = 2324, .mem_freq = 2736000 },
+					{ .cpu_freq = 2496, .mem_freq = 3187000 },
+					{ .cpu_freq = 2900, .mem_freq = 3686000 },
+					{ .cpu_freq = 3514, .mem_freq = 4761000 },
+				}
+			},
+			{
+				.name = "mon_3",
+				.cpu_mask = 0x3ffff,
+				.table_len = 4,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 2823, .mem_freq = 547000 },
+					{ .cpu_freq = 3034, .mem_freq = 1555000 },
+					{ .cpu_freq = 3226, .mem_freq = 1708000 },
+					{ .cpu_freq = 5012, .mem_freq = 2092000 },
+				}
+			},
+		},
+	},
+	{
+		.memory_type = MEMLAT_HW_LLCC,
+		.name = "llcc",
+		.mem_table = glymur_llcc_table,
+		.num_opps = ARRAY_SIZE(glymur_llcc_table),
+		.grp_ev = glymur_llcc_grp_ev,
+		.monitor_cnt = 3,
+		.memory_range = { .min_freq = 315000, .max_freq = 1211000},
+		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
+			{
+				.name = "mon_0",
+				.cpu_mask = 0x3f,
+				.ipm_ceil = 60000000,
+				.be_stall_floor = 1,
+				.table_len = 7,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 960, .mem_freq = 315000 },
+					{ .cpu_freq = 1113, .mem_freq = 479000 },
+					{ .cpu_freq = 1594, .mem_freq = 545000 },
+					{ .cpu_freq = 1920, .mem_freq = 725000 },
+					{ .cpu_freq = 2362, .mem_freq = 840000 },
+					{ .cpu_freq = 2650, .mem_freq = 959000 },
+					{ .cpu_freq = 2938, .mem_freq = 1211000 },
+				}
+			},
+			{
+				.name = "mon_1",
+				.cpu_mask = 0xfc0,
+				.ipm_ceil = 60000000,
+				.be_stall_floor = 1,
+				.table_len = 7,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 356, .mem_freq = 315000 },
+					{ .cpu_freq = 1018, .mem_freq = 479000 },
+					{ .cpu_freq = 1536, .mem_freq = 545000 },
+					{ .cpu_freq = 1748, .mem_freq = 725000 },
+					{ .cpu_freq = 2496, .mem_freq = 840000 },
+					{ .cpu_freq = 2900, .mem_freq = 959000 },
+					{ .cpu_freq = 3514, .mem_freq = 1211000 },
+				}
+			},
+			{
+				.name = "mon_2",
+				.cpu_mask = 0x3f000,
+				.ipm_ceil = 60000000,
+				.be_stall_floor = 1,
+				.table_len = 7,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 356, .mem_freq = 315000 },
+					{ .cpu_freq = 1018, .mem_freq = 479000 },
+					{ .cpu_freq = 1536, .mem_freq = 545000 },
+					{ .cpu_freq = 1748, .mem_freq = 725000 },
+					{ .cpu_freq = 2496, .mem_freq = 840000 },
+					{ .cpu_freq = 2900, .mem_freq = 959000 },
+					{ .cpu_freq = 3514, .mem_freq = 1211000 },
+				}
+			},
+		},
+	},
+	{
+		.memory_type = MEMLAT_HW_DDR_QOS_COMPUTE,
+		.name = "ddr-qos",
+		.monitor_cnt = 3,
+		.mem_table = glymur_ddr_qos_table,
+		.num_opps = ARRAY_SIZE(glymur_ddr_qos_table),
+		.grp_ev = glymur_ddr_qos_grp_ev,
+		.memory_range = { .min_freq = 0, .max_freq = 1},
+		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
+			{
+				.name = "mon_0",
+				.cpu_mask = 0x3f,
+				.ipm_ceil = 80000000,
+				.be_stall_floor = 1,
+				.table_len = 2,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 2362, .mem_freq = 0 },
+					{ .cpu_freq = 2938, .mem_freq = 1 },
+				}
+			},
+			{
+				.name = "mon_1",
+				.cpu_mask = 0xfc0,
+				.ipm_ceil = 80000000,
+				.be_stall_floor = 1,
+				.table_len = 2,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 2496, .mem_freq = 0 },
+					{ .cpu_freq = 3514, .mem_freq = 1 },
+				}
+			},
+			{
+				.name = "mon_2",
+				.cpu_mask = 0x3f000,
+				.ipm_ceil = 80000000,
+				.be_stall_floor = 1,
+				.table_len = 2,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 2496, .mem_freq = 0 },
+					{ .cpu_freq = 3514, .mem_freq = 1 },
+				}
+			},
+		},
+	},
+};
+
+static const struct scmi_qcom_memory_cfg hamoa_memory_cfg[] = {
+	{
+		.memory_type = MEMLAT_HW_DDR,
+		.name = "ddr",
+		.mem_table = hamoa_ddr_table,
+		.num_opps = ARRAY_SIZE(hamoa_ddr_table),
+		.grp_ev = hamoa_ddr_grp_ev,
+		.monitor_cnt = 4,
+		.memory_range = { .min_freq = 200000, .max_freq = 4224000},
+		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
+			{
+				.name = "mon_0",
+				.cpu_mask = 0xf,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 6,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 999, .mem_freq = 547000 },
+					{ .cpu_freq = 1440, .mem_freq = 768000 },
+					{ .cpu_freq = 1671, .mem_freq = 1555000 },
+					{ .cpu_freq = 2189, .mem_freq = 2092000 },
+					{ .cpu_freq = 2516, .mem_freq = 3187000 },
+					{ .cpu_freq = 3860, .mem_freq = 4224000 },
+				}
+			},
+			{
+				.name = "mon_1",
+				.cpu_mask = 0xf0,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 6,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 999, .mem_freq = 547000 },
+					{ .cpu_freq = 1440, .mem_freq = 768000 },
+					{ .cpu_freq = 1671, .mem_freq = 1555000 },
+					{ .cpu_freq = 2189, .mem_freq = 2092000 },
+					{ .cpu_freq = 2516, .mem_freq = 3187000 },
+					{ .cpu_freq = 3860, .mem_freq = 4224000 },
+				}
+			},
+			{
+				.name = "mon_2",
+				.cpu_mask = 0xf00,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 6,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 999, .mem_freq = 547000 },
+					{ .cpu_freq = 1440, .mem_freq = 768000 },
+					{ .cpu_freq = 1671, .mem_freq = 1555000 },
+					{ .cpu_freq = 2189, .mem_freq = 2092000 },
+					{ .cpu_freq = 2516, .mem_freq = 3187000 },
+					{ .cpu_freq = 3860, .mem_freq = 4224000 },
+				}
+			},
+			{
+				.name = "mon_3",
+				.cpu_mask = 0xfff,
+				.table_len = 4,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 1440, .mem_freq = 547000 },
+					{ .cpu_freq = 2189, .mem_freq = 768000 },
+					{ .cpu_freq = 2516, .mem_freq = 1555000 },
+					{ .cpu_freq = 3860, .mem_freq = 2092000 },
+				}
+			},
+		},
+	},
+	{
+		.memory_type = MEMLAT_HW_LLCC,
+		.name = "llcc",
+		.mem_table = hamoa_llcc_table,
+		.num_opps = ARRAY_SIZE(hamoa_llcc_table),
+		.grp_ev = hamoa_llcc_grp_ev,
+		.monitor_cnt = 3,
+		.memory_range = { .min_freq = 300000, .max_freq = 1066000},
+		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
+			{
+				.name = "mon_0",
+				.cpu_mask = 0xf,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 6,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 999, .mem_freq = 300000 },
+					{ .cpu_freq = 1440, .mem_freq = 466000 },
+					{ .cpu_freq = 1671, .mem_freq = 600000 },
+					{ .cpu_freq = 2189, .mem_freq = 806000 },
+					{ .cpu_freq = 2516, .mem_freq = 933000 },
+					{ .cpu_freq = 3860, .mem_freq = 1066000 },
+				}
+			},
+			{
+				.name = "mon_1",
+				.cpu_mask = 0xf0,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 6,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 999, .mem_freq = 300000 },
+					{ .cpu_freq = 1440, .mem_freq = 466000 },
+					{ .cpu_freq = 1671, .mem_freq = 600000 },
+					{ .cpu_freq = 2189, .mem_freq = 806000 },
+					{ .cpu_freq = 2516, .mem_freq = 933000 },
+					{ .cpu_freq = 3860, .mem_freq = 1066000 },
+				}
+			},
+			{
+				.name = "mon_2",
+				.cpu_mask = 0xf00,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 6,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 999, .mem_freq = 300000 },
+					{ .cpu_freq = 1440, .mem_freq = 466000 },
+					{ .cpu_freq = 1671, .mem_freq = 600000 },
+					{ .cpu_freq = 2189, .mem_freq = 806000 },
+					{ .cpu_freq = 2516, .mem_freq = 933000 },
+					{ .cpu_freq = 3860, .mem_freq = 1066000 },
+				}
+			},
+		},
+	},
+	{
+		.memory_type = MEMLAT_HW_DDR_QOS_COMPUTE,
+		.name = "ddr-qos",
+		.monitor_cnt = 3,
+		.mem_table = glymur_ddr_qos_table,
+		.num_opps = ARRAY_SIZE(glymur_ddr_qos_table),
+		.grp_ev = hamoa_ddr_qos_grp_ev,
+		.memory_range = { .min_freq = 0, .max_freq = 1},
+		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
+			{
+				.name = "mon_0",
+				.cpu_mask = 0xf,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 2,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 2189, .mem_freq = 0 },
+					{ .cpu_freq = 3860, .mem_freq = 1 },
+				}
+			},
+			{
+				.name = "mon_1",
+				.cpu_mask = 0xf0,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 2,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 2189, .mem_freq = 0 },
+					{ .cpu_freq = 3860, .mem_freq = 1 },
+				}
+			},
+			{
+				.name = "mon_2",
+				.cpu_mask = 0xf00,
+				.ipm_ceil = 20000000,
+				.be_stall_floor = 1,
+				.table_len = 2,
+				.table = (const struct scmi_qcom_map_table[]) {
+					{ .cpu_freq = 2189, .mem_freq = 0 },
+					{ .cpu_freq = 3860, .mem_freq = 1 },
+				}
+			},
+		},
+	},
+};
+
+static const struct scmi_qcom_memlat_cfg_data glymur_memlat_data = {
+	.memory_cfg = glymur_memory_cfg,
+	.common_ev = glymur_common_ev,
+	.cpucp_freq_method = CPUCP_EFFECTIVE_FREQ_CALC_METHOD_1,
+	.cpucp_sample_ms = 4,
+	.memory_cnt = ARRAY_SIZE(glymur_memory_cfg),
+};
+
+static const struct scmi_qcom_memlat_cfg_data hamoa_memlat_data = {
+	.memory_cfg = hamoa_memory_cfg,
+	.common_ev = hamoa_common_ev,
+	.cpucp_freq_method = CPUCP_EFFECTIVE_FREQ_CALC_METHOD_1,
+	.cpucp_sample_ms = 4,
+	.memory_cnt = ARRAY_SIZE(hamoa_memory_cfg),
+};
+
+#endif
diff --git a/drivers/devfreq/scmi-qcom-memlat-devfreq.c b/drivers/devfreq/scmi-qcom-memlat-devfreq.c
new file mode 100644
index 000000000000..99ae229acfdc
--- /dev/null
+++ b/drivers/devfreq/scmi-qcom-memlat-devfreq.c
@@ -0,0 +1,616 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/cpu.h>
+#include <linux/devfreq.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_qcom_protocol.h>
+#include <linux/units.h>
+
+#define MAX_NAME_LEN				20
+#define MAX_MAP_ENTRIES				10
+
+#include "scmi-qcom-memlat-cfg.h"
+
+/**
+ * enum scmi_memlat_protocol_cmd - parameter_ids supported by the "MEMLAT" algo_str hosted
+ *                                 by the Qualcomm Generic Vendor Protocol on the SCMI controller.
+ *
+ * MEMLAT (Memory Latency) monitors the counters to detect memory latency bound workloads
+ * and scales the frequency/levels of the memory buses accordingly.
+ *
+ * @MEMLAT_SET_MEM_GROUP: initializes the frequency/level scaling functions for the memory bus.
+ * @MEMLAT_SET_MONITOR: configures the monitor to work on a specific memory bus.
+ * @MEMLAT_SET_COMMON_EV_MAP: set up common counters used to monitor the cpu frequency.
+ * @MEMLAT_SET_GRP_EV_MAP: set up any specific counters used to monitor the memory bus.
+ * @MEMLAT_IPM_CEIL: set the IPM (Instruction Per Misses) ceiling per monitor.
+ * @MEMLAT_BE_STALL_FLOOR: set the back-end stall floor per monitor.
+ * @MEMLAT_SAMPLE_MS: set the sampling period for all the monitors.
+ * @MEMLAT_MON_FREQ_MAP: setup the cpufreq to memfreq map.
+ * @MEMLAT_SET_MIN_FREQ: set the min frequency of the memory bus.
+ * @MEMLAT_SET_MAX_FREQ: set the max frequency of the memory bus.
+ * @MEMLAT_GET_CUR_FREQ: query the current frequency/level of the memory bus.
+ * @MEMLAT_START_TIMER: start all the monitors with the requested sampling period.
+ * @MEMLAT_STOP_TIMER: stop all the running monitors.
+ * @MEMLAT_SET_EFFECTIVE_FREQ_METHOD: set the method used to determine cpu frequency.
+ */
+enum scmi_memlat_protocol_cmd {
+	MEMLAT_SET_MEM_GROUP = 16,
+	MEMLAT_SET_MONITOR,
+	MEMLAT_SET_COMMON_EV_MAP,
+	MEMLAT_SET_GRP_EV_MAP,
+	MEMLAT_IPM_CEIL = 23,
+	MEMLAT_BE_STALL_FLOOR = 25,
+	MEMLAT_SAMPLE_MS = 31,
+	MEMLAT_MON_FREQ_MAP,
+	MEMLAT_SET_MIN_FREQ,
+	MEMLAT_SET_MAX_FREQ,
+	MEMLAT_GET_CUR_FREQ,
+	MEMLAT_START_TIMER = 36,
+	MEMLAT_STOP_TIMER,
+	MEMLAT_SET_EFFECTIVE_FREQ_METHOD = 39,
+};
+
+struct cpucp_map_table {
+	__le16 v1;
+	__le16 v2;
+};
+
+struct map_param_msg {
+	__le32 hw_type;
+	__le32 mon_idx;
+	__le32 nr_rows;
+	struct cpucp_map_table tbl[MAX_MAP_ENTRIES];
+} __packed;
+
+struct node_msg {
+	__le32 cpumask;
+	__le32 hw_type;
+	__le32 mon_type;
+	__le32 mon_idx;
+	char mon_name[MAX_NAME_LEN];
+};
+
+struct scalar_param_msg {
+	__le32 hw_type;
+	__le32 mon_idx;
+	__le32 val;
+};
+
+struct ev_map_msg {
+	__le32 num_evs;
+	__le32 hw_type;
+	__le32 cid[NUM_COMMON_EVS];
+};
+
+struct scmi_qcom_memlat_map {
+	unsigned int cpufreq_mhz;
+	unsigned int memfreq_khz;
+};
+
+struct scmi_qcom_monitor_info {
+	struct scmi_qcom_memlat_map *freq_map;
+	char name[MAX_NAME_LEN];
+	u32 mon_idx;
+	u32 mon_type;
+	u32 ipm_ceil;
+	u32 be_stall_floor;
+	u32 mask;
+	u32 freq_map_len;
+};
+
+struct scmi_qcom_memory_info {
+	struct scmi_qcom_monitor_info **monitor;
+	u32 hw_type;
+	int monitor_cnt;
+	u32 min_freq;
+	u32 max_freq;
+	struct devfreq_dev_profile profile;
+	struct devfreq *devfreq;
+	struct platform_device *pdev;
+	struct scmi_protocol_handle *ph;
+	const struct qcom_generic_ext_ops *ops;
+};
+
+struct scmi_qcom_memlat_info {
+	struct scmi_protocol_handle *ph;
+	const struct qcom_generic_ext_ops *ops;
+	const struct scmi_qcom_memlat_cfg_data *cfg_data;
+	struct scmi_qcom_memory_info **memory;
+	u32 cpucp_freq_method;
+	u32 cpucp_sample_ms;
+	int memory_cnt;
+};
+
+static int configure_cpucp_common_events(struct scmi_qcom_memlat_info *info,
+					 const struct scmi_qcom_memlat_cfg_data *cfg_data)
+{
+	const struct qcom_generic_ext_ops *ops = info->ops;
+	struct ev_map_msg msg = {};
+	int i;
+
+	msg.num_evs = cpu_to_le32(NUM_COMMON_EVS);
+	/* Common events apply to all groups; INVALID_IDX flags "no specific group". */
+	msg.hw_type = cpu_to_le32(INVALID_IDX);
+	for (i = 0; i < NUM_COMMON_EVS; i++)
+		msg.cid[i] = cpu_to_le32(cfg_data->common_ev[i]);
+
+	return ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR,
+			      MEMLAT_SET_COMMON_EV_MAP);
+}
+
+static int configure_cpucp_grp(struct device *dev, struct scmi_qcom_memlat_info *info,
+			       const struct scmi_qcom_memlat_cfg_data *cfg_data,
+			       int memory_index)
+{
+	const u32 *grp_ev = cfg_data->memory_cfg[memory_index].grp_ev;
+	struct scmi_qcom_memory_info *memory = info->memory[memory_index];
+	const struct qcom_generic_ext_ops *ops = info->ops;
+	struct ev_map_msg ev_msg = {};
+	struct node_msg msg = {};
+	int ret;
+	int i;
+
+	msg.cpumask = cpu_to_le32(*cpumask_bits(cpu_possible_mask));
+	msg.hw_type = cpu_to_le32(memory->hw_type);
+	msg.mon_type = 0;
+	msg.mon_idx = 0;
+	ret = ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR, MEMLAT_SET_MEM_GROUP);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to configure mem type %d\n",
+				     memory->hw_type);
+
+	ev_msg.num_evs = cpu_to_le32(NUM_GRP_EVS);
+	ev_msg.hw_type = cpu_to_le32(memory->hw_type);
+	for (i = 0; i < NUM_GRP_EVS; i++)
+		ev_msg.cid[i] = cpu_to_le32(grp_ev[i]);
+
+	ret = ops->set_param(info->ph, &ev_msg, sizeof(ev_msg), MEMLAT_ALGO_STR,
+			     MEMLAT_SET_GRP_EV_MAP);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to configure event map for mem type %d\n",
+				     memory->hw_type);
+
+	return ret;
+}
+
+static int configure_cpucp_mon(struct device *dev, struct scmi_qcom_memlat_info *info,
+			       int memory_index, int monitor_index)
+{
+	const struct qcom_generic_ext_ops *ops = info->ops;
+	struct scmi_qcom_memory_info *memory = info->memory[memory_index];
+	struct scmi_qcom_monitor_info *monitor = memory->monitor[monitor_index];
+	struct scalar_param_msg scalar_msg = {};
+	struct map_param_msg map_msg = {};
+	struct node_msg msg = {};
+	int ret;
+	int i;
+
+	msg.cpumask = cpu_to_le32(monitor->mask);
+	msg.hw_type = cpu_to_le32(memory->hw_type);
+	msg.mon_type = cpu_to_le32(monitor->mon_type);
+	msg.mon_idx = cpu_to_le32(monitor->mon_idx);
+	strscpy(msg.mon_name, monitor->name, sizeof(msg.mon_name));
+	ret = ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR, MEMLAT_SET_MONITOR);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to configure monitor %s\n",
+				     monitor->name);
+
+	scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
+	scalar_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
+	scalar_msg.val = cpu_to_le32(monitor->ipm_ceil);
+	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
+			     MEMLAT_IPM_CEIL);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to set ipm ceil for %s\n",
+				     monitor->name);
+
+	scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
+	scalar_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
+	scalar_msg.val = cpu_to_le32(monitor->be_stall_floor);
+	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
+			     MEMLAT_BE_STALL_FLOOR);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to set be_stall_floor for %s\n",
+				     monitor->name);
+
+	map_msg.hw_type = cpu_to_le32(memory->hw_type);
+	map_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
+	map_msg.nr_rows = cpu_to_le32(monitor->freq_map_len);
+	for (i = 0; i < monitor->freq_map_len; i++) {
+		map_msg.tbl[i].v1 = cpu_to_le16(monitor->freq_map[i].cpufreq_mhz);
+
+		/*
+		 * Wire format v2 is u16 in MHz; convert from kHz. For DDR_QOS
+		 * the table holds level indices (0 / 1) rather than real
+		 * frequencies, so pass them through unchanged.
+		 */
+		if (monitor->freq_map[i].memfreq_khz > 1)
+			map_msg.tbl[i].v2 = cpu_to_le16(monitor->freq_map[i].memfreq_khz / 1000);
+		else
+			map_msg.tbl[i].v2 = cpu_to_le16(monitor->freq_map[i].memfreq_khz);
+	}
+	ret = ops->set_param(info->ph, &map_msg, sizeof(map_msg), MEMLAT_ALGO_STR,
+			     MEMLAT_MON_FREQ_MAP);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to configure freq_map for %s\n",
+				     monitor->name);
+
+	scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
+	scalar_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
+	scalar_msg.val = cpu_to_le32(memory->min_freq);
+	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
+			     MEMLAT_SET_MIN_FREQ);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to set min_freq for %s\n",
+				     monitor->name);
+
+	scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
+	scalar_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
+	scalar_msg.val = cpu_to_le32(memory->max_freq);
+	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
+			     MEMLAT_SET_MAX_FREQ);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to set max_freq for %s\n", monitor->name);
+
+	return ret;
+}
+
+static int scmi_qcom_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
+{
+	struct scmi_qcom_memory_info *memory = dev_get_drvdata(dev);
+	const struct qcom_generic_ext_ops *ops = memory->ops;
+	struct scalar_param_msg scalar_msg = {};
+	u32 max_freq_khz = 0;
+	__le32 cur_freq;
+	int ret, i;
+
+	/*
+	 * MEMLAT_GET_CUR_FREQ returns target_freq for a single (hw_type,
+	 * mon_idx) tuple. The bus's actual voted frequency is the max across
+	 * all configured monitors in the group, so query each one and pick
+	 * the highest vote.
+	 */
+	for (i = 0; i < memory->monitor_cnt; i++) {
+		scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
+		scalar_msg.mon_idx = cpu_to_le32(memory->monitor[i]->mon_idx);
+		scalar_msg.val = 0;
+
+		ret = ops->get_param(memory->ph, &scalar_msg, sizeof(scalar_msg),
+				     MEMLAT_ALGO_STR, MEMLAT_GET_CUR_FREQ,
+				     sizeof(cur_freq));
+		if (ret < 0) {
+			dev_err(dev, "failed to get current frequency for %s\n",
+				memory->monitor[i]->name);
+			return ret;
+		}
+
+		/* qcom_scmi_common_xfer() returns the response into the same tx buffer. */
+		memcpy(&cur_freq, &scalar_msg, sizeof(cur_freq));
+		if (le32_to_cpu(cur_freq) > max_freq_khz)
+			max_freq_khz = le32_to_cpu(cur_freq);
+	}
+
+	/*
+	 * Frequency-scaled buses (DDR/LLCC) report cur_freq in kHz; convert
+	 * to Hz to match the devfreq OPP table units. Level-based buses
+	 * (e.g. DDR_QOS_COMPUTE) configure max_freq == 1 because the firmware
+	 * reports a 0/1 level rather than a frequency, and the matching
+	 * synthetic OPP keys (1 / 100) live in glymur_ddr_qos_table.
+	 */
+	if (memory->max_freq > 1)
+		*freq = max_freq_khz * 1000UL;
+	else
+		*freq = max_freq_khz ? 100 : 1;
+
+	return 0;
+}
+
+static void scmi_qcom_memlat_unwind(struct scmi_qcom_memlat_info *info, int count)
+{
+	for (int i = 0; i < count; i++) {
+		struct scmi_qcom_memory_info *memory = info->memory[i];
+
+		if (IS_ERR_OR_NULL(memory) || IS_ERR_OR_NULL(memory->pdev))
+			continue;
+
+		dev_pm_opp_remove_all_dynamic(&memory->pdev->dev);
+		platform_device_unregister(memory->pdev);
+	}
+}
+
+static int scmi_qcom_memlat_configure_events(struct scmi_device *sdev,
+					     struct scmi_qcom_memlat_info *info)
+{
+	const struct qcom_generic_ext_ops *ops = info->ops;
+	struct scmi_protocol_handle *ph = info->ph;
+	__le32 sample_ms, freq_method;
+	int i, j, ret;
+
+	/* Configure common events ids */
+	ret = configure_cpucp_common_events(info, info->cfg_data);
+	if (ret < 0)
+		return dev_err_probe(&sdev->dev, ret, "failed to configure common events\n");
+
+	for (i = 0; i < info->memory_cnt; i++) {
+		/* Configure per group parameters */
+		ret = configure_cpucp_grp(&sdev->dev, info, info->cfg_data, i);
+		if (ret < 0)
+			return ret;
+
+		for (j = 0; j < info->memory[i]->monitor_cnt; j++) {
+			/* Configure per monitor parameters */
+			ret = configure_cpucp_mon(&sdev->dev, info, i, j);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	/* Set loop sampling time */
+	sample_ms = cpu_to_le32(info->cpucp_sample_ms);
+	ret = ops->set_param(ph, &sample_ms, sizeof(sample_ms),
+			     MEMLAT_ALGO_STR, MEMLAT_SAMPLE_MS);
+	if (ret < 0)
+		return dev_err_probe(&sdev->dev, ret, "failed to set sample_ms\n");
+
+	/* Set the effective cpu frequency calculation method */
+	freq_method = cpu_to_le32(info->cpucp_freq_method);
+	ret = ops->set_param(ph, &freq_method, sizeof(freq_method),
+			     MEMLAT_ALGO_STR, MEMLAT_SET_EFFECTIVE_FREQ_METHOD);
+	if (ret < 0)
+		return dev_err_probe(&sdev->dev, ret,
+				     "failed to set effective frequency calc method\n");
+
+	/* Start sampling and voting timer */
+	ret = ops->start_activity(ph, NULL, 0, MEMLAT_ALGO_STR, MEMLAT_START_TIMER);
+	if (ret < 0)
+		return dev_err_probe(&sdev->dev, ret, "failed to start memory group timer\n");
+
+	for (i = 0; i < info->memory_cnt; i++) {
+		struct scmi_qcom_memory_info *memory = info->memory[i];
+		struct platform_device *pdev = memory->pdev;
+		struct devfreq_dev_profile *profile = &memory->profile;
+
+		/* sampling time should be double the devfreq observing time */
+		profile->polling_ms = max(1U, info->cpucp_sample_ms / 2);
+		profile->get_cur_freq = scmi_qcom_devfreq_get_cur_freq;
+		profile->initial_freq = memory->min_freq > 1 ?
+					(memory->min_freq * 1000UL) : memory->min_freq;
+
+		platform_set_drvdata(pdev, memory);
+
+		memory->devfreq = devm_devfreq_add_device(&pdev->dev, profile,
+							  DEVFREQ_GOV_REMOTE, NULL);
+		if (IS_ERR(memory->devfreq)) {
+			dev_err(&sdev->dev, "failed to add devfreq device\n");
+			/* Stop sampling and voting timer */
+			ret = ops->stop_activity(ph, NULL, 0, MEMLAT_ALGO_STR, MEMLAT_STOP_TIMER);
+			if (ret < 0)
+				dev_err_probe(&sdev->dev, ret,
+					      "failed to stop memory group timer\n");
+			return PTR_ERR(memory->devfreq);
+		}
+	}
+
+	return 0;
+}
+
+static struct scmi_qcom_memlat_map *
+scmi_qcom_parse_memlat_map(struct device *dev, const struct scmi_qcom_monitor_cfg *mon_cfg)
+{
+	struct scmi_qcom_memlat_map *map_table;
+	const struct scmi_qcom_map_table *table;
+
+	if (mon_cfg->table_len > MAX_MAP_ENTRIES)
+		return ERR_PTR(-EINVAL);
+
+	map_table = devm_kcalloc(dev, mon_cfg->table_len, sizeof(*map_table),
+				 GFP_KERNEL);
+	if (!map_table)
+		return ERR_PTR(-ENOMEM);
+
+	for (int i = 0; i < mon_cfg->table_len; i++) {
+		table = &mon_cfg->table[i];
+
+		map_table[i].cpufreq_mhz = table->cpu_freq;
+		map_table[i].memfreq_khz = table->mem_freq;
+	}
+
+	return map_table;
+}
+
+static const struct of_device_id scmi_qcom_memlat_configs[] = {
+	{ .compatible = "qcom,glymur", .data = &glymur_memlat_data},
+	{ .compatible = "qcom,mahua", .data = &glymur_memlat_data},
+	{ .compatible = "qcom,x1e80100", .data = &hamoa_memlat_data},
+	{ .compatible = "qcom,x1p42100", .data = &hamoa_memlat_data},
+	{ }
+};
+
+static int scmi_qcom_memlat_parse_cfg(struct scmi_device *sdev, struct scmi_qcom_memlat_info *info)
+{
+	const struct scmi_qcom_memlat_cfg_data *cfg_data;
+	struct scmi_qcom_monitor_info *monitor;
+	struct scmi_qcom_memory_info *memory;
+	int ret, i, j;
+
+	cfg_data = of_machine_get_match_data(scmi_qcom_memlat_configs);
+	if (!cfg_data) {
+		/*
+		 * The SCMI generic-ext protocol can bind on Qualcomm SoCs that
+		 * do not ship CPUCP memlat. Bail out quietly in that case rather
+		 * than printing an error on every such system.
+		 */
+		dev_dbg(&sdev->dev, "no memlat config data for this platform\n");
+		return -ENODEV;
+	}
+
+	info->memory = devm_kcalloc(&sdev->dev, cfg_data->memory_cnt,
+				    sizeof(*info->memory), GFP_KERNEL);
+	if (!info->memory)
+		return -ENOMEM;
+
+	for (i = 0; i < cfg_data->memory_cnt; i++) {
+		const struct scmi_qcom_memory_cfg *memory_cfg = &cfg_data->memory_cfg[i];
+		struct platform_device_info pdevinfo = { 0 };
+
+		pdevinfo.parent = &sdev->dev;
+		pdevinfo.name = memory_cfg->name;
+		pdevinfo.id = PLATFORM_DEVID_NONE;
+
+		memory = devm_kzalloc(&sdev->dev, sizeof(*memory), GFP_KERNEL);
+		if (!memory)
+			return -ENOMEM;
+
+		memory->ops = info->ops;
+		memory->ph = info->ph;
+		memory->hw_type = memory_cfg->memory_type;
+		memory->monitor_cnt = memory_cfg->monitor_cnt;
+		memory->min_freq = memory_cfg->memory_range.min_freq;
+		memory->max_freq = memory_cfg->memory_range.max_freq;
+
+		memory->pdev = platform_device_register_full(&pdevinfo);
+		if (IS_ERR(memory->pdev))
+			return dev_err_probe(&sdev->dev, PTR_ERR(memory->pdev),
+					     "failed to register platform device\n");
+
+		info->memory[i] = memory;
+		/* Track progress so probe() can unwind on a later failure. */
+		info->memory_cnt = i + 1;
+
+		for (j = 0; j < memory_cfg->num_opps; j++) {
+			const struct scmi_qcom_opp_data *table = &memory_cfg->mem_table[j];
+			struct platform_device *pdev = memory->pdev;
+			struct dev_pm_opp_data data = {};
+
+			data.freq = table->freq;
+			data.level = table->level;
+
+			ret = dev_pm_opp_add_dynamic(&pdev->dev, &data);
+			if (ret)
+				return dev_err_probe(&sdev->dev, ret, "failed to add OPP\n");
+		}
+
+		memory->monitor = devm_kcalloc(&sdev->dev, memory_cfg->monitor_cnt,
+					       sizeof(*memory->monitor), GFP_KERNEL);
+		if (!memory->monitor)
+			return -ENOMEM;
+
+		for (j = 0; j < memory_cfg->monitor_cnt; j++) {
+			const struct scmi_qcom_monitor_cfg *mon_cfg = &memory_cfg->monitor_cfg[j];
+
+			monitor = devm_kzalloc(&sdev->dev, sizeof(*monitor), GFP_KERNEL);
+			if (!monitor)
+				return -ENOMEM;
+
+			monitor->ipm_ceil = mon_cfg->ipm_ceil;
+			/* mon_type 0 = IPM-based latency monitor; 1 = stall-only (compute) */
+			monitor->mon_type = monitor->ipm_ceil ? 0 : 1;
+			monitor->be_stall_floor = mon_cfg->be_stall_floor;
+			monitor->mask = mon_cfg->cpu_mask;
+			monitor->freq_map_len = mon_cfg->table_len;
+
+			monitor->freq_map = scmi_qcom_parse_memlat_map(&sdev->dev, mon_cfg);
+			if (IS_ERR(monitor->freq_map))
+				return dev_err_probe(&sdev->dev, PTR_ERR(monitor->freq_map),
+						     "failed to populate cpufreq-memfreq map\n");
+
+			strscpy(monitor->name, mon_cfg->name, sizeof(monitor->name));
+			monitor->mon_idx = j;
+			memory->monitor[j] = monitor;
+		}
+	}
+
+	info->cfg_data = cfg_data;
+	info->cpucp_freq_method = cfg_data->cpucp_freq_method;
+	info->cpucp_sample_ms = cfg_data->cpucp_sample_ms;
+
+	return 0;
+}
+
+static int scmi_qcom_devfreq_memlat_probe(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	const struct qcom_generic_ext_ops *ops;
+	struct scmi_qcom_memlat_info *info;
+	struct scmi_protocol_handle *ph;
+	int ret;
+
+	if (!handle)
+		return -ENODEV;
+
+	info = devm_kzalloc(&sdev->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_QCOM_GENERIC, &ph);
+	if (IS_ERR(ops))
+		return PTR_ERR(ops);
+
+	info->ops = ops;
+	info->ph = ph;
+
+	ret = scmi_qcom_memlat_parse_cfg(sdev, info);
+	if (ret) {
+		scmi_qcom_memlat_unwind(info, info->memory_cnt);
+		return ret;
+	}
+
+	ret = scmi_qcom_memlat_configure_events(sdev, info);
+	if (ret) {
+		scmi_qcom_memlat_unwind(info, info->memory_cnt);
+		return ret;
+	}
+
+	dev_set_drvdata(&sdev->dev, info);
+
+	return ret;
+}
+
+static void scmi_qcom_devfreq_memlat_remove(struct scmi_device *sdev)
+{
+	struct scmi_qcom_memlat_info *info = dev_get_drvdata(&sdev->dev);
+	struct scmi_protocol_handle *ph;
+	const struct qcom_generic_ext_ops *ops;
+	int ret;
+
+	if (!info)
+		return;
+
+	ph = info->ph;
+	ops = info->ops;
+
+	ret = ops->stop_activity(ph, NULL, 0, MEMLAT_ALGO_STR, MEMLAT_STOP_TIMER);
+	if (ret < 0)
+		dev_err(&sdev->dev, "failed to stop memory group timer\n");
+
+	scmi_qcom_memlat_unwind(info, info->memory_cnt);
+}
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_QCOM_GENERIC, "qcom-generic-ext" },
+	{ },
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_qcom_devfreq_memlat_driver = {
+	.name		= "scmi-qcom-devfreq-memlat",
+	.probe		= scmi_qcom_devfreq_memlat_probe,
+	.remove		= scmi_qcom_devfreq_memlat_remove,
+	.id_table	= scmi_id_table,
+};
+module_scmi_driver(scmi_qcom_devfreq_memlat_driver);
+
+MODULE_AUTHOR("Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>");
+MODULE_DESCRIPTION("SCMI QCOM DEVFREQ MEMLAT driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


