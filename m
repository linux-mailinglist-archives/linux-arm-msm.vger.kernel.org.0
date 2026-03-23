Return-Path: <linux-arm-msm+bounces-99184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Nz8C5gUwWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:23:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE70C2EFF48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50156305C8F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B216A3859EF;
	Mon, 23 Mar 2026 10:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hg27KDFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IdGJJo0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6488B386548
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260964; cv=none; b=CnkTBkZN3594Ws4R07W/qzcH5dXUf6BdXv4Gk6iQULrCLBVGcpgvUIh6Iz+vDCDo7E9kQVFCPpsbdUGyd9u+B4jFUMWYp4SjIoO52KFmJ+eYLxG640qUsM0UBTBBNMEJ7yeL4SDMwSGdp2edGig6+ekaPq5TD/q8Q2MxJsb6SCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260964; c=relaxed/simple;
	bh=RP9kbiStbAaSMyYIrcCiEtSP6rsJnA4F7DKHa10Z+tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Md1dQOM4JYxoEs49jbJHz+ZbF2Pr/NzQ2RbsqAWBzSe1Vulux8ccol7D+W2nSn228WL2yegcTSrvfsDiX1lk0QLNmcez84+M7LHhMw2hELU8et7QLgrC5hgUcu3b8s90eDedQ+h8pCAc3xU1MwUWbqLmlJQRO4g/qs7Mu3c83Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hg27KDFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IdGJJo0v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7LuA41195938
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CldQNe+X6Kjmz2tzxHTc7dGnn10yHs43fmu2U3rpvhI=; b=hg27KDFlo/ReQj4K
	aFDrLXKI/7Z7YbS73dOQ0lZtkUURj90XqvRepeXehYFz48uNao90eS/hZ/Fu/r/w
	Um5MxnW99HZ4x2QyC/aU7C3MohRNki4Waw0IVrrTzvcS5r98jcxAn44+GwSJIrwd
	aoRhJYIITOl41Ga7i1AL7vf1alQ8NbQ909UjyPSjzumjiGWLdDhW4KQY/U5b8pss
	85Hcm8/tz4F9AvD7cJUG/fT1j2/29MBy0FVdFe31yja8bn7ssxuLuDblmfjrev8/
	P4t4hO2m9ualflwipXaPy/sFkS6dFc+8eBv9k0XX4tPtfHO+ZZrX9pDDgKkN3wYd
	DJZt1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5vw4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:16:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2a1f123fso28087041cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774260962; x=1774865762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CldQNe+X6Kjmz2tzxHTc7dGnn10yHs43fmu2U3rpvhI=;
        b=IdGJJo0vl7M7d8Ta+Fj7G7Kl8nO4GN3yCBdVwOCceZEs6HvWBPAIRReKYeB0RxAo9r
         er+bvDT2GbqNRsRp/AoJmG85GoQ+6r5wSsYYC7HI2KSFnlIioO4Ft9A+q4JqFNqUG9tM
         mMFF7msBH+zzEn/Yd/eHyPYL1axDM6HuqQ60OlIQQ4FjeqbBZoDNmEeQ5O7s6CkQnIkE
         KqSs1s+yQ1+SFqJw2+fIBWgXciEAr/3h+z+bQ+wmYYME20cw5aV6ZoGFKNOotTgLy9lE
         xhofgtgkpZ0OgqH3/idm+QbhLj+kAruCBlRqIoC1IbvajdP587VaNcc9m3wBqiNChc7+
         lZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260962; x=1774865762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CldQNe+X6Kjmz2tzxHTc7dGnn10yHs43fmu2U3rpvhI=;
        b=UZ/veAM9X1BFb12BqS8SLmztTWAVppkpfwV3lZJKM+H6OdRxI2MfNbBNdypwkOFP/Y
         ydkI9jMic3iqbaDbJVeHH2bvlZu07vV4+kb1OXy5DZHSxti9GY8ySXtD1u6fX8PNFnkD
         fAekTswdIp2sYqwp2RI1ZdHg99yXK7k+1oZyEe2y1pVo0UVG1JsbT1JNzddT1Ln7pzif
         +SAF0pQVvepqjhFIzCZVDM+ROMHFH1NINajJg2xdW0EZIke3M7wzwkNmB4rRRGmyt4fP
         S1c5EduKYjrXqUPjwK+DIPtTZ5nWodVZPY56XyxySY4jYpHgbG0HXhDUMnDUKmglHVvf
         7uCQ==
