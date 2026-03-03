Return-Path: <linux-arm-msm+bounces-95102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPiWF8W2pmk7TAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:24:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4811EC99B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:24:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50BA6303FDE0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 10:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65198282F37;
	Tue,  3 Mar 2026 10:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eppOPCUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dP3HccxL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457DC36C9C7
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772533360; cv=none; b=R46PyNPTkTUil0rY4rWLGjTvmP3AVI+xsjtT0sWXBWHnwCrxMIkI09RNo8gLC4C9kpVZJwJHr1xZH1Rmj2AHs7P+QTor4Or1scSh1T5mrvRcxJXJnt5Edi26su98LGa+o4e6ytI+rnQB+7e0a39I/Qo9srhP7TPVXTJoU76u/c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772533360; c=relaxed/simple;
	bh=gp4JzzebzKmENzHs2wBTVHycLWXBIoLkaRQ/pc/I+z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YFGPjxqe9X3wWzYMbN+ioB8jeoIUhc5OvLN6DMGj65+vQ+XJPnQVVNIl4noRBD40Xs4+VhCtvmmnzhKH5fE4hDIb0boE3VFCMaGbvZALehhUT3wtUYmTlnhoRzpJaFdgds0QPwQHa1x+C/dHHNi9ysyQuKjiaq6LRQR5Ki0ubQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eppOPCUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dP3HccxL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mtwp2773527
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 10:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gp4JzzebzKmENzHs2wBTVHycLWXBIoLkaRQ/pc/I+z8=; b=eppOPCUxZfrgrBdf
	PcJOFZYfEvc9pXXmVKXCdsKXSUeYcJyuL1+B23i3pFkGR4aXJmwqDavXNeIsuthd
	4NnGNJEm4598saqLbQSoGqOU9NohcedljTSIudsJ+mANc7g5E9UDIM8IlJ2Wc11c
	+7b6gOvmVjHUPOGzn4GKVziixThbb/FnVVR/S8C72P3pREp5LMtPHkgL+oq9Yyxm
	YvcPVdNa/JxhpKxR1Isp1gbSLOEQGmpi/CY3HfBmOUisByyCAzhjiPFsUo0x92YJ
	Q7/aPiqfy7lXJxxl45Jx0wGapHoGZLkKbMpexFe7x0OkTMgBoWBNJyAKSWTHu848
	8mbKSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm119j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:22:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb38346fdbso474747385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 02:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772533356; x=1773138156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gp4JzzebzKmENzHs2wBTVHycLWXBIoLkaRQ/pc/I+z8=;
        b=dP3HccxLuTecx9KWt4Tni7D8wcpf+T3E+spvhT+gmOYhu6ZsYjxisVEpNqprpCq/Ws
         OzzgQub3nMtcBnBB8XIVI/WsHCLp33Eq8koQIcMvWjKGwYD7bDvdQrjmoE95ENGm4E2y
         KaqvCgLm7Q6LVOb4vnQjuF2HqS5bhcEjBwySS/dwgl3biCUx2Syy4nFCyaWgyvtHtN8n
         9DsHmOQryW2hjx1ZIavFHhHuS6N3Aicna4pVV9HXnKTeKwxNVBgjsyLn2qX70+1DY/fn
         gIVCDLfuxWD8RzLczIAxV61GMA6Dvo4V3XjXYiGLXSsfRpPHiAH6hfpvntKcsaNyp1gU
         11wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772533356; x=1773138156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gp4JzzebzKmENzHs2wBTVHycLWXBIoLkaRQ/pc/I+z8=;
        b=ngJIkvsyJb9oMIRRskdioDbFEtBWAEvchCfuzPRia4WeGbdbjQNFqt73P+3EaUw6is
         x5UUwXeseceO/+MIsyd/AE/L9Ez4U39yn2GUTjsOPQ3rCV0/B92VsuVuOnV1MCv3/aWs
         MvhbfjuNfirXjVyXs1W24xzcWjGgFQN9e4dXN/TJIeLoWT3deQSJVRKpWdU3Lvg1dfOg
         xo/SKSHXDl4Rt1Aqxg8IWB/PShVF4CpcImvhlGVBTHdrKW/1N+ntrX+eycQQ7XU6uYIw
         mUmI1rLnKrElAwH/u49/S/EGJddY2toPlXkp5jczG7E8kLZr3MdyvAvpSEIyVsR2gOfJ
         7B4g==
X-Forwarded-Encrypted: i=1; AJvYcCWh6DDXdqFhmuNHfF5afOWOEbpfGfjv9L0bfDvN+MABxpz35bmYffv421335rkc9lB4jnS8gk3mbNbsq76G@vger.kernel.org
X-Gm-Message-State: AOJu0YwS//aR9hm1rBjwUsQBnIotm/kyxdrMTIl0bc+l5moLRV6lUjGp
	lNId/WYJAzEuJwE2IBcG/sM9GgwvAKmrg+u17Y7dshlqdWTNVpFdEjCXRhnuljMYlVL+KI8TZ16
	RrKYa4HUus967V3AIMKoO1OyjIp+L3QtCPAAxrdaf3WlhTjD7B9WPc0Oq7d5VFclDdAaD
