Return-Path: <linux-arm-msm+bounces-114296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m8THIT6KO2riZQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:41:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1216BC431
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:41:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="XyMfC/Zo";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hVBJVD4a;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114296-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114296-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0156B301B17E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D5C242D6C;
	Wed, 24 Jun 2026 07:41:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32FE27FD4F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:41:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286907; cv=none; b=BaAT0XGSx3Lb7EZgGRjhyOT/09rBFU51zKevyileTw+GYoHOs/eNehHVJvOsIFGiQtwCRCzpHBuhQZgUj3cxNlABdW/apblv1HhErtnUuBQNdiOfNE93bXQ+ry9KYOoTzd9dfGifrkEXmKJs6rQChGrrbkWze9He++NBJ6eMKMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286907; c=relaxed/simple;
	bh=nJ0hVoTyNaZQ4ssRz9kOi3Yl0GCbZws9FSZkrvgNyJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoUmLleNEOwK3qBhmV2MQJQYHp0zl6IMn1tbTeKL7dgoEm9Boop2ucGl3rxiZTlnjB0Nr0Xr+gvgfuRDoouaBeIDPdxoxcpNU4IpYnNxqMNLe9uJouIYLw5ej44NALcqYXz710ToQ4AQiHDJ3ZMh/CVisk4NcRGuhHv/rHuRtQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XyMfC/Zo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVBJVD4a; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tsMk1972153
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKBpQCSd8mxuUPTYNquN2obvr8dkIWwKpWOlKURGIVE=; b=XyMfC/ZoWrXlgDzJ
	Kn56nOubOXXR1Leoz8vyUc0gt82lU0IVl7vByKQ3TB+cT7pJisAeRV3zK0Jnv2hb
	BL7Dshe89l627ss4meCaReT1ZMcgCqWqJaGM0GcM4V2go/zSaXAb/n7H0PEqkMWk
	/27Ro/GqhoYdrSn2qisQmn94noDvCajaL0h+K1pxRPYJXIvy/kWTR9m3sDCWvtfR
	qc8c+w3aP2/VHxJ3V1YzV52/feCJo5raxlxWroMmjHPUtxKgAdyKbpmi8qIZ+avP
	/+X6IVpLos6UJugdaP20h2k2oO2u+jVe6e5wyhJokiCNJS0Kusgrr2cGs/cpQdGt
	4Ubw7A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f00eva009-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:41:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-920eff1439cso8112185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 00:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782286903; x=1782891703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wKBpQCSd8mxuUPTYNquN2obvr8dkIWwKpWOlKURGIVE=;
        b=hVBJVD4aEfAlBWxOVqWQ+Pz6wy6yBIod3eZdLw7QfiVXJg/VoSnMe22VhwZtLgJMJr
         4oDQF2hceuwzDtu51qf/BKNucmuvioSzL5JAAjlA5jSSsI1B03HDtKGJe9MiYoOLOuSs
         Uui9jfoSBbvftyqGsoDOk1l/WssaCrW7U8FSh8+CgjiiawkRHpK3ne6Uug+0AnxU/NSb
         PiQj4+8K/+u0o1KFZWdgJiJDGWnx4AFj30x3KExnD87yqdvmx8ENmAXrwam3M1XJuS9a
         jra5v8p9jYBW2QUtecBSrrUIkaB59cT6SGdBYMcjcTM1Bgw6U46SeLXIsERrENBdbgMe
         xRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782286903; x=1782891703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKBpQCSd8mxuUPTYNquN2obvr8dkIWwKpWOlKURGIVE=;
        b=nDiRpMKJw2OD926Z/QbGF0JjxB7Af/EmAZIac7Xx7hm1ymmCI7jVCr5Wk9P7BWoEtZ
         sIkY8ASQrty0yVj5eu7QGhW5Pvmtr6z0d/9QTv1Z7xE13Fu32r9HlPWqbxk5Avovm0/k
         ddKFV3Wxsknn/CdlA7opXWTxYEqciMljVtwXh2KG+dHUb+JXd1XorYgHe6e11dduEyIP
         cF2oernwnOzzyeosrlbmWI1lvGlNGfXm5r10sIdM/iBAajTW1TugBhDMVwQ4bFN2e7Z5
         fEXDRH8xyqdRoTrRjWKh0edoaCNdjHsNt59BC3/PUqEY9KqGt4gqMJ3yDIXkW98jOlZc
         p0AA==
