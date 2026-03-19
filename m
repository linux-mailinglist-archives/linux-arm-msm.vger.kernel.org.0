Return-Path: <linux-arm-msm+bounces-98618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCHxBuB9u2k2kwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:38:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8692C5F1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD7B63075FB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3345328030E;
	Thu, 19 Mar 2026 04:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mL8pd7oX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SUOP8IHn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD8A3126B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773895123; cv=none; b=MqDiSmkTTIQlrSGDurgxBFUZZOU+Jg3LfdGAtHLn2Ton18iXrpkjJREc88QUQlvPm06BnK0SVN72whQH56dh0XPR/dHAq9ovAZb/4/+Kl7Y23xTqBOe3T/K20pvMbDJX7OPGlLAbHbDlTL8FMXXfdfxgA3vVTYcj5AcdXr2irB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773895123; c=relaxed/simple;
	bh=cLa4tjMnuA8vJNiGPqhNvqFBSbfaZqzIoq4g+cN66Ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T7rD/UnLbZ+Nu6RyiCKYY+Pkogi5aNJqV0kXc2iUSSKCxYAXnAWFP1QAmO6JsJCfalx61rUCfuX4Zcq244j/mszh8e4iLdwPufnsnUyxqIYWSIhSRXjRaSOFS210d/kt4T7L+4a2O3XgOMgauKldnIy0hEBwl11DjmwxmLzOlGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mL8pd7oX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SUOP8IHn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J41Qi33228013
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Ymm6dgdy3CHuaaPho7qfx3fKRul46RC3INBMXWJLJM=; b=mL8pd7oXyLIq2zGS
	6o7v8mT+DolEt8pYRjAANB+K8IlE68gBVR55WUDA1hf4krpSUmr9tYi9NIGyv7IB
	g42nEHHhTY/Jy72wkBO3q2Tn157+CD+p5l/NAZzAFFZWc81Yb6mB9ceSvPfq/9Iy
	Cc0iNIxuIMRQB5K5o8+QqonsX0NhWNDPTHX4K96DrN3Q3LS4+ZUMGWioNoWnKNVn
	eoj1vUwdw9xHJa8c9F01Yi8kj17rf2+YeX4uXd/mt3CqTD6411Bxu/fAZkQmEii+
	zTvdiro2KzX+GiYibmnO5wrbndZCU2L0Np333DLnR1mTX/EirQyUFcITaJ/7RY01
	4ATfog==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00eg9rtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:38:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35b93be1227so1072234a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 21:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773895121; x=1774499921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Ymm6dgdy3CHuaaPho7qfx3fKRul46RC3INBMXWJLJM=;
        b=SUOP8IHnW2VVHf5fTawgyi5CTimp0PROXtkhKxunHFhEEaZEwTqcWGBmowVceQ36/a
         4JCmYITli4VW3tJvFKN0jpF4aYPdMzl8vH5wYWVbPMaMQnjphC+z5fcEpqdbuGW7NJD9
         O9N1tBTm8dAXKdHSZeoRwflt8u5jMLOcw87QD9SgQPmXy7e1jFqdzOyHlziFx1GStguW
         n+GTmI3nGaeUIJYSGRwXcUpgiH1Dr/TdsvxcTVBTKcXd2MlGcZxCGKpvSwDCKFFvCJZa
         fQD+3VcczCUokgu3W4E8vAYP/SNZS6Aknfy0g4wTOkOUAiHcqeMqmC6q7SFZFYqH3zNH
         omuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773895121; x=1774499921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Ymm6dgdy3CHuaaPho7qfx3fKRul46RC3INBMXWJLJM=;
        b=reRX4f5YJfh9cT8w5/XysZTQXpH9pxUgjdCzdW/b5MNRwxjeKfO8qJnSRAvmmjPEec
         LUYxPpjisr+9vPvmfsUf4pSUdOEn3RT/XJdx6stXcp6+Mb0hmVu8VV23EsIZ1wVSk9ca
         Wb8bbxY84bzozzZGmbZKuxt3G6Og2Rb7P2aWo2DO/l785s7+0XMz5V0BkVG3QNz3IL3B
         Xy5U6ffyj7WtCTpw0pt9PeO+P/inuAY5db+5tJNvl7XJbIUzTCF3c82MGPzE7IQOkpKf
         QuFyNeOzSlluGvp0mdKqEpGxKy8Brqx++Rb0N7aVp6X4S7HmieursNI+rN50s2oDmT1v
         UeaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQmq6IEcS6on2Sl0e/tzFiqpyk3XHB50Kw01O71qE0RfDH29IQqq6nDWZin/yClAXMjlbwdhuHA3wYdCw1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1pzmv3CJMqvG0QpIkem8OY5LjxQZIyH9IfBbjGvYZGYcyEaE1
	3uxm8WFUv+CA+5Ej1hgtEzwae17FluCvr9fY7fnB2r3tEPzsSsf4DBfEkJnyHWC98eg6xUZZEJ3
	yjdW2k6vynIUIQFnfCZ2POsZHUuS9TtTTWqbhCqgXvmX8SUPb6FS5lQBO4tmRW6d1QiBL
