Return-Path: <linux-arm-msm+bounces-110970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LsAmLvYmIGrIxgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:07:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC31637E19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:07:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qi9JjwUY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b8b9+oH8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110970-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110970-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A10330B3B06
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 12:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC03947F2C3;
	Wed,  3 Jun 2026 12:58:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A18243D508
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 12:58:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491501; cv=none; b=rkFeL1sXZ6z53pxzWsZUrJ579huUER1WoYQ9gNJPJcW0GNBPHDqiysVwVqZisOtMu6tS/UUhNUvu/6wrS5UgVo9pDnXxSov7sQqUa+nGmo3u9qP9PUhM3OmGSJymsQEW1aBpU1rePy+0ESacNgtQ5pOZmy/MV/cyHJ/M8CdaBa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491501; c=relaxed/simple;
	bh=Rqlmnr4CRzpdgMZyKtYLTlqhom2S/HUqMDkMLwvSmqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zy9QrFvrPUi4I/yuRiYjjiA6nsDjeooSr1sjF4Cn4sgfvBte3CXnPHHqlMNTaVqzLMM5tlIAGFcRmyF1yH22aVFXORQpYWmGlGf060Ho04jLrDuKTnvuPCFrcXeLbz7Qi6tpBX4pH29qXcwNY0WcyRIkGYq+ttf2Bjfid0PrqIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qi9JjwUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8b9+oH8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CdRN43077858
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 12:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LN/T6X4gkrtOTjF6PAcl6RDvM4U3ppr+nFAnKlCuqQ8=; b=Qi9JjwUY0G4Arm3a
	FXgpD5wgWdRKJ6d1R82t/y79goB9BGroRqJefnQD+8/QSi/7F+VCW0TriQIy2QuY
	vvMCrhpqENsQU7Sc9slkeBJzr1zBOZl2V/lUbC11zd4UjUKoHwH6WagYoA3LEGwf
	7qx3OUKr6y5uuG2cPCpuzE3/DWtr7jL97hNTkfVR68XuCdQmT6Z1bu7Subb+Tncj
	ZZgNDO6s1/dziJQbhDYC8yLhLQb0vwIeS64yAAk8G2/Z3xdLGd05kziJMh07yCs9
	lDLoP09iflwsdOAcehVA5jIcpUknC/k4uaSc7YQxnkinqMv46gQDIVtPw99rXL8V
	/8+SRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabbtj60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 12:58:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9156dc90fdaso71425785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780491498; x=1781096298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LN/T6X4gkrtOTjF6PAcl6RDvM4U3ppr+nFAnKlCuqQ8=;
        b=b8b9+oH8IafMuG2GNm3gWusv/SzErLXn4S9wKdurqmiq73xBTe20T9h54BU9KNPfbV
         xv712CzThtWRNCOkeYvl4eG46Dk6ay6kQqVa3wby7GYqM0b9iAMBHPeNq3Tlh+jTOBSR
         QwSs/7i3ifSdDmjlCszoOL72CNHwhYbxK5HNRQ+es8Y8A7YxdmFPTfLPMdQAIndpcWN3
         /OMDgBsIVXm5H9Na3d08EjWDNzVU62l9JObwOt6B2plsg3UsajoahhZ2iPo2oNPPlQO0
         yG5roABpebIsKj2mrEEy5eNaRhpmAjrV+ySTEaL02Dwdw9z2K9/IhiRy//Cb4aO9zR94
         qD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491498; x=1781096298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LN/T6X4gkrtOTjF6PAcl6RDvM4U3ppr+nFAnKlCuqQ8=;
        b=BcMLjo0k8JaVH3KNa3Bw5+5ERGCKRj0Q1BMO7xVPKqbizNns7izizRJc1Rg3Dne5Wr
         HVPxvM0hJLYmsqccTxgNOzCyjLI4Rhuj9ePkuZU0iP6oYv97YUZGRzcVJnMlWxENq/eV
         2fkafphNU8MrWrpUpSpGLKSsSCmgsQpe+1uhseSyB7l5zCLqFDWRqDSH8mIcVkqjKYaG
         zuO8SVtRuRQoC8yHuoCJwD7j1h4qyzKHGfG3lsOz5buz/xLtvpskuI3IAdAfS3lkzrkp
         92B1mMhJhvIEjPlp4VS5r2WWIAq9QHSPK2HaqGC44kh0s/wjauJG+SjRF/1Db2DVnYH7
         nExQ==
