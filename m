Return-Path: <linux-arm-msm+bounces-102490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIOOD5Cf12kUQQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 14:46:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4F93CA936
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 14:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60EC83041A49
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 12:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408163CA48E;
	Thu,  9 Apr 2026 12:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGvHF6xX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VOiwTvTz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A193BE630
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775738654; cv=none; b=fD20WBNJLnYQMthBjNXVY9wwe/xYLS0HvLEOPnknnrwJsWKS93Oe5C6RUkSpHUR8n1qKwJ3eZU0rIhjlLUTb+1P5VZaaNEEfyyu8ZcxrW6qUoiGWSIEsCN9o32257yjBfJzuUQW5SqPiftczemFM2Wajuljgf47ft91seMrniWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775738654; c=relaxed/simple;
	bh=3SIHh0Y4HoJCGFzcpjDdlE+ctNXBb9mCHjfhTCx9HFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIfh6DNmR24LZwijnRwBK7Prw68s0iReamAYQt4HDLkc/J3GNm6ZHfTt3zb77ivS6VJOjXntUqS2ACAVj1TmPLmawleCqZrdCXvJeRxLT665h16YyBB9B5un6l3Uxsz/e3qbmYgvexDLpaTXqZN4hPTxSklykeMCtlIotoTUqxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGvHF6xX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VOiwTvTz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397CVXg1072956
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 12:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9C9oWQfWDmGpPtikmH5HnfUowBswV0pV+/8WWu7A0nw=; b=JGvHF6xXWBfYczmu
	bRJ8Upsa2lINBYUJH5DU4tb/Ek4DxIuEd8+Vmp+hWf8wh1+OlpkHyJ+pRouKCJ/R
	//UWQHaf8AzFH1ptp52wB2i63aefDvOJ5ny00wQPj9HoLWVMhRZgdAyBFidWQzH0
	3yJTFH9LqCeewxGYbeQeUpZIAQp3IlrWktvohJ/ct/ikn1WqgC9zbA3RI3AlfYML
	ga/RmlciJBbEEVGGJxnZTukP0MMRq9r+8NZM2XpL/ZQj1U7tbTiz77/9cOAMJxjD
	hZbT+reXROrrUemdEm/h+QnRpYT/0qu/+N0JsHifr2uotG9CvxaUHIsOosCfMLZP
	yjAVSQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtb3c1nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 12:44:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c183c2eso8731791cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775738645; x=1776343445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9C9oWQfWDmGpPtikmH5HnfUowBswV0pV+/8WWu7A0nw=;
        b=VOiwTvTzmYtYbn/cjctTKMjmsndt64iEWz5Bsc2pIZ075aMPq34CGYafL5KptxLmdk
         QZv3P06+Ln90y1r6DeebLqXZys7ipbGQGTnlyVszAhuco8s7Iz1y+re3YBxLoqbTKwGl
         1a2ZBbC8gF5nEe1kBN0PhWPClEpq2Ubtk6pR2LgX9vn7Xe/u4fVIjxH8pr6CQRuu4HhW
         flvLYRYqYAGs7APLfgIT74ZSWdVMP91VZPLcgwUtS016q61sqGZeFn9xCY/fKZoMNuDS
         niyQ/2HB/BREZ3/o2HFfmk1EzdP1bavsopHdPa2H3PyWXpgPmtW8aU4rm0U2WIwyNObS
         HPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775738645; x=1776343445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9C9oWQfWDmGpPtikmH5HnfUowBswV0pV+/8WWu7A0nw=;
        b=H6oLIGATCU3zqU3JYAz9hEZlIdUTzis0nBKCLXavEhO4utKr3nF1HJjWo/rRAidlH7
         SDVyKBVHHXOWS0zu574xhp28RpKuWEZtUa970b2ognIZHyt2rnGY8Zwgv/V3/su5ycoK
         J1lSydb0aQOg/v1KliXWl1RTkJJC86kfOfcS+0ZSasseHPq4m1hPGbmLsQAqq6cX+IG1
         nPFrdOSWRH+g5KtptT1DBD6Amr9i4i5bKeNDb3FKKwyuFeD61hvBss5z212pDL4pU/l4
         6Ci56F3jH9jbfXLXMlebkIihvpX+p/vpW+PRTwt5s5rzU9K9wi4gIcwFXxFqdKj3WDVw
         9tiA==
