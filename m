Return-Path: <linux-arm-msm+bounces-99176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ByzEdYPwWk7QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:03:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D1E2EF997
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF4503036079
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F7738759B;
	Mon, 23 Mar 2026 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZVMTSK7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rnm3tNyc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4343388365
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259798; cv=none; b=WdZAmvzW1vYZ24wn+2Za4UQTTVPNismywFAjF6Pv57jb1tzKGuIebjzjZNiKDdQalII4Vy9xXQOnhkR0SMYqJItuxUzbXTLR/7exiUd0hh9rG7B6t51ia2Yl/kWNApmB3l8tBmPIbpHr8zuH52xgG5stSunxiiU+fVngMeruA4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259798; c=relaxed/simple;
	bh=VxA7xozyGLK0LLCMm62CBbAm+HBWU+eTUB895uTPzLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mW78w9+IMHcDUzHK9Btt7f7heO90ONjkMs6Os8r4qEUF/O6nO2r0XSyiK1FwhKiWksDbnoilbthrvS2l8CizZfZcQbrGoaHwzuEfIA0eo5ZLiwDg5T6trmSgEZZ/vwbzvji3YT04aDyUxBuEu1DBCT90i8G4h57QUljntwEDdz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZVMTSK7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rnm3tNyc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7u8bp3468428
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1UJyOk+7UBbUzILF8RGYV838Vf2ymJyX7hDFUuJmME=; b=WZVMTSK7E8dwP/Yt
	hc2ER/YwcjTHBSCakDAr9EEVZsf/7X5XBm7RNwAbvffj6rcWGts9LY/jAKAM/76w
	EW+i4bXKL52NfjmELsvH7lSqxy1YV2yWItYTsQzvQ/F/J1H3kcuOf0Ki9XOmq6GW
	J/yo+j3nLeTXHeaQJhz+PnK3Qb2JLdijBnL7Jqj0pRhp3VLWXKtg9L+sXnGwqqMT
	8AY0evEd84vMIzpjmRs09z3FkVzUko7wjCIGmCWb8ChQBPQ3hhat+W1noqpCIBx+
	xPUzqj1LxdTXQKHuv/N2MxxS6G8NKYsAwHykg01hk6d9wPs+MSuDzPMs/KFlOyR+
	IHtt7Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jggekc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:56:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2a1f123fso28013921cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259795; x=1774864595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b1UJyOk+7UBbUzILF8RGYV838Vf2ymJyX7hDFUuJmME=;
        b=Rnm3tNycel9dogNNLxriJheixofjWHs36lL1AyR8HNit8T4yR/qZHhbmS27IdYREwv
         Pi++jufHm/qIZPnVNI0n5EAxHcn9jns7pzH/u7wVoI6FepS2gkdLJH98VyJ2X6ewBaCO
         /mQNYf/tbUoTyY1USb4bGYCmQxzQTIRcSyzjn9uXag9F4IZEJsxm6mqz44G1o6y2JJdJ
         x/8HBiW2slADK6ogs+Z3a72OljN2pG+S3UxPGMqEDqYRMudrU9r+5yRlVFAb9fpsHWD3
         ubrL6WJZUQbLtGWx4COJMsMtGGqdaXBi+tyb5oHKQmLlMLwZ6Vifbca60FKDu+ivQXjE
         wdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259795; x=1774864595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1UJyOk+7UBbUzILF8RGYV838Vf2ymJyX7hDFUuJmME=;
        b=qceifuF8ffWWpAb/U+Z9dxIuakI8P6mecpZ1yeStZrwwXNPuTeZfB5eHNVsvWciSaB
         hBjC0ARY11rT3PvFUQALJeJ9Fp5h1FoGZbw0wlwwO32vQdjy/k/aNa+WNxy3NIA0m6l+
         VeLvzsXk3Rd8hcJdbh4OaPPFVUQeaC4ZHkxMYV2+qRU3IcKv+6QRh9cDy/qFRbxfaMKp
         frhOT29L1Gd+uCDk/hlpKOdqaL4p58Frjp0XVHDTy9t8hxVlLAs0V4/IsqYW3uRt2Dto
         TEVkWObPjoW7E0AQEHZ9FWqHJ7EFMXq3szZplCSEhDcg1nPXRnzMRFup4bezc1xvS3Wu
         Z61w==
