Return-Path: <linux-arm-msm+bounces-115561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id js8bEgt0RGotvAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 03:57:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 948056E9249
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 03:57:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SQ5qtVv3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bolyOKfJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115561-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115561-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FEBB30F64FD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 01:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFB5312803;
	Wed,  1 Jul 2026 01:54:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548B5361DDA
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 01:54:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782870884; cv=none; b=BPqXvOzRRp97zqYluPfKxCp2PvoJlUV6ScRJzdO45OhmuV2riEoe986K5vhKPf/1lcnaV2mPu7pubSf7eL8bhjIGpKN2bwd0nDZvUm2QIhX0/bxvbOZbLHW04ISvXurtya4m2jKtGNiJopG9fHpT25gUGv0oodPAX9dN+qBOlVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782870884; c=relaxed/simple;
	bh=PCET8Oqhsj9WNLCZ/XUS+HHH9XBuN/KDsAhmhsc1HOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8YDYmhxfCKiudFIq6qiyRLvQcOpKs7+LhQr4XYjMkAd87SChKlTRvW/1vaW/GyacOMWW0Qel0cVRtsprzY5INQcI8G1d/ZsHolDAYrogSa3KCKu8gIR63CcDaQuGG2DlrG0hUJ7cEr0IhyLLRyxR2pLozMbcVAxVzgV/DTvm7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQ5qtVv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bolyOKfJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6610uZXL3682389
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 01:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUQmXiEeanjlZBxkUO7Cw4KiaDiV4AtcD6I1eZtiG8w=; b=SQ5qtVv3XpW/SIch
	pQeu5JdIX1tXVwF48G4I8+Mx7/OLY+HFraq6gOfd6YqBlgrsfAUwDe6UdlEE7HoY
	mifnKO/nuvYh25lrycu0bh2RGqxRBVJjmGQkgv4r8S45dSfHgYK4tc4BHo1y3W4c
	qsGSG9dJU808Tn28BkZ3oIUxVSlOVzToQmB9OB4ZxYgbhsNqlNhxnCLoFKxb3gOb
	UQpe/UKyQapTQrJ+57UTRZZrY+LkmDco18MIJoTt7J6GnHR1trRvMlEbgJjzdj5/
	vF1K3AVQ9EX5kZE5KxgRUxgVqP9KnrSRLE39gDOX7G/SElpX9Fb9ukf2a84wE/zr
	XDUUNw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy04px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:54:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7cfa17fe6so4365385ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 18:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870880; x=1783475680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUQmXiEeanjlZBxkUO7Cw4KiaDiV4AtcD6I1eZtiG8w=;
        b=bolyOKfJLyg3Jncpzh0vEGOehtDhIS6Ns2tNYj9n7RT8+vr2PLaK1B7NJDxCCxxpKo
         dTpUI8mKRO4Q6Pauyru0bZqwqsMiuJcWNaaFqafzPpx2Ldxo6a1hMSS3pCZZBaQciAtq
         I9ae9FG9msE36fA/QIzb9VfHK6js6IqZ0Y1l4on4bLMkXdGBgEuLHTB3mdrBWhCMJe+5
         x2Z/JxtAquHPms+i/c0LMjWicJt2VO0d0inXhRpfwg83F3y6qWfTaafPQPibaoCMsBne
         29wY6o5SOR+gOQHJFhZRASWUB1g3lg6NxNZrwY+eOdyAQJ85MiQmzVAZVrhN46OV/7Sb
         PnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870880; x=1783475680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YUQmXiEeanjlZBxkUO7Cw4KiaDiV4AtcD6I1eZtiG8w=;
        b=TOtRk20DLJLOd0rkS77kgI4hb55n/3Qv0BNbBT9NsqVP1A/rHYVo4MZYnuJu3BB6V7
         MtowOzjLXZpCvE3sjrADVxEDOq0RkffR0NwUpFTRtIPNrENyaxUm0wqi6tol9NkV3VcZ
         6DIS71QBcIHzqzy3mIIwkgN5UEALq1oiMkNuDHeU5aRzoSeb1VOScyaXM2XEb05Zx/b/
         Jo/5I0u2CvNBwircyU/5vJ3gVG2i7vmFy2OsiDbLkkqi2ZOaCSoWGazDYI9Dgowvqjcz
         CXMubwdhpYimoior8e5cqoZaKVslrfWCdB2Q9ZpdAsuZNOJrTbdEXo3jQz3CHv3Uy4hz
         exuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9b3WLYYsuZmxKQ50mDojAu74fNXBVGrSSvWhKA4U8gpGTN7ASytYE0H6Ul57tKx+HNRzuNLslw/Zos3ID/@vger.kernel.org
