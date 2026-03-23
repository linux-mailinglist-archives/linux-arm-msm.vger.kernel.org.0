Return-Path: <linux-arm-msm+bounces-99253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKFFEf05wWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:02:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DA32F2693
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C7DCB3014FE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C3E1BD9CE;
	Mon, 23 Mar 2026 13:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fe/YwLPh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="djWU3p0n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0961C3C08
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270957; cv=none; b=jj9e2yzSZUpDxlb6/+lzW0UmXr5B/DkpH0HQnsHYfpZbQga1Y8CNVizldmXTrldjsJAqmU+CnrA7KWyYQWvKV93yPZnC/o8a2KxTHK7Jn8UEnhwDjm62mcfjxcPX9+6l7Uqo3laZ6QCrnOfiTWvCkiRTI8ZTaKxos9QhVxTsDU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270957; c=relaxed/simple;
	bh=DBUnQ7IMF1Gr+J9ecn8zwAkezbKaY/aAKdMV8GBL3k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8aDynSI7Lwpozi9y2avLmDBUhLgqR8HGnt+N/11sAB1usRPqoC2zA4XRo9vydvMwzDge4VUPhfkc1s8pRiM+632wbNwafFyW3a+rNgZ2N+IYJ3HY6+ck8hriCIgd03kIJYxHgsSP3EKUXfqGB65uykJeEw3nISXL+vE3844gw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fe/YwLPh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=djWU3p0n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCehEs2475988
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUMa343R32BhomDdtjRDM4iz5nyUrk3NDyeGHjzbVrY=; b=Fe/YwLPhyoFDu9L6
	tVOnY7WMQLdjP21ef8tR/vlJ4Gn6copc0t14doNUN+iZfWxlbPEJhhY85gBiXOcd
	l675oIQ4Hp08plOjKFUg4PxcKtJotMg2AF5UWhrIEs/nIo90RTv7NiOCRhxO7VFN
	ab6v3GihME9m/excbv3gg5+OURHccc8mvPTc3R8y7dYbQ+GOdN6WhnlNg3IcGdNN
	eLOHn3LNn69w7XKCQy1fzyt15NY1Y76bPbGqej3pHV7Rcaee1aIyh8bxZnwqvi8S
	2boZ0/AWMLX/XlOUbYQD22ZJFSQKrPQX8x731PdzXLGD6ngEeQw8UFzsk5OtYUAb
	JB8zcA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r202ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:02:35 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9511f903b16so543082241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270955; x=1774875755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uUMa343R32BhomDdtjRDM4iz5nyUrk3NDyeGHjzbVrY=;
        b=djWU3p0n6xspyeRDLgssyh0IYUL4aLpxZSKH5r2tzh66+kEgUO98qaoS6vO3YGPnTB
         ovq/5XT2uTCylb+xcB3IoBFPmJS8mhiycDFA1Jc+mN5ELpXBVMpUWcn6WKEcjg9/p4pF
         /Maq3+GHP/lycIaW8SZfxHEBhK1OgwDEX4/CQalLStDGNecjyunaKBG+cak3xEnQDxMK
         aPEMrAhwISQIl9xFmGuyLtIBqacXdfX6ekHlDRLVF9E4Za3Bn+YzQ2u3nqpECLdO1SsG
         v8FRg7YFDbOrYYabXhAyciFtc+CV5xZoNIYJpXK25YwMxGt8MlO0xKsBp5O3/+Yvw9Kr
         Rr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270955; x=1774875755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUMa343R32BhomDdtjRDM4iz5nyUrk3NDyeGHjzbVrY=;
        b=GWAMGA/ScAbnQ8WE1weo3x/yAVUCKO1RnrquRA3jSXndv0NwkKkR8rac1oUuuaiNWo
         agDX+AVyOe0r8afKH1TUdNGWVMW7hM6S4OeIXoHc3ZGZJD4LcO2MiQHD2oWQlU+chYhm
         VP85KWJ0GrMBpIYBhtzOFRWST+UhqMMUuksoOH1cPr5xMMK01YSpvkid9bj1xyTUte8+
         I/4/TV8FC4OREhABbnrw/273zMk3CNHc+amPowzbEbCHQr7GE0TNbLv0aYkBgFeOs11O
         H2/oeZKX5uHu7iDQfhptEmRzdp+ItbfixDM6NrQjrLiQiufbJIXdpFxhkxzv/6aHWpSl
         I6DA==
X-Gm-Message-State: AOJu0Yxb59/fIjl2X9jyim5631f6nUfSQoJ7QgBh17yg88q5/+t84hsC
	s+I/LzEOH4C67hj+ZKD2gZmVD0dsKwvTtXU02+8e2u22VJo7aybweMphF8zj8zDZkd6z21yFSp1
	atVLWSE3sVk0ee4nX/c87zjBR3WPnC/5voaPmGBHxYuq1zMkPr2ZRe2hWiT2Ck/44IEPB
