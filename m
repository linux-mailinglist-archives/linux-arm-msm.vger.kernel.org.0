Return-Path: <linux-arm-msm+bounces-92466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ5pL+kAi2nJPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:56:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA051193DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B788C3015129
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E9D342CA1;
	Tue, 10 Feb 2026 09:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODOcYK5b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2oTzW0c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB9C342C8E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717415; cv=none; b=q1KQZR5/n/fkUqgx8s+gv5gZa0Bj+v1H/vDhd9u7x2VSqZxJKF/wzd4604xlydOGBuBrGe/J5Nc1gHT2iijsXjAxzHxgyPTk7x53KWeTKQoDVoGVYEvw5i+3atPO0HLdtGjigT9adeskqeyJSO3icC0WjzWLpNeRtRdzYfqkx4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717415; c=relaxed/simple;
	bh=sv+dnG3zrbqwAxnVlxZli2DpyFtrlVYKm/TvZD68Dqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NmVtE5p/g17MYGWWUcbTg4COl0MTm69vKdDXyKawaSiVjevB/l4LEF5bXIKhycwal9M3yjdPjKEilxMCfSJGVxaXBLg26ZPQatnTBZlER1vZGIUmgzNTtmlHZ8f52PvwAIqu5c44ZsBJGO9nai0c6ovnqMqaLELzSKtL3Wbsnxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODOcYK5b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2oTzW0c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7G23p1419398
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	whNOceZZd5faQiSJBPuPpUiY0cxwZFbeiwvoghwTez8=; b=ODOcYK5bvRx732Ie
	L/e3A27V6aPw9rP7bMQa0LnEPjJ8ndkSdU/Zxt7SxJGlwEIc9Lt6LM+8kalYaTBc
	pshZkVtUNG8s+p35IOZDyui2hRTohpT7dr8fMg9MFdoC5KeXs7ejEH9b7Ng7FRnX
	Q4yGTlgA+0F37jM5agkmMBUmIzqsHjmNFCMLZIIUvBa5V/QbhZO71DtAU5eUcrt8
	JcuAN0DHo6EeFBMspSJQHP2rPV9ltcw546U82qEnjp4FTheVbSly5oxKC4U6Dtgt
	hBnKwaaferAhvKzx5zNw3VOMMUqL+rcaQvQZcG8uDAWnJ1zXlQ5RSZYt8wzaSKSS
	uxXaGA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7rpvt01w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:56:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c522c44febso164569985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770717412; x=1771322212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=whNOceZZd5faQiSJBPuPpUiY0cxwZFbeiwvoghwTez8=;
        b=a2oTzW0cw+LZHxLl6mczhjPUCSiq0MsF3jhVcJ/dlUOHYTLgKsqf8M56wOppY2hJAA
         FLOhcs6rFDG9lMagLXNP5Ba7i4Hr0k5qGKyLUqu/ExeBSlfrjTkbXS+HXhCv7HvZS+ol
         hn/4pbKUxoJlpHQIgA0MWGvGdJJKA1Ap0H2Atbdh9wFfqXdcV57PZ5vRsgvFDWTABl7E
         BRnx83IceGjHO3OjPUYTrnFYqk/i6r1waNSOfAMWh7gc/fDdM4VmmOtDPwFTewj82zwU
         5240J+/9eY7DWTLJMES2MK7Kz9lySlfd0BPZGG/M/4SjrrDwc5vSoIPVOexY5b52W42D
         WVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717412; x=1771322212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whNOceZZd5faQiSJBPuPpUiY0cxwZFbeiwvoghwTez8=;
        b=AjYuPbxeLJ9ZrVnqt653TaXnkLCDmBNz4j6KdyAz7vMtxABYG3bJpgMrnJHL+Etyy3
         voi2yPYOV6fMpb3bRxfd6Q9MFKAAIBXIVjQQqeV58vu9I1VodGy6yKyS42b9VSrmtgTU
         ogrwNnPUAZLCal10DsllHksa12LlqSJLEzBjhlcHDCvG9mKFjUul68ZdyLaMRi1TT8Fx
         P5tdfy4EBs58Nf2kXVSoD5jfYfyb9+ClwZYpBJywJylJJ0h3maRSiR3WwRl3dn9IYqXf
         33Bq7jztefU5ZxwwWuEPFB++DZXVW/pEf8XW+MCtb3v4uoqMpY0R577FMqrScR712Gqi
         Lzag==
