Return-Path: <linux-arm-msm+bounces-114297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s3VJHr6KO2r1ZQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:43:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5A66BC464
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:43:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pCBoEaMR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R3CprJPq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114297-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114297-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 75E5C300B5AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2218A27FD4F;
	Wed, 24 Jun 2026 07:43:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB47231DDBF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:43:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287037; cv=none; b=pZRda6ms75+rOnexCsK+AS2AbjCmlmC/7wbgcapTmAlsDU5MZxqVOzysexHW8GrZOtxHrsMUeg4pCVsSS1yhI7I7u1eYKNhSiXLda9QI6E5KU5390TxvgpZvysT9A5pidcvMo0jiK4L5tvwFJVRUBsPpC16rDF7T83hJp2RGxJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287037; c=relaxed/simple;
	bh=yLP+O1B0JtHQw/G2U6NEDgrrGFjALZXfN7mTRnZOOxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8+2RisSqe75RAhyfvGSds8TJ+XFh5MLICzsnp4H52Owwl+4THCLRCkW37k3GaK5U+3H1vrNYZF84/y7u6yoyQ4yY8bg6A2Jl8GDzghRescdRCqpgXf7w58cHQFM2n4WZio76wlKOM0I8GUjIysez0XmETMxsgh5vB9u6m5Fjck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCBoEaMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3CprJPq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tuvW2522423
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eA3haVZuSgRB0UM8pMeo9bv9A+DRXdbrjWNgdAEot3g=; b=pCBoEaMR3lAYjAsZ
	o+o2I8kSsHJUj554VQsOfa8ZH8YfiCU32aliShpLPNZaC8ZaPUVI/kjoiRvMBoYT
	u7NrzhmD9Rj1OmJt+ITJioEjmgv6cQnVKPXkNqxaj3EvgsPONlO2/YPqt754C4M0
	A5s7/xgx5CQxVKXvjU0ApL1CnSPVPigIsO3mlCGuX40LS4Zrot3yqnYxhqFlk2tc
	ht4TtDxzLBXMGRT8aoBSPO4x8+BxyDMExGRP1qlJElQoknbP5nfxVfrk3Mhu/Rz7
	lshDXxAU1kVDOgOxBQO/fjnzcmfvlNBSO5fE6K9Q+hOC38oi74xI5nvxYfWHybnl
	Me+CgQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajh67f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:43:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915827fb1a3so5559985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 00:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782287032; x=1782891832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eA3haVZuSgRB0UM8pMeo9bv9A+DRXdbrjWNgdAEot3g=;
        b=R3CprJPq/SNrL74SE2KG0PSUIZbKbgXK5gTcY7tGmpy+4WvlRZoNyLVqdPSYWk1B3D
         1PjEpXJjuqXDODVnnA9ErMmcaU7Bajnj9XJhvYLdVs3V84L8LfUTwTL8oz02gNh5rL37
         0KKkOfImtruGaJ1OVxFJFqcw2Zy0MmFvjcCLW7zUiq3wK1/qWZItTz2ezUXBhzYrcLBR
         wD6RajdFd2adg7Pf1JJJlAv0AOi6Fz3eqKt0mHWXGmQx9IPA3EgbcLvugBuPCYSD3Tco
         gdKP+iVLfECYe3jwDN9Y6AmJlBQ3pbt8roKipSdaFdSkP9C7mVSDFUzg3gtE0m7V59Zw
         BQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782287032; x=1782891832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eA3haVZuSgRB0UM8pMeo9bv9A+DRXdbrjWNgdAEot3g=;
        b=AfvdsR/Lxsta6BdpAJ0hBx7miZMgrlEjwakiE0sXI0L6UB20wVwnpGnbGbc4sMxRUm
         8uY7GWXIsVtkPPG2oHAAvMDIU38rQx3F9OXViqpD5sFzXK6Gxa8lo82A1aECL08Za8T/
         vgI4m6ROMQdLQMkiDX9pvrTjL/K/rDS24HgftIVlr5QKbuwRtTdWVdVvrcQcGG784Z7U
         4gMmqd5RZyXBCP7g0dEcjw67I4gjHWyBkGKX790wKwarC8AvNL7r6ikrev9c2h+zY1mM
         35agWcBK/MtsKTfEt3xQrOxRNUyS32896UnEb2i9SQpinsB9nqc102rZZwKerrwXmcbN
         yDXA==
