Return-Path: <linux-arm-msm+bounces-102404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPYmKGQm12lILAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 06:09:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7C53C6253
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 06:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72DCA301AB97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 04:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DB126B756;
	Thu,  9 Apr 2026 04:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGLjg1wO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FOKKvOYe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6544A243367
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 04:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775707745; cv=none; b=henNN605QnDDy+vvjoHpYaAN/e+WBgo/tfR+27jT+iTjuAPGdAiN2BTMiNzyUW+PDUQD54NsXDg8c8L/bpUYYpcRkhuGPhQDlRnjsp6TH4m2okA3pJpp3IaSKpFn39STzINxh9itGP5ojDPStAlpOmSHX+x+Q9+s3jNElLylfAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775707745; c=relaxed/simple;
	bh=ZSf5xO+BLsbBoBd0FQBbT7p9kYdgQNM6EbBkzvXqI28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLfysHEhAzDupsWYatbrtUMblCaDYxnGLxaw6ND75zoVX3Yw6i3qGoJ3Rptbvj4SnxjW56X3cGLsr8qjIJFvJg+fCPmRh7bRkEN+aISTzk1pFckAnvl0BAaqdP2u7Y3qFC71LxB34zyiRrHjcO6rTjAZAshyIdQflN9KBeiPekI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGLjg1wO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FOKKvOYe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638Nkjcs3781232
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 04:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rTNoDrtKSCQdYNXgupm04bBF1BRz+e09UGrEYCktWOY=; b=jGLjg1wOmB47h/ZL
	arsvpH3/jfQCZDeSzGhOeDhrS/VA24QP3Z3DJIIdFxjvYDeGWpO8e1VxYGpCTGVh
	P5xnvDuLd9Ib//go6jqIoVmp/YVKfQ6RZ4wAw+/GPyP+XwXnex8cz5ZIaBABNrKa
	vWHGKuhhaHfEt5zQqHm53c3J2pMCzbPdyxTujSapp8VyCyXuQEk28qISmfC+SxsC
	Sif+h9O+SNk5Q7TWbT1OK96NuPn4kdTltrd7X+bikHBJ00StOxqoakhY/MN8PlEy
	k/pUIDsHW79cWGMkwbmGSBt6J8uwUHVmRzYKP94KWIg8Ve917gYD/bgGd6+XGbx3
	xP6eeg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt6ya9rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 04:09:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76b69fb9d6so341658a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 21:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775707743; x=1776312543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rTNoDrtKSCQdYNXgupm04bBF1BRz+e09UGrEYCktWOY=;
        b=FOKKvOYeKo/SwaO5AK1qZmYbK5BAXD6iZ5+9erhlxFl6bQTvUWqyQLXbQq6CI2nO5k
         FiMXg7DUSBXr1v6xW8BBzVxphapo/zeLDl8iHolOHNkLGIJPQXsEQbOXfrkQ2vL5xDlx
         mlumKpQQNIhjP7eh98sUPd8/kShU+jdicXL2kKPwMSMcmpuSz8jZzul1O32lx18hPwu2
         IK7TuLbCpQLahmEh++lnLdeitlJ6hq2ih+TkEEqJapI2+F2dKHkx6aAZ35E3h8gGiXiA
         vblsnByZk5zfUMhO1K+c5+iyx7lsSJl5bdvfynbhhDM+JNT8zad9qWPQco6Sx+OicA0t
         VXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775707743; x=1776312543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTNoDrtKSCQdYNXgupm04bBF1BRz+e09UGrEYCktWOY=;
        b=V/iGNWUXXIp7cIau0oBuQyqzQ1w8a59ZUNV9Xn8/nzbu5OBz6o+4AWF3bHomsXuTve
         oIO0TBgVkB1gzNpjm5deOZKXD2xR1/zwgGeBmjfROLEzpMrx/jh3ygxf11JRZysi1etC
         SG3ucepEWeHX+0T71Or6P0glZaunQ02zfJt4z4mMWaX6H4OqGPzNSiqM2gYRPlZycTfO
         6frj4WYi3uv91yNZL5sv+XKUOjMAkG4ScoMieOqBfXQRCTHw6pjnGJjNAcEtawwnCp2N
         KolsawD0zuvVapk+982siIscIqw5j/jxGNCbJf6SFvKzKUSVUy0sZhl4j5xcSE8tOc7z
         VPiw==
