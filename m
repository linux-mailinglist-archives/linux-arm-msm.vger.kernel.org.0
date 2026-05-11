Return-Path: <linux-arm-msm+bounces-106843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJPRD5B0AWr9ZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:17:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E80EF508736
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 927E2300CCB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 06:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1B22D0C89;
	Mon, 11 May 2026 06:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldaiBxeN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ql/2eF9e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0F12727F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778480261; cv=none; b=VaOIUWao+fzK0yxCZRiHTH8YpkOJV2RN9XP+A97aUvPfdk+3dJhhzgxei009nZIu15DoMtbxxisJ+idbnInI+5aZm3ZGcoOBU0BJFiFn4KLav+1ki1bJ7zidw94e+bcASg2tgKmLEA9TNZMdVooyzj5BgB5UJ5fp26mUdck3dco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778480261; c=relaxed/simple;
	bh=F5pftz4nUbpl94JSxfXZG/o12H52F+RH7Ub3ebKkx38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R//iXDEuz3ktjXFpXDQQX8PyEe0UaSKaeBbYJzT3yAr96ngDIMD3LSJhdQHu/7Ojw8ObZJq021nTK9HBJbOncTskEu68TRongTwhzxeh57GdRPZ6ovqv6bWbEGnUbn023MIwQFrCw9ynj9Unbegt0ZbbSPiajHeewW8r0ApzZYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldaiBxeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ql/2eF9e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B10AJY617739
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ocyMAA78yJX1GegmkOPqF5/d+rxy+hfviNoyYEss8q8=; b=ldaiBxeN6B2UJi4v
	RkfgGLFCe4/NHqdkLrHu8o6xrAUsPdiIAUlw1g58ru308yCieBs1Gmg68fUSvA6a
	b4qeiWyb0sjXYDcQAswpscQYYGktp8izDswNk5VoRYFqpuFj0geJl/j5Jqc8MOJe
	r055bZUMikdCQgA+ANtQSecvU5c2+ezPhaB4taoRMAQY9LOsFFPWfCupPAJApOdy
	T7od/jY0GIslGNUzhgR+w9jSXpWQV90PliNerJrDpMzx1RoM5OGRs7FUdE0AjYe6
	FShXD+B53pkTmi+kw4a4e7Wkn42ck/J8lQhdtTZaKK9BbMzoaqE4NbF7V1xoP8Vw
	WXcFwQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dkstwwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:17:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8375e2df478so1959572b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 23:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778480258; x=1779085058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ocyMAA78yJX1GegmkOPqF5/d+rxy+hfviNoyYEss8q8=;
        b=Ql/2eF9exI3n5kk+jMkjfuLpqKfnEXwy3a+Qw0t4J+i6Xq9WZqQAXfXzgAtLtZnJgj
         LdmwT95uQjBTKUDLa5bmsXPpvZpihp1bpUfoxxj5p2HJ3mdOTrecrjQ6s2ntCpUuaImW
         cciQnibrFF9cUnX5v53AownXUFW5AVaKpvRRvRQ6CNYhMSX7e4owXBN+6GtjaEVYMHSb
         tSOPCj2gdWLzvPO/Kods61zIflEFtksqzRQW+wIoX1//AtD27Eyz6/MatXVVRhTz69Ms
         uhMpb6MAXPBVY8qdPmtkpvM8EoIzw65yoNb25+bGvqM6y58H0jMjwt/BCYKJtZBRlzoI
         BOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778480258; x=1779085058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ocyMAA78yJX1GegmkOPqF5/d+rxy+hfviNoyYEss8q8=;
        b=nbQo+wvTd9Ib4hAi7T+YrQLQBwgeol4NVD/+NDIFiHYtnUUN4wI+atesEtI/xmmKO8
         w44bwOiFwxnx0F1WDeTR87HmkPOqxWXi5zxXsm4gKX0s5PpzjCP0wi4etXCytBqRqlD1
         bE4EFP865edC4vSf4xbl1oa0f7bwNjg8eY3FdWX+diyBG9vkg6qc17nM5FK8XaOkMctT
         nYqfxG3exnHrkSDHwa2e/uRQTbmn3EtWGQMjTII42rCogfIspaIucvINAUwky7ScbPKk
         B8AEpxRFTdUTSgjiX1uc+snwugwvXinVkb0Cf22y7VV1cxSOjYa5Ju/iFxlK+FaiLqRR
         OxvA==
