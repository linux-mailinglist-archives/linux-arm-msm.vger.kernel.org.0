Return-Path: <linux-arm-msm+bounces-96501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBwuIXPDr2mfcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:08:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BC62461FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93721306CC21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CF23D6CDC;
	Tue, 10 Mar 2026 07:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcn7Fgj6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjO9RtmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A1B35AC2A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773126504; cv=none; b=piNwn6C4dzoPmHvIbZG1G93p7z1KaWlI8wH9QrG2ZieJuQIFx8AnkSGHZENnENI8O63zH07Om1HDu9jKWMCUhmIyY65GDLQz+JZ3X8R/M6vmYHU6p783aVO2H1BH/kMEw1bjAbCIMclVB+m7t9Yzrgd+8+6a1ipUhe0Ut6O82xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773126504; c=relaxed/simple;
	bh=RhYHXM2kc6dVccmgVDQQtGwFmfvqJL/62i+Pry2FKr4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YENEmjl945SPS8P+H373By01mJI3yaCEJkjcCL95w3xNec+MNpTidKFdN7OprxBP35c3S7k9CmZ92TPq5IXkl6L4hc4F94sqYd1bC0XPQCOhTFbgDgoXp2vP7EVQtz3Bef/uyUgWna1FFSurpK9Nw6nq8elkL9k3L1fDcz6FQ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcn7Fgj6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjO9RtmU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EBh0246496
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vtePKHcyEc4PtQGw91imrhnMDPIGumdm1X+oOMpFwHA=; b=bcn7Fgj6JLWL7avW
	XyB7KQ88RIWAK6dg0Czz211KLuNOWPtDTpQ8OgyoDxvE98Lny5THFiYY9I2+QKuQ
	pn2hUuiYiLavqlOFHW+dXFnOmrVrPRGZNCYw7znNQxu9Tk7o4rTJcjr14ir8QRDd
	LFksscAnFIJZASQ0jM6ICZo+2ErQM0TtNOSzx2cIhImOWVbQjHYJ0DvZrDuWSWdB
	c/LqYQP0SGE7/SsdzjnEouhXp3zIPQJIGd2u4eb4bK/4A3WXjLOt2Wq16I7jWjV5
	9D2Es/+1opcE0jW23IiURhnPbvQJ/LMa9a1ZT/RKuLkAz8P2Je/SkaF0T9ZnUOeu
	nlPCXw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct88018ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:08:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4e9577ceso447600465ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773126501; x=1773731301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vtePKHcyEc4PtQGw91imrhnMDPIGumdm1X+oOMpFwHA=;
        b=VjO9RtmUUVgl8hC1WXdYRhBnEmQksm1y0oY+Ez0BF4XO0B9J+KfKzdzTFB4MgDk559
         G8foE8+0FXXj4iE9YwrUtbvUoDbeoJ9f6yDQG5Byy0U7eI9Z4fld3wMnhHcw81hDb1DP
         w4TrMINObFdTcN9t5tO8kUF7xh4AEJXgeiDO0wqXtvTYeUMSZ7MnyFX8JyqZB/33SLHa
         VC3VusuYS7OBZcylkATTJwjB5SWZc82svLDYCzGqn7uFgaQl48yFy3dcpOrqov+GNjR4
         FgyJw7ov6wIEogM/muemO0QK8Z+loOcEO6ycTLODtPVlGk72y6wLzIUcA4zisNuzvidz
         pdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773126501; x=1773731301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtePKHcyEc4PtQGw91imrhnMDPIGumdm1X+oOMpFwHA=;
        b=JJacLAYl9kIkPxvii0dSK+fvhnrjCI5TPbc4vRk+zZUVAStmGO4zDbJsqKLAepK7lq
         3ptKz2oRV/4LFMq3DDphiL6uvXDpJum9cFndOV88WzI4wZchsmQtglzclh0ofdjbfDqI
         jS+LBTDGqlizALvfNi9BEZ2N0WvhzN7dshVrqdX1r0jQj4VLYuZHXLw0Lq1/S+tlB9xG
         b2Gb1Vg6k8S4UixRMKnlEsW7T6BH5TkbdVaYq51G2IUMEfywFJ5SosyT3ny00k2Wol7w
         /2Z+ju8CBU4ZH65e5lTMu//CPabBcjLbXry4qHMB1tS4+bcJGIlJHGg287ctHv+UwIYm
         iaKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVSZcCkiM4pOkmFTsUxD6NwnYkPCWcIdgcGC6CWDHzKVWV7Ys65+66N0S6nYbgUA6K1gjYaNN6DLABL2Z5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9/12ksgK4qGk3kSjnuAvo50ely7yv6ENacEYEFITee9L+En4n
	iYLPYfQaIKpeLAcrQCzbfp1Ir0lxxQixk145b2yz9f87oc3tU7WBQ6V0Y9KLb/62WZa+BMxXIaP
	eW9bv5IwW5NQ7li/yTBejQP7JsdqiV8ZFNj3A7kT2IPeg1azxhoZ08VyAvsZJX0c0qSaGpVVZRT
	+Y3yE=