X-Gm-Gg: ATEYQzzy8nFdY8WjAEytON3jtTqdCdfiUMV6Tdl0y9T9vjVQu1odkan8WLlGUhbsx6i
	8JRJmyISO2B7Ff8ABMelGZ2td8N8DnHiYbAPweG64z9cHC7DNsRXIdSRSH1P/HXoodfczkbvwE6
	Zh/5/k/dzciBdAsZHWYPwm6WP+0NylxCZ/vxWKj9jEZ5LDwi56zih8kRvX8wJ5Sh7W+lAyTP9UA
	jrERbHT6vcjcci1bbyGLg3EbDnD/VDEfvlxSTYKAW1V5qM/Q+Y4EW0t6/T51gff6LdGlSXAP3GZ
	0+rlT9AZU4QTz+AWbr88VDR0zvq/7sPd4kStuOrSXJI8KebZa06KDJHgcuLJj/5J7qr97fcBpzN
	yPESxdUnzbpswcSKSTlKDw4JTjxMuiPfrBa4wNpHF4spfxJtY1ElfZ7jShNR4gY1ABjpO7EpvPY
	BHE2c=
X-Received: by 2002:a05:620a:f0c:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cbc8ef8d68mr1595220285a.6.1772533356436;
        Tue, 03 Mar 2026 02:22:36 -0800 (PST)
X-Received: by 2002:a05:620a:f0c:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cbc8ef8d68mr1595217685a.6.1772533355995;
        Tue, 03 Mar 2026 02:22:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae666c9sm554838366b.39.2026.03.03.02.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:22:35 -0800 (PST)
Message-ID: <fee002eb-4447-4ba6-bd3c-7a54ec85e29e@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:22:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: David Heidelberg <david@ixit.cz>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
 <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
 <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: m5Sf7jUZCwvgyvMr-PrTmnXgROf2HbSo
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a6b66d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=-y82mbY2qW1znAYjJDkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: m5Sf7jUZCwvgyvMr-PrTmnXgROf2HbSo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3OSBTYWx0ZWRfX9t1XbYm/r44q
 KoehZqcFU04hOzK/BMYiOoVlplyY9b3y62v1GGNZna0v3Q0+jV0Ore5f+A33Ch/AsZeAb6+P6oN
 CH5Vlpe3iZ646r9qcR0ayqqmaZt+d50jAcXhQDkPMlDeLGvohBAC9ARS8+PKEP4fHiMQqJ8zOuw
 RHfX5oeCgkQlcVXkcnIy24aVRES7L0c6waRrUt3+tDadLaDtzHuKyebsW+ZcuK1Ycrhyklxmge7
 WYQq+S3kgMXDM4muv3mESiqTm+iZ4I2iqang4PUcf1CDWx65PXGJP0SuMI9U8f+MvsLjn+jIePJ
 Y33JWwnOfa3hogOMTrJ/6YA7Widt1lINUhrplB+G4M6vO+T1NNeusvHTX/QHJfqlKruOovCwZLK
 /UegZ/mCznnepZvaphYxzeM6QYUzFK3ZrkMK0rYXLGRqwZtkgICKFe0OTtNbGvxSbO8cMA31HaS
 eAy20qJXa9vccQSddhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030079
X-Rspamd-Queue-Id: 0B4811EC99B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95102-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[ixit.cz,linaro.org,kernel.org,gmail.com,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 11:00 AM, David Heidelberg wrote:
> On 03/03/2026 10:55, Bryan O'Donoghue wrote:
>> On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> These values should improve C-PHY behaviour. Should match most recent
>>> Qualcomm code.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>   .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 18 +++++++++---------
>>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/ drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> index 5482fb5163e17..c612192ee727a 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> @@ -225,9 +225,9 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>>>   /* 3 entries: 3 lanes (C-PHY) */
>>>   static const struct
>>>   csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>>> -    {0x015c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x0168, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x016c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x015c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0168, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x016c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x010c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>>       {0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>>> @@ -245,9 +245,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>>>       {0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x01dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x035c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x0368, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x036c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x035c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0368, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x036c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x030c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>>       {0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>>> @@ -265,9 +265,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>>>       {0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x03dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x055c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x0568, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x056c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x055c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0568, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x056c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x050c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>>       {0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>>>
>>
>> Squash down and Co-developed-by

Suggested-by, perhaps

Co-developed-by usually reflects pair programming and requires a s-o-b,
and that carries legal meaning.

Konrad

