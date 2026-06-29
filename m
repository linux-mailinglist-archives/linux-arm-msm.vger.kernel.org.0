Return-Path: <linux-arm-msm+bounces-115022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id whJDNCNgQmr/5gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:08:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5026D9D07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:08:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WjGLDpIy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Zn3GTSvc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115022-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115022-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 119C9300293D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD633FBB44;
	Mon, 29 Jun 2026 11:58:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B005C3EB10B
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:58:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734331; cv=none; b=WsuXKHRfb1NcK80vTL5g4iRpUXVisygAeqRQYuDm3Dq58K181n9suWYWbo7JVuzkYRacbU4mEezRTqcEVz1lSvL8RKDRkRm0IaDb+sPexFyI67oqEreJFiFA90bBxJHoPoTl7eV81sWDdRIe6aYwM2+UWcNdWX7ievESXaGXbM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734331; c=relaxed/simple;
	bh=FwXYfHH9Bx8NHSEp/QsVL+NKdJ9q69t/o0QCtV5eyEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JX+A0WJCsxvoiIxMxSCzzwh7EY+VmJNjpEpz8pyO6kJJr6e9o/ilY/RsFqep9AMFdqGfNCGoN7drsRCdwhcGS412UkMv8TcjDNaGW+Op6cMDoCUQfxa9mFrm0GwQI6mKTj4HAJ6t8JrxOE0+e+F4Uz0hiOR+loRMdRPJ5BUZ+/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjGLDpIy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zn3GTSvc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT4VC2646950
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fk2t87VU0S41KyRm4QWmRpQlMevV5iSeis5udDyMXow=; b=WjGLDpIyR5JJrUSM
	3qneAwwuyLYc4urYxv3scjWGOqiuTLixHcj1OtlKMoEOk6eOW55M5f1U+g3gM8j0
	knhBiLoN+I295n0d/XPYWtuuLUXR0dp6SKUMm2YzuJ9qNoq7X1L4POXp8Vg+g9Vj
	ZCuKzKpDOMtsoARpZ9TMeqoJIdpSPNYHRy6frIw22uNkhyTsJugM3butHzvsZxdI
	OK1NPI/PXWvMuev/+1L79pJH1ebpugYF7awmuOcTi74Z0HXTKiauECbNj/AFB+pu
	0t6dXPqBBEuoiiktGqWmcOmCrQf40laoddhrq6ItKzbaNY6W6KllPznp0RQxIegc
	XjPe8Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4ts49x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:58:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bea07880dso4180061cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782734329; x=1783339129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fk2t87VU0S41KyRm4QWmRpQlMevV5iSeis5udDyMXow=;
        b=Zn3GTSvcrT9hbi6+5fEMD0ng/zT6wU3vFZIp1uwhg0A+CK00+ovjm2cje4a12jEMML
         xm+wSacUJltgSC2TSoZ8AYp9LWPnj3k/htGyzo5UMuicSiIb3TEf9pwDhYdX+ZMgvKts
         wzHtRp8coPGcEWrCDEBBC6BmfamaLPx2N6TOB5d+cvOM7Ivja7wM4c1a1f9Txx5TF/iP
         /K4ICLDyzKAeznLdj0WAAXaPtFkObM6MuSBvCmfAPBQBVgG3Rk5JTZ+8s5EBugL8zShL
         pXStBv4QbQD8pdyHj1XM1O2SbXw7n0crC7rHefpriZ+sreS/VWrx2yA0PTAHpE1g5GwP
         KSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782734329; x=1783339129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fk2t87VU0S41KyRm4QWmRpQlMevV5iSeis5udDyMXow=;
        b=bpvvPpKsAOfq0FpgGUcE3z0qoHEJk6t2cNI82keZ8gB9frXjtT/8caEuYuOM0Rpndy
         KuY1l6JL3tl3LluTeFmuJBZRxh2CgxBO2zW1n3SFxaZjiU+RUZZ3Wl8FqbLQnbsk8AGr
         +bnU4RxtJhiw+Dd14LagDjwgarwSwiuRSs5xv26kkJnjyobnlGq54Y+Qd03UKmgldrJF
         fRXyx/jPRCCPEsM7PoN7+1MoPycQm9W7SSkz7QUh/QzLErwcudJg5+7NLq2Cd+qFUKan
         ax/oqDJeX8KJ14xoQufendO/XfDARxAVv/5wh382P1SneUl2IV1zI5N8MZR5giznn0Ab
         nCmA==