X-Gm-Gg: ATEYQzzvyrkyfYaZ0cysqFn4awlaY0Bbv9m7Tb6n2oJQky/TZxXZ+/sGpA17gzRPsSM
	kM3bqdfnuyho0eEenAnqiUTLbPOiX0YobB9/ESQbNo03pE+ApS4vcWaJpUP3WQrEFFGOF4e2gIf
	J8adgXFM4bldGEAVoCedZGcwd7wwjRFmX9pXKTHd8dK81i6oZFWDqV4PTTyUqaHhLDMjcBu8aW3
	Y4GgVl7uA1l4lnUiKeYum+ZOCJMXkimDwwfJ3+jgaPQEhrK9EBw/msLesVGQc7e+7fJZuXomdNJ
	H4m7Qh3Jy5OXFrjhSzmyJqSA78v/nv11I7RYJ+MaNNL4eyiQLQ6z/g0UgR3krnIWZ2sESGt4+mo
	hghGq8pJoSK21GXO3XIH3kYiJyAc/eUMyVKsnSXeb8IqUfQqynZzKP3wEVRtC8AOnb3i9lM9pd/
	klkmfg8fmQgHan70Id
X-Received: by 2002:a17:90b:50cb:b0:35b:8d89:7198 with SMTP id 98e67ed59e1d1-35bb9e5d7b1mr5100873a91.11.1773895120685;
        Wed, 18 Mar 2026 21:38:40 -0700 (PDT)
X-Received: by 2002:a17:90b:50cb:b0:35b:8d89:7198 with SMTP id 98e67ed59e1d1-35bb9e5d7b1mr5100842a91.11.1773895120106;
        Wed, 18 Mar 2026 21:38:40 -0700 (PDT)
Received: from [10.133.33.168] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e577c1esm4479559a12.28.2026.03.18.21.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 21:38:39 -0700 (PDT)
Message-ID: <69596c84-9588-4f35-8208-9f1a17297a1b@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:38:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when doing
 rproc_add()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com>
 <20260311-glaring-belligerent-nuthatch-2e8ef3@quoll>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260311-glaring-belligerent-nuthatch-2e8ef3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MMNtWcZl c=1 sm=1 tr=0 ts=69bb7dd1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=tOLLlezhPP0Qspwkp2sA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: qh7s0L9MsIvTxJSPkef_dzrJ6adxLTwL