X-Gm-Message-State: AOJu0YzjT/pdWNy1qLDP47ohGIV2tu2/IxUZFMgJHkBaQRNMoKJaUTGt
	nYH/9mReNPhp7/f342nDZppAaLH2iG3cEz6UxB+h4RiSPOvXNbNSN6VtL5OoMg5UHoaZW1E03Xr
	pzwaWIuzAeQVfTeNocjvoq7M/4eKHRo6uR+KVlvTXJb/9BjL4xJVElDzt8UBxYlKZfwVt
X-Gm-Gg: AeBDieviHXt9iUldq1RSZQXPOFPP3ycYu0g2KbdMaH/sOYTGMUic0zXY6kRzu4nmieh
	NSb6OrJPl0equ2SE588Z7u64yS2INf+AApIV9PPS/CftTr6wQ1TNNehk4RR7YkaPWYUghWUlF+E
	Fi9PEUPYaM/3NYdU/vR1h21lvZP65ek2eBpubacTKZpeKGCvhOuX/318L85DAQw5BQq0ItWliOO
	arMXmW77hUFZSwvL/vRDbB/jBViWHWLMoiaC5MlWENRjYlovaCLGFOfXY0ho031KxcBjzqPACiG
	Inm1O5XNsk3tV5xURhS6C+OYgl9/rv7SITMefdQ+ZneLupX+mk3FJPA91frVSRzindtgLCUvFGf
	pXFlS5XvrYeJWyTWqHPPKdzC+3L8joUsGyj1qJF3uh+a2gxzNUbrX
X-Received: by 2002:a05:6a20:7d9b:b0:39b:e3aa:df2d with SMTP id adf61e73a8af0-39fc928ecbemr1917818637.7.1775707742948;
        Wed, 08 Apr 2026 21:09:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9b:b0:39b:e3aa:df2d with SMTP id adf61e73a8af0-39fc928ecbemr1917788637.7.1775707742497;
        Wed, 08 Apr 2026 21:09:02 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6561fe9sm19461122a12.15.2026.04.08.21.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 21:09:01 -0700 (PDT)
Message-ID: <f450b6c9-e577-4d4a-9d01-c331efa8bac5@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 09:38:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add QCE crypto
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
 <20260407-crypto-qcom-eliza-v1-2-40f61a1454a2@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260407-crypto-qcom-eliza-v1-2-40f61a1454a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2NosVpe7l-69SR1jiFUnEHHQ8zPB38Xl
X-Proofpoint-GUID: 2NosVpe7l-69SR1jiFUnEHHQ8zPB38Xl
X-Authority-Analysis: v=2.4 cv=R9sz39RX c=1 sm=1 tr=0 ts=69d7265f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9nldhgvQxnsrbX0ZkhUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAzNCBTYWx0ZWRfX2EioVcfEd0zP
 7hs2Mi8N2+b8ncfVFc6dbEi2DfertU3AYkmfWLONIz/Q2qPN1N90HfhZE04OP/RdWyNbt5wuGpZ
 jabwX4gRcMjDMVcuWg+JZyiAuGhGyy3Fptu7riUYGqlUp+/TQ//lus4l/AexDXUgq1B0d/xbosz
 8gBYr7tLwCp0vLjh55w2vWF8wAgKutZ00cf4Qn7T25pQrZBOomJ72QLQ3tjyBuRbP7au4CnT/iU
 /rKqykzo5aXooDk7WK8Z+9hqrFLG2ESkSGIO6JJIKZerFnagP4XZenMEXDzlC3+jB5ju41mGlAH
 Rh5Ix4Asv58Z9g4gW1xjBeXJwyHLMiezdzDC5vjXZ92+ca0X62hy66266u1bczuJzPZ7IS+ELk7
 vyai6cTMhlWZqWUKLyHePzuOOEJV9/DOipjGKDvrz9AkWwJAtQPPITKNWKKwWOaP1bRrfGRbkBM
 G/bL0BfCSCMGUo1J01A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090034
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102404-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF7C53C6253
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/2026 7:21 PM, Krzysztof Kozlowski wrote:
> Add nodes for the BAM DAM and QCE crypto engine.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