X-Gm-Message-State: AOJu0YxrPBWv/zVUPznvFCIcyerU5qJKXgmJBao9/EyP2nNVinyKePAG
	ceDyR1ITSVCRY3yj3fpgkt5YtBdAujc8lmdi8hwpyjnIPSesPahokLrZvCxwDyD/TYDXnF3sSfy
	45ofbUXGYn5z82Pw0ycLCjwkX6/bLFCPtiFwlpXB/+tVmw73/pslTcPgBzlS0lzTJRGop
X-Gm-Gg: AfdE7cnu+785/gvbLV0XXJO+k3cTrbxxeyVr3dnfDxQrwSWL8pZDK7Zn//ugzlnmwgI
	UCkq6BNtwJrNOyJT/5FRULgFLIitl7OGb/8ZGvATqEg8vTkPXlJDg/ppaa384y2JyDQPDvz8VmW
	x5XuLjAn/xInQLq2iQX2ZlC18YbY5wQl5DQNBstaLHcGWaW26I0gMWLlgvfaSbQtz2bOf7CsuM6
	Mq7T1yXqMmzDyf2lp7cBaqmrUyDxr6pwTngmCPpOmdAN0hBzX9H93WF492GIEo7qhhfH5mICvvQ
	edDSCEMmaoeVwA2OLDJKO2DhRJeGAZi8x+0dGDXYHAFtpRkXPHAYKTWqmE7C8m5KmAN8k0H/PNH
	afn+40E3EUd9wqHvqEGRzoWXIJ8h3R1euIQaO2A/jm6dBtxHbl9hD+MUrdS9qQH2caTVQ/5jqmg
	==
X-Received: by 2002:a17:902:f68e:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2ca2d56ab0fmr47446185ad.21.1782870880343;
        Tue, 30 Jun 2026 18:54:40 -0700 (PDT)
X-Received: by 2002:a17:902:f68e:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2ca2d56ab0fmr47445785ad.21.1782870879907;
        Tue, 30 Jun 2026 18:54:39 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:39 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:44 +0800
Subject: [PATCH v4 4/5] arm64: dts: qcom: sm8750: fix traceNoC probe issue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-4-aefab449a470@oss.qualcomm.com>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870847; l=1628;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=PCET8Oqhsj9WNLCZ/XUS+HHH9XBuN/KDsAhmhsc1HOE=;
 b=YKy+xllUw9RH0izO9EqIparMC755sqafsp0VAOQ5ekC4jfS4ZNDSjscTf+3kw/y231kgg3C8e
 3fhvMJA7yZMBjxXVyYEA7L6jBAJg644X6v/W9xfks3a/UgSflNtw0di
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: S79xpGsLeei8nlwUl8y2MhYS5G3LrMA4
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a447361 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5VkFZXXe0QlYWD9W4eUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX/cz1UnMBzn5W
 WUBMA6s+EPmqfAMSkMeC/6po+rRCIDQ6owrfy7paNOoYZDJ+/MMGBGD/m+WRMwyH59gwpLNRUPN
 aQeoP25CCGDofg69bblEGmKWGfYUJNr+wK1liUF1SsjhGurZOr34OlAPajJv9hzIjI77eYPZVe9
 1ex0xCWpCIZEvgjK+y7dqcP7XC5BtVspX6vEEb6n3+sHM124lbu/8yVKMoYCrebnGoEpbnUGtOc
 qoA+oZXWCd6zLAToOnd4qR20bKSNQQieKQzJgET37hdC+IQuJc+rE45XByntA8JcrBKFKGFMcRo
 qBFOd8qLRwNDDqkvzOye3BAjUNSBhdtCytcxf7dLkXxdIquoG8pMFkIfNcC1oRVVhRn0oCcoouw
 m6Y1HNJ++DxXQuS/3ayRMCcjVPHqSPTEXF1je7/pc1cf/nkG0uuEngLhBieudgXH5TNljHZygB6
 eWGl8391mmBeDuu1+xg==
X-Proofpoint-ORIG-GUID: S79xpGsLeei8nlwUl8y2MhYS5G3LrMA4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX7ARcCZyM4biD
 7wvGImOBqTSZz6p8LSSlBsNMi6DBmqtynPS7wSx//o6nHsWYb1GP6wslRndsKv9WVkqmr5FBzrW
 Y3FjrOzxn7goKGbutmu/2WMpxoUYT0M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018
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
	TAGGED_FROM(0.00)[bounces-115561-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 948056E9249

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus first reads the peripheral and component ID registers
(PID/CID) at the top of the device's register block and matches them
against the primecell ID. On this platform the traceNoC does not expose
a valid CID in that register, so the read never yields the expected
primecell value, the AMBA match fails, and the device is left stuck in
deferred probe indefinitely.

The Aggregator TNOC is fully described by the "qcom,coresight-agtnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on reading the primecell ID register at all. Switch the
node to that standalone compatible so the device probes on hardware that
does not expose a readable CID, while remaining an Aggregator TNOC that
retains ATID functionality.

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..d58483f9f93a 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4687,7 +4687,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		};
 
 		tn@109ab000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


