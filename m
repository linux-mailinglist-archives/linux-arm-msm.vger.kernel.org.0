Return-Path: <linux-arm-msm+bounces-109309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOQHO2lJEGpkVwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:17:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 671E55B3BDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D4DA308EDAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B188E37BE8A;
	Fri, 22 May 2026 12:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHghqaDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tx3h/y4Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431773806DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451995; cv=none; b=ihVC+oSAUPDw6eNBpYEZWdZYHfMyVTl/Z4BYbkyBBokVMDduLCC6k6cuTAyijHRWRdAkVpoMMEE9Gqg93zo5LRTX0Ors2AgFzlTzUdpbCYM0TkV7Kvw3iXU9R/wv14/YMpej3502W0nA3gVTDOAZUI/RDED7C5yh5wshbt0x9QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451995; c=relaxed/simple;
	bh=dsFCDXR6KfRqwQ/1dEbG5yHBbEaQjAaKEfASudO2kzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQiO2kxPTvQ+HANs5z5DczIa4o3mRIuCmQZDtkhBRPkuvfQSVFLR7/8aEPnDq9W671hiocb4UsESwdq2FEcfToW5Mb5DW4uQIqnPVL7oatpZ03N0iSIgmtTLcx55YIxJTy9qk7tXtvvclsIUQUHSVXej1j0NZPQcKWGMOMH/Afs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHghqaDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tx3h/y4Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MAIqI11800960
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxMK/paVn1ngW6KHoUEHILSkmmr1MWqnQJ3Uf0bYrz8=; b=eHghqaDNzay+elpc
	kIzOfma9K1chVowFizfBShC6YMxRItbLGZlx7ZLvqZqY3LHT3DqRvKAMEUn0NhKw
	lQOsO14gb7YttV71il0/J+FnyHSmT3yDh8u1Q01PVYgwVSPkvfH6NGoW80Ku/tHj
	cSh+6EfRxx7LiO1t/voE0eYi/esFdSUna4mSY6nz1bUlQ7zOFruRz4UOD8CJiCYk
	mvJ8Uxpn9A2RF9asxV/416WAymPg4AhNF/94cVWlu/xVYH+cbygLyuGn0J7FAoY6
	oiTkNbojtQ1HlfdIFCwKBZFlVvph3pn6SwT2KtfA74JegP0tpZA1n1AZz5uwnc4y
	0Hlf3w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g0c1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:13:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9f1bccd7so17768281cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451992; x=1780056792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxMK/paVn1ngW6KHoUEHILSkmmr1MWqnQJ3Uf0bYrz8=;
        b=Tx3h/y4Yk6yqZ4bgRaU/BZBj9DE7K8AFGtp0RW82ogHOGQfEA9Bp0vLLRrZ8xF3fuA
         mIg76cpn+d6WMbz1OwXxI76fmgBJc2OXbQcmLoFyBVBaatqAcxx3bh39yQjYZzo1xIb7
         YBRP16a8gorOrvKjh+jgfqwxCQis0ecrh8FjEetkcyZNdBvEvgZH7Ght8SMI61vRjmnP
         4PdD+A5HWEK/QNM87DH7DeWnZ/soCK2o4D63nYjEtrAzY9EfbBcmSI0UzHEm8xsiliYa
         HcUH3NgD3qP1xe2vAM0NnJZ/OmgBN83vQYTxYptslVfzDY04E9chjrjjfH4Kv/QTlDB6
         nQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451992; x=1780056792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxMK/paVn1ngW6KHoUEHILSkmmr1MWqnQJ3Uf0bYrz8=;
        b=p5XTQ16UBcr/0JdT+cjv04e5KQe+vU6oZizZNqkCenRyUun0mYYxZAsKYEFRld6kln
         kUd/unIt/AljVQ2fN9Nl/RY10rqsruD9fBSgSAAepNtHtFzXFKZG9orfGpWFS166x0VT
         EcMWMVSUP6OfKtwfeFGO2P0VfW83EajfRg4gtiymXIHtBDVwET42On+8b0Hpv9+5Ov3o
         U+UW5oxxGHPh5HITU+d3vMmmtJ8q5vi0KompmOZdKraYzTImklZ3AuvIy8ICavFATJcK
         c8N//FoHiZK8A/udET+7k7OQMUsT/1OnZrTXiOd6maczx7qNNpaUgpU30+ZctMr3b8ZO
         PlUg==