X-Gm-Message-State: AOJu0YxjeeY1KBev/KJ4cl1cT85HK27G/7t/wSQmYOML7Tiaq86tRyk4
	JiRjAekIV9z1s6lw19GIg9T9TSwT5haL6tSbIUzM5tJwhYPcbMjRiNC5DZh2tLxeyXxjeMSRcbZ
	OGoJU1EU6a+NHk40bU/8aYj7pgcMrxflO0Mpw6KgF8X7YyY8fblcXjU732v32LYRi78vF
X-Gm-Gg: AfdE7cmYXFOUUqplrvQofeI6XH7g0KE5Tje1DN2STeVoUYZhQ54s2Ls8K7TmZnmUsh+
	og/xhm3fGJZhSkfYM/YQt5XEpLd9jvsYLnhJRkcyq+wRhpGjykbRlmRUSsLY/+B3ALTCqh9T2aD
	bvJC70mx/R7O2HJFbISN++YJ/dYt6B0GIpae34vi2uHyGpIFSnnRHUooP8K3NqZzt7+ixAwf3Fi
	1hqbrpVdwK/+JlJke2B0fuIDS7wBqIBlXWTxY1oCakq/3wKdlW1zcZWUvojoODcNZrhlLcBYCJf
	Clocd2VZOfjE4qZAT/1ruPbv4K0525SCaLQu4wfBNtx99u5qi5JMuz4eZnhjwV1Sn/BRJsA5AlF
	B2/4F19WUBIs0+jkus7p4Nie/oMJyeeBGm3s=
X-Received: by 2002:a05:620a:1791:b0:915:79da:a898 with SMTP id af79cd13be357-925cbff2a89mr791906085a.8.1782286903422;
        Wed, 24 Jun 2026 00:41:43 -0700 (PDT)
X-Received: by 2002:a05:620a:1791:b0:915:79da:a898 with SMTP id af79cd13be357-925cbff2a89mr791905185a.8.1782286902887;
        Wed, 24 Jun 2026 00:41:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c6161f195sm626727866b.63.2026.06.24.00.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:41:41 -0700 (PDT)
Message-ID: <72faff67-83d5-495c-a8c1-0b4c0e2758f9@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:41:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: qcom: Drop unnecessary bitmap_fill() call
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2MiBTYWx0ZWRfX3XfbMSFk5vC/
 l8x8phMAtsyfghnomkRQCRi+Do/yxXCLBvjwDzm73k6oDbzxMyV8DP9ManavzyN2o5qUPvPm+zR
 9oD6hpmGbImVos5pnql7xuxNPUTKDt0=
X-Authority-Analysis: v=2.4 cv=JbaMa0KV c=1 sm=1 tr=0 ts=6a3b8a38 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CudRCQxTT4vl8MJ7sxAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2MiBTYWx0ZWRfXxojZIML/Qpl9
 R7G/0ZVxklGKppOOhh37rXy5NO2nUO5fqF9FNgK1utrR4BFc0G6ddL2/yTAJdJvHGrGn8Xk3F2I
 u7OVh2sZpyTEw9cx/NirLWhvgimTY+qCXqraDrIDWsb/7YbWH00pqenPToNGlo7777ysj1IxibF
 Nw2g9dNmvjhGZoi6U1vYm6wam9fK0Qe+0FJClXVtoCRMHqpEDk5/YfOKxwUn68QulMDBgPDFtmC
 67O8qOXnTjp702Jv4jpMi+R8iwBWaPmpFH2lI217B/zm63AsVZYOYP5NzOvBc0WWBiAIssGPjmY
 breYaZMVuap3UUQitPouhaDL8mLT32JXB2qGETmn9hEigkSUW7P+075A+XED8Lmeam9J66LrmjY
 uyj1RDNPAsnvx9xUeUHfnO7F5AXP3g==
X-Proofpoint-ORIG-GUID: mwH0ABY8vYLmKy0UjT0kzfwSvIuedqsK
X-Proofpoint-GUID: mwH0ABY8vYLmKy0UjT0kzfwSvIuedqsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114296-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA1216BC431

On 6/23/26 2:27 PM, Hans de Goede wrote:
> Drop an unnecessary bitmap_fill() call from msm_gpio_irq_init_valid_mask(),
> this is unnecessary because gpiochip_allocate_mask() already does this.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