X-Forwarded-Encrypted: i=1; AFNElJ9VU95Etu9THQp1Bf0f037W3ZVunfiyDy59uIpjpe1RetV3g/pf2FN5lcMahwX15vBh9XC5oQgoWExBN4vt@vger.kernel.org
X-Gm-Message-State: AOJu0YybPVII6R6CnsmLsJo7xtEr3PYC8Q4itqhHfKzugcD6dTghLqDR
	x51fZr3E4dD130i7DoPKupre8yzEFbjd3k2r76YbsyuRd+P0Yi8HAUI/55McGUdBFnwWLhM3fBP
	k7G5EiyqQQF06IZ6yMieYDId18ahsRR6hP7bJ79lgq4dJSnckjK58GSNeP75xlLznYDw8
X-Gm-Gg: Acq92OHQ4mk3C1BifScQ+fYEdlvh/h4TDTw2YSWeZPdl7g+L9F7/KDNYbUJH3g/zfSl
	3RNpefafSuTJJ24LRPmx1bjF0NL//68lM66w+QC03mMqlwLfmgzs0IiVYBsMNgvCdnDpKxSR8kz
	6DSOj/7DYl/9ME/UrrZLBhEd0dZSIPdZmmJgpHzHCNiuhQ/HCERXdh5k7iAbl5cQyunqwgRMOc5
	aCtgijnRWmtuho7Pj+FQRKdwGXlS+zou2E10ENIyvZ0S0shPVxjMZ6NakQA8lneznw74tcG9DQ2
	emA0dz/h10I7waev4Uv5BD7HoJbKf4uzbIb43r8qq+Ce4imjTHofOuOFCg/FglKFB5eBwVLSchp
	3ufATxo7AeZaz3HpowDzZNsSGmqQ6kf1sm0Zh8B+iQzJHShG+/eTiOw==
X-Received: by 2002:a05:6a00:a93:b0:838:127d:a16e with SMTP id d2e1a72fcca58-83a5bec5483mr20275821b3a.17.1778480258010;
        Sun, 10 May 2026 23:17:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:a93:b0:838:127d:a16e with SMTP id d2e1a72fcca58-83a5bec5483mr20275785b3a.17.1778480257415;
        Sun, 10 May 2026 23:17:37 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965c30ddasm23840864b3a.21.2026.05.10.23.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 23:17:37 -0700 (PDT)
Message-ID: <a009cd46-0a89-75c4-8b10-35b653ac8fec@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:47:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 08/16] media: iris: skip PIPE if it is not supported by
 the platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mFOmj8DNXU5zdpqyht9nxtvqd5HZF7_p
X-Authority-Analysis: v=2.4 cv=d93FDxjE c=1 sm=1 tr=0 ts=6a017482 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=9TuWGWrZIemhly9L:21 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zf_DQBccePucUUHqg_YA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: mFOmj8DNXU5zdpqyht9nxtvqd5HZF7_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA2NyBTYWx0ZWRfX/Jc+SaCPV0pH
 n0XhNWmuGcknVGrFW8jI5vBaK769/thYHdn2nFNIr53TcOFZuE106skFElHSjVQQQvsrZcguoct
 3pQyE/jr/bX1oH/C6WBitkEPhT5YjqRFVPvVbs355YqSunWNwsnqbCDLevi5FSNql3wynmegFPi
 yQXy+vOqLMi+vZ+1q2X5NJbTOo/U7x5WAuPA2fLAbrifaDb+/ij0kkIH0yVlsF9KLgkfPhXFypO
 HHFLKu1aNGaOBTExL6oNVa1wnVDrAeneF20uN8UCvhgAJiuR8KnCbprxJk3Q934lRTw6kMzhUuE
 f4NvufOBw6DlqJ2eydQwJC7qMQ1GpSA0XJqOUuFSXfB2qjCE2p2oS09Ew4FIwxFcsAnWDRx521X
 bc+H5TbrHCP0mRHFl8fZhO7W/HZ1IqR0jAA+FOA3qkKaKsXPGLpwTqeSU8i+wBOfaTBkSm6dZ4M
 n28EWiKD+7fDRb4oKlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110067
X-Rspamd-Queue-Id: E80EF508736
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-106843-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index ef7adac3764d..f438dddc19ba 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -450,6 +450,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  	u32 work_route = inst->fw_caps[PIPE].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  
> +	if (!hfi_id)
> +		return 0;
> +
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
>  					     iris_get_port_info(inst, cap_id),

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


