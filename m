Return-Path: <linux-arm-msm+bounces-117996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8fg7JQqgT2oMlQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:20:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 104F77317EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:20:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a8ob7Q6V;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="iT/NIBua";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117996-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117996-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FA8E3025284
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A4D1A683E;
	Thu,  9 Jul 2026 13:20:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E4327C162
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:20:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603206; cv=none; b=G2GfgOB4G3YeVjoGhv+hWy9pfBaMRUVl52KL2KxSgxMIynNXGuClBTRsYUVKX0mg/XT8YWN9rU10dKr4bGPvngg2DbPJz7KwneTMcBYSnPvBJmzRBYbiGD9JP+dnpo5g2sLZhhebu0I+jJfECfBFfdsypzbi6KUtIUmZe4b2HRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603206; c=relaxed/simple;
	bh=8Q8ta+VdsGwXMue9GbUVxrxwKkG+ginY8hWvOLa4dwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svctaGWFo2ORdWtk+poYea+qqo/d8JfL6jzCEedVp/5FBZ+3hMWOLKXzImAUWAuiKz8p8o6tuYXysoNHplVpozO+FhMbMJ6d0aeTawD29ajhTnsajcg1ivVoC+W+pFVnOedM6TnoRSmswjARGKnftmZYe48N+QYdHbYzyxaNhPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a8ob7Q6V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iT/NIBua; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BO1LA1674469
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfOnLFZyqQTqLo/hudr5az1+iraPV0eym3RgxngeWko=; b=a8ob7Q6VZXWIFnhU
	PNVSutWcXNGnI3MQOV3ZUGgE9AHGqTeh9KORcBTyq771CENlkIPEsTdpRtg/FVcX
	7xI6N02YJFvGDVO1wkwL9HoImGdvS2VwX13qANcZqLzcMs7CAR3awH2Vkjp2PAdT
	I50Qbe+i5ypeLpVY8N76d0VpdWG7TY6LcPw/v4jKiOtVCkWPPXY40ho5MT6VOTki
	H/JTuDJr5ao66vYlHflvQfoqHQ1SYkSd6rw0xXcezIqAluFwVL0XqXetyMg+d++d
	vT1wpUPyRW6ZSct8wHXvIaf/nClXJiZsJqJxPDR0n3WrPg9UvjvuN7c18TIuNdMz
	ugRLRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsceu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:20:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6cb57d25so63919885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603203; x=1784208003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfOnLFZyqQTqLo/hudr5az1+iraPV0eym3RgxngeWko=;
        b=iT/NIBuaS3TCNljtxkRpDKOXlO/FEueRfBaYLusuBA3rEUndnD9U6VXtchQRnfvQ41
         RMbsKFg0rNyBoMpQufGfHGjT+WQUZmvpw1wvBOQQ2pZeeuwQGReyc1bTr3lqM7H/LTvA
         csdaWP8UFJKUZmTboAtFMcV6EjeL9GieZtqdrX1vCwCOYiQotNcKLd/VK74K1agi7xKb
         OHMnYCzQSpvOI54yh9f+0ekbA9msA2ZU/dFzmahHCi4Rx3JaLTgELp/ZphtVaB9Iuu9l
         4C9twg1ik+gXXdOqtX6CLrLDX9b48LhtlSwksD3Puv5/8yg6btcbfG5Y7GddxWQstajy
         MQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603203; x=1784208003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfOnLFZyqQTqLo/hudr5az1+iraPV0eym3RgxngeWko=;
        b=PeZmVb6c2I92A/j7FLhom8WD7BPbBNLVzGlrpdUmJnkaWv0wU/bf2BXs4Mzi8AW7ZJ
         437DfgE4STQwdvKigkNu6GPBZ8hgaJzBlbv8aAg07hKHb/5J5xCJ2sG7BUPMnC+o0Cy3
         KDP5MzTYTJ62P/M/keFH8DwYe//mjB8a3ijYv6p/0WwwHENOyBV0avFnwZOKmFL0I2za
         80jGgbESWfblqaFLqry52eamGMmqEgt0RA/i8Kunm+Ipc2tCGQHZnuCjmDs3hi4e308u
         62RzP+MeRaLR+g3RWoMsQzJAn3I2O5AITqhhMN7LazsJvR8E8Yl3K2hB/we4VgCjhW3J
         ycMA==
