Return-Path: <linux-arm-msm+bounces-114156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Iv4sBhBeOmoc7QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:21:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D77F6B6380
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:21:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E7r8FELl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y22CBpBw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114156-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114156-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 370CE3106078
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AD1372B53;
	Tue, 23 Jun 2026 10:16:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE0F36AB7B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:16:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209774; cv=none; b=GOGNSjpo15JuocDTzZdxo9dJ/QwV1P7gjc4jtIVX8pOsAWzPbPooXlp3aMtY1OUpxPfbi6EPc3dtbfjr9xjTFoAO9wQkNq4PmV0gVTu7iy8ZNJEoAFBsBPISd3Gkz88NLh77tZ4q1Q+LsMbbWgFlDTITViqH2fA7tee/THFLTj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209774; c=relaxed/simple;
	bh=fzMCN2hg3wLEBo4mLwH0xNUAGSvGhzfAzTQ2cWTZAWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMPle/+vROH/wUxave1R2+WeHJ9DxZzeY8/fOWlk/kzhVjI5Px7kgxa2fQi/rabVWZalf4ytES515lM+JELjB5gx/CJtSEB5SjzpTjyxiJ28Amv18+yT3d/4L/vWnhSQcKuqMaJDLCyFxEdOXnKCxdUH1PNWnK/G0rZbqEc9Gek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7r8FELl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y22CBpBw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N9KQvC3918868
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXRs6MrdoTrj0w0L0V/R18YY8MaNcJ8K6DztRAghKl4=; b=E7r8FELljUdqW/Fq
	xGYnWjBY/4rp8+UV7RcIe/89c96sD+D/AoieAjlDDAfY7CKfgjvwLDzT/R7/bOwb
	cZNyEs4FzEFinuL1pMU21ULJ7cRCD688E3oh8DBTlLBtw2+fvaJfZNw6+UH17SzS
	22axJcqLBy9aHPw6+6WoYSXPvkO1PMO98kS9/On709DH3vP8GNXLu1cpGxqvlaZg
	AOh07FcpqSVCNSA8xp91pUBmbCctvInYZqh7qwMf8D7+d5N0uByHbaDxomcZP9S3
	+DgwtSaFVRnjpLaQ9l78E+CGOJfrx1JheMZqHfnppeFrBZfQQFlVZWTK+v2Lx9Xu
	6Ehh7w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe689c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:16:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37dd27ee7c8so85079a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209772; x=1782814572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXRs6MrdoTrj0w0L0V/R18YY8MaNcJ8K6DztRAghKl4=;
        b=Y22CBpBwE69JwvHVRRSUtZzHcqAuA1R1d60KATubWYFf7wyTis34sb7+wZ8GqFg1/V
         xhrZIlVq6cgRQau2YUizAWVJBrw60dOsX8cNromwInYJvYXmuHYkw5Zdy5YIabqltkGB
         twr+Em776z+KrRqGDc/OTF5BwMGooQwAo5zVrUzfexmRFBMD/zMYHGymkGvXALViy8Gk
         E0e+Ol9Q6WBbGPsge6pphU348xOqvvDGg1AfOamOxHv8R4oGMR24LeoX2ChhWrX4zVt3
         0IFhNYElAjssq5iXauwb8sOldV0ULvPNuVKwodN1sB3NhrJv0w7cRXa8FKsuRgPAQ8he
         GpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209772; x=1782814572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXRs6MrdoTrj0w0L0V/R18YY8MaNcJ8K6DztRAghKl4=;
        b=seQfPxaCCU0ehlxsSXL9hyFMx3siRBe5huXcpMU6GJVQqT9FlXZlcZA/8iEJMKMS+j
         7Ihk1N4CRWLW7FdTNu4DKBn+Q6SNRDkpVPhPR+ljdsru5OTdEPC7Q0UAH71EggK1YfuJ
         DpshCvdl2+EWRaqn/Jmuwh0gyAC6DKuJOos71/B4y1ygxpHX05p5wJxxl8yauC18EgRa
         KsdcAusSp+ux4TSL+OtFJHgXwy+YVFD4/C7KJcReCcgS8/SiE7xdZe2z5quHDGKUdtFK
         2yBRftFkpeAM5dPsbgoQnigRAVGNMpK+WVylpfn6bTUmtcaelTH//h3EU5W29NGlbIXD
         mCrQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmfvWZojjJ1ootuVF8lu5Roz7SvrjTG0ggTAry0CCYl96MEk8D9pskY9pHghaBq5efYpoxj/+eEqmHWX/S@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx3X+xegHTsJHPmn3fpDuih0Wyj39E0QhByOVu+ehp1gsVWGPu
	VUtR2KStj3BE4IpnpqUcNqAmayyd07MJuR7/q4PMOY/zVqlfwLEERk2byzdCdddzWX/q8YH3RJo
	EFTpbZhuz9ttuM3ixcaA09KVsJAYltxexajsNRL1Fkn5Q964yyypodYsUEeOJ1QWtu20+
