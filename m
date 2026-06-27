Return-Path: <linux-arm-msm+bounces-114736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PXHbD5AcQGqKbwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 20:55:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B706D280B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 20:55:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="hqg/1Jat";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pltpcu6D;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114736-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114736-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A95A3012333
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 18:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A6C305057;
	Sat, 27 Jun 2026 18:55:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0833002A9
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 18:55:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782586509; cv=none; b=YGm2JB4xD/uOFsH8XZfyY3/kpHLYFxJtgx28NDd3DPsmoJeuMYaFZ0KhfQbeo/nfl83WuaYCazzc0jT/Bdvj5OL86QGLhfesM9YarMZCwHBPlPyYnSs3WIm5O/xoyrm93rY6+1n3io+pvv8PJQt9Ojzp14viW+MmccPddFzThM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782586509; c=relaxed/simple;
	bh=4mG5tfq+QXveeJsMO4ah69axRsewsjvHI+vy9gcwdy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYIep+GTYIfihYlRRYNl8HCg45D2HPZUtwRbRDaLyhUlJXBww3wjryuxHi/TXh8oNv3N2f1sAa0JZt/qKeJyfXHohP2Rr9/+3SKG23WcCx4io7TjvlUyHGOnMZH/xXcdIa3hV2gIka4q1+LL/yQVqd52ZNiuSnU/vqw/svXu1nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqg/1Jat; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pltpcu6D; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65RHntEC1737145
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 18:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jatdXnWQM8d
	1TXI4VvR7posPZLHLELS0xraga384j5Q=; b=hqg/1Jat0gbcKhNwfgF9GURw05r
	XLSdnFsozYXVg/GzSPxsZjkbcAsvwontFubTKQ3vRLpg524eNmJVDy001XKiPyap
	h1O0Cj1UWOmDRu4EWY8C2an7+rfKmXzP80iih9BhDxNtc40j8gCX/ax1V3jT4MvB
	IzXPun8KZzb7ki5u3P+qwKTkjqpn2sNzOwWWKgk9WxQmPtDg/VIRD4/0WIZtnYbn
	5WjSHV2FNTba95NIY2henvz7gKjJq+ESDUP/8zZTwjbvXZKuu+TekLynbt4/x2PY
	iaZikZxtzAvc0lX16bTkNuYBAXWYIngz1+BCuYGvfeH9BY49pKjhreA3CMg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u71hjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 18:55:07 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-664caf6c3bfso64290d50.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 11:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782586507; x=1783191307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jatdXnWQM8d1TXI4VvR7posPZLHLELS0xraga384j5Q=;
        b=Pltpcu6Dvw4B2jujPTfEmE4nESqIKNGQs5LmMMDmmeEouzN4y6Rjyq35pqUEMhOYGF
         sJxHAFu7l5A0U86bbgjIja2UfYeLHzV2Mnkt114AeRC7C4CULhrtGycOYL+WhvsiD9Ow
         81N4VkCMA7dBl6t+C/1UlAKCN7/bRCuldLbZxPrbHK1IbMoz7iFbaZPoJewjBGSzo+lX
         uk5x1bPFx19bK4X82ERXs6n/yVzp/7eR5JS82oytSWrVsPgOTnZ42TZqbo8RJn5GxaPn
         IbYWbHZh6S3jFdforljPTfibFrfbLboiZJl3X1BpNTKYdVpoPNZJbz1y94p46Q0zSj2w
         k3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782586507; x=1783191307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jatdXnWQM8d1TXI4VvR7posPZLHLELS0xraga384j5Q=;
        b=latJg9ezFFIYR/IFWR2lQooaVK2kkX79cf8UgbPgREju7X5Stkc61egkYj2png4pj/
         339g8EWlJlXtj9gUXWFYrQ6bGLrZLtGonB9A1ltvrn5wlW2Fsnxsw8SMYqXxsD/7rRg5
         q3cX05/sA2h2Efpcx6UrjvQvnGM7ykKdOUWw6LrVm9nZNce6CHQGo6FgsNKXD2o9LY43
         9G68OoWHULcopRrwAoPWTZJCkTTLu1M7jwhe2B+tf5Aa+Yv3gCSTu1v+UCrIWr98glCY
         DcT4XRJot5MlODjfkzJP5uB4sJjm/ObduE8U3sou9RIU9gwh5YsAVa21lK3FgMcCiCxY
         dL5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp35NWHqYkWEA/Js05D3o92vTvgigqeGyByl7NEryyxf1EELH+r17iWZHk0P31TKlQ/c0uxpcXs2YNAzlEN@vger.kernel.org
X-Gm-Message-State: AOJu0YzNsQKqv1D1/f09bDvRAMqTrvyD3fxPq9BQMgCgncg7KhXx2fU0
	2Sih6TR5Cxa3zskqcXGdlHMVTOy8KoPtbeA0x2WYdLZYGWSlbBihZnMiX/taVOOwCGbboLeRCzK
	Hg+4Awhrr5om+Ryq/nnLtVUl8EzbzTVAnTLhruc8NRAkQDp5XTjnCc7hrFvWp7ohFwgNC
