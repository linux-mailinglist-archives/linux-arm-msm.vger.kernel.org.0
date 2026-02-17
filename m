Return-Path: <linux-arm-msm+bounces-93096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHoOHT01lGlAAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:30:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AB614A68E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2565D300B1BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B160E309DB5;
	Tue, 17 Feb 2026 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="giunyFuu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HuIK95Xs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8561D2C0298
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320634; cv=none; b=in+sCJKIarmjNaigfmgB9e/bjvQ774cguHHHf/kKVv3pbA3q7wYps3quIzq4KBWHc84xo0aJh/7IhEbv5PUVO1ikR0rOW7vXQVBTUamMbARu3f37JO0jRUP+u4fAQxk57tCjm2cIKQ5tmA3ZftxuX/C9JikvuzgzH7E30Niv59k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320634; c=relaxed/simple;
	bh=hjk7Ao5SD1izG3N7dmW+8OU2qIogsZraJe+3rj4XHTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JlH6z1CD5rqPaEDg6C5qT7KSCO0DAyx4ShcwSECJnWlJgl3u7AT2zqSRgGQegODw5PPWiRwef83A3sjIjNZQYXg0h3mQONcYmhzqQdgmfdLSMkc6LY4jWvi9MA0vq87aD3XvBKDQKLHQ0MfUaL6gHvDGEdhsdqLsevwv9nZlk1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=giunyFuu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HuIK95Xs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H0GvAn1973499
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8W5VnLVQTMNajqo922h3PHI78p/CB9uzSUImNB9R/sY=; b=giunyFuukUa0Px9M
	OxTTEb0mAtF94EjoNo9OeYfwRu/ECbR2p7ruD3HLy5vNL6JLa5F5poldOzCeM6Mj
	cxQ8ie8Z1a4M2wC5xGkkergKDm0eOFm5JO/LsDO2LMy3PoLIot671xPeNc442YY5
	jziPUIsWJDBKWfrCQrF92UwNKJFvIuUDEsb74MvjFTP6qyhC71MP/hVPeYJCzhgV
	G/ihEAMLEvYlIGUkK40jEL+r2aKyTAeWu3/LlsDtwK6qPEK5xbxX2Sl9shFpqhob
	v0Y2meW+J5WoEjovbai+ZD6tw9GomvNvftTBcjDj2y2K1oPhKZ3YTshsjsMlZ6KI
	hth+Wg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662suee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:30:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb38346fdbso326297185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 01:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320632; x=1771925432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8W5VnLVQTMNajqo922h3PHI78p/CB9uzSUImNB9R/sY=;
        b=HuIK95XsmUngXpzMdzOfu3hCcehzxy7xtnv4HO0mlzUJlSO4PM+jc/v2bOQpWsqqhD
         9R1JheSrXCsSChLAaNoxk1Rbx4yiEoKKFiLqR1hCETp0N8grWw18Um2TrM6svrk4xOlY
         HQKkWHMgohsiHd498b01oMmwNoACj7Eo2O8CsGIXwpvg9uGoLkm892jU1OrtVQbzMGBx
         b5W9GvHWNZUZ5z5i5AtPc/WRLJA1pdAObQROGkxlIvnb7FSGYcbXBNplbB2j7f/Wmsy5
         W8IV9OlUVhCvckREtO0fW7sE4/9IyRA43ISHCmka0Xn8kI98dDsrk5F85F0E0nCNf2qi
         yapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320632; x=1771925432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8W5VnLVQTMNajqo922h3PHI78p/CB9uzSUImNB9R/sY=;
        b=AdhDlKNrI2plue7clUdex/U10R0Amyhvav2Z7mmHPiIT/del68z2S1dM9yFyGLsOME
         XlBB28vmkUVAXHf3EMVo2avtTc09Q8MSW0NOqBPPE5Mq9Wv3EohWHn8UgocRp/hxJ+RH
         6POjFoQFMLpYIvJT7wpC0g/rmadmeyHLcATIdi/k4buuKwtLz8+Zt+aj6zHVqPPWFDqA
         cgmG6ZAntNLErbwhpAwmQEStBApc1vanUAu7mNDkRuPCk6pnOI1Jyqq9/fGiGUrvg0M7
         yQ5quloKT1rHlyLs79zmrGaXOfAl9B3c6ByfDSk7O5Jsp+KiZXCOtMPdAaKE83ecNgc5
         no9g==
