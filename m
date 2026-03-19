Return-Path: <linux-arm-msm+bounces-98714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KICNGmPTu2k4owIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:43:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2263F2C9AB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24A533041146
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DEDB3C345D;
	Thu, 19 Mar 2026 10:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lI4y85Jy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDXEMYR+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BCA3C1969
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773917008; cv=none; b=kgKrzjM6iKz55zPNBVdfkopPUSL1RW8CVFVsLldS4naXXtODEwi1tVpvI7Vle1YXdL0zsRa2iiZmdfMsPQO4iWqoINrKSXrse4D5+agRMLWkzb3PfDL6xb8tKB30jYZwz7G2I5vgPAv4UJQ2dU13gKzFKS/ZiIaJ6ga2qN/q72c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773917008; c=relaxed/simple;
	bh=uPQWWnIyq/Ng6Bu/jOM8RgjZYIOT7qa3LRT/IAGX4AQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=icEZgyJH0+PNOnN3+CMVYv2qtVns79D9kxrO1lXYnMukOhvKuB8Q64qe5Gdp89qnodnVtOywQ6lGdv1Y7uhYKhw3KTYl1YjJzTtzKS5Vu2DdYOFfmu3+Yq65CaeE+gvCavYP4JvYn6cJzTSD2STMDSNpizBE2lV4JsnSfOqAv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lI4y85Jy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDXEMYR+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J748RR2667017
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AEGfw0KJee8DCRKbyA9HzJFq4eyMz9hO7wvF5okQWSk=; b=lI4y85JyUyJcVU55
	4BJNPKQTCfuGgKxwImua1ksP0xkG0XenqVPSarFiARVnGFzEk5VJWQIgpK0TwRfP
	wPLdIDrB2KAFAoktmB0/cn2zd9NplCmgdq2fFjEXR+X4CRVdH3NeOPSMo3MNllpz
	oVH5KWxPILZ91dulm/0iEc65DwtnCOH/4D2uIdjBZpxjp1rQvTOvkUElK1yEzwOK
	M4T/YO2tvUNHHdiTxaxIFt3OAyxjK2S1LweIIzg7VsSCtRJ2CEgVv2ZZHM7sENnn
	kiXwZHi2L+/FmwIGYc6e5+fSHuf8bKL5YWEUyvSNSlCMwksJDOVmHkUlzDL86+8p
	0oltyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj54cg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:43:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8dc8b434so77309985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773917005; x=1774521805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AEGfw0KJee8DCRKbyA9HzJFq4eyMz9hO7wvF5okQWSk=;
        b=MDXEMYR+gYM4fi0rZTcw5nBS1UV0PcdEiaWr0LP+wLdmpOXVAszkwvF+94LO/euzKe
         B0l4CO3MgfP7eYt3x6KBmjCN65ki5YxQb1TOn/kgL8BjOeEa+k9rd9QYqGWBGaSW3ZcU
         8kC1j3VsXUdjd8V2CJ6uGrR/hwOU7FLXa3cq8DQzojI0uioHeWYJKVC7tl8OBnMwL/er
         T3+oSgom3KBOFOPf8BMnm1aS0SoO94Mk2E4MDlr1Hxjkpra3aCYgLRPuHfaVC9INm0gO
         NoLn7NhDToYi2LW1/wamEyOCMK5KTc1YKu+rhsmMRBeqacKpi0CQrqVjDSAN+brWSAtB
         X30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773917005; x=1774521805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEGfw0KJee8DCRKbyA9HzJFq4eyMz9hO7wvF5okQWSk=;
        b=sQ1uJvkWYUaKeyDOxrCIQDyMtGFVRXP4kXtnjlNvX9XV89hCnb0E++k607hQKLzRro
         fI7Cp22t0caOYCZWvMv48z5EX6v1l1qqUAwnXDFiiIoGKaM5yJfwd4r248qnCpj3B2CJ
         gUdXAF9MLcQYzmFE7qub1Kag1gp0L/ggm8gm/sYuRG0USTV3LRvHvLeJP4gRc4mi7SUG
         wfhAHoN9ULXmX04Ibq4yGHjtb5Yjj9HYXPVUs5xe24xAc0klXlQ6uy6OJ/mqoQmLkwIO
         ZsGqLSgRBfdgUEsnH00gkCsikv2+mdniGHdzKRb53EU+9H/qtvtWYl1oRjCkzxdwhAuv
         24pA==
