Return-Path: <linux-arm-msm+bounces-106729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONQ7HAw0/mmHnwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:05:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D354FAECC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9AB33034BC4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 19:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582513FBEAA;
	Fri,  8 May 2026 19:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TF6gG/d+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UYcrU+gI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0779F379EF0
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778267122; cv=none; b=iUbLtI0rlcYcR8oB2zsmkJgiQ3cOzl3rBAXRWkSswmLR78zBENjOw/k8As7/5/a/sB+Ta7QB67J/Y2dgIfHYJkV90M1A1JZK1euxhpsJp3JWIV9dtw8Rv5b9273PeeRK+wjgXSDSTv9N5WEnGeQOj89hhga3gf1dRVidNNFBT7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778267122; c=relaxed/simple;
	bh=E0z9P1Rp8PQEbL1EJIqtI4bjCCcH5p3foBuKDocVrXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k82sspgXSscLR5oTLv/29qqFkLzWgjSCl2YdsW0YjQi0SAGBT38p05TVzIss5KOJqNXt11nIXnvlrEHSvbrNa94TryX32VCDXgGXCh9hBxFHT7+ts/rWtQ+CpSYDVNoV/OUsSReSRpx/Eid2CbYFw1SAmT/dJPitknNaMAWvDxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TF6gG/d+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UYcrU+gI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G4jU41116256
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 19:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsEqcgYOnuyqrkT3DZE/73T6JDxe1/eanTRXk14TS2o=; b=TF6gG/d+cl1gGsFt
	XhGc1rIC66W5UEL5NFsdR4+RuuU8bFY+GIRLMFCrib7bPBt69V/6G6L8HK/RPDBl
	SpFNXkni0CY6RCZbBBPtFl78RellB1feOoxejuN8LPvDWdmXJo72PwkKAjrQFuF/
	0KntqRjDs9vD3s9nuOngaBeUgJo4dV3Ty+hG7x8QW7xI3RddDG07djp+piPA0iR4
	4VWzI3/R8k5kAyya51dI3Y+UjAAhQFJznFhgYHpuZFcn9W7i/VLjl+ZDH4qV8NaJ
	AF0GqD6LSC1lB59M5a7yr/drfkv3ycL4M951YR+ul+9W92kPUEh2Oecz+p8tWrgU
	zB2sfA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1pgkq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 19:05:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f3eb8f3419so8791319eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 12:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778267120; x=1778871920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JsEqcgYOnuyqrkT3DZE/73T6JDxe1/eanTRXk14TS2o=;
        b=UYcrU+gIsPc11+6+yPXAEsf55GsphJz9/hxGos7M8E2p+T4jEQW/25EuxwOm42ciZy
         HGoHwLcthqE6Kk1AFQxcVMKWMhxUCb9J2Mx8acQHkaNfbkJHJ9rNQ01T4pwe2J/hxzNc
         S0QveC7OKx795Bi/wHvFVcV/HgkWjPq26GyzfMZ4qrN7IBYVixvsUMOwf8J/mBSbyHbf
         CqLdDwyxsplZqdkJRoVni7mi1D6Ijq2bdWD/uyvlM05MZr/hyGXahJytExtdu9mMjB0n
         POwcxKkkWdf+4/CaT9VQnHw2DrI5hLPYIXGcsPYym74w5pAPLBKR8y3tCIDdnFV5ehdi
         Y7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778267120; x=1778871920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsEqcgYOnuyqrkT3DZE/73T6JDxe1/eanTRXk14TS2o=;
        b=RclkJE1R3NEYcCsAQCoFnmsGB0f8sVZRKAy9Jg2e6XvgVAjXYY2Jr/DzSa+oykYmIs
         MMqec7tUoJC+cRdcEhmtOsArNzVCzR4Wuq05oQeQBO4HtKa6Lq0HfeBg5cmBGe4LiVnD
         Y9Xtn6Is+03QlkUzS9/rIXjqGQqRPMAZyJ54Vf4GppxpMTOZrNrAKZ3UfL3RAy19Esri
         Mt9v/ucyGhUIGjUX0nhJ5R+F1S3uHNC7bbwXij/4ILaiYHpEvdICYnzeGZkiVuhhmm+B
         veSGB6q3+RnUDwHWL6e3dRIJOh4cY+TYosZf0kwxh6aFOQuvR269jf5jP42s7BslFkij
         hwMg==