X-Forwarded-Encrypted: i=1; AJvYcCXhor3FH2p1Dief8o7fEHg/h8sEotIShqCFBWZ/olhBCWu11N+UD5Wdn9X+NBKTZheWSoyCvNSLQlkllHDy@vger.kernel.org
X-Gm-Message-State: AOJu0YxWWWVJlFA2Ti64Gp5kKA6MaBizfBVo/V7YtbVGU3mJgqgGqCk1
	lLg4TXlpP8F15eSnhyLBVDjqjndc1/nI3wA4c19yZYmLJYCNsqHf8mT90wggE2HL/cJWfhUM8uq
	m7U5dcQtE1tIj28UTAIeEEsVfJstA8zQ/RhUongRdHC5YUR2jvzYXVKO64FmufpueWnnA
X-Gm-Gg: AZuq6aISLs+Y3MdOQ7BPiE19LiRIkW1TC9xFGzNqatg1W85pRINRdZQUIjT7C5JyWl9
	SBk1C+GUGlEs5KKFqu7scnuuMNfcrF1ua66DA3UPxWsHsqC6zjEA/Qa26NSWruEzx1nzG0GgICT
	byWsofpG4yk0+5NvMd0ks8K42R5LFDHXaldrb9LyCqqF3pe7GPcyVTdqHENniKMDiqjQyY6bHCL
	kjC8E5rEr0RzjiqV1IRVCQ5PSteoc9RuF/HR328pBEt3F5NFc8q9JlKWb30UzvunZPB2Fgyo2xx
	OKBmXGyAY73YFFfSPoQLANjFTOO7MDjakKxTxFW/44fDHgkOaVXIfi6WIBTmYfpk//tiwMyPEoW
	FzoLjLIQgOMDogJL/lDIPBoF2PqB24fzruPId5y4KNfIQ/AV4DQnLP262Hz0oO/xXtS4THQy7rp
	ncLrM=
X-Received: by 2002:a05:620a:29d0:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cb1fee5291mr108066685a.3.1770717412121;
        Tue, 10 Feb 2026 01:56:52 -0800 (PST)
X-Received: by 2002:a05:620a:29d0:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cb1fee5291mr108064485a.3.1770717411578;
        Tue, 10 Feb 2026 01:56:51 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacf1564sm501975566b.52.2026.02.10.01.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:56:50 -0800 (PST)
Message-ID: <b91ea09a-8a3f-4acf-97f9-3ef7e1d35bea@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:56:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mfd: qcom,spmi-pmic: Allow PMIC4 thermal
 monitor on pm660
To: Richard Acayan <mailingradian@gmail.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260210021819.12673-1-mailingradian@gmail.com>
 <20260210021819.12673-2-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210021819.12673-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MyBTYWx0ZWRfX9JSbOOZZ6+nR
 /5FvcjASkqDGD4BoWyS1nbybswOFOM/qvBhRgx81IeLsVqaFxPwlOzIApLByrD9FrAURTGl+9OS
 eHUDSPHx9LfDGkK9707sT549vGlJYs9AjylXAEHwdlAnDaNmcdJD10aiUHEhIjdH2mW9A2kkfTV
 oi5TuPWl5aviXiZ97mZSENr+Sh0ZT/OS1FF51qEaXyQr35kyjrIlhk4RPayD4mnTCUV7MnXmb5T
 ErcT9OzvZFV08GplkhzCsPXT9cnX5SdiJQAYduTc9J5UuLr5jXoc2c94KoTjZ5WpUlK/5KI4vG8
 kkbcUytamHdV7YBrfD6TwM52s10k1Y6zcffNSrvutvT6LBAFdEy2bf9XXu4BY5gRhq27wDjBAs+
 stUMRh5xEo+yEHPTmhxSoR7h7gC7QKRIalvc5B3UoC/U4/8l0Jnxc60eU4PIsTxztFGUUFh+33n
 oCoIns0/QRCWFXDdRMw==
X-Authority-Analysis: v=2.4 cv=KKZXzVFo c=1 sm=1 tr=0 ts=698b00e4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=HHRwIaEf9NpPtzNnbr4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: warwNSZ-FTMYJ6fdn9Nv4MhwQI11UXbI
X-Proofpoint-GUID: warwNSZ-FTMYJ6fdn9Nv4MhwQI11UXbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92466-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,intel.com,arm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ABA051193DD
X-Rspamd-Action: no action

On 2/10/26 3:18 AM, Richard Acayan wrote:
> While newer PMICs are compatible with PMIC5 drivers, the PM8998 and
> PM660 are both PMIC4. The PM8998 is allowed to use the PMIC4 thermal
> monitor. Allow it for PM660 as well.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