X-Gm-Message-State: AOJu0YwvYAg16s7lKCo1JbfadELZph60J3bdEKpRAVqU+zP+bzWTAjDx
	Nai7ADsYJ3430euN2CfWVAnUFmvXwiFPxZeHqxV2Ikv+w+0/9Dbf68MNwDGuLk1PO/E/gszoO46
	HvVU4J2THGsSZwfXTQHuk/mCfA6Ua9y9VbTYgo+jh66F9UjPvrlSFgV37ikpoN8mf5bb4
X-Gm-Gg: Acq92OElLzKygO6KZKzrmxpDPwBzSB17ubIedcIIaZGcMXw5k3QEWcO5Bew390G1EZp
	Pr8nLHVzqEFGJH29QuDUZd8HC1jq7jyvJxv1xzqJFymE0RMyIDbiDbA73Bx9Sw6mTD6qB/tDD4y
	r1xlJo5elZrMuF1nyEDqZIhs7LAnigGIUSDqws5iSrgem2/DUNybFiAiyXShfHGb9truZvMm8m/
	jquWwfEispCrPqhrdmwnr+7CJ9K0LI+sAEQXPKk7xLvVKdGjVIfNgr+m7XCsa3Wa3oSymEXNoCd
	i1nGWSsz7t/vDJd2XopSiWk75AOlZcPRGUxYuBbjS5Xqo0GFEnQ+eB/7KEhGbKosyS6u66ceiGA
	UBEho0qnLGaiQ9fzvZ/DTvXTQgW9/3RfmfI4qnnU4qxjbyZDDzpKZsiI2OjzIiUp5b5yT+um285
	bj/iANvxlrb58=
X-Received: by 2002:a05:620a:2846:b0:915:8055:3f9f with SMTP id af79cd13be357-9158a3c282fmr370554185a.6.1780491497826;
        Wed, 03 Jun 2026 05:58:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2846:b0:915:8055:3f9f with SMTP id af79cd13be357-9158a3c282fmr370550385a.6.1780491497334;
        Wed, 03 Jun 2026 05:58:17 -0700 (PDT)
Received: from [10.100.11.76] (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1f62sm150973466b.57.2026.06.03.05.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:58:16 -0700 (PDT)
Message-ID: <4f9e8453-510b-4759-98c6-00c5d636bdbe@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 14:58:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add
 Embedded Controller node
To: Daniel J Blueman <daniel@quora.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260526112409.66325-1-daniel@quora.org>
 <20260526112409.66325-2-daniel@quora.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526112409.66325-2-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNCBTYWx0ZWRfX0D+XDxPyPu0+
 W9Dcw8I14yiVzvhIQTmjJcMgwQADXyhjdglra4Ahnryw25mQoJatZbhCzodJ84EjVPC3rYHAmeo
 3TqO5YXq2iCrg52qRJ9Aaw3NSwCmka4piEwIjz6scmbfVTH4KR65OY4tQkwqjZUWRsDdOzOL49R
 wAvbs7iw+jilSK1Rw8oP8B60T4Q6EtyDSxsaIzrNAi7LL7+SuhquRNzPKuKsjUDbgafVfQezRIX
 nKDsK2bo18nDe10ZNyMoPq6+klIUVj7V4raaYALoA31PW5whFBH0P4Pbc1NdQjGHVLUYw+k7WDh
 Q5nY8QGkTrVlTHOQiewtsOrgyJ9BIuPniYkYyoA+vRitAXYH5C7qzSMH03gaOt2uZ3OsMi/F61k
 CsKxHKkH5sQfQh16ezcWEZWI9L4fe8CY9baLcS5Ogi6CmxYxit/+ixDEl9ro3LAcsz68szICAor
 N5ruoPJv0Yjset9xcsw==
X-Authority-Analysis: v=2.4 cv=UqZT8ewB c=1 sm=1 tr=0 ts=6a2024ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=k28v5m6LebR3MJSO2ogA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: Ede_NgTuKxmd3ehpwL00j04rYrA0Fvqa
X-Proofpoint-GUID: Ede_NgTuKxmd3ehpwL00j04rYrA0Fvqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-110970-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hansg@kernel.org,m:rdunlap@infradead.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:linux-kernel@vger.kernel.org,m:anvesh.p@oss.qualcomm.com,m:maccraft123mc@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,kernel.org,infradead.org,linaro.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,quora.org:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EC31637E19



On 26-May-26 13:24, Daniel J Blueman wrote:
> The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm Hamoa
> X1 Customer Reference Device. Use the lenovo,yoga-slim7x-ec compatible
> introduced by patch 1 for fan control, thermal sensor and suspend
> behaviour.
> 
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

