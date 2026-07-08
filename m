Return-Path: <linux-arm-msm+bounces-117561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1PtrN1UbTmqfDQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:41:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 765B1723D8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:41:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DqT6379N;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Lmu9sBr1;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117561-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117561-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 200853011799
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 09:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B3017D6;
	Wed,  8 Jul 2026 09:41:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7D03FFFAD
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 09:41:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783503695; cv=none; b=RY1dP7N6VtPDETPWSU/jO/aJsJfZybuu0IFIQ61yGTNc5DMYip0E2UqJDnaFABPPo94/ULt/A/EQXqv1bYZTWOPQH+roMakiUimiP1sG9D9XRrhnLP2oS+xCHrWhR9MH1WSyfnpi8lUU1YLw4G+VokRwe/jR/h/vYpGuluvoOf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783503695; c=relaxed/simple;
	bh=QY3rsN4d5QA6uLI/wjMv8RVk5VEtFqG0/OiDi2KmA0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PN0hZIPMFUNRrK6E9IwH+b0tl+NcSHKOTCzqSDL9gaHyOUaN3iEc9AKOpJ7Fdmp2o3yMXtwb4t6o2+HWRh/U5w9GoXhjZ8wYHveG+LXbU8X9pkwPwh/OZw+JXFNC6Tui7FNcGzZtIuj9rurffw8AbvLY5kRVijk364LNreYj66I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DqT6379N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lmu9sBr1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668895AU2070527
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 09:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amI6Zf2vaGIXrSRgG4jaNhBHWzw2JNS4gylMww7THp8=; b=DqT6379No2LYiIk3
	ihyiFrJ71QNRp5qsmnoaFPV3DvS7ESEVyE6q9Czu87UOpVhMgfbxd/Whfn4vRuwS
	oSUKH2YfkfJUOP6iLcKpySo+JAGX6OkiCFli6vT7lO9lovY0h0vXj2X+iderdyMa
	unsUkpMHq5fWkJtW5tT3MTQOatNwNqduKSg/OMZ2jGiI6EVyOuDVM5pmgyBHcqJ6
	2dWntJyjVb6+u9PlyyuqC0HYOZItX13HzX9c5sU0wJWrBnP34yukK+RstAPhpRYf
	JtD4j/4uHSmg72nbukrT9YqNKJxDXoTKr6XvADFKhB+uA0ThxDC08/EtcMS3rsDp
	dt9K/Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5a0u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 09:41:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so11092965ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783503668; x=1784108468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amI6Zf2vaGIXrSRgG4jaNhBHWzw2JNS4gylMww7THp8=;
        b=Lmu9sBr15isGGeDmPBKgU+eSYjHeXPNOtU82iSlGf+c3qwzbfwb9I2nhKfTvPtoWoI
         Rd6jzQ25+rkUiRchsWd1IdGizywXH2tkhj8Sj8in9NYgaEx8qdbSU7QZ/H+DQIJSbmSn
         P9iUwlNJ1ZXmK4KnAN5RczNhVcwo7mS+16+KTQAE5AyjBKBnC3YvpEEGs0i8+Ak0qIun
         kYh0hp8osGpOeEF2oUhjymxC1efCO1Ue7QN2cTL8bbKB91L/NitmRLpmi1I2QjUJ/oiI
         961pJrgVzMYPD+Z10Z2EU/LoKmGEInMBAEI9xTG6KtJyyKUBeWtVoDCiRQRtLGROICDH
         bdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783503668; x=1784108468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amI6Zf2vaGIXrSRgG4jaNhBHWzw2JNS4gylMww7THp8=;
        b=Q/czKtzpKBAcaxh8laOM6nbKSyOsAW8BKBSo2Hgad/86IiLtCHiW2HlVtxPXcGb4pn
         ixojMr1ys2Vqg6MvQRL8LgV77C53yesblUQTCCaAP4A264LeXu0E7tZy7yG0J8+Ibtm5
         JHq5ryeySIurZtkjzS6SFEZ59UdvGkbaeIKUjD2quIpnUU0ov3dO5U+iD515nkvDAfkG
         UT2ltwZxV7BqbGMHtw+1jXbGZ72YI9d5wGjGDC1RdPi+kUw3k2sk+4aQdh9tAsEFFAWR
         zLjPQynfDh9u0kWSg9VEkXqXgs3+cOAsr0C9BavipQZGmZKLoj3uiMoO6yBpdukpWA5k
         9TxA==
X-Gm-Message-State: AOJu0Ywy5ki7rGvOOKZRLEMQEDf6Jf3Mn9CP+6ukiOzRtgR/R4q7LB6C
	8/v0FPDvh6Fysu9TTWLWMtnWY8PYjVkUFZZYXr6JrMShwt5VhxLWF7B5YqG7lcQq4xi73Z+AGA8
	2XMHGWn65MGYktGiTMyMImCO/dSJ6fwRfzh9lOQVDeEi1YSbYWGJo4xCwRIuZA1z+AaOX25V61M
	UK
X-Gm-Gg: AfdE7clkz6jZD8oLKVxTrLTcTZW4+BIXxoPj/ZIBDE62nND5bTO5safeZE6KBXVaprA
	7R+YHmJDc6PfQ94AXuZRQ6c7H9wHJNlId5KrhSBJmV7eijkHfC3RPHztqnDq8/El/49EpF3280U
	9t7dENKjbQmRju5AKl7xnQo8hChe8iMtfN3Mrg++cPWnlFwzCEyhUt1Sm+9yC0oRI2/Uqj05A+i
	R9S3YbhOR7HCG9UQd15Wxl92sNeAKLqkSRJeyE30nAyYOqp28rt/VUr6eU3rljyfesqUIUDZzrN
	TeZX/g3AFDGw4uD9C3YzogBSeaRU9Ka6F4xUwdoISNhHikalQyqiOVKfjpnPVYmwOuiLwd/6NtM
	nasoTGlOUrjxPUYFXd/UbSFN9YBeoephrM9s7R8L6oVTO