X-Gm-Gg: ATEYQzwlrEBfoptV5tkrLtGf4TiUszPwEIG7OqcxQ4TAbmZfmgitnzILav2vJ2gyjwt
	gXAaIe1dtU+pgCi/1Ge3IZkURxem+Z5qeAVWgMVJEKDKdre0HqBQF4Xy+B3KGKUF/BR+j4wP3wW
	plNAdAmIL07y6psCAw2Ov//2GBVUoIE7C3ZfkeE6/rg6PXHc/ki1ZPgI4PCmlyKt0uc4UltXQRq
	HPV8GWvIrtJci+UG0RXBSa6IBo55Qb1ULoGzXKQsbKC64UrREekdFBdndxOg6qGkyEhtDt4W7rD
	n6g0Q94dTaC8rYGlteZv0iE1fMevCQIIFERxHwm+0OMfBkrRay65wyfOdOb5LNN+1qRRCDWcs74
	r+b98mHgtGLS1ceVgXvCOc0GJSdfWxwHyk05P1BvrQwB3QOAoO9tB8izQmdyBkjESAbay0ZbeLB
	BLAqM=
X-Received: by 2002:a05:6122:c244:b0:566:fec7:2ac3 with SMTP id 71dfb90a1353d-56cde1c89bcmr2005536e0c.0.1774270953158;
        Mon, 23 Mar 2026 06:02:33 -0700 (PDT)
X-Received: by 2002:a05:6122:c244:b0:566:fec7:2ac3 with SMTP id 71dfb90a1353d-56cde1c89bcmr2005489e0c.0.1774270952442;
        Mon, 23 Mar 2026 06:02:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398d82dsm490430066b.62.2026.03.23.06.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:02:31 -0700 (PDT)
Message-ID: <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:02:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
 <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c139eb cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=M4mPnNHhtMrhvY3s-vwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: Yep-9DriKhXYuMKpaFm6n9eb__zpjRJ9
X-Proofpoint-ORIG-GUID: Yep-9DriKhXYuMKpaFm6n9eb__zpjRJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX28BeKex4xKZl
 m4B8VhldcKZSu6Xa+Z7ilF1PQ9KoXg7fABDvaMMXwlkPikLFdyubyAXrQdtK8E1cVZsg6VmUe1C
 Oj69o8f2gYb6nRoLIvlDagVRVf7SM/VtjoGyXJkEzOwvOC8bQsmK0TuKJ8D3OvW0OVYZC51djZ4
 9PrAUqa1Wl4fBtg/tiBkLSLJPSeucpAdhqqxUO2ICAfF6Koi273toyETGKaFgrOu8htTBlXEgcG
 wvkMxlZ7OZnSCFTKm2bVBWD+FVLTg3XBtVBXCI9piPTo1dcsYpmtzFynuk0bEoMUncYgVxj6RBs
 uNNEQoErRh+HoqVR/uHMbChVbrxs3ZomKQCVpZVVot/gmtjDgsoBub93dsBuKUaH6Tbp3YDTg9o
 DVFBIcO15EonZ+n3zKgttZELxrfoFH1Q3jT/HmCsArw40pwN0HOBZDczyjgtpbBfwd7HFda3xvj
 t4mYeRZyJJPZn49rHgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[11c42000:query timed out,11c4b000:query timed out];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99253-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,11c4b000:email,11c42000:email];
	RBL_SEM_FAIL(0.00)[172.232.135.74:query timed out];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[11c4b000:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22DA32F2693
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 1:30 PM, Jie Gan wrote:
> 
> 
> On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
>> On 3/18/26 12:42 PM, Jie Gan wrote:
>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>> Changes in V2:
>>> 1. removed two cti devices due to GFX block is down
>>
>> i.e. "because GPU is not yet enabled"?
> 
> Yeah, these CTI devices have clock issue for enabling due to the GPU block is not yet enabled.

Do they need the GPU to be online, or a clock from GPU_CC, or
maybe something else?

>>>     - cti@11c42000
>>>     - cti@11c4b000
>>> 2. changes two TPDM devices to static:
>>>     - tpdm-cdsp-cmsr
>>>     - tpdm-cdsp-cmsr2
>>
>> They were TPDM instances in v1. What's the reason for the change?
> 
> These TPDMs havent clock source for accessing registers. We only need enable its ports to output trace data. So I have changed them to static-TPDM compatible.

The registers are clearly physically there. Are you saying that we
(currently?) can't enable the clock required to access them? Or is
there a design defect that's preventing us from doing so?

Konrad

