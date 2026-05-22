Return-Path: <linux-arm-msm+bounces-109345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDEaMJRsEGqgXAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:47:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6780F5B6707
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B477C3079C50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D626142314D;
	Fri, 22 May 2026 14:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+PKpz7a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QP8+rJO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C60F441037
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460677; cv=none; b=H7s/qIYDpX4+DZTHuZLqdMYrCzRwdyY+V+P6cWLg7lyYedpnCfv7XDBIXFMwBJYdfygg8aVJMR9EoRzXBxaMKPhE57NPo0gz2aOGLSiePHPBtWrdnur2ILNOJ8Htj0F8PVydgLeeNrYYirxEM+NfBSDwZSN+4ooqrc37+i2MwjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460677; c=relaxed/simple;
	bh=lTIBQ47pbAMIqF3fpNZHDRlS9eKE8tkyqjtAgFiMLYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fh008N0ispoT36h7jQvGSgzNfzQmWST4vt09BAZqDY1G+bmCqEBXIysOUP8wEG7pBvBxjv5nuBBnScu6K1dBDlLqbVsQnzEVswNV9VNeCX2Apob+XS2UFwzCrPIOFgn0RvO4l8DWCeBD4p2N/3pBCFh4JqTJjHlR6Q2BHCsiaQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+PKpz7a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QP8+rJO0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9Kb4f3005223
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRsdhbKrlcwbu3ddt7KwUjrF0xGG72TL3Od7JWEaEsw=; b=L+PKpz7aLxkLNrc4
	jxnquLOoD2WwnA6sS3/hn2XQIQz2MZaxz77DeGNp82fgMj2rwMVDgYuizuGC/Y5P
	KSokwhj2WKNFyzjHfvQniTwhG/QiMvs4kkIw5l0wKmxIPfE3DZ1cJb/or+pxMP56
	z2CrfwURk0iItK+ur3Ts0RdCVFp+Z2VpFpXEUKNwehul1KdR5va+gBOR4idOHtXk
	/SkPq+AtSyL4gsposeWYVAE5U7c4cCrElCyrxWbkPjL8wHJnoJLADP3lIHlFQpdZ
	uGelrlWId4VrH/5HPxj5ZQHO9AHG1KNzOy0FgHOCGMmDMszQyDZ9luKvf0m4a+vx
	v4koVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrtadk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:37:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b9d0162aso18032485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779460675; x=1780065475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRsdhbKrlcwbu3ddt7KwUjrF0xGG72TL3Od7JWEaEsw=;
        b=QP8+rJO0mMVRZsArCqZVYPjiyrDaW2alPrRs2qXvQ5OzSzillpM74IJKmbSpgPlVPa
         BkbzPLPNN0oocOOGjyIbiAu2jZEA0rf/TOtuVfZHGI75UgzbiAT/gonw+PUqML1/ZkSV
         Fcu7XQVfl1fx9JI1GcBme7r+7Fb3GS6MEUUGOHce04AX440DyNmmy7FxJ8yW/cgF1aJb
         HVng4tFINMNN2rJtuHeEBEn+Dl/svkb6vLVr9s3kNW6N4++ieWIBzvgxkjGwRqdRp1dc
         ESp3ajG8CbyZ3CeEGknhr0Wl/+YRkmXL3qtWG2raGVI6PmoQ7ujJY9YSOpyWSxmpPiHl
         39nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460675; x=1780065475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRsdhbKrlcwbu3ddt7KwUjrF0xGG72TL3Od7JWEaEsw=;
        b=WeeGcSFuo8HWZiy+Ol1+4H2dOt38W9IiaH7ZxU1G7MJFUNV5qJWGqqa4CHFS9bGf+v
         paJV1Es0Km04pgGm5a6y/iVVEiRdXIgDxVV+9BUmFu6a2MX9EnXhOv5GrVfuE9XBcaFA
         o88JdCH0DkKU+EZXrDsG8x9oBEW06KblQ3SJl1B3kUloGk9HwStOfcvpyJLOA6ZJypQu
         44w9ac9dSHS2T3wl2qD4CeGlv5j7Gij/9yG7P9ZFgPM6QPJ/2Hzo59QXQaEy7B08Z3nw
         tQpaPuFngLbRxfifPkzcvjE3v1zfi+AzZpb80hnLO6g9vkI889yH3EL2pMB4it27sjcm
         Ym2g==