X-Received: by 2002:a17:903:41d1:b0:2ca:f425:4d44 with SMTP id d9443c01a7336-2ccea36913fmr17581075ad.4.1783503667720;
        Wed, 08 Jul 2026 02:41:07 -0700 (PDT)
X-Received: by 2002:a17:903:41d1:b0:2ca:f425:4d44 with SMTP id d9443c01a7336-2ccea36913fmr17580715ad.4.1783503667149;
        Wed, 08 Jul 2026 02:41:07 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccdf808379sm12595115ad.48.2026.07.08.02.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 02:41:06 -0700 (PDT)
Message-ID: <76f79f3c-16ed-4935-bc0a-dcb26d2a009a@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:11:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: qcom-geni: Avoid unnecessary transfer cancel on
 address NACK
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
References: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-0-dd8f841f36a2@oss.qualcomm.com>
 <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-3-dd8f841f36a2@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-3-dd8f841f36a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e1b34 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KPAMhbskJAhAJ0Ap_bQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5MyBTYWx0ZWRfXxwA8OFAP8/P4
 XQg2raFaJywRfLgHbOxSIFcVHM0d6jkaubXQt4/pXPaz9lPCwPXlKg6p4kh0TogqaES83Cq1O5T
 afUhahDUurtOwd6k7j3N2c5oEq7JG5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5MyBTYWx0ZWRfX7s+hnYWN0CRc
 ysJbOweL74dhjizQ+Jub1ZXsEalC+O1YC9vBbzyi6+7gmBAyMZf4uNwfM707nhxsohGw8dIE51M
 pjgm7nws+By/1oag4fquViylWJpaN8CFN84pS2s04hABjcjJfklt4jk+EYe6wcyAEvmfDgcuI73
 z5qslxn9Oi3EkMAnn2oKG3FnD26Ww7z0QIBemu7GF/ufb6B6FPv7V/aZRwvs7texKAR3bl9NNX6
 iD0R6fkd3MxqvU9ES9k/R+v1Fzlkdv9gen/aC8pGWzVJXsRKFV284VbvmkGl4ubKHPbn7FT9tLa
 JaZhtDJ4tV6L6XYNR3fJ1+N14BAk8n/yZPUV23BpL4m98BCh+SC4cDZv6Vo6SGYQg8U/cheGPjh
 vtTX58PzUa16OwO4a6zX/aMBStlykauRhIMfJg9zOwEcIKYCm+uIESO3hTch/5OWzAKXesfnlqU
 QdY9pSDJY8gRtK8uaEA==
X-Proofpoint-ORIG-GUID: f8VkMoHDu0Q78-tgLOK_F8c8Ji0ucXRZ
X-Proofpoint-GUID: f8VkMoHDu0Q78-tgLOK_F8c8Ji0ucXRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117561-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 765B1723D8C



On 7/8/2026 11:45 AM, Praveen Talari wrote:
> When a target does not acknowledge its address phase, the GENI hardware
> raises a NACK interrupt. In this case, SE_GENI_M_GP_LENGTH remains zero,
> indicating that no data phase has started and the transfer was aborted at
> the address stage.
> 
> The driver currently treats all transfer errors similarly and always
> issues geni_i2c_cancel_xfer() followed by TX/RX FSM resets for DMA
> transfers. For address NACKs, the transfer has already terminated in
> hardware and issuing an additional cancel/reset sequence is unnecessary.
> 
> Track address NACKs separately by checking the transfer progress length
> when a NACK interrupt is reported. Skip the transfer cancel operation and
> DMA FSM reset paths when the NACK occurred during the address phase.
> 
> This avoids redundant cancel/reset operations for a normal address NACK
> condition while preserving the existing error recovery flow for all other
> transfer failures.
> 
When a target does not acknowledge its address phase
The driver currently treats all transfer errors similarly
Track address NACKs separately
avoids redundant cancel/reset operations for a normal address NACK

Looks repeated , in general you are handling address NACK and avoiding 
cancel/reset operation. Differentiate this NACK response against real 
errors.
Try to simplify and shorten it.

> Co-developed-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 9490aee4928c..0448654f2678 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -130,6 +130,7 @@ struct geni_i2c_dev {
>   	struct dma_chan *rx_c;
>   	bool no_dma;
>   	bool gpi_mode;
> +	bool addr_nack;
>   	bool is_tx_multi_desc_xfer;
>   	u32 num_msgs;
>   	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
> @@ -293,8 +294,12 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
>   	if (!cur ||
>   	    m_stat & (M_CMD_FAILURE_EN | M_CMD_ABORT_EN) ||
>   	    dm_rx_st & (DM_I2C_CB_ERR)) {
> -		if (m_stat & M_GP_IRQ_1_EN)
> +		if (m_stat & M_GP_IRQ_1_EN) {
>   			geni_i2c_err(gi2c, NACK);
So we are handling NACK first and then deciding if its ADDR NACK ?
You can pass ADDR or DATA nack to this function right ? and print the 
error log accordingly inside.

> +			val = readl_relaxed(base + SE_GENI_M_GP_LENGTH);
> +			if (!val)
> +				gi2c->addr_nack = true;
> +		}
>   		if (m_stat & M_GP_IRQ_3_EN)
>   			geni_i2c_err(gi2c, BUS_PROTO);
>   		if (m_stat & M_GP_IRQ_4_EN)
> @@ -443,7 +448,7 @@ static void geni_i2c_rx_msg_cleanup(struct geni_i2c_dev *gi2c,
[...]


