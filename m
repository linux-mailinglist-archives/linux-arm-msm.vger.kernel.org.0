Return-Path: <linux-arm-msm+bounces-95275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F2uLYf5p2mtmwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 10:21:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BBE1FD7DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 10:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96209302F98C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 09:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B283914F0;
	Wed,  4 Mar 2026 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuwAzi+F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPqHNVpI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7277437269D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615973; cv=none; b=N1IlVJk1JYp6LQq5KaBtvsrB2T9yOgUEgKVPhyYV3tzlhT8C68uYrgJypHE6U/C1cPc6VuIGOIYscrPQ0QPUwU52NiHc1iCjklipBwcXUcRdZj5TW+hYJCuJgSK2RXU1IoPQsb+0Fw+U91jL4DF54NFXL8HoZpL97yrZm5cv+vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615973; c=relaxed/simple;
	bh=CgUIX/j8xbNBZepU+kcoSbBhv8dHEWhS+UNWzvSI4TY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFcCg/QMieHmd4W53qxYpoj3uAreB5yrPP/mNw+ggspX47Eo6JA0nA8GWHUC4GjcvMw+r0lsRcfto+PnElY2+g6ZKaO7uopaIkJID+NCksj/nl+9Yi0TMYnJAvr4b+kmlReulai5kgxXGxGGnnsyc+hzYwOVkhVoQ/wDDwuugiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuwAzi+F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPqHNVpI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SmW02275412
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 09:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrXi13Z30e/iaNuSMOSCmABJiJllICGpM6/FbLGTct8=; b=YuwAzi+F4fbeBVFB
	iREDt9xOK25QxQJrQD9qQLEEn7kx2IJoRsk3BfYgaRyb88tda99pF21X1qL7flJU
	B37R1lKTaD6s423Pz2yvng3ji646s54i1y01ONE5m0qTyIAMDPkS5Ns1sS9uL89T
	/dRz88Y/PXbreMlfbaR3yuhJ3svEX2/6P5MZkYjQIvuHJ+bIIkftl8UyKQO02TNY
	AzK+ubTyRCCYt4FYGWXG656WriKN4Rq7MuuvKTc10kgV64qh6439oWyGUsfDGgeB
	a2+QuynkoYxCj4v+hAMXmQs+/JlW8XFO4/ktDxvKBF4fGvi+cFKMIQm01XZbHfXW
	5r2cKQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4ms7v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 09:19:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a086578c5so11352156d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 01:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615969; x=1773220769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrXi13Z30e/iaNuSMOSCmABJiJllICGpM6/FbLGTct8=;
        b=BPqHNVpI5jrQXhlBuFJjv0QZzmUbTXxpRVDxAiLdl2O/bs9Vcf9ZrqLfQjgsvG8KoI
         Pzo4Y07zPZz6Y0a96gX4S3pfTlOCrCLZthc8TAtY6Y4yUbKgRnQYUsfWfG3+UlEMy+4N
         iRhZm7OUdLD60YG2a9FakfQ4D80Ju3/uMppi8za92V+/GebmGHptk5j1evnrNFoEqYuE
         uidy08KS58xCg96ajjg92LsWAuNwd979T5iAk2M8HhdeaTqT+G2BN8vUZKl/VwxWFWxM
         PKfXoISs7VV2QPaoOP16T4wXzrl08SfeXK9LhP8WD9xS4TLrFcpgD3KUxSQzBNfBb07D
         xGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615969; x=1773220769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrXi13Z30e/iaNuSMOSCmABJiJllICGpM6/FbLGTct8=;
        b=u4xw28iIKMmSkVpQUjG+BR8rG3OOz3HDhJTuB212jPYd/AoXBBKIlhY6CZlvytV1xh
         TPxgHCDce100S0rArhT7agMEnitCnxqaRH1U3bmflIVpjZI+jpbpLDVnza1oUdYXRDsB
         QR5wOeDoohqgD8tQtsT1j+ToPH03ghtroadlwtBKleQXWdvlvarEE6HqZJRSaxOL/XHt
         2bnB+dAvttZtv5oYVsQPccHYMpL3emtlh1s2qKqNYLmSKN5QOwYz4HrFj6Scb1Ii6EYb
         1IzpV5+lB1OIaERk3yq1kPIE+K1CeEEKji8gXv+gE01SkeEVd5OOFYmFpHEZB6AB9eDV
         WwuA==