X-Forwarded-Encrypted: i=1; AJvYcCXvz1hpqiN1TxgM0qspOUxmbHwx3lbXSy08UZeYrIOilRk9JlyITCUaXkC79zSU69MlQGDzUPOyhWMbVPgr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfg0ecYKzleWPCoMq5XlQ0R6BcL61pory5Ol91fe6vF34QjnL+
	zkrm207Y/1R76Hij8UhMyXB9hORGy7S4LuT50lVscjTcp8RoRoVbjQ1FWrg7I8ilGb4o2rAodNt
	HenXiJUZu0A7j1HuM23g5/3I22h7Ch33M2qPkq9N1ITv2wy5xyBEB4Q28PH9LMdO5M0Xb
X-Gm-Gg: ATEYQzwlM1bKOZX7ZA3OzAx57xpJuAd/AhAEz38dAA5xIfnRdxuqKUiMAKH0449lKWz
	JdTp/UV+dsIuCZjlVezcyQuu4y/1uRECW90ion51om8SGkYXdAhJBP6qHUjrHMN4pOH9kPWOFSg
	fg0ZnHbtykiaI17TVfw6ixC8MXQnnax4gjSG0dluMMmmwqVaMkBdWbqViJVTB0W2L3FTDN7j1EV
	iakfCcsXRlFxunmG6VnjtOKwHF9fn7DcDIfJlbELTmQDBSWj81dtcQcbhTzQrUwzLvNF+ZrEaNs
	JJWTGos7c0wwIjxdKNM6KKjqOJm55i34W6VQ3DBQIG5Ze3quH+VDaYRLbRZOKEPmXsb5GBboN31
	VqhQmkh6Dzv90csXRwBiIapjGAE+MmmZ1G7ditPg/SsCeG/xQYwxR/djov9ySxx670heL9ay+Xh
	eFH70=
X-Received: by 2002:a05:620a:4155:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8cfad325084mr689432485a.8.1773917005171;
        Thu, 19 Mar 2026 03:43:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4155:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8cfad325084mr689428385a.8.1773917004602;
        Thu, 19 Mar 2026 03:43:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667aecbcae2sm4007186a12.1.2026.03.19.03.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:43:23 -0700 (PDT)
Message-ID: <36659080-1ddc-467d-9326-87c8d685b00e@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:43:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 Hall sensor
To: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
 <20260318-rimob-new-features-v2-6-c1bf8917449e@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-rimob-new-features-v2-6-c1bf8917449e@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4NSBTYWx0ZWRfX11xwTlt4EdwF
 WlNOr/zAk7vjbwR5X/pNSpSq1g/Vs9HHpqlGHT7+AAsdnBjTo57iAt6XYHYgFj2C5LUNw6r2fv+
 TzY+FnG3RZ7SZxhtLKAJ5dYGJubX6HorhUnT9al2m8Yov5tEsQNuWaOV8MWSZXnJRwPFa5U3Yv2
 1DG8p0mwNgIBtmqpGSu/Lj9Ppph532XqzdBzywaai6XAvONXOWMyHclu50ZI04z+AwzscJNF2Iz
 02LkuJcM1C6Y6s84SWcP35w7yAfE3b2W+WXa79U5YkHINPE1v2+0YtM72ZBJCNTSKpMTO1okrPS
 4yojcZleXZZPjCfbHDzesIZx0Ztjnm/yJayOqZAH3H8Xbhibr10uRQpgpggXHwFjJmCRoo9J2yM
 K6PH6/77LpNvoMnQc8Agd/ksP3RKvx2n3o3qyRygx7k71w3imDNRFVTS6AayQbRZgkj1KRr1Zjp
 Bm9J9FEkDKu1Qg/EpIQ==
X-Proofpoint-ORIG-GUID: LdnLTs8UHlyOrKWMz3pkxEHH9oBOlFLq
X-Proofpoint-GUID: LdnLTs8UHlyOrKWMz3pkxEHH9oBOlFLq
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bbd34d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=1r6qRtClYgtMJJxfrUIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190085
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98714-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,protonmail.com:email];
	FREEMAIL_TO(0.00)[protonmail.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2263F2C9AB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 11:28 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Enable the Hall effect sensor (flip cover) for Billion Capture+.
> The GPIO is mapped to SW_LID events as in other qcom devices.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


