Return-Path: <linux-arm-msm+bounces-115378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ITZ+LielQ2rReAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:14:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 281F06E371D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:14:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iVxW9ssc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BBf8Hcft;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115378-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115378-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E84D930F73AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246F93F39E3;
	Tue, 30 Jun 2026 11:04:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8AB40B6DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:04:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817454; cv=none; b=hrJV/xNULJCWzHnxqrwfSY5P2GXdNSO2Ou/yWdU6rxPedrnpRFTW8qIob1Y7Mw1Fs62KzJjVdvta8eu7mhK852J5A+jsdz94ceoTQC1F6CRiA9dOGsue2a1iDcGB1YQ9x7/RcpHLQTe+TAh7JSDMBv1rjNdktdxKfDwtPGRaF4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817454; c=relaxed/simple;
	bh=cpApCxfBaqKDh3CGnj0iJ2WdxTJDpyP5GpLB8ovnhNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6OM1qHURkWg3ynIcs2sfSg6BwQMMj54Q/PT3O6vxycn+hdVsvoZH0dXyYOetfNaBVLsbQoX+LCEyGrk+y5qeJ0KkGwX9gRRLTLT6fWiLV0nRxwMLJpvlPNZCJaK0QDFV8rl7uoNbVG3adolUI1QqgPtbRxqRWxCnyJ/Sc5AnaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVxW9ssc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBf8Hcft; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mt6p1522264
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Th0F1tTiFb1RpjJNUOl6uU84e8PxU+lQWgw3C1dT/Cw=; b=iVxW9sscHUGvuTqN
	UYTJFSfluLKQ+i+TShtM2yRIawhvekWQvrL8FajapcHhQr8d/3P9Q5SjoDZAZAc3
	sltg60vP9hcGBR8pVY3Z7dVixD6bVk0cYxwGZhOMp4G+/yYULQp2awafJIhx8TCM
	VM7pbHw9eHPV9KgrrBAW4zxmA183uiEoRDn5p4dPDrjTs9UIHHnvba+W+PXU4ORo
	43pWVICqkhSEFWyQAsWyVNl6dd4C0lpW6GMyCawQ8NcVHcaX1B7uXKkzbHBEh+xO
	w1yvrb0sN+ekUd/KeNtwWA+scqmJZW99VwU6NUst708dqNAXaClItjwzkg/k42Cm
	cmJLIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw93027-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:04:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso13603585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782817451; x=1783422251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Th0F1tTiFb1RpjJNUOl6uU84e8PxU+lQWgw3C1dT/Cw=;
        b=BBf8HcfteYDOQQi5FEd57JuCEt0Cscb8WZYJMNhjAzC90C6aGDcFyWihdn43tWmZiC
         RpbhBjqKg8jI1fupsYp7tPzSqjxNSXZUW1XQJQp5FpGIUWTf6Hybxj/Fkf+0OullnEaX
         s6DmzGqfgI/3a5I7wvNaSG7VC11suYnzQzp1Npkoqb9ChRWlyRMN4JrU+difbQpMKs2h
         xJfpsZvDY+TmUOv+OQ6C7CG0e1F5uwKcTE5D4Ubn/y9zI3UADF9MXEt3Z98NsSYZXxhT
         TJ/RUX9Z3ovk9n4Uq0C02ndbjUOR8kLoqKLNDTKS6nKzOpzFh+gKYnhO/EJ0e0Yh3QuQ
         TR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817451; x=1783422251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Th0F1tTiFb1RpjJNUOl6uU84e8PxU+lQWgw3C1dT/Cw=;
        b=YrXnBWi+fA1SMZ+lUDxj/oiFbP0j7yB+L0+jC2wP37vOaDE+LVj9+D+TVP8wkn/sBa
         gyvEptSta74b/fkTNHpbUgwH/BOz+G3i7hZ2YDP//4nuLJ2kRyfGwobUM64cDutcnSBb
         ebI9kXqMxfTJqnZafcUuUf7sqe/lNmLoYgm+N5Qy+6VLyEWMWSUpSJF5fqE4MCW/6noL
         FKBh48qlGZz3Ssly5zqy44staz+IZxC+C37H+6Al8PTmVgYRjQ9v0CsKHhlTptTL/ZGw
         lqoLGhWk+RCUWGpnrBMJRKTvfqf1/LBdW9hyItWd32OmSnJbDkH+uNIZWM6wTLhFQs0g
         iZEw==
X-Forwarded-Encrypted: i=1; AFNElJ//maCPKFdoNQsSRnXqGNje4W8Jy/go9AsO6sDJ7+vkshzKC0zSO0bqYRKwmfG6mOBhH/kKMAJsUh5rnGo6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Yac+2/yb4SyWEH9qSUHUm4G66DOkBXKh/yk+R+bCWVvDDtah
	ufNm6kEiT3snSG8vdPey5TDgr/ZbgUitSjEweUT6ipNtXJZumgoHnsRifW8me3hWQqY9EKP+U4G
	/Qsv1tnBVcnOo9AZM7WE5iDQCWkf9RgYXQl9PmKU+TB2mHeDJv4AaLvqPs8SADfkKSVSo
