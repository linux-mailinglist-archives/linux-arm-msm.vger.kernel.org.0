Return-Path: <linux-arm-msm+bounces-90776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HBvGg67eGmasgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:18:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2F094C49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78918301494E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1F535581F;
	Tue, 27 Jan 2026 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="op6jeCMg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfxAAfWA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7238135295F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769519883; cv=none; b=iM7/ZeJB0vHkent8EWioZE4VAQNDmFARQBF3bUwzxcxYdexPKBO5Az/SGFYrqfaEnq+YCqFR+X7tBOsIwK1HRx0oFAz3+Sw745eVBvMeOtcJpjsKsCk7InkPcVbjnaMjTRPPd4H4Igr//XB+xBIGSkUujPvDE8WWzEsUM91+B6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769519883; c=relaxed/simple;
	bh=pGtnGT8A1TVacwwxJ86NDJW/wMTUqelm6JB4YcI4gPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XwRUp5NkkzWLhuyGGG13ZHPkbWPGfGF5rRaGE3NFuvGEh27aDF+CjolRGkhz6HVtfiAvmoVqk+s2Pl214OlCFrLLPN5RW8wzhmse3m+Juov0sBWM+WkeVwmkMHHVd3go+r/yRXNB2PotWESyd2Byduqx88n92JNpm7jk6X/fXzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=op6jeCMg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfxAAfWA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAJTAT3714726
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cB5Jv9LhX5CgJ04FwzVNVe2bLC+6nt2HoYA7wH/vv4U=; b=op6jeCMgoFDLw6KG
	+E0uKgpR/6ZPhESe2nU9FGBrPwLg22l9Nav8gsjAPQfb2VDzhWs3MqD4Hkimk1eG
	h4kF+HkM4D5RkYeRJBLFq7vAeLdIofTGw8yL1/TdHDP+Q1sO3BFB53jddosc896+
	sFEpgiYiblazn983LvFRkakat0wBWh1PtJacACJkAP8pPvYMbWVcX9x5jiHmWVEz
	GrNNfyve/AXfqFoPRd+eselIZRGjtVnsHcdR0BR+dEo1Wk71KlIfnJIOcWr/Az75
	pCwD0vAUElIkC7R3aRw1V0nbpZgL0jUERdUNvv41VgKjX85X7j0n5tQ5emJ9JcBN
	BFNfGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0b39h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:18:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6d6b0f193so120975085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 05:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769519881; x=1770124681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cB5Jv9LhX5CgJ04FwzVNVe2bLC+6nt2HoYA7wH/vv4U=;
        b=CfxAAfWAFKgpkdqNnBFTDpbp+RBT6mG6GllYClM0Gwe4zK507H45/kIrFWEhiuwqwN
         XRAbFqEQTXqwlhympmT54cDJ5NmJ5osaQqav2BohZe0s5+j2W7vuB3IiVHe7A7z2tjFC
         wE0/x7Oze1E513mh9D5ghquU5htwAdq7+LVdqKEw/yb7c4bGC7Y3J3rLfdxA1uV3X2Hd
         JWt8nmtYfmpQjOjqQMlj6U5GpNA9Y5SYcwJuxiaTUzAu+UJ67ErLFteF5X5vnOLrpqMT
         1txe6p6MbDvuH7xGQmDh0ZZ+9EeCbA3SHyb9kuHG0iLsnpRMrtmyBuBVJk9g863Od1Kl
         inVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769519881; x=1770124681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cB5Jv9LhX5CgJ04FwzVNVe2bLC+6nt2HoYA7wH/vv4U=;
        b=Rovyep7NANXkRDz2f4vgXhqyX5b5eP0mn/mSFVEuT8jIycG1XcampnxcGOrSpzYVcM
         c9jOnrEhViKvZaQLYS0XMo0dVpD9MVaC6haZJu4Im82PY5BzbfiQN4nmAfk7VcMeAYxc
         pyFsLq0OzIU2JDpPuStMw9pf7+ZcwM6tmtzxgzRPwfjnvAFlFCHWDhVI3jBCurw8q+tA
         bLeYWIRzUNmDhjYGvT1edrhk645iDXpZNz1wfEF0se13RZnE0cHCnDdM1raxAQ2tmmis
         RCIKrw6jiYYvm7IWp1mbnuZF8ArDx7BJgjpF4QWWaZmexy68RURPkDYt/gVc30i9xG1H
         De8A==
X-Forwarded-Encrypted: i=1; AJvYcCVYgUXzUMUpZFmjcU3rd26HhCA19hNzKxyEUj1FeJXE27q4FOFnNVrfgDAlKw2C3cZw+urU6lJhYsp/CKKu@vger.kernel.org
X-Gm-Message-State: AOJu0YyFxtjiz8biqgZ2z6ivH3P5g57g8qdU/FSgcGvW6LIeW3wEi8rO
	Nh1ilVC8xSGY6G1AJYqyLIWchGLviXHsuvpY2JZLn5cHNLrU/Ka4UbuII3N5VAsnzbASzSGkKnF
	AEpz9IaZo/o+nQdKeMD+QQQFOulHtgqxenLWNEIUcqM5Jsu2F0+1ncTQAPWt2evMYI2Lx
