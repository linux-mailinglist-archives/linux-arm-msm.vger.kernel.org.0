Return-Path: <linux-arm-msm+bounces-114738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LxW7LTYfQGoKcAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 21:06:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5884A6D2852
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 21:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jEUq8Rgh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="M2qsQ/tW";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114738-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114738-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFE5E3014131
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 19:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C53331A53;
	Sat, 27 Jun 2026 19:06:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAE131F987
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 19:06:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782587178; cv=none; b=G6et2KGp9F/SinHSyT3yuHLA6XBf6MqoOKC1lFYE5njGE4IV8grtn/a8nVDZLaUdQ2aYPff8IpbzfjYGIKtmYEVxk+uQjr7CWi3aV2O3MPphB9w28gHQdl2JHkRaBGOa4/qJHbxQ08nf1io+tL48WmMfrL4xtoA+XrjbyGs19lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782587178; c=relaxed/simple;
	bh=4PgbwLX6mugMjAQPbgIzEAAkT3+7KhaHsv6HM+ZC3j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxEsAUeu2ZP6RE5UNz9FfUDRqyOmCCWHW/4fck6rScFKi0uI65tsDDHDUk3hJfnB84/Ns7Bcporr7lUaVYMPWpl9DuwZH70YA0CFY8ZIgLBF63kXQrHE8cc6yFMvjzxgNpxXQ2ys85GdyUeTWYRwQX3h1B+WmHRCjTBDQgN7NIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEUq8Rgh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2qsQ/tW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65RHnL5D1717166
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 19:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RB/JKx8fuoL
	3t1/obHqE2khAtYl7FDhEafemdH5UKzc=; b=jEUq8Rgh2C8El1ipzg+85Rd58DK
	wQAT7g1XIBpPSsNUycWBB8L8OAYNJAJBlTL5CSlr0I7RVLJhDquhpghSK0GVmqlx
	EjZnF5SEydsVzr8Z6Hv2ijo7LSCV0s0WMHmybLaMRM0Jrc15Gd8xwBT+j5DN7acC
	OxG0Tt3tArzildLayWQi/owDLKhesPPQx6CH8dM0bkTyYgybw1dAe9DQz6SjSHkD
	KbyK9+YvY58J8gltv0HExBu17rPp7/vGkaNpT8suXz/P8dV1OV/E1CVcIdK0hhA/
	qVfvEfb/m5nuCh0bEIQTWXNRNiHFwWv5p8fAC560bZXPG+o7ABO4Wjh+L8g==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27081hvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 19:06:16 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8099ed7adc6so36083227b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 12:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782587176; x=1783191976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RB/JKx8fuoL3t1/obHqE2khAtYl7FDhEafemdH5UKzc=;
        b=M2qsQ/tWEGhYOKe5OSKNn9bTeKGE41W+fauLRqglmd7AkqR1zQm0ueDLYLk67NBvDk
         aRAl2xPF6bGm6bdHoEZ5ddXFGUgFo1zj+6NZ2n990lkN5NvZwJ9w7QbRM3UOIu2AI+7+
         uEyUyqi8WSkbAZFyKhk3pvDd77ALaGzXbt9N5yXiX6ci1vEwJzqUM6C10wZ3Fs0H8p2B
         LryxUzBd7UVCr3fd2qdmlTwK87d5uwS9rELeBT5gCga844G3QuN8bvnN2ZtKAzxTIZ5p
         Hg2/odagoQDxfj7g3E8qtMSSvO0WMg//zF4YZL9efc3fdkPBOsB2MwXkJE0f3ehxohyF
         T2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782587176; x=1783191976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RB/JKx8fuoL3t1/obHqE2khAtYl7FDhEafemdH5UKzc=;
        b=P1vaoiuLjR4R/shYTDDqU5azw+O+fOCm9KirGxh+OQmPndn39QHL6ch8ge7ufpmSFL
         XzcR5Y0YHxJbo7aMqa4gcjkIs9hWHtQuaA2v0x3v+Wg7XWQybWRViDlN0gUGQrVU/uSR
         oLpILT/O0pX7mbYgWwXSHM/ULRg4sMZjVVc+ExsrRVLv/HJi3HIpivF6r+GWuUEpBJtH
         fZ8yYq0QR2GVsUgMg/OUHHZG/xmtorKU8rlLrYh5YvF5wso7hX/++7e8LypbuA8TCQuP
         y5yuMGLFpHYowMfpaYDj7r6Gruzm36bR/cF5mUk6sTUiaZ103No6phJV9DZ+GfsbJyOi
         S9Dg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2GMeULGvAB/A0KIKj9rvTOU63lwpoWr9wjF1iIhk3EoqvUSzyC4rVzHLsPv14sIJtukhQuaHLVtnb1NCM@vger.kernel.org
X-Gm-Message-State: AOJu0YxsIHHg8yKR+KSpFQfW6AVWSWY1D+toG+NmBQi6xmTy8FpjdTW/
	+2/60s52MX9dlUEf+BSNxTR0PrKHc6EDwa8GpvxKY4LPVHaszY3I3PFl+M7zRqYpR4eAOMfX87j
	O7Lg3BJB3uSE+dGVq4Xnap4UvuyZnwOdgWIRiHz2ytOGSn8UMGj7HgQjCPVkiQuur5y7T