X-Gm-Message-State: AOJu0Yws3VqxDg4/jDQGMoqV6qxcR0QhKTxv75byKuayqFHE3EjhFEpP
	WoBsmwQSgf4J/Wr3wrVBPkwcRis+WFIf4oGpo7akd16FHUAddCT4yZc8X08+MNYQvwcQh1pbv3N
	dOTebBysFlOxEIecdjuG5Wsx+1n/xyWSPwrQmjNEp0BtqNhIiZnCk1t4fFc/xNmFjRDTt
X-Gm-Gg: AfdE7clP8zdsgl5v3X5JdNW0bwoEZg2vYpHwdu5FLNUB1++y2svTopZcoTKyifAelPQ
	tFuwCdDZRvqsA9xBgCUcSA0sK0vvuNQoU4lOpAMMVzywfZyvYjXI35ZQN5ziA0DF+k4iSY8F2LX
	zDzn5bRHDp/jII/ZWK1pwsyZzOowqKJ+RyLQuCsZPjns1BQ4B/5zv8HmsUaDaGm49Ijd31+Js5r
	JZfXTZns0reeQpkQRHkJXs/ESQcmaoBdY6eu//+mvemYSAfX2sv3WmPwMfuZJ33KccIMjl1SL89
	i1VE/zMelvNIydxfIhTy+QYH1zwznk56+aVmosNCSgdEoKTgpKwUkYhZF49p6oBj6VLgiuaffbD
	qDX6iPs3yV2D51EzgSg2VsXaFpMBSHnPu1AA=
X-Received: by 2002:a05:620a:4550:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-925cad55e47mr823983585a.5.1782287032331;
        Wed, 24 Jun 2026 00:43:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4550:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-925cad55e47mr823982685a.5.1782287031885;
        Wed, 24 Jun 2026 00:43:51 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e48ddsm635579466b.50.2026.06.24.00.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:43:51 -0700 (PDT)
Message-ID: <00fbe3eb-fbfc-41a2-964c-6f4b94ecbb5c@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:43:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Drop unused irq_data argument from
 msm_gpio_update_dual_edge_pos()
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
 <20260623122732.6439-2-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122732.6439-2-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2MyBTYWx0ZWRfXx42rH/G8S36q
 1Au7l1zecNXVwzfkGm49p9w28DKfYou48XoyARUskcJmAb6w4LwxuTFxCXrMkJbJKuAkZNHYY0D
 QtcCYDqs5oynw6paMPLS/YvMCJ8t9zA=
X-Proofpoint-GUID: 1TJhqVh6znCn_rHqcPQZdzYCefAfaFHM
X-Proofpoint-ORIG-GUID: 1TJhqVh6znCn_rHqcPQZdzYCefAfaFHM
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3b8ab8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AmUg6oatqqt9N5fMmIcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2MyBTYWx0ZWRfX5dpQBdgAbUFK
 ljz6lijo4eE8LUQlEp6d4LopBISdHuhdJwykINDOFWmsY5SHlOei2QIDhsyDheOS3N7WHtBILjD
 qx0M8z8nZjQ3HkDUYnxF73LdhUt13VhvKa3LypfAGfX5Jn3vk7QOIOIzk1rKE7ieelkIcuQL5+o
 Ij4JBZ5BRZAG/3odIZrcBE/gyA9y3pF4Ax2QTRsaz7RfUzOMjIjpNNong7i2vdCqd/KzMDsdQWC
 UrWTSS4mG4HJPEXyTBNUof4So0JS4h18T7ymubgNgjVc5FPXgwPjV+923XVEVo5uhj1MX/Rpa33
 z3lmiLidbk3f3oOEahYQP0f3Wk2gX2nlcjHOY2dpU7S2420InijCMeE8POgrGe0u6CfOkmXCayo
 CcsCk0ClN4lU7WKbD50vHsU8LnjuMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114297-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F5A66BC464

On 6/23/26 2:27 PM, Hans de Goede wrote:
> The "struct irq_data *d" argument to msm_gpio_update_dual_edge_pos() is
> unused, drop it.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

