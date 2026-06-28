Return-Path: <linux-arm-msm+bounces-114774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gckpCmkbQWo+lAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 15:02:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2E86D3D91
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 15:02:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V8q9PsEX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bOhVtWJX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114774-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114774-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12838300B053
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 13:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A2318AFE;
	Sun, 28 Jun 2026 13:02:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6949713A3ED
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 13:02:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782651750; cv=none; b=NJyHNvYR0LlrUADDg6BQF3qSv607Cjs/093pegnvNEFACUxaxJEiU6sTxsKhwhKz69Oy+oFGgVsAasiDBf+dWpectf4zfR2XmeLVt6CHP3hAUnCy3TnOZdgf8v5Q8JLm2SC3o8KDd4eQxYz5G0wY9YsibU8Lj93P+y7K4Rt5mlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782651750; c=relaxed/simple;
	bh=BYhfDAJBD7alyCKz8K/MJq+iMMIqQysPyfqD5k89/qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tm6hQFHN8zmt1gvSxE8pAFA8BZEPnID5/+eR0gpJwfthqbKNrB2yjMhafRJWL1zAuxL11WKP5bX2CW00+baF1TrSb5hN9IBNMHaUP4frsoYhwSvL9/9UB7y8F1r3clxLnQS5OMRGBYgZwYCRyaGZSUIHra1/QnDY0Kis/RlaFUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8q9PsEX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOhVtWJX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9Orrl3616536
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 13:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JI9Cwp/b/lI8v0b7qdWxmDL9
	/uVPfttsUx/Fo4z5JZ4=; b=V8q9PsEX9ZnkPBhDwcFXejHytb8/00deRi0b/IP3
	0suSBOjClFs0rkNn9768IzQd60b/Gg3zP/O1XH7VOLoIpnUKwB7DmcK6HlErM8f3
	xpFtyOsZFCNCI8t74XyX2+Yl42hDpl3idTl5ikhwsNveX1qrVry9OcivpOAf6/HP
	5lMVtk4vswJQbQuvTalZm27CU1b3XB0/oC9RA6yTKPcHROeKNkpK3XWgkMBE96aD
	i4603bpB9aR1h2O8qIY4NOWfCtxc+1jgeR9dZkaHtFTBRvX9YLxIv3McnUnQFw3/
	5QeH7RuubjZZXYBOfT2Ww6/OaA6vOUtIBBtDfP7qZqOEcg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27082vsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 13:02:28 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9c634ffc3so712010a34.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782651748; x=1783256548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JI9Cwp/b/lI8v0b7qdWxmDL9/uVPfttsUx/Fo4z5JZ4=;
        b=bOhVtWJXUk7gQLp6TGI93zj9RkA9frtV05Aev6SM7pMMUAKPZDEr0La12G9Wk951sZ
         67MQ0GBnGaLezutnXnNnXYwHK+uqs1Hqnnqlu83CAm0+wSqgidgVZrqaSGMqcJ9kj6gH
         2y5Qe5nwHzOk8vlRTsGcy/7aW43q3nXR9ZNoAbEwtXjArAggf0mVvzR1TkIkjz6tPO4Q
         XbP+cK9S9Vo6gixT6TOP/bVsn0/Th0fu5xsWVTWXfvXCkUGCejCadSi4/3VvFFunVUkN
         kj+wyfLdBxtyau04muCxS2/PCfGVyGQIwEzJNPxo7JLM1NE5rBX1/Xd5c33+nemVKO5T
         C0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782651748; x=1783256548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JI9Cwp/b/lI8v0b7qdWxmDL9/uVPfttsUx/Fo4z5JZ4=;
        b=o/aE1c3n1VPSZXe9UU41tj3TX6TCJ4zPYeYsOx6lc9hKvxfYMmo6RkWdXsUCHI6vq5
         RkyrldJI3U74IcS5F6u/m9cMZvRcyKi0OiDDOO13DyPGNmaKXV8a1A4fugiJWqnu7vJ5
         ekgg7WW/cfhJ31x7x2Azl7Vme721O23YZ7WcEuYNTBX9yuumQZ8uB++uMjeMegapUDns
         ZzJUXl+RI/m7+B4J1tkeDLV0alzteELFMD07T68klRR8q+ZAe9JiqAMA8TfS6oBHSINf
         nmUL+S9S2BmvE2YdZE0/rvx45r75EpFZ1i4xEg6FkdqQvdgSd+GneohoRV+D4ihCsaqS
         DGqw==
X-Forwarded-Encrypted: i=1; AFNElJ8w9K7gKinhoeVzpM2bA7ecIqu1ApIWvmFjWVwz+G1Ve3ZO7/JqYKbxkH4WwM63JXrbZCym895rMKOqQLrF@vger.kernel.org
X-Gm-Message-State: AOJu0YznpglDOfAHGVbv1uEqE7RyuzMPRwmMLYeGld3vYyiplB/W8doK
	XjytHGzIsMzYSpEnoCgPr9ldbfPG74H0m0ctUeQq+PbrpToowYphMDBMjDKDPbb4NvhuyO9UdXQ
	kICNsktoJUI55FZ91nyje/EzjHB9+ypCcCc/TvyiqHwwWckoALTte1jU1TcOGWsoW1NVn