X-Gm-Gg: AfdE7clTrmY4Eej5DRGPc1jBlzVBgnqWLPJpaReKxN3ST2sK5bjcBy7IIxnck0L6Bhm
	2uO85x+1/Awk1QKAaWqNgnV7amO3HgM1q0ZIzJ3PUSl3jDFtu7jJa54leyGFVSuQ4135QwGHGFW
	OsMyJ98YcK02RAplc2L5nNfv9uN5xoIlrkTwHQULhNezZzMfl58bQ1MDWvXMx/hj7tJFF7rQ915
	6i4cpdPwdfVORjPiuXspSRbJgjmomrCgYV7Pmw0DXjc0+7gIco9uKpK2L5Kaw5ky7fHyqSKDBUP
	NmPWyxY38pWoxwfcegtTx+dH5AkH4f5CnP+H0+BK2vcOAkzOU3M2rQx4OYht4E0/51YpJnpIPA1
	Tva9o+V1mazwBlpVsBpENNcbbBS5xN+xNUJAjIVbPeUJknwlpnm9Na7RqU1iYP9EoaRp39bXBf5
	Tn2YIach0GoQMB13lU2MCoLpYiX9RkIQ==
X-Received: by 2002:a05:690c:67ca:b0:80b:9114:3b85 with SMTP id 00721157ae682-80b91144497mr79886307b3.0.1782587175529;
        Sat, 27 Jun 2026 12:06:15 -0700 (PDT)
X-Received: by 2002:a05:690c:67ca:b0:80b:9114:3b85 with SMTP id 00721157ae682-80b91144497mr79886077b3.0.1782587175039;
        Sat, 27 Jun 2026 12:06:15 -0700 (PDT)
Received: from localhost.localdomain (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-806f10837bfsm59866927b3.45.2026.06.27.12.06.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 12:06:14 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Date: Sat, 27 Jun 2026 12:06:12 -0700
Message-ID: <20260627190612.27271-1-jason.pettit@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com> <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com> <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a401f28 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=ClHHCGylXNJOVoNdELgA:9
 a=O8hF6Hzn-FEA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDE2NyBTYWx0ZWRfX3ztqm0OkneZa
 TA0pEyabRIOfA2mxzjQratKwoXBrB2ojPYsa66ATtjoCBoDg14uMaDVj+/QLEWUehYaUbgCYh1o
 1edTMjKJT7OMpC+HhjRd99T6iAlIiG71lZsE159UTjfue0SJkHQ5S4a71iWDkDpCiGGcRfEbxZX
 hyJqjT8YnU46BNR3++K6ODJ4+qzUunirZ5+tcVs0t4Nw5ZYrC7JTB5s71xbNBpm0tU8crnc1bwh
 H7JtWky71iCqiJZ6Uewey1mHxpaQ9c4lEHNvWlzRg4oy5a0jDvufRSwQdIBF4hAroFzoQkCt5cO
 Zl1Zls3zQoQ7gmu99lKdTkFbctIAhOaz6qSJW+B63GNgKQu+04v00feC3KvKPIs7QJ4d0MdUseF
 V0emcuRfaLG+stbZRQgbY4stP5TSSPudaP1ilILKSUCw/80tvpJuekmCCNOb9gofuHgQ9n8eWUT
 t73J4UZe3ZFtm3RPDKw==
X-Proofpoint-ORIG-GUID: MgVXP5DoNulLC94c3AcuE8J05V1gtxAs
X-Proofpoint-GUID: MgVXP5DoNulLC94c3AcuE8J05V1gtxAs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDE2NyBTYWx0ZWRfX0EpwJI95YH0r
 dLyL/zP6DR+0EbJKwFVgoD82Jzdaz81y5n/UEQT6+v6WZu9i+pd04KcnSvBFUNd7wPMBKDiRbuq
 PxZLMqp9QV+GY6yyOsE+tfoHf6kDw+0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606270167
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114738-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:jason.pettit@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5884A6D2852

On Fri, 26 Jun 2026 13:27:42 +0200, Konrad Dybcio wrote:
> If you remove these two nodes, the QMPPHY-as-DP-only should still
> function (it's the USB3 block that depends on the QMPPHY, not the
> other way around)

Apologies for the duplicate. My earlier copy of this reply went out with a
misconfigured sender identity from a local mail setup issue. Resending it
cleanly.

I boot-tested this. With &usb_2 and &usb_2_hsphy removed, dmesg still
shows the af64000 DP controller binding and /sys/class/drm shows the
HDMI-A-1 connector as connected, but nothing is displayed on the attached
monitor. With both nodes present, the monitor shows an image.

So removing them stops HDMI from working on this board.
The comment in v3 will be updated to read:

	/* usb_2's combo PHY drives the HDMI bridge over DP; keep the dwc3 enabled. */

Thanks,
Jason