X-Gm-Message-State: AOJu0Yx36SoOH1y8nxWNG+zTsH8otHRrW8O/EkbAqbLgCpu0juhG1E2P
	QxVOePx+MM90cr7kSb2pujIU+TGu32Q8ZQFYcp6FBLuTsWfq9vuWgbZtPBF0tby2OKN1ZvisSXb
	nVwWwQjUS09voa2No5f98c84MS8uHxUgo/TfuqAGKFs71N5BjlVdM8Afh3kQe8RExUqEY
X-Gm-Gg: ATEYQzy25dZPUzGTlm6UNRGY2nAc+hMcu7+x5qOSD4jTDooWOBWT0SpFO0Oy+z8+AmY
	EjZFEwQYAiLuZJ5N9GbFrYEOPPbTupM53jfVxdYdGF+5XkilHL32ZKAHSHVJNbVwI2AP38bz9r9
	DMJEr87uogkP54htUDm6InaEBFzmF8C0x0Qt1wykBCwTF9CFGVEG+yVQD402EmjhRkX3y9se2Yd
	P+vVHVjvt8mZiDAkhGgPdGcSItuo2LptWNf3rdetbW2WXPUB9RFfkzqXrVELnvIsQatAlRQE8cG
	nQ4/aPZ8tHkZwLk+Zbb1HyZltI9wMmCemNEq5wKwv2ES3YoSCBQij0wSE5nYhAc4dRwoa1dq1bo
	tLF5/CUdH8UmFCzoqtubnHXFtTaGs+MD1fNXg7Bkb2Uyxa/kKKWDfsUXqxEXU5HAW1jFnuXyNpe
	ic1v0=
X-Received: by 2002:a05:622a:6788:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b50758e93mr43701411cf.9.1774259795171;
        Mon, 23 Mar 2026 02:56:35 -0700 (PDT)
X-Received: by 2002:a05:622a:6788:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b50758e93mr43701241cf.9.1774259794756;
        Mon, 23 Mar 2026 02:56:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207500sm2467287e87.41.2026.03.23.02.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:56:33 -0700 (PDT)
Message-ID: <8be2b64e-7df4-419c-84ab-bd4d728bb282@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:56:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 TFA9890 codec
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Alexander Martinz <amartinz@shiftphones.com>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-3-89c9b5ecb26e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-axolotl-misc-p1-v1-3-89c9b5ecb26e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mqgdlRvTVmyLhbH9WksgeaEhjjhfbEpm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX8Q+BZumgzsC0
 uJMmmOpylaeGl5Vz2d2zOhbU6UB0s/ptIb8Co2rVGCPjeXe5N72qFAquYfuuFBBwYdWtcBPcrcS
 2wfoqBsfKe0idn5s5/+geddeVIXZtN9jvNoBZ04hg1T477kjBXuYXGbw2Q87k4PhRiYL263PvwO
 4F3Jwe77JWzZ+cpYGFXYGNqVHNF26UMpHlorObGzp7kk8RoWUqYV57GxR0N6a4BAAVEr/bp5I+2
 hirsUicBP1oRTveBp3R9dqjv+q0zdZDXePP1+B8aQY1Gj0bxKy5hSmum1ZZNhrBxYsLZYjs33l1
 5e6Euuq8UCyUJ7wWAGbB0fFyrCYhKk6RNDvjoQsY5ijcSCGIUUphqddsCBOx0vbr/1IrCtAvu4I
 C0KLYihmmocnCQJ95NoAbDVQi52mDGQLWWPjcsZ1PCoH4RwFUMST42O0jLKnO8UGvIPMzAWuDBx
 EHGmkw3nrPg+FcmMchA==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c10e54 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7Ovdx5uLAAAA:8 a=EUspDBNiAAAA:8 a=P4yiY5-ZpFYs4z6YB5kA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TQZWkJv5rNK5-PaLMsrg:22
X-Proofpoint-ORIG-GUID: mqgdlRvTVmyLhbH9WksgeaEhjjhfbEpm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,shiftphones.com];
	TAGGED_FROM(0.00)[bounces-99176-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ixit.cz:email,shiftphones.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3D1E2EF997
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 5:29 PM, David Heidelberg via B4 Relay wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Audio amplifier TFA9890 is present on the board.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