X-Gm-Gg: AfdE7cm9HytcqeQoGih2w6r9Ac4ETRoUt2G1cDZ/wMhFi7CSzD6a18j2d+WRUU9FJTc
	OMx19bcKytw25sFbpfqxYbWicMULsLoo1TP5pWimJFfxhVb5msP8/vrxpBRmkwDjL0VQFxbeVI3
	12EV9jw0qf0uF+5wZveIaiZaiPubFRM4qkstS4QPLh1EtDGFF1K4UzDtzOyy4j2dRprJ1eEWVlD
	iFmOcqn9hMnScjkjmDrclxyRQsaN17p3d8rEKFG4NaByk7myJdGHyozF4x0O/Mb5MIcFZxpZrbM
	i2vfW9hXgmo43W/ci0mX6xC9v/lloMOfZDk14Mi6OTz0dCMcHAqA8nUoGCmC3reojqy+UVrOwC0
	03vVI/NayZU22Bfk0hkE8Mef90RxhQzptr6kw5F9OUmbbEI9RO9BboV/VGvz/GlgzFeTXE+ZIKA
	==
X-Received: by 2002:a05:690e:1c0b:b0:664:ae67:b669 with SMTP id 956f58d0204a3-664ae67c515mr4979645d50.69.1782586506815;
        Sat, 27 Jun 2026 11:55:06 -0700 (PDT)
X-Received: by 2002:a05:690e:1c0b:b0:664:ae67:b669 with SMTP id 956f58d0204a3-664ae67c515mr4979619d50.69.1782586506389;
        Sat, 27 Jun 2026 11:55:06 -0700 (PDT)
Received: from localhost.localdomain (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6647f785f6bsm4759538d50.6.2026.06.27.11.55.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 11:55:05 -0700 (PDT)
From: t <jason.pettit@oss.qualcomm.com>
X-Google-Original-From: t <t@t.t>
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
Date: Sat, 27 Jun 2026 11:55:02 -0700
Message-ID: <20260627185502.26948-1-t@t.t>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDE2NiBTYWx0ZWRfX0K/+kG69K23R
 D7NqPtDWuMR7kfwa24mggYBzd8S9lp4VXfZD/jmf/+e4YjbAvAFxgPk1di42wwfM+x1dxhkwX7h
 sokxUx5PbmORZ74EmtDcYpo9b8pib6w=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a401c8b cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ClHHCGylXNJOVoNdELgA:9 a=O8hF6Hzn-FEA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: Mx2bd1YCTIL-Y59JqmiJ9LgooQo5hfLc
X-Proofpoint-ORIG-GUID: Mx2bd1YCTIL-Y59JqmiJ9LgooQo5hfLc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDE2NiBTYWx0ZWRfX8W2pE+5tQCAb
 5V+U3NBzZCBPUgyCaF7nZ/R3JdOkdS89Ah9NwraH/H2hB48h/hT7uqAM0nkFEiOQXmMy1kU0P6G
 NaNrZAjD9eRQYSNFNt80nj5v0PGUgn6vD1BBd/0biVA7GVcr6feODmChUA8SLsUEhjRm/h8pTU9
 d+yjJsMJKB+YoDEW9Zhw6FgT0Uc02rtdflYaATidwDu7H2YrRgtua0pcC4QalkZIkILD5FiKRIp
 070kyQ/2brFuG8GnfIEasAdJ81rQbg2Jv3g0VTm5v/xJQp0K2mmJUzWGwablg2zMzj/ELshWwve
 VJ1dALlPFchDVPRpIRNfURgPSmlLHWRJXA+Ty7nVDokgSA2ommydF0gyffuilMizmK6t5I5z74O
 lTyNDGbU7R+KrztuVlrSEGKgb/R4+Jlhr2n6HCfZTQBOw6H2rWwFyDg28v2cuP25qnt1jaQ/EIs
 xtNoR03u7AGsewWEn4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270166
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:jason.pettit@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114736-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,t.t:mid];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98B706D280B

From: Jason Pettit <jason.pettit@oss.qualcomm.com>

On Fri, 26 Jun 2026 13:27:42 +0200, Konrad Dybcio wrote:
> If you remove these two nodes, the QMPPHY-as-DP-only should still
> function (it's the USB3 block that depends on the QMPPHY, not the
> other way around)

I boot-tested this. With &usb_2 and &usb_2_hsphy removed, dmesg still
shows the af64000 DP controller binding and /sys/class/drm shows the
HDMI-A-1 connector as connected, but nothing is displayed on the attached
monitor. With both nodes present, the monitor shows an image.

So removing them stops HDMI from working on this board.
The comment in v3 will be updated to read:

	/* usb_2's combo PHY drives the HDMI bridge over DP; keep the dwc3 enabled. */

Thanks,
Jason