X-Gm-Message-State: AOJu0YwJPI+2ijajPdqjb0kchQj2ivBtXoAIR0iYnueVVjm7r78LaCRG
	hZ0v4wYD62RovCqcKyuGIsZy6aLUNUN5sYXi3E75zlJU9ndZUdliUBnmdds5THkXQ/D+FZAYTpq
	EuIdg1j3Syau+ID99W6sifLUMMfsbVd8fGFxWgAKAM6FlFnU8r/bG4ddCuSyulqX3mbtv
X-Gm-Gg: AfdE7cmSMf4p1jpUlgThQPIsTnRhmCHGY9Nzat5TB/L47H76IT9aDUbscnSguP2uiJy
	PnOwr6+Nlm1XlONIQzj9MekYEl/BzwEP/RBkGMEKA0Z7ChpkvOg/FnshNqyhxF6IR1rol0h7aKR
	a8c2jV03I5aRhg1zYRFK3iZQGkZp+zyFib+LjbFWQol7AE8qp6TSINsF8kzgLMU0bsGF8NI3GXZ
	+qgk8YRUCJqVyguuYCe/4xSqeOBPaAqpD7hb2VeXU00VQ/HAfKBO57mrJhpd42dpvbApqUA6viZ
	nNCbPpPtcQzzPfHewA+sSb5qkUvsZykNqm+siwsDtE01l4S2tolGWaNAKz/hU3ZvB6grdvtooih
	jqv8NULMNJZiKf5hYO7QpwadnLMtWwT6xNA4=
X-Received: by 2002:ac8:5a07:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51c964106e8mr34227531cf.0.1783603203356;
        Thu, 09 Jul 2026 06:20:03 -0700 (PDT)
X-Received: by 2002:ac8:5a07:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51c964106e8mr34227131cf.0.1783603202833;
        Thu, 09 Jul 2026 06:20:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15df03dccfsm159720566b.62.2026.07.09.06.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:20:02 -0700 (PDT)
Message-ID: <814763aa-d102-4b1e-95aa-01dad1bb3c0e@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:19:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] PCI: qcom: enable Link retain logic for Hamoa
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20260709-link_retain-v3-0-81a9d187bb61@oss.qualcomm.com>
 <20260709-link_retain-v3-4-81a9d187bb61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-link_retain-v3-4-81a9d187bb61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX0VXLdjGEY6Pm
 hX8X8jznQ9FfHZHaFjL1n8owrWmXwZtNfta+J2AeIOVC4Cj39Z1TFbRDlCuq1BMFRdKsKstnzVP
 DWGELrtLeVSV8ysPam5Ll2g+9eNQ+P8=
X-Proofpoint-GUID: wkuFQ7rzoxFCMMlZw3cG-iHdFeZk8aIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfXwfnZytaQRixl
 NNB4+51n4tR6Y4/WWC3gD/KgaNrnH3nj6+vGkIymURuLdkvqgTKOarsrmKmGmcBM3UJ7Sajgquy
 HDYBLS2BbK63wAgqcaZUOqbskzLQyU7A4IS0IWTx+f2T9/f9QYNw+uYxLkp03jnX0q1s/+E07pw
 4+O8cEytFCm60hQdF3rfl+OsN+fGUoooq49Kd+G0ZqreznR1l+/NpKJUms4W0qJbk4Dlwylp4KB
 79ycrHQP5iTKG9eTEhz70a5ZcTO7dainc0g63FjsDBqw6UaPj7gzRLACUAFIPf05yhISsQ2bh3O
 rGiTUGRgyNjZHxGSY8A1BpLPtCCcYLZj3m++9/jNME8NRADhGYjjGv2InWBUGAWGk9zim+JrqCK
 Sm4hDwqj2S3xlafQHTgLoytUPzE3ZzkdTcQB0K82vtxy8/etNN2ucmv9FmqioO9otTbTPmEor4k
 0nAhPMH9m8+tHvlFFww==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4fa003 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: wkuFQ7rzoxFCMMlZw3cG-iHdFeZk8aIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117996-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,pengutronix.de,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 104F77317EA

On 7/9/26 8:35 AM, Krishna Chaitanya Chundru wrote:
> The Hamoa platform supports keeping the PCIe link active across
> bootloader and kernel handoff. To take advantage of this, introduce a
> specific configuration (cfg_x1e80100) with link_retain = true and
> update the device match table to use it.
> 
> Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

