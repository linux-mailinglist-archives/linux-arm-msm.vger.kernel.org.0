Return-Path: <linux-arm-msm+bounces-106086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK5vLpQH+2mbVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:19:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 420B24D87FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AD69302796A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 09:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775643DB655;
	Wed,  6 May 2026 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8J9P/cn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5ayhc/U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EEA36EA86
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778058952; cv=none; b=OAOzyCCaWXn//vkqzW7E96K2zTBWcGp/8VyAHb1Bdey8wxnTgn6dDN1jBjS/Kx/MAD5MKVOXgz/Qo3KENxwJN7sKr+7am/hW6C2X/P3U20HWn4s3orwogJfJ5nKgERnAkWEYizR/ib9bQSghWMlcMAB2PbJcp1isxpsfM2BsOVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778058952; c=relaxed/simple;
	bh=R1VTK1OenYLQANLJ9pOLnRCk2qBsb/zjhelLvvj6tnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGc2d421NU0JUXHd2s4vQ4twDccMf5OENl1ML4vK/5AlMmAafr1pC2ma60e8OP7XYCX3bDpbZNwcoG5T3tuIF4IZyQ76wXa9yMs9ZmCDPcPWKb+SWRsR2Mq9JwSe3YidGTfU/tbpOlvEGmTtfGkc2hPo9m+YQwU8s1Ur7vXs8I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8J9P/cn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5ayhc/U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6468Zr8O442581
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 09:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRUBvLbwxgleTjfqDHxt9FzjXUjxTlhfB1y5akMaqTk=; b=I8J9P/cnmTS9O5PP
	XV6WLRnB1XFDyG7zt5Ph+E0nZhhh2vHgFSiYkzJSEiTWuUnhQzpKyNfAb7hzfHii
	1xQLR62my+DOIPtm4diSwM1OpGiHNnR9DiujbFJ9J+6QIAOaPMzobsyKORDkT22c
	9zeV9dewYOA57kUkGv55rQ1+Ce4hqQ1GSaQQfMuRif9ug0QNEUPTE5MgJQEqMY9b
	JlozKTQJnkABG4orrhVA2bEXXSxFP+RkYF+lcgNiUPF/kVGN/DgxM9FuGyzkxNtb
	G52F+9xuifJQIVrJO2DgB8vbbfww/b83A5DWBpMSLIMsJ5u44+/aqd/2wG2rsy9R
	fcK8xg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299g5hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:15:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eab57f0e8bso181250485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 02:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778058949; x=1778663749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRUBvLbwxgleTjfqDHxt9FzjXUjxTlhfB1y5akMaqTk=;
        b=L5ayhc/UAwlFi1nNhNzqU5DYH/6p5fKkRD96M2LQYS2sqfjYpLGJkPuSYQ4vzwnOiN
         SYORFEXMvFJfd/o+FY/xYwTC5KThQvK1cSFVuN+D85mD2ymP4HVN1FrtzkXLOVwa9yzj
         wyWPryLfxbuPuqKfCX1oK3j5GkXydUqbwvpHHkDBRmv+0HF9Hj/7rlO2JNw5dmxzeM9Q
         7TTXhwWJVeAvmieaCRHQuiPPuCPpNrWYfTzsFuVS+Too0ophgg+pb/qE71n9aDKwpMtZ
         BftZAzgSNdSrQgCW80Iq06dav/VbK9tJ+iDbyblpbGfI3HLoatFE0FnEGZ2uKr4Nh0YN
         bR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778058949; x=1778663749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRUBvLbwxgleTjfqDHxt9FzjXUjxTlhfB1y5akMaqTk=;
        b=Ka1Av5XTDB7aDTtJub1SP6hB0AVuyOh8XGfMohw+mhXBOteYAgjT3fWMwTIRktpP8e
         tr9otU2jKBt0F8xja/YQzDZL0u8T3Q3+z4LYmGiRQF0nmbm9+aaGpweJcjQeT3iZgWmm
         yFXUXlaUv70cQPXLoLgP2S2UlC9MxXFviNlqko2Ikc41YG6ZmiWlDsEYEqyqnchFXt5f
         td7wfiUXcEg7MykSzaVJeEFeMR35dI5HQa91hykLnSUYETldkT3fP/lL1PL6F7eA5tYj
         LMAjsUb3e9IYGz/pu9kDuBCL/1858jK5f+GusWM0ZaXpJeiaaEIFPa8X8kIRCuFYlBO+
         cDSA==
