Return-Path: <linux-arm-msm+bounces-111814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id biZCGOqaJmpvZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:35:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F00BC655282
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:35:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NfRsdKhD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xa8Zybrj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111814-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111814-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10BDA3051228
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797DF3C379C;
	Mon,  8 Jun 2026 10:18:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352253C09F5
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:18:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913896; cv=none; b=H8jxTreYwfV0y+RF/KKKMyFwmZr/r7vzb8eQ8xrpkl5B0Dd8C+rwVJM8adx3eHSOnZ8KtcH2Yb0JW/akrXWhJdwLeiRWcZDBduDk7r/vFf5B7uQWHytB1zY6oiVX+UhJfMXjkKAG6DEjmSHZFbK92aZSSLbF/0yF7Bz+fnfwWwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913896; c=relaxed/simple;
	bh=ORR9UgzAwpatK7MuCJQNBXI3XFXl98ZUa6OnA/M+MD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHMrErxGk25rOB9SrM2YTQEq5nQegwsQuflgQUe/YImYOTudLAY9f0te2qFGYxUoICvY0q8OI65szTnv4I83MBpr755qfoPuI+g93Qe05W3ke+uBDOH1iJ3zQfhmGW4cuq8kYySvcO3fm95gArZS6oFLFsWN4KSjfg7UGxaLrUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NfRsdKhD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xa8Zybrj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PjPG2733082
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MMGWGZ/Z4Qhg+G1eMpfUUZV+9OCYGiEnD3/Z07wdKzY=; b=NfRsdKhDUnPJYDBx
	kG0PCaJ0q51WZqHFYKMtW224CmZ2tfIBCw9HMtk7ID/Gcf5MYwX/nnf8jURJERFi
	S8cvLS8xuj8i20nuW7Y3bpMo9tAYnIIR+EjmJvWBXQgoX6oMSXmI89bsIZCAuWVf
	BjJi9+3hDAOGlaHWbYSrnu3+bAtFZHbpAM9Ued3L06RgdHI5XKVqq9WKDTw87hKs
	3FGX9v/TScSo4hQ/CBuy4rXHWn/BFYAfzX78t0o3R6/PPVPibuvnQFDkj7+zVdn5
	1J36jUjveMTVw1RRoOcRRDqk6XXuf9mUbSi9iHvNdRiuGudkp69ZJ4r6ktA3e5+3
	9/jxSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf7dgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:18:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915a547f4b3so106019685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780913893; x=1781518693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MMGWGZ/Z4Qhg+G1eMpfUUZV+9OCYGiEnD3/Z07wdKzY=;
        b=Xa8ZybrjGbNWoVPFg8dbbLIeX5HvIubKlWUfEoPg3ftwE1+jE2T5LL9+84X/QJ8svN
         92znHAVyx2NNuPxsFA+kNAiMix11T51F+3q/VFOo+9ctlJswzHihdtqEnPTRO6diK60L
         i8Mw6TUNcHF+GjvED3ZXMw14cFzvrzadBhIUh2idwHjgGqzgqK9JMITbJZqqVak+vW88
         hOs6dYHPbFD0uygj8tUTWy9J5hY6j5VF5QhwxAi/4B0YfA3TybXRCeeNXo9bTg6Ss15/
         6haQr2JBTekyOKLaCJqSQDN/Re6+rw0UDAxHTCaRUM27o0D/74Rd82NEwRFSdNzqDhhO
         k9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913893; x=1781518693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMGWGZ/Z4Qhg+G1eMpfUUZV+9OCYGiEnD3/Z07wdKzY=;
        b=ItieWS2NLt65JQ5j4Z0i1dmH7/tIT/ChEFXJw21oPof8dhVlpGpqlQY7C0v4IVBmNh
         j1LDzmhEvO3OZUNg3/TIH1kGdDQdmlndsEOFQ8/+XwIEajui2J0UApb7Fx3AJzjBuVwB
         6sbxPftuyZeFLivr2VgWdp3S9ctXe11ODfLdxpXTu6YlK/8972leKv8ckDl3mAIbk6Dd
         HM1AhoFfltqKkl0jRFfU/caj0IuwB5cw3eH4pRhSrRZEpj4+rIEzzFpWsL4Pl0Xtog73
         Jbemaert6B+Oz5zvkG702935wOdbTuhMSeyBWVflTWz977vcAq/Uvb0O+o7HbPjwzA3Q
         unhg==