X-Forwarded-Encrypted: i=1; AFNElJ/rdnPl9JYduLEXwu5tiNALTn8aIMOw86mrnYnICHiZI1AXjIwWZqPUbXucpiki136xZje0/unbOdmPkcIL@vger.kernel.org
X-Gm-Message-State: AOJu0YxiUqpeXmI/18paRSVz1K0UCg954ha21JusYppxJduiJQ8ZEBDq
	aG/dX/Kw3DfBBR+56EJp0nLCqMsIlbxcxoOQXozBlx6WCSlWCYBA+Teqa0zEDag/Ub8ORRAOLxk
	ovvt/StgDIPKD7ZMCHfYXHNwxjabEEAag6jFWVQKFAKxX95wqLZOfMrStoUJfPetImS0q
X-Gm-Gg: AeBDietMptHAcvQczXa5vU0qg+xHw10Mwsm5BIRohNzMbKgwwarIEeOW/I/+zYmxXkj
	XnRe5igADKnzFg91eiDm2ZBXpEVIH9JQ/J8jcimb54YxB3u9GxKgjsoTkrEjsDLSytPCAsonMFc
	UEfzcqi+rwA0ZFHh4UKUQbfzdFiYXDlICX7tBBkKCnD22SJlsY3M49tXxdyyl399T08Q6rFM5Br
	P+xn2f254M301ZCNQT5I18lPMIMlwLxrn14rs+fJV30ph7rOxtcTh0MAVwWjM3XsIkJ/lDbjRBR
	duPQDo2YiFG5Kilx48NeBHhVXoaNxC6+0GduzRbT4ZZGfcN/co90LbVYw/RQXGY+st/WT9E6Urr
	SGbBdYC4QW0MIGBgpCAKWBxFUpJXuvDVw1CjtoGZ/AYvEg50haV8qSsqxyJQ=
X-Received: by 2002:a05:701b:2704:b0:132:1de0:1295 with SMTP id a92af1059eb24-1321de01ba5mr3350168c88.17.1778267119716;
        Fri, 08 May 2026 12:05:19 -0700 (PDT)
X-Received: by 2002:a05:701b:2704:b0:132:1de0:1295 with SMTP id a92af1059eb24-1321de01ba5mr3350154c88.17.1778267119163;
        Fri, 08 May 2026 12:05:19 -0700 (PDT)
Received: from [192.168.86.243] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210d40sm4131518c88.4.2026.05.08.12.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 12:05:18 -0700 (PDT)
Message-ID: <4e132e7c-ffa0-4954-876b-67b53870e832@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:05:15 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tjPgzQWRhMkKEI9X2TatdYlDCNUab0XR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfX2uTmDfsBhFMq
 N1s95jB35jQfOZg43qwFCdO+zDZpcqJZ/9lOhY2I0VxcXN5xaB1AvAFusM+FRNCPbGEvBNj+oZl
 AW3Z06FzXXDGX3T0DmPih1sp2VRYi3AW4Hc2ZChs3TYN/naJC0koy1eRIDmh9QaxrK44NQb45LJ
 BF5aIq1WLFpsex35pIzUVFDRX3aRoL4sONJF6/hb8lHrrEL78c7S5vLqluNHn2mVXTN+hLlVrDJ
 lnKb8P2HogbTW2ctvOSWwkiMmHbpbYHAJNWmktpJkseAnm/+qYgzcBxkH8DabOBLOMYmYLjFR4d
 wu8MTJzH5XRnIhgMX+fXN6Di1l6PeoMehe+tyJid2rofuf6/fGc+T0hGVgvB8KJzB3HHo01aU78
 ORyxp+1DW5AXz1tx4CTsiXf65vanItVaH/Npgdq9S5Cxd6EXr9zPY2Vke4YhcwaSPw7VqU7phPP
 Olhl0vfdm2LwHP+iAqw==
X-Authority-Analysis: v=2.4 cv=COwamxrD c=1 sm=1 tr=0 ts=69fe33f0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kHdJLIi08kw_CshnY8MA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: tjPgzQWRhMkKEI9X2TatdYlDCNUab0XR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190
X-Rspamd-Queue-Id: D1D354FAECC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106729-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/2026 11:59 AM, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> or QHEE),

Gunyah has open-source version as well. Can we make it little less ambiguous? 

---Trilok Soni