X-Gm-Message-State: AOJu0Yy/kctzpoNFv6teANK4QmtjnEUEHo0NiWEblHUJDZLZJ1YSruwW
	4msRmWpyPvJ1UqI76W3/2yRtE1AlDjOAS+lquN66LqjBHP2045D4xzRdpt3G84yT5iSeEC68FNX
	H6aE0knBOmprVFf+5krEDzIaVjlfR0rsVESTWTvoKgEprNsMqugZFrd+wLZfTxA9QD3Lz
X-Gm-Gg: AfdE7clOiBwn0TcSmYTeLjP1DelzzqnRUxZbApFs0XebSPYuohTHQ9aJ3lMKbuInndu
	cNgsyXjSfyj4DIzSqV2wnDf5jbUIHFvcCIasMay2gig1DXU9cJNBKB1VKN55zTHGarS73yFTpp+
	MV6nSroWnTDiaRumDL7SiFHFQdx7qVpEaH1gveblTahmPIN/Ej9Aa6jFN3UsIXfo+wD25rj0Stm
	KHIUM+5t20Nbz0dyyQ12G/6kVllSGdAl7DQpLPktsRDQTwsHxKmMVNijUcKyr41vLy3i4jXR05E
	wRuW0I+S5zj0+AOxhgsL/RXIKoJVsBHvLJrlwQtNjx3gWTVqiHsMK7gFVMB+2yLSKAIrAIEb1F8
	2lAN/yck9AJ/HU7hACvYoFAxXs48ezF00sEs=
X-Received: by 2002:a05:622a:8d:b0:517:5d21:9899 with SMTP id d75a77b69052e-51a72a8ceb5mr149554191cf.5.1782734328935;
        Mon, 29 Jun 2026 04:58:48 -0700 (PDT)
X-Received: by 2002:a05:622a:8d:b0:517:5d21:9899 with SMTP id d75a77b69052e-51a72a8ceb5mr149554021cf.5.1782734328527;
        Mon, 29 Jun 2026 04:58:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c124f1723c7sm260496966b.26.2026.06.29.04.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:58:47 -0700 (PDT)
Message-ID: <fe64f655-75d3-45f0-a1d4-b8222b37d0db@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:58:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: purwa-iot-evk: Add Embedded
 controller node
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
 <20260629-ec_support_for_purwa_evk-v1-2-e082b70138d6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-ec_support_for_purwa_evk-v1-2-e082b70138d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5OCBTYWx0ZWRfXzm4uJy212Cx4
 9QJQMazLM8ZzEwneHfMEL8wNU//iNAnKXH5MdGcGGgXZHL90t5oeIYx1pehwplXwx00JF5BiwgC
 Kz3vDxZjhuJgxCk7hFThU3gsWsuMtMj0wdcSxP95dkeIVppOlDBhrhtIUm3m2ZN7VDFdVY4ZInP
 zV0iZvF5qRFmSWGncMkLxowcDGf0lOvXXP931XtwYcH8UYHaQSpunN72i3QwUBUgpmq6WAE3UDt
 Pv5WYCxsbGEvuZbLViIjxd3WvRQ/Cpkw/wBPnpjGEMyA4Oc5T4Did6ZQFSahyCLYcCl2QAbTnOl
 BpVe7NkSYrY/LUncMhHAklVJp9Jc9hytnfl4hFrxyxEnmEzStL24AArNJmt7ZA5ER1qRAPBa1Lg
 o9ucMSs4+Nuu0JnqGAR7T3ALvOegoQ7VkRAUJ/HPHWL/SBQEW2grVt0ieeptbmW5vxBx7DBe2mM
 GcK/asuUgfZdVaIyNTA==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a425dfa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7wtgjnKuI7ixzQLi8VAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5OCBTYWx0ZWRfX41uYffX3/3et
 R/Lm4XTgFy+vonlIUzH2GDxyoab1B1xidrskcKsGL7V9YQSGEQil61GIuD11uH/Ac9Mj4Yqo5fE
 oqztLh419LmsLME2Z7OUWFx6JkjZJOs=
X-Proofpoint-ORIG-GUID: -VPN_bel1S1htffQKjd-3p9RDNKycCiw
X-Proofpoint-GUID: -VPN_bel1S1htffQKjd-3p9RDNKycCiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115022-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:anvesh.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD5026D9D07

On 6/29/26 12:40 PM, Anvesh Jain P wrote:
> Add embedded controller node for Purwa IOT EVK boards which adds fan
> control, temperature sensors, access to EC internal state changes and
> suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