X-Gm-Message-State: AOJu0YwqPjCF4C59g9MaVfWp6w4VO60h4ilg2j7gRrrTnn7AkzI5xxsj
	qQKTMA+aleJHzZGO9glqpw/FwGQESdm7CEYMZ6eAC/7LSz23lMn5tLoNx0Y28BSYXNmeluDZ0bQ
	+49nk9fJ8clxRbKdBlt/EGbXCRWgmAmFHUixQ0of5uNiCkUyxbLj0XOHQP1ZZH1QB90c4
X-Gm-Gg: AeBDievt/6i69g28NH+nrjFlVfzYm06LaH8N3jjnumVvGTXBWpu/3c1fY+KipW76qcV
	Xf5qT5cKnQ1DoKc4Gz0aSiNV13IzdM9UK9vhf2vTg1r5zz/3T7pq9y7ZDtTcyiifKuSrGegFiVr
	HgdgUMNuHHwnx3Eb7Pwktuze62R02W4Hkl4dELkDEgHkuT58HyX1PpRlZsiT9pAPZEkffvrJByB
	wL+Ij+hkuzc0WsixmzNKLSe4BY3Y4+8iE6D64MLfgkUN6rO+WHdMECzA0y+6JpVEQLAtMSRNoY5
	9kmsNADZQEB0DMQ4pi9Izwa4+wO2lkEfWhdnYU4d5hPx4Z2Y6uEu1TzMlxM6qyXFxdQIDZ1+7Us
	ycInTTMfPXBsuBf8kW7lNNGVkkPbrETkeTqAJMzWWshbV4VMX321j7884F6ZoZjy6xLdeuaDL97
	LpcWU=
X-Received: by 2002:ac8:5f90:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50d62af945cmr248141611cf.1.1775738645279;
        Thu, 09 Apr 2026 05:44:05 -0700 (PDT)
X-Received: by 2002:ac8:5f90:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50d62af945cmr248141321cf.1.1775738644853;
        Thu, 09 Apr 2026 05:44:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c31sm740741166b.37.2026.04.09.05.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 05:44:03 -0700 (PDT)
Message-ID: <388f494e-72a7-4c10-89d9-2eefe0cd3939@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 14:44:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: edp: Initialize swing_pre_emph_cfg for sc7280
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com
References: <20260403-phy_for_next-v1-1-3d336b555019@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-phy_for_next-v1-1-3d336b555019@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDExNSBTYWx0ZWRfXyOC2Xmrr7wKV
 svst7iM/vFFk7fPXsit3LIKRuXxT0mElIbnWxr53dmSFNZpuRaCDnwCQg64oNQc8xb8temVxX7j
 rf08oqxMCBosDo3XX1jqAEmpYQxKQ9VVSzvbTlGu+/dQvOvdFwJWFjuNEZMQnV0swZoIqmr/vgo
 T4ijWEGk/ti2rvSvFIZ2Xmb3InAEGyuXhAqBDEPIDp3Z8MVPdWp6NUMEh21lMeWdU9JqqzwHDnH
 WOo7W9JyFhhGBruOx2RbfyIxrx66dHplasCFlUi+KIvaD9GFgnPPzSgbO+1dS1RVZVyRbsgFXRp
 D/3sJ1KrSeTLZ6cO0Y2GolLuDWpQq8EeZe+iofrGOPctk3utF9BMMBF/41DNJi54igQeEqZaEqH
 So/Brf7/muUpQ4L9vIEA1cuJhKBbqjMhzGt0aMPI8jERoiFEurm+tgFs1/TNiu0hCDT5fy90vDR
 abt86K04XDY/fI7+MYg==
X-Authority-Analysis: v=2.4 cv=eKIjSnp1 c=1 sm=1 tr=0 ts=69d79f15 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v1qHDkAZ9QAkCiyPRCoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: -VXUU0fExWXo0lY4sC6lNeyY_YkN_1Z_
X-Proofpoint-ORIG-GUID: -VXUU0fExWXo0lY4sC6lNeyY_YkN_1Z_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102490-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF4F93CA936
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 2:24 PM, Vishnu Saini wrote:
> Aux timeout is observed on few monitors like Benq BL2420-T due to
> missing swing_pre_emph_cfg.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---

We could take it as-is to get rid of the timeouts, but 

https://lore.kernel.org/linux-arm-msm/20260302-edp_phy-v3-1-ca8888d793b0@oss.qualcomm.com/

suggests that these values are not super correct.. I'm long overdue
for re-reviewing that, I'll hopefully do so tomorrow or next week

Konrad