X-Gm-Gg: AZuq6aLVsf+SMBrZklU68AN0paZKM0FQ9YJNbSlL5YSr61IgiFLmZimLhseaAPKBjX/
	s7/4rD+NI5VOCfk0EStvGZih3jvhqt6uok61EDkHJfsj90YeEo1G0fO4VHsKb1OQJFvUShMVjtM
	XPqHYZrTfl06NKzKG4a7xetoQin9tgpdmfwaudiDfZFNihbvPcJ7RR68GKt6U/BWKpylbwfeObu
	49c6hRR85WaOdIrXNsReJxWpYhM+/Zj9cgGgO1VRQdkqwWQiHhp9/kK7LZe5of2lfFvqMPIOlEp
	LxTJo0O4cNcHyy8V/AbTG4rXvLCtiTmHpf53e+JooleoYYUrYLb4Trc1k5r7YrR7SBWkxnflQCm
	25uCfuStgFrCWE8WSaidxI7a3BCZvFLaQWRPsQmWY8WZnQbvlxGdkaiJINH5irYV+Oic=
X-Received: by 2002:a05:620a:3199:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c70b7414f1mr146436985a.0.1769519880692;
        Tue, 27 Jan 2026 05:18:00 -0800 (PST)
X-Received: by 2002:a05:620a:3199:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c70b7414f1mr146434185a.0.1769519880195;
        Tue, 27 Jan 2026 05:18:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b92b5e3sm6297978a12.22.2026.01.27.05.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:17:58 -0800 (PST)
Message-ID: <9d9d4d3d-42bf-4f4a-99d3-19df73f89c30@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:17:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] spi: geni-qcom: Fix abort sequence execution for
 serial engine errors
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
 <20260122151008.2149252-3-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122151008.2149252-3-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: usA-1PrRHB14bsJXdy71UNScnexZCREn
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=6978bb09 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2ADkXApKhB2aXO0F1dwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: usA-1PrRHB14bsJXdy71UNScnexZCREn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwOSBTYWx0ZWRfX4rgxbyOIfAby
 01ZVDBHYpjb+s2QEPw0vgVvM46twUBeGtQ+e6GPCqyLOBKXvLB65O/oFmexOqbbbf0qgm+yL7tU
 0QYSm4o4Z65jMi1Q+rp/HgxCE1u59auiKafrgkE9+S8VciRE22DCS7Cc0PY9Xgn8YvyWqwnNQDH
 kLoeP2nNHtTcLkD8IU8r/oNLt5kXzkch0N5VayHRc/M87aq83oGnPJHoEPVGzib+hxU+f2gH+mm
 Lsc7l0JubqNyYN9746R31R4tP26u8sdzmCWKRPEZD9gYqgRWP9SrlBjm1ojSwQYZ7oLvz/y5cZp
 uVlde3sn2h1cOerZOXQyCAJjHKd1jfgYogdw/BEbV3Ltc8769QTdeIpeoeboFa1GSfFLCpkEAzy
 solyOTCNP7VLlGmubjBugTKr0pwvnD/aofv/707Q0VycYttTDPuGzEjXm3SMT/Lwr7w1yxaedil
 NW4IDyaziEgxgRX7qzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-90776-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD2F094C49
X-Rspamd-Action: no action

On 1/22/26 4:10 PM, Praveen Talari wrote:
> The driver currently skips the abort sequence for target mode when serial
> engine errors occur. This leads to improper error recovery as the serial
> engine may remain in an undefined state without proper cleanup, potentially
> causing subsequent operations to fail or behave unpredictably.
> 
> Fix this by ensuring the abort sequence and DMA reset always execute during
> error recovery, as both are required for proper serial engine error
> handling.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/spi/spi-geni-qcom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index f5d05025b196..e5320e2fb834 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -167,7 +167,7 @@ static void handle_se_timeout(struct spi_controller *spi,
>  		 * doesn`t support CMD Cancel sequnece
>  		 */
>  		spin_unlock_irq(&mas->lock);
> -		goto reset_if_dma;
> +		goto abort;
>  	}
>  
>  	reinit_completion(&mas->cancel_done);
> @@ -178,6 +178,7 @@ static void handle_se_timeout(struct spi_controller *spi,
>  	if (time_left)
>  		goto reset_if_dma;
>  
> +abort:
>  	spin_lock_irq(&mas->lock);

Now that the jump is just 5 LoC, you can dispose of the goto and change it
to an if-statement

Konrad