X-Gm-Message-State: AOJu0Yzg+T/9neg4cdlrywF6hdl5obl1bb8Zu1rAQOilyRQLRglebkKH
	QQIcCCAyqNXvWuduxmIR8OI5iAw3tuKNLw4LrZO28+R/csdEbpfhMkN4iKVH1ZkPluieEsgfndf
	XCV9daywE0nUaDiLHzrQR1DyfMQUykM9n2F2FsnzuuoEAVV5zLoZdfwumCNpV26u6XlGX
X-Gm-Gg: Acq92OG1h47idhlNNQ6nSjiiSQkO9oSDHH3zNU+tBi8ZvoqvtPJIWzK2tq7EBzkT/hc
	qS6b6NHhxXcdrGayQks2F1CH0/X6BVq/BNxOXUy+TIi7EIUC9P5t/DGlBGDZ+cZEdo1ZQZkc7SC
	i3/Fjwzevn9sQpMpWE9HooE5RWKPeYsYa1duYvqgcUZVhiA++lHrKcI0CcpIUU5d3MCgjFAgVet
	bbkMQ+NCTyB/TxqrhTd3BG/DGYpEDeNlkxaJa3+zLtwoY6PQpke1ur35Alm+un8RaNbN2fs3lca
	5VOfVALHQ/yoQug4GGgS2ejGPWy6lqdu/cPPf3ADjWNXV8nNkMfg7xm41S2GoJ03OaUS1oqyMkw
	KZwGtqFvO3rG2oNeWBAFLiDeVI60H50UpnlUOrah7wb6hGvTNtSZlljcO
X-Received: by 2002:a05:620a:4607:b0:915:86a4:667b with SMTP id af79cd13be357-915a9de9b69mr1441698685a.6.1780913893418;
        Mon, 08 Jun 2026 03:18:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4607:b0:915:86a4:667b with SMTP id af79cd13be357-915a9de9b69mr1441695985a.6.1780913892955;
        Mon, 08 Jun 2026 03:18:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6915a637180sm2949703a12.26.2026.06.08.03.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:18:12 -0700 (PDT)
Message-ID: <241777db-617d-4362-bd5e-dac3a54e8f29@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 12:18:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] soc: qcom: pd-mapper: Add support for QCS8300
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608084139.1468000-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608084139.1468000-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608084139.1468000-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a2696e6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DyUZA5JNmjPEmAHEHRcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -x3P9XG5RuINd903mo-uO9H_8N5WBrvJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NSBTYWx0ZWRfX2m1pQhOQ4zrL
 X/72+WrH40jliOYYDr1359XqEYb31B4lgxANhsEcv88MQl1hxCAhJ/iozVV5ExPZ0yyjTT37QLj
 Z/2rmps+0VbHRgHZnLDVWz3gG/2SgtSOj8OHQEfFnEBmJU5GmzH31jKaSoC+Vlc2c93If21KDTk
 uvmuRXwQAMK8hwnM1ZBVo6A6+bxqeYnarV7CbFbbIsVjB7B7JWfEkjcHcgJIQchgaKMbkIRDYhq
 31lroL2uIx5L5hZHK2n1Xm6p7kJnrAFQNz6fG5G2pO8bVaxqfN50U10RzsCDCwfdKcwgKFYvdPs
 jaQYJa4H6MQolMyTY+bxzrEL50R1XV/+EUJ92LWv3c6O1n061c2NwWbFHbibtSXLCSYa8XXZA/Q
 0eZxdzXgfsCkLpCBZUFsDzKU3zmQiE9ZwIy+InupOVwUt3xilVgAeVrpFQIFrAE+B/4X8MrwF3r
 rZbiiGagsWE4JJvgplA==
X-Proofpoint-GUID: -x3P9XG5RuINd903mo-uO9H_8N5WBrvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111814-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: F00BC655282

On 6/8/26 10:41 AM, Mohammad Rafi Shaik wrote:
> Add support for the Qualcomm QCS8300 SoC to the protection
> domain mapper. QCS8300 share the same protection domain
> configuration as SC8280XP, except charger_pd.
> 
> Add an entry to the kernel, to avoid the need for userspace to
> provide this service.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