X-Gm-Message-State: AOJu0YwMIlSfMG8GFDeSLsIkjCzb+ynfaXe6gRLwRdOrpnozK/LjZytb
	hSbP8vJSY1eiACzZqk7CbyJ+p2Z1ofcU79FLZ2/dXOyQWXZEnpMIyO8+YBi883++rYFCIz1Kq7v
	Iuj536jljyz86s+n4tSkAfIzi8Jt86KaRwYZY5D/qSDi/i/wFm6JgpGM4E/nzC/X0MxWu
X-Gm-Gg: ATEYQzxH0mpxKMrsd3I/7e1FdB4X9aoR95ivK0MeHNhE8ewM8QKk6YBsuNBPwAu/vu+
	mlzxvd8wLTb39Yk+Sq/AhsX0IEuFbSybl1jk8HU50jX+xLKSp1MQSTYrb0mrW3unBGgebCJEWuV
	2AZr8YMcOiJfJK7kL3cE/hR4ZeYlUBFl30XnqK+XH8JR5H5k6Q3bvszAyfUBkbfLTD5RFT+bCyD
	a7j4jfKicxlDj79iSNMJpuo3xoODUxhw+dvgBtd61ZuibrIMvaHo6PoS4xyy1nhM+xRlUR/ZDHQ
	QLCZkl538bbg5D8H849/nmSajdn/j8ZD6GdsElNalw0beq7TgS1X325bXB7Asmt5tXWmw2iNnpM
	/76q9mhpj5q8/VMyhGIevWIUFmTh86vFSe5FCepEQgPye69vuRvdI6/QYVFe9FqP5ckCaRXGzAy
	2ZoaA=
X-Received: by 2002:a05:622a:6788:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b50758e93mr44058501cf.9.1774260961679;
        Mon, 23 Mar 2026 03:16:01 -0700 (PDT)
X-Received: by 2002:a05:622a:6788:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b50758e93mr44058341cf.9.1774260961212;
        Mon, 23 Mar 2026 03:16:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398c140sm480569966b.63.2026.03.23.03.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:16:00 -0700 (PDT)
Message-ID: <c60f69c5-6087-4e1f-b69a-d5d4c5e9076b@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:15:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: qcom: ocmem: make the core clock optional
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
 <20260323-ocmem-v1-1-ad9bcae44763@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-ocmem-v1-1-ad9bcae44763@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c112e2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bWCegLrQXfSoFori708A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3OSBTYWx0ZWRfX95KbpbgplI0T
 Y7MOinZGMAOrmTAiuD3QM9CesCT5zM3yMFBRKVQ+QY4rpltVbxE5mAKrTn1aUSUf/vcf+KDzBBX
 /JsDfSEtdus6mAkduUQiXquc103nd7MhXKY1cDVEXRcInEazKnOPoeb+aBqgyYDT3TaxxMK4uOc
 RVtTEWTJfAk694L+7NLxnh9R1lWdytGa+kYAUQUKtqcVWWL/2uo9hzvwODY4gS09nGoQ/3DsGll
 wDddViyofIEyTfP/3fEsMPNTlcylY+q3lAGJz4mKTJpCUxthz0uQgTiulMe8YDkV0k1QFIkJ59h
 gBq+3nodb89eVIGtbxx4yCAz3/3DvcqRdiuw8A5DvdsmZL7lmJ1qrCv0QjUeTONBk0zVFfeflQi
 0BkgzY4UMkpoqtuTn0uGC9mdlmdQ2oy/wvySOioPcrWQ2F3g+tLE6oGTmZm6hevZD3sY2XvrprM
 LeaVFAaYwGpZaSuX+iw==
X-Proofpoint-ORIG-GUID: ok-xEd_SBpxvPwJxw1fLD6DQTcX-WLbF
X-Proofpoint-GUID: ok-xEd_SBpxvPwJxw1fLD6DQTcX-WLbF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99184-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE70C2EFF48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 2:20 AM, Dmitry Baryshkov wrote:
> OCMEM's core clock (aka RPM bus 2 clock) is being handled internally by
> the interconnect driver. Corresponding clock has been dropped from the
> SMD RPM clock driver. The users of the ocmem will vote on the ocmemnoc
> interconnect paths, making sure that ocmem is on. Make the clock
> optional, keeping it for compatibility with older DT.
> 
> Fixes: d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out interconnect bus clocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