X-Gm-Gg: ATEYQzza6ewyaNWH1AcZ1DI3qfMtuh782b9nX8p2UGz4kMjtBEI/9YC6RlZXCEL+UdZ
	VCU7sL7/IP04A02YFsR90hF2uJsSGJh2KOhL4kEwkFJJnRP3CDvK30mL+aajYFGakB/3fNgUFC1
	8ovG2Bix7EuxVYoD18JoCf2lB7Q/ypiniyEPNNzPo+nPw4cMMjXNZSp1yZVmmwrCUMF82WX544R
	FrUpXhPKhsj4GL9Ec/7GR2kOkOabhry0ZRo8cVehlcwAnmhM4uniPs65S5ZKbAvyka6BGtG145A
	e5lJjZVNigcsm7emz9reLMUIUxcWbj6p7B6pnW9lyO8yvH/OKi/BWAGHCqhsHTkKXpQ5Du49Hn0
	liGP4T70PeOOGyJON+U4XUi1vWggL9Lc6bgNMC5WK0esVACVBI06nQMZQ6AgSPu94LjmkRGwjCg
	pbAuzwKa15yyE/0NI=
X-Received: by 2002:a17:903:41cb:b0:2ae:41d1:276b with SMTP id d9443c01a7336-2ae82477146mr161130345ad.47.1773126501408;
        Tue, 10 Mar 2026 00:08:21 -0700 (PDT)
X-Received: by 2002:a17:903:41cb:b0:2ae:41d1:276b with SMTP id d9443c01a7336-2ae82477146mr161129985ad.47.1773126500963;
        Tue, 10 Mar 2026 00:08:20 -0700 (PDT)
Received: from [10.249.19.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83fb516esm132605425ad.75.2026.03.10.00.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 00:08:20 -0700 (PDT)
Message-ID: <d002e9cd-fc2e-4dfe-8edc-9d88cad075a1@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:08:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
 <20260306-enable_iris_on_purwa-v2-1-75fa80a0a9e3@oss.qualcomm.com>
 <20260307-olive-honeybee-of-luxury-b22bbd@quoll>
 <2e0e4ad0-b012-40dd-8b35-7555390bf44a@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <2e0e4ad0-b012-40dd-8b35-7555390bf44a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA1OSBTYWx0ZWRfX60MdCYo8jndR
 elqjIISs5WRwwDI82GEMbLbiQWM6xuCa6eqMVI2E+cXUvywXiDixQ718U4tcfQTHbi9SbtJ1QRx
 VxTPN1Z58RjuYUwsFvUjF/LU+/yZqlFJj2XpbMp2xcu3m5kh5lLgP0TbLHuuY7DhJrtqbsI8YMg
 0ELswD0jUtY9srr0K5qo6kvGRLpa2c8ImbiTMXzeGy5hd99bMuDPWPBzCi2OlCb7wCQqdmYxlyd
 qrZXMpZdyYN2gbLzgDfjdb8sOIrOPec8SMZbVUjYsTFffWsiv96JQ//FXuYUkWTyHroD9AU8y3F
 /WhBCKUX9UyPrg/WeJIAfKlJ0dgOcEDjFSmI1rz5MVwIeHuNVqQNK23p2NY+kd7DbLhupMw57XP
 Kc58WlnsFGsZDb8Y1mcQNWa/I8cbG/C3b92620fe+KVL8MVW5Ksai9XqpMyhfu0/nZ1TgrkPYSe
 EgfOIT7IgxFnTMdfjrg==
X-Proofpoint-GUID: 5M7r9CIAARXJzqwopFQkwxIyWdFiLBHs
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afc366 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=eNhI0xmxWCpRIF5FWwQA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5M7r9CIAARXJzqwopFQkwxIyWdFiLBHs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100059
X-Rspamd-Queue-Id: 24BC62461FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-96501-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2026/3/7 21:19, Krzysztof Kozlowski wrote:
> On 07/03/2026 14:13, Krzysztof Kozlowski wrote:
>> On Fri, Mar 06, 2026 at 04:44:29PM +0800, Wangao Wang wrote:
>>> Document the new compatible "qcom,x1p42100-iris", which is compatible
>>> with SM8550 but adds an additional set of clocks. The BSE clock is
>>
>> Then please express the compatibility. Device is or is not compatible
>> and you just wrote that it is.
>>
> 
> ... so maybe you wanted to say they are not compatible?
> 
> Best regards,
> Krzysztof


They are not DT-compatible. They share the same IP and binding, but
x1p42100 is a separate compatible without fallback to sm8550.

I will correct the commit message in the next revision.

-- 
Best Regards,
Wangao