X-Forwarded-Encrypted: i=1; AFNElJ9VVlTRTFoQBUHTLnzthETdPQc2msQ0fz1fvf3fVp0Siz9C2ARMO+Bqw5B52rtpwp1E6l9P93XgRJ2YTchH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ttPvLjW01WEOTy5OSwUCHwKZfTxq9/PSFWxzoW4nHqut3fTs
	dufAmaFNnGRkL3XiGE9gdzMC2nU5sGyi5R2BWF6uLmRmzzsns1xZNvzByxfAAy3xBYIj6JELnBD
	suJbnfsD/j83Oa/9O4ChxINBQlJTMPV37Fg+P4X7kGALpIJGf0MsbMUBOLaX/N7PWSvbc
X-Gm-Gg: AeBDietWaiRv3u/0/qnpDVMbGTMliyB2AvN5Ktqo9OWm5N6lMNQmeHAykLsKyr32yie
	TzNcu/Akq7iojpbbyAofBQoKAzXk/kp7yU8e1+eQc72yWDRmuXrpyoXfiSlgWZDF9AOacfrQMNq
	AgjPMris4dw/cKXrEG5KFnhNAehSO8JZa3KUeSGiQQl9wuxBm9IY0trHatE3QUdBmx2p57Qagka
	KEHGMML+BeJNQGSsW3Vk9ATc3pFXxypNoquYcc6kb13Al1Io1nilrBlVFNgCi/cJyO0CfwoOmmx
	C0XaK8z+G9gKPywmP+TtlAIQA/eCCby8Mb+dKfoviqhVZiSy3gcVb0yFB4DsaWfYfUKh6vH6omE
	zNFXWJDH2JhWS3AWpOzdyw3Wztejqi44TX/PZUYpLylVk/3ckWcTn0BM99SOM5SJx/J1XT1e2hU
	TT1ojcBvvJi3WVmA==
X-Received: by 2002:a05:620a:458f:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-904d10837bamr267956885a.0.1778058949494;
        Wed, 06 May 2026 02:15:49 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-904d10837bamr267954685a.0.1778058948898;
        Wed, 06 May 2026 02:15:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd91a4708sm1098481a12.14.2026.05.06.02.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:15:48 -0700 (PDT)
Message-ID: <3a4256b3-785a-4841-bd81-980cf4762d72@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:15:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm6350: Add interconnects for GPU,
 MPSS & CDSP
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
 <20260505-sm6350-misc-v1-1-0b9efc22690c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-sm6350-misc-v1-1-0b9efc22690c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb06c6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: NJE-C-szq8sgZWyGJozmGKwz4DwXfgsI
X-Proofpoint-GUID: NJE-C-szq8sgZWyGJozmGKwz4DwXfgsI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MCBTYWx0ZWRfX54wq0/M66g4l
 /xvPA5TUsvZ4q4aNSZlI46XPqeei+OG9mPM3be+Zkvw50Fg4muPTAEAfUTNSL2E9SN/MrW6wx+X
 Q3jgUEq1W+vqVkutdmvNMOkQMrG4Ltk7P3zuHT+OzdOQunpyGF/76Wi+BvW9vfA3w0tfEPRZwhe
 3cjMMuYKbyQqAVXQlm5Y4Ac/qt+kFJ2G2LE0uIq5hKPCbGJlBVCPRrduua5u7KYEpT7wt4gmFPg
 77bTZed66IVf3hkR6M/ZX3fsMqk39dR+jSkWIrfGZg79Q28X66VyCvtACDAHwhtxf25V1ozCX+S
 kRR4naBiAbCzaboGPdjua2uO7ndFjEfKrF5AnNKBliewC3hZ3MWhdDSAIvxhmZ3hf/ycB1eECCc
 CVJYP5mcTlhK+njgvHCOAOOT9hkWDPxiYjspFCVBBvrltvfwfSgtI+e4MwgY9rZZX4dlmiBUYhN
 PJkCmszRJAivU+lDL4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060090
X-Rspamd-Queue-Id: 420B24D87FB
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106086-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/5/26 5:08 PM, Luca Weiss wrote:
> Add some interconnect paths for the GPU, the MPSS (modem) and CDSP.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