X-Forwarded-Encrypted: i=1; AFNElJ+W3Z4NvGCV6y8nEG0HauhtzcS37LkBscLOKufZZl6CAI1nFevqM9634LIaHZkcdFx63JvlF+m+DZ4Clijy@vger.kernel.org
X-Gm-Message-State: AOJu0YzE9/vLYIqjTudCXGXVorqwoRJwEp42vwVjWVhRkp0wJU5vTMou
	7uygBFdAMkxdIBxZv9WafaFKdghHHU3kVTfhLWxzzW9sY+EMawUo8/AFdsEodkWg+lgGmBQb4G6
	mMdkpyjd/7WuDD1vxxow3cvzn/PAbV7MkVtQf+bYtvjRGeXFpHONZqqv01qCYgqO8Q6Se
X-Gm-Gg: Acq92OEJTUypYslC9NDU0f9CoBRWsJ4sAc9kgqCyMwVbO922c6kNBPkj8VKkm1yxdVw
	7ImwTmCz4+EUBj89g5/Rjcl4xrJJNyNugjTgSpEdVEjB1/GLMSAdrzqst/t0Rsf6U8ZJBzL+303
	QiGRb8clwto9uwz2ML5j9PGKvc1YltSCg8uTAvaRhhn8pQ2+gsFLopUW9BhXqH4ptbZz1v/q/T8
	sf5Lr9KvjezWhD2DaN9dJ9KwgKTCLEMUmQ0SvYfpwsPMRE9k4gQGz12kAIOoz+Pl7EjvarGdUg5
	DyDk/7ByrmlCbbhm2cXekiZzF9XIqib9v5rnB1Ojd9RS4pJa8q+xjkiL3vT1frKr/EwVTjYtJtV
	an+VaXSoqrMfi9JXLhag3GgN9cBNOOln1g6y45Gx77R0Mog==
X-Received: by 2002:a05:620a:460e:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-914b49c1522mr420121185a.8.1779460674672;
        Fri, 22 May 2026 07:37:54 -0700 (PDT)
X-Received: by 2002:a05:620a:460e:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-914b49c1522mr420115385a.8.1779460674118;
        Fri, 22 May 2026 07:37:54 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc66d5b1csm61135566b.56.2026.05.22.07.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:37:53 -0700 (PDT)
Message-ID: <3ffcf6a0-e975-4eb4-9a4e-d6afb583e0b3@oss.qualcomm.com>
Date: Fri, 22 May 2026 16:37:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Mark Brown <broonie@kernel.org>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
 <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
 <0c408230-61cc-4751-938a-06e715744c66@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0c408230-61cc-4751-938a-06e715744c66@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a106a43 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=knVCPYfzRBhieiZ2OR0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0NSBTYWx0ZWRfX1tJj/Jr5mL1M
 TpmHNOkg/mlS4gICnNRQGEZEILaGX2AIBnITj4TlimsRzlkKJdvy66CHpav91Jd7docSst+9Y3S
 nM3uOIuCBV4gFwMwuq4sK44JdqKf8oetykei9c598CRd3cHrJyjnG4Xi/zU/SwFFzAe5P01gonr
 pPYXX2z7w9Oup8YbdFah7sfOIr+JPJl9/wCQAJkx2kzPL318WVt081dHI3r9ojEAh6wZkLIa3HL
 4DL6+6FBE8NYlLGnnW4dKaNh191pu0z41cjTlyJHt2czi4Lh0hWAXDFox15wkuRSD8XqWtQMs8F
 igJc5dQMOLuoH3hvM8Uy0AgdgHY65wT9JnzL7KyR3wan5xO4Ifh4MjMY0bthOC6aHUqMObjkCyl
 spOrUHB8OkLgBg9iV9mKBnLtLo94c/CrKuZwMbt7trO8wQqTWkWl5dyl8VV6egwgk0AjWf4W8m+
 Y8BXAuDauJCEjQKxwcg==
X-Proofpoint-GUID: fntoWoP4ytMpQozH9hCVXVO68zb71vSG
X-Proofpoint-ORIG-GUID: fntoWoP4ytMpQozH9hCVXVO68zb71vSG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109345-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6780F5B6707
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 3:17 PM, Mark Brown wrote:
> On Fri, May 22, 2026 at 06:34:40PM +0530, Ajay Kumar Nandam wrote:
> 
>> The driver now relies on pm_clk helpers and runtime PM instead of
>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>> clocks. Runtime suspend and resume handling is delegated to the PM
>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>> PM callbacks continue to manage regcache state.
> 
>>  config SND_SOC_LPASS_WSA_MACRO
>>  	depends on COMMON_CLK
>> +	depends on PM
>>  	select REGMAP_MMIO
>>  	select SND_SOC_LPASS_MACRO_COMMON
>>  	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
> 
> Shouldn't this be PM_CLK?  That's what the APIs are actually conditional
> on, currently this will work out since PM_CLK depends on PM and HAVE_CLK 
> but the indirection leaves a window for things to break in future.

Yeah, leaving it as-is sounds like a bad idea

Konrad