X-Gm-Gg: AfdE7cl3v0gvyHNhcjVZ+TgnAxyFthxRdpXP9iTaB5x7Uoz3/vLFM0/bpDJxvGP3uVB
	6yri5gmRaVbxrYdjoTEAQy+PeGLKCVnjZJaR+RkcioPTwIuI7SoqW5P+6kKOFeDyTqfFppnxeBL
	Fma9Vt0nw1QtO4M4BvhKSXLTQYIx5v0FxtQbZkbyV0xno5ws97YxxFz/+RMgivnB+0xH95qYSrN
	VvzW6PhPpAauUip9hTuVVcNkmOSDrAZxbryrZGzhcnS+6+RHm2UWXRadcOX4/MnIxagGT6irWoi
	2/I3N0hrPDoBA2VKAIFMyLPwi+gsUa7v5y9Y0YMnTLywdqFDtxF+Z+QrxXFESta5oWPeioxl0pg
	xgHhg/C+gwes1/IfM9uxgXMptnTQE0x1pIH6A1m+rzlrNTx5WEtFnne0rZQtv6CftRbDknjs1UT
	4kqg==
X-Received: by 2002:a17:90b:2e51:b0:35d:ab8b:abe6 with SMTP id 98e67ed59e1d1-37dc982598amr2168752a91.4.1782209771680;
        Tue, 23 Jun 2026 03:16:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2e51:b0:35d:ab8b:abe6 with SMTP id 98e67ed59e1d1-37dc982598amr2168743a91.4.1782209771259;
        Tue, 23 Jun 2026 03:16:11 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4ed88dbdsm9255568a91.0.2026.06.23.03.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:16:10 -0700 (PDT)
Message-ID: <5015726e-5e98-404d-9694-669a159ca71f@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:16:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] Bluetooth: btqca: Fix qca_set_bdaddr() using wrong
 HCI event type
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
 <20260622-bt_bugfix-v1-13-11f936d84e72@oss.qualcomm.com>
 <CAMRc=Mc_hjCPe+aLQhK-ProNuh=4-43mPqqmQNQ81Lu4Do=fGA@mail.gmail.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mc_hjCPe+aLQhK-ProNuh=4-43mPqqmQNQ81Lu4Do=fGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RsHn4ugQM2N0bOSGVKmJArspGD6kQ-G3
X-Proofpoint-ORIG-GUID: RsHn4ugQM2N0bOSGVKmJArspGD6kQ-G3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX9+bzSoCa0y1r
 pGxgm0iCcoPHQgvm+pqO+c8/O/9/boWbsMxGkw+XnfLUb+xOru7AMJbxVt0ftDm3t14Hu/ty43J
 t2W2MfSKU0AWWNgXQhK5ttsLYDAMGOY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX0/xuzALDucrX
 9yuU1Zto+cNceLxA8A2L/wnscOEt1pVN1vauatAxfPcP/R1JFu7gO5RIIgOcZsb1xkSmmHdi0CA
 8pXI81XYFTgFOwo/NIJ2xetV5bw/TZb1gXUQee0f9vIH4ubR1b4ARy74wmo4avru/s24Gx+6pzl
 VLSKeHILjAhaV1aDmI9n4++ywh4W1M0IsYvaPfIAPZU5VTSyOYJ2nkEnPeMzH39/Qddg1suWu+a
 Qw2+3b+k/Qxu3XMcyNRJHAx+BfldgSeLGF1Rf3ofn8tQzttwvAHUul8ty/FZxgQWa3408lZdh/l
 XCSSIIglZzyVs+euD6jQidNk5qwJs2xpdzbq86q9iYJ9bDzxRYIA8K4XIKBBc8Qiw56AETM7OUf
 23v/CU9h7hyb/O7kf4ViG+e9c+KAVlwG2z91ePqbaN6hzMs1XJ4yOlEm+h0NDr4NGp9LFsnbeKq
 kYfhGgGi7+FLp046bkQ==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a5cec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pH4rjQeYR1pnhOtVXTMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-114156-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,holtmann.org,gmail.com,quicinc.com,qca.qualcomm.com,chromium.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D77F6B6380

On 6/23/2026 5:04 PM, Bartosz Golaszewski wrote:
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Looks good but should go in the front of the series and land upstream earlier.

Thanks for the R-b. Will do it in v2.