X-Forwarded-Encrypted: i=1; AJvYcCXyyBO5aWjxlo9QLUPdS98WaGkU40xTgbPaNGe2kZzbU4iqTAcm9umnK73i6LiR+qG44szXF6/BxIepSasH@vger.kernel.org
X-Gm-Message-State: AOJu0YzKbMpEMB4AxuibE6DfihRbL5WFtBvIRIoo/JhjTztygEakhJ7y
	SJV8vFjReqiAt8wm8az/X5mKBnJhoj/DehSRhgokisR0/m+xulrbd0glktkJgsDEl83kW/BYPAD
	ndk9jQBbYBRQPZAc3bJPZ4xLtmcZha9n2xsizv7ir81NtBkbff1H+QKeo07iD+D3mNtJa
X-Gm-Gg: ATEYQzxfPbgAoiJJh3+Lka6vu/+WPze+1ckXhtkT7ufYnmsLKxP304waXjARtuYcwCa
	BdoEMwpXjZlxQ4nD3CtXmTO21/OVlapkWfGQlBSMdNZzE+IjgD0AJ2ERu4x3WzYaCIbAvaydF/W
	APvaL3lsb/KCqot51tWG2s2wG9ltd67Sn8QK2UJVJVl4ulRwmykG50dd1+tchfaXeLKoE4uidYn
	zQI8AqtShPdDf1n/ZzGGDW7NckJzUddGsnmYx/D+AhoLlP7XTA+IPhqDMHQPPZjE/PRiblIgWgk
	JIZi9XHKwGYX8o9lrVUiJWQEZ3RX5RuqH8MXlRkfyfT8GaIGfVj/X9cwlra1WnI/gswFkmyUols
	wGxhwPk/oczgADIY33a2lJ90ZwZv2Ky1CRZWS+MrdZzljgUmVJ7GNKj2uzqfMd5iPNlbwbw6W8r
	Sfask=
X-Received: by 2002:a05:6214:8090:b0:899:f3a9:19dc with SMTP id 6a1803df08f44-89a1998b809mr10047296d6.1.1772615968868;
        Wed, 04 Mar 2026 01:19:28 -0800 (PST)
X-Received: by 2002:a05:6214:8090:b0:899:f3a9:19dc with SMTP id 6a1803df08f44-89a1998b809mr10047116d6.1.1772615968446;
        Wed, 04 Mar 2026 01:19:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae613ddsm716364666b.33.2026.03.04.01.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:19:27 -0800 (PST)
Message-ID: <e2fec324-c2fe-4055-82d9-f5c6aaef420e@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 10:19:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/15] hwspinlock: qcom: use new callback to initialize
 hwspinlock priv
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
 <20260303192600.7224-23-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303192600.7224-23-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4uegQ2wpt0JMgIQAc2_IvsRJE41zPfmZ
X-Proofpoint-GUID: 4uegQ2wpt0JMgIQAc2_IvsRJE41zPfmZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2OSBTYWx0ZWRfX/NlYziEYdd+L
 OK99NRwicUleEKHmctn9o9fC2LK/0pIdyXJHhnGVvDF2k5JxZb65AD5Olosid6rsCuue7ACql5/
 Ch1jOfrtmU6uUFpK8boZSKJ50WfRyuQFkCxsNCR5H8WlS0w5qwC3tKdj+QgkAhIJKvR6WZg7Grn
 jr6g0larv1rXcdmjOiEaDNkeeIH1PlXpgpRNzh2k3xFU1WFBIM8J7XIgk/LpvLWjuIKa/RHrxvi
 S8IowR/BYvKnlRd05tUC88JXT9+qONdTs40xo+U3O8FGE3zeRt/wIqbY84Zyl7f1oGSVcErs0W9
 DZKmfMFkyoATXM3IQELqQo99JecJj/eEEGrvw5+fPutK5sL2/s3euEH5t1dhLS0P0YA8Mc/m8np
 z5MsowwgckZf67ocMvhbWp+xjTb/ArvYsqjz8wH99Qb0dlF8PbAYTCrqQBCekDyOKn06t388BXU
 m09KgcKSv3Pu0G1FwOA==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a7f921 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=LDBv8-xUAAAA:8 a=EUspDBNiAAAA:8 a=7CJMOFuoybIo_9NlnXUA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040069
X-Rspamd-Queue-Id: 17BBE1FD7DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sang-engineering.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95275-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 8:25 PM, Wolfram Sang wrote:
> Apply the new helper to avoid using internal structures from the core.
> Remove superfluous setting of drvdata while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