X-Forwarded-Encrypted: i=1; AFNElJ/OCN1zwVRe63MBuIVsOUNJyS+v1PSdgXv78HV1e0yOSbJeU6EIJx5Ad3X8mpjhZ11zmYK3S9WfHXFJrVGF@vger.kernel.org
X-Gm-Message-State: AOJu0YwsEujqlB1jTezxpAgcs0dEKgB6r01fheTWv3TJPABKTTLd6qWg
	k5vPy337Jbvo0Np7Yp5/OLggFr67WZ6zzZuJ5rF2EN8HP5Ka2PeCt/cohX3md4HOTQSrVUMv/vm
	dPsqSjDXjufoSTBCMa2pDxCnTHSLAFsgtAOGyIrvRMqxT6j1fPOKqjoImKbPbidW5FUBM
X-Gm-Gg: Acq92OHp29bhssOtLNfwRxTgUF+mCUUTnE3MOQVhRLOtAWMiBbwXNfOZNMsHF+6Nh0x
	+GxbyZbDzcfqCpJbX6t+1IZs/EPlOM8F+55CjppQx2+RrU/7vyQKDzrz7yNr14ti6seQ5+vNw2U
	Ou89iFUVwn6kmbdNGTHNqm1wZYKASwkEY5v37CWmPEiY9vux6ZkW1Lq/aHk+iVAorTtWLAVcGqf
	TCO6xnocNmXyxtfjFbXAxeQrRBJoj8iMl12+hqVWCkhU7pUEUjb19EjWmGanH1LVi6+ag7BkJLh
	SU+FYs5qHHvvZqFEpLaxiumoH5XFnJ8zsQDGGLrBcL6kuyX+fpyu9U5IpyS/Uh0PZBZYc8SIZ2S
	/e7SQvqFCG0oyNWm9ex7E8gvobLvZ4gC3a2P1eAxAVysxLA==
X-Received: by 2002:a05:622a:a903:b0:509:e68:22cb with SMTP id d75a77b69052e-516d439424amr24955331cf.5.1779451992463;
        Fri, 22 May 2026 05:13:12 -0700 (PDT)
X-Received: by 2002:a05:622a:a903:b0:509:e68:22cb with SMTP id d75a77b69052e-516d439424amr24954851cf.5.1779451991851;
        Fri, 22 May 2026 05:13:11 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ecedf2sm48860766b.37.2026.05.22.05.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:13:11 -0700 (PDT)
Message-ID: <db13f51a-98d5-4793-9c7d-3edccc3a603c@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:13:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
 <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
 <fd67b063-a986-4d34-99e6-fe55e72d0187@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fd67b063-a986-4d34-99e6-fe55e72d0187@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HR7ATs80OUvY4M1SWyqwpglIH1BE8AFh
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a104859 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pC2wnO6ryxLTosdQjxEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: HR7ATs80OUvY4M1SWyqwpglIH1BE8AFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMiBTYWx0ZWRfX/M0uaRj09T1o
 8Kyaec7jFO646mxbi3kly5oKRJZwVOLYDMNlAwHFUxyq5++vNaOOr/KoIOX8TngZpXi61LEkLW1
 GGm/cUnN8gAkz8r20lLNQw7w9CcpbcBbWXDwQs7TsUc2FfEXWNP2uJFTjIS8uHiBVtZrfy4zi3B
 rZ8lgCgg/r4E7QOt6YgxO59++8RZfWsX3bX93n8J0t3Cz1D5XX9u1vryRQ5rxEg0ob1kzunHAgC
 t/0SuUUw176VghUAISkQXRWX3xC6rutx9ZyLO5EPrlSFk+vPj6zhJxpiE3scKzOgeWlOaErYhsi
 FvWdhpTymE4Jofvi43JTLEyguSBDNdujXKaggMIxRNlqnexs1gHs2YktMDAGPgJ7Jq06eg0uO6E
 qdIX59A5ZL3tFxrZb2sepCYAG8f4CNZqgzbjBGBWA1d0RH3vn27PatH8JAlYylE/4drzhWIFYqO
 3nN16Mw8DBkDD7fYD5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220122
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-109309-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 671E55B3BDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 5:03 PM, Komal Bajaj wrote:
> On 5/14/2026 12:48 AM, Dmitry Baryshkov wrote:
>> On Thu, May 14, 2026 at 12:17:31AM +0530, Komal Bajaj wrote:
>>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>
>>> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
>>> for the Qualcomm Shikra SoC.
>>>
>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>> ---

[...]

> Ack, I'll address it in next revision.
> 
>> point you can use sc8180x_mpss_resource instead.
> 
> minidump_id is required for Shikra. (decrypt_shutdown is not applicable and will be removed in the next revision.)
> For minidump_id, we still need to use shikra_mpss_resource instead of sc8180x_mpss_resource. <?>

Is there a chance the same ID would be applicable to 8180 as well,
just that we missed it in the past?

Konrad