X-Proofpoint-GUID: qh7s0L9MsIvTxJSPkef_dzrJ6adxLTwL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAzMyBTYWx0ZWRfXwqJZEBlXQ4jG
 R5wCFf3zoVv6M4fDlTTik6WoJnJtwMlDPtV97E/w9M447sF0ZiVIFA/iLTDUl4/ifVsbR1q6IkJ
 XI2ONDmcLmQqxrqwVJedtmU9smzF7yoXS+HQVcRwQKLUkCq7oidzuWwNd/7LHlZiTHO6RtbBv7n
 KSvieFMVtssm1sKBEThEmg+Tm3VrpuMvPDMWglbipvRI7Ix7PaXFoCyqsW9dxSoBdloEWJLCEvd
 iACfTDQxn8o04PMtocZakRc7s6B7WKSX3Kas5YWlukhkMujzu/lJQ+w3MJfxTaSZFNggyLrx6X8
 tU0WSjaWHGEhq9sIH2mtO+7MzCwBGYiVld8Zq72CuQuTkuONpYM02W5WL5C11fnfaG2GGuP9py5
 XJoI4yVoGnWXKamiwtDAt4iBDsFvYofYpLTcNMxcr1zbYqRnfywjTVdheyUPE2oQFfctwuUFvbw
 OKK3rJDGCdlmHTIh3uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190033
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98618-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B8692C5F1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/11/2026 2:20 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 10, 2026 at 03:03:21AM -0700, Jingyi Wang wrote:
>> rproc_add() called by rproc probe function failure will tear down all
>> the resources including do device_del() and remove subdev etc. If
>> rproc_report_crash() is called in this path, the rproc_crash_handler_work
>> could be excuted asynchronously, rproc_boot_recovery()->rproc_stop() will
>> be called with recovery enabled, which may cause NULL pointer dereference
>> if the resource has already been cleaned up.
>>
>> [    5.251483] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
>> [    5.260499] Mem abort info:
>> [    5.263384]   ESR = 0x0000000096000006
>> [    5.267248]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [    5.272711]   SET = 0, FnV = 0
>> [    5.275865]   EA = 0, S1PTW = 0
>> [    5.279106]   FSC = 0x06: level 2 translation fault
>> [    5.284125] Data abort info:
>> [    5.287101]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
>> [    5.292742]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>> [    5.297939]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> [    5.303400] user pgtable: 4k pages, 48-bit VAs, pgdp=000000089e086000
>> [    5.310022] [0000000000000300] pgd=080000089e087403, p4d=080000089e087403, pud=080000089e088403, pmd=0000000000000000
>> [    5.320917] Internal error: Oops: 0000000096000006 [#1]  SMP
>> [    5.392494] Hardware name: Qualcomm Technologies, Inc. Kaanapali QRD (DT)
>> [    5.399466] Workqueue: rproc_recovery_wq rproc_crash_handler_work
>> [    5.405729] pstate: 23400005 (nzCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
>> [    5.412879] pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
>> [    5.419674] lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
>> [    5.425308] sp : ffff800080ffbc90
>> [    5.428724] x29: ffff800080ffbc90 x28: ffff00081be833f0 x27: ffff000800059c00
>> [    5.436053] x26: 0000000000000000 x25: ffff000800a56f80 x24: 61c8864680b583eb
>> [    5.443384] x23: ffff00081be83038 x22: 0000000000000001 x21: ffff00081be83000
>> [    5.450714] x20: ffff00081be833c0 x19: 0000000000000000 x18: 0000000000000010
>> [    5.458043] x17: 0000000000000000 x16: 0000000000000000 x15: ffff0008042684f8
>> [    5.465374] x14: 00000000000002dd x13: ffff0008042684f8 x12: ffffd37f69f967a0
>> [    5.472705] x11: ffffd37f6a006800 x10: ffffd37f69fee7c0 x9 : ffffd37f69fee818
>> [    5.480036] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000000001
>> [    5.487366] x5 : ffff000d6536d408 x4 : 0000000000000001 x3 : 0000000000000000
>> [    5.494697] x2 : ffffd37f5703c18c x1 : 0000000000000001 x0 : 0000000000000000
> 
> Please trim your commit msg from irrelevant data, so this will be easier
> to read.
> 
> Best regards,
> Krzysztof
> 

Well noted.

Thanks,
Jingyi