X-Forwarded-Encrypted: i=1; AJvYcCWJ6Bq6sQrEsSS7PStYE05nyzD57JLk4Z+hTtVnUanNndFEI9wU8a1Do6ZyVrLR+cpR5YbqyE+POT4p8MWO@vger.kernel.org
X-Gm-Message-State: AOJu0YzyHnwcblagaTFqGFCp3W/tp41EFIpho/FZJa1wOuF46B9WtZqA
	ihyR+s3KE8k+NrfCtxB9vxxRmFSBjf1QgZxcD93GYZCbXtsLMTmXlv6ZXizus1q3FWlIpW3oF01
	P+TEIMfagfl9BqBPFLWFf4zRkvfRD3vN/iOlV7HO59w/BAr0dYX4aoMeUnfqubiswH460
X-Gm-Gg: AZuq6aKM7/mrTXnteqdSEvUcyW6WJpQyUvfbWpzdZy7QP9KuWNW8fD5qONP29viH9xS
	Pv59V5MGIjOxeIJAoOdb4+jYlhnGgaIvwQxt1hxx55OoumPCe0p6CNv6m4UpyiVC3+Ofh+drvyH
	ubbpSq53uSUJAu0loWRwJd3nHr5Eex2OJAbV+71/h5+M1iRL0W5Hx9uUvRtE1kuE7vhD4WBwB/9
	3obc2v8hN5LD/XMd3WzwRoUCtahhSX6y4Ljqd7lTr6TaLE+Kw9z88p1Za+FJDGTFBpjkE3ZGgpR
	YtPxtB9tSc4BooDXvLFZIQyGI+o7mYahi7n23M3bX1N43UjnJwT+7QyPZrgJn//IOdMcSHx2ULs
	CufzgnxHVDZU55MXDYB1uCbmXjsqhfw9ZLRaEpB8G7FaugRgVyoubCe2cGWYJePsuOgmYorx6vA
	+GqHs=
X-Received: by 2002:a05:620a:28d6:b0:8c9:ec71:b224 with SMTP id af79cd13be357-8cb4074ecafmr1335129385a.0.1771320631847;
        Tue, 17 Feb 2026 01:30:31 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:8c9:ec71:b224 with SMTP id af79cd13be357-8cb4074ecafmr1335126685a.0.1771320631478;
        Tue, 17 Feb 2026 01:30:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e3ae4sm2310747a12.21.2026.02.17.01.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:30:29 -0800 (PST)
Message-ID: <2effa1a1-1ee1-418f-9194-748440d4b94f@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:30:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: sdm670-google-sargo: add
 touchscreen and display labels
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science
References: <20260217000854.131242-1-mailingradian@gmail.com>
 <20260217000854.131242-5-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217000854.131242-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OCBTYWx0ZWRfX+SRllJiC7jRz
 iSrIMJVlMKdqFO8TwyXPTCnGq0Wah07ZycA+B8t0a+Fs2RRskSPag5E+x74rzxC3MZ7vC99Okqm
 x6Pgn8Bj8+UdMepwNn2hUa9GnwFPGB5T9PaVyFysZ/9Y1Tp1F4lXBkdH4eX1PoSFgb07ftBQ+WG
 6GlVM2RKTl0Anvlahs1m2NK+HaFDo8p5OFEjvalC4skSQDcSOrupj1uu00hH+7BmB8oE4xkiMls
 6LxJqc02tQZSqFgD258JzfUzV2zk9sOSG8G77LURJsVq2nyWGMtj2EwjWeco3MDeehe48yE1eNW
 717GzgC5QMl0383cSs4mm8CACIjbUpoKjMtGrnLzBIEDu6dQtmEh/BPWHxysGMIVxbh6tRsFSVe
 IkfQnXG/EzOnGzz7JsQi4DmwhkLtogIt9ca2yX7SwKTRvuuFR2vameA5YPhCGq+NCi+YM9aW6ya
 qAzdaZ8k+9xC+XtEpCA==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=69943538 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vp-gwG22Q1kQfukJ7XUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6t0RUQqgRBgCUPBgSkdfhrAQM3WERlBV
X-Proofpoint-ORIG-GUID: 6t0RUQqgRBgCUPBgSkdfhrAQM3WERlBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93096-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 16AB614A68E
X-Rspamd-Action: no action

On 2/17/26 1:08 AM, Richard Acayan wrote:
> The touchscreen and framebuffer can have different resolutions on the
> Pixel 3a and 3a XL. Label them so the resolutions can be modified, in
> anticipation of the addition of the Pixel 3a XL.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

could be squashed with e.g. patch 3, but potayto/potahto

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