X-Gm-Gg: AfdE7clZImnK2h0Cj1/Tw0jx9rr5XlFkMCqkC8ZURtcelfZveHP4F6BjHvpe3TLd0mi
	LWsicH2GZIYzZO7sCOHedhGS97Nuww1SqpMu69oCAK1W9/2UTtVZ6X6o9KtKtVhLOMYTkSyxxa0
	i6e4k0Ed71giM9rkQQA8kxHQOONUQRYKuzKTwbso+7IA5VqMic9a6H7vZdNUBy17wKhKTBhOBrk
	Z1lJz/cOQY3lXzeXON7PCXT9htFXyfwWUspZLfljzLJadOxvfvGcaR0Y+9ixcLab9U03LWbVhMH
	fe/EQmC2oZDxPmveecQ3EueY8GD+kBf4TsoVoUEmQsTCJRkFKxVv+NUPVOgxj9xDGPELKhNeYZ5
	paCqyuCiI/hHjrZqYDmLWPEkS8qYxHMUOIIs=
X-Received: by 2002:a05:622a:50a:b0:51b:8543:cbbd with SMTP id d75a77b69052e-51c106024cemr24243051cf.1.1782817450863;
        Tue, 30 Jun 2026 04:04:10 -0700 (PDT)
X-Received: by 2002:a05:622a:50a:b0:51b:8543:cbbd with SMTP id d75a77b69052e-51c106024cemr24242361cf.1.1782817450139;
        Tue, 30 Jun 2026 04:04:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f48b35sm104121866b.46.2026.06.30.04.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:04:09 -0700 (PDT)
Message-ID: <28bd19ae-14b0-44ed-93f5-e066d7d695a0@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:04:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
 <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com>
 <20260627190612.27271-1-jason.pettit@oss.qualcomm.com>
 <e7bal26fyufjh2f4j6rh57bcdvubp3qqydk4pjagq3qjdz3ywz@wtfsiff726zx>
 <20260628162913.66306-1-jason.pettit@oss.qualcomm.com>
 <159cefa7-63a3-4b94-8d09-6b652002bcea@oss.qualcomm.com>
 <20260629070903.1341-1-jason.pettit@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629070903.1341-1-jason.pettit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMSBTYWx0ZWRfX3vBVXJ2oa/U0
 NjYYScfiJJJH1JM/M3suxvRrw46KBIEelRFwWV9Wyi7cqUD5xCVFWwKnMWFVuF/XIejfB6caWdR
 JqpQty0tdW5McbM2BDo/j7JuI7hPLlo=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a43a2ab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=vR9D-bBcShyYD9ty43sA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7ZRJy8gYowhNzGl7DPYh_K6XQ2Q_XO8Q
X-Proofpoint-ORIG-GUID: 7ZRJy8gYowhNzGl7DPYh_K6XQ2Q_XO8Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMSBTYWx0ZWRfXxwX+Q+jfLr+4
 puzwGfHYfHRxHDlj/ytCp5xQvQpb1H7SC0P5u/ixmF7jxxxoxKoQGb3rY2XdTGIL5Mf3Bc57aoi
 Jkya7r8M56lR8ps5q3OdCujOhcADvEp8qe78N+7IUIIpFXv90QVc6Q1wIxMu2LEAiACQHTYP3Pw
 QatCS5zXG+YZKyt38YsbzdWAZT5NkwEMPle6KT4JAi/6Kz+qxoC+xTKXWQY6Reij9Mcqr46mWjv
 UYsR3TY718I4FgU/zbU9/3js50mLNeSL7i2ZByfQ2lYkYaDKchDDqFFHT0R0EXLVg8w+KnBj1cq
 9WeYIjLvmSDvs7w7CZ1Xpagqu33JkmvrMlZB+LVdHtRe8t6Sw7qPHkK9s4x26j4qdlpgiJoENxr
 kQJWQetdABFTxCA6FVSvIoa6zbY2EDLZhy5Txmz2mpbWAxHGOmWa/TOcHYzyE0lT2jEsp/KaxjA
 ndwxDx/nCDIs3K0Npgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115378-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jason.pettit@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 281F06E371D

On 6/29/26 4:19 PM, Jason Pettit wrote:
> On Mon, 29 Jun 2026 11:47:52 +0200, Konrad Dybcio wrote:
>> At a glance, this seems to be different vs the reference data, could
>> you give it a spin?
>> [...]
>> -	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x04),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),
> 
> The prerequisite this v2 lists (the Glymur DP PLL change,
> 20260419-glymur_dp-v1-1-ad1067a8e8ae) already includes that 0x04 -> 0x3b
> change, so it is applied in my build. Just to be sure, I retested with
> &usb_2 and &usb_2_hsphy removed, and the same result is observed.
> 
> I can leave my v2 as-is and wait to submit v3 if there are other
> patch series pending that I should wait for.

The merge windows just closed, so we can pick up patches again.
Let's see how the (many) dependencies that we have shape up.

Konrad