X-Gm-Gg: AfdE7cnJYTN/F6+617ylCchwH/t8HIu9lNe8ejqvO5g3Di4lWhnH9AY8F2WpvIeNTqY
	KCGKtzI9qdmtMb5r3M8bdDCljR7e2uf6rB2UUVQ6vTz1a4ZELktncl96O0EXO/bG5cbMVGyL1+b
	Gu2YgApt3qmWMEjkXOJ6A6n+Pwld0jT08vJJgyYta9k7OZkvMAuw4SIIJWjEM7Y33uBNAWCi9iy
	SivL9CL/muwFyQa3+7/oJxmN9f/73uGAlVTIdsoTRh2cspX0PEhGU+dlTz0lEkzoTGmvAlTUfZs
	Qafx3tN1o6GOIZ7p/Z/OTteNcSebw04dE/K33NcczmHZHVX12w58wsmuF9MGONIuWgKNf34AChw
	ILJQ56qVzLMn6Cn3mcfpbiFHR4z38S8gy+qLvBQj6PhyZ52Up+v94PzfPuh5frteEe7udCUoc/q
	r/7OvkMA/3ORbeLyZhuyEuQZ42
X-Received: by 2002:a05:6830:3709:b0:7e6:e349:539a with SMTP id 46e09a7af769-7e99c2de19bmr11894391a34.21.1782651747670;
        Sun, 28 Jun 2026 06:02:27 -0700 (PDT)
X-Received: by 2002:a05:6830:3709:b0:7e6:e349:539a with SMTP id 46e09a7af769-7e99c2de19bmr11894335a34.21.1782651747218;
        Sun, 28 Jun 2026 06:02:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2d5867csm2780843e87.16.2026.06.28.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:02:26 -0700 (PDT)
Date: Sun, 28 Jun 2026 16:02:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Message-ID: <e7bal26fyufjh2f4j6rh57bcdvubp3qqydk4pjagq3qjdz3ywz@wtfsiff726zx>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
 <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com>
 <20260627190612.27271-1-jason.pettit@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627190612.27271-1-jason.pettit@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a411b64 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VSECHZiCxr0Cg4s7J8wA:9
 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExNCBTYWx0ZWRfXwKKbod3V4/xv
 o+Agcb4eQefH1+d5BJwrp39bZd5N739C/rou9hXdqU+rXUDOUmk+D4NKJ4MzOZsHvDNNYLkW/QG
 WXcdW/zw8lPJfmLOV44qHxFYUXtS0Vs260GFsUQhRMt4C0tO+w5R2oqOLQotrwgSHNWGh2Ida/p
 aT89fwHldb5EIEuAjxKddN/g28rZOc91BHUlAMMDyRtoIJ65Um9tg8qF/8nd1712aQQsCak6IsO
 yx0E6oXZdg3vBoFg/xG72vlE4wgCr9UZPnQmFUa7qyKNBsqN9CPR7W73WujGXdcmyc56noR8WMn
 E6COawzzmxuopZ0JM0fNKIsbvE8SKew6tW/6tErixPWZze8eiiMQ/kBuez/vwMqjrTkZu1V3fdm
 S+rw6AHuH6fuY1THmwtG/6ssp/Pw6PqmeSPprTqWX4febAdaPzMTr6Aaakfg8FWe/MEkWGpo/Ex
 BPh9RrwhIP13b0TTAnA==
X-Proofpoint-ORIG-GUID: -dFfEIWTBwjLuTFthUrAo7JwZaSCwI7t
X-Proofpoint-GUID: -dFfEIWTBwjLuTFthUrAo7JwZaSCwI7t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExNCBTYWx0ZWRfX0CJtSJJ46c/x
 JZrHcn/5pGplxb5nl2koQLBAbCChS5Fb29zsiZpKHSBSDfZp0gDPwjwNxJ+oRBZcq2I0csAuLR3
 VGqT5uxguB1ZY6H96zU0EfqafISzoNY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114774-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,wtfsiff726zx:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:jason.pettit@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A2E86D3D91

On Sat, Jun 27, 2026 at 12:06:12PM -0700, Jason Pettit wrote:
> On Fri, 26 Jun 2026 13:27:42 +0200, Konrad Dybcio wrote:
> > If you remove these two nodes, the QMPPHY-as-DP-only should still
> > function (it's the USB3 block that depends on the QMPPHY, not the
> > other way around)
> 
> Apologies for the duplicate. My earlier copy of this reply went out with a
> misconfigured sender identity from a local mail setup issue. Resending it
> cleanly.
> 
> I boot-tested this. With &usb_2 and &usb_2_hsphy removed, dmesg still
> shows the af64000 DP controller binding and /sys/class/drm shows the
> HDMI-A-1 connector as connected, but nothing is displayed on the attached
> monitor. With both nodes present, the monitor shows an image.
> 
> So removing them stops HDMI from working on this board.
> The comment in v3 will be updated to read:
> 
> 	/* usb_2's combo PHY drives the HDMI bridge over DP; keep the dwc3 enabled. */

This is very surprising. Can you check, is it actually the DWC3 or is it
some power supply that is being toggled by the USB controller? In the
former case it would mean that we miss some bits of PHY programming and
still depend on the USB host / USB part of the PHY.


-- 
With best wishes
Dmitry

